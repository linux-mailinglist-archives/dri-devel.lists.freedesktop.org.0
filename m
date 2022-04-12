Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C54FCE0A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C67410EE1D;
	Tue, 12 Apr 2022 04:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C3C10EDEE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:35:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5CD47320204A;
 Tue, 12 Apr 2022 00:35:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 12 Apr 2022 00:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649738122; x=1649824522; bh=fZ
 Acb5pqlhT+bOuovHsyfK9Q+AB2e6Nd/iXBeFymNSE=; b=WMoJA/pUssaG/5x/jp
 avnCw4sOHupQGBsE0208z+JlyTbzbgJOIM8WW7Pulq8lgBwiq71klZ2cWUotATms
 XKDnENznVHwjjXvzQMxLDNMJFdj4tH3o5HmSysOn/bMhZxAxOW5HyC7oL7Yb3mQC
 3ln8+naE7+akLVVsDHFUIuSytLbn/zfYnpdLYupBvCvxLT7RZKihzq5kzN9cJaAR
 qDO1p4PJPteTUtdK9FYPIZvs0O+48bWOswy5LqM6usGdwMM43TUtmJLa9cITz8ft
 dMWE0hysC7yLoitaKeVc92N4M4r6yhKmihF/j/3zseDvPr7+RxKzUNB9n+p4mWbY
 N7+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649738122; x=1649824522; bh=fZAcb5pqlhT+bOuovHsyfK9Q+AB2e6Nd/iX
 BeFymNSE=; b=Q/38zzqveOF3iT+MXQaBdIqVdSqvuvID+AivUPqjCrYLZDzDzkf
 mdRjkhLh8qrY8507rF/SrgVaIzH/BcDB3G3MY+6+o+Cr0od+eeuL7VDd9okjcc8i
 YCNPymCKqzs3jKUu2I6oc3OR/w2zBPx8IE+bMgzFZDT227WiWayhGo/fZY3UnjdH
 3LP1xUA3Ox4Wsjw075SMZ/ZjTUbo9nDPjrxcoTO80Peu0ma1PE0Lf8GhB19hh7gq
 ZmEDXpxh5ZNqkRnJMEdwBeSJOyrIG13CDYWB+Df3NOheBeg6XF8gC8YPIfEZ2gs9
 ycrz48e/Ds3i/VhB6jqEohtV86BlZ4z775A==
X-ME-Sender: <xms:igFVYloWKz91H7HRE9IRA01JFRUfiUD1-x-LoWAD6t25jhFnM7wbyQ>
 <xme:igFVYnp8W4pGz3HMoAy27m0zB12-H-dPCbOdal5L2HiI1hvw9VBinSffR3NJ0pbiJ
 yXxEAwbHio6C5ZDhQ>
X-ME-Received: <xmr:igFVYiP0oZ7wnaczWu06a7tiP_f_Skwuf3L1c3K4UgkHuIKbplSMWwbnkqqV67incbMM6HZnFeaTrUY-f-Okmr-1LFnNXIH-ekKXhMQwL3zIV8J7C_DjcuCT6eJo9tlKX-SRfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:igFVYg7Rc7vIlvGpmv77-mHwOaGtFeRjtKOX3lCKFARt3D-vBqTC9w>
 <xmx:igFVYk5bTvdHASwwfrcDMWB-FaksuiU4LFWwjndgiu_ivhBsTz-18Q>
 <xmx:igFVYoiQMwOvP4YFlb50FQ0AXmzBYHay7fO_OS05_Hvz63goSGZBWA>
 <xmx:igFVYlFRd5evRHLq0qzNtLf6s0HtDV2iCHfPeMU-hQRfR1HO-w2J_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:35:22 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 3/6] drm/sun4i: sun8i-hdmi-phy: Used device-managed
 clocks/resets
Date: Mon, 11 Apr 2022 23:35:08 -0500
Message-Id: <20220412043512.49364-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412043512.49364-1-samuel@sholland.org>
References: <20220412043512.49364-1-samuel@sholland.org>
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the HDMI PHY is using a platform driver, it can use device-
managed resources. Use these, as well as the dev_err_probe helper, to
simplify the probe function and get rid of the remove function.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 100 ++++++++-----------------
 1 file changed, 30 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 1effa30bfe62..1351e633d485 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -673,10 +673,8 @@ int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
 static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
 	struct sun8i_hdmi_phy *phy;
 	void __iomem *regs;
-	int ret;
 
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
@@ -686,88 +684,50 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	phy->dev = dev;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs)) {
-		dev_err(dev, "Couldn't map the HDMI PHY registers\n");
-		return PTR_ERR(regs);
-	}
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs),
+				     "Couldn't map the HDMI PHY registers\n");
 
 	phy->regs = devm_regmap_init_mmio(dev, regs,
 					  &sun8i_hdmi_phy_regmap_config);
