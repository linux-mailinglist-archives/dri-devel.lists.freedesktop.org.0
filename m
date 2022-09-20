Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89985BE585
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A82D10E53A;
	Tue, 20 Sep 2022 12:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA4710E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 12:17:29 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DEE5B6601F6E;
 Tue, 20 Sep 2022 13:17:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663676248;
 bh=QQ2HxkvMf4aXu9a+2GDgTEXKznUPIbGdnE0YrrTQM44=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BI3zn3DtTbVkfWHLAXehJ/VSznfXvZRtUL1Evu68+1uJA69oHASEsyMlBT9clCLPq
 ZyYY/UhYUjnf9/+qaNMOtHh0y3ncv8HEPeLfWjnufRfnwLcF1ewUVl+8lcO10Nta0A
 7rsFhlFSmCPno6ewukFVXaL/kkdhE+RBcdSDrUVPEmZOyQZGsoQZ4hNBDwcEploT9D
 7nDIbrcfQVzTEznbkXNWcW+9DP+HOIQMHjn8yI9UbOwYVAJFXfCmF6B9He6ojQV8XS
 dqBzIo2xEPpBTSKdvyr1zY8MbRGYzv0E5ZO68EFanZdulrVNJ4gy00vQvyzGIrq5xC
 ZPlvUrjHJoPyw==
Message-ID: <00293eda-ca41-b472-1ae4-def4a6dcd4fe@collabora.com>
Date: Tue, 20 Sep 2022 14:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 14/17] phy: mediatek: add support for
 phy-mtk-hdmi-mt8195
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-14-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-14-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> Add basic support for the mediatek hdmi phy on MT8195 SoC
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> index bb7593ea4c86..0157acdce56c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> @@ -1344,6 +1344,8 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge,
>   	mtk_hdmi_disable_hdcp_encrypt(hdmi);
>   	usleep_range(50000, 50050);
>   
> +	phy_power_off(hdmi->phy);

This one belongs to patch [11/17]

> +
>   	hdmi->enabled = false;
>   }
>   
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index fb1f8edaffa7..c9a50395533e 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
>   phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
>   phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
>   phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
> +phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8195.o
>   obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
>   
>   phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> new file mode 100644
> index 000000000000..149015b64c02
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -0,0 +1,673 @@

..snip..

> +
> +static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, unsigned char prediv,
> +			       unsigned char fbkdiv_high,
> +			       unsigned long fbkdiv_low,
> +			       unsigned char fbkdiv_hs3, unsigned char posdiv1,
> +			       unsigned char posdiv2, unsigned char txprediv,
> +			       unsigned char txposdiv,
> +			       unsigned char digital_div)
> +{
> +	unsigned char txposdiv_value = 0;
> +	unsigned char div3_ctrl_value = 0;
> +	unsigned char posdiv_vallue = 0;
> +	unsigned char div_ctrl_value = 0;
> +	unsigned char reserve_3_2_value = 0;
> +	unsigned char prediv_value = 0;
> +	unsigned char reserve13_value = 0;
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	mtk_hdmi_pll_select_source(hw);
> +
> +	mtk_hdmi_pll_performance_setting(hw);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x2 << RG_HDMITX21_BIAS_PE_BG_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_BIAS_PE_BG_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x0 << RG_HDMITX21_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_9,
> +			  0x2 << RG_HDMITX21_SLDO_VREF_SEL_SHIFT,
> +			  RG_HDMITX21_SLDO_VREF_SEL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
> +			  0x0 << RG_HDMITX21_BIAS_PE_VREF_SELB_SHIFT,
> +			  RG_HDMITX21_BIAS_PE_VREF_SELB);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
> +			  0x1 << RG_HDMITX21_SLDOLPF_EN_SHIFT,
> +			  RG_HDMITX21_SLDOLPF_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x11 << RG_HDMITX21_INTR_CAL_SHIFT,
> +			  RG_HDMITX21_INTR_CAL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
> +			  0x1 << RG_HDMITXPLL_PWD_SHIFT, RG_HDMITXPLL_PWD);
> +
> +	/* TXPOSDIV */

Either ilog2() or use a switch...

> +	if (txposdiv == 1)
> +		txposdiv_value = 0x0;
> +	else if (txposdiv == 2)
> +		txposdiv_value = 0x1;
> +	else if (txposdiv == 4)
> +		txposdiv_value = 0x2;
> +	else if (txposdiv == 8)
> +		txposdiv_value = 0x3;
> +	else
> +		return -EINVAL;
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  txposdiv_value << RG_HDMITX21_TX_POSDIV_SHIFT,
> +			  RG_HDMITX21_TX_POSDIV);
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x1 << RG_HDMITX21_TX_POSDIV_EN_SHIFT,
> +			  RG_HDMITX21_TX_POSDIV_EN);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
> +			  0x0 << RG_HDMITX21_FRL_EN_SHIFT, RG_HDMITX21_FRL_EN);
> +
> +	/* TXPREDIV */

Use a switch.

