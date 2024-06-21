Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EAB912775
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 16:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738E810F1AF;
	Fri, 21 Jun 2024 14:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kN2nib/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942BF10F1AF;
 Fri, 21 Jun 2024 14:20:09 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5b97a9a9b4bso997826eaf.0; 
 Fri, 21 Jun 2024 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718979608; x=1719584408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rb6vrNsI+sUcv3zenBCpoQAQJhiSVn8vGlV4MYC034M=;
 b=kN2nib/Cl0kIwIItDMt8ImV8nnIyTnTEM93JD55G1KSYApdHQadQV4kRn8aARZs1/j
 u/hzv7yNFngJ4eiZUHpy1KGTqXDZ87RUWdQmKj8sb59LkDc6fc7xRXRgC0GYpdYpTSFb
 NgvbhCDRop3AViVjkurn9b+tDI7OXVcMDCg48E52dJxMkHZCqAyYMRHgRo6WOAsPAFk1
 HxGnKJqZG4u2tuooOFCXAxRgLFlMEatHscbjO3ZQT2cYlbU/WSi6f0jzbYvXY9BCwDY0
 HtEdpTIIoFKy3fZCAGwleVAX/RkgpJ2E1BGijKw1pNL/im3YgRs3e/uaHrNnNbPOQpDF
 +wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718979608; x=1719584408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rb6vrNsI+sUcv3zenBCpoQAQJhiSVn8vGlV4MYC034M=;
 b=GSbD5FcU+Agg0nFuIrsXR6ndR3tZCTIV8qJQaSltUCOfZ1XpnFb2IFxkYUMIquNFEY
 CGYqpxMaw6YbdrfW31fgvg1AhJNg4XmTPNPBmBn+mbGf7PN5TsdkY47e+oklpOKBvFz+
 qbNJaIdFVTZxgrGcLNnAsG4VQ3nrnLvcTbODXJmy9CcDrrF+jjLgQRDNjExA3/5z3zEz
 wCRJUSBatGikmc1EdNJELSG2lOz9qgO0XHSknk3s23MTu0xEnEgPvxtaM+nW2uzFJ6lC
 fhh4l4BcPUsWncCQhviP0gunSpLN5vHqN1K7UQwAfuOZMnGpPeGJ7F7xx8e2pi2llrmf
 sJHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXaS+N8LlIzSwP+HlP63GENf2FnG5tgc0KT6kbrCQhpCLw+gYzscnM/18HQ7f9miqcKBB1PCzVE43SWpVf8N+XD5IknzC6esosh3QM8zDipeX9+afvi8iBoBwCJVw2Jc9t8yIXLcX+WaQzX3TDWQ==
X-Gm-Message-State: AOJu0YxGQOhbRe12oSr383vg7MeqLeSmcXCOx28WlvPYT/uyLteDiQMP
 wXx3vxJ3HNuS2K9mFgTKndqFTRwZWVRmFh6GoI6mjadeHp1UxX6i
X-Google-Smtp-Source: AGHT+IFwsMcD8pzJwd1suWiclyj8pentR2z6Ha2+3MeWFkpKGqVN9E+Esgs3SaYGFV7kSaCUTdHpEA==
X-Received: by 2002:a05:6359:4c8d:b0:199:2a1a:19d5 with SMTP id
 e5c5f4694b2df-1a1fd3c652fmr1030717455d.9.1718979608294; 
 Fri, 21 Jun 2024 07:20:08 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon4859w-grc-48-142-198-217-108.dsl.bell.ca. [142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce933e28sm89294085a.120.2024.06.21.07.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:20:07 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/7] drm/radeon: rdev->ddev to rdev_to_drm(rdev) 4
