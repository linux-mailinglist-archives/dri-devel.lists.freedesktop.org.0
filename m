Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EDF927473
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 12:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6397E10EA95;
	Thu,  4 Jul 2024 10:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lzEeOL+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD7B10EA95
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 10:57:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D38562668;
 Thu,  4 Jul 2024 10:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91F3C3277B;
 Thu,  4 Jul 2024 10:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720090668;
 bh=V+KXgBsdWqqQhukSQm9HVIb7N1iIDvx2Pq5wFVvJehc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lzEeOL+yPLEs0bGyrbd0GAzjxXb0c1N+FUB1VEp3X/qGeQqC84RuSyq1ZQG7jZODt
 CLdovOSEGbKIiyZ6EKpp4cS/CCV5vVIUkI2pXC5pKPGvhSywzR/oxQfuiLDY441gmh
 VA5Oog6Nh5I+zrj2WCgJdozyNteE7S/01MrvhFID2yrt2xErHcQ4wuSdz1JLl7LOfn
 TSTxl0O7UH+U2nsblLAjeb1Z92ANmkjr9+p7RW9Jm5rPI5xBHurBJ10MH8fkND7Lu5
 +bu4ZWwx8Fhf5TAB4C7lN1JYrxrJA6gV/HABStOau1Yb3LjEgfsoC45Oz4IQSoy5xN
 wiCeraEQ4YHxg==
Message-ID: <9ef5a1ba-e404-46e0-8513-5fffbfb5618b@kernel.org>
Date: Thu, 4 Jul 2024 12:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/bridge: add Microchip DSI controller support for
 sam9x7 SoC series
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, arnd@arndb.de,
 Jason@zx2c4.com, palmer@rivosinc.com, mpe@ellerman.id.au,
 rdunlap@infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Hari.PrasathGE@microchip.com
References: <20240704084837.168075-1-manikandan.m@microchip.com>
 <20240704084837.168075-3-manikandan.m@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240704084837.168075-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/07/2024 10:48, Manikandan Muralidharan wrote:
> Add the Microchip's DSI controller wrapper driver that uses
> the Synopsys DesignWare MIPI DSI host controller bridge.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---


...

> +
> +#define HSTT(_maxfreq, _c_lp2hs, _c_hs2lp, _d_lp2hs, _d_hs2lp)	\
> +{					\
> +	.maxfreq = _maxfreq,		\
> +	.timing = {			\
> +		.clk_lp2hs = _c_lp2hs,	\
> +		.clk_hs2lp = _c_hs2lp,	\
> +		.data_lp2hs = _d_lp2hs,	\
> +		.data_hs2lp = _d_hs2lp,	\
> +	}				\
> +}
> +
> +struct hstt hstt_table[] = {

So more globals? No.

> +	HSTT(90,  32, 20,  26, 13),
> +	HSTT(100,  35, 23,  28, 14),
> +	HSTT(110,  32, 22,  26, 13),
> +	HSTT(130,  31, 20,  27, 13),
> +	HSTT(140,  33, 22,  26, 14),
> +	HSTT(150,  33, 21,  26, 14),
> +	HSTT(170,  32, 20,  27, 13),
> +	HSTT(180,  36, 23,  30, 15),
> +	HSTT(200,  40, 22,  33, 15),
> +	HSTT(220,  40, 22,  33, 15),
> +	HSTT(240,  44, 24,  36, 16),
> +	HSTT(250,  48, 24,  38, 17),
> +	HSTT(270,  48, 24,  38, 17),
> +	HSTT(300,  50, 27,  41, 18),
> +	HSTT(330,  56, 28,  45, 18),
> +	HSTT(360,  59, 28,  48, 19),
> +	HSTT(400,  61, 30,  50, 20),
> +	HSTT(450,  67, 31,  55, 21),
> +	HSTT(500,  73, 31,  59, 22),
> +	HSTT(550,  79, 36,  63, 24),
> +	HSTT(600,  83, 37,  68, 25),
> +	HSTT(650,  90, 38,  73, 27),
> +	HSTT(700,  95, 40,  77, 28),
> +	HSTT(750, 102, 40,  84, 28),
> +	HSTT(800, 106, 42,  87, 30),
> +	HSTT(850, 113, 44,  93, 31),
> +	HSTT(900, 118, 47,  98, 32),
> +	HSTT(950, 124, 47, 102, 34),
> +	HSTT(1000, 130, 49, 107, 35),
> +};
> +

