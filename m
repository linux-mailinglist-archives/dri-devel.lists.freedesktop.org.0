Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B674FD334
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07F910EE50;
	Tue, 12 Apr 2022 09:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F8210EE50
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:10:58 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q189so18352101oia.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=j2d9wMZ4Dn70FczQLj2pbuSIpYNajn+KjBgUPeahz9Y=;
 b=d755dZcyw/9BFIYn9owbsElgR43HZUII7AXXDY9tgTYi25X+lHEpWnybc6V10B24OF
 jw/gXtzNLOpJm4uxhAttWKWyfMGC3Z2CSY+fY7o7n2eWXqXzhL9FvCO9ACzTeo70vHMC
 /Php1/74zEKlV5WcAULJMdgq3V11wZdSRDdei59ZTV0QNjWeNngX1P8Oq3nhgHWgMVDh
 mHh7xBqp/cgasJY7SK5ZNVQRty2yjwfnZPKSCGN0gWpJ9hEVZHzHLEbua1NV5Zgc2kxl
 juU1Z7MWstxc2gPgXIDheBqNoGWXTxWU9JKU84IYmPeBpFb3G71Bw7pF1+rMFlw7dEAq
 k8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=j2d9wMZ4Dn70FczQLj2pbuSIpYNajn+KjBgUPeahz9Y=;
 b=ydMQmIEp4KV/2ZIm1NxLfvgbnAEEWFz+UjDZW5fD8+3WoJE2fqy9P8YWQZrCZNa0h8
 JOduirPE5XiXEUU1RCweKP9sHXdGrcYypXDDnzzRhVtrjW8THrS0g6SPyPk7pwtvdDp3
 koqN4IfvQGwr71NHT1SoauvdpR6T+110UMBghkyFmqiYqw935cSnd2t7EzrRtLo/Lhl0
 m9ynb7yYsKT4Cs9dcLqjsN7W7mO4nhYqbqawgP83RtTXG6SRafdmSSDm+syiABEP2UzY
 LBLC7XpJOFF8sXFnva/HIbxM7bdEog0ciLvgrRTzb5vGhMafGRXe/XFRHG3w1w7Sw/QC
 971g==
X-Gm-Message-State: AOAM532eTVaTbhm6jGbaKVkM3i04uDFTACaX70giW7xU7DXjkGmNaMoJ
 +vCocJqyEZPX8HEpVY7CyIhIiw+WvzY7DicwrY0o2g==
X-Google-Smtp-Source: ABdhPJym0wUH56xDasZZcT8vh3C+x/PVUlFJ7UG6Mj8R3MXY3by/qXsmyvnSEZT+6tIIruxfg75z3l91ME8OPr9nDHA=
X-Received: by 2002:a05:6808:159d:b0:2da:3946:ab3d with SMTP id
 t29-20020a056808159d00b002da3946ab3dmr1272829oiw.248.1649754657107; Tue, 12
 Apr 2022 02:10:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 02:10:56 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-16-granquet@baylibre.com>
 <032e690ba56f646a12d68c5fcb8de35f74ce9b25.camel@mediatek.com>
