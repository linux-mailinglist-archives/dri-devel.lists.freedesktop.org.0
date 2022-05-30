Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC04537619
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 09:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094E110E29F;
	Mon, 30 May 2022 07:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4BA10E28E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 07:56:05 +0000 (UTC)
X-UUID: 4443469c0e72419db8968d689a6ebc64-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c14f2dcc-52e3-445c-9c85-1af21d71d8cd, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:8499fc47-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 4443469c0e72419db8968d689a6ebc64-20220530
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1272861189; Mon, 30 May 2022 15:56:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 30 May 2022 15:55:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 15:55:58 +0800
Message-ID: <201747a8679474a1088aa12e5175b9e8ac21306e.camel@mediatek.com>
Subject: Re: [PATCH v10 09/21] drm/mediatek: dpi: move dimension mask to SoC
 config
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
Date: Mon, 30 May 2022 15:55:58 +0800
In-Reply-To: <20220523104758.29531-10-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-10-granquet@baylibre.com>
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
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> Add flexibility by moving the dimension mask to the SoC config

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 454f8563efae..bf098f36a466 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -127,6 +127,8 @@ struct mtk_dpi_conf {
>  	u32 num_output_fmts;
>  	bool is_ck_de_pol;
>  	bool swap_input_support;
> +	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
> (no shift) */
> +	u32 dimension_mask;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -156,30 +158,30 @@ static void mtk_dpi_disable(struct mtk_dpi
> *dpi)
>  static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
>  				 struct mtk_dpi_sync_param *sync)
>  {
> -	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
> -		     sync->sync_width << HPW, HPW_MASK);
> -	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
> -		     sync->back_porch << HBP, HBP_MASK);
> +	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH, sync->sync_width << HPW,
> +		     dpi->conf->dimension_mask << HPW);
> +	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->back_porch << HBP,
> +		     dpi->conf->dimension_mask << HBP);
>  	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
> -		     HFP_MASK);
> +		     dpi->conf->dimension_mask << HFP);
>  }
>  
>  static void mtk_dpi_config_vsync(struct mtk_dpi *dpi,
>  				 struct mtk_dpi_sync_param *sync,
>  				 u32 width_addr, u32 porch_addr)
>  {
> -	mtk_dpi_mask(dpi, width_addr,
> -		     sync->sync_width << VSYNC_WIDTH_SHIFT,
> -		     VSYNC_WIDTH_MASK);
>  	mtk_dpi_mask(dpi, width_addr,
>  		     sync->shift_half_line << VSYNC_HALF_LINE_SHIFT,
>  		     VSYNC_HALF_LINE_MASK);
> +	mtk_dpi_mask(dpi, width_addr,
> +		     sync->sync_width << VSYNC_WIDTH_SHIFT,
> +		     dpi->conf->dimension_mask << VSYNC_WIDTH_SHIFT);
>  	mtk_dpi_mask(dpi, porch_addr,
>  		     sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
> -		     VSYNC_BACK_PORCH_MASK);
> +		     dpi->conf->dimension_mask <<
> VSYNC_BACK_PORCH_SHIFT);
>  	mtk_dpi_mask(dpi, porch_addr,
>  		     sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
> -		     VSYNC_FRONT_PORCH_MASK);
> +		     dpi->conf->dimension_mask <<
> VSYNC_FRONT_PORCH_SHIFT);
>  }
>  
>  static void mtk_dpi_config_vsync_lodd(struct mtk_dpi *dpi,
> @@ -813,6 +815,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -825,6 +828,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -836,6 +840,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -847,6 +852,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  