-	if (IS_ERR(phy->regs)) {
-		dev_err(dev, "Couldn't create the HDMI PHY regmap\n");
-		return PTR_ERR(phy->regs);
-	}
+	if (IS_ERR(phy->regs))
+		return dev_err_probe(dev, PTR_ERR(phy->regs),
+				     "Couldn't create the HDMI PHY regmap\n");
 
-	phy->clk_bus = of_clk_get_by_name(node, "bus");
-	if (IS_ERR(phy->clk_bus)) {
-		dev_err(dev, "Could not get bus clock\n");
-		return PTR_ERR(phy->clk_bus);
-	}
-
-	phy->clk_mod = of_clk_get_by_name(node, "mod");
-	if (IS_ERR(phy->clk_mod)) {
-		dev_err(dev, "Could not get mod clock\n");
-		ret = PTR_ERR(phy->clk_mod);
-		goto err_put_clk_bus;
-	}
+	phy->clk_bus = devm_clk_get(dev, "bus");
+	if (IS_ERR(phy->clk_bus))
+		return dev_err_probe(dev, PTR_ERR(phy->clk_bus),
+				     "Could not get bus clock\n");
 
-	if (phy->variant->has_phy_clk) {
-		phy->clk_pll0 = of_clk_get_by_name(node, "pll-0");
-		if (IS_ERR(phy->clk_pll0)) {
-			dev_err(dev, "Could not get pll-0 clock\n");
-			ret = PTR_ERR(phy->clk_pll0);
-			goto err_put_clk_mod;
-		}
-
-		if (phy->variant->has_second_pll) {
-			phy->clk_pll1 = of_clk_get_by_name(node, "pll-1");
-			if (IS_ERR(phy->clk_pll1)) {
-				dev_err(dev, "Could not get pll-1 clock\n");
-				ret = PTR_ERR(phy->clk_pll1);
-				goto err_put_clk_pll0;
-			}
-		}
-	}
+	phy->clk_mod = devm_clk_get(dev, "mod");
+	if (IS_ERR(phy->clk_mod))
+		return dev_err_probe(dev, PTR_ERR(phy->clk_mod),
+				     "Could not get mod clock\n");
 
-	phy->rst_phy = of_reset_control_get_shared(node, "phy");
-	if (IS_ERR(phy->rst_phy)) {
-		dev_err(dev, "Could not get phy reset control\n");
-		ret = PTR_ERR(phy->rst_phy);
-		goto err_put_clk_pll1;
-	}
+	if (phy->variant->has_phy_clk)
+		phy->clk_pll0 = devm_clk_get(dev, "pll-0");
+	if (IS_ERR(phy->clk_pll0))
+		return dev_err_probe(dev, PTR_ERR(phy->clk_pll0),
+				     "Could not get pll-0 clock\n");
+
+	if (phy->variant->has_second_pll)
+		phy->clk_pll1 = devm_clk_get(dev, "pll-1");
+	if (IS_ERR(phy->clk_pll1))
+		return dev_err_probe(dev, PTR_ERR(phy->clk_pll1),
+				     "Could not get pll-1 clock\n");
+
+	phy->rst_phy = devm_reset_control_get_shared(dev, "phy");
+	if (IS_ERR(phy->rst_phy))
+		return dev_err_probe(dev, PTR_ERR(phy->rst_phy),
+				     "Could not get phy reset control\n");
 
 	platform_set_drvdata(pdev, phy);
 
 	return 0;
-
-err_put_clk_pll1:
-	clk_put(phy->clk_pll1);
-err_put_clk_pll0:
-	clk_put(phy->clk_pll0);
-err_put_clk_mod:
-	clk_put(phy->clk_mod);
-err_put_clk_bus:
-	clk_put(phy->clk_bus);
-
-	return ret;
-}
-
-static int sun8i_hdmi_phy_remove(struct platform_device *pdev)
-{
-	struct sun8i_hdmi_phy *phy = platform_get_drvdata(pdev);
-
-	reset_control_put(phy->rst_phy);
-
-	clk_put(phy->clk_pll0);
-	clk_put(phy->clk_pll1);
-	clk_put(phy->clk_mod);
-	clk_put(phy->clk_bus);
-	return 0;
 }
 
 struct platform_driver sun8i_hdmi_phy_driver = {
 	.probe  = sun8i_hdmi_phy_probe,
-	.remove = sun8i_hdmi_phy_remove,
 	.driver = {
 		.name = "sun8i-hdmi-phy",
 		.of_match_table = sun8i_hdmi_phy_of_table,
-- 
2.35.1

