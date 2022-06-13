Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F845485C5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0624410E810;
	Mon, 13 Jun 2022 14:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6875510E829
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 28098320090B;
 Mon, 13 Jun 2022 10:48:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 13 Jun 2022 10:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131702; x=1655218102; bh=Nc
 H9osaW1EWuY+b0TQIg858LGFhTid6Sxfvd8j9WYlk=; b=R996hmTAdrfo2NFOPM
 12xXMWvCiR1la892XfJ4sAkFFU6YlbDQXxLFmsafF7ClNKnGOeadBvG+VZWSGo/M
 PiQJrL+9gDQgMFrS9FqbYqjRlnDsLtdiH1H4866sDUMFC3CkAQbwve+1ouXiQMU1
 tNXyUnXY8zDn2YshFCHWMgkw8CS+LOX14RQ19MzWXdBdOjGmrmPajEwxnAoduUYx
 lZF+2QtKqLJbnC6tizpjjWOjmFl/TnKvSxqPtjhspuAyDGv7tWF5yH34ss1B5kPf
 MLdQPHufy42MBv3/Dvi1B3O7+RXo6XkGDqOYSCmGR2q9xu75lH4RbBleww0BQKpR
 Q1Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131702; x=1655218102; bh=NcH9osaW1EWuY
 +b0TQIg858LGFhTid6Sxfvd8j9WYlk=; b=rhkMLIdoHl2sIiYM8mOIN+DARoK82
 i0f2yMCaev+4Sv3+3ZLJ4OdURTiIHTup5p8O1wUbpV25bNnxBRuBBrBPcsXAF99p
 CvJdszdkPXzaQKnt0I0yHrkcy42IucU5KHGsW+oSX5YhIXH2ugdZ9pF9ba0SUKyX
 2qSXoeiokNHuAXzRc716wZjyNAPlEra5dvsWWbcri6inhUhjjiOMSufYx5EA6DKN
 fRhLKOIqpigEmGMJ/B/tT6vZfOnD+cNGKRXQolamT/Qy2Y2pDwC2igTckCwv7SEF
 VisxbxEVImgsv/FS8bttw5jYEHyrN5omurm8YDeRLKt3KzOLGEmGKlE3A==
X-ME-Sender: <xms:Nk6nYprtIct634HIqKo9PMZlT1YeLDO62cFSHYKTjYLfG8aE00K6hA>
 <xme:Nk6nYrqi2NZSaofYKON3uVzJZcE-3IND6lkkGLM7gAmdF_OpfYn-q13ZHwKnBHvfh
 sxHHqloszndsWiEaR0>
X-ME-Received: <xmr:Nk6nYmO9SGPCe05jAeYSFp2m0bNMyj2AKKW1lRUed3ijv618k2UYYEksLyDGywlqKiMWO_wCOYMWUZeBnhPnF1PpK2GaW63-3aesydo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Nk6nYk4BR1ZhcvP4hnJifDYQlEDinyjdCwXyjiduQHEjXN9rtIFh0w>
 <xmx:Nk6nYo5mk5t27U6ToT3kYyn8wyzokSQPFYg73XHrufEo1kN7yQ0jng>
 <xmx:Nk6nYsjatNsfIVJKX94iGvGSzttMnVga9MRO32HhK5shnWdt6WaekA>
 <xmx:Nk6nYiQRTodNHGxD8T5UMBsouDGgm9YetWkwQZXF2zbJbq_CPEdM7Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 06/33] drm/vc4: plane: Add alpha_blend_mode property to each
 plane.
Date: Mon, 13 Jun 2022 16:47:33 +0200
Message-Id: <20220613144800.326124-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Move from only supporting the default of pre-multiplied
alpha to supporting user specified blend mode using the
standardised property.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 62 ++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index a64324179650..ac250a592fad 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -664,6 +664,48 @@ static const u32 colorspace_coeffs[2][DRM_COLOR_ENCODING_MAX][3] = {
 	}
 };
 