Date: Fri, 21 Jun 2024 10:19:50 -0400
Message-ID: <20240621141953.20081-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Please see Patch v2 1/7 for details.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_device.c  | 19 +++----
 drivers/gpu/drm/radeon/radeon_display.c | 74 ++++++++++++-------------
 drivers/gpu/drm/radeon/radeon_fbdev.c   | 26 ++++-----
 drivers/gpu/drm/radeon/radeon_fence.c   |  8 +--
 drivers/gpu/drm/radeon/radeon_gem.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_i2c.c     |  2 +-
 6 files changed, 63 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index afbb3a80c0c6..127d8fd7f7cd 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -760,7 +760,7 @@ bool radeon_boot_test_post_card(struct radeon_device *rdev)
 		if (rdev->is_atom_bios)
 			atom_asic_init(rdev->mode_info.atom_context);
 		else
-			radeon_combios_asic_init(rdev->ddev);
+			radeon_combios_asic_init(rdev_to_drm(rdev));
 		return true;
 	} else {
 		dev_err(rdev->dev, "Card not posted and no BIOS - ignoring\n");
@@ -980,7 +980,7 @@ int radeon_atombios_init(struct radeon_device *rdev)
 		return -ENOMEM;
 
 	rdev->mode_info.atom_card_info = atom_card_info;
-	atom_card_info->dev = rdev->ddev;
+	atom_card_info->dev = rdev_to_drm(rdev);
 	atom_card_info->reg_read = cail_reg_read;
 	atom_card_info->reg_write = cail_reg_write;
 	/* needed for iio ops */
@@ -1005,7 +1005,7 @@ int radeon_atombios_init(struct radeon_device *rdev)
 
 	mutex_init(&rdev->mode_info.atom_context->mutex);
 	mutex_init(&rdev->mode_info.atom_context->scratch_mutex);
-	radeon_atom_initialize_bios_scratch_regs(rdev->ddev);
+	radeon_atom_initialize_bios_scratch_regs(rdev_to_drm(rdev));
 	atom_allocate_fb_scratch(rdev->mode_info.atom_context);
 	return 0;
 }
@@ -1049,7 +1049,7 @@ void radeon_atombios_fini(struct radeon_device *rdev)
  */
 int radeon_combios_init(struct radeon_device *rdev)
 {
-	radeon_combios_initialize_bios_scratch_regs(rdev->ddev);
+	radeon_combios_initialize_bios_scratch_regs(rdev_to_drm(rdev));
 	return 0;
 }
 
@@ -1267,8 +1267,6 @@ static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
  * radeon_device_init - initialize the driver
  *
  * @rdev: radeon_device pointer
- * @ddev: drm dev pointer
- * @pdev: pci dev pointer
  * @flags: driver flags
  *
  * Initializes the driver info and hw (all asics).
@@ -1276,18 +1274,15 @@ static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
  * Called at driver startup.
  */
 int radeon_device_init(struct radeon_device *rdev,
-		       struct drm_device *ddev,
-		       struct pci_dev *pdev,
 		       uint32_t flags)
 {
+	struct pci_dev *pdev = rdev->pdev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	int r, i;
 	int dma_bits;
 	bool runtime = false;
 
 	rdev->shutdown = false;
-	rdev->dev = &pdev->dev;
-	rdev->ddev = ddev;
-	rdev->pdev = pdev;
 	rdev->flags = flags;
 	rdev->family = flags & RADEON_FAMILY_MASK;
 	rdev->is_atom_bios = false;
@@ -1847,7 +1842,7 @@ int radeon_gpu_reset(struct radeon_device *rdev)
 
 	downgrade_write(&rdev->exclusive_lock);
 
-	drm_helper_resume_force_mode(rdev->ddev);
+	drm_helper_resume_force_mode(rdev_to_drm(rdev));
 
 	/* set the power state here in case we are a PX system or headless */
 	if ((rdev->pm.pm_method == PM_METHOD_DPM) && rdev->pm.dpm_enabled)
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 843383f7237f..10fd58f400bc 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -302,13 +302,13 @@ void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id)
 	if ((radeon_use_pflipirq == 2) && ASIC_IS_DCE4(rdev))
 		return;
 
