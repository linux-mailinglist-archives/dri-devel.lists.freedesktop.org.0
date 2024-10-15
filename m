Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833A399F5BE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C515F10E5EB;
	Tue, 15 Oct 2024 18:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sMoqDwwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40EA10E5EB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:38:45 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-e28ef71f0d8so9200534276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729017525; x=1729622325;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=elVcyqBRot1hWy/7wsiTZrHkBjkpf9b46nIr70Zlz4E=;
 b=sMoqDwwtnT+uL/w73h0wSEI1/gu+shym9ZuoD/EWpA0dogIfUXIUUY5zqN9FhGZZUQ
 yGWoCbn00bqU6OCGse3pEHU13yGpfCF44gJLxvWSfitrB2GlHkgHXbk7xGq4Y0HTLpoa
 jY1sXb2AmlQ2EJldPyjfdGLPueRKH9qof8xBcveNYL5vjPuPiAl6DHHkDIzFCuzc9n3a
 KcazI3laHqWlAfhIXBmvhS1hwZIA5C1qoPWjSinLorBjH6GyO810BILs4M78aI7n2t8k
 e/9KdTe83wMFHn0lhMGjWHjBx0UkOMKvL+W0OqWuKj3bpy0mpb7ihuxrOHWeSw2/xO6s
 N23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729017525; x=1729622325;
 h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=elVcyqBRot1hWy/7wsiTZrHkBjkpf9b46nIr70Zlz4E=;
 b=iB6WBRvt0iTWQ3TJi0lg/32QBKe1LcAq8LZCeefyZ7GfB877nxOBbMlcdaHI0AAGRl
 uGNSE1qfGll1mltDuu7w9R9jPZFj5140+/wRvyzBMwyy71TqbLgzgeCfQ2jRet0gt+5F
 J4JkXydwLklPPPiekt//qK3HT9JrZ2gDSYSV/PQpo/QG1YAxQOX/BEyj0oZJhk6QaOsf
 LiYLCpVZv0aeajcUZiHzFuMl4LzaDAzU6E50Bih+s5jWE0AWAadNOEu4FFQFLtfAvjVs
 9Ld2rlH863cyUZjvhkYAG5ojz97UARoooaxucOIoFrTZJ3WvBWhUyzZPIPhWS9tLEq+r
 TfuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeCcm2PMwv0WfNveLCADoFntJ+n+KaCokpRLH8KsDZMW7PVVSYy8G/seofRfYHHp7jbQtHaIcjPWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzQl+Am5mI0642naBZ0H7n/KF7BOYabs/VET8WMugpFKrb6gAi
 oX2aPzR/kP7RqUvq73FmOJkxEv2fRihexTv2TXdM6krcvDwJhMMcLqSYJ1qAXQqhI7NwmR9vv5L
 GZSmwZw==
X-Google-Smtp-Source: AGHT+IEyK7rc0w1b7082t7PmrW0ZPtserOhvsOb+4IAJFUB6ZgGx9hjsurpK767oQk9+ppFpQnIWnoXlh8wl
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a25:9702:0:b0:e28:e510:6ab1 with SMTP id
 3f1490d57ef6-e297857f673mr582276.8.1729017524932; Tue, 15 Oct 2024 11:38:44
 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:38:22 -0700
Message-Id: <20241015183824.1014964-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v1 1/3] proc_pid_fdinfo.5: Reduce indent for most of the page
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When /proc/pid/fdinfo was part of proc.5 man page the indentation made
sense. As a standalone man page the indentation doesn't need to be so
far over to the right.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 50 +++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 1e23bbe02..0c4950d5d 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -8,8 +8,9 @@
 .SH NAME
 /proc/pid/fdinfo/ \- information about file descriptors
 .SH DESCRIPTION
-.TP
+.TP 0
 .IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
+.P
 This is a subdirectory containing one entry for each file which the
 process has open, named by its file descriptor.
 The files in this directory are readable only by the owner of the process.
@@ -17,9 +18,9 @@ The contents of each file can be read to obtain information
 about the corresponding file descriptor.
 The content depends on the type of file referred to by the
 corresponding file descriptor.
-.IP
+.P
 For regular files and directories, we see something like:
