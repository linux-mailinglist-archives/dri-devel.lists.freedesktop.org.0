Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001242CBB6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB636EB2B;
	Wed, 13 Oct 2021 20:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D726EB11;
 Wed, 13 Oct 2021 20:49:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B2168581177;
 Wed, 13 Oct 2021 16:49:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Oct 2021 16:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=tV21AlKtqri50
 0YbxSxq8PDRfHz0hVriLhJ462dbiyE=; b=UX9eNdxZleHBzpvFaS11SFJu0yk3D
 ayhCYo823tccFDWrJM8ccJMJha3Nub71VCD6n/cw3KoiDLu7JvU9iRSiR6TDOEmN
 H80RNSZsuXrDwzi3+j5ETPhmTXCkPTdjVi73yg2C3Xgi4C06atdXH8HVvoYARKNV
 6PNO3YQofPld8feHrnCxKfbvcOG9EVBot6bTi12Ftr5x+Pc+hqgeURiz3URTtGyh
 oaVis1dMOb8tMqdD6wHjYfq+maOjrkX5W0rtL5A4GKxBS2551jROJ/3Oyx+R9YKU
 2quHelH/0VvNxyhiLdjuOeIhTToW6nWXs79tSGSyG4EX9UlUdyVqKEbbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=tV21AlKtqri500YbxSxq8PDRfHz0hVriLhJ462dbiyE=; b=M+bAR029
 l4tVEnd0RfJX1rJsjGclP3m0jDTiSLsfeaLBXRkDHHsemzFYUMS7UJQLuvNuLZS7
 44euz0bTjYqPa2GTwkzfoZN83l9LLj2UhwvS52HqxJaHaT8mb6jz4eUqHYyS/ml2
 nKlpNX/eHDpaUxLnPC+S9VvCFAVRC/XsLo0LSWdnC9SzUztDHNnNyDOO/A2Lg/Mi
 W3DixpINJ3c0jHGPjN01T1bF460NWyV2o5vKAxDqllgDjACVeJkM6wJb6Fyw/iRx
 5vrUd2sLytRRXI9r1Ql74U19B+UX8YVb5tDIwtzCNFKtpE1WA4LQ+x3bxwgxKkZZ
 3rS3CVdyk9IKVA==
X-ME-Sender: <xms:TEZnYR82SpdWob_2FrkFhI10ixKhlkjPv3g70CFaOF5h4UJtKHrU8g>
 <xme:TEZnYVsBwyVWnAU0Q6pGdwmEhhkAuZxBGJJgjScwlD7BdMDmblygtkTKtnUqORBT-
 p8jVK1C-gd18tOoNg>
X-ME-Received: <xmr:TEZnYfCtg2hTBQBEGbco5RP1Dpep6evDCi7Aknvu8Qym4QnAWAjniBiy_qh57yNvdVNs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:TEZnYVcbeowe3hNo8hFMdwG6Qa6BRWgWCaD-BrshpiXQ7y7OmjnQwA>
 <xmx:TEZnYWOSBWfcVc-pP7AvXFwSRDzsAxbQXDrCn6F1N1Bxx8CrGVX7xQ>
 <xmx:TEZnYXniDi2ZPiXd-af2RyG_j6Djya1n2tWd2HDFPtad8cwM8c2zLQ>
 <xmx:TEZnYdq_uL_NzyceeQf_RjIiH-A_be709dNs4cPRh2YtFF5MqtQDrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:14 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 08/20] drm/radeon: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:34 +0200
Message-Id: <20211013204846.90026-9-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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

