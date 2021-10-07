Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9060425C20
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC436F4BD;
	Thu,  7 Oct 2021 19:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2496E833;
 Thu,  7 Oct 2021 19:39:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A3CDC2B00A16;
 Thu,  7 Oct 2021 15:39:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 07 Oct 2021 15:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=m/PMBB5pvKWQW
 STt/A5gkzeeMb050e+LA6tdqxnW7is=; b=oegF6ykCWZhbIGyq9jRWEhggaN292
 J1WBH+tuGc4EbvI2lJvpNaiXN2bfBzud3WnqNVnNkjMQ809iVxSMstqKB5u+8VEZ
 /ZIkI4APm6M25ZWJZFXNzFdrk91H7q243eKTK+yD8qek65zTIAvgEOtzn1pFn7/O
 As4SzzDO20H0RlFAdnfAQ1aKqUOBa3OPwMksWneB4m6vt0KzdSeAMyKueMDp35jb
 EF5i6LsqEzsaFhzM7VyWt6nMpecvsJeNtRUf6PY3irrrzTfuzm0ivdOGc3BeO82X
 tBHnYa/La1rZU2bY9+tOauRxwt9FhFI0KCOiezAOOt1MpftcMkssKrftQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=m/PMBB5pvKWQWSTt/A5gkzeeMb050e+LA6tdqxnW7is=; b=erj624Z2
 C0LfZTpyoyT2jOxJyMOlS8s5Da+2WRRg5bhE6SY3cBfNpqmTZZxEan+BCCTohyD+
 7x57v0+97FlmnWKiY7qA9UHhADF6L4YvW4X1Ze+ceUP/bj/DvO71T9MwA1SI1gg5
 GCfIZVg0qMgZaYD6m9f6AAsHTJxb13/WSbmOrjCQVNmEJfh9XC7GEFgUQ2cyAauL
 CUCMjmhAKeZd82cv6oP0I5TV8111WMr/hBFeBG/w2s79sy7DJ+IL7no2OUvqlD/P
 waumRTFV2eww9VMPbJ4elfbVe8yJdpS28dhrL7OoqXKGCchwJcebVUBPWn/u36b2
 zmPuvSDWYuH1dg==
X-ME-Sender: <xms:1UxfYU2NhbjU2K77oGXmjMMY3tSYer_0Coi3OMlPM84TKr5eovALPQ>
 <xme:1UxfYfFzwt52EEK-sM9QNQgyHktA6gvyFE4SHlK_beiHLOgedslvaN92yjd9tkIm3
 flSHZR7Euuvf0uk-g>
X-ME-Received: <xmr:1UxfYc47gmRvaAQ94FL5MOgQJ7xzW9zKuAF1dsPT7FGkmjgFUORYLnSeHYauuA1zJVsx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeefnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:1UxfYd32-dfhXbQPbNtiqz2WB1RQUMGdPDxP4HZW6CS2HRneXU-Txg>
 <xmx:1UxfYXFuOP_bHetkSAdg563tRVsL79kd5v2-FTbVbtE5RkaLpCckbA>
 <xmx:1UxfYW8oU60eFu5_2zXQp78usLZXX9aSe_owGwmmRHSBHDrMNhN_Vg>
 <xmx:1UxfYeCInqP8mxYpEXA3CJt1hvG9ZNBiaMuSmwdQuj1GsXwaG0FHUZ6KMWE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:59 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 14/20] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() [part 3]
Date: Thu,  7 Oct 2021 21:37:49 +0200
Message-Id: <20211007193755.29579-15-greenfoo@u92.eu>
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

