Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EC40EC8B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117786E978;
	Thu, 16 Sep 2021 21:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135A76E915;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 96CD22B011FD;
 Thu, 16 Sep 2021 17:17:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Sep 2021 17:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=oMGdLpC5l6tjv
 DFFrBqsd4hGMo2mPV0ixLwfueaxDPE=; b=ISe2cYZdESxo1jvXPdHXb5dq8FfSr
 uU5mpTR2JZSYfg4aDav0C/suEj7WwqKUYOsK5Fzop99smn/b4NXOSVrO0L1wUvj3
 HZLR5OQeoUK3IMJxXh3LnKwxc68MCxDfRL1q+rUJfxe2XRAAWBTP/y3DUTZpNlVu
 7aY/avlPF9R+vDg3SUrwJA+FMCjcadZoBE2u4fmBIHsH4/KonG1SlV2WSbIrF9/7
 /w15ZsAHW3Z+eaO+Xc66ritrpFjWKlQ9nizKGq66uP8ZPYsD9BwxKsOrVRDOTyTD
 PkQk9iJNsuR3kjS5sEGgRBrJzqrxBGmYaJmGiRr/6UxRkM2uPAucstTxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=oMGdLpC5l6tjvDFFrBqsd4hGMo2mPV0ixLwfueaxDPE=; b=An2mmKGH
 c7DCYMjkcxnP2/0nz6lX59xoeBowiC4HBopElwWFzyrLd7JvQPMH63z9pN7J27lm
 NGa87/AhggO2VZ0QCon6uhP71ArzmGqahWRkp7rollBOko/ku3p4F4OZc+mNRf+G
 zkn/hkUprATi5tA/YJ0Tz32H/CBq4pAZ0qWrmQHRxbsF0SOBlZ718u3qy/sXo0Ue
 njT+iSguubEmmjPoKRsPVkjV85sAtvDcRH1Q7t97rpQbg75TRv7h76pKm4sq4gJ9
 ckfw7JaSPvvQg9adD52e6huPB4TYVCHVCtnOE93hN7WRemQj2a8RLmVIFdNGSruw
 bfW6K23SnXZmgg==
X-ME-Sender: <xms:TLRDYRI83V6ln2t_F9yYCUITedjL0gFUoxlUxbhHHOI6KClDwzYRVA>
 <xme:TLRDYdLbuGzQHW0vdWW0Fp3PsxFjL46IEM6qY2IThkCGsO9WptG9sTDlb2Fuji1Ve
 k7srDId9MbMMQF5cQ>
X-ME-Received: <xmr:TLRDYZucLBkF8uAqxcrP0WgnJMGhZqCdS2B0vLIiPV2GuMC40pE2IgtUC_DZOxs3lxb9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:TLRDYSZcedqCfbkmBdLgBYCzPwPLHzxailu-crIyuCLobwItp4C7yw>
 <xmx:TLRDYYYkwjFlGp7zCNgMzkhBy_y1qGykGuIN4aZ2YyLGUNIpuiUP-A>
 <xmx:TLRDYWCN6Pydi7WCExgA9Bfw-PAObW8eCN44x6ny49Wn3itn267EoA>
 <xmx:TLRDYWnS1YnNv22ZpDz0-Xcn3a2Y-jXKkMgOkLqAWeAI0nDWR84ABz0cDSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:57 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 14/15] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:51 +0200
Message-Id: <20210916211552.33490-15-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 13 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 23 +++++----
 3 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 7a7316731911..55ecc4aa859f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -40,6 +40,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 static void amdgpu_display_flip_callback(struct dma_fence *f,
 					 struct dma_fence_cb *cb)
@@ -1543,16 +1544,18 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
+	struct drm_modeset_acquire_ctx ctx;
 	int r;
