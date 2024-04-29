Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C708B6298
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD7410FFA5;
	Mon, 29 Apr 2024 19:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W20IkYUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA03910FFA2;
 Mon, 29 Apr 2024 19:39:41 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7deb424da41so138740739f.1; 
 Mon, 29 Apr 2024 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419581; x=1715024381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulaYyaVft/YyoU0+fiQtajkDbj/WJZ88JMn79Ec/vX0=;
 b=W20IkYUNuHOJUTYYbGTbzN2dhnqXA8o4KDFIkUp9nnB+89+Egef0v9VQfFWnmfLf83
 ILVI6pBdtQDOCFIr2/tW9Ex6JePiZ7aQgvrJvNQbOCRaMRX58YjiJE7p6tiaIzflzNji
 rmBRS6WRrROc0nLUGZpcK1v53ToqViHAVYcJd/IaHMDrEWpYbUNkNBy5wHIo+3XkDGzi
 v/yDRciZsS3/CyX3N7WabvkDzGlonc3Yf8c+zQ5SqsNh9wLXEcGzLh6nZ3CHrcv8WPMG
 ARAD1najJjkECMTh/oKOl+xyiNOe/dIkvgoe2ct9HKBjeqNQ0cr3jd2biQSopz0wKcRN
 vcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419581; x=1715024381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulaYyaVft/YyoU0+fiQtajkDbj/WJZ88JMn79Ec/vX0=;
 b=itNy4Rhos8D/wXdZXUxGGjdSUbBis3TxR6QsOglrUlNJlqhFELDWO+of4LHgRxG/0i
 Xm7dHQ3AL2h9aWx+RdhXp4hmRSo1/CM6Uz4mA8qLRaJ03ZdfkLnuQxxVXkhe7hvOPkvV
 X2pIQsQ++UejIuEYBzi0BvospYxRvCmUoMMyT/dlWe2yDYBV7y//1z9vIWdgOD1y8hyC
 ke7o+yttV827m6Y8d2r92GzfmPPwPZXL2yvUwa61IEF9Ox8hpgqLkH7iNvm/LgZokOrj
 eAyjZy01TBjBw0ls+l8pMlEauj0hzcA/UgKk3CItUONENc1pe8AgRlRVTN9/EgRjEBKD
 DIBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9+bF0vO5OLogTclhnZH25r/cY+Ng3qwTDpIabLiQSnbHFXOkRI6vgCn1RkjqDCe/DG5MA9f2MKpbPitmGE77+wdnqSFNsp/sc49Rq39SelbIWD1guE32EQmRK2Qe9KgN6zVu1qsASEWJ06HyOe75KaQ65LQ4WEiLDt4IkEeIMLkHWHnG/GIhkYtzMnwVWjEx2agt8f2rYy9zXMeZ5beKQBvDSchHDzKR+zLrXC0qTGC0TrQ8=
X-Gm-Message-State: AOJu0YxyRz/LwPGD8s0/PSQazPqNAhvNDpSmniR682hbCLQVt0KfV1gI
 xfB4Om9sYDqIpD4N0mdXaj90jLA6sTJLaDtVbe2BtYB7r3umAGHY
X-Google-Smtp-Source: AGHT+IHyNsWP7Nzkt9gGnd6X8Rl4lpNvOOIYqiWNC2SKAWyiinyhoOsXf738AKl1GY5d/CNNu9onOw==
X-Received: by 2002:a05:6602:25c2:b0:7da:18b8:a4fb with SMTP id
 d2-20020a05660225c200b007da18b8a4fbmr13508509iop.9.1714419581091; 
 Mon, 29 Apr 2024 12:39:41 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:40 -0700 (PDT)
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
Subject: [PATCH v8 31/35] drm-dyndbg: adapt to use DYNDBG_CLASSMAP_PARAM
Date: Mon, 29 Apr 2024 13:39:17 -0600
Message-ID: <20240429193921.66648-12-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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

use new export
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 6 ++++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 4a5f2317229b..efdf82f8cbbb 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,12 +69,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 905fc25bf65a..95c667934bbb 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,11 +141,13 @@ enum drm_debug_category {
 };
 
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
-#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
-#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_DEFINE(...)    DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNDBG_CLASSMAP_PARAM_REF(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.44.0

