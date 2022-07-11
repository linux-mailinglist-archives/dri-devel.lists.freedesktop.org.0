Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A922757091F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DF090327;
	Mon, 11 Jul 2022 17:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F8B90319
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D13EE5C0121;
 Mon, 11 Jul 2022 13:40:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561237; x=1657647637; bh=oq
 gXd6dB0UPK3Ozl544eh3OoY7Yd2HrVzQHAMHBJECU=; b=G7LsHC5nApj2aANAjJ
 nIQCVSp+4PvQh2VwcjYnrfUQpMBH4TFu28m2pXNd8f1sgrSletIlIaxW4H5qEk1M
 OtQX+guBWH8/4DlTL7WKd7AgzFhWMU3MYS7G2rQOPr6/7J/DZzcfnyI+zfPZn5ZN
 96rfkV8IRkrbeAVh5daSGwWNUyWu4C3nfZgJd/2/5G5ReS0gAWxovCFZe+SjCfIm
 8ZJCn9k8OXUwlI1emSXbYczvJhliGrOw8m2UMY/SeQy52uOiAGtraJaaloV91oOp
 jHCwH7KSTQ275W3evyrEf3W0yWak0XGKAeauHKdWPdadqev4MxPko9RE5xD8tWpH
 7UtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561237; x=1657647637; bh=oqgXd6dB0UPK3
 Ozl544eh3OoY7Yd2HrVzQHAMHBJECU=; b=I+YtLqzgssI9REMzDFJM38ZLD70d1
 q252Vm5McVdgeU1VncFYKA8vEjACPpOowlODh7bNB1XfQBtlxb25aVp+FEGQ7ftr
 LhFl44/wA838DOTfsN2YcZO6MZ8ctmTfHShyJwzzyfczG4PfDJg5R0UnNHWJ4O3h
 rTR1FmvKvQj5r8+PALXfuHilT61vft73OwwMAcwK6Sum5mA6561tq4LLV2nPJ2f7
 Hl0vnh+Z8XkejTCo5Hq50CYLBpRe3wf7GfzU7LZswZ6x2QZb3Y65OEbNLBOS9A1F
 4pfraiOXzOcq8CBYRDSPfT2XdN4QcaNL5pZXjVJUVDGOk3y/OMlQJ41sQ==
X-ME-Sender: <xms:lWDMYsXa-GAWAhe5EPLVDiIhsBHBOS6uaf5ktslFZ-UBJZy8DKvKBQ>
 <xme:lWDMYglAFKrkex9PGwC9FWI8QAT9oOBxO2Yf6YohJKz8-0Cs2_q9OMAP9KtQXl9oS
 -Iw8ZnJedPCgkA0AbY>
X-ME-Received: <xmr:lWDMYgay02m8G4USBJpBLaSmhjcJnw1jaY43bdHdub1UoQ9w7O2oV6hcuczoTHLwPGydC9dcp59U5vXAFsVeHeAsh_m4e0Sjl9mJQaI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lWDMYrWcf9d2FXdpdlB4EgmwojTO4P5SaYpUpxCphVHLHEqxf1G65w>
 <xmx:lWDMYmkbQBG1dGt-EHhP3rQi_1tjOunnqO3Jk89T9Sq6joq1AoaJ4A>
 <xmx:lWDMYgeensTIp955OJZEQDyTHY_jWxV1xysWSZ6hrN0ELTb2woNYGw>
 <xmx:lWDMYnBifFuZiTeO-a0nax-JJD8m2wWAa1NRg8gYi6leP_WTV7e-Hw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 32/69] drm/vc4: dsi: Embed DRM structures into the private
 structure
Date: Mon, 11 Jul 2022 19:39:02 +0200
Message-Id: <20220711173939.1132294-33-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

The VC4 DSI driver private structure contains only a pointer to the
encoder it implements. This makes the overall structure somewhat
inconsistent with the rest of the driver, and complicates its
initialisation without any apparent gain.

