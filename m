Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EECE128869
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26026E434;
	Sat, 21 Dec 2019 09:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F6E6E433
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:14 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y1so8887243lfb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ZuQyKqz34oFckcd2mFhJSLF/pZbMU6cTALMsZuI4Vs=;
 b=Qqh3Xg4cUqUm8uRlmlZB/l0m5JVPF0W+iTpe3tBxjpfUt/61RQoTNM8iGkkJcPZdkW
 Xki/D6mDgvRz21UEKg5WmzURs0DLY9erocpbJf05YdGvENzyQt5McE4CUGRdhe58L7Ex
 MCHdFD6NhH+gTYfIb+HykirYXSxf7n+BrhwIE8SJxSOGpnyxVYS/Vikb/o1V+lPPY72E
 1PoqIrtL4z6ssIXpzZsBerF2zB7e1xpF3X5jGAQhIy4wKvO7hHE26jFUVktLS3rLQuzN
 wUKFQdUqwC7ICTAPqNPYpSrAZBkpAXIcNgRPUVB1aOPB1bU2DE3jdttrIGw7IrPooLrl
 iuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4ZuQyKqz34oFckcd2mFhJSLF/pZbMU6cTALMsZuI4Vs=;
 b=tT5gTC0mVMVDLgPQ494gzkIpFOoKzXeMzFnzhHULp+0CE7GLggxEiHP0aKNn8ltKUr
 NKQO/rXXUEuxDEr3ecviMS+k5Kh4M6ZBsX6JlX6KW1SU+z7/2gheaT1Kf4Nv5u4dlwoI
 VSAvpakV6Mn2qQf1YxPQXLMExUc3Slqx+3rwEB1XH/vRDChPrVzx26pv2nLBPEdVk1HK
 nTliPg72miQmcONvSbpmqgA2BsPrhVQlTV1DON6xqauA+Q+eWb4j3TmR4cYzUZcOH+Xf
 XutYdqWME5kjxhHHFsLBY6y3Klu2cWc0IJiuzz13Md/eLWEChBYEPPagjrjcqMRFRoto
 GISQ==
X-Gm-Message-State: APjAAAUJL+ZiBjRC8Zeh557U/kW8mlpezx/5gmQIpc+DFr+3VNQM9jTe
 JGSLc0kQZUEY9/DlVm597TztCwJQYbM=
X-Google-Smtp-Source: APXvYqz2lTvWJPeDh9Oz7HfLHRGWhpko466fFO+f7byIca7x05LXc8aEuo/DCWH3p+JiwgUXzzVUoA==
X-Received: by 2002:a19:cc49:: with SMTP id c70mr11868847lfg.73.1576922173122; 
 Sat, 21 Dec 2019 01:56:13 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:12 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 5/8] drm/print: rename drm_dev_dbg
Date: Sat, 21 Dec 2019 10:55:50 +0100
Message-Id: <20191221095553.13332-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221095553.13332-1-sam@ravnborg.org>
References: <20191221095553.13332-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename drm_dev_dbg to the internal name __drm_dev_dbg.
This will make room for a new logging macro with the same name.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_print.c |  6 +++---
 include/drm/drm_print.h     | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 111b932cf2a9..fd70205f8c5c 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -256,8 +256,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...)
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -278,7 +278,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 	va_end(args);
 }
-EXPORT_SYMBOL(drm_dev_dbg);
+EXPORT_SYMBOL(__drm_dev_dbg);
 
 void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index c9fa06b517cc..7c0b93e6cb80 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -482,8 +482,8 @@ __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
 __printf(3, 4)
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...);
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...);
 
 /**
  * Error output.
@@ -529,19 +529,19 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG(dev, fmt, ...)					\
-	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_PRIME(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_ATOMIC,	fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(dev, DRM_UT_ATOMIC,	fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_VBL(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
 #define	DRM_DEV_DEBUG_DP(dev, fmt, ...)					\
-	drm_dev_dbg(dev, DRM_UT_DP, fmt, ## __VA_ARGS__)
+	__drm_dev_dbg(dev, DRM_UT_DP, fmt, ## __VA_ARGS__)
 
 #define _DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, category, fmt, ...)	\
 ({									\
@@ -549,7 +549,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 				      DEFAULT_RATELIMIT_INTERVAL,	\
 				      DEFAULT_RATELIMIT_BURST);		\
 	if (__ratelimit(&_rs))						\
-		drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
+		__drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
 })
 
 /**
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
