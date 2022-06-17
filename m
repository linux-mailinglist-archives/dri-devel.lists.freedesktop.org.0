Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6254F0C4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 07:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9E710E50B;
	Fri, 17 Jun 2022 05:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C1210E50B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 05:50:26 +0000 (UTC)
X-UUID: 7d774f686991482688dd3dc9786fd842-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:79d21f78-a276-43bf-b661-574f2a7dca2e, OB:10,
 L
 OB:10,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:79d21f78-a276-43bf-b661-574f2a7dca2e, OB:10,
 LOB
 :10,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:137698f6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:aedf4f47e0bb,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7d774f686991482688dd3dc9786fd842-20220617
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1461728668; Fri, 17 Jun 2022 13:50:20 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:50:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 13:50:19 +0800
Message-ID: <e63682c60d3f3c29c941c1ff5db10903466d3d34.camel@mediatek.com>
Subject: Re: [PATCH 4/7] soc: mediatek: mutex: add MT8365 support
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>, <krzysztof.kozlowski+dt@linaro.org>,
 <robh+dt@kernel.org>
Date: Fri, 17 Jun 2022 13:50:18 +0800
In-Reply-To: <20220530201436.902505-4-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
 <20220530201436.902505-4-fparent@baylibre.com>
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
> Add mutex support for MT8365 SoC.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 40
> ++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c
> b/drivers/soc/mediatek/mtk-mutex.c
> index 981d56967e7a..b8d5c4a62542 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -110,6 +110,20 @@
>  #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
>  #define MT8195_MUTEX_MOD_DISP_PWM0		27
>  
> +#define MT8365_MUTEX_MOD_DISP_OVL0		7
> +#define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
> +#define MT8365_MUTEX_MOD_DISP_RDMA0		9
> +#define MT8365_MUTEX_MOD_DISP_RDMA1		10
> +#define MT8365_MUTEX_MOD_DISP_WDMA0		11
> +#define MT8365_MUTEX_MOD_DISP_COLOR0		12
> +#define MT8365_MUTEX_MOD_DISP_CCORR		13
> +#define MT8365_MUTEX_MOD_DISP_AAL		14
> +#define MT8365_MUTEX_MOD_DISP_GAMMA		15
> +#define MT8365_MUTEX_MOD_DISP_DITHER		16
> +#define MT8365_MUTEX_MOD_DISP_DSI0		17
> +#define MT8365_MUTEX_MOD_DISP_PWM0		20
> +#define MT8365_MUTEX_MOD_DISP_DPI0		22
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2		10
>  #define MT2712_MUTEX_MOD_DISP_OVL0		11
>  #define MT2712_MUTEX_MOD_DISP_OVL1		12
> @@ -315,6 +329,22 @@ static const unsigned int
> mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
>  };
>  
> +static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
> +	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
> +	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
> +	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
> +	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
> +	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,
> +	[DDP_COMPONENT_OVL0] = MT8365_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8365_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_PWM0] = MT8365_MUTEX_MOD_DISP_PWM0,
> +	[DDP_COMPONENT_RDMA0] = MT8365_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MT8365_MUTEX_MOD_DISP_RDMA1,
> +	[DDP_COMPONENT_WDMA0] = MT8365_MUTEX_MOD_DISP_WDMA0,
> +};
> +
>  static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -423,6 +453,14 @@ static const struct mtk_mutex_data
> mt8195_mutex_driver_data = {
>  	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
>  };
>  
> +static const struct mtk_mutex_data mt8365_mutex_driver_data = {
> +	.mutex_mod = mt8365_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +	.no_clk = true,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -665,6 +703,8 @@ static const struct of_device_id
> mutex_driver_dt_match[] = {
>  	  .data = &mt8192_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8195-disp-mutex",
>  	  .data = &mt8195_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8365-disp-mutex",
> +	  .data = &mt8365_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);

