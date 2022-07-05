Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1E5669A6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1DB112997;
	Tue,  5 Jul 2022 11:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6D010E4D9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 06:55:22 +0000 (UTC)
X-UUID: fc63303618154fd0b9fe80082d78f3a4-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:3d9f9706-8a9c-4921-a847-d83db6ae0717, OB:40,
 L
 OB:30,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:3d9f9706-8a9c-4921-a847-d83db6ae0717, OB:40,
 LOB
 :30,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:524f6b63-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:34be4a092cbd,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: fc63303618154fd0b9fe80082d78f3a4-20220705
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1032584449; Tue, 05 Jul 2022 11:54:31 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 5 Jul 2022 11:54:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 11:54:30 +0800
Message-ID: <109a20f45db10f5737bc41fd69b9c63dae01cd4e.camel@mediatek.com>
Subject: Re: [PATCH v15 11/16] drm/mediatek: dpi: move the yuv422_en_bit to
 SoC config
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 5 Jul 2022 11:54:29 +0800
In-Reply-To: <20220701035845.16458-12-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
 <20220701035845.16458-12-rex-bc.chen@mediatek.com>
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
> Add flexibility by moving the yuv422 en bit to SoC specific config

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
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 70a83a3c0570..0b75a4ce8261 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -126,6 +126,7 @@ struct mtk_dpi_yc_limit {
>   *		    (no shift).
>   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
>   * @channel_swap_shift: Shift value of channel swap.
> + * @yuv422_en_bit: Enable bit of yuv422.
>   */
>  struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
> @@ -139,6 +140,7 @@ struct mtk_dpi_conf {
>  	u32 dimension_mask;
>  	u32 hvsize_mask;
>  	u32 channel_swap_shift;
> +	u32 yuv422_en_bit;
>  };
>  
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> u32 mask)
> @@ -376,7 +378,8 @@ static void mtk_dpi_config_channel_swap(struct
> mtk_dpi *dpi,
>  
>  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool
> enable)
>  {
> -	mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
> +	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->yuv422_en_bit :
> 0,
> +		     dpi->conf->yuv422_en_bit);
>  }
>  
>  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool
> enable)
> @@ -822,6 +825,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
>  };
>  
>  static const struct mtk_dpi_conf mt2701_conf = {
> @@ -836,6 +840,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
>  };
>  
>  static const struct mtk_dpi_conf mt8183_conf = {
> @@ -849,6 +854,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
>  };
>  
>  static const struct mtk_dpi_conf mt8192_conf = {
> @@ -862,6 +868,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
>  };
>  
>  static int mtk_dpi_probe(struct platform_device *pdev)

