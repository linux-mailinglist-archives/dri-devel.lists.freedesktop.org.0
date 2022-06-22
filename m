Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA16554D27
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3FE112B32;
	Wed, 22 Jun 2022 14:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FFB112B32
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A1B313200990;
 Wed, 22 Jun 2022 10:33:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908384; x=1655994784; bh=84
 QsY/cqJc/K2oyYWolF3usFMRYYW9uxRW/PRd2Liyk=; b=1OqTbN/FZKjE8H4+kr
 HXsyVoZAi0XACGGs+bslnk93sqztDtkHdaSstHybTiO/k6126ElpGE14439srmBd
 Se5EJ4eThA0haYt3PsDkV+f4bj7rokUw7dBrFM3o5bneeZ7w3iN5A61wrXTybRMP
 q8+ZFADx3T7EWMSZWCUpdqCtOVyYkAYtljngZcj8Ey8KMruYLIwSLwWrWkR6l1BX
 dW0ckp85Mn4dDwC+IICFj6FPQnkUsNKIZnTviZcBT4K/A76it3PMGLLIoGvsXduB
 EcHNB5jk1iEnbuKJlKhjirmP78x5MVMybG2fkXg+VUGD64F3p0WEGloD6phi2fCR
 NibQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908384; x=1655994784; bh=84QsY/cqJc/K2
 oyYWolF3usFMRYYW9uxRW/PRd2Liyk=; b=faT7clZRbldCRh5gxXv2iKi+RKpu7
 wGQhNtwJ6rg2GnllwbvYlyqxaPjJR24T4AZe58faEKpO9mBPHfQcuEPTvnKzTC0j
 Yry3Hrcjn544sQ07GC32Fhq652s+jAJHaIjVeS8G9dB+Cu0W/b4GFucFopR7Fidg
 /CUCHMq8yh5EVd5k/LefZrxDaoCHn2vxauyBhMEBDgIuXn/RwrEUdi698yJRujyc
 pEC6m5lYK9XdaTtTUfXEqXewsbxE+0jw4y9Nr6SVJBFdLM34jUmj2ZPWLT4FA5YN
 dRgLHhfR3wm6IvISPmtgU7XBEkWN3pRcaInKAIXTw1taJ9fDWKjPbNTHQ==
X-ME-Sender: <xms:HyizYvtuEKBXxwtt3MvtVBkgoaxY5R490_FqTkVlBi1NwqxeA83vEg>
 <xme:HyizYgffDiyKFFsvxVqDLiuNsuiOxWx0K2M1UiJD_N7GOxIXWmzhw75RcEa5Isus0
 K-6MBLm_bp_MKYf4Vk>
X-ME-Received: <xmr:HyizYiyYicJStb0oU4SbaHGLoU8lSNGQCJqh2LSj0fNQ7WJgTpvNaUF2TUWZeoLBiigzV0CHoPkyjr7k3mtaS0kLMuKDElQrmP9mRTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ICizYuO-wCgfHfxhHYDTpc5RbQWil2vyWbGC79kZkEx-nQrLGVYHxQ>
 <xmx:ICizYv_8GJVo_QYCZ-viCPHU-GNo8A1CsFSmTKCU-S-GKDECYkIkBw>
 <xmx:ICizYuVu68xt_xw4_6tgFraLGas5tASWfg0R6KZGI29_On7My7hKHw>
 <xmx:ICizYqlqPMsmhP5GH-OLSsBkY0CSF_XUcNP8_znXgMNbovfZpim1cA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 16/68] drm/vc4: plane: Take possible_crtcs as an argument
Date: Wed, 22 Jun 2022 16:31:17 +0200
Message-Id: <20220622143209.600298-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
 drivers/gpu/drm/vc4/vc4_plane.c | 15 +++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 49ff0506e551..32c0dd6a7348 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1239,7 +1239,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	 * requirement of the plane configuration, and reject ones
 	 * that will take too much.
 	 */
-	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY);
+	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY, 0);
 	if (IS_ERR(primary_plane)) {
 		dev_err(drm->dev, "failed to construct primary plane\n");
 		return PTR_ERR(primary_plane);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index da52d1e0c7b5..91983fbd4d83 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -959,7 +959,8 @@ int vc4_kms_load(struct drm_device *dev);
 
 /* vc4_plane.c */
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
-				 enum drm_plane_type type);
+				 enum drm_plane_type type,
+				 uint32_t possible_crtcs);
 int vc4_plane_create_additional_planes(struct drm_device *dev);
 u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist);
 u32 vc4_plane_dlist_size(const struct drm_plane_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 1e866dc00ac3..bc1f1c4172e7 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1462,7 +1462,8 @@ static const struct drm_plane_funcs vc4_plane_funcs = {
 };
 
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
-				 enum drm_plane_type type)
+				 enum drm_plane_type type,
+				 uint32_t possible_crtcs)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane = NULL;
@@ -1493,7 +1494,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	}
 
 	plane = &vc4_plane->base;
-	ret = drm_universal_plane_init(dev, plane, 0,
+	ret = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &vc4_plane_funcs,
 				       formats, num_formats,
 				       modifiers, type, NULL);
@@ -1541,13 +1542,11 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
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
@@ -1555,9 +1554,9 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
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

