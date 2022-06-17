Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E654F0C8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 07:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E760E10E4B0;
	Fri, 17 Jun 2022 05:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AD310E4B0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 05:53:40 +0000 (UTC)
X-UUID: 992860fb1aab411ca535480e4de6d22a-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:625d4246-464b-42ca-ab89-49716d1bbbc4, OB:0,
 LO
 B:20,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:50
X-CID-INFO: VERSION:1.1.6, REQID:625d4246-464b-42ca-ab89-49716d1bbbc4, OB:0,
 LOB:
 20,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:50
X-CID-META: VersionHash:b14ad71, CLOUDID:73f2db48-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:f8dc7abac148,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 992860fb1aab411ca535480e4de6d22a-20220617
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1129481051; Fri, 17 Jun 2022 13:53:36 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:53:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 13:53:34 +0800
Message-ID: <3b5e4d1e3b8dd8593c4a0cf0edbb0cee4538fa8e.camel@mediatek.com>
Subject: Re: [PATCH 5/7] soc: mediatek: mt8365-mmsys: add DPI/HDMI display path
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>, <krzysztof.kozlowski+dt@linaro.org>,
 <robh+dt@kernel.org>
Date: Fri, 17 Jun 2022 13:53:34 +0800
In-Reply-To: <20220530201436.902505-5-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
 <20220530201436.902505-5-fparent@baylibre.com>
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Fabien:

On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
> Right now only the DSI path connections are described in the mt8365
> mmsys driver. The external path will be DPI/HDMI. This commit adds
> the connections for DPI/HDMI.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/soc/mediatek/mt8365-mmsys.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8365-mmsys.h
> b/drivers/soc/mediatek/mt8365-mmsys.h
> index 24129a6c25f8..7abaf048d91e 100644
> --- a/drivers/soc/mediatek/mt8365-mmsys.h
> +++ b/drivers/soc/mediatek/mt8365-mmsys.h
> @@ -10,6 +10,9 @@
>  #define MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN	0xf60
>  #define MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0xf64
>  #define MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0xf68
> +#define MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL	0xfd0
> +#define MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0xfd8
> +#define MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00	0xfdc
>  
>  #define MT8365_RDMA0_SOUT_COLOR0			0x1
>  #define MT8365_DITHER_MOUT_EN_DSI0			0x1
> @@ -18,6 +21,10 @@
>  #define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
>  #define MT8365_DISP_COLOR_SEL_IN_COLOR0			0x0
>  #define MT8365_OVL0_MOUT_PATH0_SEL			BIT(0)
> +#define MT8365_RDMA1_SOUT_DPI0				0x1
> +#define MT8365_DPI0_SEL_IN_RDMA1			0x0
> +#define MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK		0x1
> +#define MT8365_DPI0_SEL_IN_RDMA1			0x0
>  
>  static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] =
> {
>  	{
> @@ -55,6 +62,21 @@ static const struct mtk_mmsys_routes
> mt8365_mmsys_routing_table[] = {
>  		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
>  		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0,
> MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
>  	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00,
> +		MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK,
> MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK
> +	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN,
> +		MT8365_DPI0_SEL_IN_RDMA1, MT8365_DPI0_SEL_IN_RDMA1
> +	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL,
> +		MT8365_RDMA1_SOUT_DPI0, MT8365_RDMA1_SOUT_DPI0
> +	},
>  };
>  
>  #endif /* __SOC_MEDIATEK_MT8365_MMSYS_H */

