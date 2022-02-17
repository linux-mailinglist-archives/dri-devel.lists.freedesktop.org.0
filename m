Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01C4B9725
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA6D890C9;
	Thu, 17 Feb 2022 03:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30B910E7CB;
 Thu, 17 Feb 2022 03:48:53 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id p11so1386991ils.1;
 Wed, 16 Feb 2022 19:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEgu+Ofez++Uoa48K1+2ND2BjCIRiQBeP9KERq1IVJk=;
 b=c1JeYHRFs5svhKtU+Ma4tZuA1JP1VGAyb5UJut5hn3b+E/pkz4W6ai6Wi07gw9nx0u
 IJlaKZ1JgaK+etmpo8bVgK993gcuAQTJ85hKZNvC7mbhzNti3nrRKPiMeA5cy+BRNPXn
 q+7FmioValLExz+ZdCNnxwwsoXMa2G4dtMO7YG1oXpyH4HDMwlppdpOMwt8l8BATxVtu
 D5e063IVeRG46r9SCc3fM59VGWiK5172LjkMtGK13zLg09HTaAmMkaTMEB72l+5RvYV/
 HlHFzFSqBHJ/GmG2G9sNcd/lWFFlzJlqrO5TGL4sAVzk2p+at9nmsgBlhy7IgHUVzEqO
 z6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEgu+Ofez++Uoa48K1+2ND2BjCIRiQBeP9KERq1IVJk=;
 b=h/p7fX3l2MV4fi0eS+rYqCQvRSG1Ts5yWuo9ykUVYI4Iu5yXoqBXe0kKKWkBVrkFmk
 QLIqnyHUD7AvnzqV5fBIPQEp4EpE5iwOeL910Sy3lISf4kG6hVykC1ICmg9SkhbhnwDy
 SgQeS8wwaQFNMRI3nyGEuZu17RVG4/9oGXZAWD1EoC4ipppT8hZhQ4tcpeTLF5XbM4YV
 aGoTVj3R2wNkXeAbfxv7QFdIDMpnQsHq7Fa7WCZNTLqOzj6vSuB+fudoBj2BLd8qyW35
 MgRKojJSMtk5UjNpey1pKqBTQqbSWInB30bdsfV74O4uv0QI+h96UOssbrsgBAguu3HB
 wB2g==
X-Gm-Message-State: AOAM531mAZcIAOcRJhsCyKdJbz9XLzLNitw+9295RUu5pr5eSlMxrRzU
 Qe5c/KnS/lrDjOiw1e3dBt0=
X-Google-Smtp-Source: ABdhPJyyUYLLjO/ZjDmiQ2qjpAZbgsdUUcVllJavrIsnuUX4/fgc6pmjbTxk2ccQkswLRYw9SI0fLw==
X-Received: by 2002:a92:ca4a:0:b0:2ba:878e:fd12 with SMTP id
 q10-20020a92ca4a000000b002ba878efd12mr743076ilo.139.1645069732854; 
 Wed, 16 Feb 2022 19:48:52 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:52 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/13] drm_print: add _ddebug desc to drm_*dbg prototypes
Date: Wed, 16 Feb 2022 20:48:28 -0700
Message-Id: <20220217034829.64395-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
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

