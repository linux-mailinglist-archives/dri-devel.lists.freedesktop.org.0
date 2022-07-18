Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922D4577B87
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1004A9D60;
	Mon, 18 Jul 2022 06:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC13A9D35;
 Mon, 18 Jul 2022 06:38:57 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id v1so1930484ilg.4;
 Sun, 17 Jul 2022 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nos6Fle5iQJrLSEDWrE/GX8T005NKGNifJ3oR077PWk=;
 b=P4hBgjKRqMCY+hmcUZhDoAuDRruv35rfgM5mC8EuY6oCtqnGIrGNWt1p0k1HDf+cvh
 5w3jP4ViOTICE0COMGVaPapr46yRDMqCAl3TW+EWLEmFBmlqcNlnLisB5ZvK2OituqIe
 qtxI+WuBPj8IlpU95N/EbpeWUlgF7W0s9XTL4iGsbH1WXecFSFabddqFhf3JVQvS6+j6
 1HNUDe1NpsJUs9/qz5tP6/Ola4r2yh399H0lwyPdT4bOFVoACK78vqZC6mTHaWNEcTSJ
 yqp6QASViYDSS1XId4ejjsNAjp9+hssCId3kE/iUfs/AGfbbtu1SFF0MbpTBUeeth44r
 D3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nos6Fle5iQJrLSEDWrE/GX8T005NKGNifJ3oR077PWk=;
 b=7QZrqkW5bOx2bcfAKYTtTnoTs6pFoMsCuN9U7x9bemH85dXENtWSIQxnODzAecJkXB
 DaV+NM+TPuWyUlYyajTxvaSAHYkWqCmU0rWS/DHLxfjxTZ8hk7wNjTReNECUxE1IDrgF
 j9t/+9Ov24WNhpKV2KJN6IOJOvGJIcqhgXUOtb2y8mhTxJ34BFZlTYi1296viCJzJoKR
 7hsyALaNLH2XHUbueMtHF4D562bgCleRgofiiEt6TYvQDKuaX+cQASOxUpa85mXMU8mT
 7e8YWp99kl/R9ZeFmE70oxrIHYUuVXpsB4IQavnx0zLpUi0Gx6iGOTJfQYnTga0tcyG8
 Bujg==
X-Gm-Message-State: AJIora/hYOmQItfSEh3oQjHqAC0jezVG0AKF6Y0DJUKBmbIcnoGkGU83
 EIwRmOo6ZEuZrvwLBhAksFk=
X-Google-Smtp-Source: AGRyM1uw/5zI4fKGm/w1RdX44Md6lruBgB5ihFwHmqH+p2b3YJQptIHopUBcL+8xV1DyUO1gZeSrpw==
X-Received: by 2002:a92:cd85:0:b0:2dc:7a9f:e14d with SMTP id
 r5-20020a92cd85000000b002dc7a9fe14dmr12242226ilb.314.1658126337480; 
 Sun, 17 Jul 2022 23:38:57 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 28/41] drm_print: add _ddebug descriptor to drm_*dbg
 prototypes
Date: Mon, 18 Jul 2022 00:36:16 -0600
Message-Id: <20220718063641.9179-33-jim.cromie@gmail.com>
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
index 7631b5fb669e..46f14cfb401e 100644
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
@@ -523,17 +524,17 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
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

