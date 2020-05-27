Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784E1E59A5
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F186E4C1;
	Thu, 28 May 2020 07:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8ED6E32C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 247085814E7;
 Wed, 27 May 2020 11:51:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=R/Iv4t9jU57HB
 zmlc9k206Pehs9/f4kWZlarurIm8e8=; b=B+0/8m7nPNy8c5uM6pBi9ImMf1sId
 Yo8i96PrHB1X6lRbSEEPt4oJ3SiDcq6Astq2XmjHC5dd0k/peKO55sC2spcxRUKJ
 4UAlw3e230s1JerQ39l6Rir6ZvtA43a7RVf9otoUJLMwykHNsGyTU6eMVhQKD/HV
 nLBMXd8oY6BazAGyzi60Ik7o3wshTVHymdEqPb6cHjYdY4kqnIt5ZNV/LMeQZg0c
 fH6lk8moEX3/Y2VEMm9siqtaXBGwNpAs6EbTbKgdLIacjsp2EY6jY0GXCylxBZHF
 jQ6QPcrTyKHVNut6FQTGtoQiN3Z+zRgaSyadew1BT1G/xkepEK9iCPsbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=R/Iv4t9jU57HBzmlc9k206Pehs9/f4kWZlarurIm8e8=; b=gRJksPh1
 mG7T2bvJ3dBfWAP14qAfcIgBwYwBT1FBXMLJ/BV+wCVjTYId/LZMQfTGaWp5iwTm
 BU6pULaKLLwfrdTG0ScuuV9f1pGaOxuz/HH5PMGx3To/Yzx/Vds/UUdz0DCNSrAc
 mnBsTsjAzlicCnAW3KsuqjAhzMLhnxUkSgrGQe46ccs/fbn7n7D1KF0/4555qwbU
 wkkYgeW0Ij5DLCbWWJL6gg/xUciSwvIx76bZro6gpyzTJYxJKhvHp0FrQBAlkstN
 gLa6P3/p3EEfcXMvP2Jdo+5EhO61wUDfhZRjdiIolj0qg+t5mPTPHRx0bEzp5pXW
 ts89vm4UvVLwNg==
X-ME-Sender: <xms:eozOXh1_TfMpKgX0Yf9drKHB-ckS_XylLhyXN63vyao9o-0A1Th0hA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eozOXoFJ5dSFeUnNe0Y4InPmzrUbfaFKRFVrBp2zEmbRJa-ZarGl5g>
 <xmx:eozOXh6K9j0gVUjR8Y-5haPVkAU3p82PYe6TD84hqUqQ1EAN-R7PUQ>
 <xmx:eozOXu0um37-lcdUqLtx-Uc_jiDJukBwJolcCiovZxwWsEfVA1Y-cg>
 <xmx:eozOXv01qHmyd7FgKImCuJru7d0o5FucNSDYXW08f4O4M2NGCkxV5g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC43430618B7;
 Wed, 27 May 2020 11:51:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 079/105] drm/vc4: hdmi: Introduce resource init and variant
Date: Wed, 27 May 2020 17:48:49 +0200
Message-Id: <908fa37d0c4a3602723a276ef60d48cfa37a926c.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI controllers found in the BCM2711 has a pretty different clock and
registers areas than found in the older BCM283x SoCs.

Let's create a variant structure to store the various adjustments we'll
need later on, and a function to get the resources needed for one
particular version.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 67 ++++++++++++++++++++++-------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 +++++-
 2 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 963be5bc1d5f..2b275585440d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1178,38 +1178,23 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
 };
 #endif
 
-static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
+static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 {
-#ifdef CONFIG_DRM_VC4_HDMI_CEC
-	struct cec_connector_info conn_info;
-#endif
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_hdmi *vc4_hdmi;
-	struct drm_encoder *encoder;
-	struct device_node *ddc_node;
-	u32 value;
-	int ret;
-
-	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
-	if (!vc4_hdmi)
-		return -ENOMEM;
-
-	vc4_hdmi->pdev = pdev;
-	encoder = &vc4_hdmi->encoder.base.base;
-	encoder->base.type = VC4_ENCODER_TYPE_HDMI0;
+	struct platform_device *pdev = vc4_hdmi->pdev;
+	struct device *dev = &pdev->dev;
 
 	vc4_hdmi->hdmicore_regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(vc4_hdmi->hdmicore_regs))
 		return PTR_ERR(vc4_hdmi->hdmicore_regs);
 