> +	if (txprediv == 2) {
> +		div3_ctrl_value = 0x0;
> +		posdiv_vallue = 0x0;
> +	} else if (txprediv == 4) {
> +		div3_ctrl_value = 0x0;
> +		posdiv_vallue = 0x1;
> +	} else if (txprediv == 6) {
> +		div3_ctrl_value = 0x1;
> +		posdiv_vallue = 0x0;
> +	} else if (txprediv == 12) {
> +		div3_ctrl_value = 0x1;
> +		posdiv_vallue = 0x1;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  div3_ctrl_value
> +				  << RG_HDMITXPLL_POSDIV_DIV3_CTRL_SHIFT,
> +			  RG_HDMITXPLL_POSDIV_DIV3_CTRL);
> +	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
> +			  posdiv_vallue << RG_HDMITXPLL_POSDIV_SHIFT,
> +			  RG_HDMITXPLL_POSDIV);
> +
> +	/* POSDIV1 */

same here.

> +	if (posdiv1 == 5)
> +		div_ctrl_value = 0x0;
> +	else if (posdiv1 == 10)
> +		div_ctrl_value = 0x1;
> +	else if (posdiv1 == (125 / 10))

/* This is 12.5 in reality, but we get only the integer part */
case 12:

...or you'll have to use a "deci-divider", which would complicate human readability
by ... quite a bit, in some cases.

> +		div_ctrl_value = 0x2;
> +	else if (posdiv1 == 15)
> +		div_ctrl_value = 0x3;
> +	else
> +		return -EINVAL;
> +

..snip..

