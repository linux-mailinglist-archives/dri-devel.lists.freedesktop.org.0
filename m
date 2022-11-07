Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99B61EA9F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 06:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D1510E1E6;
	Mon,  7 Nov 2022 05:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 594 seconds by postgrey-1.36 at gabe;
 Mon, 07 Nov 2022 05:45:52 UTC
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0255A10E1DD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 05:45:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9DEF65C010C;
 Mon,  7 Nov 2022 00:35:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Nov 2022 00:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667799358; x=1667885758; bh=hJ
 m3+9Icpv8Ke2FDwmS9fKVqHyT127p94CmAYBoMAhs=; b=FgmMl/K89bVXhV0r/k
 Kl4jwiLC2N49AAwAKPzJ2B7OYJbfb50Waf6uzgAdDVa0X5hUTfE9PogSj9MsjC8i
 8W2n07zunObPqEI6Po1QwlMnUxcGiGzrSIE1dZSOSYlB/aVrI+WzmvE+ekzyroA0
 qWWc/Pi5Jd1bwhINzLq9lJ6KZgQriGZMPWZLjvQzZ0fqp8MT14VlIwejU/uek1AX
 2aP5cbRb3WDH/j6CTMTCSF/QjbfOjB+oFWYo+lPiARYaKMqvhPIBnQc5FTNPrY8C
 YntODwk1RsbW62xNf1wDGbEDFIjtbS1dPMX8+zukK/duDE87nNkDjgUbTL+btEDc
 tPSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667799358; x=1667885758; bh=hJm3+9Icpv8Ke
 2FDwmS9fKVqHyT127p94CmAYBoMAhs=; b=nF+Nf6wnls2jvRTOZjaUWlED1V+aR
 Jy8tNu79Csij6O2mO1o3j2DL0oPJSo23W6rXcJA/DF7Cy/YI6rUl0uurLqEF/4E6
 Bj3rvQQ+gfwmhGs2OotE8l42IBi9lTzCOzwGZDqzcic1OaMFI+gxKNdCaUBJNoie
 RUX9waLG9+AYSKd6ao4LObBV6qAj7Ivg9guaPEbi12OCNoFsZbwwDBI3R3a9wwmM
 zF5G6yz8hzrtYkeZRg+vo4bQA185MA2kn3HxMsBZzeFvSe5DqHHOzBPJyoskoJ6g
 WqZDqD+nbhM0iybCkuFBTAQsvW0t9tvSBANfUE1iih53xfnbFMNM9MgSg==
X-ME-Sender: <xms:PploYxh0kEyaNQILQZsZSN6UxKxx2vTzDPXxVmsgo8tqxea6ufebtA>
 <xme:PploY2Aa5X-0FCuVBRZP6eOwdXrRyX9GeftAKJknv_BMibXMAhWKH7l96ADBWZsal
 t4riRCstFrpkcaDmg>
X-ME-Received: <xmr:PploYxHTHtL88kR8JwM2mfuzgUOyQREEQ_xy0TDZdYLnto8qqqQZ68PeglyY0CAWQBDLK24N4PMTquEcBt19borDEgErC5aO6x-L4OVVkE6HN3ScAiMEwnNiI7d6iXy9HXaVag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:PploY2SQUL_OZDOXc_R4YdJ4-VYtlxWlGguyMI1zFvDYrIvOFai0Aw>
 <xmx:PploY-wWe-cU_YqZcaYO-75_ezGmS3oXPVF_L3lHI8OR9SZjhVpJ7w>
 <xmx:PploY85md3ApWDETR1NEOjxGpnTtbvTeiQhozur8_5SNtu1in3MBkw>
 <xmx:PploY5qyxqSmFliedWUbBuNSQ58N6Q-x3MW0380Mo1gI1yJOgVsu3w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 00:35:57 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 3/4] drm/sun4i: dsi: Add a variant structure
Date: Sun,  6 Nov 2022 23:35:51 -0600
Message-Id: <20221107053552.2330-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221107053552.2330-1-samuel@sholland.org>
References: <20221107053552.2330-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the ad-hoc calls to of_device_is_compatible() with a structure
describing the differences between variants. This is in preparation for
adding more variants to the driver.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Add the variant check to the probe error path

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 53 +++++++++++++++++---------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  7 ++++
 2 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 34234a144e87..f22c96cc8408 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1101,12 +1101,16 @@ static const struct component_ops sun6i_dsi_ops = {
 
 static int sun6i_dsi_probe(struct platform_device *pdev)
 {
+	const struct sun6i_dsi_variant *variant;
 	struct device *dev = &pdev->dev;
-	const char *bus_clk_name = NULL;
 	struct sun6i_dsi *dsi;
 	void __iomem *base;
 	int ret;
 
+	variant = device_get_match_data(dev);
+	if (!variant)
+		return -EINVAL;
+
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
 		return -ENOMEM;
@@ -1114,10 +1118,7 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	dsi->dev = dev;
 	dsi->host.ops = &sun6i_dsi_host_ops;
 	dsi->host.dev = dev;
-
-	if (of_device_is_compatible(dev->of_node,
-				    "allwinner,sun6i-a31-mipi-dsi"))
-		bus_clk_name = "bus";
+	dsi->variant = variant;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
@@ -1142,7 +1143,7 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->regs);
 	}
 