+	int ret;
 
 	/* turn off display hw */
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	drm_connector_list_iter_begin(dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
 		drm_helper_connector_dpms(connector,
 					  DRM_MODE_DPMS_OFF);
 	drm_connector_list_iter_end(&iter);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	/* unpin the front buffers and cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
@@ -1590,7 +1593,9 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	int r;
+	int ret;
 
 	/* pin cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
@@ -1612,7 +1617,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 	drm_helper_resume_force_mode(dev);
 
 	/* turn on display hw */
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	drm_connector_list_iter_begin(dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
@@ -1620,7 +1625,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 					  DRM_MODE_DPMS_ON);
 	drm_connector_list_iter_end(&iter);
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9b1fc54555ee..5196c1d26f87 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -80,6 +80,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
+#include <drm/drm_drv.h>
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
@@ -2621,6 +2622,9 @@ static void handle_hpd_irq(void *param)
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	struct dm_connector_state *dm_con_state = to_dm_connector_state(connector->state);
 #endif
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
+
 
 	if (adev->dm.disable_hpd_irq)
 		return;
@@ -2646,14 +2650,6 @@ static void handle_hpd_irq(void *param)
 	if (aconnector->base.force && new_connection_type == dc_connection_none) {
 		emulated_link_detect(aconnector->dc_link);
 
-
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
-			drm_kms_helper_hotplug_event(dev);
-
 	} else if (dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD)) {
 		if (new_connection_type == dc_connection_none &&
 		    aconnector->dc_link->type == dc_connection_none)
@@ -2661,13 +2657,18 @@ static void handle_hpd_irq(void *param)
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
 
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
-			drm_kms_helper_hotplug_event(dev);
+	} else {
+		goto out;
 	}
+
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	dm_restore_drm_connector_state(dev, connector);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
+		drm_kms_helper_hotplug_event(dev);
+
+out:
 	mutex_unlock(&aconnector->hpd_lock);
 
 }
@@ -2756,12 +2757,14 @@ static void handle_hpd_rx_irq(void *param)
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
 	struct dc_link *dc_link = aconnector->dc_link;
+	struct drm_modeset_acquire_ctx ctx;
 	bool is_mst_root_connector = aconnector->mst_mgr.mst_state;
 	bool result = false;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	union hpd_irq_data hpd_irq_data;
 	bool lock_flag = 0;
+	int ret;
 
 	memset(&hpd_irq_data, 0, sizeof(hpd_irq_data));
 
@@ -2828,12 +2831,6 @@ static void handle_hpd_rx_irq(void *param)
 
 			amdgpu_dm_update_connector_after_detect(aconnector);
 
-
-			drm_modeset_lock_all(dev);
-			dm_restore_drm_connector_state(dev, connector);
-			drm_modeset_unlock_all(dev);
-
-			drm_kms_helper_hotplug_event(dev);
 		} else if (dc_link_detect(dc_link, DETECT_REASON_HPDRX)) {
 
 			if (aconnector->fake_enable)
@@ -2841,14 +2838,17 @@ static void handle_hpd_rx_irq(void *param)
 
 			amdgpu_dm_update_connector_after_detect(aconnector);
 
+		} else {
+			goto finish;
+		}
 
-			drm_modeset_lock_all(dev);
-			dm_restore_drm_connector_state(dev, connector);
-			drm_modeset_unlock_all(dev);
+		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+		dm_restore_drm_connector_state(dev, connector);
+		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-			drm_kms_helper_hotplug_event(dev);
-		}
+		drm_kms_helper_hotplug_event(dev);
 	}
+finish:
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
 		if (adev->dm.hdcp_workqueue)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 87daa78a32b8..6e5a8f4fc6bd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -37,6 +37,8 @@
 #include "link_hwss.h"
 #include "dc/dc_dmub_srv.h"
 
+#include <drm/drm_drv.h>
+
 struct dmub_debugfs_trace_header {
 	uint32_t entry_count;
 	uint32_t reserved[3];
@@ -1191,12 +1193,14 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 	struct drm_connector *connector = &aconnector->base;
 	struct dc_link *link = NULL;
 	struct drm_device *dev = connector->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	char *wr_buf = NULL;
 	uint32_t wr_buf_size = 42;
 	int max_param_num = 1;
 	long param[1] = {0};
 	uint8_t param_nums = 0;
+	int ret;
 
 	if (!aconnector || !aconnector->dc_link)
 		return -EINVAL;
@@ -1236,12 +1240,6 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 			goto unlock;
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
-
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		drm_kms_helper_hotplug_event(dev);
 	} else if (param[0] == 0) {
 		if (!aconnector->dc_link)
 			goto unlock;
@@ -1259,13 +1257,16 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
 
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		drm_kms_helper_hotplug_event(dev);
+	} else {
+		goto unlock;
 	}
 
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	dm_restore_drm_connector_state(dev, connector);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	drm_kms_helper_hotplug_event(dev);
+
 unlock:
 	mutex_unlock(&aconnector->hpd_lock);
 
-- 
2.33.0

