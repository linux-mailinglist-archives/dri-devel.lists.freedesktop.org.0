Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34A56B6CE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B921138C1;
	Fri,  8 Jul 2022 09:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15D91138C1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 88BAD32009F5;
 Fri,  8 Jul 2022 05:59:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274393; x=1657360793; bh=3J
 X7k6uEEi6l3Nr+2UIiUc9rV6DprV4jHGS6nUNd31M=; b=HBW1u4hZTtYQbj+CGi
 FEtioNqEC+QqkmZJghrTKoOPauoTlaxYel2HxtjywAbPSvItDFrf3ZoZ5Zy5sH+y
 e6LdUCtqHX9VkQbdCg1a4mhZN1zcLySAOtFWBDoRaR3Eb1Ao3GdQ7i3FZeYgIoE6
 E2thoyweCSan6dDk21s+g5UTDdS/g1HJBsG6/ROCZgUnKIU56Z9Z3SJzAEu4RbEr
 kzII5wgYVKohJh+RwcUiX5l8/Z4ZDdnDZhGZACflFQdo4ctsboX6emIo5As3TlPb
 HoV2W0GoDrhRMBssgypQfc6qfTUhCW0xDVTL6jgkRwi0G30A/wofGhP+tECeIk+X
 3GAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274393; x=1657360793; bh=3JX7k6uEEi6l3
 Nr+2UIiUc9rV6DprV4jHGS6nUNd31M=; b=Lr8NETpxliXOdV99KmOYsjQNP5NUL
 aLThPnmzOiZaBHrrH1aa1K2fmMVr6RPL9lpyjm/WR4Z/+/agEGnNdKZ4uu5K07Vv
 keZcip7luK8wmN6KCFF8mbge3aqYha4mBHGn13qwRpVUqwEOLjMcvVTepleVbYhO
 XrQTAHZul5Jm17nm4yCFVHD8sZIk4PfYzSDK3YfJjxhBWwv2pg27YN2Tp6STG6BH
 r86BT3XTtSsHB3rEZrSECaYzSacVsJ7X5bEtgZ+l315n2xZp4/Aavi9VrNb6eckS
 6duFW0+CK0uhXtvdDmIphqi6yX8yDJgPDI24eD4GqkJpL/9AfqJNv3+WA==
X-ME-Sender: <xms:GADIYg6RB95p8_dHEG2GkqjgOQArZMyzXqtuN9yN54pyddFXqHa84Q>
 <xme:GADIYh5zaXoZiWvr__cKT5lidZcBdbKaCc8iSqvh0vlE4gWJxFTWAfow2NqQHAKfj
 h2ZtVzK4e7bYNKrT20>
X-ME-Received: <xmr:GADIYvdPW_fbKo-QULaRfpV5XOphTzGpch5qFVbOWl5KsYRgqYgJ__a-ITeTj6EWJB6pQOxdTHj_u8YQTK71XbrnQq_F-Oe2ibvsRCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GADIYlJiUIqhYuOO8ufh2taFG94JxQW7_vhrGxeQSxu8bS3FaApLvg>
 <xmx:GADIYkJNaxgUOufGSJuTwckG8CRWcdGKB74Vhrr6pKioLMSwFSV6fw>
 <xmx:GADIYmzN18LwwPB3s_Waz_wV6oo_qYKjixqcBQ83TDXRdtRsJ6A5Fw>
 <xmx:GQDIYpFtfedeHit_coANGCG8WLKuVGJfWE6Abm87yN2ExYEi88QpSQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 55/69] drm/vc4: vec: Embed DRM structures into the private
 structure
Date: Fri,  8 Jul 2022 11:56:53 +0200
Message-Id: <20220708095707.257937-56-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VC4 VEC driver private structure contains only a pointer to the
encoder and connector it implements. This makes the overall structure
somewhat inconsistent with the rest of the driver, and complicates its
initialisation without any apparent gain.

Let's embed the drm_encoder structure (through the vc4_encoder one) and
drm_connector into struct vc4_vec to fix both issues.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