-	spin_lock_irqsave(&rdev->ddev->event_lock, flags);
+	spin_lock_irqsave(&rdev_to_drm(rdev)->event_lock, flags);
 	if (radeon_crtc->flip_status != RADEON_FLIP_SUBMITTED) {
 		DRM_DEBUG_DRIVER("radeon_crtc->flip_status = %d != "
 				 "RADEON_FLIP_SUBMITTED(%d)\n",
 				 radeon_crtc->flip_status,
 				 RADEON_FLIP_SUBMITTED);
-		spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
+		spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
 		return;
 	}
 
@@ -334,7 +334,7 @@ void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id)
 	 */
 	if (update_pending &&
 	    (DRM_SCANOUTPOS_VALID &
-	     radeon_get_crtc_scanoutpos(rdev->ddev, crtc_id,
+	     radeon_get_crtc_scanoutpos(rdev_to_drm(rdev), crtc_id,
 					GET_DISTANCE_TO_VBLANKSTART,
 					&vpos, &hpos, NULL, NULL,
 					&rdev->mode_info.crtcs[crtc_id]->base.hwmode)) &&
@@ -347,7 +347,7 @@ void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id)
 		 */
 		update_pending = 0;
 	}
-	spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
 	if (!update_pending)
 		radeon_crtc_handle_flip(rdev, crtc_id);
 }
@@ -370,14 +370,14 @@ void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id)
 	if (radeon_crtc == NULL)
 		return;
 
-	spin_lock_irqsave(&rdev->ddev->event_lock, flags);
+	spin_lock_irqsave(&rdev_to_drm(rdev)->event_lock, flags);
 	work = radeon_crtc->flip_work;
 	if (radeon_crtc->flip_status != RADEON_FLIP_SUBMITTED) {
 		DRM_DEBUG_DRIVER("radeon_crtc->flip_status = %d != "
 				 "RADEON_FLIP_SUBMITTED(%d)\n",
 				 radeon_crtc->flip_status,
 				 RADEON_FLIP_SUBMITTED);
-		spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
+		spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
 		return;
 	}
 
@@ -389,7 +389,7 @@ void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id)
 	if (work->event)
 		drm_crtc_send_vblank_event(&radeon_crtc->base, work->event);
 
-	spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
 
 	drm_crtc_vblank_put(&radeon_crtc->base);
 	radeon_irq_kms_pflip_irq_put(rdev, work->crtc_id);
@@ -408,7 +408,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
 	struct radeon_flip_work *work =
 		container_of(__work, struct radeon_flip_work, flip_work);
 	struct radeon_device *rdev = work->rdev;
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct radeon_crtc *radeon_crtc = rdev->mode_info.crtcs[work->crtc_id];
 
 	struct drm_crtc *crtc = &radeon_crtc->base;
@@ -1401,7 +1401,7 @@ static int radeon_modeset_create_props(struct radeon_device *rdev)
 
 	if (rdev->is_atom_bios) {
 		rdev->mode_info.coherent_mode_property =
-			drm_property_create_range(rdev->ddev, 0 , "coherent", 0, 1);
+			drm_property_create_range(rdev_to_drm(rdev), 0, "coherent", 0, 1);
 		if (!rdev->mode_info.coherent_mode_property)
 			return -ENOMEM;
 	}
