Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5856002D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F3614A661;
	Wed, 29 Jun 2022 12:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FAB14A657
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0D4BC3200972;
 Wed, 29 Jun 2022 08:38:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506283; x=1656592683; bh=kH
 R33dfNYe7+6PLSxTtiGyFtwzToLLsjHgA9uuXNoGQ=; b=GhaaKzNOIuTMNtsy8I
 8jrFBDkHQgMASnhJvLuRMgBFKvis9e9PYEeIfPHiV3qY0+fTELcBORY6mQV7DFJv
 Gy+NEVBGRxP4EEVqQmUTfmRIG0HsZAj4oRzKwIexGJqGRBGO/ZhNwGw7D1p1EOGm
 oiQ7C97Gx7g2F65p+wKcoDUriemSU+uFIUj6wiX5WxxfFd6Z1j6g95BNDGRqDwmc
 GuY0Fn5UmXWfQio7antcF0StauF7dr20tH0aGQ9I96QXMu8ONpA65pP994/ghkmF
 t33qlcVkfLJ5ybYm0tOs71qXFjVn6Gk4dBinBpgdETcA5okXdi6FwA3UclIFZo/9
 rH8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506283; x=1656592683; bh=kHR33dfNYe7+6
 PLSxTtiGyFtwzToLLsjHgA9uuXNoGQ=; b=GrUx2R5bYYtJQfaQ9TYNAW3MRlTea
 ZTztV6oHqhWKg1Vqu1aT1zY+u1PDhIJ4pElpyi+Dnr5YxEIJA7IdbdLdEiETXYxg
 LgSsyuHaXgm6Qm/6ssw8CNEqPQaqwtJVnpFNYzkSQdoT4OZ5Ef7nPN3VXcnb1YIH
 0vqlPLaXCqbtpjpZW8Kek6g6v61XcvggaI9VZI4bl0UuezVQ4EkhgrYe/B1DlbeI
 LCDZ90U88mEVYQyHnOcbUIpGgrM/82KENJbyNYiCS4+naXnklTcJjvRlhjnzr7jy
 RnDD+44RIwpalcuBFi5X6VAGL+ibXTjykCbSnHSuW5/KG3S2eX2R825sw==
X-ME-Sender: <xms:q0e8YgNmUVJYPXBdwG9sN65H49-g8LzGQLYqzmlxhDj0-9TC6pUw2Q>
 <xme:q0e8Ym89CRvtIEehBCLcH5nftlJn16neNc51DMvcUQYJ2lheOqAwgJCWmypOe5PMN
 70XzzmKTkzZAavXnB8>
X-ME-Received: <xmr:q0e8YnQ61asApe4a2Kc7YK1jkxDYigfDsd60uh2SmIL3Fvmu4l9_-UI-GWL8EXh2_JLWTreCchrSzXxxW1vM0BpceR-l4kxBVKWHskM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q0e8YouHIXy0YnveMZS6-VL2HcGvADsL5REFRORrUySDPwF6-F4JAg>
 <xmx:q0e8YodcdbTldrx9_rd7a2U7jII9_XeLdyoECVY6-YM5IM-KrpH07Q>
 <xmx:q0e8Ys1LdCZc6HnHzNU-t-kDnED0vAK2r3J97PSAdbR4Lm3hgl1svA>
 <xmx:q0e8Yn7fsCQOxR8lCRlEXVRjMVpf7zs7bc55unQRaO8Mz6TKN5X_eg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 57/71] drm/vc4: vec: Embed DRM structures into the private
 structure
Date: Wed, 29 Jun 2022 14:34:56 +0200
Message-Id: <20220629123510.1915022-58-maxime@cerno.tech>
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

