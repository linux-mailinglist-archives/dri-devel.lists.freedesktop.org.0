Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C7F8B6226
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71B510EF98;
	Mon, 29 Apr 2024 19:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FfgZD0bx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48C110FF81;
 Mon, 29 Apr 2024 19:32:27 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7da3ec3e044so232388239f.2; 
 Mon, 29 Apr 2024 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419147; x=1715023947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WWBvTZRK9iMyBsS29iq5uzOkpLKIJfBUxQQ9jj4Ilzo=;
 b=FfgZD0bx6v/zuNAWRUdvaX6IRM4dF7omWWxIwbfB4lK8yMok7VOZgsetW8JG+oYv9D
 EBxf/QAsmya5ah1LvqO4f30JhWRIYM+oI5lanPgyOrvsR1R73TKvxVyDLz2CGRI9GWlr
 YGFk5sH1WetLTEsQ2WTVlgEo3JlRKJOSvPP+1BSq5e3g/FdPTDpqVQBMbCkknuXi/06j
 H1rpWYsInNEkJ1wkIrK06RF1RkG+Mc9E97XOpXDY9/pitsanhZ4Al1dEWsiG1kZ86DUp
 emwVu0DK8AKDsZ1jBqy9RxVcUTL/lbGRMkJl9rQWHwFQ8tdvM1q6gnQ/xBqkCasWZDQG
 lQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419147; x=1715023947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WWBvTZRK9iMyBsS29iq5uzOkpLKIJfBUxQQ9jj4Ilzo=;
 b=rL3yFAGRqflxPWQVSaNvT0PxXidr5pxIBuZo0kNo3X/fcThTOJXrBMp86kj6a2HT4X
 PJ816lnK+Z7kankq2OrN7BKIoeSRWrX8TM4ywbfaDmmPI6ekRYzXfdB7Qy6cqcqEJsAD
 P9oYREXM/m3PBoYGxJmxw8rtrqwjYVNreu0ZzOLn42goJdtol9rNjU2GofONXK1yoUOe
 B2i2qqiFfR4pVB6a60AePBVI6e7mRZBTDV0fzivhTfUXPmkRfbQHAfhvMqyUsE+yjzUQ
 Rm8UibjFxvqkjGVnVbZtaH3xKsyz3QT+rOxfuzAU+jVDwihpNDUfGDKdt7IchiV7fcVb
 ep1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFgZ//zc395quVAgQZgNqyz1Yh1KIbC1ID0/ZVIZtWcsNBe8w6KgOyv96Fq8Abp8tyKLM3NqDhZOIxQ7pihOO81xlmDnJRb3aBp7D0FIWRqdWFE9m4aT94r5jgx6jXgUat6iAlnn86Y/Pt32i2aBeGZtSM4PORSju19GTaxjD8YHD9Yze5NirAv1O0hQ1OnJzXD66/g6gwR/QKn0j5sxrO+raCJBLQstma9iMeMQl4Vrm9Qaw=
X-Gm-Message-State: AOJu0Yw4XtIYkxqCxG6aZWYJ0OSIofGRuA5LHiBMmdMdjxw0D9y7cdxe
 DtWXuUage34zprczscCrdIDaVjfm/uM22dN+xJwh90aTyUyjX3/V
X-Google-Smtp-Source: AGHT+IHBlACPw9dSF2W5n040FK0AJ2oPwC33WMQq24sMPJGaWDt3luGkDhtD59iMEf10zw56UprD2g==
X-Received: by 2002:a05:6602:4b0f:b0:7de:c308:76e2 with SMTP id
 eo15-20020a0566024b0f00b007dec30876e2mr960254iob.3.1714419146954; 
 Mon, 29 Apr 2024 12:32:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 12/35] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Mon, 29 Apr 2024 13:31:22 -0600
Message-ID: <20240429193145.66543-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
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
2.44.0