...

> +
> +static void dw_mipi_dsi_mchp_power_on(void *priv_data)
> +{
> +	struct dw_mipi_dsi_mchp *dsi = priv_data;
> +
> +	/* Enable the DSI wrapper */
> +	dsi_write(dsi, DSI_PWR_UP, HOST_PWRUP);
> +}
> +
> +static void dw_mipi_dsi_mchp_power_off(void *priv_data)
> +{
> +	struct dw_mipi_dsi_mchp *dsi = priv_data;
> +
> +	/* Disable the DSI wrapper */
> +	dsi_write(dsi, DSI_PWR_UP, HOST_RESET);
> +}
> +
> +struct dw_mipi_dsi_phy_ops dw_mipi_dsi_mchp_phy_ops = {

Why this is not static?

Why this is not const?

> +	.init = dw_mipi_dsi_mchp_init,
> +	.power_on = dw_mipi_dsi_mchp_power_on,
> +	.power_off = dw_mipi_dsi_mchp_power_off,
> +	.get_lane_mbps = dw_mipi_dsi_mchp_get_lane_mbps,
> +	.get_timing = dw_mipi_dsi_mchp_get_timing,
> +};
> +
> +static int dw_mipi_dsi_mchp_probe(struct platform_device *pdev)
> +{
> +	struct dw_mipi_dsi_mchp *dsi;
> +	struct resource *res;
> +	struct regmap *sfr;
> +	const struct dw_mipi_dsi_mchp_chip_data *cdata;
> +	int ret;
> +
> +	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!dsi)
> +		return -ENOMEM;
> +
> +	dsi->dev = &pdev->dev;
> +	cdata = of_device_get_match_data(dsi->dev);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	dsi->base = devm_ioremap_resource(&pdev->dev, res);

There is a helper for these two.

> +	if (IS_ERR(dsi->base)) {
> +		ret = PTR_ERR(dsi->base);
> +		dev_err(dsi->dev, "Unable to get DSI Base address: %d\n", ret);

return dev_err_probe

> +		return ret;
> +	}
> +
> +	dsi->pclk = devm_clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(dsi->pclk)) {
> +		ret = PTR_ERR(dsi->pclk);
> +		dev_err(dsi->dev, "Unable to get pclk: %d\n", ret);

return dev_err_probe

You are upstreaming some old code, aren't you?

> +		return ret;
> +	}
> +
> +	dsi->pllref_clk = devm_clk_get(&pdev->dev, "refclk");
> +	if (IS_ERR(dsi->pllref_clk)) {
> +		ret = PTR_ERR(dsi->pllref_clk);
> +		dev_err(dsi->dev, "Unable to get DSI PHY PLL reference clock: %d\n",

return dev_err_probe


> +			ret);
> +		return ret;
> +	}
> +
> +	clk_set_rate(dsi->pllref_clk, DSI_PLL_REF_CLK);
> +	if (clk_get_rate(dsi->pllref_clk) != DSI_PLL_REF_CLK) {
> +		dev_err(dsi->dev, "Failed to set DSI PHY PLL reference clock\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = clk_prepare_enable(dsi->pllref_clk);

Enable clock later, so your error paths will be simpler.

> +	if (ret) {
> +		dev_err(dsi->dev, "Failed to enable DSI PHY PLL reference clock: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	sfr = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "microchip,sfr");
> +	if (IS_ERR_OR_NULL(sfr)) {

NULL? Can it be NULL?

> +		ret = PTR_ERR(sfr);
> +		dev_err(dsi->dev, "Failed to get handle on Special Function Register: %d\n",
> +			ret);

ret = dev_err_probe

> +		goto err_dsi_probe;
> +	}
> +	/* Select DSI in SFR's ISS Configuration Register */
> +	ret = regmap_write(sfr, SFR_ISS_CFG, ISS_CFG_DSI_MODE);
> +	if (ret) {
> +		dev_err(dsi->dev, "Failed to enable DSI in SFR ISS configuration register: %d\n",
> +			ret);
> +		goto err_dsi_probe;
> +	}



Best regards,
Krzysztof