Let's embed the drm_encoder structure (through the vc4_encoder one) into
struct vc4_dsi to fix both issues.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 60 ++++++++++++++---------------------
 1 file changed, 23 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index b7b2c76770dc..72889524540e 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -549,10 +549,11 @@ struct vc4_dsi_variant {
 
 /* General DSI hardware state. */
 struct vc4_dsi {
-	struct platform_device *pdev;
-
+	struct vc4_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct drm_encoder *encoder;
+
+	struct platform_device *pdev;
+
 	struct drm_bridge *bridge;
 	struct list_head bridge_chain;
 
@@ -600,6 +601,12 @@ struct vc4_dsi {
 
 #define host_to_dsi(host) container_of(host, struct vc4_dsi, dsi_host)
 
+static inline struct vc4_dsi *
+to_vc4_dsi(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct vc4_dsi, encoder.base);
+}
+
 static inline void
 dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 {
@@ -644,18 +651,6 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 	DSI_WRITE(dsi->variant->port ? DSI1_##offset : DSI0_##offset, val)
 #define DSI_PORT_BIT(bit) (dsi->variant->port ? DSI1_##bit : DSI0_##bit)
 
-/* VC4 DSI encoder KMS struct */
-struct vc4_dsi_encoder {
-	struct vc4_encoder base;
-	struct vc4_dsi *dsi;
-};
-
-static inline struct vc4_dsi_encoder *
-to_vc4_dsi_encoder(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_dsi_encoder, base.base);
-}
-
 static const struct debugfs_reg32 dsi0_regs[] = {
 	VC4_REG32(DSI0_CTRL),
 	VC4_REG32(DSI0_STAT),
@@ -795,8 +790,7 @@ dsi_esc_timing(u32 ns)
 
 static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 {
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct device *dev = &dsi->pdev->dev;
 	struct drm_bridge *iter;
 
@@ -839,8 +833,7 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 				       const struct drm_display_mode *mode,
 				       struct drm_display_mode *adjusted_mode)
 {
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct clk *phy_parent = clk_get_parent(dsi->pll_phy_clock);
 	unsigned long parent_rate = clk_get_rate(phy_parent);
 	unsigned long pixel_clock_hz = mode->clock * 1000;
@@ -875,8 +868,7 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct device *dev = &dsi->pdev->dev;
 	bool debug_dump_regs = false;
 	struct drm_bridge *iter;
@@ -1569,21 +1561,14 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
-	struct vc4_dsi_encoder *vc4_dsi_encoder;
+	struct drm_encoder *encoder = &dsi->encoder.base;
 	int ret;
 
 	dsi->variant = of_device_get_match_data(dev);
 
-	vc4_dsi_encoder = devm_kzalloc(dev, sizeof(*vc4_dsi_encoder),
-				       GFP_KERNEL);
-	if (!vc4_dsi_encoder)
-		return -ENOMEM;
-
 	INIT_LIST_HEAD(&dsi->bridge_chain);
-	vc4_dsi_encoder->base.type = dsi->variant->port ?
-			VC4_ENCODER_TYPE_DSI1 : VC4_ENCODER_TYPE_DSI0;
-	vc4_dsi_encoder->dsi = dsi;
-	dsi->encoder = &vc4_dsi_encoder->base.base;
+	dsi->encoder.type = dsi->variant->port ?
+		VC4_ENCODER_TYPE_DSI1 : VC4_ENCODER_TYPE_DSI0;
 
 	dsi->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(dsi->regs))
@@ -1702,10 +1687,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, dsi->encoder, DRM_MODE_ENCODER_DSI);
-	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
+	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
-	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
 	if (ret)
 		return ret;
 	/* Disable the atomic helper calls into the bridge.  We
@@ -1713,7 +1698,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 * from our driver, since we need to sequence them within the
 	 * encoder's enable/disable paths.
 	 */
-	list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
+	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 
 	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
 
@@ -1726,6 +1711,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = &dsi->encoder.base;
 
 	pm_runtime_disable(dev);
 
@@ -1733,8 +1719,8 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * Restore the bridge_chain so the bridge detach procedure can happen
 	 * normally.
 	 */
-	list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
-	drm_encoder_cleanup(dsi->encoder);
+	list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
+	drm_encoder_cleanup(encoder);
 }
 
 static const struct component_ops vc4_dsi_ops = {
-- 
2.36.1

