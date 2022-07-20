Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C577257B301
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9905810E12E;
	Wed, 20 Jul 2022 08:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E38B10EDA4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:31:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7CCB371B1;
 Wed, 20 Jul 2022 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658305864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uo3H3Ybk3rhS2KCmQ8YoFaweH98PsElyhOJ2UIqI9o=;
 b=nlvvLDIgHJeFQSVJGXA73830p3ebaVKn30yZRGLoha66uWT2kr855S4CsFauxf2kAgqhDw
 +dxcgQkkfAifZuzFtSI3D4GGv3k8tZR1fgqiEma4U3Lixi/yFhNXJwhpMOyWiGms9cOd81
 pvxR+a0+zXMvwYcOqePF72LRctZElGo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658305864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uo3H3Ybk3rhS2KCmQ8YoFaweH98PsElyhOJ2UIqI9o=;
 b=h/f2XqytkoSCw7SGhi6xJuzRT3NQ8Ay7jJ/FN4wMJ2iHmOQalyQnr5Jye5X98qny1uUmEz
 FpCoEr18mAg6JZAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FD7B13AC3;
 Wed, 20 Jul 2022 08:31:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4NOBGki912IddAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 08:31:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, zackr@vmware.com,
 linux@armlinux.org.uk, stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH 3/7] drm/atomic-helper: Remove _HELPER_ infix from
 DRM_PLANE_HELPER_NO_SCALING
Date: Wed, 20 Jul 2022 10:30:54 +0200
Message-Id: <20220720083058.15371-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720083058.15371-1-tzimmermann@suse.de>
References: <20220720083058.15371-1-tzimmermann@suse.de>
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
Cc: linux-graphics-maintainer@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename DRM_PLANE_HELPER_NO_SCALING to DRM_PLANE_NO_SCALING. The constant
is not really a helper, but rather a characteristic of the plane itself.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  4 +--
 drivers/gpu/drm/arm/hdlcd_crtc.c              |  4 +--
 drivers/gpu/drm/ast/ast_mode.c                |  8 ++---
 drivers/gpu/drm/drm_plane_helper.c            |  4 +--
 drivers/gpu/drm/drm_simple_kms_helper.c       |  4 +--
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  4 +--
 drivers/gpu/drm/i915/display/intel_cursor.c   |  4 +--
 drivers/gpu/drm/i915/display/intel_sprite.c   |  8 ++---
 .../drm/i915/display/skl_universal_plane.c    |  4 +--
 drivers/gpu/drm/imx/ipuv3-plane.c             |  4 +--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  4 +--
 drivers/gpu/drm/kmb/kmb_plane.c               |  4 +--
 drivers/gpu/drm/logicvc/logicvc_layer.c       |  4 +--
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  8 ++---
 drivers/gpu/drm/meson/meson_plane.c           |  2 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             |  4 +--
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  4 +--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  4 +--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  8 ++---
 drivers/gpu/drm/sprd/sprd_dpu.c               |  4 +--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  4 +--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +--
 drivers/gpu/drm/tests/drm_plane_helper_test.c | 32 +++++++++----------
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  8 ++---
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  4 +--
 drivers/gpu/drm/vkms/vkms_plane.c             |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  8 ++---
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |  4 +--
 include/drm/drm_atomic_helper.h               |  2 +-
 33 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 108e8e8a1a36..a60cb6d84b79 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -282,8 +282,8 @@ static int amdgpu_vkms_plane_atomic_check(struct drm_plane *plane,
 		return PTR_ERR(crtc_state);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, true);
 	if (ret != 0)
 		return ret;
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 3313d75a8860..636ef9447830 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -251,8 +251,8 @@ static int hdlcd_plane_atomic_check(struct drm_plane *plane,
 			return -EINVAL;
 		return drm_atomic_helper_check_plane_state(new_plane_state,
 							   crtc_state,
-							   DRM_PLANE_HELPER_NO_SCALING,
-							   DRM_PLANE_HELPER_NO_SCALING,
+							   DRM_PLANE_NO_SCALING,
+							   DRM_PLANE_NO_SCALING,
 							   false, true);
 	}
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 7fd2e20f743d..103bd4fa698b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -554,8 +554,8 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						   new_plane_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, true);
 	if (ret)
 		return ret;
