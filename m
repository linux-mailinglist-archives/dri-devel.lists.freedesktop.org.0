Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEC455FFFB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0870514A60C;
	Wed, 29 Jun 2022 12:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B45A14A5FD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2A7AD320094B;
 Wed, 29 Jun 2022 08:36:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506171; x=1656592571; bh=8C
 /o8xvI35o6nqyATa1nClcE5LaSl6ghGi4qaeTJfds=; b=ZUqQH/hg5WxYQ2SaC8
 1EcmUkXrEqA6OOtjWAfdNRpaB6I7mpLxgkBkfczV24HyJqPKdsNy4RWQbczEpwll
 lu/vt6eKR99AP3hLN04ObfjnG35wFYbaZfJ+uKZaVOv5S9I2yfqAZi3uyd87Trqa
 gjmOSGLEE44P9S7FWXHuB9aLBMH47ybl8eqCLBEEp2/BSu/DNV6CddEIo5Pczl7i
 wtLp7rrhlucl8hWjXNP3OvLd0wyPVUMgn6T/gq9y0q55iJpNX6swgEgT6E3+pCJL
 vNjV2f3/41W2db+u/VMR93UXfQjkGeRGP2e5u9Rm6daGJPAs00r5nmbWrX6Mo/KQ
 V+4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506171; x=1656592571; bh=8C/o8xvI35o6n
 qyATa1nClcE5LaSl6ghGi4qaeTJfds=; b=N176YUQQBmlGR+y0kMZRSQNkGNUN/
 ZhEyVGHGbK/AdgOHl6v82RwKkVHAW99CHDR8Q3qAZVpr3+v8nMBeg8SSQ+F68y3P
 jcheaftOFaHoBL6gebGibEUjd5cSil9efyNmFnq39CJnZ+8BkZUkD8qHt1Z34XB7
 O/ASPDOy0/uaXayzIaNziVAtW8UONZlSrZEXb9h3vxkdKjIhbauJj/NQ4SJt8as3
 H0rFX8CKxC055IR6AqvJjVnQZjM5QpDoMUo7A9Fook3CA25PHgncgjO1pFfFSxbC
 Pp/szCENBxfmXvl0kh2WCPPCla9rT4K7CKQV//NUBzNIQfas9eBRMOYTg==
X-ME-Sender: <xms:O0e8Yg0nfesOcI8vcV7sbfJ6M67jH9UJTaqe_0lXbZXCPCmxxOQr_A>
 <xme:O0e8YrFqUUM_3Bj1WV7bhVI18hy52f0wfpmxWOsnSNmTF7TQB918MiJ3t_-lkRp90
 ZLeZPaH0AL4rUH654Q>
X-ME-Received: <xmr:O0e8Yo7LEaAWMje_g4Y_J0dvaZh7Q4n-DePB4orYZ6XZgu_HHjAD8tnUOxn0uehIYSmCKDJYCUU3uSxyWsR_K_iNL9yFSPf3HddvAxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:O0e8Yp2rQDR6xvi-EN2Jvm3IbFw6ulOCjk1yb1biTjTWNIyYEk6AUg>
 <xmx:O0e8YjHkt_Dv4pj-ZfSFLMGhpkrJR4gS71m15G8EqNosSCDhw0lbeg>
 <xmx:O0e8Yi_LYhG6W1b0slhletny7EoJUvdLCSgs4KwsKLJFJ_LmzAkWJQ>
 <xmx:O0e8YkPav2eKe7jypDdJjetNuh8NJDVLwWvAk1lsyiyNgcfUqrhWKQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 19/71] drm/vc4: plane: Switch to
 drmm_universal_plane_alloc()
Date: Wed, 29 Jun 2022 14:34:18 +0200
Message-Id: <20220629123510.1915022-20-maxime@cerno.tech>
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

Let's switch to drmm_universal_plane_alloc() for our plane allocation and
initialisation to make the driver a bit simpler.

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

