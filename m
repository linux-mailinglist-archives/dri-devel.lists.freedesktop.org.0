Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5EB56B632
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B30111383F;
	Fri,  8 Jul 2022 09:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0009113840
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 79A1D3200980;
 Fri,  8 Jul 2022 05:58:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274280; x=1657360680; bh=g+
 c2P0WM5+6YNkAz9QjIqt8yEn/XxjI5gjlYe1i0StA=; b=YABf9AyP2kqpceeXtf
 Emcn4dY4EfBwm9cwaBxH//0BNqKczJ2pYANHL85QzBLcAYRXM77U18/SFzMvllrG
 kDZEb6KBnpNJl5k0/nmME3myBJ0nGNKt/TAeIB8xpxameNfQC7zmxaRqpbAzUlMk
 MDHFFYajafjfl7T8XRn7EcJEgTRwvbcH4twjP/LxslWdFAQx3sG4NyZOy5PVH/Jf
 GBpJwmAhKYRoF2VTizKfCkEjJQTA82xHo53GYpEacfDZ/1B4tsS+TUVoORSBKsbi
 RwyUl7dALiXKUcDw5dwblBeMkBp1U8Zj0fiBAFGHBHCsQ0nB07Mc6yJz7M1u5vIC
 M0Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274280; x=1657360680; bh=g+c2P0WM5+6YN
 kAz9QjIqt8yEn/XxjI5gjlYe1i0StA=; b=BppWiU901C7nZxa+Fl4HDFZ++JVmx
 fp67OruDJQzAsH9KoWt18SdBslF9tC51xTdFoIE4kPQOQok3Mp5k7zWhPxxQI6GR
 SpUsHCxapeufoMNoBy6mWFxKIBkjdqh+jJ0RQ4IbGYTX0WPMV33FMo2vrpYrx8/V
 gszfW46jYF83pi+5d6jjPMiq0gbkF1dARKF2xK//7qmaL5u48M2hNSUt36V7Zsi9
 8BgaLtBWmY5RS42l3pSljCuihPNtpu77TpyUNniy0FdpyklQGnbfiOibiR2LmUTy
 t3AyhcWz7HJPdoYoG9ad+v+qOLIr48+LVmZttQYog17twoLRFRFnBCAjg==
X-ME-Sender: <xms:qP_HYt7NbVnYOoYf9Cvw1-1P-v_bOILtRSVyB6vj10ZalCIG3hkFrg>
 <xme:qP_HYq43VE-2eHXnto4Sk70fQ4lZOLphyLsXYgpgEfG2cvdAS5ScPBxYEsI6KbDbM
 1Hshw8DakBKAWWUbHQ>
X-ME-Received: <xmr:qP_HYkdhqqBdeZiW5GCLKI-S5cgI-MrlhS5dYVrz-sGgegzcAYosvOlNKEpK2U9OyPvvgWBHUndypy7he-C-scfznDIjESzVGsh_MPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qP_HYmKhSADdprzeBZxdqTHbs2D7VeJKcXyL5npi9_Dm-nQAAC4o3g>
 <xmx:qP_HYhKHhl68CqvsPbUL9jZbU7jmCCPUz46OpnD2DixUHT8jeb6xHQ>
 <xmx:qP_HYvxKIL6o8OAtAYVGHlmNHSjvPxkdRzrUUJj3yV_o7ygMPpok7w>
 <xmx:qP_HYvj0Dci1_joLlVmnYBNWn2us_bSuNWa4Yf8MCQpR6xHpulMGVg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 17/69] drm/vc4: plane: Take possible_crtcs as an argument
Date: Fri,  8 Jul 2022 11:56:15 +0200
Message-Id: <20220708095707.257937-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_plane_init() currently initialises the plane with no possible CRTCs,
and will expect the caller to set it up by itself.

Let's change that logic a bit to follow the syntax of
drm_universal_plane_init() and pass the possible CRTCs bitmask as an
argument to the function instead.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
 drivers/gpu/drm/vc4/vc4_plane.c | 15 +++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index faad9e564772..d391e894ee6c 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1244,7 +1244,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	 * requirement of the plane configuration, and reject ones
 	 * that will take too much.
 	 */
-	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY);
+	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY, 0);
 	if (IS_ERR(primary_plane)) {
 		dev_err(drm->dev, "failed to construct primary plane\n");
 		return PTR_ERR(primary_plane);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index de326cf10564..d935aa3e4409 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -960,7 +960,8 @@ int vc4_kms_load(struct drm_device *dev);
 
 /* vc4_plane.c */
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
-				 enum drm_plane_type type);
+				 enum drm_plane_type type,
+				 uint32_t possible_crtcs);
 int vc4_plane_create_additional_planes(struct drm_device *dev);
 u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist);
 u32 vc4_plane_dlist_size(const struct drm_plane_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index f27e87a23df7..a344762d86eb 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1492,7 +1492,8 @@ static const struct drm_plane_funcs vc4_plane_funcs = {
 };
 
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
-				 enum drm_plane_type type)
+				 enum drm_plane_type type,
+				 uint32_t possible_crtcs)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane = NULL;
@@ -1523,7 +1524,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	}
 
 	plane = &vc4_plane->base;
-	ret = drm_universal_plane_init(dev, plane, 0,
+	ret = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &vc4_plane_funcs,
 				       formats, num_formats,
 				       modifiers, type, NULL);
@@ -1575,13 +1576,11 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 	 */
 	for (i = 0; i < 16; i++) {
 		struct drm_plane *plane =
-			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
+			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY,
+				       GENMASK(drm->mode_config.num_crtc - 1, 0));
 
 		if (IS_ERR(plane))
 			continue;
-
-		plane->possible_crtcs =
-			GENMASK(drm->mode_config.num_crtc - 1, 0);
 	}
 
 	drm_for_each_crtc(crtc, drm) {
@@ -1589,9 +1588,9 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 		 * since we overlay planes on the CRTC in the order they were
 		 * initialized.
 		 */
-		cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR);
+		cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR,
+					      drm_crtc_mask(crtc));
 		if (!IS_ERR(cursor_plane)) {
-			cursor_plane->possible_crtcs = drm_crtc_mask(crtc);
 			crtc->cursor = cursor_plane;
 		}
 	}
-- 
2.36.1

