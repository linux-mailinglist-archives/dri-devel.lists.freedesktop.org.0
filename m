Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA548B623B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D2410F90B;
	Mon, 29 Apr 2024 19:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZCWO+lyi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8318F10FF6E;
 Mon, 29 Apr 2024 19:32:26 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7d5e19d18fbso201993839f.2; 
 Mon, 29 Apr 2024 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419146; x=1715023946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EXjRrzdCYkLhGXxn6Tze/QfNBLWvJeKdggxRtTTTxXs=;
 b=ZCWO+lyihf6vxTTT4TudGS4S1RFUmM16902LFyFudNUa5565FT/hoTK6VHbyn82WW/
 9ywbunR0pzLacHXA/7zcofCeb38BqdJXaoGYpZVGhjm8//4c1Ipq+D9H+2dfafCEWtsb
 H5R992cgsqOe+hTUI8x4b6jx5bdwDpj6MS3UK3UWsrLvMHpPpPDPSpshI9blqXJwBmXq
 PkDHwgfcAfAeVXUxqPBe0WWZDPuaO6I0pU6AQlvrfukRnJSF3IkCGX49AxBbNKyI4ZDA
 zoHrogwKLw7doLbeQTyaDQQ1VMkwYjXgQ7FgKBeTSWWprK+mPpTWfibGeim3s+88v7Mw
 T6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419146; x=1715023946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EXjRrzdCYkLhGXxn6Tze/QfNBLWvJeKdggxRtTTTxXs=;
 b=AIaw1ZeCZa/VyhZvJZuTt6sMy1U/BDB23mY7AEg/6zzDWUA83p/2Kq2ZQ+OOdl38CR
 Xpslqd5awZdKhaqFJlA+I1/o3+LqPmqhXYNqguAoXIHi3vZIZexCeAdIskbfE2d/yzHP
 8jsztiRnuqSv3Bi5vxmER+uYj0Xwjwgazr+zy6umZpPE6YqYUixVDoUZRAtCd1xbfTfJ
 9cRGfEmVBq+QI3Mf47AvKcznXpmxsxde1zRv0cYRxCmFuCovOsbzDDh7PMJ2OvF6dZzV
 rhZGeTzLPgRcT5KPzm96kpTIBk2AQMXX35MMnX8hjkiidPzZcXq6LJC6DELIMA0/7RqV
 g4Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSPMqw7xByOS26Nl6rLoG+e8kVmGBcFb/I/F4txVFwaLOD+/nj7WZMAbNcK/3lld37hwpRJgLAjZ2yBLwY3+HQoXy9ZdtB3KbaWD4adMdGAgyznGre3rftjN6NkJ/AfFVX7tckrBHJaMC/uIwUjYZZbIEngwvKEE9uYHV4Qeji7KAQ1tPfbzxfNckgtat6lr1EgV0wZHVHikGaWocGneii7/d/KnQJFQlp/QCL6T/FNUYhAUo=
X-Gm-Message-State: AOJu0YyR7YwBN7nvzl7IAAjtHBWteTppwosWlp+fM/JW8hhT72pbY+bQ
 jFQJTHwhK+M+LqO5yLgbPHI/tzynDUHn370pLJFfoMEHkLR2YUOa
X-Google-Smtp-Source: AGHT+IE3p1obx5NHUH2g77zVzvLUE0eATOj9FCak93YZ3BbZGAqnDoiqRrtDkzEy/gCQsLpjLsG6lg==
X-Received: by 2002:a5e:d818:0:b0:7da:c331:c5cd with SMTP id
 l24-20020a5ed818000000b007dac331c5cdmr8530527iok.6.1714419145679; 
 Mon, 29 Apr 2024 12:32:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:25 -0700 (PDT)
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
Subject: [PATCH v8 11/35] dyndbg: silence debugs with no-change updates
Date: Mon, 29 Apr 2024 13:31:21 -0600
Message-ID: <20240429193145.66543-12-jim.cromie@gmail.com>
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

In ddebug_apply_class_bitmap(), check for actual changes to the bits
before announcing them, to declutter logs.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 368381dbd266..8320cadeb251 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -595,7 +595,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 				     unsigned long *new_bits, unsigned long *old_bits,
 				     const char *query_modname)
@@ -606,8 +606,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -622,8 +623,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
-- 
2.44.0

