Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC441FCCA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0D9898C0;
	Sat,  2 Oct 2021 15:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A327989338
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:46 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id e16so1494140qts.4
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dwMVhoFInyVnI3TW4TkGjfHqsSj0JqYDKIPC7ghoVAs=;
 b=MZFb4tv7IcPwOHNq/md0S2hWf1r4x1gVKgOBPFc5YrLgSMqnh2ErTV2jRuYePnIH1D
 KDsDttFWJOhver2ZnFc6HClrvGvh1GXOOIEeaaQelnusqk5kFzFJta3V3Cytbk2xz2Mz
 5OC6WM/3kXp/UuSrC44XMTUl+PHWBX3qhWTeg2btI1fWsOT/4wq5TVwHsO+hoAk/YdAP
 LcfCCxopS4EqCFLAekYzHBuWPXx1aIbAmC/QcXjhl6s7vCR4+lUq2XOYza2rfj/bo2XI
 iAaULxpMUOizn9SDTC6N4evSZtuc+ukV4uZa2ueRQxKYOGtJtAAezfp92igs14XgbjVf
 ealQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwMVhoFInyVnI3TW4TkGjfHqsSj0JqYDKIPC7ghoVAs=;
 b=t+5Cjbvy17ZSXUovetnuqg/7WAQR3PHymB3ReQpxkFzXUMdZy0U/sBgGrUTtn9uUDC
 Y0HbVSUmqftdaJwPSY0pQFieIsEU4yY8zpbQdg7JqwZWAbi9CJb2y3iebaguGyjSB0zO
 TlSBB+xvF/b/bHgoHlMGL2DSKdJpEz6AXusF5UlENV1zlXRxVhS0cbrkmR6zhmHS8sHg
 14jRtcOjql/pmCRQrPEV154/OKfoF1tpUZQQuTTPR94wEJR34Pkh5vJ39W9MVOpOXmat
 Y25KMPbY7OfG3HSBtevmHdvrt01QmcON4erFigLzeqEdUTwwAIxxVXWcXRvBGaMMBq+m
 ptCg==
X-Gm-Message-State: AOAM533mmJoEQPbOSYeAQdMA7O6mtBqtjhz8Z64War8rlhcfnzr1No4C
 02QiauTWKbEt3qG3Fz2yBdz8IqgaRQ5kfg==
X-Google-Smtp-Source: ABdhPJwbzFcUlgAoIadyka6SmfLX4ye/FJaAm1u7fJIEPiuzzP7TxQlpIQYWfE2Jujmg6dvYY8gHuw==
X-Received: by 2002:ac8:3e01:: with SMTP id z1mr4133408qtf.278.1633189545592; 
 Sat, 02 Oct 2021 08:45:45 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id p201sm4902010qke.27.2021.10.02.08.45.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:45 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 02/16] Revert "drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:28 -0400
Message-Id: <20211002154542.15800-2-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211002154542.15800-1-sean@poorly.run>
References: <20211002154542.15800-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 299f040e855b69c29522cde446777902381a07f5.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 21 +++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 25 ++++------
 3 files changed, 43 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index b07e845a2600..7a7316731911 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -40,7 +40,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_drv.h>
 
 static void amdgpu_display_flip_callback(struct dma_fence *f,
 					 struct dma_fence_cb *cb)
@@ -1544,21 +1543,16 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
-	struct drm_modeset_acquire_ctx ctx;
-	int r, ret;
+	int r;
 
 	/* turn off display hw */
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	drm_connector_list_iter_begin(dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
 		drm_helper_connector_dpms(connector,
 					  DRM_MODE_DPMS_OFF);
 	drm_connector_list_iter_end(&iter);
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-
-	if (ret)
-		return ret;
-
+	drm_modeset_unlock_all(dev);
 	/* unpin the front buffers and cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
@@ -1596,8 +1590,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	struct drm_crtc *crtc;
-	struct drm_modeset_acquire_ctx ctx;
-	int r, ret;
+	int r;
 
 	/* pin cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
@@ -1619,7 +1612,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 	drm_helper_resume_force_mode(dev);
 
 	/* turn on display hw */
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	drm_connector_list_iter_begin(dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
@@ -1627,8 +1620,8 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 					  DRM_MODE_DPMS_ON);
 	drm_connector_list_iter_end(&iter);
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
-	return ret;
+	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5196c1d26f87..9b1fc54555ee 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -80,7 +80,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
-#include <drm/drm_drv.h>
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
@@ -2622,9 +2621,6 @@ static void handle_hpd_irq(void *param)
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	struct dm_connector_state *dm_con_state = to_dm_connector_state(connector->state);
 #endif
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
-
 
 	if (adev->dm.disable_hpd_irq)
 		return;
@@ -2650,6 +2646,14 @@ static void handle_hpd_irq(void *param)
 	if (aconnector->base.force && new_connection_type == dc_connection_none) {
 		emulated_link_detect(aconnector->dc_link);
 
+
+		drm_modeset_lock_all(dev);
+		dm_restore_drm_connector_state(dev, connector);
+		drm_modeset_unlock_all(dev);
+
+		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
+			drm_kms_helper_hotplug_event(dev);
+
 	} else if (dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD)) {
 		if (new_connection_type == dc_connection_none &&
 		    aconnector->dc_link->type == dc_connection_none)
@@ -2657,18 +2661,13 @@ static void handle_hpd_irq(void *param)
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
 
-	} else {
-		goto out;
-	}
-
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
-	dm_restore_drm_connector_state(dev, connector);
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-
-	if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
-		drm_kms_helper_hotplug_event(dev);
+		drm_modeset_lock_all(dev);
+		dm_restore_drm_connector_state(dev, connector);
+		drm_modeset_unlock_all(dev);
 
