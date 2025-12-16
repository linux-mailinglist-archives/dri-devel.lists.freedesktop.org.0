Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83174CC172F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF67310E73C;
	Tue, 16 Dec 2025 08:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Owhh1oOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5B210E6F3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:42:57 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a0bae9aca3so29272235ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 22:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765867377; x=1766472177; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v2bmsoq/n0F14/KwlXRT7hb4jXoFQiO9q+m2/WPCVIU=;
 b=Owhh1oOssMMGME6tObmTg/14+ejz/Vu6icPxKmJ8AhtfMC70wyssXEd6Cfq0Hkk4XX
 cISVWldYSait2ZBe5lc3prQ7odnQ9dAMKr9n2zz+pvriN+BF1o3UdY3asGCEOIvLhBb0
 7bA0UmPLSD1OS5rLIoIg7Ke3pVIacdSWJUsN1skbFZDVxJxUJmcGv6itqjyHC32f/pvi
 sUFdh/um7DdD2cXPYBgnhhBRD1ukTMr9Squ19Mme1/mwnuOnh1ONQYI2YAjeBnY6n+Kh
 frH9sMt8sp19inrFZ9TvmLpRIV77p+LdOh0gCLtpyis/qnDhHU8NdO2GriN6bwRAtls0
 eEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765867377; x=1766472177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2bmsoq/n0F14/KwlXRT7hb4jXoFQiO9q+m2/WPCVIU=;
 b=oiozOpjmVjiJEunXeyCedGXglFlW4wfZ+ekZDrNt1psJFBmrVk/yKDksM4IfrUH7yP
 cFHF7mz+Gyr7BdHHVKtqJ3z/zrEU0R77nEvqxHOUxCFikZgM6ie2Up/lhnvnQ62JHQf1
 GV7rt6zCFk6VoMmxhcigtO3ihWER4xATfHVCQsQ0DKCQ+LHhTCOZS/TzQJzvlRU+3L43
 9mULzy7vw3LxZ7R/EqOZMZHk9xdc2i6zNYV7RysgV2m2uZN01wu6J5HkEUGp3Gx5LS3A
 r2z5UQa42ddy9VGFlssDD0bJnLdvKZ6hiG3DxrPhqU/t3HAfCRgfRIWPLkgtemyd8tHJ
 sTYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwq7QlRnG75ViXhlM/tZ+8OxFmsRZq5QEioCegXwKRAfyJhLfSEBVBpUfakm9bS4oa+woc2MEd71c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlsP5yRy/Uef/EFR6b5d9J++MS3/PWFv2/9OJ8vu+mnPDn61rg
 NcQlP344np5h2z2FEe6yZe5NTXI9kabbkQOYihNYqC2dk1vafxoQz6wLMhJGKT0qsS0=
X-Gm-Gg: AY/fxX6gBWnoS2nb0OhJ0nm++9qjje6YMcwMY6d7auKc7+WW4ndLe7yltNsPJc2uMxv
 TR6BAmkHIQI+S9mFJdsLfOcJNFOtLJcI155pTZz0KXif9+u8hDzA/c04uLkEgO1TKHOQYc5jiLw
 Z7YJfftRY1TMZH3g++20iTI2+cRTrKwr9gUo2GZkxJwo0jTtBWsMz6a2hFcZdfx12htZkKU+0h2
 B6h0id/oSD3Vwga6WmKNxA2/8wn5krDMxFcFdUAh1/bYbM6mypj/ormiKsLjlm6Wh60z/CgQXCn
 mv7duAmraFM1hKn44nZ6Ki2ptUfGHQLa1iSUsnVLyX/tDxGqs27kgqizYkElYplhlOrHse+F21j
 JOdlcYXfoD9dzJL5l7ElIWAqEf/bzeLXc3lCotvoGzknS6odVuu4aQc0cpFDXZ9t6zJayuPnDOS
 OJWVmWubRjT9aQABfOaKRlzhv6SL9zG2reKE9h2ufQ+W9pAcz/OE67ujcMurfdHjM=
