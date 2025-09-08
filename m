Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD25B48D17
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8E110E4E0;
	Mon,  8 Sep 2025 12:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="onBOIveH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D781210E4E3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:15:36 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-3277c603b83so2637661a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1757333736; x=1757938536;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w30obqw5UNSOW5Yq5QqWzZLB120DIDhi8ZnxPt7eg6M=;
 b=onBOIveHXTgI3uJdTKjeNDCkfUi8rBaKIi7S83WgKOmOxUyowHFzw6hMgsvHU8I7SS
 OJrIs0YSwWGXT11QDGyQ7oDl7a0+AFJ4qCXuCo4ap0EZh/eumb4RCXqxOuEz/v2d6/bI
 z4/o8BWG28krrWJQgvo5GPShTtVsAqXKLU0yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333736; x=1757938536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w30obqw5UNSOW5Yq5QqWzZLB120DIDhi8ZnxPt7eg6M=;
 b=E6LBoJEhLx4rwpT8MtjDAHMWrUHcxTYvomgFRePDGtNehjqQQd3p46Ow37wERgakcl
 XTenxUAgwLXQmo7n7jdSmyWpi27TFVMt8rHo6uZei6FeJOY7o+ftWWhFYkSs4socmhjl
 hYNlvl7zBG5HYsfVqNw06PJ4+1gAVbwnOtR23nR+VWV95Kpp338ERWwGeVBB8iPOhq5O
 2lycawwZB8t73fvbATvOe1aLQcAmTivj9mn7pR07DucEJ9rG+X4q/LFmxi+Xximt7nc/
 XuX7Ag8phlOpxUlmyPgKE9tqVcEOMKDRRYbajebCZ23/I0NcwvF1T6hdilHfRPzeT/u3
 ec6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdlk5iV7rPybvmP4sZqfYnrJSc88U6OSi7P1f7STVJt0d7YrtpRSnMRgSmfSla+Zfq7SSVrz1EWx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5mZJABArUcmfiugZkliScqmu7qUqN/dPmc7Axa0EfjhWWq6E6
 MyUWgA+eOdD3RWy1LM4MBlqaGbR7kSmmnL7aKLjavaQj0fGbvy8bz5jJQPYMDGIFVRvgMACDtPh
 H/Kv/5+uQ7/UJ
X-Gm-Gg: ASbGncvHS14jEqQdckc8yPFMkr3dbX1d+PrOS/fJ1zB1QVF1hidtdCninO6+YgiMS/H
 vL0PXmFk0BJI44zHCkm1COK4/IWtvkNUDT3A9TmuWb+HodBfgzReT/4/2YAAm4k2FyhQTCYD5Sd
 98W2xl+YdogxCJkGokvPi2d7NuLwe0/CKY/TN0vI2Axkzjq4RlO5QRogDnv7xd9AH37d/95bFi9
 BynKgBaTOedCAFkMQ/oP2SZEoKjpzhAlm95VEhce7LnEKL9v4GiESCYFTimZ8Q8C9BbPM5I5nM8
 P4k9SExbyTWPYpsd0x3EsfTQkGniUljLwUGr71pSYNty3A8ld6czt6YXkc8JCwP099Id+cQ3vgK
 k40OMsgW/DYemVhQdzbEk1ki8ZOzMmzfWddeBFZX3D+Y=
X-Google-Smtp-Source: AGHT+IGDPy8WOUoQotfSnI1nwK5zU3Xm0xHpjMSr0Es/1rePHzKTmdI7l7Dqtyuiy3cFuD+L5mg48w==
X-Received: by 2002:a17:90b:3e47:b0:32b:d502:7005 with SMTP id
 98e67ed59e1d1-32d43f0022fmr9281946a91.11.1757333736364; 
 Mon, 08 Sep 2025 05:15:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:943d::1709])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm28345188b3a.75.2025.09.08.05.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:15:35 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 1/9 v4] drm/i915: Move struct_mutex to drm_i915_private
Date: Mon,  8 Sep 2025 09:15:09 -0400
Message-ID: <20250908131518.36625-2-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
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