+static u32 vc4_hvs4_get_alpha_blend_mode(struct drm_plane_state *state)
+{
+	if (!state->fb->format->has_alpha)
+		return VC4_SET_FIELD(SCALER_POS2_ALPHA_MODE_FIXED,
+				     SCALER_POS2_ALPHA_MODE);
+
+	switch (state->pixel_blend_mode) {
+	case DRM_MODE_BLEND_PIXEL_NONE:
+		return VC4_SET_FIELD(SCALER_POS2_ALPHA_MODE_FIXED,
+				     SCALER_POS2_ALPHA_MODE);
+	default:
+	case DRM_MODE_BLEND_PREMULTI:
+		return VC4_SET_FIELD(SCALER_POS2_ALPHA_MODE_PIPELINE,
+				     SCALER_POS2_ALPHA_MODE) |
+			SCALER_POS2_ALPHA_PREMULT;
+	case DRM_MODE_BLEND_COVERAGE:
+		return VC4_SET_FIELD(SCALER_POS2_ALPHA_MODE_PIPELINE,
+				     SCALER_POS2_ALPHA_MODE);
+	}
+}
+
+static u32 vc4_hvs5_get_alpha_blend_mode(struct drm_plane_state *state)
+{
+	if (!state->fb->format->has_alpha)
+		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
+				     SCALER5_CTL2_ALPHA_MODE);
+
+	switch (state->pixel_blend_mode) {
+	case DRM_MODE_BLEND_PIXEL_NONE:
+		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
+				     SCALER5_CTL2_ALPHA_MODE);
+	default:
+	case DRM_MODE_BLEND_PREMULTI:
+		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
+				     SCALER5_CTL2_ALPHA_MODE) |
+			SCALER5_CTL2_ALPHA_PREMULT;
+	case DRM_MODE_BLEND_COVERAGE:
+		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
+				     SCALER5_CTL2_ALPHA_MODE);
+	}
+}
+
 /* Writes out a full display list for an active plane to the plane's
  * private dlist state.
  */
@@ -946,13 +988,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		/* Position Word 2: Source Image Size, Alpha */
 		vc4_state->pos2_offset = vc4_state->dlist_count;
 		vc4_dlist_write(vc4_state,
-				VC4_SET_FIELD(fb->format->has_alpha ?
-					      SCALER_POS2_ALPHA_MODE_PIPELINE :
-					      SCALER_POS2_ALPHA_MODE_FIXED,
-					      SCALER_POS2_ALPHA_MODE) |
 				(mix_plane_alpha ? SCALER_POS2_ALPHA_MIX : 0) |
-				(fb->format->has_alpha ?
-						SCALER_POS2_ALPHA_PREMULT : 0) |
+				vc4_hvs4_get_alpha_blend_mode(state) |
 				VC4_SET_FIELD(vc4_state->src_w[0],
 					      SCALER_POS2_WIDTH) |
 				VC4_SET_FIELD(vc4_state->src_h[0],
@@ -997,14 +1034,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		vc4_dlist_write(vc4_state,
 				VC4_SET_FIELD(state->alpha >> 4,
 					      SCALER5_CTL2_ALPHA) |
-				(fb->format->has_alpha ?
-					SCALER5_CTL2_ALPHA_PREMULT : 0) |
+				vc4_hvs5_get_alpha_blend_mode(state) |
 				(mix_plane_alpha ?
-					SCALER5_CTL2_ALPHA_MIX : 0) |
-				VC4_SET_FIELD(fb->format->has_alpha ?
-				      SCALER5_CTL2_ALPHA_MODE_PIPELINE :
-				      SCALER5_CTL2_ALPHA_MODE_FIXED,
-				      SCALER5_CTL2_ALPHA_MODE)
+					SCALER5_CTL2_ALPHA_MIX : 0)
 			       );
 
 		/* Position Word 1: Scaled Image Dimensions. */
@@ -1489,6 +1521,10 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
 
 	drm_plane_create_alpha_property(plane);
+	drm_plane_create_blend_mode_property(plane,
+					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					     BIT(DRM_MODE_BLEND_PREMULTI) |
+					     BIT(DRM_MODE_BLEND_COVERAGE));
 	drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_0 |
 					   DRM_MODE_ROTATE_180 |
-- 
2.36.1

