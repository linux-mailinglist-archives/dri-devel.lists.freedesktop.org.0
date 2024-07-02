Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A14924A4F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F3110E6B5;
	Tue,  2 Jul 2024 21:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QsgKdtk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C0310E6C7;
 Tue,  2 Jul 2024 21:58:27 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7eee7728b00so189210939f.3; 
 Tue, 02 Jul 2024 14:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957506; x=1720562306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kihqcq8gEwvlFuKQVqVa3kRjj6JIPweX7rDvgcIT9h8=;
 b=QsgKdtk8eHthjaezRk1OZ4nlF/ZY5sfcFHVQm+3GzDwpHCpF6tpoyS0hbHRkLRtjC2
 N9fT+R/HOiIFejT6G70UPqI62TXAY73rrv98zggp2/qeCBWVRpn4FhU52LdxyCsfdDuI
 oCkMPqwRVpfodPV8nSI5sS+FxhkKm7k2d94Oq3mpgl2hjt77S5RO0STqhorr+FgKj9IY
 A3mjvlzAV7x0LcXoS3fSNKQbBwg5vdWUlnCMnHpirhmkVeOhe0B0vvgYJC1zmkvbsJEb
 /Q+OasM3qH+9/HF42J39Ig+XVyY/JAPorZV7sCrjA9nxDuBpe0dfzuBLdLlwERhUj1bb
 pj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957506; x=1720562306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kihqcq8gEwvlFuKQVqVa3kRjj6JIPweX7rDvgcIT9h8=;
 b=YNS1YNVkJ6sF05RloGatJ1VCXJ/361Oe+nd/xOAX8zB1QVKGpzN+q+9+JcHZuiDEAB
 E1me0oSgS1wGQD6XDvBt2yl3qvVrnJ3FlseZ6Fb0kS4DLaWpMpENZFeTkGpjgtBdH0oQ
 6VZS8u4bsrQcHFV7rmCGriQlPYleg1IyAbmSwXjmRzdC/0vhF6a+dzqIL8c1IOenSGkz
 n2IBEH1jvIu0ZIXc5PauY2wQVoNQ9t57FnFfvqq94xi7XAlHT5IUQ/sO6J+4yDMrmsie
 9MTwuV4SJkE4JlAYEzJfKZ0YNDRkCnyAtWbwxn/Wy2T6l6KoDGNh2fhHid02/Dwir1g6
 HZlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrLLOUO88DVIZxIeQ0S/afauH4vcq7kl1uOhfxp/7kd5Ju8rlxAkmbLzCpSUSAIqFu3mfOR/rKDXhL+YDJ2nb6DDl71puuItGhWwcLrVtqDI804a+UmAd+EDSQyBpELRdobYZGxt0rtPy/Kmv2rXsXHK8I9kyJ9XBszW72CUKe4MTe1156vi+nEmW6f+MOi5i773yk8SA2rRrkfpvblAqiqqZfz2ukaj5HE3oH8w9M8Cx4toU=
X-Gm-Message-State: AOJu0Yyzb1fERWkHZ4KMO1HLjjcvPtrYDxvGQFBxY5ip47PrYbkAwSVa
 XmhlTY2NXenp77lTsUe3a9g+pzOKLds26potnE8YOzifuUi8RzLbcBzIHQ==
X-Google-Smtp-Source: AGHT+IF8hAhxFCTOhvSpcCx/i+r/frukj2a98ZVky9/KM97IGZV37TQytURYtKcRbWkLrVOQ3MdKcA==
X-Received: by 2002:a05:6602:349:b0:7eb:cba1:b19e with SMTP id
 ca18e2360f4ac-7f62ee0d9b4mr1212668139f.8.1719957506351; 
 Tue, 02 Jul 2024 14:58:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 10/52] dyndbg: silence debugs with no-change updates
Date: Tue,  2 Jul 2024 15:57:00 -0600
Message-ID: <20240702215804.2201271-11-jim.cromie@gmail.com>
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

