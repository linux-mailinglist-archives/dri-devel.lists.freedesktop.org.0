Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23354625E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1DD12B568;
	Fri, 10 Jun 2022 09:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CD512B4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0CE145C00C7;
 Fri, 10 Jun 2022 05:30:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853458; x=1654939858; bh=kH
 R33dfNYe7+6PLSxTtiGyFtwzToLLsjHgA9uuXNoGQ=; b=qA+NqqyKG1DeQiQIAS
 kgYG9WlMu8leHNYUdJTVTGirsu8tkQQ6kIxUPfjX0I36nZH/ChSeXza/WnYLogD5
 z+Nvu/xT2/lkLTuWBe4R8x2qVpuyjiFiY3Q/vVUO6hbLKBvu+A8NBnRU3SxfOWFN
 WHRlv7xZbJH3NfBvrKlgNZX8vl76LwmypnVU8iPPmb1Y+J6EwWGjygnB7f6hntDF
 D4/XYTrNAofgL3QGV+ZIMuc08xpkvIkde3GssIRfiAFG92GBIo4iRCMChaA7uMjx
 z3XI5zmjc6NPPyOE8bp/wr0bYkBqSy0NtwtgvAQEX4efI3IysUst3i0tWSJQPf2U
 /VBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853458; x=1654939858; bh=kHR33dfNYe7+6
 PLSxTtiGyFtwzToLLsjHgA9uuXNoGQ=; b=hHFP8TiQDthKR5Z3RQlB9ZwH7aOo2
 Ahgmw0AWjQjNig2D2xEqb5PWPpzB/21+ooeqp1nEePtL7ivka7Obvqd0ek85ybKz
 BG6w+lkWCaiLK3oEbsu7GSR8fVNRw5XhXsiL7JyUJwJFb+QQtJ+iE7Y38lvWqnTI
 cqCxILTcaOhos156S1yJSBGzE4OSevIWx4bPjRJUD3bhLFN8LW8Jjnetntd7jIBV
 /Ko64Nv9W/vZVdOQSzx0GTspls1lbu4x/nYHj3togZAc0xKiZ4NryVDmGGwKzSob
 zZPNzHKVajX45negS+2b4TeFxsPiV1/y7/Z6yKXYbUxJZIyXfJ/gwdmmQ==
X-ME-Sender: <xms:UQ-jYuw2D_AfP9jtb5RBs-aHC3k5860SZ9P5r3pmjW1Q08Q6PLfSbg>
 <xme:UQ-jYqSGWHNMNc7VyNO38iyDBiM7aieXjFnkMTs6NVzJrxcy306hnPoU3qpWwHPL_
 S2Qnk69iCCZOgboZxs>
X-ME-Received: <xmr:UQ-jYgUEOfRN_u7Gru5Q6_TSlBVdZSV8dab3ldPvnc1HRxkOg9sPgG96KQL2uj2APi-P6T8EZxA1YWLJNtSaF6kpxhubUJWH6xsqwCU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedufeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UQ-jYkigYoXxTxJo7HWNMwmuuPhlege-d_YtEVO5IwM2IDIl8mDV1A>
 <xmx:UQ-jYgCzotWRhOEIkKF0GM3gr2kr1d3tgocUBRyPm80IffxRvsZYzQ>
 <xmx:UQ-jYlLT_qdVioHxbRG0Ubz0ES9RYvCqxgwD74-pdQsC7P8-T8G02g>
 <xmx:Ug-jYj9ESOMfwf1bi0iAQeVe1dFwucqsbVO_TNlgEhqS9XbXRgCbvg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 51/64] drm/vc4: vec: Embed DRM structures into the private
 structure
Date: Fri, 10 Jun 2022 11:29:11 +0200
Message-Id: <20220610092924.754942-52-maxime@cerno.tech>
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

The VC4 VEC driver private structure contains only a pointer to the
encoder and connector it implements. This makes the overall structure
somewhat inconsistent with the rest of the driver, and complicates its
initialisation without any apparent gain.