-out:
+		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
+			drm_kms_helper_hotplug_event(dev);
+	}
 	mutex_unlock(&aconnector->hpd_lock);
 
 }
@@ -2757,14 +2756,12 @@ static void handle_hpd_rx_irq(void *param)
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
 	struct dc_link *dc_link = aconnector->dc_link;
-	struct drm_modeset_acquire_ctx ctx;
 	bool is_mst_root_connector = aconnector->mst_mgr.mst_state;
 	bool result = false;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	union hpd_irq_data hpd_irq_data;
 	bool lock_flag = 0;
-	int ret;
 
 	memset(&hpd_irq_data, 0, sizeof(hpd_irq_data));
 
@@ -2831,6 +2828,12 @@ static void handle_hpd_rx_irq(void *param)
 
 			amdgpu_dm_update_connector_after_detect(aconnector);
 
+
+			drm_modeset_lock_all(dev);
+			dm_restore_drm_connector_state(dev, connector);
+			drm_modeset_unlock_all(dev);
+
+			drm_kms_helper_hotplug_event(dev);
 		} else if (dc_link_detect(dc_link, DETECT_REASON_HPDRX)) {
 
 			if (aconnector->fake_enable)
@@ -2838,17 +2841,14 @@ static void handle_hpd_rx_irq(void *param)
 
 			amdgpu_dm_update_connector_after_detect(aconnector);
 
-		} else {
-			goto finish;
-		}
 
-		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
-		dm_restore_drm_connector_state(dev, connector);
-		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+			drm_modeset_lock_all(dev);
+			dm_restore_drm_connector_state(dev, connector);
+			drm_modeset_unlock_all(dev);
 
-		drm_kms_helper_hotplug_event(dev);
+			drm_kms_helper_hotplug_event(dev);
+		}
 	}
-finish:
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
 		if (adev->dm.hdcp_workqueue)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index fb7b56fa2673..87daa78a32b8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -24,7 +24,6 @@
  */
 
 #include <linux/uaccess.h>
-#include <drm/drm_drv.h>
 
 #include "dc.h"
 #include "amdgpu.h"
@@ -1192,14 +1191,12 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 	struct drm_connector *connector = &aconnector->base;
 	struct dc_link *link = NULL;
 	struct drm_device *dev = connector->dev;
-	struct drm_modeset_acquire_ctx ctx;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	char *wr_buf = NULL;
 	uint32_t wr_buf_size = 42;
 	int max_param_num = 1;
 	long param[1] = {0};
 	uint8_t param_nums = 0;
-	int ret;
 
 	if (!aconnector || !aconnector->dc_link)
 		return -EINVAL;
@@ -1239,6 +1236,12 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 			goto unlock;
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
+
+		drm_modeset_lock_all(dev);
+		dm_restore_drm_connector_state(dev, connector);
+		drm_modeset_unlock_all(dev);
+
+		drm_kms_helper_hotplug_event(dev);
 	} else if (param[0] == 0) {
 		if (!aconnector->dc_link)
 			goto unlock;
@@ -1256,18 +1259,12 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
 
-	} else {
-		goto unlock;
-	}
-
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
-	dm_restore_drm_connector_state(dev, connector);
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-
-	if (ret)
-		return ret;
+		drm_modeset_lock_all(dev);
+		dm_restore_drm_connector_state(dev, connector);
+		drm_modeset_unlock_all(dev);
 
-	drm_kms_helper_hotplug_event(dev);
+		drm_kms_helper_hotplug_event(dev);
+	}
 
 unlock:
 	mutex_unlock(&aconnector->hpd_lock);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

