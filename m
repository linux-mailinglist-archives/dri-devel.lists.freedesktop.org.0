Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B369E56698A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731C810FE62;
	Tue,  5 Jul 2022 11:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A1811277F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 06:58:09 +0000 (UTC)
X-UUID: 057a892538ec41cd8a041662c8faed04-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:9db952ff-4d03-41a1-b33c-e7d4820d8c21, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:9db952ff-4d03-41a1-b33c-e7d4820d8c21, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:17426b63-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:34be4a092cbd,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 057a892538ec41cd8a041662c8faed04-20220705
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1165721125; Tue, 05 Jul 2022 11:52:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 5 Jul 2022 11:52:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 11:52:19 +0800
Message-ID: <7d1edf411e98c6998a18e7bb50c62074179a79e1.camel@mediatek.com>
Subject: Re: [PATCH v15 08/16] drm/mediatek: dpi: move dimension mask to SoC
 config
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 5 Jul 2022 11:52:19 +0800
In-Reply-To: <20220701035845.16458-9-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
 <20220701035845.16458-9-rex-bc.chen@mediatek.com>
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
 xinlei.lee@mediatek.com, liangxu.xu@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Fri, 2022-07-01 at 11:58 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> Add flexibility by moving the dimension mask to the SoC config

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index ba871c347d15..586527458064 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -122,6 +122,8 @@ struct mtk_dpi_yc_limit {
>   * @num_output_fmts: Quantity of supported output formats.
>   * @is_ck_de_pol: Support CK/DE polarity.
>   * @swap_input_support: Support input swap function.
> + * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and
> VSYNC_PORCH
> + *		    (no shift).
>   */
>  struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
> @@ -132,6 +134,7 @@ struct mtk_dpi_conf {
>  	u32 num_output_fmts;
>  	bool is_ck_de_pol;
>  	bool swap_input_support;
> +	u32 dimension_mask;
>  };
>  
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> u32 mask)
> @@ -160,30 +163,30 @@ static void mtk_dpi_disable(struct mtk_dpi
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
> @@ -808,6 +811,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt2701_conf = {
> @@ -819,6 +823,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt8183_conf = {
> @@ -829,6 +834,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt8192_conf = {
> @@ -839,6 +845,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  };
>  
>  static int mtk_dpi_probe(struct platform_device *pdev)

