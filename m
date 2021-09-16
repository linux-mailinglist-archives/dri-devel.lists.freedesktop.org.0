Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CC040EC9F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFF86EA05;
	Thu, 16 Sep 2021 21:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393276E92C;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 770D12B011F1;
 Thu, 16 Sep 2021 17:16:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 16 Sep 2021 17:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=1r7LWPE1P9TLq
 xYrOWDtBdsKuquMjbMq3eXbPJVwAkU=; b=jpAOhRqjEhRlLhb0UCB1SBFbWNzJn
 4eZ1IKoY9P33uxOGD+Jx3xZpvwYdchMi9do2op7Glg3Uj0rNoAxJppAN1Eipf0CW
 +BtIg2r+Pckv3nQZHfTZAF+ZPgyvMqMmoo1gQJUtWYkqwEZKJn3DqR8D9mtGS8Yi
 yc9+8BSzDo+Bb4B7b8kNL4d3nZFOFL3h/k3Ed3IW5dim4SD4g6sAQZcmE2uzX/fv
 YLGWg030xfEUbE7Gis/9wiQrs32EgmZORBdFxQPX05Go1bDx7d5FO6TuNCxSUDwA
 2EU7+UdM/CLFmjh3xnZ1B4NvuxXVW6hcSLlyuhkvdZd/wJjY06CkFK1JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1r7LWPE1P9TLqxYrOWDtBdsKuquMjbMq3eXbPJVwAkU=; b=whauIIAr
 ZQ4Cya774GC22WqDwm9LEM/rjTTTLyeWPfzHoBGmmGab4mrHg4QV8QUtX0YFW2gQ
 d2LirD9Hzl40r2fkltirEmq+sVhDzDttRXKGMKgykmgoW/EV6DhiGxoXPfJj+Kts
 z1hDg9FEghPCVvTDeSBi9dgq1TttB1q4qn6p0LMjpGWNZrsGZUmA4swVz3llC02J
 9FzVXpNXYvVxCN/3HuDSdtUe2VGoE+WJNpVg9tqLBaOs2KZnBoSFKO9p4gX7B6AX
 utMzUJkYPqFYOGNS5LfrWaTsOdgfLgIFdgAAPOraBYtFY/jD4nzdWFsFpy2C0yii
 72W8ofvVbS8akg==
X-ME-Sender: <xms:MbRDYdOzDGiISU8cw_n7zdvgHYNil1Cq9jel4sFd2G8j9TssQ6gqhQ>
 <xme:MbRDYf8-cr-CviJzFsyJZlq396bdvrYt0CT-hInjIBLShSwNcKGUjDZgRe5ivGFmn
 FC5_xq5HR0FhVX6jg>
X-ME-Received: <xmr:MbRDYcREslTJNuaydz3R3Z6YMk9X2M040bGuILL7MZTstcmSm4k1-U9OokhMve3H1b0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:MbRDYZvLQts_TQ88W4FlqT42rNgFvy_5UzrZaB7dfEgAX7SMu21qRQ>
 <xmx:MbRDYVe3hbf-NBP-cE0NoFHBxuxrCLVLeyEcx5oMYEFNMYOPWGyxGw>
 <xmx:MbRDYV3WwT3-kSs93mapfHT15cCsEpy5BtG4sLBiu_PqP7zalS5Slw>
 <xmx:MbRDYR4J3rCl4APUp5DKMOVI4QALm5i80cI-s0Ra6l05dGeeDGeJd_bM4C0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:30 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 08/15] drm/radeon: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:45 +0200
Message-Id: <20210916211552.33490-9-greenfoo@u92.eu>
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
 drivers/gpu/drm/radeon/radeon_device.c | 13 +++++++++----
 drivers/gpu/drm/radeon/radeon_dp_mst.c |  7 +++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 4f0fbf667431..3feb1fd44409 100644
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
@@ -1559,7 +1560,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 	struct pci_dev *pdev;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
+	struct drm_modeset_acquire_ctx ctx;
 	int i, r;
+	int ret;
 
 	if (dev == NULL || dev->dev_private == NULL) {
 		return -ENODEV;
@@ -1573,12 +1576,12 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 
 	drm_kms_helper_poll_disable(dev);
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	/* turn off display hw */
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	/* unpin the front buffers and cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
@@ -1663,7 +1666,9 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	struct radeon_device *rdev = dev->dev_private;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
 	int r;
+	int ret;
 
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
@@ -1741,11 +1746,11 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
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
 	}
 
 	drm_kms_helper_poll_enable(dev);
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index ec867fa880a4..04fe7b0a6746 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -4,6 +4,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_drv.h>
 
 #include "atom.h"
 #include "ni_reg.h"
@@ -737,11 +738,13 @@ static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
 	struct radeon_device *rdev = (struct radeon_device *)m->private;
 	struct drm_device *dev = rdev->ddev;
 	struct drm_connector *connector;
+	struct drm_modeset_acquire_ctx ctx;
 	struct radeon_connector *radeon_connector;
 	struct radeon_connector_atom_dig *dig_connector;
 	int i;
+	int ret;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
 			continue;
@@ -759,7 +762,7 @@ static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
 				   radeon_connector->cur_stream_attribs[i].fe,
 				   radeon_connector->cur_stream_attribs[i].slots);
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	return 0;
 }
 
-- 
2.33.0