In-Reply-To: <032e690ba56f646a12d68c5fcb8de35f74ce9b25.camel@mediatek.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 02:10:56 -0700
Message-ID: <CABnWg9shORfLvk3sNQL4-dZyYAEZzwUmbgPm7pX8E1mdRpaDTw@mail.gmail.com>
Subject: Re: [PATCH v9 15/22] drm/mediatek: dpi: Add dpintf support
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, vkoul@kernel.org, airlied@linux.ie,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com, 
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, 
 jitao.shi@mediatek.com, kishon@ti.com, krzk+dt@kernel.org, 
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mripard@kernel.org, 
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
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
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 10:38, Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>Hello Guillaume,
>
>Thanks for your patch, but I have some questions for this patch:
>
>On Mon, 2022-03-28 at 00:39 +0200, Guillaume Ranquet wrote:
>> dpintf is the displayport interface hardware unit. This unit is
>> similar
>> to dpi and can reuse most of the code.
>>
>> This patch adds support for mt8195-dpintf to this dpi driver. Main
>> differences are:
>>  - Some features/functional components are not available for dpintf
>>    which are now excluded from code execution once is_dpintf is set
>>  - dpintf can and needs to choose between different clockdividers
>> based
>>    on the clockspeed. This is done by choosing a different clock
>> parent.
>>  - There are two additional clocks that need to be managed. These are
>>    only set for dpintf and will be set to NULL if not supplied. The
>>    clk_* calls handle these as normal clocks then.
>>  - Some register contents differ slightly between the two components.
>> To
>>    work around this I added register bits/masks with a DPINTF_ prefix
>>    and use them where different.
>>
>> Based on a separate driver for dpintf created by
>> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 78 ++++++++++++++++++-
>> --
>>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     | 38 ++++++++++
>>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  8 +++
>>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  5 +-
>>  include/linux/soc/mediatek/mtk-mmsys.h      |  2 +
>>  6 files changed, 120 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index eb969c5c5c2e..8198d3cf23ac 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -126,6 +126,7 @@ struct mtk_dpi_conf {
>>  	const u32 *output_fmts;
>>  	u32 num_output_fmts;
>>  	bool is_ck_de_pol;
>> +	bool is_dpintf;
>>  	bool swap_input_support;
>>  	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
>> (no shift) */
>>  	u32 dimension_mask;
>> @@ -498,11 +499,11 @@ static int mtk_dpi_set_display_mode(struct
>> mtk_dpi *dpi,
>>
>>  	vm.pixelclock = pll_rate / factor;
>>  	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
>> -	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
>> +		 (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
>>  		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
>> -	else
>> +	} else {
>>  		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
>> -
>> +	}
>>
>>  	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
>>
>> @@ -515,9 +516,15 @@ static int mtk_dpi_set_display_mode(struct
>> mtk_dpi *dpi,
>>  			    MTK_DPI_POLARITY_FALLING :
>> MTK_DPI_POLARITY_RISING;
>>  	dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
>>  			    MTK_DPI_POLARITY_FALLING :
>> MTK_DPI_POLARITY_RISING;
>> -	hsync.sync_width = vm.hsync_len;
>> -	hsync.back_porch = vm.hback_porch;
>> -	hsync.front_porch = vm.hfront_porch;
>> +	if (dpi->conf->is_dpintf) {
>> +		hsync.sync_width = vm.hsync_len / 4;
>> +		hsync.back_porch = vm.hback_porch / 4;
>> +		hsync.front_porch = vm.hfront_porch / 4;
>> +	} else {
>> +		hsync.sync_width = vm.hsync_len;
>> +		hsync.back_porch = vm.hback_porch;
>> +		hsync.front_porch = vm.hfront_porch;
>> +	}
>>  	hsync.shift_half_line = false;
>>  	vsync_lodd.sync_width = vm.vsync_len;
>>  	vsync_lodd.back_porch = vm.vback_porch;
>> @@ -559,13 +566,20 @@ static int mtk_dpi_set_display_mode(struct
>> mtk_dpi *dpi,
>>  	mtk_dpi_config_channel_limit(dpi);
>>  	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
>>  	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
>> -	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>>  	mtk_dpi_config_color_format(dpi, dpi->color_format);
>> -	mtk_dpi_config_2n_h_fre(dpi);
>> -	mtk_dpi_dual_edge(dpi);
>> -	mtk_dpi_config_disable_edge(dpi);
>> +	if (dpi->conf->is_dpintf) {
>> +		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
>> +			     DPINTF_INPUT_2P_EN);
>> +	} else {
>> +		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>> +		mtk_dpi_config_2n_h_fre(dpi);
>> +		mtk_dpi_dual_edge(dpi);
>> +		mtk_dpi_config_disable_edge(dpi);
>> +	}
>>  	mtk_dpi_sw_reset(dpi, false);
>>
>> +	mtk_dpi_enable(dpi);
>
>Why do we need to add mtk_dpi_enable() here?
>Will this change the power on sequence?
>

I have been told that this is to avoid artifacts on screen, the
mtk_dpi_enable() is done
in mtk_dpi_set_display_mode() instead of mtk_dpi_power_on();

I will try to convey that explanation in a separate patch for v10

>BRs,
>Rex
>> +
>>  	return 0;
>>  }
>>
>> @@ -642,7 +656,10 @@ static int mtk_dpi_bridge_atomic_check(struct
>> drm_bridge *bridge,
>>  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
>>  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
>>  	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
>> -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
>> +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
>> +		dpi->color_format =
>> MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
>> +	else
>> +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
>>
>>  	return 0;
>>  }
>> @@ -801,6 +818,16 @@ static unsigned int mt8183_calculate_factor(int
>> clock)
>>  		return 2;
>>  }
>>
>> +static unsigned int mt8195_dpintf_calculate_factor(int clock)
>> +{
>> +	if (clock < 70000)
>> +		return 4;
>> +	else if (clock < 200000)
>> +		return 2;
>> +	else
>> +		return 1;
>> +}
>> +
>>  static const u32 mt8173_output_fmts[] = {
>>  	MEDIA_BUS_FMT_RGB888_1X24,
>>  };
>> @@ -810,6 +837,12 @@ static const u32 mt8183_output_fmts[] = {
>>  	MEDIA_BUS_FMT_RGB888_2X12_BE,
>>  };
>>
>> +static const u32 mt8195_output_fmts[] = {
>> +	MEDIA_BUS_FMT_RGB888_1X24,
>> +	MEDIA_BUS_FMT_YUV8_1X24,
>> +	MEDIA_BUS_FMT_YUYV8_1X16,
>> +};
>> +
>>  static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
>>  	.c_bottom = 0x0010,
>>  	.c_top = 0x0FE0,
>> @@ -817,6 +850,13 @@ static const struct mtk_dpi_yc_limit
>> mtk_dpi_limit = {
>>  	.y_top = 0x0FE0,
>>  };
>>
>> +static const struct mtk_dpi_yc_limit mtk_dpintf_limit = {
>> +	.c_bottom = 0x0000,
>> +	.c_top = 0xFFF,
>> +	.y_bottom = 0x0000,
>> +	.y_top = 0xFFF,
>> +};
>> +
>>  static const struct mtk_dpi_conf mt8173_conf = {
>>  	.cal_factor = mt8173_calculate_factor,
>>  	.reg_h_fre_con = 0xe0,
>> @@ -882,6 +922,19 @@ static const struct mtk_dpi_conf mt8192_conf = {
>>  	.limit = &mtk_dpi_limit,
>>  };
>>
>> +static const struct mtk_dpi_conf mt8195_dpintf_conf = {
>> +	.cal_factor = mt8195_dpintf_calculate_factor,
>> +	.output_fmts = mt8195_output_fmts,
>> +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
>> +	.is_dpintf = true,
>> +	.dimension_mask = DPINTF_HPW_MASK,
>> +	.hvsize_mask = DPINTF_HSIZE_MASK,
>> +	.channel_swap_shift = DPINTF_CH_SWAP,
>> +	.yuv422_en_bit = DPINTF_YUV422_EN,
>> +	.csc_enable_bit = DPINTF_CSC_ENABLE,
>> +	.limit = &mtk_dpintf_limit,
>> +};
>> +
>>  static int mtk_dpi_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -1004,6 +1057,9 @@ static const struct of_device_id
>> mtk_dpi_of_ids[] = {
>>  	{ .compatible = "mediatek,mt8192-dpi",
>>  	  .data = &mt8192_conf,
>>  	},
>> +	{ .compatible = "mediatek,mt8195-dpintf",
>> +	  .data = &mt8195_dpintf_conf,
>> +	},
>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
>> b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
>> index 3a02fabe1662..91b32dfffced 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
>> @@ -40,10 +40,15 @@
>>  #define FAKE_DE_LEVEN			BIT(21)
>>  #define FAKE_DE_RODD			BIT(22)
>>  #define FAKE_DE_REVEN			BIT(23)
>> +#define DPINTF_YUV422_EN		BIT(24)
>> +#define DPINTF_CSC_ENABLE		BIT(26)
>> +#define DPINTF_INPUT_2P_EN		BIT(29)
>>
>>  #define DPI_OUTPUT_SETTING	0x14
>>  #define CH_SWAP				0
>> +#define DPINTF_CH_SWAP			BIT(1)
>>  #define CH_SWAP_MASK			(0x7 << 0)
>> +#define DPINTF_CH_SWAP_MASK		(0x7 << 1)
>>  #define SWAP_RGB			0x00
>>  #define SWAP_GBR			0x01
>>  #define SWAP_BRG			0x02
>> @@ -80,8 +85,10 @@
>>  #define DPI_SIZE		0x18
>>  #define HSIZE				0
>>  #define HSIZE_MASK			(0x1FFF << 0)
>> +#define DPINTF_HSIZE_MASK		(0xFFFF << 0)
>>  #define VSIZE				16
>>  #define VSIZE_MASK			(0x1FFF << 16)
>> +#define DPINTF_VSIZE_MASK		(0xFFFF << 16)
>>
>>  #define DPI_DDR_SETTING		0x1C
>>  #define DDR_EN				BIT(0)
>> @@ -93,24 +100,30 @@
>>  #define DPI_TGEN_HWIDTH		0x20
>>  #define HPW				0
>>  #define HPW_MASK			(0xFFF << 0)
>> +#define DPINTF_HPW_MASK			(0xFFFF << 0)
>>
>>  #define DPI_TGEN_HPORCH		0x24
>>  #define HBP				0
>>  #define HBP_MASK			(0xFFF << 0)
>> +#define DPINTF_HBP_MASK			(0xFFFF << 0)
>>  #define HFP				16
>>  #define HFP_MASK			(0xFFF << 16)
>> +#define DPINTF_HFP_MASK			(0xFFFF << 16)
>>
>>  #define DPI_TGEN_VWIDTH		0x28
>>  #define DPI_TGEN_VPORCH		0x2C
>>
>>  #define VSYNC_WIDTH_SHIFT		0
>>  #define VSYNC_WIDTH_MASK		(0xFFF << 0)
>> +#define DPINTF_VSYNC_WIDTH_MASK		(0xFFFF << 0)
>>  #define VSYNC_HALF_LINE_SHIFT		16
>>  #define VSYNC_HALF_LINE_MASK		BIT(16)
>>  #define VSYNC_BACK_PORCH_SHIFT		0
>>  #define VSYNC_BACK_PORCH_MASK		(0xFFF << 0)
>> +#define DPINTF_VSYNC_BACK_PORCH_MASK	(0xFFFF << 0)
>>  #define VSYNC_FRONT_PORCH_SHIFT		16
>>  #define VSYNC_FRONT_PORCH_MASK		(0xFFF << 16)
>> +#define DPINTF_VSYNC_FRONT_PORCH_MASK	(0xFFFF << 16)
>>
>>  #define DPI_BG_HCNTL		0x30
>>  #define BG_RIGHT			(0x1FFF << 0)
>> @@ -217,4 +230,29 @@
>>
>>  #define EDGE_SEL_EN			BIT(5)
>>  #define H_FRE_2N			BIT(25)
>> +
>> +#define DPI_MATRIX_SET	0xB4
>> +#define INT_MATRIX_SEL			BIT(0)
>> +#define INT_MATRIX_SEL_MASK		(0x1F << 0)
>> +#define RGB_TO_JPEG			0x00
>> +#define RGB_TO_FULL709			0x01
>> +#define RGB_TO_BT601			0x02
>> +#define RGB_TO_BT709			0x03
>> +#define JPEG_TO_RGB			0x04
>> +#define FULL709_TO_RGB			0x05
>> +#define BT601_TO_RGB			0x06
>> +#define BT709_TO_RGB			0x07
>> +#define JPEG_TO_BT601			0x08
>> +#define JPEG_TO_BT709			0x09
>> +#define BT601_TO_JPEG			0xA
>> +#define BT709_TO_JPEG			0xB
>> +#define BT709_TO_BT601			0xC
>> +#define BT601_TO_BT709			0xD
>> +#define JPEG_TO_CERGB			0x14
>> +#define FULL709_TO_CERGB		0x15
>> +#define BT601_TO_CERGB			0x16
>> +#define BT709_TO_CERGB			0x17
>> +#define RGB_TO_CERGB			0x1C
>> +#define MATRIX_BIT			BIT(8)
>> +#define EXT_MATRIX_EN			BIT(12)
>>  #endif /* __MTK_DPI_REGS_H */
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>> index 2e99aee13dfe..558fc2733358 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>> @@ -351,6 +351,11 @@ static const char * const
>> mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>>  	[MTK_DISP_WDMA] = "wdma",
>>  	[MTK_DPI] = "dpi",
>>  	[MTK_DSI] = "dsi",
>> +	[MTK_DP_INTF] = "dp-intf",
>> +	[MTK_DISP_PWM] = "pwm",
>> +	[MTK_DISP_MUTEX] = "mutex",
>> +	[MTK_DISP_OD] = "od",
>> +	[MTK_DISP_BLS] = "bls",
>>  };
>>
>>  struct mtk_ddp_comp_match {
>> @@ -369,6 +374,8 @@ static const struct mtk_ddp_comp_match
>> mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
>>  	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0,
>> &ddp_dither },
>>  	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0,
>> &ddp_dpi },
>>  	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1,
>> &ddp_dpi },
>> +	[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,	0, &ddp_dpi
>> },
>> +	[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,	1, &ddp_dpi
>> },
>>  	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0,
>> &ddp_dsi },
>>  	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1,
>> &ddp_dsi },
>>  	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2,
>> &ddp_dsi },
>> @@ -481,6 +488,7 @@ int mtk_ddp_comp_init(struct device_node *node,
>> struct mtk_ddp_comp *comp,
>>  	    type == MTK_DISP_PWM ||
>>  	    type == MTK_DISP_RDMA ||
>>  	    type == MTK_DPI ||
>> +	    type == MTK_DP_INTF ||
>>  	    type == MTK_DSI)
>>  		return 0;
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>> index ad267bb8fc9b..43ad74be509e 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>> @@ -34,6 +34,7 @@ enum mtk_ddp_comp_type {
>>  	MTK_DISP_UFOE,
>>  	MTK_DISP_WDMA,
>>  	MTK_DPI,
>> +	MTK_DP_INTF,
>>  	MTK_DSI,
>>  	MTK_DDP_COMP_TYPE_MAX,
>>  };
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index 247c6ff277ef..c8a233f609f0 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -509,6 +509,8 @@ static const struct of_device_id
>> mtk_ddp_comp_dt_ids[] = {
>>  	  .data = (void *)MTK_DPI },
>>  	{ .compatible = "mediatek,mt8183-dpi",
>>  	  .data = (void *)MTK_DPI },
>> +	{ .compatible = "mediatek,mt8195-dpintf",
>> +	  .data = (void *)MTK_DP_INTF },
>>  	{ .compatible = "mediatek,mt2701-dsi",
>>  	  .data = (void *)MTK_DSI },
>>  	{ .compatible = "mediatek,mt8173-dsi",
>> @@ -609,7 +611,8 @@ static int mtk_drm_probe(struct platform_device
>> *pdev)
>>  		    comp_type == MTK_DISP_OVL_2L ||
>>  		    comp_type == MTK_DISP_RDMA ||
>>  		    comp_type == MTK_DPI ||
>> -		    comp_type == MTK_DSI) {
>> +		    comp_type == MTK_DPI ||
>> +		    comp_type == MTK_DP_INTF) {
>>  			dev_info(dev, "Adding component match for
>> %pOF\n",
>>  				 node);
>>  			drm_of_component_match_add(dev, &match,
>> component_compare_of,
>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
>> b/include/linux/soc/mediatek/mtk-mmsys.h
>> index 4bba275e235a..56ed2fa5f59e 100644
>> --- a/include/linux/soc/mediatek/mtk-mmsys.h
>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>> @@ -19,6 +19,8 @@ enum mtk_ddp_comp_id {
>>  	DDP_COMPONENT_DITHER,
>>  	DDP_COMPONENT_DPI0,
>>  	DDP_COMPONENT_DPI1,
>> +	DDP_COMPONENT_DP_INTF0,
>> +	DDP_COMPONENT_DP_INTF1,
>>  	DDP_COMPONENT_DSI0,
>>  	DDP_COMPONENT_DSI1,
>>  	DDP_COMPONENT_DSI2,
>
