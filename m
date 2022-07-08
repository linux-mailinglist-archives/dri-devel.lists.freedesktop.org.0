Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A356B699
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A71F113870;
	Fri,  8 Jul 2022 09:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75872113870
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 38F7F32009AA;
 Fri,  8 Jul 2022 05:58:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274301; x=1657360701; bh=65
 +f1WKTjpzFj1uwNfPGNDpTcqlQynYEyWVWjOLLxMA=; b=Ifx5ZKg3SYVls/dqpj
 P7+KWmS2hOMauFqpbVcHiezmaX+7X3zGmtVvjUsvBC7XQSlG3ahxizGFB+V426DA
 DSj+uLLQSj/SAyulMWZdtlFOTh8EYc0dppwQaFCkUkCVx3z9Jc8Kzk41R8Ig1Aga
 OZYLk4YCfgdSGugA1U2p8xJjLvtRGKzlTNgGuB/y+DTt+cBm+Nr/MQi42iFb1T+f
 d7+1THzX1wGChrzagMzDw3xfF0lB2UhlQDSHAJJWAjmTcV0PyGTWxJFO1kNm2v4K
 CKHguUexx3AUO9r/vygtm7uSxNXYMQmqC+jx/STIFykZUxHp5OKJTAd5RforKpBZ
 9VcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274301; x=1657360701; bh=65+f1WKTjpzFj
 1uwNfPGNDpTcqlQynYEyWVWjOLLxMA=; b=aEyQEa70wZoDEj8s+VMB2tQbhnDSX
 bcl+MDA6Scdkd3V6S0PVAfVj9ONdVgAFtOkP31g09eJU0ck3ACSrWD807jyVqqfY
 iXmpPRSeGG3JvHg1k8vMjXi+5Ymdl03vsY3rJ3N7TARQnsVk6sxFOvrS1Yg9/OuU
 mwpq15AEmlYH9mYhk8KPkXxdcd4FFnLAcA9o5U9Rns+PfHv85lDR5kJM7fEn6pE1
 O5rrgDeyd2EePvcnGeDg6q1UDCsZpkipFAD7u0cz17i4Azp6PcwFxHZkVU1rmCpG
 ofV+baT2wYXTskza7pOvNM6FyKKGGBDjGBNrL0Nbyr5j4APmCbUY57A9Q==
X-ME-Sender: <xms:vf_HYvA3mUDdQ4TBFyr0LK50iRxnKvHFxIS4gfmq29Ekc_YIg00BQA>
 <xme:vf_HYliNtCLnmLG7rt0yPhA9fZ0122C1gzHtktKSwH3_L2iWNuaRuUPKgG9C4-X5k
 qt1B250LA2xeYRwS5A>
X-ME-Received: <xmr:vf_HYqmWXZLOthzdmE-Sqdc-v3QsP1C2vWj857v2rtrNhuaF437LNjz2WlGV-sL-HiPBQ8pF9WP2lTnN5E4Ao6MCO4w4VfUyH6Db6_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vf_HYhxo5B2939KvWzcOupRD4GX2YT6MhKXE_zglHAZL7OyxmU-hHw>
 <xmx:vf_HYkRA3W0PZYUZNFneW0AFwArzV6UI6GXREAUaT9OUoOp3FmHYMw>
 <xmx:vf_HYkYRiEaW3MbOeLzuzzdo0OXxDDuRiomBlmUX_mbqkpKZWh6JeQ>
 <xmx:vf_HYpIeBi1IQh_JrNmd_Rbgi4GE9k_6R69L59rXKiTrGT9AdSkeBQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 24/69] drm/vc4: dpi: Embed DRM structures into the private
 structure
Date: Fri,  8 Jul 2022 11:56:22 +0200
Message-Id: <20220708095707.257937-25-maxime@cerno.tech>
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

