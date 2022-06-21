Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA296552999
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 05:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB5810E05B;
	Tue, 21 Jun 2022 03:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919610E160
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 03:10:07 +0000 (UTC)
X-UUID: a03ccf3b4fd84fb98625d1796c56783f-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:e913a4ab-eca8-4559-b864-1fefa98f93fb, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:b14ad71, CLOUDID:661b982d-1756-4fa3-be7f-474a6e4be921,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: a03ccf3b4fd84fb98625d1796c56783f-20220621
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1852259428; Tue, 21 Jun 2022 11:04:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 21 Jun 2022 11:04:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 11:04:49 +0800
Message-ID: <d2a6c5044417e1ac8be9e6387951807e619162e8.camel@mediatek.com>
Subject: Re: [PATCH v12 12/14] drm/mediatek: dpi: Add YUV422 output support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 21 Jun 2022 11:04:49 +0800
In-Reply-To: <20220620121028.29234-13-rex-bc.chen@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
 <20220620121028.29234-13-rex-bc.chen@mediatek.com>
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

On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> Dp_intf supports YUV422 as output format. In MT8195 Chrome project,
> YUV422 output format is used for 4K resolution.

Move this patch before [1]. Otherwise, [1] would result in a bug.

[1] [v12,10/14] drm/mediatek: dpi: Add dpintf support

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index f83ecb154457..fc76ccad0a82 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -692,7 +692,10 @@ static int mtk_dpi_bridge_atomic_check(struct
> drm_bridge *bridge,
>  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
>  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
>  	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> +		dpi->color_format =
> MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
> +	else
> +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;

If out_bus_format is MEDIA_BUS_FMT_YUV8_1X24, the color_format is
MTK_DPI_COLOR_FORMAT_RGB?

Regards,
CK

>  
>  	return 0;
>  }