> +
> +#define PCW_DECIMAL_WIDTH 24
> +
> +static int mtk_hdmi_pll_calculate_params(struct clk_hw *hw, unsigned long rate,
> +					 unsigned long parent_rate)
> +{
> +	int ret;
> +	unsigned long long tmds_clk = 0;
> +	unsigned long long pixel_clk = 0;
> +	//pll input source frequency

Fix comments style.

> +	unsigned long long da_hdmitx21_ref_ck = 0;
> +	unsigned long long ns_hdmipll_ck = 0; //ICO output clk
> +	//source clk for Display digital
> +	unsigned long long ad_hdmipll_pixel_ck = 0;
> +	unsigned char digital_div = 0;
> +	unsigned long long pcw = 0; //FBDIV

u64 pcw;

> +	unsigned char txprediv = 0;
> +	unsigned char txposdiv = 0;
> +	unsigned char fbkdiv_high = 0;
> +	unsigned long fbkdiv_low = 0;
> +	unsigned char posdiv1 = 0;
> +	unsigned char posdiv2 = 0;
> +	unsigned char prediv = 1; //prediv is always 1
> +	unsigned char fbkdiv_hs3 = 1; //fbkdiv_hs3 is always 1
> +	int i = 0;
> +	unsigned char txpredivs[4] = { 2, 4, 6, 12 };
> +
> +	pixel_clk = rate;
> +	tmds_clk = pixel_clk;
> +
> +	if (tmds_clk < 25000000 || tmds_clk > 594000000)
> +		return -EINVAL;
> +
> +	da_hdmitx21_ref_ck = 26000000UL; //in HZ
> +
> +	/*  TXPOSDIV stage treatment:
> +	 *	0M  <  TMDS clk  < 54M		  /8
> +	 *	54M <= TMDS clk  < 148.35M    /4
> +	 *	148.35M <=TMDS clk < 296.7M   /2
> +	 *	296.7 <=TMDS clk <= 594M	  /1
> +	 */
> +	if (tmds_clk < 54000000UL)
> +		txposdiv = 8;
> +	else if (tmds_clk >= 54000000UL && tmds_clk < 148350000UL)

	else if (tmds_clk < 148350000UL)

> +		txposdiv = 4;
> +	else if (tmds_clk >= 148350000UL && tmds_clk < 296700000UL)

	else if (tmds_clk < 296700000UL)

> +		txposdiv = 2;
> +	else if (tmds_clk >= 296700000UL && tmds_clk <= 594000000UL)

	else if (tmds_clk <= 594000000UL)

> +		txposdiv = 1;
> +	else
> +		return -EINVAL;
> +

..snip..

> +
> +	txprediv = txpredivs[i];
> +
> +	/* PCW calculation: FBKDIV
> +	 * formula: pcw=(frequency_out*2^pcw_bit) / frequency_in / FBKDIV_HS3;
> +	 * RG_HDMITXPLL_FBKDIV[32:0]:
> +	 * [32,24] 9bit integer, [23,0]:24bit fraction
> +	 */
> +	pcw = ns_hdmipll_ck;

	pcw = ns_hdmipll_ck << PCW_DECIMAL_WIDTH;
	pcw /= da_hdmitx21_ref_ck;
	pcw /= fbkdiv_hs3;

> +	pcw = pcw << PCW_DECIMAL_WIDTH;
> +	pcw = pcw / da_hdmitx21_ref_ck;
> +	pcw = pcw / fbkdiv_hs3;
> +
> +	if ((pcw / BIT(32)) > 1) {

	pcw_nbits = fls64(pcw);

	if (pcw_nbits > 33)
		return -EINVAL;

	if (pcw_nbits == 33) {
		fbkdiv_high = 1;
		fkbdiv_low = pcw % BIT(32);
	} else {
		fbkdiv_high = 0;
		fbkdiv_low = pcw;
	}

> +		return -EINVAL;
> +	} else if ((pcw / BIT(32)) == 1) {
> +		fbkdiv_high = 1;
> +		fbkdiv_low = pcw % BIT(32);
> +	} else {
> +		fbkdiv_high = 0;
> +		fbkdiv_low = pcw;
> +	}
> +
> +	/* posdiv1:
> +	 * posdiv1 stage treatment according to color_depth:
> +	 * 24bit -> posdiv1 /10, 30bit -> posdiv1 /12.5,
> +	 * 36bit -> posdiv1 /15, 48bit -> posdiv1 /10
> +	 */
> +	posdiv1 = 10; // div 10
> +	posdiv2 = 1;
> +	ad_hdmipll_pixel_ck = (ns_hdmipll_ck / 10) / 1;

I understand this as
	ad_hdmipll_pixel_ck = (ns_hdmipll_ck / posdiv1) / posdiv2;

..if that's true, please fix.

> +
> +	/* Digital clk divider, max /32 */
> +	digital_div = ad_hdmipll_pixel_ck / pixel_clk;
> +	if (!(digital_div <= 32 && digital_div >= 1))
> +		return -EINVAL;
> +
> +	ret = mtk_hdmi_pll_set_hw(hw, prediv, fbkdiv_high, fbkdiv_low,
> +				  fbkdiv_hs3, posdiv1, posdiv2, txprediv,
> +				  txposdiv, digital_div);
> +	if (ret)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> +{
> +	unsigned char data_channel_bias, clk_channel_bias;
> +	unsigned char impedance, impedance_en;
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +	unsigned long tmds_clk;
> +	unsigned long pixel_clk = hdmi_phy->pll_rate;
> +
> +	tmds_clk = pixel_clk;

	tmds_rate = pixel_rate;

...better describes that we're talking about clock rates, not clock per-se.

> +
> +	/* bias & impedance setting:
> +	 * 3G < data rate <= 6G: enable impedance 100ohm,
> +	 *      data channel bias 24mA, clock channel bias 20mA
> +	 * pixel clk >= HD,  74.175MHZ <= pixel clk <= 300MHZ:
> +	 *      enalbe impedance 100ohm
> +	 *      data channel 20mA, clock channel 16mA
> +	 * 27M =< pixel clk < 74.175: disable impedance
> +	 *      data channel & clock channel bias 10mA
> +	 */
> +
> +	/* 3G < data rate <= 6G, 300M < tmds rate <= 594M */
> +	if (tmds_clk > 300000000UL && tmds_clk <= 594000000UL) {
> +		data_channel_bias = 0x3c; //24mA

There must be an equation to calculate the bias value from milliamps to HW values,
in which case we would see here...

		data_channel_bias = MTK_HDMI_BIAS_MA(24);
		clk_channel_bias = MTK_HDMI_BIAS_MA(20);
		impedance = MTK_HDMI_IMPEDANCE_OHMS(100);
		impedance_en = SOMETHING();

> +		clk_channel_bias = 0x34; //20mA
> +		impedance_en = 0xf;
> +		impedance = 0x36; //100ohm
> +	} else if (pixel_clk >= 74175000UL && pixel_clk <= 300000000UL) {
> +		data_channel_bias = 0x34; //20mA
> +		clk_channel_bias = 0x2c; //16mA
> +		impedance_en = 0xf;
> +		impedance = 0x36; //100ohm
> +	} else if (pixel_clk >= 27000000UL && pixel_clk < 74175000UL) {

By the way, if you invert all the checks here (check from highest pixclk to lowest)
you can simplify it.

> +		data_channel_bias = 0x14; //10mA
> +		clk_channel_bias = 0x14; //10mA
> +		impedance_en = 0x0;
> +		impedance = 0x0;
> +	} else {
> +		return -EINVAL;
> +	}
> +

..snip..

> +
> +static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +	struct phy_configure_opts_dp *dp_opts = &opts->dp;
> +	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +	int ret = 0;
> +	bool enable = 0;
> +
> +	ret = clk_set_rate(hdmi_phy->pll, dp_opts->link_rate);
> +

Please remove this blank line...

> +	if (ret)
> +		goto out;
> +
> +	mtk_mt8195_phy_tmds_high_bit_clk_ratio(hdmi_phy, enable);
> +
> +out:
> +	return ret;
> +}
> +
> +struct mtk_hdmi_phy_conf mtk_hdmi_phy_8195_conf = {
> +	.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
> +	.hdmi_phy_clk_ops = &mtk_hdmi_pll_ops,
> +	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
> +	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
> +	.hdmi_phy_configure = mtk_hdmi_phy_configure,
> +};
> +
> +MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
> +MODULE_DESCRIPTION("MediaTek MT8195 HDMI PHY Driver");
> +MODULE_LICENSE("GPL v2");

Regards,
Angelo

