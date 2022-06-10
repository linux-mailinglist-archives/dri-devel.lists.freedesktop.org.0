Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D9A546230
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1017011B24E;
	Fri, 10 Jun 2022 09:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B335011B0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0440E5C01BD;
 Fri, 10 Jun 2022 05:30:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853406; x=1654939806; bh=ys
 U7R0WvO8uADDHarAN3boAM5W6xNnZfKo+P5u/kKcg=; b=qBp9Y5D/9IipVT4YKM
 SwrFrs6ARizu9aB/JML8mQR9tiai67Ma/E2Y06JCoPqRfTgJNxjdWTjauo2zHv5P
 yY4FayftE75sxdvX2mQPTU/eCbUPi83eJpiUTfiBg4Y4Uil/ZggbY+WX2vm8kIok
 RdlzrV50DMifZv3ey3oGogUEHVpunsZqpgOjcaj56ULFHAznYNwma5cjywHetbmb
 xv19xEgSQfbuOL7Mn0alghpS15YYIGMeTbwJZsjNV+kVhu6vmxe2/rNhHWBqX0y/
 M9G7w/TrhKWgZGC1vFqBkamncpUGDEeATJ1I9oARjESCamA9zVQqMvFfYTIHoZkt
 6OSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853406; x=1654939806; bh=ysU7R0WvO8uAD
 DHarAN3boAM5W6xNnZfKo+P5u/kKcg=; b=GWIHmaIrI/y3P2nJMqIW5yfW/aEVr
 K6ejgqdM5MYGtBko7Jn+5Age4aafKQ4lNko1fcGValINrsX8vRTwYbZMb2BgdPJJ
 WbRSGgYHAul5SGi1+QL6aqv7bATNB2u8jGQNYOrNJSHqYQ+HOXryTgdgaqLh3M2l
 pERtiDPziVM+wq217R7u/qjcuSl+fhvkntgCQ7qOebQ+L71tW4BGeDgb6b4lsNBS
 KOj9rWGnvH75eArX9T47TL7m5cTpi1tPs216nwvUBZnWz35f7PNUrLsbML8KaLUN
 LKvHHUNjLleXgMqhvuprTDjvGFrlniYouWi+DWgd/gE4lCspWYw8sWN9A==
X-ME-Sender: <xms:HQ-jYm9oJw8JmQG1hZzlXuSMz3xsRF1Ar-bu_9VQn-gdoxVX46-Lxw>
 <xme:HQ-jYmtN5avN6YUsmH9U8Ua4BcHE7vxITCQ4VlXm9lilJgvloyE5Ezgs9LYUH4AF-
 NIlqqXfvpG1XOZQ-nU>
X-ME-Received: <xmr:HQ-jYsBwNFRrlCKP5X3F9QS_XDOo39PidThmvfvJBsJixIMS2OxlXsER7SirQuIAPWXk5NRqMyLEWUbqzZAgJpna-8dRvtorXtWfcwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HQ-jYuftg60dthNLyN8Q9r1hkJDTP6SDm6DA4-zaRgtikN24_qLRCw>
 <xmx:HQ-jYrOZIUgeqv7lugaP3L8eREoBElxFpijFpk1hSlCNReZS2qnpxQ>
 <xmx:HQ-jYonfT1K5KNuYmHEM8_7lMD3rQ_QyhEBixF_b7Lin4ZHCAxrpIw>
 <xmx:Hg-jYgoEqDtCbiB9PF-jqT1vLQi2LnZBXTj5yDDp8K_as8DHhPbZ3w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 21/64] drm/vc4: dpi: Embed DRM structures into the private
 structure
Date: Fri, 10 Jun 2022 11:28:41 +0200
Message-Id: <20220610092924.754942-22-maxime@cerno.tech>
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

The VC4 DPI driver private structure contains only a pointer to the
encoder it implements. This makes the overall structure somewhat
inconsistent with the rest of the driver, and complicates its
initialisation without any apparent gain.

Let's embed the drm_encoder structure (through the vc4_encoder one) into
struct vc4_dpi to fix both issues.

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

