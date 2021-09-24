Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A8416C30
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D4E6EE08;
	Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8B06EDF3;
 Fri, 24 Sep 2021 06:50:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B925158107D;
 Fri, 24 Sep 2021 02:44:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 24 Sep 2021 02:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=8EnQ/P1b3+dZF
 mbiHt8p7nTqiaEPC6ed82Aoi+jyRZw=; b=julTLJmiv5SHAN/Dn1DegrWQ7rOT4
 IQpeR92VSZzZG46o9PzshP6l9Oh421DZK5fXnYJj5JEPUND5iFNFWBIuFZX8Noc7
 GTnk/C06MMfuQJURB+k80ZkxzFat8UsfYGaSOJpzoMqA+2KLpEDP2RtJ7JkdzCMQ
 8QuUEUaXGH79sJEgYYWA5F3xMcSyEuAq/Ok6HeSl2A1tQnCG9l95f4Sh+WccXcuc
 pZ8Ko/Y/RMiNFFazhvkfrwOcngVFE7ruROPLcLOWg/WdiCoY2ThHsz8GPb3OGXbY
 gT5eiP8AsvcKxXRoYMhlVn/fzjOmcRPUbw/6ZejCZBfo6RQGIWPyqKhhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=8EnQ/P1b3+dZFmbiHt8p7nTqiaEPC6ed82Aoi+jyRZw=; b=Ov9VyMEt
 4yRdl9C4o77iYTRobtg7iB4r8LqMrEdLP0BMvObWS0GNtKSRACjXOiIDPUWSxcls
 Z/e2+SQFxBhb7UpISnheSW0slanUZKvbWeTTAocAYNthygiyL4sBZ4GI8FzfEDpO
 n8ExDkfVmKMuXhJTkWbvpfAW8BTjpvBEhDUmjiBY8moZSnkM7MrMGKT1psMLruVY
 nlhWbZs91Y8o2S0FMgx3xezNhXeX15o+ZnIFZ6otsyvmBB4eU2hg1E9bOyxCMy45
 wcHcGO4UydKc5WehQyDQJ/tAysLj+UvhoyPtdygBI3GN2uE6Yi2nW1cLom4CzEB1
 Z9GxrMTeAYYJlg==
X-ME-Sender: <xms:wHNNYepTh6VOzz8bQmBmr4yeUdwj7orwHSWENQndbW9jRTjVosy9Ow>
 <xme:wHNNYcoSsZ_6KtHPWkGglt8BAyR1rOsDfu20G03UKAlu60wZBu24mP7u64otZ1sUM
 6Ku2NxcXbuUflyaIQ>
X-ME-Received: <xmr:wHNNYTPU3opJ_7dYgcC7MpHB20voCkzbzNmdV1yrB3Folh6BYoEcjUqQc2UhnFcQluVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:wHNNYd6XbXFlJ80jwrYAcvwkl1WbOr-aqupX68H4nD2rGglRAJc9-A>
 <xmx:wHNNYd7hBoNN1PMwk5uAXwZc3LzcUSbXrc4Hi4kwJ56vy11kTseXCw>
 <xmx:wHNNYdg7ajZ_597CuxyPJzDybg55sEfCe4hd_8IpzoyAVtwMU38cNg>
 <xmx:wHNNYSFssNXcVcVNvXLfCv1Q87LG1cYZCjYIZ3MWkvdzdZHk3accKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:44:14 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 15/17] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:22 +0200
Message-Id: <20210924064324.229457-16-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 21 +++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++----------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 25 ++++++----
 3 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 7a7316731911..b07e845a2600 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -40,6 +40,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 static void amdgpu_display_flip_callback(struct dma_fence *f,
 					 struct dma_fence_cb *cb)
@@ -1543,16 +1544,21 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
-	int r;
+	struct drm_modeset_acquire_ctx ctx;
+	int r, ret;
 
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
+
+	if (ret)
+		return ret;
+
 	/* unpin the front buffers and cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
@@ -1590,7 +1596,8 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	struct drm_crtc *crtc;
-	int r;
+	struct drm_modeset_acquire_ctx ctx;
+	int r, ret;
 
 	/* pin cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
@@ -1612,7 +1619,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 	drm_helper_resume_force_mode(dev);
 
 	/* turn on display hw */
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	drm_connector_list_iter_begin(dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
@@ -1620,8 +1627,8 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 					  DRM_MODE_DPMS_ON);
 	drm_connector_list_iter_end(&iter);
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-	return 0;
+	return ret;
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
index 87daa78a32b8..fb7b56fa2673 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -24,6 +24,7 @@
  */
 
 #include <linux/uaccess.h>
+#include <drm/drm_drv.h>
 
 #include "dc.h"
 #include "amdgpu.h"
@@ -1191,12 +1192,14 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
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
@@ -1236,12 +1239,6 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
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
@@ -1259,13 +1256,19 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 
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
+	if (ret)
+		return ret;
+
+	drm_kms_helper_hotplug_event(dev);
+
 unlock:
 	mutex_unlock(&aconnector->hpd_lock);
 
-- 
2.33.0

