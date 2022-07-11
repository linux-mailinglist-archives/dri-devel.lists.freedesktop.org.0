Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C5570919
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFFF90316;
	Mon, 11 Jul 2022 17:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9B490309
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 988AF5C0163;
 Mon, 11 Jul 2022 13:40:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561224; x=1657647624; bh=65
 +f1WKTjpzFj1uwNfPGNDpTcqlQynYEyWVWjOLLxMA=; b=X0SJssVu2MotZQnpes
 TVV6fdpNrP25+SWNZVUJlQk6sBOFVQ4U49TBKpwYTAnUuIjjeg7lkPCbk206opt2
 nR7uB0Lg9uoPAAZcTg8HvOq0Rf3OrBE0UJz1w5iKuMj3S1U/Xz2SACkkLVDso4vM
 ZOP0tITX5i8J9Q+L/DsVy9DrGm+hdnzYOs7OAcATbtvHPcv3Ws/PeKG9UTk7k3pC
 X8o2Hed3J2bnSC83jg21Pf6vFK0Mrc1clM+4ErvtSOb4d1SnA1XBqhQLjREzMnfB
 0Afk96oTaH7yc7wbxj216OURMk8NWIIJeTEEiD04S0oxu3sivMuPu7oLdKB7DZCZ
 cxvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561224; x=1657647624; bh=65+f1WKTjpzFj
 1uwNfPGNDpTcqlQynYEyWVWjOLLxMA=; b=mjBd6j309KqjZMQwDCrRHjlFK8Yky
 7IudpWISsuMyi6LfAJra276fd2KyCDrpgzBTBMfHgvqR1iARvhwa2J+sCe1/WV3y
 Cky4fWGrkSuSJ/BH3hFCL++gTi9cAE8gvACeavjbqt6I2l8xcwkBlTgIXVCkuAs0
 IWVl+YZCaoH78S5kMyOKzEr5IGpxjk479i25lRwBP4ZVW0iK+YLrb5iO02Rji+VM
 +Wj9w7HMsHLY9Rdy7ONLBvRqSprlUy5dDpaHa1JmJb78k6UpsWn2uHhdEORpYijW
 O0XvY8/+2pmJ/TvhxT2xFJE9iqUh5YOfMTInh1dGBlEjjiNf+8LN4GlzQ==
X-ME-Sender: <xms:iGDMYrGLo4AW2IUNc5TZnaOXE1aso17sqyUVAwwSGzurJQMTobBxHA>
 <xme:iGDMYoWcRUJ0GO1PLTiXhcndwceKSTNTauaJbYM6OQlwlWMr6rGRRqnVqN5ikt3sl
 csMCZJotrHjkrDdf2k>
X-ME-Received: <xmr:iGDMYtJ6P1rG9r0_C-8QnIGHiTkBmc-RcAy0d55oAyiKciPQwkGQ4jpiiwYRrjEsqebl22gr02vDHa8PEgtioh2Wg9qbgrhGPvUC4po>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iGDMYpFj2w-AwInedd89thW_J6G1FZVCKxJ67shz4SL_bcI2eAJNAQ>
 <xmx:iGDMYhVvzZ9eeskQbLVRziVxVXxyOXy8K3tMRW4fkWH17mzk8vFtpw>
 <xmx:iGDMYkPGh7rodBrtxIRmH6_1pXFPtVqqI-b8KwAbY1cv3LD5NfIPIg>
 <xmx:iGDMYvdPM8P4943iR5A8w-9xLWkiikdfIPntMTxCf0FODtB52HWf7g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 24/69] drm/vc4: dpi: Embed DRM structures into the private
 structure
Date: Mon, 11 Jul 2022 19:38:54 +0200
Message-Id: <20220711173939.1132294-25-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VC4 DPI driver private structure contains only a pointer to the
encoder it implements. This makes the overall structure somewhat
inconsistent with the rest of the driver, and complicates its
initialisation without any apparent gain.

