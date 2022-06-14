Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF554A790
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 05:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FAE10E17B;
	Tue, 14 Jun 2022 03:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105B510E17B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 03:36:44 +0000 (UTC)
X-UUID: 9641f831290e412d88bcf70ded63c16c-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:08f4366a-c047-4c48-b5e1-3c7fb7ec91e3, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:b14ad71, CLOUDID:544456c5-c67b-4a73-9b18-726dd8f2eb58,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 9641f831290e412d88bcf70ded63c16c-20220614
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1687265981; Tue, 14 Jun 2022 11:36:38 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 14 Jun 2022 11:36:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 11:36:37 +0800
Message-ID: <f0746d3e0f1c998872840b63e94cd767061e77e7.camel@mediatek.com>
Subject: Re: [PATCH v11 03/12] drm/mediatek: dpi: implement a CK/DE pol
 toggle in SoC config
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 14 Jun 2022 11:36:36 +0800
In-Reply-To: <20220613064841.10481-4-rex-bc.chen@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-4-rex-bc.chen@mediatek.com>
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
> Dp_intf does not support CK/DE polarity because the polarity
> information
> is not used for eDP and DP while dp_intf is only for eDP and DP.
> Therefore, we add a bit of flexibility to support SoCs without CK/DE
> pol
> support.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Add modification reason in commit message.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index ce8c5eefe5f1..15218c1e8c11 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -125,6 +125,7 @@ struct mtk_dpi_conf {
>  	bool edge_sel_en;
>  	const u32 *output_fmts;
>  	u32 num_output_fmts;
> +	bool is_ck_de_pol;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -211,13 +212,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi
> *dpi,
>  			       struct mtk_dpi_polarities *dpi_pol)
>  {
>  	unsigned int pol;
> +	unsigned int mask;
>  
> -	pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL)
> |
> -	      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL)
> |
> -	      (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> HSYNC_POL) |
> +	mask = HSYNC_POL | VSYNC_POL;
> +	pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> HSYNC_POL) |
>  	      (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> VSYNC_POL);
> -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
> -		     CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
> +	if (dpi->conf->is_ck_de_pol) {
> +		mask |= CK_POL | DE_POL;
> +		pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
> +			0 : CK_POL) |
> +		       (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
> +			0 : DE_POL);
> +	}
> +
> +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
>  }
>  
>  static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
> @@ -799,6 +807,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.max_clock_khz = 300000,
>  	.output_fmts = mt8173_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> +	.is_ck_de_pol = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -809,6 +818,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.max_clock_khz = 150000,
>  	.output_fmts = mt8173_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> +	.is_ck_de_pol = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -818,6 +828,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.max_clock_khz = 100000,
>  	.output_fmts = mt8183_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> +	.is_ck_de_pol = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -827,6 +838,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.max_clock_khz = 150000,
>  	.output_fmts = mt8183_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> +	.is_ck_de_pol = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  

