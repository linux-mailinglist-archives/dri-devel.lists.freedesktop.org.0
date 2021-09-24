Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C201416C49
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BC46EE31;
	Fri, 24 Sep 2021 06:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52506EDFB;
 Fri, 24 Sep 2021 06:50:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3EEF9581070;
 Fri, 24 Sep 2021 02:43:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 Sep 2021 02:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=tV21AlKtqri50
 0YbxSxq8PDRfHz0hVriLhJ462dbiyE=; b=Rjfkkl9bssLI5rfsc5YTfv4TfZESU
 5rEjTLLGnckfA3o6WsSM+Cuknh6yC5PtAdPd/2G2al5PL8aLqOXqqv9bKo3ZxLHC
 3J1sUor9EEImN6DxPY06tMh2vA4PDsXPYq8QnO+kD/3f+NVBKWRdF9H6ggB40GQu
 e+MQgMcrpgERyq2NG1w9UK33xbgn+y46Uev+2MYL/aS58/O+Cz1XqRSSUhF8I8ml
 Ejpz5yGW2QZLmVcIiI8YUQE/M5lqhcsBcP3w2n2IIFFNWSv/DUSy2EIDSXD9TMGW
 oQjBiNfzxJYf/Hdu5pxW0G6U5SXoRYbvCHQFx0cwWk8y1CAI7Hym+HuzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=tV21AlKtqri500YbxSxq8PDRfHz0hVriLhJ462dbiyE=; b=wyZGIXrC
 cHii+qC4B7j6UD4Ws5MqhWUzjW7MYZXKg7zDbCY9lFUwlLbNb450EQMPqlCcoo1x
 bNyCLN1zMi1Ie0Vrme+XjP+2ZlX8wZhIqaduhVVZO9VyoZHDI6MZg1ofgSaXWMSq
 B+gfafBwuGlgN4xMvh3QhU1VQOHdpIk1guamKNJTeMBkjECN4qjYu0qcPyCSDLe6
 E2AVlV5V93azo2qlvuIM8weCBm2qn9FhYdHrHWYLmScjRPHh/np3APoS72lV3BM2
 1v8FJ3u3kZZGMJ0DRAMNtDe2yqzfuTyGqmLtKBVXupBBuXuvfg9Yeyr7MfHbeSCc
 VrJsQa/Z1bvPaA==
X-ME-Sender: <xms:rHNNYdM1jAMIjHMbYvbnmBryZklu5CzB9NkpbJbist1buuueU18vYQ>
 <xme:rHNNYf-YiFtbYXCPmhDCrpBAnbGVmN4QSh0LBJyqyXQUZE2mr9aFLJ8Rpf5oTmXVT
 HJNADCz5z4RLmqTPg>
X-ME-Received: <xmr:rHNNYcSWEteysyXSqVyHd8y8M-or_20zOOjoUEZMOo1t55zVdGls9KtUBOXkqcnPq6b8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:rHNNYZu18X-fkAwjj_feeXhZ4cuKbhZE58qTN3L4keYxF_TvsZ2Shw>
 <xmx:rHNNYVdZO7Q1vWymbMjyGSnj5W2pMr0hCWu_DQ1rxjyoIS0SEQBYhw>
 <xmx:rHNNYV3Qo14XBhQ7qaFyMeRZ7Q9rDUDvV0TM6jMiv8N-Dl1ho01ZLA>
 <xmx:rHNNYR5zG-c94cORA6hNDdgoIQZn2TVaRIp0rHwB_iIubaE_UD_Uhw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:53 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 08/17] drm/radeon: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:15 +0200
Message-Id: <20210924064324.229457-9-greenfoo@u92.eu>
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
 drivers/gpu/drm/radeon/radeon_device.c | 21 +++++++++++++++------
 drivers/gpu/drm/radeon/radeon_dp_mst.c | 10 ++++++----
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 4f0fbf667431..7e31e5ce7f61 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -37,6 +37,7 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/radeon_drm.h>
@@ -1559,7 +1560,8 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 	struct pci_dev *pdev;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
-	int i, r;
+	struct drm_modeset_acquire_ctx ctx;
+	int i, r, ret;
 
 	if (dev == NULL || dev->dev_private == NULL) {
 		return -ENODEV;
@@ -1573,12 +1575,15 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 
 	drm_kms_helper_poll_disable(dev);
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	/* turn off display hw */
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	if (ret)
+		return ret;
 
 	/* unpin the front buffers and cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
@@ -1663,7 +1668,8 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	struct radeon_device *rdev = dev->dev_private;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct drm_crtc *crtc;
-	int r;
+	struct drm_modeset_acquire_ctx ctx;
+	int r, ret;
 
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
@@ -1741,11 +1747,14 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	if (fbcon) {
 		drm_helper_resume_force_mode(dev);
 		/* turn on display hw */
-		drm_modeset_lock_all(dev);
+		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 		list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 			drm_helper_connector_dpms(connector, DRM_MODE_DPMS_ON);
 		}
-		drm_modeset_unlock_all(dev);
+		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+		if (ret)
+			return ret;
 	}
 
 	drm_kms_helper_poll_enable(dev);
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index ec867fa880a4..3f83ee75b100 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -4,6 +4,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_drv.h>
 
 #include "atom.h"
 #include "ni_reg.h"
@@ -737,11 +738,12 @@ static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
 	struct radeon_device *rdev = (struct radeon_device *)m->private;
 	struct drm_device *dev = rdev->ddev;
 	struct drm_connector *connector;
+	struct drm_modeset_acquire_ctx ctx;
 	struct radeon_connector *radeon_connector;
 	struct radeon_connector_atom_dig *dig_connector;
-	int i;
+	int i, ret;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
 			continue;
@@ -759,8 +761,8 @@ static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
 				   radeon_connector->cur_stream_attribs[i].fe,
 				   radeon_connector->cur_stream_attribs[i].slots);
 	}
-	drm_modeset_unlock_all(dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	return ret;
 }
 
 DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_mst_info);
-- 
2.33.0

