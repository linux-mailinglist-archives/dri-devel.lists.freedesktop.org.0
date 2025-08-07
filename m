Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414FB1DC30
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B025B10E886;
	Thu,  7 Aug 2025 17:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="HMOZuFAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F4910E88A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:07 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-23ffa7b3b30so11579945ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586186; x=1755190986;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/vVJTa/tFsjVSRtfTZahsa6AI9LmrBik4WEX3+gxMw=;
 b=HMOZuFAJrM21OtZ9cyLw89+4fhNa9J5jFOVhVAcW1ymKryXN477Y9fh8N5cdOcHji6
 SjLOrOkebO+tx1CPgK0Q+N12nT3mHjvh5G2UBBwLgz6afvvubsbdmIB1WoJNHtx/sKFH
 3X0233wVK++Bx2PbHQqfm7RdB4dbiNHXboeME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586187; x=1755190987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/vVJTa/tFsjVSRtfTZahsa6AI9LmrBik4WEX3+gxMw=;
 b=V4zZNUl+Z9bqziTvycJQfGHHehIzLeBDOzYyNPP5pjQWw9DLyMbBRdzT6saad3zhSZ
 tOSrzmK/hKz2YJ+Vb/HOlAFbauHi+ChOjmRAjNJl3YOG0AEdgB8X+U70ZbiZbFPyPG0Q
 EH51GfpZ4GV3riJV9xd/7M9/6tGhxngQ8bI8N+kvQnse1eqg2vA1uS2xmcyFT4fizqWM
 szRpw91ZJKFBHkIzBSTcNZ+y4Dq544Rrm3Ho521ckCDR6IryP3H8V5BRTVEI+t8n/26O
 aqQ8E6TCwEIbERFV9sJyxTUuOYQyhXCOWpIFE3v2IxZsfKRU0RuNRArJR5OsmTRVGCyf
 4Y3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM4HUFV3Y7l2yQkRodSNs89V35M49ylSfmEuUXJNvUnsPV5uWk+VDpJFG8unnDwliTNa5gFWFYyEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxTw6yE7/mebL7XkhWZXrnx+MhRU2/+JNT26tN9XDrWtkbWqfP
 FYWORmBZa2fokNuNT5QZNS7sL4cbkPicQAdlZ8epUVHkCDQN8ITKKu5E/Z9mL30rmVc=
X-Gm-Gg: ASbGncsWpXSjruW4sBvBmJi1Dxo4UXcrDS5BVSwD8KXlonWXKuJAEYPZtUuhjmK10cC
 LSVBksbUUWPXm/tSdHwwbRM5exFjEWDyMPQZ1aDET8Tl7aGMFnl4QP15UzaUsDLxWAlfiK1Z/J5
 FxceGhgYPas7GmF8e3K8d8LbrOqqkE+UhdrF0p2W0jy7+jx581qH620txMpTZDmUMzAoFHKxXPy
 LoroPMPe/vJAVaRLZCk+BjYf9IYd6iuiBHijLsn1rRqgoAMn6v0HaJA3B3VzWVnCucXtBejBl38
 UD2DBwHiwL/EU84pdadqp8rAsIL3jacnE7TQ8Sp3QTDh2X0sI11I/2Gz2pH67palbOv45IRTd3N
 xEh7EV8Q+8YvJsXSufE8sfaHKidyZTHHc
X-Google-Smtp-Source: AGHT+IFp1m/DrCOmq88z7uFswjYlbTehzW0HMCnhYHRvk1qN12L5ayeqG/8pXzDCUOkh5ocvz9bcNg==
X-Received: by 2002:a17:903:2347:b0:240:49e8:1d38 with SMTP id
 d9443c01a7336-242a0b3e6b9mr100089235ad.35.1754586186357; 
 Thu, 07 Aug 2025 10:03:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:05 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 1/9 v2] drm/i915: Move struct_mutex to drm_i915_private
Date: Thu,  7 Aug 2025 14:02:00 -0300
Message-ID: <20250807170212.285385-2-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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
index e8a04e476c57..7135fdb0ebb4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -678,7 +678,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
 		return -EINVAL;
 
-	mutex_lock(&i915->drm.struct_mutex);
+	mutex_lock(&i915->struct_mutex);
 
 	if (log->level == level)
 		goto out_unlock;
@@ -696,7 +696,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
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
index 4e4e89746aa6..6093dbaf4009 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -222,6 +222,17 @@ struct drm_i915_private {
 
 	bool irqs_enabled;
 
+	/*
+	 * Currently, struct_mutex is only used by the i915 driver as a replacement
+	 * for BKL. 
+	 * 
+	 * For this reason, it is no longer part of struct drm_device.
+	*/
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

