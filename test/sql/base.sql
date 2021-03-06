\set ECHO 0
BEGIN;
\i sql/shard_manager.sql
\set ECHO all

-- You should write your tests

SELECT shard_manager('foo', 'bar');

SELECT 'foo' #? 'bar' AS arrowop;

CREATE TABLE ab (
    a_field shard_manager
);

INSERT INTO ab VALUES('foo' #? 'bar');
SELECT (a_field).a, (a_field).b FROM ab;

SELECT (shard_manager('foo', 'bar')).a;
SELECT (shard_manager('foo', 'bar')).b;

SELECT ('foo' #? 'bar').a;
SELECT ('foo' #? 'bar').b;

ROLLBACK;
