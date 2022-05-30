Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE35376A3
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 10:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8555310E340;
	Mon, 30 May 2022 08:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B6210E340
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 08:47:27 +0000 (UTC)
X-UUID: 8411f63de33c4a2e8149dc7f93c31407-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:19cfd18b-16d3-4fbd-baba-fdc4bfa74526, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:9802ff47-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 8411f63de33c4a2e8149dc7f93c31407-20220530
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1985271771; Mon, 30 May 2022 16:47:23 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 30 May 2022 16:47:21 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 16:47:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 16:47:21 +0800
Message-ID: <a09b45d2526f2f387b1be5c0f18c5f1c05ba2f3d.camel@mediatek.com>
Subject: Re: [PATCH v10 12/21] drm/mediatek: dpi: move the yuv422_en_bit to
 SoC config
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
Date: Mon, 30 May 2022 16:47:21 +0800
In-Reply-To: <20220523104758.29531-13-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-13-granquet@baylibre.com>
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
> Add flexibility by moving the yuv422 en bit to SoC specific config

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 6d4d8c6ec47d..40254cd9d168 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -132,6 +132,7 @@ struct mtk_dpi_conf {
>  	/* HSIZE and VSIZE mask (no shift) */
>  	u32 hvsize_mask;
>  	u32 channel_swap_shift;
> +	u32 yuv422_en_bit;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -356,7 +357,8 @@ static void mtk_dpi_config_channel_swap(struct
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
> @@ -824,6 +826,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -839,6 +842,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -853,6 +857,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -867,6 +872,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
> +	.yuv422_en_bit = YUV422_EN,
>  	.limit = &mtk_dpi_limit,
>  };
>  

