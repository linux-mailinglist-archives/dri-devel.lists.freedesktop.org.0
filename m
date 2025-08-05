Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC3B1B6B0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6637B10E47C;
	Tue,  5 Aug 2025 14:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="iNqtzaRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6810E47E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:39:39 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so5123058b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754404779; x=1755009579;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qcTqVycTTup5GduvxXsiBeHA8ZjiEtTkGUuCwHjlKU=;
 b=iNqtzaRwHTDaLcK8AAyqTYn92f4daFMQrm+wsxYtPs3VNs+fmI5pHJfjG2wbKmi6jp
 1jaA6J7vMha+sxN4hb91zyTB3lLznRc6jSnfO4ePqXNNH7GwUIUSuLQLmq1HuxbhLCJz
 z7qYQYjvLVf0a2VW4FuWoFHEyAcattNgyfn/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404779; x=1755009579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qcTqVycTTup5GduvxXsiBeHA8ZjiEtTkGUuCwHjlKU=;
 b=o/wgCETFqI/EHoLjMiZnnzN+sFeQyaDWDDa86oBotaGSvUl/dhDsWhHKg4FApi8KqW
 GAszUKLnHcC2ZGQi0MTqZTCskiPvrhQCvJz39p+0G5ql07TIi58HMBCV5aiJzxgCbIXc
 0iU4fca3RQdtHaoidIqqsxNLB+aDW512M7MvDkjJkM5lJoPGMbcdfX8sg2oIOPFPDn3M
 9xlYCOYBkPYJ1TIwQpZsCxPBdOT0Y/FumQKuvFQnJApumCZtv9N2sXL8umSdAAkECzTc
 duKCEUTRvv1V2YdTXLrQzzTFKLfrU1ICTwJsyj8WuPRuwx5D/rB2ElMX+2+T8Dc6RlPc
 8mUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcsADkI53AhYI5Kn/NXRq7RvvcD8XOAL/w3lbBUpdKMwTURQXwIy2pqFO5PvvjARX/g0aM279DOCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRURc92nbYZ3apSH0jU84qOjbU555diLibeNtAuchwJNTNF7Tk
 aZRVfm2qadCLtRQ62DY9I6vNK/pTwskUIA2T+lIjq4/Hn7MHxsjFSQNaOpu8G8jYn4k=
X-Gm-Gg: ASbGncvla9w/htwV7TuH2OOyAqHWVqt0k+nKjhfYbHJx+OUIo/Q7AeFMmgo1JujDbqj
 sQfi9StknqRz067rEJGQSUgkZxbRaCAFqzfAyJLm8xxQn0JmJ5OTFhMHlmBgekNDzu4dUiEEPk9
 CYXFIzf0VklnAatMHOeF2RjRyR91vFCl2r7C/pMGURTNpOm+SnQaIllLqknF6mr0vAqb1kgOD1m
 i6vr7xPmmEEYkW6ilu3i7VcLAnXOIveS0Pie912qwC3t9ArPVzu/MdB3MHPHPbTT9pHedFmrO6j
 RGCtOCksVJRsbQhycpDRvuv/Pu+R5tfwPMXUKg7hcBmLKIGWNDsM2upL1UTGxGKg6OgYAvMJuRB
 N1f27yN4rkbRWk+sXnlgml8/dxOwcOirN
X-Google-Smtp-Source: AGHT+IETRhLOJ0cv/RcEpf49OGySvOSVTdh1I4zyOH+Mp5N7u4gYJqlPDEmY11JSgM8I63iUVEI47A==
X-Received: by 2002:a05:6a20:7d9c:b0:232:36e3:9a4e with SMTP id
 adf61e73a8af0-23df917c223mr21500603637.40.1754404779157; 
 Tue, 05 Aug 2025 07:39:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf1c6d5dcsm7899757b3a.74.2025.08.05.07.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:39:38 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 1/9] drm/i915: Move struct_mutex to drm_i915_private
Date: Tue,  5 Aug 2025 11:38:56 -0300
Message-ID: <20250805143908.32343-2-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
References: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
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
 drivers/gpu/drm/i915/i915_drv.h            |  8 ++++++++
 drivers/gpu/drm/i915/i915_irq.c            |  4 ++--
 include/drm/drm_device.h                   | 10 ----------
 6 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 56dd61f8e05a..26c520b35b05 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -683,7 +683,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
-	mutex_destroy(&dev->struct_mutex);
 }
 
 static int drm_dev_init(struct drm_device *dev,
@@ -724,7 +723,6 @@ static int drm_dev_init(struct drm_device *dev,
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
index 273bc43468a0..46b13ab113b0 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -238,6 +238,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_sbi_init(dev_priv);
 	vlv_iosf_sb_init(dev_priv);
+	mutex_init(&dev_priv->struct_mutex);
 	mutex_init(&dev_priv->sb_lock);
 
 	i915_memcpy_init_early(dev_priv);
@@ -296,6 +297,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	i915_workqueues_cleanup(dev_priv);
 
 	mutex_destroy(&dev_priv->sb_lock);
+	mutex_destroy(&dev_priv->struct_mutex);
 	vlv_iosf_sb_fini(dev_priv);
 	intel_sbi_fini(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d0e1980dcba2..0384dae6fa97 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -224,6 +224,14 @@ struct drm_i915_private {
 
 	bool irqs_enabled;
 
+	/*
+	 * Currently, struct_mutex is only used by the i915 driver as a replacement
+	 * for BKL. 
+	 * 
+	 * For this reason, it is no longer part of struct drm_device.
+	*/
+	struct mutex struct_mutex;
+
 	/* LPT/WPT IOSF sideband protection */
 	struct mutex sbi_lock;
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 95042879bec4..7b29062fed50 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -166,7 +166,7 @@ static void ivb_parity_work(struct work_struct *work)
 	 * In order to prevent a get/put style interface, acquire struct mutex
 	 * any time we access those registers.
 	 */
-	mutex_lock(&dev_priv->drm.struct_mutex);
+	mutex_lock(&dev_priv->struct_mutex);
 
 	/* If we've screwed up tracking, just let the interrupt fire again */
 	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
@@ -224,7 +224,7 @@ static void ivb_parity_work(struct work_struct *work)
 	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
 	spin_unlock_irq(gt->irq_lock);
 
-	mutex_unlock(&dev_priv->drm.struct_mutex);
+	mutex_unlock(&dev_priv->struct_mutex);
 }
 
 static irqreturn_t valleyview_irq_handler(int irq, void *arg)
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index e2f894f1b90a..c374c58fb975 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -177,16 +177,6 @@ struct drm_device {
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