Let's embed the drm_encoder structure (through the vc4_encoder one) and
drm_connector into struct vc4_vec to fix both issues.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 83 +++++++++--------------------------
 1 file changed, 21 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 99fe40c8cf81..2c96d5adcf49 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -160,12 +160,12 @@ struct vc4_vec_variant {
 
 /* General VEC hardware state. */
 struct vc4_vec {
+	struct vc4_encoder encoder;
+	struct drm_connector connector;
+
 	struct platform_device *pdev;
 	const struct vc4_vec_variant *variant;
 
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-
 	void __iomem *regs;
 
 	struct clk *clock;
@@ -178,30 +178,12 @@ struct vc4_vec {
 #define VEC_READ(offset) readl(vec->regs + (offset))
 #define VEC_WRITE(offset, val) writel(val, vec->regs + (offset))
 
-/* VC4 VEC encoder KMS struct */
-struct vc4_vec_encoder {
-	struct vc4_encoder base;
-	struct vc4_vec *vec;
-};
-
-static inline struct vc4_vec_encoder *
-to_vc4_vec_encoder(struct drm_encoder *encoder)
+static inline struct vc4_vec *
+encoder_to_vc4_vec(struct drm_encoder *encoder)
 {
-	return container_of(encoder, struct vc4_vec_encoder, base.base);
+	return container_of(encoder, struct vc4_vec, encoder.base);
 }
 
-/* VC4 VEC connector KMS struct */
-struct vc4_vec_connector {
-	struct drm_connector base;
-	struct vc4_vec *vec;
-
-	/* Since the connector is attached to just the one encoder,
-	 * this is the reference to it so we can do the best_encoder()
-	 * hook.
-	 */
-	struct drm_encoder *encoder;
-};
-
 enum vc4_vec_tv_mode_id {
 	VC4_VEC_TV_MODE_NTSC,
 	VC4_VEC_TV_MODE_NTSC_J,
@@ -343,22 +325,12 @@ static const struct drm_connector_helper_funcs vc4_vec_connector_helper_funcs =
 	.get_modes = vc4_vec_connector_get_modes,
 };
 
-static struct drm_connector *vc4_vec_connector_init(struct drm_device *dev,
-						    struct vc4_vec *vec)
+static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 {
-	struct drm_connector *connector = NULL;
-	struct vc4_vec_connector *vec_connector;
+	struct drm_connector *connector = &vec->connector;
 
-	vec_connector = devm_kzalloc(dev->dev, sizeof(*vec_connector),
-				     GFP_KERNEL);
-	if (!vec_connector)
-		return ERR_PTR(-ENOMEM);
-
-	connector = &vec_connector->base;
 	connector->interlace_allowed = true;
 
-	vec_connector->encoder = vec->encoder;
-	vec_connector->vec = vec;
 
 	drm_connector_init(dev, connector, &vc4_vec_connector_funcs,
 			   DRM_MODE_CONNECTOR_Composite);
@@ -369,15 +341,14 @@ static struct drm_connector *vc4_vec_connector_init(struct drm_device *dev,
 				   VC4_VEC_TV_MODE_NTSC);
 	vec->tv_mode = &vc4_vec_tv_modes[VC4_VEC_TV_MODE_NTSC];
 
-	drm_connector_attach_encoder(connector, vec->encoder);
+	drm_connector_attach_encoder(connector, &vec->encoder.base);
 
-	return connector;
+	return 0;
 }
 
 static void vc4_vec_encoder_disable(struct drm_encoder *encoder)
 {
-	struct vc4_vec_encoder *vc4_vec_encoder = to_vc4_vec_encoder(encoder);
-	struct vc4_vec *vec = vc4_vec_encoder->vec;
+	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
 	int ret;
 
 	VEC_WRITE(VEC_CFG, 0);
@@ -398,8 +369,7 @@ static void vc4_vec_encoder_disable(struct drm_encoder *encoder)
 
 static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 {
-	struct vc4_vec_encoder *vc4_vec_encoder = to_vc4_vec_encoder(encoder);
-	struct vc4_vec *vec = vc4_vec_encoder->vec;
+	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
 	int ret;
 
 	ret = pm_runtime_get_sync(&vec->pdev->dev);
@@ -474,8 +444,7 @@ static void vc4_vec_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
-	struct vc4_vec_encoder *vc4_vec_encoder = to_vc4_vec_encoder(encoder);
-	struct vc4_vec *vec = vc4_vec_encoder->vec;
+	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
 
 	vec->tv_mode = &vc4_vec_tv_modes[conn_state->tv.mode];
 }
@@ -533,7 +502,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_vec *vec;
-	struct vc4_vec_encoder *vc4_vec_encoder;
 	int ret;
 
 	ret = drm_mode_create_tv_properties(drm, ARRAY_SIZE(tv_mode_names),
@@ -545,14 +513,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	if (!vec)
 		return -ENOMEM;
 
-	vc4_vec_encoder = devm_kzalloc(dev, sizeof(*vc4_vec_encoder),
-				       GFP_KERNEL);
-	if (!vc4_vec_encoder)
-		return -ENOMEM;
-	vc4_vec_encoder->base.type = VC4_ENCODER_TYPE_VEC;
-	vc4_vec_encoder->vec = vec;
-	vec->encoder = &vc4_vec_encoder->base.base;
-
+	vec->encoder.type = VC4_ENCODER_TYPE_VEC;
 	vec->pdev = pdev;
 	vec->variant = (const struct vc4_vec_variant *)
 		of_device_get_match_data(dev);
@@ -573,14 +534,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_simple_encoder_init(drm, vec->encoder, DRM_MODE_ENCODER_TVDAC);
-	drm_encoder_helper_add(vec->encoder, &vc4_vec_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
+	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
-	vec->connector = vc4_vec_connector_init(drm, vec);
-	if (IS_ERR(vec->connector)) {
-		ret = PTR_ERR(vec->connector);
+	ret = vc4_vec_connector_init(drm, vec);
+	if (ret)
 		goto err_destroy_encoder;
-	}
 
 	dev_set_drvdata(dev, vec);
 
@@ -589,7 +548,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_destroy_encoder:
-	drm_encoder_cleanup(vec->encoder);
+	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 
 	return ret;
@@ -600,8 +559,8 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
-	vc4_vec_connector_destroy(vec->connector);
-	drm_encoder_cleanup(vec->encoder);
+	vc4_vec_connector_destroy(&vec->connector);
+	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

