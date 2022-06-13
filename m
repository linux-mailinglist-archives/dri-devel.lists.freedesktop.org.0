Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97432547F5F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 08:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAB010E6AE;
	Mon, 13 Jun 2022 06:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F4E10E69B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:10:32 +0000 (UTC)
X-UUID: 7c3cd003e7eb47efafec2fe982bf4c12-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:79ff2598-cf7c-44df-8ee8-df5d7d2939d8, OB:0,
 LO
 B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.5, REQID:79ff2598-cf7c-44df-8ee8-df5d7d2939d8, OB:0,
 LOB:
 10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:2a19b09, CLOUDID:86cb58c6-12ba-4305-bfdf-9aefbdc32516,
 C
 OID:2dfccd1893c5,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:0,BEC:nil
X-UUID: 7c3cd003e7eb47efafec2fe982bf4c12-20220613
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 5991685; Mon, 13 Jun 2022 14:10:27 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 13 Jun 2022 14:10:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 14:10:26 +0800
Message-ID: <5e60370bfe73eac9e926c62150bc70223fec088f.camel@mediatek.com>
Subject: Re: [PATCH v10 14/21] drm/mediatek: dpi: Add dpintf support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>
Date: Mon, 13 Jun 2022 14:10:23 +0800
In-Reply-To: <71d4856e-f5c8-0ea5-9285-43616c6cdb39@collabora.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-15-granquet@baylibre.com>
 <71d4856e-f5c8-0ea5-9285-43616c6cdb39@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-05-25 at 14:58 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> > dpintf is the displayport interface hardware unit. This unit is
> > similar
> > to dpi and can reuse most of the code.
> > 
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >   - Some features/functional components are not available for
> > dpintf
> >     which are now excluded from code execution once is_dpintf is
> > set
> >   - dpintf can and needs to choose between different clockdividers
> > based
> >     on the clockspeed. This is done by choosing a different clock
> > parent.
> >   - There are two additional clocks that need to be managed. These
> > are
> >     only set for dpintf and will be set to NULL if not supplied.
> > The
> >     clk_* calls handle these as normal clocks then.
> >   - Some register contents differ slightly between the two
> > components. To
> >     work around this I added register bits/masks with a DPINTF_
> > prefix
> >     and use them where different.
> > 
> > Based on a separate driver for dpintf created by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> 
> Only after finishing the review, I've noticed that I just wrote the
> same things
> that I wrote in my review for version 8... and if I recall correctly,
> this is not
> the first time that something like that happens.
> 
> Please pay attention to what reviewers say, as to not waste anyone's
> time.
> 

Hello Angelo,

I will help to fix these issue in next version.

