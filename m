Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBB6933107
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F6610E841;
	Tue, 16 Jul 2024 18:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mIjdECPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E08410E855;
 Tue, 16 Jul 2024 18:58:33 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7fd3dbc01deso6009939f.0; 
 Tue, 16 Jul 2024 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156312; x=1721761112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rzL7Ai7iKqeKJnszxdFQBmj3pbR9EFBsW0IKIFtNrQ=;
 b=mIjdECPENjptGk5kOiNjjEPjYGZBqu/Bcpveu9l0hORMP244ICD0qXrk1Jakti1ttk
 2CApqz0cOmF1XBPnQiW8f0dscEdeMMKDaUrFFfiqqpH5FyUEcOP4SqpSyl5cBUl07eHm
 +Z+vEulpdfdtpvaO6DSUkO9/lgeNqcG7oKot38WZrj6hAWKvXDwJ+qWFZSDblx3qXw8W
 1Om/LJHMuo1egrKi585bg72F21J3Oj+J9/+zlQUyZ+Vd0jNRBREQEu/UKhxzVA9X02fo
 AlmFhCnwTzdNKINPnPyaMA0aRDeZeRC25ttj2CIiYXXQU7CrFbp0uHUtb9RhUdu0GGXY
 Rkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156312; x=1721761112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rzL7Ai7iKqeKJnszxdFQBmj3pbR9EFBsW0IKIFtNrQ=;
 b=lvzeADbBQoW+XWaMT315MIeujMDLXkPrOstyXSYl73N6Di4hzoAtrxWfryS4MNlx4r
 2Gt9A9rPPiWhTLxyyaraY9nmJvQGUNcc/G1Okn+a46loNWaeRi1huG/8l2eO1Z0BZD/m
 ytkwlUIAzSiGwkmbLgBhhYg+//ZXNIxl/n1caOTkP5AbUniNovqctpCL+KRJvcIcbIZb
 aJ1ZHTfITEukvuLwIQWXDW9L9fX0qi4E2QSY86rGh0WGM8qOhgPyWjR+t40eTF1zdR0g
 4zJcJmBjh53saWj9gfZo9m3PeeTCcHBmrKieSWer9vDv1BBLGSl4VV0AzNc4NaGTa5kX
 zC6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSLjlpTlXpIezSwJKvrXMviu0BegP59XDz1NzUnl0LCRPmPHHrr5lRM6TqBqoCBWYsMqwqz9tkQdz9mSDfh2vd4G/YEHI+rHT96yCIq4FJRrUVThguFzCht+80lHKulKjFtzr5jn2jqIlZu7EbZNh6CoplUzeUiWvdRYdbi7uyLGFLC/HWGPEDdUchrr9DYn8uTzLp/xhAyloV+aukvoC1c5GBqukuqmmqIpj8TR1Z4HLfOoQ=
X-Gm-Message-State: AOJu0YyHIWTElAqHwW9ZeXzFvRpMa11MaZWl27MJsAoTtz1Gg96QVkWc
 kpcK+DLniVxnzdR7Jwr+afdtT7T4AclcW9P2v9Vq9fiGogYNDX8s
X-Google-Smtp-Source: AGHT+IFfR30H2Bdi7TX62v9owfKKB159Qxax+zs6sy+PqRoyxnj4KxOG5l42wZ7oJYL3T2Y94rH3hA==
X-Received: by 2002:a5e:c00f:0:b0:803:8f26:e0c5 with SMTP id
 ca18e2360f4ac-816c39b599bmr36645439f.9.1721156312261; 
 Tue, 16 Jul 2024 11:58:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 11/54] dyndbg: tighten ddebug_class_name() 1st arg
 type
Date: Tue, 16 Jul 2024 12:57:23 -0600
Message-ID: <20240716185806.1572048-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