@@ -778,8 +778,8 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
 						   new_plane_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, true);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 838b32b70bce..bc08edd69030 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -179,8 +179,8 @@ static int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *c
 	ret = drm_plane_helper_check_update(plane, crtc, fb,
 					    &src, &dest,
 					    DRM_MODE_ROTATE_0,
-					    DRM_PLANE_HELPER_NO_SCALING,
-					    DRM_PLANE_HELPER_NO_SCALING,
+					    DRM_PLANE_NO_SCALING,
+					    DRM_PLANE_NO_SCALING,
 					    false, false, &visible);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 64800f158e69..e9f782119d3d 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -222,8 +222,8 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
 						   &pipe->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, false);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 6d22e6edef2a..0f35f2facdfc 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -325,8 +325,8 @@ i9xx_plane_check(struct intel_crtc_state *crtc_state,
 		return ret;
 
 	ret = intel_atomic_plane_check_clipping(plane_state, crtc_state,
-						DRM_PLANE_HELPER_NO_SCALING,
-						DRM_PLANE_HELPER_NO_SCALING,
+						DRM_PLANE_NO_SCALING,
+						DRM_PLANE_NO_SCALING,
 						i9xx_plane_has_windowing(plane));
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index e49927965a6b..16ac560eab49 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -143,8 +143,8 @@ static int intel_check_cursor(struct intel_crtc_state *crtc_state,
 	}
 
 	ret = intel_atomic_plane_check_clipping(plane_state, crtc_state,
-						DRM_PLANE_HELPER_NO_SCALING,
-						DRM_PLANE_HELPER_NO_SCALING,
+						DRM_PLANE_NO_SCALING,
+						DRM_PLANE_NO_SCALING,
 						true);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index a10c29226289..7649c50b5445 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1354,8 +1354,8 @@ g4x_sprite_check(struct intel_crtc_state *crtc_state,
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
-	int min_scale = DRM_PLANE_HELPER_NO_SCALING;
-	int max_scale = DRM_PLANE_HELPER_NO_SCALING;
+	int min_scale = DRM_PLANE_NO_SCALING;
+	int max_scale = DRM_PLANE_NO_SCALING;
 	int ret;
 
 	if (g4x_fb_scalable(plane_state->hw.fb)) {
@@ -1425,8 +1425,8 @@ vlv_sprite_check(struct intel_crtc_state *crtc_state,
 		return ret;
 
 	ret = intel_atomic_plane_check_clipping(plane_state, crtc_state,
-						DRM_PLANE_HELPER_NO_SCALING,
-						DRM_PLANE_HELPER_NO_SCALING,
+						DRM_PLANE_NO_SCALING,
+						DRM_PLANE_NO_SCALING,
 						true);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 87c202ec7d1e..4d6a27757065 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1855,8 +1855,8 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
-	int min_scale = DRM_PLANE_HELPER_NO_SCALING;
-	int max_scale = DRM_PLANE_HELPER_NO_SCALING;
+	int min_scale = DRM_PLANE_NO_SCALING;
+	int max_scale = DRM_PLANE_NO_SCALING;
 	int ret;
 
 	ret = skl_plane_check_fb(crtc_state, plane_state);
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 26a0e2e2a366..f1b397693af8 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -392,8 +392,8 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  can_position, true);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index be699cc993d5..f5835e6bf877 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -481,8 +481,8 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 		return PTR_ERR(priv_state);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  priv->soc_info->has_osd,
 						  true);
 	if (ret)
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 563b04ca80ee..e385b8741776 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -135,8 +135,8 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 						   new_plane_state->crtc);
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   can_position, true);
 }
 
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index adeea9fd11d5..466f9bd88bc1 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -116,8 +116,8 @@ static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
 		}
 	}
 