> 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c          | 126
> > +++++++++++++++++---
> >   drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  35 ++++++
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   8 ++
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
> >   include/linux/soc/mediatek/mtk-mmsys.h      |   4 +-
> >   6 files changed, 159 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index eb969c5c5c2e..763bfb700135 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -71,6 +71,7 @@ struct mtk_dpi {
> >   	void __iomem *regs;
> >   	struct device *dev;
> >   	struct clk *engine_clk;
> > +	struct clk *dpi_ck_cg;
> >   	struct clk *pixel_clk;
> >   	struct clk *tvd_clk;
> >   	int irq;
> > @@ -126,6 +127,7 @@ struct mtk_dpi_conf {
> >   	const u32 *output_fmts;
> >   	u32 num_output_fmts;
> >   	bool is_ck_de_pol;
> > +	bool is_dpintf;
> >   	bool swap_input_support;
> >   	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
> > (no shift) */
> >   	u32 dimension_mask;
> > @@ -438,6 +440,8 @@ static void mtk_dpi_power_off(struct mtk_dpi
> > *dpi)
> >   	mtk_dpi_disable(dpi);
> >   	clk_disable_unprepare(dpi->pixel_clk);
> >   	clk_disable_unprepare(dpi->engine_clk);
> > +	clk_disable_unprepare(dpi->dpi_ck_cg);
> > +	clk_disable_unprepare(dpi->tvd_clk);
> >   }
> >   
> >   static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > @@ -447,12 +451,24 @@ static int mtk_dpi_power_on(struct mtk_dpi
> > *dpi)
> >   	if (++dpi->refcount != 1)
> >   		return 0;
> >   
> > +	ret = clk_prepare_enable(dpi->tvd_clk);
> > +	if (ret) {
> > +		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n",
> > ret);
> > +		goto err_pixel;
> > +	}
> > +
> >   	ret = clk_prepare_enable(dpi->engine_clk);
> >   	if (ret) {
> >   		dev_err(dpi->dev, "Failed to enable engine clock:
> > %d\n", ret);
> >   		goto err_refcount;
> >   	}
> >   
> > +	ret = clk_prepare_enable(dpi->dpi_ck_cg);
> > +	if (ret) {
> > +		dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock:
> > %d\n", ret);
> > +		goto err_ck_cg;
> > +	}
> > +
> >   	ret = clk_prepare_enable(dpi->pixel_clk);
> >   	if (ret) {
> >   		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n",
> > ret);
> > @@ -466,6 +482,8 @@ static int mtk_dpi_power_on(struct mtk_dpi
> > *dpi)
> >   	return 0;
> >   
> >   err_pixel:
> > +	clk_disable_unprepare(dpi->dpi_ck_cg);
> > +err_ck_cg:
> >   	clk_disable_unprepare(dpi->engine_clk);
> >   err_refcount:
> >   	dpi->refcount--;
> > @@ -498,11 +516,11 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >   
> >   	vm.pixelclock = pll_rate / factor;
> >   	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > -	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> > +		 (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
> 
> The indentation was perfect before that change...
> 
> >   		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> > -	else
> > +	} else {
> >   		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> > -
> > +	}
> >   
> >   	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
> >   
> > @@ -515,9 +533,15 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >   			    MTK_DPI_POLARITY_FALLING :
> > MTK_DPI_POLARITY_RISING;
> >   	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
> >   			    MTK_DPI_POLARITY_FALLING :
> > MTK_DPI_POLARITY_RISING;
> > -	hsync.sync_width = vm.hsync_len;
> > -	hsync.back_porch = vm.hback_porch;
> > -	hsync.front_porch = vm.hfront_porch;
> > +	if (dpi->conf->is_dpintf) {
> > +		hsync.sync_width = vm.hsync_len / 4;
> > +		hsync.back_porch = vm.hback_porch / 4;
> > +		hsync.front_porch = vm.hfront_porch / 4;
> > +	} else {
> > +		hsync.sync_width = vm.hsync_len;
> > +		hsync.back_porch = vm.hback_porch;
> > +		hsync.front_porch = vm.hfront_porch;
> > +	}
> 
> This looks way better:
> 
> 	hsync.sync_width = vm.hsync_len;
> 	hsync.back_porch = vm.hback_porch;
> 	hsync.front_porch = vm.hfront_porch;
> 
> 	/* For DPINTF, we need to divide everything by 4 .. lanes? */
> 	if (dpi->conf->is_dpintf) {
> 		hsync.sync_width /= 4;
> 		hsync.back_porch /= 4;
> 		hsync.front_porch /= 4;
> 	}
> 

ok.

> >   	hsync.shift_half_line = false;
> >   	vsync_lodd.sync_width = vm.vsync_len;
> >   	vsync_lodd.back_porch = vm.vback_porch;
> > @@ -559,13 +583,20 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >   	mtk_dpi_config_channel_limit(dpi);
> >   	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
> >   	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> > -	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> >   	mtk_dpi_config_color_format(dpi, dpi->color_format);
> > -	mtk_dpi_config_2n_h_fre(dpi);
> > -	mtk_dpi_dual_edge(dpi);
> > -	mtk_dpi_config_disable_edge(dpi);
> > +	if (dpi->conf->is_dpintf) {
> > +		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> > +			     DPINTF_INPUT_2P_EN);
> > +	} else {
> > +		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> > +		mtk_dpi_config_2n_h_fre(dpi);
> > +		mtk_dpi_dual_edge(dpi);
> > +		mtk_dpi_config_disable_edge(dpi);
> > +	}
> >   	mtk_dpi_sw_reset(dpi, false);
> >   
> > +	mtk_dpi_enable(dpi);
> > +
> >   	return 0;
> >   }
> >   
> > @@ -608,7 +639,6 @@ static u32
> > *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge
> > *bridge,
> >   	u32 *input_fmts;
> >   
> >   	*num_input_fmts = 0;
> > -
> 
> Removing this line is not part of adding dpintf support, so don't do
> that.
> 

