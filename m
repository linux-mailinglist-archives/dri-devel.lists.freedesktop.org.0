Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2954622A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC90111A59A;
	Fri, 10 Jun 2022 09:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B03711A6C4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 478CF5C01AF;
 Fri, 10 Jun 2022 05:29:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853395; x=1654939795; bh=PG
 ND20+ItOyGj40ROeFaAz86gueO/2QtaxsZFB0Mnb0=; b=En1ccT5eVIQSLOU8b4
 CWkLJ2+trF/ydeklyXZOIWmUEzj2Mg8g9sX1hRVOXjXiK1mTZE8YmnENIMFyVVsg
 +7PjHVzerww/v7rno/i4Gj+6dgyZ4w5bP4IiDnahkjpFLgIdfL0TbLnsjF0ni4i/
 Dg4KDzZDuTYrNRmnvPxCTlJhl1i+V8pz6x4O8qa33MwYH0ONPM2Mv8z+tBRaO2Ac
 ttjs3lOJDRiXxjI7TZT4GKUPSrr86jy3BnWfRB82yx1cMdNHzYTDQFoQwpZVeMN8
 /L7Y3zjzraI/IEUeWzaTC3ug1htXhTQjsph5HK98r5OE672nOv/jec6fgdrjQPJ5
 Tszw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853395; x=1654939795; bh=PGND20+ItOyGj
 40ROeFaAz86gueO/2QtaxsZFB0Mnb0=; b=hg1plW7Ep34ujMuwk1r+fAKYOA1Rs
 268QVOq0OTZwKZVCfF4mrqFQnX3vPqgvsHIsU+P2R5t0wH5kDeEJy0LK3+/dZukT
 g+d1r5o+KXV8Khf0qXn0YbNBvYzmb/sgrcHoDlOp63sbQCbqlE9xAEPpYvz2kqTV
 KKmnIEFuUGg5q5vVKTQ342HRF1YgAdmVZRicNQGzLQmITWeTEy2xrYwWjL96Eeas
 xwrPQapLMHGkUWQTAapFqERsx21exlJDjz5Gcr+yp0J5PmtpTmXhNiOw1BFLcA4f
 lznxRRQIcIrm+i0t1ZRxfySueYY8Z/DlMVMRM0/uqeSjQ0WAV+5FjM5TA==
X-ME-Sender: <xms:Ew-jYkkAWR_WSzUmqNPqFEb-u1fGmH1Nf15KUzJf9HoiIgRm1cOL6g>
 <xme:Ew-jYj3RaChwbUYvES3c3pKr_Recu7DZAtm61cHKA1kIPeQ0gKPfpcaeQzNQey57t
 5EcNpsyClebNBr24xU>
X-ME-Received: <xmr:Ew-jYio9OiLvcvNb4WxawQf079FIKrG4PhEq93zgzUryaLBBv7PzZ9miiqhj8aHt3vuSqGpf8q1Gb1MrYiB8HtWDajY2dR5FGY2oOww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ew-jYgkzW_lB1-xtX_VDmfuInOIqtQi81uU8-kAemAO_zKeYPSIoZw>
 <xmx:Ew-jYi2VPjI7SWNwsOFGU---ltX-1E61TGQZTXoxPcQJlT-2f7KtRw>
 <xmx:Ew-jYnuODqtR8ZzQo9UrxXkYFY3gvY7jHi0kCT_RMP7ELTMB37YS2w>
 <xmx:Ew-jYlRECkj-SR6jGeMPJEWDh6b-gHe76KqkySYDgQveoAxoGkHKTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 15/64] drm/vc4: plane: Take possible_crtcs as an argument
Date: Fri, 10 Jun 2022 11:28:35 +0200
Message-Id: <20220610092924.754942-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_plane_init() currently initialises the plane with no possible CRTCs,
and will expect the caller to set it up by itself.

Let's change that logic a bit to follow the syntax of
drm_universal_plane_init() and pass the possible CRTCs bitmask as an
argument to the function instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
 drivers/gpu/drm/vc4/vc4_plane.c | 15 +++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 59b20c8f132b..840a93484bb1 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1138,7 +1138,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	 * requirement of the plane configuration, and reject ones
 	 * that will take too much.
 	 */
-	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY);
+	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY, 0);
 	if (IS_ERR(primary_plane)) {
 		dev_err(drm->dev, "failed to construct primary plane\n");
 		return PTR_ERR(primary_plane);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 080deae55f64..5125ca1a8158 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -952,7 +952,8 @@ int vc4_kms_load(struct drm_device *dev);
 
 /* vc4_plane.c */
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
-				 enum drm_plane_type type);
+				 enum drm_plane_type type,
+				 unsigned int possible_crtcs);
 int vc4_plane_create_additional_planes(struct drm_device *dev);
 u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist);
 u32 vc4_plane_dlist_size(const struct drm_plane_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index b3438f4a81ce..17dab470ecdf 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1451,7 +1451,8 @@ static const struct drm_plane_funcs vc4_plane_funcs = {
 };
 
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
-				 enum drm_plane_type type)
+				 enum drm_plane_type type,
+				 unsigned int possible_crtcs)
 {
 	struct drm_plane *plane = NULL;
 	struct vc4_plane *vc4_plane;
@@ -1483,7 +1484,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	}
 
 	plane = &vc4_plane->base;
-	ret = drm_universal_plane_init(dev, plane, 0,
+	ret = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &vc4_plane_funcs,
 				       formats, num_formats,
 				       modifiers, type, NULL);
@@ -1528,13 +1529,11 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
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
@@ -1542,9 +1541,9 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
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

