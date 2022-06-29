Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BAD55FFF8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A2314A606;
	Wed, 29 Jun 2022 12:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A004614A5F9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4FC16320016F;
 Wed, 29 Jun 2022 08:36:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 08:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506165; x=1656592565; bh=91
 lurKmm1tqn6SJOv7zffP6OCmiBZgzh4/Fai03d7dw=; b=TjqT/6+GcEwtIg7EHV
 g09pCGoITHZx9FkQQNKqwSVZBAp3IauSl270+NL11qTxc754Ep2JjoisPGYDBBAG
 WKZAXgI5H/vL4zBl7d7yBbtYdAX5+OBzNAcby7C8wzYTz69gHCig8cPnmUIcUvI+
 hw4vuo9oWe/kxBpMV65dsRZmJ3cWtN52qCSjee4C7QPz4Gw0pm7XEPe/goFEm5Ia
 eJrr0k14NlkhcY36QeTKzpT89TPWR4vaVFmXBMW396j6NpFFr/tibLE1IrMEvk8M
 HVR2WifIN5KQZVkdINzlwfM7w3HK53BeUcVjWWRg7G92XZT6lPWxp5PCCff2mELJ
 rm/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506165; x=1656592565; bh=91lurKmm1tqn6
 SJOv7zffP6OCmiBZgzh4/Fai03d7dw=; b=IceXqEj+j8KyymrwIWoEomJ75CZ8O
 bL0PR1ihIOGHVOxjeE8xxFGGR997wIzNmTlWTGbytRzEQNE7mzjzG6FPUcHz4uve
 /a5G8q5jVzF47eCzvJ7Xp6Ya0/oFAQGaG3dyFz9gO/NzGKx2uoA1CuP7hr5bM4vi
 33+RHeyMsha5kyXEjZm35zBxRkp5C6+X7opSXVQMP+8UKjvLi8KviAuk/icBzFTH
 gXm6aTBs5e0jk+xgjxghnVwXzjkhbQlIBq/WmajlmKZwgOL1WtlOvtLhzSnnd6Ir
 OKlTr8NdCVhf6+uPNjSnLkQ3/CG4e+xzbviX6JBhBaqPG5GQ0ML+SiMoA==
X-ME-Sender: <xms:NUe8YscOpxZoZvYrg0D4H8w1wQlaNu1LsPEGue697tYWckfidtRMjw>
 <xme:NUe8YuMw0jWQlHDmYgjoHzL-wxws7MsvHWaXhzfMk4Ms-w9Hwv4fTH_WWEE_6V1GV
 BmXJ5VqK626fLShtAk>
X-ME-Received: <xmr:NUe8YtgaD6UdIn1oEeZLNoMMmz4HpYyO73Nj_YnUCNTNPyU9RxSnYUrB7ACtXU89j5yRM4EMasMhqGNQ1gBqFCEw8begq9d8RdVWMIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NUe8Yh_qjy2VQ8dG-D3POOZbHpWlxrGLjQ1IR3Ndwj4_FzubNa6gSA>
 <xmx:NUe8YotNdqXNG0-vi_EIWFYyhFZb1Zg16-cn6gzOlZaYDibhdEN_sw>
 <xmx:NUe8YoGCFETd6rOpW_n5tiwqUnysKvPvdpPlRYbCP_4guOJlONCmkQ>
 <xmx:NUe8YiVxJJ8g8B6nKVeppw9hPANlQEyIqtYfkvHyWJpU-qJhPl1mng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 17/71] drm/vc4: plane: Take possible_crtcs as an argument
Date: Wed, 29 Jun 2022 14:34:16 +0200
Message-Id: <20220629123510.1915022-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

