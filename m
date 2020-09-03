Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E725D1E5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E116EAC7;
	Fri,  4 Sep 2020 07:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C9A6E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B285BCE3;
 Thu,  3 Sep 2020 04:03:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=efrsbqNA9bpIj
 J4Vv4slbhFYABilIUKZvi6C4Jlr31o=; b=oauD0DxKmqAXkKtei0zbB8fYzSes5
 YJFq96pl/EdDqgrvpDh5OsZFHFrm9ZUzLD5StINh7AYbS1CcBj74BFnv808j0YAD
 4JzzdM2Fl2ygjPAQ1P0T/AgMITIH4agLnRky/Yu1EId+sf+hdU1jW4ogVCOkbdSz
 QWblxfuUI6gUdG9zJqJZMdIMXFwSCixo/ouYt9m+SLWVWvX2n/tpCadx8SG6sn3P
 x+puBDhY1QEWhe8rkXx14sZjwjKqFBEN+7A+U7lIvAhMGOiD4HqHLnDUKt/EwILF
 twBc1hDq5vLTQs1tP7yTNTrOa9s2Pxx9k4Qnro3UMJpjICj0a3VgzXdTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=efrsbqNA9bpIjJ4Vv4slbhFYABilIUKZvi6C4Jlr31o=; b=PBPw5N6i
 zuhJkZqoOS53SALaT+qH+5ZWG17NLZrIjAcv1Ujff/i+7Xw0yA/ib8iHdhwR6fut
 PSJr/gKA96qVMWaSkXCkbXVJM5g0U8QfiGL+WVsVs5m+VDYPOgc25J60H4jPz2Rg
 cgB7yXhEoU3EWN5JX4+zHyw6XrlyecbHbZ/GVzNMJ9lrR39DSomiLfkKOA1kLVG9
 MKq0tKGoW4xdaaoJNRz7+/IcnFedBy7PI4t7xLZsBMBem/LhZQnbMxs0lQhyQV08
 5ERSor/vbYGVzukFfmvfhpMTMs6mvC0SXUd+bfObuhMVVccw5stkMbEg4Di7AhDW
 0lKvASJfxAkBLg==
X-ME-Sender: <xms:N6NQXzqYWhvGx1zqOQmMCRK5JYxDkLA3J8DYSACY9IZ1lZnjPoxEjg>
 <xme:N6NQX9oIxfPE5NhVszPUkSJYWfRg6SW6CgHJBJZA8bpjjpzIUW0K0EYfpXBvbNCxn
 AyjyUCVuXvOmIEqRvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegie
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:N6NQXwP5MP2yPzXUR9UOahZByE3NNsoyD7LrwrGiH5fZiWBke0Quig>
 <xmx:N6NQX24kOjteE4PZ2IsVbLx0jC-V7IkjIKhc-eu4KUwv-yOpN3H_tw>
 <xmx:N6NQXy4bKKpuFQJqMdCEV0XfSbDYejETCsFlGU8tLQleOOMpeQC2gA>
 <xmx:N6NQX6gf6szcAuVuUMiaM0KPXBSwdkFrjsHMRF_iW8VXkXsqRtRX8pd6Rj8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E342D3280067;
 Thu,  3 Sep 2020 04:03:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 50/80] drm/vc4: hdmi: Introduce resource init and variant
Date: Thu,  3 Sep 2020 10:01:22 +0200
Message-Id: <71cfa3ce3d865bbab52a0e5651bc052dc4893f11.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
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

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 61 +++++++++++++++++++++++------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++-
 2 files changed, 51 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5c5684f91b69..c40050b908b5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1178,28 +1178,12 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
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
+	struct platform_device *pdev = vc4_hdmi->pdev;
+	struct device *dev = &pdev->dev;
 	int ret;
 
-	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
-	if (!vc4_hdmi)
-		return -ENOMEM;
-
-	dev_set_drvdata(dev, vc4_hdmi);
-	encoder = &vc4_hdmi->encoder.base.base;
-	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
-	vc4_hdmi->pdev = pdev;
-
 	vc4_hdmi->hdmicore_regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(vc4_hdmi->hdmicore_regs))
 		return PTR_ERR(vc4_hdmi->hdmicore_regs);
@@ -1211,6 +1195,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->hdmi_regset.base = vc4_hdmi->hdmicore_regs;
 	vc4_hdmi->hdmi_regset.regs = hdmi_regs;
 	vc4_hdmi->hdmi_regset.nregs = ARRAY_SIZE(hdmi_regs);
+
 	vc4_hdmi->hd_regset.base = vc4_hdmi->hd_regs;
 	vc4_hdmi->hd_regset.regs = hd_regs;
 	vc4_hdmi->hd_regset.nregs = ARRAY_SIZE(hd_regs);
@@ -1222,12 +1207,44 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			DRM_ERROR("Failed to get pixel clock\n");
 		return ret;
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
+	const struct vc4_hdmi_variant *variant = of_device_get_match_data(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = dev_get_drvdata(master);
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
+	dev_set_drvdata(dev, vc4_hdmi);
+	encoder = &vc4_hdmi->encoder.base.base;
+	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
+	vc4_hdmi->pdev = pdev;
+	vc4_hdmi->variant = variant;
+
+	ret = variant->init_resources(vc4_hdmi);
+	if (ret)
+		return ret;
+
 	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
 	if (!ddc_node) {
 		DRM_ERROR("Failed to find ddc node in device tree\n");
@@ -1403,8 +1420,12 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
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
index 674541493909..0eaf979fe811 100644
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
@@ -39,6 +48,7 @@ struct vc4_hdmi {
 	struct vc4_hdmi_audio audio;
 
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
