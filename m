Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74BA4E378D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 04:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF5810E51A;
	Tue, 22 Mar 2022 03:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7F310E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 03:31:41 +0000 (UTC)
X-UUID: bcfbd448917f4097a7fb4557441e8014-20220322
X-UUID: bcfbd448917f4097a7fb4557441e8014-20220322
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 750820323; Tue, 22 Mar 2022 11:31:37 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 22 Mar 2022 11:31:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 11:31:35 +0800
Message-ID: <b391cb9ab341ed83f8d640867c8dbba856a7c454.camel@mediatek.com>
Subject: Re: [PATCH v16 04/22] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys1
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 22 Mar 2022 11:31:35 +0800
In-Reply-To: <20220318142009.2796-5-nancy.lin@mediatek.com>
References: <20220318142009.2796-1-nancy.lin@mediatek.com>
 <20220318142009.2796-5-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Fri, 2022-03-18 at 22:19 +0800, Nancy.Lin wrote:
> Add mt8195 vdosys1 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 136
> +++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       |  10 ++
>  include/linux/soc/mediatek/mtk-mmsys.h |   2 +
>  3 files changed, 148 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> b/drivers/soc/mediatek/mt8195-mmsys.h
> index 24a3afe23bc8..369fb0aab56d 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -75,6 +75,70 @@
>  #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 <<
> 16)
>  #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			
> (3 << 16)
>  
> +#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
> +#define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			
> 1
> +
> +#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
> +#define MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1			
> 1
> +
> +#define MT8195_VDO1_DISP_DPI1_SEL_IN				0xf10
> +#define MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT			
> 0
> +
> +#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
> +#define MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT		
> 0
> +
> +#define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
> +#define MT8195_MERGE4_SOUT_TO_DPI1_SEL				
> 	2
> +#define MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL				
> 3
> +
> +#define MT8195_VDO1_MIXER_IN1_SEL_IN				0xf24
> +#define MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT		
> 	1
> +
> +#define MT8195_VDO1_MIXER_IN2_SEL_IN				0xf28
> +#define MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT		
> 	1
> +
> +#define MT8195_VDO1_MIXER_IN3_SEL_IN				0xf2c
> +#define MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT		
> 	1
> +
> +#define MT8195_VDO1_MIXER_IN4_SEL_IN				0xf30
> +#define MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT		
> 	1
> +
> +#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				
> 0xf34
> +#define MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL			
> 	1
> +
> +#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
> +#define MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2			
> 1
> +
> +#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
> +#define MT8195_SOUT_TO_MIXER_IN1_SEL					
> 1
> +
> +#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
> +#define MT8195_SOUT_TO_MIXER_IN2_SEL					
> 1
> +
> +#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
> +#define MT8195_SOUT_TO_MIXER_IN3_SEL					
> 1
> +
> +#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
> +#define MT8195_SOUT_TO_MIXER_IN4_SEL					
> 1
> +
> +#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				
> 0xf50
> +#define MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT		
> 	1
> +
> +#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				
> 0xf58
> +#define MT8195_MIXER_IN1_SOUT_TO_DISP_MIXER				
> 0
> +
> +#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				
> 0xf5c
> +#define MT8195_MIXER_IN2_SOUT_TO_DISP_MIXER				
> 0
> +
> +#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				
> 0xf60
> +#define MT8195_MIXER_IN3_SOUT_TO_DISP_MIXER				
> 0
> +
> +#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				
> 0xf64
> +#define MT8195_MIXER_IN4_SOUT_TO_DISP_MIXER				
> 0
> +
> +#define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> 0xf68
> +#define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			
> 0
> +
>  static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] =
> {
>  	{
>  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> @@ -124,6 +188,78 @@ static const struct mtk_mmsys_routes
> mmsys_mt8195_routing_table[] = {
>  		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
>  		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
>  		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
> +		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
> +		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
> +		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_SOUT_TO_MIXER_IN1_SEL
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_SOUT_TO_MIXER_IN2_SEL
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_SOUT_TO_MIXER_IN3_SEL
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_SOUT_TO_MIXER_IN4_SEL
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
> +		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
> +		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
> +		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
> +		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
> +		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
> +		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
> +	}, {
> +		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
> +		MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT

I would like to expose each mod instead of ovl adaptor. ovl adaptor is
an application that combine these mod to achieve ovl function, maybe
another application would combine part of these mod to achieve another
function. Let application to decide the combination.

Regards,
CK

> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> +		MT8195_VDO1_DISP_DPI1_SEL_IN, GENMASK(1, 0),
> +		MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> +		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_MERGE4_SOUT_TO_DPI1_SEL
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO1_DISP_DP_INTF0_SEL_IN, GENMASK(1, 0),
> +		MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL
>  	}
>  };
>  
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index dc5c51f0ccc8..0b77624cf6ca 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -79,6 +79,12 @@ static const struct mtk_mmsys_driver_data
> mt8195_vdosys0_driver_data = {
>  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data
> = {
> +	.clk_driver = "clk-mt8195-vdo1",
> +	.routes = mmsys_mt8195_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =
> {
>  	.clk_driver = "clk-mt8365-mm",
>  	.routes = mt8365_mmsys_routing_table,
> @@ -271,6 +277,10 @@ static const struct of_device_id
> of_match_mtk_mmsys[] = {
>  		.compatible = "mediatek,mt8195-vdosys0",
>  		.data = &mt8195_vdosys0_driver_data,
>  	},
> +	{
> +		.compatible = "mediatek,mt8195-vdosys1",
> +		.data = &mt8195_vdosys1_driver_data,
> +	},
>  	{
>  		.compatible = "mediatek,mt8365-mmsys",
>  		.data = &mt8365_mmsys_driver_data,
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index 64c77c4a6c56..eaf7f7345519 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -18,6 +18,7 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_COLOR1,
>  	DDP_COMPONENT_DITHER,
>  	DDP_COMPONENT_DP_INTF0,
> +	DDP_COMPONENT_DP_INTF1,
>  	DDP_COMPONENT_DPI0,
>  	DDP_COMPONENT_DPI1,
>  	DDP_COMPONENT_DSC0,
> @@ -39,6 +40,7 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_OVL_2L0,
>  	DDP_COMPONENT_OVL_2L1,
>  	DDP_COMPONENT_OVL_2L2,
> +	DDP_COMPONENT_OVL_ADAPTOR,
>  	DDP_COMPONENT_OVL1,
>  	DDP_COMPONENT_POSTMASK0,
>  	DDP_COMPONENT_PWM0,