+	vc4_hdmi->hdmi_regset.base = vc4_hdmi->hdmicore_regs;
+	vc4_hdmi->hdmi_regset.regs = hdmi_regs;
+	vc4_hdmi->hdmi_regset.nregs = ARRAY_SIZE(hdmi_regs);
+
 	vc4_hdmi->hd_regs = vc4_ioremap_regs(pdev, 1);
 	if (IS_ERR(vc4_hdmi->hd_regs))
 		return PTR_ERR(vc4_hdmi->hd_regs);
 
-	vc4_hdmi->hdmi_regset.base = vc4_hdmi->hdmicore_regs;
-	vc4_hdmi->hdmi_regset.regs = hdmi_regs;
-	vc4_hdmi->hdmi_regset.nregs = ARRAY_SIZE(hdmi_regs);
 	vc4_hdmi->hd_regset.base = vc4_hdmi->hd_regs;
 	vc4_hdmi->hd_regset.regs = hd_regs;
 	vc4_hdmi->hd_regset.nregs = ARRAY_SIZE(hd_regs);
@@ -1219,12 +1204,44 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		DRM_ERROR("Failed to get pixel clock\n");
 		return PTR_ERR(vc4_hdmi->pixel_clock);
 	}
+
 	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
 	if (IS_ERR(vc4_hdmi->hsm_clock)) {
 		DRM_ERROR("Failed to get HDMI state machine clock\n");
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
 
+	return 0;
+}
+
+static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
+{
+#ifdef CONFIG_DRM_VC4_HDMI_CEC
+	struct cec_connector_info conn_info;
+#endif
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = dev_get_drvdata(master);
+	const struct vc4_hdmi_variant *variant;
+	struct vc4_hdmi *vc4_hdmi;
+	struct drm_encoder *encoder;
+	struct device_node *ddc_node;
+	u32 value;
+	int ret;
+
+	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
+	if (!vc4_hdmi)
+		return -ENOMEM;
+
+	vc4_hdmi->pdev = pdev;
+	variant = of_device_get_match_data(dev);
+	vc4_hdmi->variant = variant;
+	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
+	encoder = &vc4_hdmi->encoder.base.base;
+
+	ret = variant->init_resources(vc4_hdmi);
+	if (ret)
+		return ret;
+
 	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
 	if (!ddc_node) {
 		DRM_ERROR("Failed to find ddc node in device tree\n");
@@ -1384,8 +1401,12 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct vc4_hdmi_variant bcm2835_variant = {
+	.init_resources		= vc4_hdmi_init_resources,
+};
+
 static const struct of_device_id vc4_hdmi_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-hdmi" },
+	{ .compatible = "brcm,bcm2835-hdmi", .data = &bcm2835_variant },
 	{}
 };
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 88794136d2e4..4cd712779ad3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -21,6 +21,15 @@ to_vc4_hdmi_encoder(struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
 }
 
+struct vc4_hdmi;
+
+struct vc4_hdmi_variant {
+	/* Callback to get the resources (memory region, interrupts,
+	 * clocks, etc) for that variant.
+	 */
+	int (*init_resources)(struct vc4_hdmi *vc4_hdmi);
+};
+
 /* HDMI audio information */
 struct vc4_hdmi_audio {
 	struct snd_soc_card card;
@@ -37,6 +46,7 @@ struct vc4_hdmi_audio {
 /* General HDMI hardware state. */
 struct vc4_hdmi {
 	struct platform_device *pdev;
+	const struct vc4_hdmi_variant *variant;
 
 	struct vc4_hdmi_encoder encoder;
 	struct drm_connector connector;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