Let's embed the drm_encoder structure (through the vc4_encoder one) into
struct vc4_dpi to fix both issues.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 49 ++++++++++++-----------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index d3625dcb5dcb..7c4bfbd7ed9f 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -84,10 +84,10 @@
 
 /* General DPI hardware state. */
 struct vc4_dpi {
+	struct vc4_encoder encoder;
+
 	struct platform_device *pdev;
 
-	struct drm_encoder *encoder;
-
 	void __iomem *regs;
 
 	struct clk *pixel_clock;
@@ -96,21 +96,15 @@ struct vc4_dpi {
 	struct debugfs_regset32 regset;
 };
 
+static inline struct vc4_dpi *
+to_vc4_dpi(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct vc4_dpi, encoder.base);
+}
+
 #define DPI_READ(offset) readl(dpi->regs + (offset))
 #define DPI_WRITE(offset, val) writel(val, dpi->regs + (offset))
 
-/* VC4 DPI encoder KMS struct */
-struct vc4_dpi_encoder {
-	struct vc4_encoder base;
-	struct vc4_dpi *dpi;
-};
-
-static inline struct vc4_dpi_encoder *
-to_vc4_dpi_encoder(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_dpi_encoder, base.base);
-}
-
 static const struct debugfs_reg32 dpi_regs[] = {
 	VC4_REG32(DPI_C),
 	VC4_REG32(DPI_ID),
@@ -118,8 +112,7 @@ static const struct debugfs_reg32 dpi_regs[] = {
 
 static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
 {
-	struct vc4_dpi_encoder *vc4_encoder = to_vc4_dpi_encoder(encoder);
-	struct vc4_dpi *dpi = vc4_encoder->dpi;
+	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 
 	clk_disable_unprepare(dpi->pixel_clock);
 }
@@ -128,8 +121,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct drm_display_mode *mode = &encoder->crtc->mode;
-	struct vc4_dpi_encoder *vc4_encoder = to_vc4_dpi_encoder(encoder);
-	struct vc4_dpi *dpi = vc4_encoder->dpi;
+	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector = NULL, *connector_scan;
 	u32 dpi_c = DPI_ENABLE;
@@ -262,7 +254,7 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 			return PTR_ERR(bridge);
 	}
 
-	return drm_bridge_attach(dpi->encoder, bridge, NULL, 0);
+	return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
 }
 
 static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
@@ -270,21 +262,12 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dpi *dpi;
-	struct vc4_dpi_encoder *vc4_dpi_encoder;
 	int ret;
 
 	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
 	if (!dpi)
 		return -ENOMEM;
-
-	vc4_dpi_encoder = devm_kzalloc(dev, sizeof(*vc4_dpi_encoder),
-				       GFP_KERNEL);
-	if (!vc4_dpi_encoder)
-		return -ENOMEM;
-	vc4_dpi_encoder->base.type = VC4_ENCODER_TYPE_DPI;
-	vc4_dpi_encoder->dpi = dpi;
-	dpi->encoder = &vc4_dpi_encoder->base.base;
-
+	dpi->encoder.type = VC4_ENCODER_TYPE_DPI;
 	dpi->pdev = pdev;
 	dpi->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(dpi->regs))
@@ -318,8 +301,8 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
 
-	drm_simple_encoder_init(drm, dpi->encoder, DRM_MODE_ENCODER_DPI);
-	drm_encoder_helper_add(dpi->encoder, &vc4_dpi_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
+	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
 	if (ret)
@@ -332,7 +315,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_destroy_encoder:
-	drm_encoder_cleanup(dpi->encoder);
+	drm_encoder_cleanup(&dpi->encoder.base);
 	clk_disable_unprepare(dpi->core_clock);
 	return ret;
 }
@@ -344,7 +327,7 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 
 	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
 
-	drm_encoder_cleanup(dpi->encoder);
+	drm_encoder_cleanup(&dpi->encoder.base);
 
 	clk_disable_unprepare(dpi->core_clock);
 }
-- 
2.36.1

