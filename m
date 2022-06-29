Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5AF55FFFF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB6114A60E;
	Wed, 29 Jun 2022 12:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A91A14A607
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2F813320095D;
 Wed, 29 Jun 2022 08:36:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506186; x=1656592586; bh=Pb
 JvMkuLRhq4vi5NuNC7m7hpjuYWRtlScREwHFYliHY=; b=Lc0qY+tE1QZADgsPq8
 UYet6uSjSAYuwyaN4oFcy33dhdnXUsCWuMKgQOnca/9r4M+miWWk4w7CfGwD4MYf
 gVlKgDQ7punSukelOQWzyJA6/pSM/vWME3WxYkaCfo40DioCp0mxiL0up456raXU
 UXao+s0fir+2ejG5HJTl4fM5FyZ7+Z4+9y+6w84ehtw2s4d2KNuYq4YcxqReEzPj
 6WvRp3FYr6pfrmmIiD9pPGdNj2lMoc2Gls8kT8GjdyBTDBRIkaoXDnintBImXEcP
 LURaNUziipag862ULUUItY+q6VmoEbItACpwfhC6rBDoAQ1cn0NqcgVw8O32AA7R
 gQGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506186; x=1656592586; bh=PbJvMkuLRhq4v
 i5NuNC7m7hpjuYWRtlScREwHFYliHY=; b=mVJKrpOFrTZyLJWP2++szeweZ6yG4
 OZJ2WR6oWWYsNW/6h0EYuEyaalsIn6zWD+KAPReHLACoHPrqdkVp38ydXE/RRZKW
 XZLAbxCStSuZaAVacjZYxPi2EC9HeyRMcSrTEv34EWF775f3j7Mi408w1QAtADUz
 IHfYwPjwiYw4n3Ig3DOv8k2QQZjU2O/gMqJXpv3n+IkNCnFFxmkW8ShDJX41hbfh
 JL29wVzHuBKZZa0oF5uQLmMYiAurYluPdKC18ASxnzcUtupW8zu7O06o5BhFqx2A
 RcOVGPnA+Ez9ZHtigeH5N9/CGjwULFvDaP0A+VhCybl78HBvM5SGdA85w==
X-ME-Sender: <xms:Ske8YpZkdeLpwqd6UL-IgSPq9TUuj7PJFCpiQh3za8KEpMi7efHifA>
 <xme:Ske8Yga0mPqfSODRTvdaTid8_llqgU6hw9l4RrGIkQJq0ZFPHgTCQOikS6OzntBV9
 LqbT5yUcpSXKkbual0>
X-ME-Received: <xmr:Ske8Yr9iqgUssMoVk2JFyfRFAqpBLglgxWB3HfMa1VexRr4Zwv0VeRYOhuPD910LHaO9wa-_8z0jwbi9hdTwI2mlvm8WNMJFF60zW5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ske8YnoRO22fKwQUM-rVDKI9R8TBtidFWdPBkS62JV8TLPwbgSUVYQ>
 <xmx:Ske8YkrRlbjjOsz0WTqEhpnhjs9hSGkRseQsuky0ZUQfQJRd4KQ9NA>
 <xmx:Ske8YtQ08c4pLAvaMXitECR1haZ16T2Ay3wpczjWm-GdahZDq8SUPg>
 <xmx:Ske8YpDpyGKNQcnvVYxZW_cxjiV33yiCbmvlfUNjIRy82c4EZK8KjQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 24/71] drm/vc4: dpi: Embed DRM structures into the private
 structure
Date: Wed, 29 Jun 2022 14:34:23 +0200
Message-Id: <20220629123510.1915022-25-maxime@cerno.tech>
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
index 52348e1e1ee7..7d4bb74cd500 100644
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
 	u32 dpi_c = DPI_ENABLE;
@@ -261,7 +253,7 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 			return PTR_ERR(bridge);
 	}
 
-	return drm_bridge_attach(dpi->encoder, bridge, NULL, 0);
+	return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
 }
 
 static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
@@ -269,21 +261,12 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
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
@@ -317,8 +300,8 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
 
-	drm_simple_encoder_init(drm, dpi->encoder, DRM_MODE_ENCODER_DPI);
-	drm_encoder_helper_add(dpi->encoder, &vc4_dpi_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
+	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
 	if (ret)
@@ -331,7 +314,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_destroy_encoder:
-	drm_encoder_cleanup(dpi->encoder);
+	drm_encoder_cleanup(&dpi->encoder.base);
 	clk_disable_unprepare(dpi->core_clock);
 	return ret;
 }
@@ -343,7 +326,7 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 
 	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
 
-	drm_encoder_cleanup(dpi->encoder);
+	drm_encoder_cleanup(&dpi->encoder.base);
 
 	clk_disable_unprepare(dpi->core_clock);
 }
-- 
2.36.1