-.IP
+.P
 .in +4n
 .EX
 .RB "$" " cat /proc/12015/fdinfo/4"
@@ -28,7 +29,7 @@ flags:  01002002
 mnt_id: 21
 .EE
 .in
-.IP
+.P
 The fields are as follows:
 .RS
 .TP
@@ -51,7 +52,6 @@ this field incorrectly displayed the setting of
 at the time the file was opened,
 rather than the current setting of the close-on-exec flag.
 .TP
-.I
 .I mnt_id
 This field, present since Linux 3.15,
 .\" commit 49d063cb353265c3af701bab215ac438ca7df36d
@@ -59,13 +59,13 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
-.IP
+.P
 For eventfd file descriptors (see
 .BR eventfd (2)),
 we see (since Linux 3.8)
 .\" commit cbac5542d48127b546a23d816380a7926eee1c25
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -74,16 +74,16 @@ mnt_id:	10
 eventfd\-count:               40
 .EE
 .in
-.IP
+.P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
-.IP
+.P
 For epoll file descriptors (see
 .BR epoll (7)),
 we see (since Linux 3.8)
 .\" commit 138d22b58696c506799f8de759804083ff9effae
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -93,7 +93,7 @@ tfd:        9 events:       19 data: 74253d2500000009
 tfd:        7 events:       19 data: 74253d2500000007
 .EE
 .in
-.IP
+.P
 Each of the lines beginning
 .I tfd
 describes one of the file descriptors being monitored via
@@ -110,13 +110,13 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
-.IP
+.P
 For signalfd file descriptors (see
 .BR signalfd (2)),
 we see (since Linux 3.8)
 .\" commit 138d22b58696c506799f8de759804083ff9effae
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -125,7 +125,7 @@ mnt_id:	10
 sigmask:	0000000000000006
 .EE
 .in
-.IP
+.P
 .I sigmask
 is the hexadecimal mask of signals that are accepted via this
 signalfd file descriptor.
@@ -135,12 +135,12 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
-.IP
+.P
 For inotify file descriptors (see
 .BR inotify (7)),
 we see (since Linux 3.8)
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -150,7 +150,7 @@ inotify wd:2 ino:7ef82a sdev:800001 mask:800afff ignored_mask:0 fhandle\-bytes:8
 inotify wd:1 ino:192627 sdev:800001 mask:800afff ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:27261900802dfd73
 .EE
 .in
-.IP
+.P
 Each of the lines beginning with "inotify" displays information about
 one file or directory that is being monitored.
 The fields in this line are as follows:
@@ -168,19 +168,19 @@ The ID of the device where the target file resides (in hexadecimal).
 .I mask
 The mask of events being monitored for the target file (in hexadecimal).
 .RE
-.IP
+.P
 If the kernel was built with exportfs support, the path to the target
 file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-bytes ,
 .IR fhandle\-type ,
 and
 .IR f_handle .
-.IP
+.P
 For fanotify file descriptors (see
 .BR fanotify (7)),
 we see (since Linux 3.8)
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:	0
@@ -190,7 +190,7 @@ fanotify flags:0 event\-flags:88002
 fanotify ino:19264f sdev:800001 mflags:0 mask:1 ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:4f261900a82dfd73
 .EE
 .in
-.IP
+.P
 The fourth line displays information defined when the fanotify group
 was created via
 .BR fanotify_init (2):
@@ -210,7 +210,7 @@ argument given to
 .BR fanotify_init (2)
 (expressed in hexadecimal).
 .RE
-.IP
+.P
 Each additional line shown in the file contains information
 about one of the marks in the fanotify group.
 Most of these fields are as for inotify, except:
@@ -228,16 +228,16 @@ The events mask for this mark
 The mask of events that are ignored for this mark
 (expressed in hexadecimal).
 .RE
-.IP
+.P
 For details on these fields, see
 .BR fanotify_mark (2).
-.IP
+.P
 For timerfd file descriptors (see
 .BR timerfd (2)),
 we see (since Linux 3.17)
 .\" commit af9c4957cf212ad9cf0bee34c95cb11de5426e85
 the following fields:
-.IP
+.P
 .in +4n
 .EX
 pos:    0
-- 
2.47.0.rc1.288.g06298d1525-goog

