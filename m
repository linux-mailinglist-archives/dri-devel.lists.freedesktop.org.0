Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7953554A92F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 08:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341D510F584;
	Tue, 14 Jun 2022 06:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1AC10F584
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 06:04:35 +0000 (UTC)
X-UUID: 885a7fb72c354bbeb17930ecf760d00b-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:c92c63a4-9959-41e3-813d-97f8a9ea8653, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:c92c63a4-9959-41e3-813d-97f8a9ea8653, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:23995bc5-c67b-4a73-9b18-726dd8f2eb58,
 C
 OID:90843b6f92e8,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 885a7fb72c354bbeb17930ecf760d00b-20220614
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 895284215; Tue, 14 Jun 2022 14:04:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 14 Jun 2022 14:04:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 14:04:26 +0800
Message-ID: <0421bc6a054f0fd8ab8cbf0b5bc29e17c1752fa0.camel@mediatek.com>
Subject: Re: [PATCH v11 10/12] drm/mediatek: dpi: Add dpintf support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 14 Jun 2022 14:04:26 +0800
In-Reply-To: <20220613064841.10481-11-rex-bc.chen@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-11-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Mon, 2022-06-13 at 14:48 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is
> similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>  - Some features/functional components are not available for dpintf
>    which are now excluded from code execution once is_dpintf is set
>  - dpintf can and needs to choose between different clockdividers
> based
>    on the clockspeed. This is done by choosing a different clock
> parent.
>  - There are two additional clocks that need to be managed. These are
>    only set for dpintf and will be set to NULL if not supplied. The
>    clk_* calls handle these as normal clocks then.
>  - Some register contents differ slightly between the two components.
> To
>    work around this I added register bits/masks with a DPINTF_ prefix
>    and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jitao shi <jitao.shi@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 115
> ++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  13 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
>  5 files changed, 126 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 6b8cf648a5b5..08c8f21b4421 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -71,6 +71,7 @@ struct mtk_dpi {
>  	void __iomem *regs;
>  	struct device *dev;
>  	struct clk *engine_clk;
> +	struct clk *pll_gate_clk;

Separate clock part to an independent patch.

>  	struct clk *pixel_clk;
>  	struct clk *tvd_clk;
>  	int irq;
> @@ -126,6 +127,7 @@ struct mtk_dpi_conf {
>  	const u32 *output_fmts;
>  	u32 num_output_fmts;
>  	bool is_ck_de_pol;
> +	bool is_dpintf;
>  	bool swap_input_support;
>  	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
> (no shift) */
>  	u32 dimension_mask;
> @@ -439,6 +441,8 @@ static void mtk_dpi_power_off(struct mtk_dpi
> *dpi)
>  	mtk_dpi_disable(dpi);
>  	clk_disable_unprepare(dpi->pixel_clk);
>  	clk_disable_unprepare(dpi->engine_clk);
> +	clk_disable_unprepare(dpi->pll_gate_clk);
> +	clk_disable_unprepare(dpi->tvd_clk);
>  }
>  
>  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> @@ -448,10 +452,23 @@ static int mtk_dpi_power_on(struct mtk_dpi
> *dpi)
>  	if (++dpi->refcount != 1)
>  		return 0;
>  
> +	ret = clk_prepare_enable(dpi->tvd_clk);
> +	if (ret) {
> +		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n",
> ret);
> +		goto err_refcount;
> +	}
> +
>  	ret = clk_prepare_enable(dpi->engine_clk);
>  	if (ret) {
>  		dev_err(dpi->dev, "Failed to enable engine clock:
> %d\n", ret);
> -		goto err_refcount;
> +		goto err_engine;
> +	}
> +
> +	ret = clk_prepare_enable(dpi->pll_gate_clk);
> +	if (ret) {
> +		dev_err(dpi->dev,
> +			"Failed to enable pll_gate_clk clock: %d\n",
> ret);
> +		goto err_ck_cg;
>  	}
>  
>  	ret = clk_prepare_enable(dpi->pixel_clk);
> @@ -467,7 +484,11 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  	return 0;
>  
>  err_pixel:
> +	clk_disable_unprepare(dpi->pll_gate_clk);
> +err_ck_cg:
>  	clk_disable_unprepare(dpi->engine_clk);
> +err_engine:
> +	clk_disable_unprepare(dpi->tvd_clk);
>  err_refcount:
>  	dpi->refcount--;
>  	return ret;
> @@ -498,12 +519,16 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  	pll_rate = clk_get_rate(dpi->tvd_clk);
>  
>  	vm.pixelclock = pll_rate / factor;
> +
> +	if (dpi->conf->is_dpintf)
> +		vm.pixelclock /= 4;

Separate this to an independent patch and explain why do this.

> +
>  	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> -	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> +	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
>  		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> -	else
> +	} else {

This modification is not necessary.

>  		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> -
> +	}
>  
>  	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
>  
> @@ -516,9 +541,21 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  			    MTK_DPI_POLARITY_FALLING :
> MTK_DPI_POLARITY_RISING;
>  	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
>  			    MTK_DPI_POLARITY_FALLING :
> MTK_DPI_POLARITY_RISING;
> +