-	dsi->bus_clk = devm_clk_get(dev, bus_clk_name);
+	dsi->bus_clk = devm_clk_get(dev, variant->has_mod_clk ? "bus" : NULL);
 	if (IS_ERR(dsi->bus_clk))
 		return dev_err_probe(dev, PTR_ERR(dsi->bus_clk),
 				     "Couldn't get the DSI bus clock\n");
@@ -1151,21 +1152,21 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (of_device_is_compatible(dev->of_node,
-				    "allwinner,sun6i-a31-mipi-dsi")) {
+	if (variant->has_mod_clk) {
 		dsi->mod_clk = devm_clk_get(dev, "mod");
 		if (IS_ERR(dsi->mod_clk)) {
 			dev_err(dev, "Couldn't get the DSI mod clock\n");
 			ret = PTR_ERR(dsi->mod_clk);
 			goto err_attach_clk;
 		}
-	}
 
-	/*
-	 * In order to operate properly, that clock seems to be always
-	 * set to 297MHz.
-	 */
-	clk_set_rate_exclusive(dsi->mod_clk, 297000000);
+		/*
+		 * In order to operate properly, the module clock on the
+		 * A31 variant always seems to be set to 297MHz.
+		 */
+		if (variant->set_mod_clk)
+			clk_set_rate_exclusive(dsi->mod_clk, 297000000);
+	}
 
 	dsi->dphy = devm_phy_get(dev, "dphy");
 	if (IS_ERR(dsi->dphy)) {
@@ -1191,7 +1192,8 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 err_remove_dsi_host:
 	mipi_dsi_host_unregister(&dsi->host);
 err_unprotect_clk:
-	clk_rate_exclusive_put(dsi->mod_clk);
+	if (dsi->variant->has_mod_clk && dsi->variant->set_mod_clk)
+		clk_rate_exclusive_put(dsi->mod_clk);
 err_attach_clk:
 	regmap_mmio_detach_clk(dsi->regs);
 
@@ -1205,16 +1207,31 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
 
 	component_del(&pdev->dev, &sun6i_dsi_ops);
 	mipi_dsi_host_unregister(&dsi->host);
-	clk_rate_exclusive_put(dsi->mod_clk);
+	if (dsi->variant->has_mod_clk && dsi->variant->set_mod_clk)
+		clk_rate_exclusive_put(dsi->mod_clk);
 
 	regmap_mmio_detach_clk(dsi->regs);
 
 	return 0;
 }
 
+static const struct sun6i_dsi_variant sun6i_a31_mipi_dsi_variant = {
+	.has_mod_clk	= true,
+	.set_mod_clk	= true,
+};
+
+static const struct sun6i_dsi_variant sun50i_a64_mipi_dsi_variant = {
+};
+
 static const struct of_device_id sun6i_dsi_of_table[] = {
-	{ .compatible = "allwinner,sun6i-a31-mipi-dsi" },
-	{ .compatible = "allwinner,sun50i-a64-mipi-dsi" },
+	{
+		.compatible	= "allwinner,sun6i-a31-mipi-dsi",
+		.data		= &sun6i_a31_mipi_dsi_variant,
+	},
+	{
+		.compatible	= "allwinner,sun50i-a64-mipi-dsi",
+		.data		= &sun50i_a64_mipi_dsi_variant,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index c863900ae3b4..f1ddefe0f554 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -15,6 +15,11 @@
 
 #define SUN6I_DSI_TCON_DIV	4
 
+struct sun6i_dsi_variant {
+	bool			has_mod_clk;
+	bool			set_mod_clk;
+};
+
 struct sun6i_dsi {
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
@@ -31,6 +36,8 @@ struct sun6i_dsi {
 	struct mipi_dsi_device	*device;
 	struct drm_device	*drm;
 	struct drm_panel	*panel;
+
+	const struct sun6i_dsi_variant *variant;
 };
 
 static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
-- 
2.37.3