X-Google-Smtp-Source: AGHT+IFar+tL4JPaarEM2ARLO+T20e2mStsXQVCj82DlL5Ir+c5vZWMVWSjH5RC2TFXXUxM6LFEwEg==
X-Received: by 2002:a17:902:cecc:b0:2a1:3895:e0d8 with SMTP id
 d9443c01a7336-2a13895e17dmr14512435ad.60.1765867376883; 
 Mon, 15 Dec 2025 22:42:56 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a0ced60fddsm64218355ad.77.2025.12.15.22.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:42:56 -0800 (PST)
From: Mukesh Ogare <mukeshogare871@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mukeshogare871@gmail.com
Subject: [PATCH] drm/radeon: Convert logging in radeon_display.c to drm_*
 helpers
Date: Tue, 16 Dec 2025 12:12:24 +0530
Message-ID: <20251216064224.537759-1-mukeshogare871@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:05:31 +0000
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

Replace DRM_ERROR() and DRM_INFO() calls in
drivers/gpu/drm/radeon/radeon_display.c with the corresponding
drm_err() and drm_info() helpers.

The drm_*() logging functions take a struct drm_device * argument,
allowing the DRM core to prefix log messages with the correct device
name and instance. This is required to correctly distinguish log
messages on systems with multiple GPUs.

This change aligns radeon with the DRM TODO item:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 35fb99bcd9a7..bc28117e01b4 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -41,6 +41,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/radeon_drm.h>
+#include <drm/drm_print.h>
 
 #include "atom.h"
 #include "radeon.h"
@@ -273,7 +274,7 @@ static void radeon_unpin_work_func(struct work_struct *__work)
 		radeon_bo_unpin(work->old_rbo);
 		radeon_bo_unreserve(work->old_rbo);
 	} else
-		DRM_ERROR("failed to reserve buffer after flip\n");
+		drm_err(&work->rdev->ddev, "failed to reserve buffer after flip\n");
 
 	drm_gem_object_put(&work->old_rbo->tbo.base);
 	kfree(work);
@@ -434,7 +435,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
 			r = dma_fence_wait(work->fence, false);
 
 		if (r)
-			DRM_ERROR("failed to wait on page flip fence (%d)!\n", r);
+			drm_err(dev, "failed to wait on page flip fence (%d)!\n", r);
 
 		/* We continue with the page flip even if we failed to wait on
 		 * the fence, otherwise the DRM core and userspace will be
@@ -521,7 +522,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 
 	r = radeon_bo_reserve(new_rbo, false);
 	if (unlikely(r != 0)) {
-		DRM_ERROR("failed to reserve new rbo buffer before flip\n");
+		drm_err(dev, "failed to reserve new rbo buffer before flip\n");
 		goto cleanup;
 	}
 	/* Only 27 bit offset for legacy CRTC */
@@ -530,14 +531,14 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 	if (unlikely(r != 0)) {
 		radeon_bo_unreserve(new_rbo);
 		r = -EINVAL;
-		DRM_ERROR("failed to pin new rbo buffer before flip\n");
+		drm_err(dev, "failed to pin new rbo buffer before flip\n");
 		goto cleanup;
 	}
 	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
 				   &work->fence);
 	if (r) {
 		radeon_bo_unreserve(new_rbo);
-		DRM_ERROR("failed to get new rbo buffer fences\n");
+		drm_err(dev, "failed to get new rbo buffer fences\n");
 		goto cleanup;
 	}
 	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
@@ -604,7 +605,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 
 pflip_cleanup:
 	if (unlikely(radeon_bo_reserve(new_rbo, false) != 0)) {
-		DRM_ERROR("failed to reserve new rbo in error path\n");
+		drm_err(dev, "failed to reserve new rbo in error path\n");
 		goto cleanup;
 	}
 	radeon_bo_unpin(new_rbo);
@@ -772,15 +773,15 @@ static void radeon_print_display_setup(struct drm_device *dev)
 	uint32_t devices;
 	int i = 0;
 
