Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CEA54C0E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 06:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3828810FE66;
	Wed, 15 Jun 2022 04:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934A210FDC5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 04:55:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F1375320096C;
 Wed, 15 Jun 2022 00:55:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 15 Jun 2022 00:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655268954; x=1655355354; bh=4R
 SAB9WD1dJBoGy/ykZA0xO819bE9MGyQmRwgpMsiv0=; b=kAZ3mbFOJcYWLlVOna
 eE7pMGbk9QVC9aGpjMA4MR0OrYtrYh2pumu6fMUe9jGjRjPAxwk6PnXBLyw95/0D
 xr5CCJ//ZOQyvy4MNWQXetk88UDXRrepGks9iaUT6AgptsL0OxZdVcwD1UAjF1we
 4YgfTeupmsWSciAbUH1FYQS7i9AjMp5bEnJ/6pwDePCnIkXUEvFJw3BRzIfoMI98
 frtjkaNE7+yxIXnCEVzH072QAykkBr9CO6V06AME586vnZ4AbreUgu1y5Q3P1iYQ
 rafv1LIyJIIA5HkjfkczCApFPdP+dNAKdFsXe5/NsYgKhMBrZiU2gQ9pw2dZg2K+
 Htcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655268954; x=1655355354; bh=4RSAB9WD1dJBo
 Gy/ykZA0xO819bE9MGyQmRwgpMsiv0=; b=bnnkKio8GO/xCIs/cI7nSn1eCsriM
 PhO8XWj//4vVwBP/9V2VMn3F4jWRT/1lp4SNeaisJXpSSEjIhx4BcDT8J14+TALY
 cO/t4AiZVCYRcfc87twxwtVKIg1kcnR5IKgqvdv9ebpL06t6wKZYBCQG7FlIhq/w
 djZpPo5HplTUts/oOOqj3HuLpbckgs0h4ShO8ASTlQDpTaz1jGD2ctrgDppdD+Fo
 os4iHyVQjblzE9NGZ6ccsqGNsgW1SLyQV062sNYvfXgimjvWST1frgOGlHv48Htl
 kni80rg1RT1fJ6K4lKbpYtguMnJvhvYUlvs8btsdyLP0vi3PiV2iU5hUA==
X-ME-Sender: <xms:WmapYl8g01kG-9Zeg9ySmzO3uupyuA_yrs8toepcDlIV8I7fztppCg>
 <xme:WmapYps-hG-8cRuU2xwaeGZKYFEsd4-kQgcXo__9j3MlVRgguKqNxZSdQDCafYX3X
 JIsRJgmSGiKzRhIBA>
X-ME-Received: <xmr:WmapYjBC0mOx8WigOSDPTy6WkVRyu6zHTzMndoNJrHDlTjeK_jIrOn7Z03O7yRmUNz5ud-eOV9Qh1bIfYGPJe_FMfvyYpn3xTG69PxLrgaTlOYWuO6yb0dpibEF_pKsq9fwrng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvtddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:WmapYpe6IFH2cJ7XBHEJNu4S9QY9IqC72pi341ckdxjHuNKIc-SYyw>
 <xmx:WmapYqPgCiTG39cyHChVDbaPyhL232I-q5gzBiklYPPzR5fbdSvoQg>
 <xmx:WmapYrmzng_rAinb8u0M1iiY99yNmwbOMql1oA0pF_7T8K05A_kKBg>
 <xmx:WmapYhqvRSSEHy9_8HVFj0ifP-BuR0P0RCJDf1ufw2rdnmxJ-U9g5Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 00:55:53 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 3/6] drm/sun4i: sun8i-hdmi-phy: Used device-managed
 clocks/resets
Date: Tue, 14 Jun 2022 23:55:40 -0500
Message-Id: <20220615045543.62813-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615045543.62813-1-samuel@sholland.org>
References: <20220615045543.62813-1-samuel@sholland.org>
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

Changes in v2:
 - Move error handling inside variant checks in probe function

 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 90 ++++++++------------------
 1 file changed, 26 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 10504c2de132..9086ce547fad 100644
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
@@ -686,88 +684,52 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
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
+	phy->clk_bus = devm_clk_get(dev, "bus");
+	if (IS_ERR(phy->clk_bus))
+		return dev_err_probe(dev, PTR_ERR(phy->clk_bus),
+				     "Could not get bus clock\n");
 
-	phy->clk_mod = of_clk_get_by_name(node, "mod");
-	if (IS_ERR(phy->clk_mod)) {
-		dev_err(dev, "Could not get mod clock\n");
-		ret = PTR_ERR(phy->clk_mod);
-		goto err_put_clk_bus;
-	}
+	phy->clk_mod = devm_clk_get(dev, "mod");
+	if (IS_ERR(phy->clk_mod))
+		return dev_err_probe(dev, PTR_ERR(phy->clk_mod),
+				     "Could not get mod clock\n");
 
 	if (phy->variant->has_phy_clk) {
-		phy->clk_pll0 = of_clk_get_by_name(node, "pll-0");
-		if (IS_ERR(phy->clk_pll0)) {
-			dev_err(dev, "Could not get pll-0 clock\n");
-			ret = PTR_ERR(phy->clk_pll0);
-			goto err_put_clk_mod;
-		}
+		phy->clk_pll0 = devm_clk_get(dev, "pll-0");
+		if (IS_ERR(phy->clk_pll0))
+			return dev_err_probe(dev, PTR_ERR(phy->clk_pll0),
+					     "Could not get pll-0 clock\n");
 
 		if (phy->variant->has_second_pll) {
-			phy->clk_pll1 = of_clk_get_by_name(node, "pll-1");
-			if (IS_ERR(phy->clk_pll1)) {
-				dev_err(dev, "Could not get pll-1 clock\n");
-				ret = PTR_ERR(phy->clk_pll1);
-				goto err_put_clk_pll0;
-			}
+			phy->clk_pll1 = devm_clk_get(dev, "pll-1");
+			if (IS_ERR(phy->clk_pll1))
+				return dev_err_probe(dev, PTR_ERR(phy->clk_pll1),
+						     "Could not get pll-1 clock\n");
 		}
 	}
 
-	phy->rst_phy = of_reset_control_get_shared(node, "phy");
-	if (IS_ERR(phy->rst_phy)) {
-		dev_err(dev, "Could not get phy reset control\n");
-		ret = PTR_ERR(phy->rst_phy);
-		goto err_put_clk_pll1;
-	}
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