-	min_scale = DRM_PLANE_HELPER_NO_SCALING;
-	max_scale = DRM_PLANE_HELPER_NO_SCALING;
+	min_scale = DRM_PLANE_NO_SCALING;
+	max_scale = DRM_PLANE_NO_SCALING;
 
 	can_position = (drm_plane->type == DRM_PLANE_TYPE_OVERLAY &&
 			layer->index != (logicvc->config.layers_count - 1) &&
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 414269b0f8bc..2f5e007dd380 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -107,8 +107,8 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 		crtc_state = new_plane_state->crtc->state;
 
 	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   true, true);
 }
 
@@ -201,8 +201,8 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   true, true);
 }
 
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 973ea08ad1a7..f3d49e81acf4 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -94,7 +94,7 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
 						   FRAC_16_16(1, 5),
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   false, true);
 }
 
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 6b52280e3702..b27a54e31343 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -392,8 +392,8 @@ static int lcdif_plane_atomic_check(struct drm_plane *plane,
 						   &lcdif->crtc);
 
 	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   false, true);
 }
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 1279b4e1697d..2da2be6c11f2 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -530,8 +530,8 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 						   &mxsfb->crtc);
 
 	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   false, true);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 65cefaaf88f6..63f6ee6797bc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -237,8 +237,8 @@ base507c_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	int ret;
 
 	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, true);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 24f7b1963a2a..ec646a6f48d1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -102,8 +102,8 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	int ret;
 
 	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, true);
 	asyh->curs.visible = asyw->state.visible;
 	if (ret || !asyh->curs.visible)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index 41ac9c67667c..8c2da56defe0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -106,8 +106,8 @@ ovly507e_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 	int ret;
 
 	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, true);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index b8e4c44c0854..9cf599d14ce8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -296,8 +296,8 @@ wndwc37e_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 		 struct nv50_head_atom *asyh)
 {
 	return drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   true, true);
 }
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 473f634da964..8e729cc4c209 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -594,8 +594,8 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
 		return PTR_ERR(crtc_state);
 
 	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, true);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index efc783c8f653..bdd48f87d098 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -808,9 +808,9 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 	const struct vop_win_data *win = vop_win->data;
 	int ret;
 	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
-					DRM_PLANE_HELPER_NO_SCALING;
+					DRM_PLANE_NO_SCALING;
 	int max_scale = win->phy->scl ? FRAC_16_16(8, 1) :
-					DRM_PLANE_HELPER_NO_SCALING;
+					DRM_PLANE_NO_SCALING;
 
 	if (!crtc || WARN_ON(!fb))
 		return 0;
@@ -1059,9 +1059,9 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
 	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
-					DRM_PLANE_HELPER_NO_SCALING;
+					DRM_PLANE_NO_SCALING;
 	int max_scale = win->phy->scl ? FRAC_16_16(8, 1) :