-	DRM_INFO("Radeon Display Connectors\n");
+	drm_info(dev, "Radeon Display Connectors\n");
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		radeon_connector = to_radeon_connector(connector);
-		DRM_INFO("Connector %d:\n", i);
-		DRM_INFO("  %s\n", connector->name);
+		drm_info(dev, "Connector %d:\n", i);
+		drm_info(dev, "  %s\n", connector->name);
 		if (radeon_connector->hpd.hpd != RADEON_HPD_NONE)
-			DRM_INFO("  %s\n", hpd_names[radeon_connector->hpd.hpd]);
+			drm_info(dev, "  %s\n", hpd_names[radeon_connector->hpd.hpd]);
 		if (radeon_connector->ddc_bus) {
-			DRM_INFO("  DDC: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
+			drm_info(dev, "  DDC: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
 				 radeon_connector->ddc_bus->rec.mask_clk_reg,
 				 radeon_connector->ddc_bus->rec.mask_data_reg,
 				 radeon_connector->ddc_bus->rec.a_clk_reg,
@@ -790,11 +791,11 @@ static void radeon_print_display_setup(struct drm_device *dev)
 				 radeon_connector->ddc_bus->rec.y_clk_reg,
 				 radeon_connector->ddc_bus->rec.y_data_reg);
 			if (radeon_connector->router.ddc_valid)
-				DRM_INFO("  DDC Router 0x%x/0x%x\n",
+				drm_info(dev, "  DDC Router 0x%x/0x%x\n",
 					 radeon_connector->router.ddc_mux_control_pin,
 					 radeon_connector->router.ddc_mux_state);
 			if (radeon_connector->router.cd_valid)
-				DRM_INFO("  Clock/Data Router 0x%x/0x%x\n",
+				drm_info(dev, "  Clock/Data Router 0x%x/0x%x\n",
 					 radeon_connector->router.cd_mux_control_pin,
 					 radeon_connector->router.cd_mux_state);
 		} else {
@@ -804,35 +805,46 @@ static void radeon_print_display_setup(struct drm_device *dev)
 			    connector->connector_type == DRM_MODE_CONNECTOR_DVIA ||
 			    connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 			    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
-				DRM_INFO("  DDC: no ddc bus - possible BIOS bug - please report to xorg-driver-ati@lists.x.org\n");
+				drm_info(dev, "  DDC: no ddc bus - possible BIOS bug - please report to xorg-driver-ati@lists.x.org\n");
 		}
-		DRM_INFO("  Encoders:\n");
+		drm_info(dev, "  Encoders:\n");
 		list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
 			radeon_encoder = to_radeon_encoder(encoder);
 			devices = radeon_encoder->devices & radeon_connector->devices;
 			if (devices) {
 				if (devices & ATOM_DEVICE_CRT1_SUPPORT)
-					DRM_INFO("    CRT1: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    CRT1: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_CRT2_SUPPORT)
-					DRM_INFO("    CRT2: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    CRT2: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_LCD1_SUPPORT)
-					DRM_INFO("    LCD1: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    LCD1: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_DFP1_SUPPORT)
-					DRM_INFO("    DFP1: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    DFP1: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_DFP2_SUPPORT)
-					DRM_INFO("    DFP2: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    DFP2: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_DFP3_SUPPORT)
-					DRM_INFO("    DFP3: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    DFP3: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_DFP4_SUPPORT)
-					DRM_INFO("    DFP4: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    DFP4: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_DFP5_SUPPORT)
-					DRM_INFO("    DFP5: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    DFP5: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_DFP6_SUPPORT)
-					DRM_INFO("    DFP6: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    DFP6: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_TV1_SUPPORT)
-					DRM_INFO("    TV1: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    TV1: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 				if (devices & ATOM_DEVICE_CV_SUPPORT)
-					DRM_INFO("    CV: %s\n", encoder_names[radeon_encoder->encoder_id]);
+					drm_info(dev, "    CV: %s\n",
+						encoder_names[radeon_encoder->encoder_id]);
 			}
 		}
 		i++;
@@ -1747,7 +1759,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 				 * (ie all encoder can work with the same
 				 *  scaling).
 				 */
-				DRM_ERROR("Scaling not consistent across encoder.\n");
+				drm_err(dev, "Scaling not consistent across encoder.\n");
 				return false;
 			}
 		}
-- 
2.43.0

