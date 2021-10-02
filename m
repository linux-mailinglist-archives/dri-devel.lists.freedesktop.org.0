Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5DA41FCD4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07FD6F4AC;
	Sat,  2 Oct 2021 15:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F29F6E850
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:56 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id e16so1746663qte.13
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDvceVguI0F5WbEAgPtWBMOP0IoACmUbR9X5+cdnRJQ=;
 b=FvAB1XXrdYUw9xLJ4m5fX2HJeXzb96cXfVRDX7XkySzUSSafEg0ZoFfGLA6F6fG/ep
 zlu86cE360EDqdYq+FSHiX2i1gjgV/Qa5cRkbY1+diVWoEyDdnNXM82Yn1F7qeY/OVAL
 Yj0ButMrjX56BL1Nnx53+Q9jV2PE9odu8v6J1cRz14+sfB2iHsCBEE7e+eErFVdrpsmZ
 Gmhcb1dXfua8DucdhBNBEIPtRruszKRrUGRl6yUh1Ncq1mFLzwmdEde7PlGGDPHwEQ8d
 MpWNQHL5zaCBGGOMAMj+CrgQpAixBInazvSeONz/ET50ZsExuWYxfoi4JPKvEYsi7Yqj
 HcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDvceVguI0F5WbEAgPtWBMOP0IoACmUbR9X5+cdnRJQ=;
 b=f0y7gCs0HUGiLgynGBUJSsguGJZS2WuruP5XYhc0SQKeS7jKcTHpBQfxjf+pWQPCdu
 jHHGQC/klMOLX87qrq9OaQ6JE3QgpaabkVPIBgaMlDp3CZp/DDoivKL05+ZV3T5olOxU
 v8/5dFVCzMop4VXmEsB4BY7cwQnoDDoJwGqKs9bRHVgpwaTGetAek0DhkYyvdiYwT1s5
 sCqy1up/g1vwf6YA8hyjPH2TKhw1U5ySJ1/9gm6bwOLSNvU4B/6sC6f0nrkhBChcGa2L
 s91SSNAX++WepdkfVMLviPN9v5679bsidGxUc6+6oh2Dzqn/cqrcQw98OLXB2JOp9+7A
 Eu/w==
X-Gm-Message-State: AOAM53200OzP1128vG/JLZyWhxr8v+4y9kETvG9sw1S0b3hI1JQb87jV
 pDuk4dOnU+mh/mF3KVpUbFX3jAGpZp00IQ==
X-Google-Smtp-Source: ABdhPJw/G0R/d8NSUnHqeJ34mrQ8R6u8eT82m+zCjbWYiLnJ6OGAPrUFQ2FTQV/lPYCBm7jqm/yx7g==
X-Received: by 2002:ac8:514f:: with SMTP id h15mr2512315qtn.340.1633189555601; 
 Sat, 02 Oct 2021 08:45:55 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id m68sm4819961qkb.105.2021.10.02.08.45.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:55 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 09/16] Revert "drm/radeon: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:35 -0400
Message-Id: <20211002154542.15800-9-sean@poorly.run>
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

This reverts commit 26723c3d6b930775f9a85521d09655c533a839e6.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/radeon/radeon_device.c | 21 ++++++---------------
 drivers/gpu/drm/radeon/radeon_dp_mst.c | 10 ++++------
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 7e31e5ce7f61..4f0fbf667431 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -37,7 +37,6 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/radeon_drm.h>
@@ -1560,8 +1559,7 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 	struct pci_dev *pdev;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
-	struct drm_modeset_acquire_ctx ctx;
-	int i, r, ret;
+	int i, r;
 
 	if (dev == NULL || dev->dev_private == NULL) {
 		return -ENODEV;
@@ -1575,15 +1573,12 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 
 	drm_kms_helper_poll_disable(dev);
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	/* turn off display hw */
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
 	}
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-
-	if (ret)
-		return ret;
+	drm_modeset_unlock_all(dev);
 
 	/* unpin the front buffers and cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
@@ -1668,8 +1663,7 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	struct radeon_device *rdev = dev->dev_private;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct drm_crtc *crtc;
-	struct drm_modeset_acquire_ctx ctx;
-	int r, ret;
+	int r;
 
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
@@ -1747,14 +1741,11 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	if (fbcon) {
 		drm_helper_resume_force_mode(dev);
 		/* turn on display hw */
-		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+		drm_modeset_lock_all(dev);
 		list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 			drm_helper_connector_dpms(connector, DRM_MODE_DPMS_ON);
 		}
-		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-
-		if (ret)
-			return ret;
+		drm_modeset_unlock_all(dev);
 	}
 
 	drm_kms_helper_poll_enable(dev);
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 3f83ee75b100..ec867fa880a4 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -4,7 +4,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_drv.h>
 
 #include "atom.h"
 #include "ni_reg.h"
@@ -738,12 +737,11 @@ static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
 	struct radeon_device *rdev = (struct radeon_device *)m->private;
 	struct drm_device *dev = rdev->ddev;
 	struct drm_connector *connector;
-	struct drm_modeset_acquire_ctx ctx;
 	struct radeon_connector *radeon_connector;
 	struct radeon_connector_atom_dig *dig_connector;
-	int i, ret;
+	int i;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
 			continue;
@@ -761,8 +759,8 @@ static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
 				   radeon_connector->cur_stream_attribs[i].fe,
 				   radeon_connector->cur_stream_attribs[i].slots);
 	}
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-	return ret;
+	drm_modeset_unlock_all(dev);
+	return 0;
 }
 
 DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_mst_info);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

