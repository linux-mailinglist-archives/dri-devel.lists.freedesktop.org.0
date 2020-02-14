Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61B15D450
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 10:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9B6F8DA;
	Fri, 14 Feb 2020 09:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B576F8DA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 09:04:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a5so9131607wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 01:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0v/m89CS7jvLBM4DbZethDRgVeH1F4LDighGgaHJ7h4=;
 b=hHsh984YrWqbeqzkbStAVKFkv67+EK1FlbMnkEWmupwFNjC/k1LX8XTJmvK0aW2DW3
 /8uQb5X9Q1gQZ9Lcjs3eAdZvNxAJLP6XN9OnLJJKBc2topm8FviNXboP5XhAE5fuBang
 ou05EdZL4vrBd10j/9BOZR8phUO7FO4LiI5oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0v/m89CS7jvLBM4DbZethDRgVeH1F4LDighGgaHJ7h4=;
 b=Q4qvA5ONpNlwf2jX44obzGLXwVfHzSOzMcq9nFf98g5MI/TGji0DnsqGqLtbpPggg5
 6YeYy9uIvz/bAUtaBKvsu0sz9y3HavZIgOD5MJ58AjS+x+LOlptIemwDu26huVpPAQf6
 V6ioNaUoXxF/WBpmkEvPnrFXHEf7772AncSLdEVbzz4G3opYOI4CFOmg5Yt2vo5fLQcO
 OHwDk/veFgdQ+jqzvYESwDEPaCgLE3qXmixYm1QMQLHcU3fR6rjwgcCGJa0hQxASNej0
 tjagOunIM3AdsRnfrbI2G0KJ6qt3UsGaNnWRFskSVIegcm/tJ3ZFsqZZ5v2Gnxm7k3x7
 5zcQ==
X-Gm-Message-State: APjAAAW6N68CFfXAjlYUnlfpMQvZJ4GAuTv5G2abqUzxdbi7GgtUTzOG
 CD1hGZaGljL6dYLR/+dM69OEcnAdaGY=
X-Google-Smtp-Source: APXvYqwguCoCPmsAe0bmgyREoXtGUGEcAgdJNrN2nAozP24gO/Umgg3Kmoh/+e3ngclpNxxkD3PXcA==
X-Received: by 2002:a1c:9646:: with SMTP id y67mr3432555wmd.42.1581671074352; 
 Fri, 14 Feb 2020 01:04:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 4sm6284120wmg.22.2020.02.14.01.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 01:04:33 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/print: Delete a few unused shouting macros
Date: Fri, 14 Feb 2020 10:04:28 +0100
Message-Id: <20200214090428.2929833-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to go over to the new lowercase ones, encourage that a bit
more.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_managed.c | 21 +++++++++++++++++++++
 include/drm/drm_print.h       | 26 --------------------------
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index ea49071b16ee..7d4827b79806 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -38,4 +38,25 @@ struct drmres {
 	u8 __aligned(ARCH_KMALLOC_MINALIGN) data[];
 };
 
+static __always_inline struct drmres * alloc_dr(drmres_release_t release,
+						size_t size, gfp_t gfp, int nid)
+{
+	size_t tot_size;
+	struct drmres *dr;
+
+	/* We must catch any near-SIZE_MAX cases that could overflow. */
+	if (unlikely(check_add_overflow(sizeof(*dr), size, &tot_size)))
+		return NULL;
+
+	dr = kmalloc_node_track_caller(tot_size, gfp, nid);
+	if (unlikely(!dr))
+		return NULL;
+
+	memset(dr, 0, offsetof(struct drmres, data));
+
+	INIT_LIST_HEAD(&dr->node.entry);
+	dr->node.release = release;
+	return dr;
+}
+
 
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 894a0b9437e2..fd6ba2532f50 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -382,14 +382,6 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
 	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
-#define DRM_DEV_DEBUG_PRIME(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
-#define DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_ATOMIC,	fmt, ##__VA_ARGS__)
-#define DRM_DEV_DEBUG_VBL(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
-#define	DRM_DEV_DEBUG_DP(dev, fmt, ...)					\
-	drm_dev_dbg(dev, DRM_UT_DP, fmt, ## __VA_ARGS__)
 
 #define _DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, category, fmt, ...)	\
 ({									\
@@ -406,18 +398,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @dev: device pointer
  * @fmt: printf() like format string.
  */
-#define DRM_DEV_DEBUG_RATELIMITED(dev, fmt, ...)			\
-	_DEV_DRM_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_CORE,		\
-					  fmt, ##__VA_ARGS__)
-#define DRM_DEV_DEBUG_DRIVER_RATELIMITED(dev, fmt, ...)			\
-	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_DRIVER,		\
-					  fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)			\
 	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_KMS,		\
 					  fmt, ##__VA_ARGS__)
-#define DRM_DEV_DEBUG_PRIME_RATELIMITED(dev, fmt, ...)			\
-	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_PRIME,		\
-					  fmt, ##__VA_ARGS__)
 
 /*
  * struct drm_device based logging
@@ -541,18 +524,9 @@ void __drm_err(const char *format, ...);
 	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
 
 
-#define DRM_DEBUG_RATELIMITED(fmt, ...)					\
-	DRM_DEV_DEBUG_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_DRIVER_RATELIMITED(fmt, ...)				\
-	DRM_DEV_DEBUG_DRIVER_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
-
 #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
 	DRM_DEV_DEBUG_KMS_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
 
-#define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)				\
-	DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
-
 /*
  * struct drm_device based WARNs
  *
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
