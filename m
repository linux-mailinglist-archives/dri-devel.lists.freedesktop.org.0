Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FD42CBD8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C996EB47;
	Wed, 13 Oct 2021 20:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75C36EB36;
 Wed, 13 Oct 2021 20:49:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 58FD558117A;
 Wed, 13 Oct 2021 16:49:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 13 Oct 2021 16:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=m/PMBB5pvKWQW
 STt/A5gkzeeMb050e+LA6tdqxnW7is=; b=dPFMQVwxtiS5JZx80eaCfsOuOaChy
 6vI/pdBAUZwRBNRR7bARAQzQBe5IuAp1dRBMcFFcUIkvSR6UqKLAsF+oLdB8AOnw
 ADcrSHdOZ/mJQOAlLAhx6TwCAnwqfpYsbPk0QWLZ+tuzPzdpSGalHMTnJmYSagKe
 IRQfiS7FFKprIZFbiFl0hmYvyTSPwKUFHGg4ywSeImpkfHng/Eq5SsUaQCJQ6n5U
 6haMBF5vu9pkWy2Ugka6M408rl+lP0w8L0LeR3/myIKV8+fXm8elY8TxNmPp1X8k
 NcJWK8jK+V8QVjwJS3x/8qYS2pIF5oNILoLBYlEfKTkHZbabUZEfpoHLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=m/PMBB5pvKWQWSTt/A5gkzeeMb050e+LA6tdqxnW7is=; b=WVNevSge
 wPjRFUAWKiA+kky5zEMljCcxrJ+iCsArH4UdFg0jbFTNLNjUvbL1w3EyJEDrCJTR
 QditRvnLyuUCjrHEbeAARK/cL1SiQrXeSv4h+cenC8lnnIjW/C1XmlSK89FeSgLQ
 B82m4TqRl3ZUaW8fwRIXtjflIHKZhlfKxMTwEA7yQSVEebSnAnyNMbuYjp+ihS60
 o9clJ9qdXx0Y3/3WB/J9PMGEyXN67WiuClDwAVMCBcnO7ISYV9CfYzx7/nhFmdt7
 096miIXCHGhnq5dICoNwqO8KLsg9pfPDOqtgVZ+oj0Xk2m7ufyBwVO2YYaFfY4Jm
 8HgYjj4XOtNBaw==
X-ME-Sender: <xms:XkZnYaBXVorL_JknrdmzaXQHbIvjWMn92Vl83if-Zt7CzLU7Dl5VxA>
 <xme:XkZnYUgr80gNFlXPniRpYLrBMoNBkfCV6D3XkOao8shW0zUGSG6PiW1Sqy-gb793t
 KhvwBGBiHYSQzN88Q>
X-ME-Received: <xmr:XkZnYdl1LNZSVD-HhelFonj_6JchRjKKG9F8smjtwW0gfTdCsg25DbDOt1bZVMF7mrxB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:XkZnYYyPvjlxGjOY9xLNCQRV_UZufQBkYcK5yB99WkRHcDAsMV7hNw>
 <xmx:XkZnYfSqbsT1pajaROMXAAO2YOL7KNDwLDnXTD4OR042rCp3CHN3qw>
 <xmx:XkZnYTaejMJwv8XYXZsu17udIj6ez6YkybclowjMl0KAZIUJJocsrw>
 <xmx:XkZnYU-rBs9JtJVaY-3AB4GX-2j7YauJk24E3f1v2N5DsjjoNBqtsg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:31 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 14/20] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() [part 3]
Date: Wed, 13 Oct 2021 22:48:40 +0200
Message-Id: <20211013204846.90026-15-greenfoo@u92.eu>
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

NOTE:

While the previous two commits were a simple "search and replace", this
time I had to do a bit of refactoring as only one call to
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

