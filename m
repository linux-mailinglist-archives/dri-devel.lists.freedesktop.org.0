Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E200425BF9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F3E6F4BF;
	Thu,  7 Oct 2021 19:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AB56F4BE;
 Thu,  7 Oct 2021 19:38:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id A4C782B00A16;
 Thu,  7 Oct 2021 15:38:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 07 Oct 2021 15:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=tV21AlKtqri50
 0YbxSxq8PDRfHz0hVriLhJ462dbiyE=; b=vkjMsXwTIeX3GcNBZlVRHqyVYhFNa
 KHznu6AkC0HSn3rmACgSmnsicBQXOoaLcFLLLpU+KHIvAOWr5OfDJxE/7IC513Ui
 HqE2uSfnClGTT6Zs5d6SJPhrCvlqoGXmlqegihNVI/i0ya5AcFPgFqocjF40tUYS
 Bg9z/rwiMJ9Uj9uq02ZCntNl6gvOoxj82XVbjzhF4Ybszh2EGIt7Lj2hjx13AcZS
 W3+ZD1lFBgDKXc6kLr+Ofb/eFgm4DpoPYSWhLlIZZIQUb5EFqMaY9D+dpL9tIuAY
 jnVpjAvtImfmfkryfOFrK9hi61i3kNo4czLpBszm1P8LgSsnYOz1DKkZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=tV21AlKtqri500YbxSxq8PDRfHz0hVriLhJ462dbiyE=; b=I8B8Qpbo
 fr4veD9gcpT4DcAtLTBOrRLHOl4WvlXoY2xhSwdCwMTyJS5R8N2GX+L8QFBzRriO
 QC47jyrI39nBxtqyyl0SOyHfAW4YVoQEFWvs/Ei+JMzPioIEPPx15JmuSfURWZ2H
 C1SqAOgj6HvFgDcpNACDbPvt43773DIijSq+bk3hRav88uTQYxudjR9HxGcSZcK3
 rkxVHU7T1JGWSb+ATnvx51u62KUV3xHGs6BIrCifa8y1usU3Lx6n5+SqMcx5LnjF
 8H8jcc0quh4rLFWLdNULs71PkkK3tZw2KMGXWW0gNxUCcg8mxwyJekA0gsT0AOXx
 9ZO0xn/33t1C0w==
X-ME-Sender: <xms:vExfYYth9NDlDY7Vl4xDmx8SIE64f2iB-pGgFpUOb0lEC2BTTWa9xA>
 <xme:vExfYVeGykXUxR8cTVfvZyAkCG7gWu_1GQt8ZFguXa5id39Aoxs_1ympzurxjHOFm
 gCsmrwvBJN1DOxjhg>
X-ME-Received: <xmr:vExfYTy1ge3L-ilgfy6fozItkGAupOO-z3pbnzbbjO783mmg1ONIoeNbkS3l_mNks_Pf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:vExfYbN-QQmj_PLu-9M53gYvlcD3u0rg6tRtdt0m-BZnEisQ4zle6g>
 <xmx:vExfYY-I_wvQX_L_di7e2z9x5StCo3AWf9hx3bunrXF0AlYCzXC7lw>
 <xmx:vExfYTU7OBfXSJQz_kAieIoxhAwRdIoDIQSEtNf3W-R3n0qMjAc9aQ>
 <xmx:vExfYTayz4IU6qmGJbzvDUae3mXDrYUshKv9sPCdXCBR1wwEHO2tG2gly8s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:33 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 08/20] drm/radeon: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:43 +0200
Message-Id: <20211007193755.29579-9-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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

