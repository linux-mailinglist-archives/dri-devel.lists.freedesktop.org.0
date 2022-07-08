Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498656B647
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4328B11383D;
	Fri,  8 Jul 2022 09:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B59113852
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 48B0732009CD;
 Fri,  8 Jul 2022 05:58:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274286; x=1657360686; bh=Ya
 JyKR4koQ4CUFnFie99J/yX0cJTJA7jHSYG1qH22j0=; b=RUQ8HvabSq1eMy9MeO
 Evl5TEdJNC7DlO/mb4ZPtTbWqJmQCSu71KWohDTgSzCjDRbJupCi8buSaf0lvQs3
 1q7ok2OqsHwTnNtG+F2fiOnH351foYulfuVYUVgv7OzHenVVnDK/tf5xj0aQ6xnu
 b2i9KUBblzQe2Rw7H8u2wRcb/IjZToQSWZxqFQEj0KYVodMMaLJS+wAEAEFJJqKu
 YxAdVlENA9jfLNmwCBzIcVR2OaotWbtljyQAxp1oZMswIbaa0kNGpEaYf0XrVPgn
 VrM2lxliOG38JGYlev5HSTKjon0O6ofmW34IUGgNaOCbM3tuUcykcxINfIg2L7Kn
 gqbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274286; x=1657360686; bh=YaJyKR4koQ4CU
 FnFie99J/yX0cJTJA7jHSYG1qH22j0=; b=tSsqRTmD8115ih8NKqcihiPKhZ1x4
 7WbNl+gXoNlCtt1j/LZxXGSVU5gEl+panpSKZpTN/FwVWVOY/RqOErmBoEzrg15h
 sdI6eU1aqye131VBBhf/X+2SHC0lspqPb6wAQofhpvIVCz4v12DdrBlXDEiYADam
 LhcSgTNoZs37bj3uKT8uB6X+p057V35eASGya8Xj3969kTOSFBuVa55flCel+mNF
 ulXLhZB/HUdZsBtxL3aK41+zHxPm5lBVvqqYUu7Fa9CdDEMh9hWwQ/WDm7MO+iFY
 P3eAfig8Ev5GNQer/Pucj2956kUjOh5OyffucLnzo/ASymXXnX0ABBt2w==
X-ME-Sender: <xms:rv_HYj3gbwlicoWsSS1XbebvCxopY-LOcr1yYWcPjqYE9II0i-XMRw>
 <xme:rv_HYiFkS25GgC9NX1lUQsbJvi33YoN22O1FjU27MrJLOgu0Kjs01JRP7qtT-u1pH
 kLHd82n7xCeu1G7OMw>
X-ME-Received: <xmr:rv_HYj6g25VJFMcmz_KMTEs4vT4gxkA-6LKYKGmnR2ra_3le-nX9mMNeswqYLcu0-jrEPlG_jLQpKCrCu_4s6psUvExdzlrNNBXSF_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rv_HYo1ahuJth_6UQAPKNLA1GBWSnnu4hf68TCaGecffZlGKUaH3mQ>
 <xmx:rv_HYmEAzySELKNQERNbArrUdQh72RjOnh2kowOpFS570MXaKlAcpw>
 <xmx:rv_HYp_rzJ6fM5FUn80qW9TBJmn8ctEOtypbB8Yf6P6wCTUdMbzOvw>
 <xmx:rv_HYjNWuSVhOIzhstmg7EkCXs6PTzVBNwC0pxTlLcgRSOfHnWSeGg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 19/69] drm/vc4: plane: Switch to
 drmm_universal_plane_alloc()
Date: Fri,  8 Jul 2022 11:56:17 +0200
Message-Id: <20220708095707.257937-20-maxime@cerno.tech>
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

Let's switch to drmm_universal_plane_alloc() for our plane allocation and
initialisation to make the driver a bit simpler.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  1 -
 drivers/gpu/drm/vc4/vc4_plane.c | 23 ++++++++---------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 03a799ba9ee8..d7cc006b22c9 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1282,7 +1282,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	const struct vc4_pv_data *pv_data;
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
-	struct drm_plane *destroy_plane, *temp;
 	int ret;
 
 	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index a344762d86eb..82a650268f19 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1483,8 +1483,6 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs vc4_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
-	.set_property = NULL,
 	.reset = vc4_plane_reset,
 	.atomic_duplicate_state = vc4_plane_duplicate_state,
 	.atomic_destroy_state = vc4_plane_destroy_state,
@@ -1496,11 +1494,10 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 				 uint32_t possible_crtcs)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_plane *plane = NULL;
+	struct drm_plane *plane;
 	struct vc4_plane *vc4_plane;
 	u32 formats[ARRAY_SIZE(hvs_formats)];
 	int num_formats = 0;
-	int ret = 0;
 	unsigned i;
 	static const uint64_t modifiers[] = {
 		DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED,
@@ -1511,11 +1508,6 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		DRM_FORMAT_MOD_INVALID
 	};
 
-	vc4_plane = devm_kzalloc(dev->dev, sizeof(*vc4_plane),
-				 GFP_KERNEL);
-	if (!vc4_plane)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
 		if (!hvs_formats[i].hvs5_only || vc4->is_vc5) {
 			formats[num_formats] = hvs_formats[i].drm;
@@ -1523,13 +1515,14 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		}
 	}
 
+	vc4_plane = drmm_universal_plane_alloc(dev, struct vc4_plane, base,
+					       possible_crtcs,
+					       &vc4_plane_funcs,
+					       formats, num_formats,
+					       modifiers, type, NULL);
+	if (IS_ERR(vc4_plane))
+		return ERR_CAST(vc4_plane);
 	plane = &vc4_plane->base;
-	ret = drm_universal_plane_init(dev, plane, possible_crtcs,
-				       &vc4_plane_funcs,
-				       formats, num_formats,
-				       modifiers, type, NULL);
-	if (ret)
-		return ERR_PTR(ret);
 
 	if (vc4->is_vc5)
 		drm_plane_helper_add(plane, &vc5_plane_helper_funcs);
-- 
2.36.1

