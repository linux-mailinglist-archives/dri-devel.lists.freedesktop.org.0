Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AC2CE9DF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579A76EC80;
	Fri,  4 Dec 2020 08:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966986E9C1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 11B77580418;
 Thu,  3 Dec 2020 08:25:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 03 Dec 2020 08:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vYljF7wJrAYto
 tP1BhZneZc3i2+H42G5sa7l9PR8M2s=; b=ipDmleH1JcLI5HXJgHggPRZEUrzFc
 +t9Lmn4L14Qd/eImXYIoWRUp6c9jgDt1y74yRWUfC2z2h7yQN9HRHWr/CYukUp9+
 DmlMiYsUzhufK3PBDuPuR9LTSb65gzN+AR7YPxAvipMLCthnvLY68vGISCRPasVT
 MgQUriGpKXFrDLl6dHw/sEmGp46mwfTB6MfNXQdEcZbRfDVkuGoqmSXeZcE2npBM
 MWGWxB8h0z3PgeE1PeiR3stoE5hd3xSjl2kItGPSawgZT3XfIJGphp8iqvH8Jw12
 CBuZg+GmFm3hgMnKtxkg+TAjP/I0pxC8f4eSBeL/CtOilWaIU7ThFI/8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=vYljF7wJrAYtotP1BhZneZc3i2+H42G5sa7l9PR8M2s=; b=CJq+EICb
 1/dyOtgQf1rsaQ0fyAB4ZILiR+Z414kOm5HY7MAWn9s7N4eRWMmkjnktXuCqTop2
 i0TTZcMg7cfwq1xaEahFMf2l1Wg8nv+R3K1QfiPyy3aE8XkGQG1xvRPGF8qSiuwq
 BJzCYy25K4fZaaW9WFvyMv9pcYZUYTD+IswIAACwHWEJDAqYNt7KqlR1/CtF4n0G
 uKC6q6U87xKWoSwYi7Zku9X+z+rq/QtiqMoq+UaBewTeZpk0rjEH9p8Rj4kZKsir
 Z3J2j4Q/TY2dMa/PkQjGmdK6ZCNj87KF/i0hojuxCC5LbYJct864QfYGQrtuWyEs
 HwLTv4Iy7jbdiA==
X-ME-Sender: <xms:XufIX97H4HKxzCTs6ru8SbIfwjmqMogm4xgyQE4i593pOBThd_dilw>
 <xme:XufIX12sHjFtEqMZF6xoj1mBKxgq8Wl800_MYtsKDn2vgV96RYNIn3_64VDvxaPJ6
 PyO0-CqHVYj9LSHL1s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XufIXzdorxKsPDUTiORSVuef1FR_T4TcSKQT5zfumOQuH81BPe1cYw>
 <xmx:XufIX7fN0k8InAUbm-0RiEpwmOadx3KRf_f_OktG_gxKt8PbAXmZbg>
 <xmx:XufIX-zci6PJ23yB2HZPe-m-XYnS3MkySdn8mCZdcF9XOMxGisdh1Q>
 <xmx:YOfIX0JGeQj2y5yBSgpYjYb-19ouMw_b3l4OfmNgLTBrL_FWbRft8Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A9D0724005B;
 Thu,  3 Dec 2020 08:25:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 4/8] drm/vc4: dsi: Introduce a variant structure
Date: Thu,  3 Dec 2020 14:25:39 +0100
Message-Id: <20201203132543.861591-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203132543.861591-1-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the differences between DSI0 and DSI1 are handled through the
ID. However, the BCM2711 DSI is going to introduce one more variable to
the mix and will break some expectations of the earlier, simpler, test.

Let's add a variant structure that will address most of the differences
between those three controllers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 63 ++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index f704d959e65b..601020c10053 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -493,6 +493,18 @@
  */
 #define DSI1_ID			0x8c
 
