Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFAE554D2F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8681811332D;
	Wed, 22 Jun 2022 14:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D181D11333A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 9206A3200962;
 Wed, 22 Jun 2022 10:33:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908406; x=1655994806; bh=R+
 fX72KCkZVf6uHFU7ffmioP+7kv6hX4s9rv9KDma6s=; b=R8ojL/pTAgLzGtMXjN
 gq5XjRWQOeD+uB/N3tTqRpofvjOhUsjt3zBFXhCHVGKHG5gujb/wH88Qy9ROvQ5u
 U+uD1KjEVDi2HXZfCdAm4BvVQx3Rrab4Z67GekHAv99c7sf1rVg7RaBpTqey0/2o
 oEce6W8cp4b2OIMxvJhw31hmUs0ku0Wyv1m0iAPOlv0cBkA0ai/ZfmsNvNFq90o6
 aexzomFzv/zOFDmklJlqc1clnux6Yk9tzToqVp1hkAculIGGrW8PyO44ydZh9iZ5
 xDYe/yQaGqxxjAOolZgy2rygmywv595028Cc+6RSyqYAOWYgvHqSx4cmPHuw54gY
 gK0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908406; x=1655994806; bh=R+fX72KCkZVf6
 uHFU7ffmioP+7kv6hX4s9rv9KDma6s=; b=fndL2C+BIWSNAWY6F3Vj6+bpnV5wx
 w7S5rnAd4epyxGOvAv/cDOMoDerjgaS1NipcidWCnklhcPtqXcyRlEqyUZF5vNUo
 WWi+JH8JRfo8cLBegv/vNcr/54nINLW2yh5j9R8CWamdpwVUM7GrhA1+TOdo0LU2
 WhtBkUOCGW994SVrDfkrySLbH+UUzMZEOVFMtrj4pg03wrdrpXiXV2CE0JGa1KJl
 tQ8bEtOW0VEiP5uqh1d8+NbnWHv6sUmJcvowPye5iutOL3flsIP23lzGkQ0RyFnV
 Us6P38HI68bN73wJCAJtmSZ1J7WXOGiFb9q2ItvIqAUBnTPA6klRQDeKw==
X-ME-Sender: <xms:NSizYg691BPERaUVxsOKpIR6ETT3u8Geg-lW66nRRyJg9ZvgKdJyBA>
 <xme:NSizYh4vTUhZ4jkzMTOsN12rRDGIDDxzQplwM115a2u277WVAG9YzLb03ZwZ1JRTj
 XZ-IDEce5rF0g-5HDw>
X-ME-Received: <xmr:NSizYvdbOoyIGtp5JfjLGiVzb76FnROn1z88j7A5V1yJ--2wt2j9emiS1CO7MJtWtnNX9vZf7ZruQ8P3696s5ENuuAiD3lko9OvYVXs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NSizYlJ-EGLiFevdwWhohN8KfcCGXvzIRvyjbas05x7XCYPR6AfguQ>
 <xmx:NSizYkI5X15a6OY8VxDsfo-Qlo1N0aFvxVpT3jwUMzuud3D4PCv5rw>
 <xmx:NSizYmxJu0GYCI0-jYPJMb1sliEVU1AJAfeaRggnB9Dg4LAkppq51g>
 <xmx:NiizYug-UrcXWlEw65kcK8KlUfTDBsP7dwQlRbZjzZ4U1ygjSO3WNQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 23/68] drm/vc4: dpi: Embed DRM structures into the private
 structure
Date: Wed, 22 Jun 2022 16:31:24 +0200
Message-Id: <20220622143209.600298-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 49 ++++++++++++-----------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index f2b46c524919..c88e8e397730 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -83,10 +83,10 @@
 
 /* General DPI hardware state. */
 struct vc4_dpi {
+	struct vc4_encoder encoder;
+
 	struct platform_device *pdev;
 
-	struct drm_encoder *encoder;
-
 	void __iomem *regs;
 
 	struct clk *pixel_clock;
@@ -95,21 +95,15 @@ struct vc4_dpi {
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
@@ -117,8 +111,7 @@ static const struct debugfs_reg32 dpi_regs[] = {
 
 static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
 {
-	struct vc4_dpi_encoder *vc4_encoder = to_vc4_dpi_encoder(encoder);
-	struct vc4_dpi *dpi = vc4_encoder->dpi;
+	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 
 	clk_disable_unprepare(dpi->pixel_clock);
 }
@@ -127,8 +120,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct drm_display_mode *mode = &encoder->crtc->mode;
-	struct vc4_dpi_encoder *vc4_encoder = to_vc4_dpi_encoder(encoder);
-	struct vc4_dpi *dpi = vc4_encoder->dpi;
+	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector = NULL, *connector_scan;
 	u32 dpi_c = DPI_ENABLE | DPI_OUTPUT_ENABLE_MODE;
@@ -242,7 +234,7 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 			return PTR_ERR(bridge);
 	}
 
-	return drm_bridge_attach(dpi->encoder, bridge, NULL, 0);
+	return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
 }
 
 static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
@@ -250,21 +242,12 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
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
@@ -298,8 +281,8 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
 
-	drm_simple_encoder_init(drm, dpi->encoder, DRM_MODE_ENCODER_DPI);
-	drm_encoder_helper_add(dpi->encoder, &vc4_dpi_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
+	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
 	if (ret)
@@ -312,7 +295,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_destroy_encoder:
-	drm_encoder_cleanup(dpi->encoder);
+	drm_encoder_cleanup(&dpi->encoder.base);
 	clk_disable_unprepare(dpi->core_clock);
 	return ret;
 }
@@ -324,7 +307,7 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 
 	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
 
-	drm_encoder_cleanup(dpi->encoder);
+	drm_encoder_cleanup(&dpi->encoder.base);
 
 	clk_disable_unprepare(dpi->core_clock);
 }
-- 
2.36.1