-					DRM_PLANE_HELPER_NO_SCALING;
+					DRM_PLANE_NO_SCALING;
 	struct drm_crtc_state *crtc_state;
 
 	if (plane != new_plane_state->crtc->cursor)
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 03e760260d9c..10d21f7ab02d 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -523,8 +523,8 @@ static int sprd_plane_atomic_check(struct drm_plane *plane,
 		return PTR_ERR(crtc_state);
 
 	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, true);
 }
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index da1d4ec2e22b..06ed571c37f0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -245,8 +245,8 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
-	min_scale = DRM_PLANE_HELPER_NO_SCALING;
-	max_scale = DRM_PLANE_HELPER_NO_SCALING;
+	min_scale = DRM_PLANE_NO_SCALING;
+	max_scale = DRM_PLANE_NO_SCALING;
 
 	if (layer->mixer->cfg->scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_UI_SCALER_SCALE_MIN;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4bd295c2d340..b9473efa308d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -379,8 +379,8 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
-	min_scale = DRM_PLANE_HELPER_NO_SCALING;
-	max_scale = DRM_PLANE_HELPER_NO_SCALING;
+	min_scale = DRM_PLANE_NO_SCALING;
+	max_scale = DRM_PLANE_NO_SCALING;
 
 	if (layer->mixer->cfg->scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_VI_SCALER_SCALE_MIN;
diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
index ec1654cdfc42..be6cff0020ed 100644
--- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
@@ -104,8 +104,8 @@ static void igt_check_plane_state(struct kunit *test)
 	set_src(&plane_state, 0, 0, fb.width << 16, fb.height << 16);
 	set_crtc(&plane_state, 0, 0, fb.width, fb.height);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
@@ -115,8 +115,8 @@ static void igt_check_plane_state(struct kunit *test)
 	/* Rotated clipping + reflection, no scaling. */
 	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
@@ -128,15 +128,15 @@ static void igt_check_plane_state(struct kunit *test)
 	set_src(&plane_state, 0, 0, 1023 << 16, 767 << 16);
 	set_crtc(&plane_state, 0, 0, 1023, 767);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, false);
 	KUNIT_EXPECT_TRUE_MSG(test, ret,
 			      "Should not be able to position on the crtc with can_position=false\n");
 
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
@@ -148,12 +148,12 @@ static void igt_check_plane_state(struct kunit *test)
 	set_crtc(&plane_state, 0, 0, 1024, 768);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
 						  0x8001,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, false);
 	KUNIT_EXPECT_TRUE_MSG(test, ret, "Upscaling out of range should fail.\n");
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
 						  0x8000,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
@@ -162,11 +162,11 @@ static void igt_check_plane_state(struct kunit *test)
 
 	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  0x1ffff, false, false);
 	KUNIT_EXPECT_TRUE_MSG(test, ret, "Downscaling out of range should fail.\n");
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  0x20000, false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
@@ -177,7 +177,7 @@ static void igt_check_plane_state(struct kunit *test)
 	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
 	set_crtc(&plane_state, 1022, 766, 4, 4);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  0x10001,
 						  true, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
@@ -188,7 +188,7 @@ static void igt_check_plane_state(struct kunit *test)
 	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
 	set_crtc(&plane_state, -2, -2, 1028, 772);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  0x10001,
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
@@ -201,7 +201,7 @@ static void igt_check_plane_state(struct kunit *test)
 	set_crtc(&plane_state, 1022, 766, 4, 4);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
 						  0xffff,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
@@ -213,7 +213,7 @@ static void igt_check_plane_state(struct kunit *test)
 	set_crtc(&plane_state, -2, -2, 1028, 772);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
 						  0xffff,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index fa0d73ce07bc..604ebfbef314 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -269,8 +269,8 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
 	}
 
 	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   false, true);
 }
 
@@ -351,8 +351,8 @@ static int vbox_cursor_atomic_check(struct drm_plane *plane,
 	}
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, true);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 58f4a52d039e..fb9dc63d33c7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -99,8 +99,8 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
                 return PTR_ERR(crtc_state);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  is_cursor, true);
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 22238db6f8a5..8a810bfa1264 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -138,8 +138,8 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 		can_position = true;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  can_position, true);
 	if (ret != 0)
 		return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index a19580109f33..214829c32ed8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -719,8 +719,8 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
 							   new_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  false, true);
 
 	if (!ret && new_fb) {
@@ -761,8 +761,8 @@ int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
 							   new_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
-						  DRM_PLANE_HELPER_NO_SCALING,
-						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
 						  true, true);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index d3bdecabf4e5..a769422e3f1d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1150,8 +1150,8 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
 
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
 						   false, false);
 }
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index ab778aad7359..54b321f20d53 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -41,7 +41,7 @@
  * Due to src being in 16.16 fixed point and dest being in integer pixels,
  * 1<<16 represents no scaling.
  */
-#define DRM_PLANE_HELPER_NO_SCALING (1<<16)
+#define DRM_PLANE_NO_SCALING (1<<16)
 
 struct drm_atomic_state;
 struct drm_private_obj;
-- 
2.36.1