@@ -1409,57 +1409,57 @@ static int radeon_modeset_create_props(struct radeon_device *rdev)
 	if (!ASIC_IS_AVIVO(rdev)) {
 		sz = ARRAY_SIZE(radeon_tmds_pll_enum_list);
 		rdev->mode_info.tmds_pll_property =
-			drm_property_create_enum(rdev->ddev, 0,
+			drm_property_create_enum(rdev_to_drm(rdev), 0,
 					    "tmds_pll",
 					    radeon_tmds_pll_enum_list, sz);
 	}
 
 	rdev->mode_info.load_detect_property =
-		drm_property_create_range(rdev->ddev, 0, "load detection", 0, 1);
+		drm_property_create_range(rdev_to_drm(rdev), 0, "load detection", 0, 1);
 	if (!rdev->mode_info.load_detect_property)
 		return -ENOMEM;
 
-	drm_mode_create_scaling_mode_property(rdev->ddev);
+	drm_mode_create_scaling_mode_property(rdev_to_drm(rdev));
 
 	sz = ARRAY_SIZE(radeon_tv_std_enum_list);
 	rdev->mode_info.tv_std_property =
-		drm_property_create_enum(rdev->ddev, 0,
+		drm_property_create_enum(rdev_to_drm(rdev), 0,
 				    "tv standard",
 				    radeon_tv_std_enum_list, sz);
 
 	sz = ARRAY_SIZE(radeon_underscan_enum_list);
 	rdev->mode_info.underscan_property =
-		drm_property_create_enum(rdev->ddev, 0,
+		drm_property_create_enum(rdev_to_drm(rdev), 0,
 				    "underscan",
 				    radeon_underscan_enum_list, sz);
 
 	rdev->mode_info.underscan_hborder_property =
-		drm_property_create_range(rdev->ddev, 0,
+		drm_property_create_range(rdev_to_drm(rdev), 0,
 					"underscan hborder", 0, 128);
 	if (!rdev->mode_info.underscan_hborder_property)
 		return -ENOMEM;
 
 	rdev->mode_info.underscan_vborder_property =
-		drm_property_create_range(rdev->ddev, 0,
+		drm_property_create_range(rdev_to_drm(rdev), 0,
 					"underscan vborder", 0, 128);
 	if (!rdev->mode_info.underscan_vborder_property)
 		return -ENOMEM;
 
 	sz = ARRAY_SIZE(radeon_audio_enum_list);
 	rdev->mode_info.audio_property =
-		drm_property_create_enum(rdev->ddev, 0,
+		drm_property_create_enum(rdev_to_drm(rdev), 0,
 					 "audio",
 					 radeon_audio_enum_list, sz);
 
 	sz = ARRAY_SIZE(radeon_dither_enum_list);
 	rdev->mode_info.dither_property =
-		drm_property_create_enum(rdev->ddev, 0,
+		drm_property_create_enum(rdev_to_drm(rdev), 0,
 					 "dither",
 					 radeon_dither_enum_list, sz);
 
 	sz = ARRAY_SIZE(radeon_output_csc_enum_list);
 	rdev->mode_info.output_csc_property =
-		drm_property_create_enum(rdev->ddev, 0,
+		drm_property_create_enum(rdev_to_drm(rdev), 0,
 					 "output_csc",
 					 radeon_output_csc_enum_list, sz);
 
@@ -1578,29 +1578,29 @@ int radeon_modeset_init(struct radeon_device *rdev)
 	int i;
 	int ret;
 
-	drm_mode_config_init(rdev->ddev);
+	drm_mode_config_init(rdev_to_drm(rdev));
 	rdev->mode_info.mode_config_initialized = true;
 
-	rdev->ddev->mode_config.funcs = &radeon_mode_funcs;
+	rdev_to_drm(rdev)->mode_config.funcs = &radeon_mode_funcs;
 
 	if (radeon_use_pflipirq == 2 && rdev->family >= CHIP_R600)
-		rdev->ddev->mode_config.async_page_flip = true;
+		rdev_to_drm(rdev)->mode_config.async_page_flip = true;
 
 	if (ASIC_IS_DCE5(rdev)) {
-		rdev->ddev->mode_config.max_width = 16384;
-		rdev->ddev->mode_config.max_height = 16384;
+		rdev_to_drm(rdev)->mode_config.max_width = 16384;
+		rdev_to_drm(rdev)->mode_config.max_height = 16384;
 	} else if (ASIC_IS_AVIVO(rdev)) {
-		rdev->ddev->mode_config.max_width = 8192;
-		rdev->ddev->mode_config.max_height = 8192;
+		rdev_to_drm(rdev)->mode_config.max_width = 8192;
+		rdev_to_drm(rdev)->mode_config.max_height = 8192;
 	} else {
-		rdev->ddev->mode_config.max_width = 4096;
-		rdev->ddev->mode_config.max_height = 4096;
+		rdev_to_drm(rdev)->mode_config.max_width = 4096;
+		rdev_to_drm(rdev)->mode_config.max_height = 4096;
 	}
 
-	rdev->ddev->mode_config.preferred_depth = 24;
-	rdev->ddev->mode_config.prefer_shadow = 1;
+	rdev_to_drm(rdev)->mode_config.preferred_depth = 24;
+	rdev_to_drm(rdev)->mode_config.prefer_shadow = 1;
 
-	rdev->ddev->mode_config.fb_modifiers_not_supported = true;
+	rdev_to_drm(rdev)->mode_config.fb_modifiers_not_supported = true;
 
 	ret = radeon_modeset_create_props(rdev);
 	if (ret) {
@@ -1618,11 +1618,11 @@ int radeon_modeset_init(struct radeon_device *rdev)
 
 	/* allocate crtcs */
 	for (i = 0; i < rdev->num_crtc; i++) {
-		radeon_crtc_init(rdev->ddev, i);
+		radeon_crtc_init(rdev_to_drm(rdev), i);
 	}
 
 	/* okay we should have all the bios connectors */
-	ret = radeon_setup_enc_conn(rdev->ddev);
+	ret = radeon_setup_enc_conn(rdev_to_drm(rdev));
 	if (!ret) {
 		return ret;
 	}
@@ -1639,7 +1639,7 @@ int radeon_modeset_init(struct radeon_device *rdev)
 	/* setup afmt */
 	radeon_afmt_init(rdev);
 
-	drm_kms_helper_poll_init(rdev->ddev);
+	drm_kms_helper_poll_init(rdev_to_drm(rdev));
 
 	/* do pm late init */
 	ret = radeon_pm_late_init(rdev);
@@ -1650,11 +1650,11 @@ int radeon_modeset_init(struct radeon_device *rdev)
 void radeon_modeset_fini(struct radeon_device *rdev)
 {
 	if (rdev->mode_info.mode_config_initialized) {
-		drm_kms_helper_poll_fini(rdev->ddev);
+		drm_kms_helper_poll_fini(rdev_to_drm(rdev));
 		radeon_hpd_fini(rdev);
-		drm_helper_force_disable_all(rdev->ddev);
+		drm_helper_force_disable_all(rdev_to_drm(rdev));
 		radeon_afmt_fini(rdev);
-		drm_mode_config_cleanup(rdev->ddev);
+		drm_mode_config_cleanup(rdev_to_drm(rdev));
 		rdev->mode_info.mode_config_initialized = false;
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 02bf25759059..fb70de29545c 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -67,7 +67,7 @@ static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
 	int height = mode_cmd->height;
 	u32 cpp;
 
-	info = drm_get_format_info(rdev->ddev, mode_cmd);
+	info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd);
 	cpp = info->cpp[0];
 
 	/* need to align pitch with crtc limits */
@@ -148,15 +148,15 @@ static int radeon_fbdev_fb_open(struct fb_info *info, int user)
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	int ret;
 
-	ret = pm_runtime_get_sync(rdev->ddev->dev);
+	ret = pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
 	if (ret < 0 && ret != -EACCES)
 		goto err_pm_runtime_mark_last_busy;
 
 	return 0;
 
 err_pm_runtime_mark_last_busy:
-	pm_runtime_mark_last_busy(rdev->ddev->dev);
-	pm_runtime_put_autosuspend(rdev->ddev->dev);
+	pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
+	pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 	return ret;
 }
 
@@ -165,8 +165,8 @@ static int radeon_fbdev_fb_release(struct fb_info *info, int user)
 	struct drm_fb_helper *fb_helper = info->par;
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 
-	pm_runtime_mark_last_busy(rdev->ddev->dev);
-	pm_runtime_put_autosuspend(rdev->ddev->dev);
+	pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
+	pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 
 	return 0;
 }
@@ -236,7 +236,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		ret = -ENOMEM;
 		goto err_radeon_fbdev_destroy_pinned_object;
 	}
-	ret = radeon_framebuffer_init(rdev->ddev, fb, &mode_cmd, gobj);
+	ret = radeon_framebuffer_init(rdev_to_drm(rdev), fb, &mode_cmd, gobj);
 	if (ret) {
 		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
 		goto err_kfree;
@@ -374,12 +374,12 @@ void radeon_fbdev_setup(struct radeon_device *rdev)
 	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
 	if (!fb_helper)
 		return;
-	drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
+	drm_fb_helper_prepare(rdev_to_drm(rdev), fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
 
-	ret = drm_client_init(rdev->ddev, &fb_helper->client, "radeon-fbdev",
+	ret = drm_client_init(rdev_to_drm(rdev), &fb_helper->client, "radeon-fbdev",
 			      &radeon_fbdev_client_funcs);
 	if (ret) {
-		drm_err(rdev->ddev, "Failed to register client: %d\n", ret);
+		drm_err(rdev_to_drm(rdev), "Failed to register client: %d\n", ret);
 		goto err_drm_client_init;
 	}
 
@@ -394,13 +394,13 @@ void radeon_fbdev_setup(struct radeon_device *rdev)
 
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
 {
-	if (rdev->ddev->fb_helper)
-		drm_fb_helper_set_suspend(rdev->ddev->fb_helper, state);
+	if (rdev_to_drm(rdev)->fb_helper)
+		drm_fb_helper_set_suspend(rdev_to_drm(rdev)->fb_helper, state);
 }
 
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 {
-	struct drm_fb_helper *fb_helper = rdev->ddev->fb_helper;
+	struct drm_fb_helper *fb_helper = rdev_to_drm(rdev)->fb_helper;
 	struct drm_gem_object *gobj;
 
 	if (!fb_helper)
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 4fb780d96f32..daff61586be5 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -150,7 +150,7 @@ int radeon_fence_emit(struct radeon_device *rdev,
 		       rdev->fence_context + ring,
 		       seq);
 	radeon_fence_ring_emit(rdev, ring, *fence);
-	trace_radeon_fence_emit(rdev->ddev, ring, (*fence)->seq);
+	trace_radeon_fence_emit(rdev_to_drm(rdev), ring, (*fence)->seq);
 	radeon_fence_schedule_check(rdev, ring);
 	return 0;
 }
@@ -489,7 +489,7 @@ static long radeon_fence_wait_seq_timeout(struct radeon_device *rdev,
 		if (!target_seq[i])
 			continue;
 
-		trace_radeon_fence_wait_begin(rdev->ddev, i, target_seq[i]);
+		trace_radeon_fence_wait_begin(rdev_to_drm(rdev), i, target_seq[i]);
 		radeon_irq_kms_sw_irq_get(rdev, i);
 	}
 
@@ -511,7 +511,7 @@ static long radeon_fence_wait_seq_timeout(struct radeon_device *rdev,
 			continue;
 
 		radeon_irq_kms_sw_irq_put(rdev, i);
-		trace_radeon_fence_wait_end(rdev->ddev, i, target_seq[i]);
+		trace_radeon_fence_wait_end(rdev_to_drm(rdev), i, target_seq[i]);
 	}
 
 	return r;
@@ -995,7 +995,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(radeon_debugfs_gpu_reset_fops,
 void radeon_debugfs_fence_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("radeon_gpu_reset", 0444, root, rdev,
 			    &radeon_debugfs_gpu_reset_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 2ef201a072f1..9dd4ff09d562 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -899,7 +899,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_gem_info);
 void radeon_gem_debugfs_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("radeon_gem_info", 0444, root, rdev,
 			    &radeon_debugfs_gem_info_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 3d174390a8af..1f16619ed06e 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -1011,7 +1011,7 @@ void radeon_i2c_add(struct radeon_device *rdev,
 		    struct radeon_i2c_bus_rec *rec,
 		    const char *name)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	int i;
 
 	for (i = 0; i < RADEON_MAX_I2C_BUS; i++) {
-- 
2.45.2

