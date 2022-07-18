Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD2577BA7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D524A9DB6;
	Mon, 18 Jul 2022 06:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431F8A9D27;
 Mon, 18 Jul 2022 06:38:55 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id w9so2043701ilg.1;
 Sun, 17 Jul 2022 23:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KwNFZurtVy8n4N2ByhPI9NLko8yxI3e0nauRdiHbBkA=;
 b=l8MZDCiAayaWvEOkX5wGIdAG3bZyiX7o81qlDwT+yRLYR2I2ZqlsVm5gYjxliR/dO1
 5ycOh71NVgFAqb8jRkfG+UYjRPzj6zupoXSaJ5SAOv0pxTyOwUhtXfqsehg8/CNIZCQH
 H7NW8SU/xpsHiPl7kXW/BwX4KD3q7rxoz84i0TxHFXdbL2ov/UVO6h6aBRf2lm63gL6W
 E2nun1uASBtjgGAjNZrrbgOit1cXubreoGXQwh6+hhkiQ/KSZM7auqMD+CCDvVP1+pWd
 lD5JELHaIOB9pcadhqAx/0q7add+1dCiO4SAo5nzDW4c7DweAX+xORIV0SDkUfTMqY2A
 FfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KwNFZurtVy8n4N2ByhPI9NLko8yxI3e0nauRdiHbBkA=;
 b=H5QS0YFYI4yQTTzMoyeTpf/1wHRSsMJ6EBZsyr0irQpYUL8VELDLb8GreQeBqV1lMP
 WjL4m/ZvjuMQzt28QXZARGKlatFnjsjvbqa2qvX6kT7mHSb9i9ldRHLx+8zQpofQWhep
 jHgPlEy+khPy4uZ75eukr7znDSkfZ02JI9+bUCxvho4QQHri4X1Dy63ahH1NKJGTkbQK
 R3kWJIN/7KocyA9x89znYViMj9xaWROaCG16RBBkwcBHCKcBOmdZze9Y2UVbwtRpHFO4
 FF/3inqYUcPuaL7ZIY9LPGBVDnx8YJ/8kxgWUmWoo7xSmtZBhzg+vR43a0/ks5Tva0x8
 8mHQ==
X-Gm-Message-State: AJIora8I4VX2iqW+uo+qEjyGg47LPx+SyOiUmyrQR+/eMo2xLOl3m3RW
 1r3jEQUAid2E3po0GH9yFxc=
X-Google-Smtp-Source: AGRyM1sMErcA/EOBdISRpBYd0XV3/+146ARelus0WJg89/tGCLQyf32KLxLRFtPYgBmkzcuOrAF+rA==
X-Received: by 2002:a92:c262:0:b0:2dc:e5e6:6a2e with SMTP id
 h2-20020a92c262000000b002dce5e66a2emr2231682ild.150.1658126334910; 
 Sun, 17 Jul 2022 23:38:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 27/39] drm_print: add _ddebug descriptor to drm_*dbg
 prototypes
Date: Mon, 18 Jul 2022 00:36:14 -0600
Message-Id: <20220718063641.9179-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

upgrade the callchain to drm_dbg() and drm_dev_dbg(); add a struct
_ddebug ptr parameter to them, and supply that additional param by
replacing the '_no_desc' flavor of dyndbg Factory macro currently used
with the flavor that supplies the descriptor.

NOTES:

The descriptor gives these fns access to the decorator flags, but does
none of the dynamic-prefixing done by __dynamic_emit_prefix().

DRM already has conventions for logging/messaging; just tossing
optional decorations on top may not help.  Instead, existing flags (or
new ones) can be used to make current conventions optional.

For CONFIG_DRM_USE_DYNAMIC_DEBUG=N, just pass null.

Note: desc->class_id is redundant with category parameter, but its
availability is dependent on desc.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c |  8 +++++---
 include/drm/drm_print.h     | 23 ++++++++++++-----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index e0de79a22255..92f3f45e410c 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -29,6 +29,7 @@
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 #include <drm/drm_drv.h>
@@ -278,8 +279,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		   const char *format, ...)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -287,6 +288,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	if (!__drm_debug_enabled(category))
 		return;
 
+	/* we know we are printing for either syslog, tracefs, or both */
 	va_start(args, format);
 	vaf.fmt = format;
 	vaf.va = &args;
@@ -302,7 +304,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 }
 EXPORT_SYMBOL(__drm_dev_dbg);
 
-void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 3c16b00b6d21..2879a2f84381 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -363,9 +363,10 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
-__printf(3, 4)
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...);
+struct _ddebug;
+__printf(4, 5)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...);
 
 /**
  * DRM_DEV_ERROR() - Error output.
@@ -415,11 +416,11 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
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
@@ -522,17 +523,17 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
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
2.36.1

