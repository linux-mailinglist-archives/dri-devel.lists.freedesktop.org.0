Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C999F529464
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E983110F69F;
	Mon, 16 May 2022 22:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FC710F3A9;
 Mon, 16 May 2022 22:57:29 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id b11so7612973ilr.4;
 Mon, 16 May 2022 15:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Lorhsk0X7YamG5elji+uQ1/gsBB2n7Jli+kbKqhzIg=;
 b=jy+CCznjgA7L1dhgzXrr4jlT4O/diTgk+LIO0EH+xOiCnetz7+vDqqCckOORUlXdfi
 CwbbYXdjAEzXOKUPSTX6/VmeIFWkhbhW6DOgUbIdzS//muVJvPgXhoGRwiN5I+gPpauF
 z2Ce0S6NP/Ix2wJE5JYz8eqy3KBfT8W14Gnqg5d7ID/6i8fWFVXvE146qO2236dZ94US
 TsgPLIFIr1+C3maWaa7e8Lgk9n32ax4uyoSoHLIH73f91qMj32AUOSJeq3jMCkaQeAbA
 1+tXve0thRfbAjtaHC4IQZhVeIlvuH4WQjH5GjXvsB+s5fReOsuRRcsln7eajDNk57/E
 Tysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Lorhsk0X7YamG5elji+uQ1/gsBB2n7Jli+kbKqhzIg=;
 b=wUZ+j0m9Pg22GMZnwrrkQlXkRteX7sjy8xBFFzabCDbaq5ZmeU6Vl7NHxEKeqCFtAj
 wRbBXLjGoksKpBgRX8XPs16ZhgjvcGPz1VypGzbHF4fj0p5KxNmKHRWy4XXgZKbUSs5T
 aTN+mUBd0RtbxtMHbrN8JNqpMtkMfU03E4dKgKNgF4UmYsYVusmpWfQRYwyi4+fhFtpi
 WfPcaC2ptPFnEgIPRgpFcE9MNZ+9nUp9rfKmcftdtmrB6DwGLizaa6JeFE7hMldhqnE8
 yzrnslN11xZmuxsu5ng+512keN/0Gwzdll0YNh5scfXf2CclY6f0Q7zQe4TVuBDXAPM5
 fi0w==
X-Gm-Message-State: AOAM530fwgzE/6WmPbMNhfPA1+1H5MwHDe0hILMGT8dcIFP+jTa27CcR
 E3kZ+rYZ/GRcibh0UVRInPA=
X-Google-Smtp-Source: ABdhPJxjJINasg3hAWp7d73zeGu9P4K3x20riV+fru35nOD3ueGvMgNUWGevc44ji4O03Dl/YneXMw==
X-Received: by 2002:a05:6e02:218c:b0:2d1:2a75:7751 with SMTP id
 j12-20020a056e02218c00b002d12a757751mr2652901ila.22.1652741848590; 
 Mon, 16 May 2022 15:57:28 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 22/27] drm_print: add _ddebug desc to drm_*dbg prototypes
Date: Mon, 16 May 2022 16:56:35 -0600
Message-Id: <20220516225640.3102269-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a struct _ddebug ptr to drm_dbg() and drm_dev_dbg() protos, and
upgrade their callers - the interposed macros added recently, to use
_dynamic_func_call_no_desc(); ie drop the '_no_desc', since the
factory macro's callees (these 2 functions) are now expecting the arg.

This makes those functions controllable like pr_debug().  It also
means that they don't get to use the decorations implemented by
pr_debug().  DRM already has standards for logging/messaging; tossing
optional decorations on top may not help.

For CONFIG_DRM_USE_DYNAMIC_DEBUG=N, just pass null.

Note: desc->class_id is redundant with category parameter, but its
availability is dependent on desc.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 23 +++++++++++++----------
 include/drm/drm_print.h     | 22 +++++++++++-----------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 1b11a15366b7..1752b40b0189 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -265,8 +265,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		   const char *format, ...)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -274,22 +274,25 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
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
+		if (desc->flags && _DPRINTK_FLAGS_PRINT)
+			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
+				   __builtin_return_address(0), &vaf);
+	} else {
+		if (desc->flags && _DPRINTK_FLAGS_PRINT)
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
index ccd177236ab3..fc0f2f6c2b91 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -366,9 +366,9 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
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
@@ -418,11 +418,11 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
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
@@ -525,17 +525,17 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
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
2.35.3

