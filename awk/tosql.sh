#! /bin/bash

if [ $# -ne 1 ];then
	echo "please input filename"
	exit
fi

FILENAME=$1

cat $FILENAME | awk -v tablename="$FILENAME" -F '\\|\\|\\|' '{printf("insert into %s values (",tablename);for(i=1;i<NF;i++) printf("'\''%s'\'', ",$i);printf("'\''''"$i"'\'');\n")}' >$FILENAME.sql
