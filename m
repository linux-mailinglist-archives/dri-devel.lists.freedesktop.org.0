Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B65416C4F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DA96EE59;
	Fri, 24 Sep 2021 06:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BED6EDFE;
 Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 34BF3581079;
 Fri, 24 Sep 2021 02:44:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Sep 2021 02:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=zEFMk0/3+W+TW
 pGRDcGSN7JQyCbDlMqHTw1oH0NyBmo=; b=ubfdzZdv0AkYnrIUbTTyqE3wKzXNx
 xjeG+w5IjpXaBHY3PWzdSJDD/pD/0dAvAAmeuUqdr4vvHSEw/7/xxQtlEoe8IHzi
 A4+oD1jlyGHMv6BPr479DMIm/Ufdz5mZntUzx3hHIo4cdRjtzqD23rz4vpPGT+KT
 0exhNUfDzgnqE1Gk3hdgWqrkzyyXGoPvUKP1hYuItoa3nJej9tV3wg2GdBqOCUqy
 sVBvS8ShNokNNeHmjQr9x5bpcxjc2mtKFcVnL0o2/exWSAsScFvZsnEhvOXVDt5Z
 sUybN6/quNGgSe25Bs1JMD7q9jtYMwGHbcxkSdE2Vgz85PWi7MkXbzJ8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zEFMk0/3+W+TWpGRDcGSN7JQyCbDlMqHTw1oH0NyBmo=; b=bxsGcpss
 9jp14NiVTh8ZWAANK0zbhloZwpZ69UdTjr06SECA9ziDCBLUntJl4zXV96JmIDTf
 wE6lbIpl3nJEUrZiiHTlmpMurJIPIwdKNDqSASLfOn7km2kbLsu5vlrMDefz96t0
 Ksbb6VurvIEv6KdjHqvbH9dTEqryF0p0bbgh7Jp7NiDK3obrMWLZoUjJ6kBuYNb4
 0660XtAmrEK8qJs+atKiHs4zqzsyMudUDjI+I7Rbg+gMciDysMM6yNvBmfsqY264
 8ShFH+FunoXTqVNw9ZbBmVtFXRDVYFAVWM43CthQhnje4cjOfr/FL8p+JUgY/vGY
 maakgLfXxs3tcw==
X-ME-Sender: <xms:u3NNYZJtruWJRZt07TngMNH5dFiIXMNc7oKWeisFKlCHx6qx7VuGdg>
 <xme:u3NNYVLvQ2i7IJhHm2GKf_9FpcmWbrxG-Sl3tj9q5na-X3zL2HOGF3E0EVrYk5FFJ
 VB2t-6WITehVhGkZQ>
X-ME-Received: <xmr:u3NNYRvq6CCuSBwFnPtRaml7fNaHIRE7BEBBRoMLeRizqSsDa5xLctW2eNYIoQ8cPAyv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:u3NNYaZbR8X1QFa2QMgjLA_O7Tn5DGsupQNDOwJQx-3BTSA7aUnqTg>
 <xmx:u3NNYQbuBMkruHx0T31aTLmfnpGmLPEN5xJoC_t7c0ekZMx2PaHb1Q>
 <xmx:u3NNYeBYYSePt2WU1gE8L7Nz49TKUKj6JKAjaOiioH4_VnQjHsgHaQ>
 <xmx:u3NNYemxIorzDn8WTjBXOLdgDtX2F-Qz7avfxk2_hIestkOHCvh57A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:44:08 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 13/17] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() part 2
Date: Fri, 24 Sep 2021 08:43:20 +0200
Message-Id: <20210924064324.229457-14-greenfoo@u92.eu>
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

While the previous commit was a simple "search and replace", this time I
had to do a bit of refactoring as only one call to
DRM_MODESET_LOCK_ALL_BEGIN() is allowed inside one same function.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 40 ++++++++++----------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index c0ee135e5499..c623738c59c8 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1105,6 +1105,7 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 	struct drm_crtc *drmmode_crtc;
 	struct intel_crtc *crtc;
 	struct drm_i915_gem_object *new_bo;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
 	overlay = dev_priv->overlay;
@@ -1113,24 +1114,24 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	if (!(params->flags & I915_OVERLAY_ENABLE)) {
-		drm_modeset_lock_all(dev);
-		ret = intel_overlay_switch_off(overlay);
-		drm_modeset_unlock_all(dev);
+	if (params->flags & I915_OVERLAY_ENABLE) {
 
-		return ret;
-	}
+		drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
+		if (!drmmode_crtc)
+			return -ENOENT;
+		crtc = to_intel_crtc(drmmode_crtc);
 
-	drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
-	if (!drmmode_crtc)
-		return -ENOENT;
-	crtc = to_intel_crtc(drmmode_crtc);
+		new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
+		if (!new_bo)
+			return -ENOENT;
+	}
 
-	new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
-	if (!new_bo)
-		return -ENOENT;
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
-	drm_modeset_lock_all(dev);
+	if (!(params->flags & I915_OVERLAY_ENABLE)) {
+		ret = intel_overlay_switch_off(overlay);
+		goto out_unlock;
+	}
 
 	if (i915_gem_object_is_tiled(new_bo)) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -1195,14 +1196,11 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 	if (ret != 0)
 		goto out_unlock;
 
-	drm_modeset_unlock_all(dev);
-	i915_gem_object_put(new_bo);
-
-	return 0;
-
 out_unlock:
-	drm_modeset_unlock_all(dev);
-	i915_gem_object_put(new_bo);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	if (params->flags & I915_OVERLAY_ENABLE)
+		i915_gem_object_put(new_bo);
 
 	return ret;
 }
-- 
2.33.0