This modification is not necessary.

>  	hsync.sync_width = vm.hsync_len;
>  	hsync.back_porch = vm.hback_porch;
>  	hsync.front_porch = vm.hfront_porch;
> +
> +	/*
> +	 * For dp_intf, we need to divide everything by 4 because it's
> +	 * 4 pixels for one round while dpi is 1 pixel for one round.
> +	 */
> +	if (dpi->conf->is_dpintf) {

I this this should define dpi->conf->round_pixels rather than dpi-
>conf->is_dpintf.

> +		hsync.sync_width = vm.hsync_len / 4;
> +		hsync.back_porch = vm.hback_porch / 4;
> +		hsync.front_porch = vm.hfront_porch / 4;
> +	}
> +
>  	hsync.shift_half_line = false;
>  	vsync_lodd.sync_width = vm.vsync_len;
>  	vsync_lodd.back_porch = vm.vback_porch;
> @@ -560,13 +597,20 @@ static int mtk_dpi_set_display_mode(struct
> mtk_dpi *dpi,
>  	mtk_dpi_config_channel_limit(dpi);
>  	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
>  	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> -	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>  	mtk_dpi_config_color_format(dpi, dpi->color_format);
> -	mtk_dpi_config_2n_h_fre(dpi);
> -	mtk_dpi_dual_edge(dpi);
> -	mtk_dpi_config_disable_edge(dpi);
> +	if (dpi->conf->is_dpintf) {

Separate this to an independent patch and give a better config name
rather than dpi->conf->is_dpintf.

> +		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> +			     DPINTF_INPUT_2P_EN);
> +	} else {
> +		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> +		mtk_dpi_config_2n_h_fre(dpi);
> +		mtk_dpi_dual_edge(dpi);
> +		mtk_dpi_config_disable_edge(dpi);
> +	}
>  	mtk_dpi_sw_reset(dpi, false);
>  
> +	mtk_dpi_enable(dpi);

Why do this? If this is necessary, separate this to an independent
patch.