Move legacy BKL struct_mutex from drm_device to drm_i915_private, which
is the last remaining user.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/drm_drv.c                  |  2 --
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
 drivers/gpu/drm/i915/i915_driver.c         |  2 ++
 drivers/gpu/drm/i915/i915_drv.h            | 11 +++++++++++
 drivers/gpu/drm/i915/i915_irq.c            |  4 ++--
 include/drm/drm_device.h                   | 10 ----------
 6 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index cdd591b11488..ad3aee354ba3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -694,7 +694,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
-	mutex_destroy(&dev->struct_mutex);
 }
 
 static int drm_dev_init(struct drm_device *dev,
@@ -735,7 +734,6 @@ static int drm_dev_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&dev->vblank_event_list);
 
 	spin_lock_init(&dev->event_lock);
-	mutex_init(&dev->struct_mutex);
 	mutex_init(&dev->filelist_mutex);
 	mutex_init(&dev->clientlist_mutex);
 	mutex_init(&dev->master_mutex);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 09a64f224c49..65ffcaeee4b9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -677,7 +677,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
 		return -EINVAL;
 
-	mutex_lock(&i915->drm.struct_mutex);
+	mutex_lock(&i915->struct_mutex);
 
 	if (log->level == level)
 		goto out_unlock;
@@ -695,7 +695,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 	log->level = level;
 
 out_unlock:
-	mutex_unlock(&i915->drm.struct_mutex);
+	mutex_unlock(&i915->struct_mutex);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c6263c6d3384..d1559fd8ad3d 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -233,6 +233,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_sbi_init(display);
 	vlv_iosf_sb_init(dev_priv);
+	mutex_init(&dev_priv->struct_mutex);
 	mutex_init(&dev_priv->sb_lock);
 
 	i915_memcpy_init_early(dev_priv);
@@ -291,6 +292,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	i915_workqueues_cleanup(dev_priv);
 
 	mutex_destroy(&dev_priv->sb_lock);
+	mutex_destroy(&dev_priv->struct_mutex);
 	vlv_iosf_sb_fini(dev_priv);
 	intel_sbi_fini(display);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 4e4e89746aa6..15f66a7d496d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -222,6 +222,17 @@ struct drm_i915_private {
 
 	bool irqs_enabled;
 
+	/*
+	 * Currently, struct_mutex is only used by the i915 driver as a replacement
+	 * for BKL.
+	 *
+	 * For this reason, it is no longer part of struct drm_device.
+	 */
+	struct mutex struct_mutex;
+
+	/* LPT/WPT IOSF sideband protection */
+	struct mutex sbi_lock;
+
 	/* VLV/CHV IOSF sideband */
 	struct {
 		struct mutex lock; /* protect sideband access */
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 191ed8bb1d9c..cdfb09464134 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -167,7 +167,7 @@ static void ivb_parity_work(struct work_struct *work)
 	 * In order to prevent a get/put style interface, acquire struct mutex
 	 * any time we access those registers.
 	 */
-	mutex_lock(&dev_priv->drm.struct_mutex);
+	mutex_lock(&dev_priv->struct_mutex);
 
 	/* If we've screwed up tracking, just let the interrupt fire again */
 	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
@@ -225,7 +225,7 @@ static void ivb_parity_work(struct work_struct *work)
 	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
 	spin_unlock_irq(gt->irq_lock);
 
-	mutex_unlock(&dev_priv->drm.struct_mutex);
+	mutex_unlock(&dev_priv->struct_mutex);
 }
 
 static irqreturn_t valleyview_irq_handler(int irq, void *arg)
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index a33aedd5e9ec..016df5529d46 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -188,16 +188,6 @@ struct drm_device {
 	/** @unique: Unique name of the device */
 	char *unique;
 
-	/**
-	 * @struct_mutex:
-	 *
-	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
-	 *
-	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
-	 *       lock into i915, which is the only remaining user.
-	 */
-	struct mutex struct_mutex;
-
 	/**
 	 * @master_mutex:
 	 *
-- 
2.50.1