+struct vc4_dsi_variant {
+	/* Whether we're on bcm2835's DSI0 or DSI1. */
+	unsigned int port;
+
+	bool broken_axi_workaround;
+
+	const char *debugfs_name;
+	const struct debugfs_reg32 *regs;
+	size_t nregs;
+
+};
+
 /* General DSI hardware state. */
 struct vc4_dsi {
 	struct platform_device *pdev;
@@ -509,8 +521,7 @@ struct vc4_dsi {
 	u32 *reg_dma_mem;
 	dma_addr_t reg_paddr;
 
-	/* Whether we're on bcm2835's DSI0 or DSI1. */
-	int port;
+	const struct vc4_dsi_variant *variant;
 
 	/* DSI channel for the panel we're connected to. */
 	u32 channel;
@@ -586,10 +597,10 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 #define DSI_READ(offset) readl(dsi->regs + (offset))
 #define DSI_WRITE(offset, val) dsi_dma_workaround_write(dsi, offset, val)
 #define DSI_PORT_READ(offset) \
-	DSI_READ(dsi->port ? DSI1_##offset : DSI0_##offset)
+	DSI_READ(dsi->variant->port ? DSI1_##offset : DSI0_##offset)
 #define DSI_PORT_WRITE(offset, val) \
-	DSI_WRITE(dsi->port ? DSI1_##offset : DSI0_##offset, val)
-#define DSI_PORT_BIT(bit) (dsi->port ? DSI1_##bit : DSI0_##bit)
+	DSI_WRITE(dsi->variant->port ? DSI1_##offset : DSI0_##offset, val)
+#define DSI_PORT_BIT(bit) (dsi->variant->port ? DSI1_##bit : DSI0_##bit)
 
 /* VC4 DSI encoder KMS struct */
 struct vc4_dsi_encoder {
@@ -837,7 +848,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 
 	ret = pm_runtime_get_sync(dev);
 	if (ret) {
-		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->port);
+		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->variant->port);
 		return;
 	}
 
@@ -871,7 +882,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	DSI_PORT_WRITE(STAT, DSI_PORT_READ(STAT));
 
 	/* Set AFE CTR00/CTR1 to release powerdown of analog. */
-	if (dsi->port == 0) {
+	if (dsi->variant->port == 0) {
 		u32 afec0 = (VC4_SET_FIELD(7, DSI_PHY_AFEC0_PTATADJ) |
 			     VC4_SET_FIELD(7, DSI_PHY_AFEC0_CTATADJ));
 
@@ -1017,7 +1028,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 		       DSI_PORT_BIT(PHYC_CLANE_ENABLE) |
 		       ((dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ?
 			0 : DSI_PORT_BIT(PHYC_HS_CLK_CONTINUOUS)) |
-		       (dsi->port == 0 ?
+		       (dsi->variant->port == 0 ?
 			VC4_SET_FIELD(lpx - 1, DSI0_PHYC_ESC_CLK_LPDT) :
 			VC4_SET_FIELD(lpx - 1, DSI1_PHYC_ESC_CLK_LPDT)));
 
@@ -1043,13 +1054,13 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 		       DSI_DISP1_ENABLE);
 
 	/* Ungate the block. */
-	if (dsi->port == 0)
+	if (dsi->variant->port == 0)
 		DSI_PORT_WRITE(CTRL, DSI_PORT_READ(CTRL) | DSI0_CTRL_CTRL0);
 	else
 		DSI_PORT_WRITE(CTRL, DSI_PORT_READ(CTRL) | DSI1_CTRL_EN);
 
 	/* Bring AFE out of reset. */
-	if (dsi->port == 0) {
+	if (dsi->variant->port == 0) {
 	} else {
 		DSI_PORT_WRITE(PHY_AFEC0,
 			       DSI_PORT_READ(PHY_AFEC0) &
@@ -1313,8 +1324,16 @@ static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
 	.mode_fixup = vc4_dsi_encoder_mode_fixup,
 };
 
+static const struct vc4_dsi_variant bcm2835_dsi1_variant = {
+	.port			= 1,
+	.broken_axi_workaround	= true,
+	.debugfs_name		= "dsi1_regs",
+	.regs			= dsi1_regs,
+	.nregs			= ARRAY_SIZE(dsi1_regs),
+};
+
 static const struct of_device_id vc4_dsi_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-dsi1", (void *)(uintptr_t)1 },
+	{ .compatible = "brcm,bcm2835-dsi1", &bcm2835_dsi1_variant },
 	{}
 };
 
@@ -1325,7 +1344,7 @@ static void dsi_handle_error(struct vc4_dsi *dsi,
 	if (!(stat & bit))
 		return;
 
-	DRM_ERROR("DSI%d: %s error\n", dsi->port, type);
+	DRM_ERROR("DSI%d: %s error\n", dsi->variant->port, type);
 	*ret = IRQ_HANDLED;
 }
 
@@ -1423,7 +1442,7 @@ vc4_dsi_init_phy_clocks(struct vc4_dsi *dsi)
 		int ret;
 
 		snprintf(clk_name, sizeof(clk_name),
-			 "dsi%u_%s", dsi->port, phy_clocks[i].name);
+			 "dsi%u_%s", dsi->variant->port, phy_clocks[i].name);
 
 		/* We just use core fixed factor clock ops for the PHY
 		 * clocks.  The clocks are actually gated by the
@@ -1471,7 +1490,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (!match)
 		return -ENODEV;
 
-	dsi->port = (uintptr_t)match->data;
+	dsi->variant = match->data;
 
 	vc4_dsi_encoder = devm_kzalloc(dev, sizeof(*vc4_dsi_encoder),
 				       GFP_KERNEL);
@@ -1488,13 +1507,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(dsi->regs);
 
 	dsi->regset.base = dsi->regs;
-	if (dsi->port == 0) {
-		dsi->regset.regs = dsi0_regs;
-		dsi->regset.nregs = ARRAY_SIZE(dsi0_regs);
-	} else {
-		dsi->regset.regs = dsi1_regs;
-		dsi->regset.nregs = ARRAY_SIZE(dsi1_regs);
-	}
+	dsi->regset.regs = dsi->variant->regs;
+	dsi->regset.nregs = dsi->variant->nregs;
 
 	if (DSI_PORT_READ(ID) != DSI_ID_VALUE) {
 		dev_err(dev, "Port returned 0x%08x for ID instead of 0x%08x\n",
@@ -1506,7 +1520,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 * from the ARM.  It does handle writes from the DMA engine,
 	 * so set up a channel for talking to it.
 	 */
-	if (dsi->port == 1) {
+	if (dsi->variant->broken_axi_workaround) {
 		dsi->reg_dma_mem = dma_alloc_coherent(dev, 4,
 						      &dsi->reg_dma_paddr,
 						      GFP_KERNEL);
@@ -1627,10 +1641,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
 
-	if (dsi->port == 0)
-		vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
-	else
-		vc4_debugfs_add_regset32(drm, "dsi1_regs", &dsi->regset);
+	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
 
 	pm_runtime_enable(dev);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