> +
>  	return 0;
>  }
>  
> @@ -643,7 +687,10 @@ static int mtk_dpi_bridge_atomic_check(struct
> drm_bridge *bridge,
>  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
>  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
>  	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> +		dpi->color_format =
> MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;

Separate this to an independent patch.

> +	else
> +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
>  
>  	return 0;
>  }
> @@ -688,7 +735,7 @@ mtk_dpi_bridge_mode_valid(struct drm_bridge
> *bridge,
>  {
>  	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>  
> -	if (mode->clock > dpi->conf->max_clock_khz)
> +	if (dpi->conf->max_clock_khz && mode->clock > dpi->conf-
> >max_clock_khz)

Why dp_intf has no max_clock_khz?

Regards,
CK

>  		return MODE_CLOCK_HIGH;
>  
>  	return MODE_OK;
> @@ -802,6 +849,16 @@ static unsigned int mt8183_calculate_factor(int
> clock)
>  		return 2;
>  }
>  
> +static unsigned int mt8195_dpintf_calculate_factor(int clock)
> +{
> +	if (clock < 70000)
> +		return 4;
> +	else if (clock < 200000)
> +		return 2;
> +	else
> +		return 1;
> +}
> +
>  static const u32 mt8173_output_fmts[] = {
>  	MEDIA_BUS_FMT_RGB888_1X24,
>  };
> @@ -811,6 +868,12 @@ static const u32 mt8183_output_fmts[] = {
>  	MEDIA_BUS_FMT_RGB888_2X12_BE,
>  };
>  
> +static const u32 mt8195_output_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_YUV8_1X24,
> +	MEDIA_BUS_FMT_YUYV8_1X16,
> +};
> +
>  static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
>  	.c_bottom = 0x0010,
>  	.c_top = 0x0FE0,
> @@ -818,6 +881,13 @@ static const struct mtk_dpi_yc_limit
> mtk_dpi_limit = {
>  	.y_top = 0x0FE0,
>  };
>  
> +static const struct mtk_dpi_yc_limit mtk_dpintf_limit = {
> +	.c_bottom = 0x0000,
> +	.c_top = 0xFFF,
> +	.y_bottom = 0x0000,
> +	.y_top = 0xFFF,
> +};
> +
>  static const struct mtk_dpi_conf mt8173_conf = {
>  	.cal_factor = mt8173_calculate_factor,
>  	.reg_h_fre_con = 0xe0,
> @@ -883,6 +953,19 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.limit = &mtk_dpi_limit,
>  };
>  
> +static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> +	.cal_factor = mt8195_dpintf_calculate_factor,
> +	.output_fmts = mt8195_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> +	.is_dpintf = true,
> +	.dimension_mask = DPINTF_HPW_MASK,
> +	.hvsize_mask = DPINTF_HSIZE_MASK,
> +	.channel_swap_shift = DPINTF_CH_SWAP,
> +	.yuv422_en_bit = DPINTF_YUV422_EN,
> +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> +	.limit = &mtk_dpintf_limit,
> +};
> +
>  static int mtk_dpi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -935,6 +1018,15 @@ static int mtk_dpi_probe(struct platform_device
> *pdev)
>  		return ret;
>  	}
>  
> +	dpi->pll_gate_clk = devm_clk_get_optional(dev, "pll_gate");
> +	if (IS_ERR(dpi->pll_gate_clk)) {
> +		ret = PTR_ERR(dpi->pll_gate_clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get dpi ck cg clock:
> %d\n", ret);
> +
> +		return ret;
> +	}
> +
>  	dpi->pixel_clk = devm_clk_get(dev, "pixel");
>  	if (IS_ERR(dpi->pixel_clk)) {
>  		ret = PTR_ERR(dpi->pixel_clk);
> @@ -1005,6 +1097,9 @@ static const struct of_device_id
> mtk_dpi_of_ids[] = {
>  	{ .compatible = "mediatek,mt8192-dpi",
>  	  .data = &mt8192_conf,
>  	},
> +	{ .compatible = "mediatek,mt8195-dp_intf",
> +	  .data = &mt8195_dpintf_conf,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> index 3a02fabe1662..f7f0272dbd6a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> @@ -40,9 +40,13 @@
>  #define FAKE_DE_LEVEN			BIT(21)
>  #define FAKE_DE_RODD			BIT(22)
>  #define FAKE_DE_REVEN			BIT(23)
> +#define DPINTF_YUV422_EN		BIT(24)
> +#define DPINTF_CSC_ENABLE		BIT(26)
> +#define DPINTF_INPUT_2P_EN		BIT(29)
>  
>  #define DPI_OUTPUT_SETTING	0x14
>  #define CH_SWAP				0
> +#define DPINTF_CH_SWAP			1
>  #define CH_SWAP_MASK			(0x7 << 0)
>  #define SWAP_RGB			0x00
>  #define SWAP_GBR			0x01
> @@ -80,8 +84,10 @@
>  #define DPI_SIZE		0x18
>  #define HSIZE				0
>  #define HSIZE_MASK			(0x1FFF << 0)
> +#define DPINTF_HSIZE_MASK		(0xFFFF << 0)
>  #define VSIZE				16
>  #define VSIZE_MASK			(0x1FFF << 16)
> +#define DPINTF_VSIZE_MASK		(0xFFFF << 16)
>  
>  #define DPI_DDR_SETTING		0x1C
>  #define DDR_EN				BIT(0)
> @@ -93,24 +99,30 @@
>  #define DPI_TGEN_HWIDTH		0x20
>  #define HPW				0
>  #define HPW_MASK			(0xFFF << 0)
> +#define DPINTF_HPW_MASK			(0xFFFF << 0)
>  
>  #define DPI_TGEN_HPORCH		0x24
>  #define HBP				0
>  #define HBP_MASK			(0xFFF << 0)
> +#define DPINTF_HBP_MASK			(0xFFFF << 0)
>  #define HFP				16
>  #define HFP_MASK			(0xFFF << 16)
> +#define DPINTF_HFP_MASK			(0xFFFF << 16)
>  
>  #define DPI_TGEN_VWIDTH		0x28
>  #define DPI_TGEN_VPORCH		0x2C
>  
>  #define VSYNC_WIDTH_SHIFT		0
>  #define VSYNC_WIDTH_MASK		(0xFFF << 0)
> +#define DPINTF_VSYNC_WIDTH_MASK		(0xFFFF << 0)
>  #define VSYNC_HALF_LINE_SHIFT		16
>  #define VSYNC_HALF_LINE_MASK		BIT(16)
>  #define VSYNC_BACK_PORCH_SHIFT		0
>  #define VSYNC_BACK_PORCH_MASK		(0xFFF << 0)
> +#define DPINTF_VSYNC_BACK_PORCH_MASK	(0xFFFF << 0)
>  #define VSYNC_FRONT_PORCH_SHIFT		16
>  #define VSYNC_FRONT_PORCH_MASK		(0xFFF << 16)
> +#define DPINTF_VSYNC_FRONT_PORCH_MASK	(0xFFFF << 16)
>  
>  #define DPI_BG_HCNTL		0x30
>  #define BG_RIGHT			(0x1FFF << 0)
> @@ -217,4 +229,5 @@
>  
>  #define EDGE_SEL_EN			BIT(5)
>  #define H_FRE_2N			BIT(25)
> +
>  #endif /* __MTK_DPI_REGS_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 2aab1e1eda36..5bef085714a1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -427,6 +427,7 @@ static const char * const
> mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>  	[MTK_DISP_RDMA] = "rdma",
>  	[MTK_DISP_UFOE] = "ufoe",
>  	[MTK_DISP_WDMA] = "wdma",
> +	[MTK_DP_INTF] = "dp-intf",
>  	[MTK_DPI] = "dpi",
>  	[MTK_DSI] = "dsi",
>  };
> @@ -450,6 +451,8 @@ static const struct mtk_ddp_comp_match
> mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
>  	[DDP_COMPONENT_DRM_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	
> 0, &ddp_ovl_adaptor },
>  	[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,		
> 0, &ddp_dsc },
>  	[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,		
> 1, &ddp_dsc },
> +	[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,		0,
> &ddp_dpi },
> +	[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,		1,
> &ddp_dpi },
>  	[DDP_COMPONENT_DSI0]		= { MTK_DSI,			
> 0, &ddp_dsi },
>  	[DDP_COMPONENT_DSI1]		= { MTK_DSI,			
> 1, &ddp_dsi },
>  	[DDP_COMPONENT_DSI2]		= { MTK_DSI,			
> 2, &ddp_dsi },
> @@ -575,6 +578,7 @@ int mtk_ddp_comp_init(struct device_node *node,
> struct mtk_ddp_comp *comp,
>  	    type == MTK_DISP_PWM ||
>  	    type == MTK_DISP_RDMA ||
>  	    type == MTK_DPI ||
> +	    type == MTK_DP_INTF ||
>  	    type == MTK_DSI)
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index af9a6671f9c4..3084cc4e2830 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -38,6 +38,7 @@ enum mtk_ddp_comp_type {
>  	MTK_DISP_UFOE,
>  	MTK_DISP_WDMA,
>  	MTK_DPI,
> +	MTK_DP_INTF,
>  	MTK_DSI,
>  	MTK_DDP_COMP_TYPE_MAX,
>  };
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 78e79c8449c8..3b885ad61ac3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -788,6 +788,8 @@ static const struct of_device_id
> mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8192-dpi",
>  	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8195-dp_intf",
> +	  .data = (void *)MTK_DP_INTF },
>  	{ .compatible = "mediatek,mt2701-dsi",
>  	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8173-dsi",
> @@ -931,6 +933,7 @@ static int mtk_drm_probe(struct platform_device
> *pdev)
>  		    comp_type == MTK_DISP_OVL_2L ||
>  		    comp_type == MTK_DISP_OVL_ADAPTOR ||
>  		    comp_type == MTK_DISP_RDMA ||
> +		    comp_type == MTK_DP_INTF ||
>  		    comp_type == MTK_DPI ||
>  		    comp_type == MTK_DSI) {
>  			dev_info(dev, "Adding component match for
> %pOF\n",

