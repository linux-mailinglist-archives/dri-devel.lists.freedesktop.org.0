Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112929B44CC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBD710E5D4;
	Tue, 29 Oct 2024 08:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FBX9CXsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A061E10E5D4;
 Tue, 29 Oct 2024 08:49:19 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71e953f4e7cso3781015b3a.3; 
 Tue, 29 Oct 2024 01:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730191759; x=1730796559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LoOFfYpo1uCoXTqMLL9mhUUj3EdIXvRo1zOQLi0+PSM=;
 b=FBX9CXsjacn2M0wwBsGfBxoxLjghqj++i5Mp1+F0IHGCYH5/r04FTME8k6tZIxM+0e
 rVXR85CrtSyBhKDv+lXwRTAdz3mHvBj73afpBNAr8WVhOwX8A0LPxIb24B9tUmnVbSOj
 ja6bZ9oc3HHkpaQBh9UlXTbqQ1xKgb6VQbEPCSDHUicS+8gr/egsCYFbsw3O0tIW4RRb
 aZtEfI3Q6GbXyjEmVXQI9tivnnzEAgVl7cTiGkpGtgKif4tl4lqwyE8S0Y3cINKsVCe4
 l8JpAzkuPefEQKWA0mMrRWoMCxRsEBwI6RAF5Sywpa1Q3G+J5r9myfQlcJfXA61jK0Z1
 WJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730191759; x=1730796559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LoOFfYpo1uCoXTqMLL9mhUUj3EdIXvRo1zOQLi0+PSM=;
 b=GO6dSSOtWuo3HjJF12fZ3PPagmB1NDmyX+3DNT/QNrUalWdpqgc8sSfTQLsdfXBIK0
 WPrW0bLvLRrc/zkXCrwF+rCOCtBhAssTBZIhJPQ/fZmHZn6L1JEreI9AiuQkW6zb39aQ
 pXaLbkp3qNRZ08louWTD5vVwWvelU9XoRaQvxwje83XTdJDGBp3Vv3KQQ5BNMbBBkwdb
 ntaKbpz284Lonx8TyPj2JkH4CqrV7YKgqdQIbNyKv76nDZImAp1yRlyRhEU8zTCwlKTh
 ELSl/j45Fc4QjgVUyWU61Oxz/dseShuIqBYDiktqYSyYgVGFYsqeu/Bd7w3z6DDspZD3
 FR+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQRDoUeYVA96YfD2EqPmpOxfm1BL5BF/BIwjacXptGkEIBSyM1Ni1qD7WuNjCjoeiAh+jPkl5t+3w=@lists.freedesktop.org,
 AJvYcCXvTRdo07gNOwBnOemJ1t4SmywMb7nF+pBU1Dl8DkgcmhhJ8aNvQZJchsICW3ZMeOGxeoZxXyzdmXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwLfJE4984ZRadsPsbj9gpJxHDHM5qMO7YroIPgbOmgRiKGo40
 6l46HeCYn8mwOOmq7QsU/OqvCWTFurufEu1cqolUCWgQY7k5MvZ+
X-Google-Smtp-Source: AGHT+IF6/PgyjqWquahL8uc5W3n0vli3ePD2PTK642Axmywaf6SYTUzPfIFPcaYdUjyCxGVsyREoDg==
X-Received: by 2002:a05:6a00:2e06:b0:71e:3b51:e856 with SMTP id
 d2e1a72fcca58-72062f4bdfbmr15623858b3a.1.1730191758317; 
 Tue, 29 Oct 2024 01:49:18 -0700 (PDT)
Received: from gye-ThinkPad-T590.. ([39.120.225.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a1fe53sm7122491b3a.162.2024.10.29.01.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 01:49:18 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Gyeyoung Baek <gye976@gmail.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/xe: Fix build error for XE_IOCTL_DBG macro
Date: Tue, 29 Oct 2024 17:48:58 +0900
Message-Id: <20241029084859.135172-1-gye976@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
'drm_dbg' function is replaced with '__dynamic_func_call_cls',
which is replaced with a do while statement.
so in the previous code, there are the following build errors.

include/linux/dynamic_debug.h:221:58: error: expected expression before ‘do’
  221 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
      |                                                          ^~
include/linux/dynamic_debug.h:248:9: note: in expansion of macro ‘__dynamic_func_call_cls’
  248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~~~
include/drm/drm_print.h:425:9: note: in expansion of macro ‘_dynamic_func_call_cls’
  425 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/drm/drm_print.h:504:9: note: in expansion of macro ‘drm_dev_dbg’
  504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~
include/drm/drm_print.h:522:33: note: in expansion of macro ‘drm_dbg_driver’
  522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
      |                                 ^~~~~~~~~~~~~~
drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro ‘drm_dbg’
   14 |         ((cond) && (drm_dbg(&(xe)->drm, \
      |                     ^~~~~~~
drivers/gpu/drm/xe/xe_bo.c:2029:13: note: in expansion of macro ‘XE_IOCTL_DBG’
 2029 |         if (XE_IOCTL_DBG(xe, !gem_obj))

the problem is that,
XE_IOCTL_DBG uses this function for conditional expr.

so I fix the expr to be compatible with the do while statement,
by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".

v2: I modified this to print when only cond is true.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..ac2bd103bb22 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -11,8 +11,12 @@
 #define XE_WARN_ON WARN_ON
 
 #define XE_IOCTL_DBG(xe, cond) \
-	((cond) && (drm_dbg(&(xe)->drm, \
-			    "Ioctl argument check failed at %s:%d: %s", \
-			    __FILE__, __LINE__, #cond), 1))
+({ \
+	if ((cond)) \
+		drm_dbg(&(xe)->drm, \
+			"Ioctl argument check failed at %s:%d: %s", \
+			__FILE__, __LINE__, #cond); \
+	(cond); \
+})
 
 #endif
-- 
2.34.1

