Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C914C90D9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5E10E7F4;
	Tue,  1 Mar 2022 16:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A9E10E77A;
 Tue,  1 Mar 2022 16:46:59 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id t11so19077956ioi.7;
 Tue, 01 Mar 2022 08:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEgu+Ofez++Uoa48K1+2ND2BjCIRiQBeP9KERq1IVJk=;
 b=SGMp0SOcz7owiggI/NOG9AwUqWuY3WHOdlY2OGCh5F/TYFEM2fwwXAdKj6sqz21oGb
 6ijQil2ZV5qIEOwn3P3eEiaoBAVmRRUWcqMYc9nuR4fdhXx1K0Y53Ua2G1/U1Jx5MvSK
 TWd6g6MnQUAkcYcfHbaXaO3gi/f7JGcZFVrzmt3Fp6AYxUbSEFozYjmoR0Ozv1kkdTIz
 bT0DgSs6/M7zvCeiZFj3NZejf9fKNELzgv7gg/JY5HL1V01l5wbt+1FNuZqM1l2Vk5p5
 cfPOHYK6402xHwms11aXn4SOWJc6T0G0J7X+j5y2w4YbGGlxsWQ/Ve8WuYR0azZe2iCS
 Yi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEgu+Ofez++Uoa48K1+2ND2BjCIRiQBeP9KERq1IVJk=;
 b=fznnP3/9k6+CvPEaz7mjRJL7tM8RLVfDyq9hUSTrmpxTl8xqn1rv25n2ssB5TlUMLD
 MgPOyxZ1SeLAUpQzpCa11brq1bl6A0F0dIzXk91hi+7VnTXNM0I5ouPefoM0hC5qaODz
 XwBoZxAw8Lp69sFhJiTqclP8Wv85XIJxiXun1XI4i2L1APqoxLttbAjRivvHz5deU1ly
 7tWg4f6Csn2RLcnsq1vQlElQ/g3rXnrT4rTl445yA9YlHH+g0HRiVSzaUqyPq352wN2s
 W6r8Y7cnSvp16m4zVCWDKOdfWy25kLjT4DI7nZw0SjiJjc47qEEPGj9eDZpzbqBiOX4z
 AuPw==
X-Gm-Message-State: AOAM530uLJZigwKdfcs9/O+H+s8dt52frBKEl9U/iCaWhvvOquOTb2M6
 sawmPO/MflzwsWQAusoD9/s=
X-Google-Smtp-Source: ABdhPJwQtRT66y/VO028x0oItbv2Me7FXE+5HFxgf3gbLT46jXc9mytuAJ/FLenQ38OHlfr0Q0QC5w==
X-Received: by 2002:a02:3503:0:b0:314:c32d:edd4 with SMTP id
 k3-20020a023503000000b00314c32dedd4mr22646020jaa.36.1646153219049; 
 Tue, 01 Mar 2022 08:46:59 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a6b5a03000000b00640a33c5b0dsm7272411iob.17.2022.03.01.08.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:46:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/13] drm_print: add _ddebug desc to drm_*dbg prototypes
Date: Tue,  1 Mar 2022 09:46:28 -0700
Message-Id: <20220301164629.3814634-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301164629.3814634-1-jim.cromie@gmail.com>
References: <20220301164629.3814634-1-jim.cromie@gmail.com>
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

Add a struct _ddebug ptr to drm_dbg() and drm_dev_dbg() protos.

And upgrade the current use of _dynamic_func_call_no_desc(); ie drop
the '_no_desc', since the factory macro's callees (these 2 functions)
are now expecting the arg.

This lets those functions act more like pr_debug().  It also means
that these functions don't just get the decorations from an underlying
implementation.  DRM already has standards for logging/messaging;
tossing optional decorations on top may not help.

use that info

provide it to dyndbg [1], which can then
control debug enablement and decoration for all those drm.debug
callsites.

For CONFIG_DRM_USE_DYNAMIC_DEBUG=N, just pass null.
NB: desc->class_id is redundant with category, but !!desc dependent.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 23 +++++++++++++----------
 include/drm/drm_print.h     | 23 ++++++++++++-----------
 2 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 24c57b92dc69..c9b2a2ab0d3d 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -255,8 +255,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		   const char *format, ...)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -264,22 +264,25 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	if (!__drm_debug_enabled(category))
 		return;
 
+	/* we know we are printing for either syslog, tracefs, or both */
 	va_start(args, format);
 	vaf.fmt = format;
 	vaf.va = &args;
 
-	if (dev)
-		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
-			   __builtin_return_address(0), &vaf);
-	else
-		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
-		       __builtin_return_address(0), &vaf);
-
+	if (dev) {
+		if (dyndbg_site_is_printing(desc))
+			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
+				   __builtin_return_address(0), &vaf);
+	} else {
+		if (dyndbg_site_is_printing(desc))
+			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
+			       __builtin_return_address(0), &vaf);
+	}
 	va_end(args);
 }
 EXPORT_SYMBOL(__drm_dev_dbg);
 
-void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 38ef044d786e..13d52b60f388 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -31,6 +31,7 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 
@@ -361,9 +362,9 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
-__printf(3, 4)
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...);
+__printf(4, 5)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...);
 
 /**
  * DRM_DEV_ERROR() - Error output.
@@ -413,11 +414,11 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 #define drm_dev_dbg(dev, cat, fmt, ...)				\
-	__drm_dev_dbg(dev, cat, fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
 #else
 #define drm_dev_dbg(dev, cat, fmt, ...)				\
-	_dynamic_func_call_no_desc(fmt, __drm_dev_dbg,			\
-				   dev, cat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,		\
+			       dev, cat, fmt, ##__VA_ARGS__)
 #endif
 
 /**
@@ -520,17 +521,17 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * Prefer drm_device based logging over device or prink based logging.
  */
 
-__printf(2, 3)
-void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
+__printf(3, 4)
+void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-#define __drm_dbg(fmt, ...)		___drm_dbg(fmt, ##__VA_ARGS__)
+#define __drm_dbg(fmt, ...)		___drm_dbg(NULL, fmt, ##__VA_ARGS__)
 #else
 #define __drm_dbg(cat, fmt, ...)					\
-	_dynamic_func_call_no_desc(fmt, ___drm_dbg,			\
-				   cat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_cls(cat, fmt, ___drm_dbg,			\
+			       cat, fmt, ##__VA_ARGS__)
 #endif
 
 /* Macros to make printk easier */
-- 
2.35.1

