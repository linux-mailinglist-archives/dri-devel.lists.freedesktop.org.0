Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A5924A50
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771C310E6CF;
	Tue,  2 Jul 2024 21:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O0pkIUvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F1A10E6CD;
 Tue,  2 Jul 2024 21:58:28 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7f3d59ff826so173089839f.3; 
 Tue, 02 Jul 2024 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957507; x=1720562307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rzL7Ai7iKqeKJnszxdFQBmj3pbR9EFBsW0IKIFtNrQ=;
 b=O0pkIUvyKktYDDAnC7RG+r/06STxnyyNpKwKWJQyg2m8Qb5QLz4SLjN1azz+9y4N/6
 urslR1Wf7SemydpktRfeCl+rW0H6DCPQqfh+BtdqCOmw+WuRpMKnWw/Pnj31Vv0l+zCR
 LmdLp6d1m93WK/YuHX5X5xFhi6jMv3tdUxe6NEDV60bR9cOhpVhWPvt1ck5Vs97NkTxv
 WGiAvHXve0+np7nSG/fXtC6r/Ynd3Joh2K+nbLqRPaXumVZ12Lj8qpVTrURJDlKCgcPW
 NYXTP3dp6oFePsSnz1lumdE4IUpzhB0bnN9IqzErkxF+O1ZANKxgzUwF91P4x7Vc0FN0
 cOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957507; x=1720562307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rzL7Ai7iKqeKJnszxdFQBmj3pbR9EFBsW0IKIFtNrQ=;
 b=KFWGoSBUZzenF5+GL8Zl0wzuanYFwpNOf3DIw4Ozam9fVUgAjnejFItuaMQZfIOKWw
 m+etRn2G0XINjQmMlzhwifMep99wu/YYxbaDNR5W/IkU4zkSmq0Bc5U+v54bO5xm+IqB
 ky+WAQVmmxv3Fd58W1l8HsbC4Vr9ypSE+gcCplQlLGMs938Qk/sWnHQEFOaLniSkyzYU
 01WdJPYstspG0hFh7TQZ7B8Y8c8jObkPlkjSv/qIa5cMBnkWj5RmtrkKm1Jpbbg0WRt5
 6bENc0dESVFTkcFFFTJOXl4QsddREOsVRPBBBJMYgwGDbrNbF46wZ+Xa6niHhIXGB4i4
 6BEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqBdZNLrR7QWT7KpVOyDWvxS8sDgG2feTBOlbq+Muap0MQpZWFhAf2Zr5t8DXxMTK9k8emBXJlmNdY6kihNkON+TMNqkTNeikmzbmhHWbYcckjfc9m0IGJz469QfXiaffqq4UElBTd2QJutm3rnfL/fA/cJKKgKJ6Kie5obf0tBWGJeiRlrH+FAQ1Qee3ySg9r0jo7Ctdjt0OYOmjp6YMHATSpxeD9IxtgFt/DBtlJhntcJ54=
X-Gm-Message-State: AOJu0YwWN1K+7piiDP36y35re9NIvSqREZ/2jFZLX/eCJXBLqv4F8OZy
 gbYS8dYr15o5U8sTPRFkCejytMFwoNJq2/XvjNoqy+Wr4tECmKts
X-Google-Smtp-Source: AGHT+IF56ls3w7f2WSNbJ8aXQHldMBv+gn+afom4mP2VlDrZdzOAf5MG5lr7DVKBeB+D9m7lbJ2S+w==
X-Received: by 2002:a5d:840d:0:b0:7f3:d89c:601b with SMTP id
 ca18e2360f4ac-7f62ee54715mr1057898039f.5.1719957507558; 
 Tue, 02 Jul 2024 14:58:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 11/52] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Tue,  2 Jul 2024 15:57:01 -0600
Message-ID: <20240702215804.2201271-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Change function's 1st arg-type, and deref in the caller.
The fn doesn't need any other fields in the struct.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8320cadeb251..882354e1e78f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1120,12 +1120,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 #define class_in_range(class_id, map)					\
 	(class_id >= map->base && class_id < map->base + map->length)
 
-static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
+static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map = iter->table->classes;
-	int i, nc = iter->table->num_classes;
+	struct ddebug_class_map *map = dt->classes;
+	int i;
 
-	for (i = 0; i < nc; i++, map++)
+	for (i = 0; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1159,7 +1159,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.45.2