ok.

> >   	input_fmts = kcalloc(1, sizeof(*input_fmts),
> >   			     GFP_KERNEL);
> >   	if (!input_fmts)
> > @@ -634,15 +664,18 @@ static int mtk_dpi_bridge_atomic_check(struct
> > drm_bridge *bridge,
> >   		if (dpi->conf->num_output_fmts)
> >   			out_bus_format = dpi->conf->output_fmts[0];
> >   
> > -	dev_dbg(dpi->dev, "input format 0x%04x, output format
> > 0x%04x\n",
> > -		bridge_state->input_bus_cfg.format,
> > -		bridge_state->output_bus_cfg.format);
> > +	dev_info(dpi->dev, "input format 0x%04x, output format
> > 0x%04x\n",
> > +		 bridge_state->input_bus_cfg.format,
> > +		 bridge_state->output_bus_cfg.format);
> 
> This message is not giving any constantly changing information, nor
> any one that
> is interesting for the user: keep this as dev_dbg().
> 

ok.

> >   
> >   	dpi->output_fmt = out_bus_format;
> >   	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> >   	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> >   	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> > +		dpi->color_format =
> > MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
> > +	else
> > +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> >   
> >   	return 0;
> >   }
> > @@ -687,7 +720,7 @@ mtk_dpi_bridge_mode_valid(struct drm_bridge
> > *bridge,
> >   {
> >   	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
> >   
> > -	if (mode->clock > dpi->conf->max_clock_khz)
> > +	if (dpi->conf->max_clock_khz && mode->clock > dpi->conf-
> > >max_clock_khz)
> >   		return MODE_CLOCK_HIGH;
> >   
> >   	return MODE_OK;
> > @@ -801,6 +834,16 @@ static unsigned int
> > mt8183_calculate_factor(int clock)
> >   		return 2;
> >   }
> >   
> > +static unsigned int mt8195_dpintf_calculate_factor(int clock)
> > +{
> > +	if (clock < 70000)
> 
> is 70000 intentional? Or did you mean 700000?
> 

70000 is correct, the unit for this is KHz.


> > +		return 4;
> > +	else if (clock < 200000)
> > +		return 2;
> > +	else
> > +		return 1;
> > +}
> > +
> >   static const u32 mt8173_output_fmts[] = {
> >   	MEDIA_BUS_FMT_RGB888_1X24,
> >   };
> > @@ -810,6 +853,12 @@ static const u32 mt8183_output_fmts[] = {
> >   	MEDIA_BUS_FMT_RGB888_2X12_BE,
> >   };
> >   
> > +static const u32 mt8195_output_fmts[] = {
> > +	MEDIA_BUS_FMT_RGB888_1X24,
> > +	MEDIA_BUS_FMT_YUV8_1X24,
> > +	MEDIA_BUS_FMT_YUYV8_1X16,
> > +};
> > +
> >   static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
> >   	.c_bottom = 0x0010,
> >   	.c_top = 0x0FE0,
> > @@ -817,6 +866,13 @@ static const struct mtk_dpi_yc_limit
> > mtk_dpi_limit = {
> >   	.y_top = 0x0FE0,
> >   };
> >   
> > +static const struct mtk_dpi_yc_limit mtk_dpintf_limit = {
> > +	.c_bottom = 0x0000,
> > +	.c_top = 0xFFF,
> > +	.y_bottom = 0x0000,
> > +	.y_top = 0xFFF,
> > +};
> > +
> >   static const struct mtk_dpi_conf mt8173_conf = {
> >   	.cal_factor = mt8173_calculate_factor,
> >   	.reg_h_fre_con = 0xe0,
> > @@ -882,6 +938,19 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >   	.limit = &mtk_dpi_limit,
> >   };
> >   
> > +static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> > +	.cal_factor = mt8195_dpintf_calculate_factor,
> > +	.output_fmts = mt8195_output_fmts,
> > +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> > +	.is_dpintf = true,
> > +	.dimension_mask = DPINTF_HPW_MASK,
> > +	.hvsize_mask = DPINTF_HSIZE_MASK,
> > +	.channel_swap_shift = DPINTF_CH_SWAP,
> > +	.yuv422_en_bit = DPINTF_YUV422_EN,
> > +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> > +	.limit = &mtk_dpintf_limit,
> > +};
> > +
> >   static int mtk_dpi_probe(struct platform_device *pdev)
> >   {
> >   	struct device *dev = &pdev->dev;
> > @@ -929,7 +998,27 @@ static int mtk_dpi_probe(struct
> > platform_device *pdev)
> >   	if (IS_ERR(dpi->engine_clk)) {
> >   		ret = PTR_ERR(dpi->engine_clk);
> >   		if (ret != -EPROBE_DEFER)
> > -			dev_err(dev, "Failed to get engine clock:
> > %d\n", ret);
> > +			dev_err(dev, "Failed to get engine clock:
> > %d\n",
> > +				ret);
> 
> Why are you breaking this line?
> 

I will fix this.

> > +
> > +		return ret;
> > +	}
> > +
> > +	dpi->dpi_ck_cg = devm_clk_get_optional(dev, "ck_cg");
> > +	if (IS_ERR(dpi->dpi_ck_cg)) {
> > +		ret = PTR_ERR(dpi->dpi_ck_cg);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(dev, "Failed to get dpi ck cg clock:
> > %d\n",
> > +				ret);
> > +
> > +		return ret;
> > +	}
> > +
> 
> You're getting this clock twice, what happened here?
> 
> P.S.: As I explained on the dt-bindings patch, you likely don't even
> need this
>        clock at all.
> 

I will remove this.
For this clock gate, we stiil need to enable it.

I reply in binding patch.

I rename it as pll_gate.

> > +	dpi->dpi_ck_cg = devm_clk_get_optional(dev, "ck_cg");
> > +	if (IS_ERR(dpi->dpi_ck_cg)) {
> > +		ret = PTR_ERR(dpi->dpi_ck_cg);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(dev, "Failed to get dpi ck cg clock:
> > %d\n", ret);
> >   
> >   		return ret;
> >   	}
> > @@ -1004,6 +1093,9 @@ static const struct of_device_id
> > mtk_dpi_of_ids[] = {
> >   	{ .compatible = "mediatek,mt8192-dpi",
> >   	  .data = &mt8192_conf,
> >   	},
> > +	{ .compatible = "mediatek,mt8195-dpintf",
> > +	  .data = &mt8195_dpintf_conf,
> > +	},
> >   	{ },
> >   };
> >   MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > index 3a02fabe1662..dd47dd3f2e4f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > @@ -40,10 +40,15 @@
> >   #define FAKE_DE_LEVEN			BIT(21)
> >   #define FAKE_DE_RODD			BIT(22)
> >   #define FAKE_DE_REVEN			BIT(23)
> > +#define DPINTF_YUV422_EN		BIT(24)
> > +#define DPINTF_CSC_ENABLE		BIT(26)
> > +#define DPINTF_INPUT_2P_EN		BIT(29)
> >   
> >   #define DPI_OUTPUT_SETTING	0x14
> >   #define CH_SWAP				0
> > +#define DPINTF_CH_SWAP			BIT(1)
> >   #define CH_SWAP_MASK			(0x7 << 0)
> > +#define DPINTF_CH_SWAP_MASK		(0x7 << 1)
> >   #define SWAP_RGB			0x00
> >   #define SWAP_GBR			0x01
> >   #define SWAP_BRG			0x02
> > @@ -80,8 +85,10 @@
> >   #define DPI_SIZE		0x18
> >   #define HSIZE				0
> >   #define HSIZE_MASK			(0x1FFF << 0)
> > +#define DPINTF_HSIZE_MASK		(0xFFFF << 0)
> >   #define VSIZE				16
> >   #define VSIZE_MASK			(0x1FFF << 16)
> > +#define DPINTF_VSIZE_MASK		(0xFFFF << 16)
> >   
> >   #define DPI_DDR_SETTING		0x1C
> >   #define DDR_EN				BIT(0)
> > @@ -93,24 +100,30 @@
> >   #define DPI_TGEN_HWIDTH		0x20
> >   #define HPW				0
> >   #define HPW_MASK			(0xFFF << 0)
> > +#define DPINTF_HPW_MASK			(0xFFFF << 0)
> >   
> >   #define DPI_TGEN_HPORCH		0x24
> >   #define HBP				0
> >   #define HBP_MASK			(0xFFF << 0)
> > +#define DPINTF_HBP_MASK			(0xFFFF << 0)
> >   #define HFP				16
> >   #define HFP_MASK			(0xFFF << 16)
> > +#define DPINTF_HFP_MASK			(0xFFFF << 16)
> >   
> >   #define DPI_TGEN_VWIDTH		0x28
> >   #define DPI_TGEN_VPORCH		0x2C
> >   
> >   #define VSYNC_WIDTH_SHIFT		0
> >   #define VSYNC_WIDTH_MASK		(0xFFF << 0)
> > +#define DPINTF_VSYNC_WIDTH_MASK		(0xFFFF << 0)
> >   #define VSYNC_HALF_LINE_SHIFT		16
> >   #define VSYNC_HALF_LINE_MASK		BIT(16)
> >   #define VSYNC_BACK_PORCH_SHIFT		0
> >   #define VSYNC_BACK_PORCH_MASK		(0xFFF << 0)
> > +#define DPINTF_VSYNC_BACK_PORCH_MASK	(0xFFFF << 0)
> >   #define VSYNC_FRONT_PORCH_SHIFT		16
> >   #define VSYNC_FRONT_PORCH_MASK		(0xFFF << 16)
> > +#define DPINTF_VSYNC_FRONT_PORCH_MASK	(0xFFFF << 16)
> >   
> >   #define DPI_BG_HCNTL		0x30
> >   #define BG_RIGHT			(0x1FFF << 0)
> > @@ -217,4 +230,26 @@
> >   
> >   #define EDGE_SEL_EN			BIT(5)
> >   #define H_FRE_2N			BIT(25)
> > +
> > +#define RGB_TO_JPEG			0x00
> 
> This is 0x0
> 
> > +#define RGB_TO_FULL709			0x01
> 
> 0x1
> 
> > +#define RGB_TO_BT601			0x02
> 
> 0x2
> 
> ...remove the unnecessary leading zeros, but... you're not ever
> using this set of definitions, so why are you even adding them?
> 

ok, I will remove them.

> > +#define RGB_TO_BT709			0x03
> > +#define JPEG_TO_RGB			0x04
> > +#define FULL709_TO_RGB			0x05
> > +#define BT601_TO_RGB			0x06
> > +#define BT709_TO_RGB			0x07
> > +#define JPEG_TO_BT601			0x08
> > +#define JPEG_TO_BT709			0x09
> > +#define BT601_TO_JPEG			0xA
> > +#define BT709_TO_JPEG			0xB
> > +#define BT709_TO_BT601			0xC
> > +#define BT601_TO_BT709			0xD
> > +#define JPEG_TO_CERGB			0x14
> > +#define FULL709_TO_CERGB		0x15
> > +#define BT601_TO_CERGB			0x16
> > +#define BT709_TO_CERGB			0x17
> > +#define RGB_TO_CERGB			0x1C
> > +#define MATRIX_BIT			BIT(8)
> > +#define EXT_MATRIX_EN			BIT(12)
> >   #endif /* __MTK_DPI_REGS_H */
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 245d0074e12d..3738665a712e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -419,6 +419,11 @@ static const char * const
> > mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
> >   	[MTK_DISP_WDMA] = "wdma",
> >   	[MTK_DPI] = "dpi",
> >   	[MTK_DSI] = "dsi",
> > +	[MTK_DP_INTF] = "dp-intf",
> > +	[MTK_DISP_PWM] = "pwm",
> > +	[MTK_DISP_MUTEX] = "mutex",
> > +	[MTK_DISP_OD] = "od",
> > +	[MTK_DISP_BLS] = "bls",
> 
> Please keep alphabetic order.
> 

Some of this are redundant, and I will remove them.

> >   };
> >   
> >   struct mtk_ddp_comp_match {
> > @@ -439,6 +444,8 @@ static const struct mtk_ddp_comp_match
> > mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> >   	[DDP_COMPONENT_DPI1]		= { MTK_DPI,			
> > 1, &ddp_dpi },
> >   	[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,		
> > 0, &ddp_dsc },
> >   	[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,		
> > 1, &ddp_dsc },
> > +	[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,	0, &ddp_dpi
> > },
> > +	[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,	1, &ddp_dpi
> > },
> 
> Indentation issue. Fix it.
> 

Some of this are redundant, and I will remove them.

> >   	[DDP_COMPONENT_DSI0]		= { MTK_DSI,			
> > 0, &ddp_dsi },
> >   	[DDP_COMPONENT_DSI1]		= { MTK_DSI,			
> > 1, &ddp_dsi },
> >   	[DDP_COMPONENT_DSI2]		= { MTK_DSI,			
> > 2, &ddp_dsi },
> > @@ -565,6 +572,7 @@ int mtk_ddp_comp_init(struct device_node *node,
> > struct mtk_ddp_comp *comp,
> >   	    type == MTK_DISP_PWM ||
> >   	    type == MTK_DISP_RDMA ||
> >   	    type == MTK_DPI ||
> > +	    type == MTK_DP_INTF ||
> >   	    type == MTK_DSI)
> >   		return 0;
> >   
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index 825d763d2378..c4e683f46a95 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -37,6 +37,7 @@ enum mtk_ddp_comp_type {
> >   	MTK_DISP_UFOE,
> >   	MTK_DISP_WDMA,
> >   	MTK_DPI,
> > +	MTK_DP_INTF,
> >   	MTK_DSI,
> >   	MTK_DDP_COMP_TYPE_MAX,
> >   };
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index a2a783fc580e..e25ac61aac08 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -690,6 +690,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >   	  .data = (void *)MTK_DPI },
> >   	{ .compatible = "mediatek,mt8183-dpi",
> >   	  .data = (void *)MTK_DPI },
> > +	{ .compatible = "mediatek,mt8195-dpintf",
> > +	  .data = (void *)MTK_DP_INTF },
> >   	{ .compatible = "mediatek,mt2701-dsi",
> >   	  .data = (void *)MTK_DSI },
> >   	{ .compatible = "mediatek,mt8173-dsi",
> > @@ -801,8 +803,9 @@ static int mtk_drm_probe(struct platform_device
> > *pdev)
> >   		    comp_type == MTK_DISP_OVL_2L ||
> >   		    comp_type == MTK_DISP_OVL_ADAPTOR ||
> >   		    comp_type == MTK_DISP_RDMA ||
> > +		    comp_type == MTK_DSI ||
> >   		    comp_type == MTK_DPI ||
> > -		    comp_type == MTK_DSI) {
> > +		    comp_type == MTK_DP_INTF) {
> 
> These were nice and alphabetically ordered, why are you moving
> MTK_DSI up there?!
> 
>   		    comp_type == MTK_DISP_RDMA ||
> 		    comp_type == MTK_DP_INTF ||
>   		    comp_type == MTK_DPI ||
> 		    comp_type == MTK_DSI) {
> 
> ... that's how it should look like.
> 

Some of this are redundant, and I will remove them.

> >   			dev_info(dev, "Adding component match for
> > %pOF\n",
> >   				 node);
> >   			drm_of_component_match_add(dev, &match,
> > component_compare_of,
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 3e998bfb795a..e4b84c347201 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -21,12 +21,12 @@ enum mtk_ddp_comp_id {
> >   	DDP_COMPONENT_COLOR0,
> >   	DDP_COMPONENT_COLOR1,
> >   	DDP_COMPONENT_DITHER,
> > -	DDP_COMPONENT_DP_INTF0,
> > -	DDP_COMPONENT_DP_INTF1,
> >   	DDP_COMPONENT_DPI0,
> >   	DDP_COMPONENT_DPI1,
> >   	DDP_COMPONENT_DSC0,
> >   	DDP_COMPONENT_DSC1,
> > +	DDP_COMPONENT_DP_INTF0,
> > +	DDP_COMPONENT_DP_INTF1,
> 
> Why are you moving this?!
> 

I will fix this.

BRs,
Bo-Chen

> >   	DDP_COMPONENT_DSI0,
> >   	DDP_COMPONENT_DSI1,
> >   	DDP_COMPONENT_DSI2,
> 
> 

