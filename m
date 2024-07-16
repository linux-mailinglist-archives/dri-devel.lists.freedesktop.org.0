Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594089330D8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A152A10E718;
	Tue, 16 Jul 2024 18:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="neDSdMs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE96110E83B;
 Tue, 16 Jul 2024 18:58:31 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-807007b8dd1so4811639f.2; 
 Tue, 16 Jul 2024 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156311; x=1721761111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kihqcq8gEwvlFuKQVqVa3kRjj6JIPweX7rDvgcIT9h8=;
 b=neDSdMs4xpAR9dvlscP/mx4ZHe10Fjrk3QQHyD1xXDr6D2m28FRakxfNjSKLLkf8gO
 qB7c2pgGYX9MAmXoUfMinGNKW3EcW3EXmr8Gute5Jh31ftSVAjANXkgjqjdRpNiYlHdP
 D8K4vOPje4MwpHO3T57D1d5caz2bCMWpTTEF+f2WzdGCSIzEIabTrN2+6JTL8SeCpbvy
 lKUQRQep3rUFTSXk3UuyxlbwJKmHhz4CUY1rPqdscvvmYr3EYfzIdqgpP2AQqPbSzk7L
 e12nHgisZcCtccJtMM1zMgn/HeCjOkyGfHw91UWoqJexoKf67KmHKBmDZFH0C6ixQ4iQ
 FGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156311; x=1721761111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kihqcq8gEwvlFuKQVqVa3kRjj6JIPweX7rDvgcIT9h8=;
 b=AHbDHwGsSgY5xM4tpGCtnMMpwQhtCXKtUfi71s4/IWefjlsgs4065tWc/q/vT1U6xb
 RPjQ1lw106MmXm/X/HuV/EGyQyhe8BhnUdVPRCXqZBfq8ICwZwE4nyYJngCzIxbOhwqr
 4Q7xFmb24OBUX1wkctmq5U/TE7s8zUT0aBXHh6QK/QZCdH+oUfs8sVtUr88Xd6v7zio3
 uv04/BlRFAqza2Rx29KGufHPjTv248WoKbyGEjDai2vt8KROVo1KpVArlfPatNhQzC3t
 PDZCYPfyPe7Rpa2rksocMYaLE+D9394G2hiWyPtSZQ5dOOOSO+cx3/hYgtUf63d2ooDJ
 tZ7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlYzQ7oGND+fN44RPDd+BcMym+Q3GB6f2uD4DIcAFe/MmIFITqS0+XmmR+YQrodUjbFA2Cz//9y9bTXWbnsQ8dAbAjwqBshNK5ArJMc12uUJN+3NWi6mC+fW3RJPA2munqsmg1pO/SfvG4x3NOdw/CtvVomshwnl5eYx1JFVkdVa07NSC0BP385oGCqcY4kgYX9DWgScOgCJqQ95+otudjwDRjwGaHI9M/AL59lXxGJ99PBtY=
X-Gm-Message-State: AOJu0YxiMW3R6Astik7Y3Oi/ry3yfV2b1676wKudP5sOARGaLjiYSEW8
 Kp0xUyvw0oKfZRKPJxQMPuo/7brRXf6dPdHGDoEUk9zDcjw56sj+
X-Google-Smtp-Source: AGHT+IG/+jo69dsHArTBqixhUoufA4QPx32dYcoWi4IHunj5MWvseDBGOvH7eIX5hx3svsuPZC331g==
X-Received: by 2002:a05:6602:601b:b0:80b:8cb:e9a2 with SMTP id
 ca18e2360f4ac-816c39b5f53mr47969539f.9.1721156311067; 
 Tue, 16 Jul 2024 11:58:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:30 -0700 (PDT)
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
Subject: [PATCH v9-resend 10/54] dyndbg: silence debugs with no-change updates
Date: Tue, 16 Jul 2024 12:57:22 -0600
Message-ID: <20240716185806.1572048-11-jim.cromie@gmail.com>
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
2.45.2

