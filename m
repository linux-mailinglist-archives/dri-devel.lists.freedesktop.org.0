Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58354622B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F59F11B0C1;
	Fri, 10 Jun 2022 09:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02E411AC7A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A71C5C01A4;
 Fri, 10 Jun 2022 05:29:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853397; x=1654939797; bh=sr
 6KxrNXyjvzI5NYOuI+gAoe8WzMLV8JClZVQ0jL3FE=; b=hFpzVXR2Vq52Kobmh+
 BxRKakbjTrPLWv4urHPJMWSe2iXYCoOCfjxZlZKH/6ZMKiOdqYdyyVUyxAWq4uU1
 MBNIzxHATvKUc2p30Cq7XQuDGbc/Lr72s/FiF010ghzQq+olzuNpqO2cOhTEVayV
 TYrvGZe4FpbFzq1JMc8qLbwuPUF+GZyA1pbKZnbW37vOkZMruboo+WUqIsxgpr7y
 2MWQDMSK3xjY+CCp3spVANTRwE4f+Y2D3LX9gHbdgiGk6CikbFlMNzim/J19Kk07
 8siscGNpf5lqIgJgdGzt81iJx68l7FVMzW0mwrHMSLSKUms9JgKr4P5r0LoEIoZJ
 iZrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853397; x=1654939797; bh=sr6KxrNXyjvzI
 5NYOuI+gAoe8WzMLV8JClZVQ0jL3FE=; b=AqleKCz1zIiCHjHxXoE0xRNWaXBH/
 4l9jDzUNJAmeLIGtj94rg/VANV7pHYYsFg/TBF3k0qqQ+DwVRkM3mgtJNkAymRsn
 bjW9ggYHpFIrI/4fHnocnLdbwwwFCnpb0aUreJzc0Ok/YNdfTlbNlHD2tsozY5V3
 lF/8RIZ3Lw45etPEXnAjmErnefVls/uHu37TUKg2bAytsrEFR74ip6ZEWeETxALl
 etbzPHV3Atry1XPLbKwVlEoUL6yZuW3/4wrhZ4ZSZci/ebcCWki3Z6uMqdGXDtH0
 a4Vg0I5kME0aw79ad7C/QtFLudSyjO9e0euONNlo7i9k9b+e6HiJRh84A==
X-ME-Sender: <xms:FA-jYnuq4Swe6DB7BpVjiW9U3KyKSYc_NTGHg8J80VlqQ6nWbQ-uDA>
 <xme:FA-jYoc0mvZS-ms1T0NJNJscYoN8GO8hKNpsClHkbsQMYporZcwzvd1wXv4Rh1sTo
 pe-pv1VN3iG6dG4sXg>
X-ME-Received: <xmr:FA-jYqz_rQBzFoL4YPTBNwf4vMjrY1OO0VcSkP8-uQehqWtOyfjXWWTJOY6jmErfrL63KhzimehgRJKtMQw4e1i2QvImPbfzT8WAjis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FA-jYmPQPb2vHpoEEc1P7tg_z3MYpTXerDony--nRc7W5_KykZcg_Q>
 <xmx:FA-jYn9wEk5O9nSMRHpgHETvGflOu4wBKAyejlFeJGgh-tZH97hvew>
 <xmx:FA-jYmWc5ibhpeqSM1xkBv773_a5bWSq5NgCV4luLS-ql2pJAHmjkQ>
 <xmx:FQ-jYjYfrOYI4p4oYTdAybjnt8oCw_i1kOGwOzvKFLz5O7dgEzbbQA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 16/64] drm/vc4: plane: Switch to drmm_universal_plane_alloc()
Date: Fri, 10 Jun 2022 11:28:36 +0200
Message-Id: <20220610092924.754942-17-maxime@cerno.tech>
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

Let's switch to drmm_universal_plane_alloc() for our plane allocation and
initialisation to make the driver a bit simpler.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  | 12 +-----------
 drivers/gpu/drm/vc4/vc4_plane.c | 23 ++++++++---------------
 2 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 840a93484bb1..7163f924b48b 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1176,7 +1176,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	const struct vc4_pv_data *pv_data;
 	struct vc4_crtc *vc4_crtc;
 	struct drm_crtc *crtc;
-	struct drm_plane *destroy_plane, *temp;
 	int ret;
 
 	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
@@ -1211,7 +1210,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 			       IRQF_SHARED,
 			       "vc4 crtc", vc4_crtc);
 	if (ret)
-		goto err_destroy_planes;
+		return ret;
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
@@ -1219,15 +1218,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 				 &vc4_crtc->regset);
 
 	return 0;
-
-err_destroy_planes:
-	list_for_each_entry_safe(destroy_plane, temp,
-				 &drm->mode_config.plane_list, head) {
-		if (destroy_plane->possible_crtcs == drm_crtc_mask(crtc))
-		    destroy_plane->funcs->destroy(destroy_plane);
-	}
-
-	return ret;
 }
 
 static void vc4_crtc_unbind(struct device *dev, struct device *master,
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 17dab470ecdf..673c963f5c5a 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1442,8 +1442,6 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs vc4_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
-	.set_property = NULL,
 	.reset = vc4_plane_reset,
 	.atomic_duplicate_state = vc4_plane_duplicate_state,
 	.atomic_destroy_state = vc4_plane_destroy_state,
@@ -1454,11 +1452,10 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 				 enum drm_plane_type type,
 				 unsigned int possible_crtcs)
 {
-	struct drm_plane *plane = NULL;
+	struct drm_plane *plane;
 	struct vc4_plane *vc4_plane;
 	u32 formats[ARRAY_SIZE(hvs_formats)];
 	int num_formats = 0;
-	int ret = 0;
 	unsigned i;
 	bool hvs5 = of_device_is_compatible(dev->dev->of_node,
 					    "brcm,bcm2711-vc5");
@@ -1471,11 +1468,6 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		DRM_FORMAT_MOD_INVALID
 	};
 
-	vc4_plane = devm_kzalloc(dev->dev, sizeof(*vc4_plane),
-				 GFP_KERNEL);
-	if (!vc4_plane)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
 		if (!hvs_formats[i].hvs5_only || hvs5) {
 			formats[num_formats] = hvs_formats[i].drm;
@@ -1483,13 +1475,14 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
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
 
 	drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
 
-- 
2.36.1

