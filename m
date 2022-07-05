Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B69566945
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8A010F193;
	Tue,  5 Jul 2022 11:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902110ED74
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 06:53:55 +0000 (UTC)
X-UUID: 96948bf04ebe46a5b793cbd57d06d4b6-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:5dc41144-71c0-45cf-a135-1ab85b41c260, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:bbe38d86-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 96948bf04ebe46a5b793cbd57d06d4b6-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 836330481; Tue, 05 Jul 2022 11:53:02 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 5 Jul 2022 11:53:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 11:53:01 +0800
Message-ID: <a5cb555657c094028f78f92f5cbcdb344882e5f4.camel@mediatek.com>
Subject: Re: [PATCH v15 09/16] drm/mediatek: dpi: move hvsize_mask to SoC
 config
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 5 Jul 2022 11:53:00 +0800
In-Reply-To: <20220701035845.16458-10-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
 <20220701035845.16458-10-rex-bc.chen@mediatek.com>
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
> Add flexibility by moving the hvsize mask to SoC specific config.

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
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 586527458064..11724432e2f2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -124,6 +124,7 @@ struct mtk_dpi_yc_limit {
>   * @swap_input_support: Support input swap function.
>   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and
> VSYNC_PORCH
>   *		    (no shift).
> + * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
>   */
>  struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
> @@ -135,6 +136,7 @@ struct mtk_dpi_conf {
>  	bool is_ck_de_pol;
>  	bool swap_input_support;
>  	u32 dimension_mask;
> +	u32 hvsize_mask;
>  };
>  
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> u32 mask)
> @@ -248,8 +250,10 @@ static void mtk_dpi_config_interface(struct
> mtk_dpi *dpi, bool inter)
>  
>  static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width,
> u32 height)
>  {
> -	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
> -	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
> +	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
> +		     dpi->conf->hvsize_mask << HSIZE);
> +	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
> +		     dpi->conf->hvsize_mask << VSIZE);
>  }
>  
>  static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
> @@ -812,6 +816,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt2701_conf = {
> @@ -824,6 +829,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt8183_conf = {
> @@ -835,6 +841,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
>  };
>  
>  static const struct mtk_dpi_conf mt8192_conf = {
> @@ -846,6 +853,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
> +	.hvsize_mask = HSIZE_MASK,
>  };
>  
>  static int mtk_dpi_probe(struct platform_device *pdev)

