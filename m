Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED09517C26
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 05:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EA510F720;
	Tue,  3 May 2022 03:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC31510F720
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 03:07:25 +0000 (UTC)
X-UUID: b1b71b2429a245d585b654c6ccc13c20-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9cf8be31-3704-416d-a8b9-91eec550c8fe, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.4, REQID:9cf8be31-3704-416d-a8b9-91eec550c8fe, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:faefae9, CLOUDID:5d7d42c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil,QS:0
 ,BEC:nil
X-UUID: b1b71b2429a245d585b654c6ccc13c20-20220503
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 626196093; Tue, 03 May 2022 11:07:22 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 11:07:21 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 11:07:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 11:07:20 +0800
Message-ID: <5bf6e78f31c31f0244d967da628e9c60c496e30b.camel@mediatek.com>
Subject: Re: [PATCH v18 04/21] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux@roeck-us.net>
Date: Tue, 3 May 2022 11:07:20 +0800
In-Reply-To: <0fb7b063fc246c89430ddf310406ae954a3e3650.camel@mediatek.com>
References: <20220428105408.11189-1-nancy.lin@mediatek.com>
 <20220428105408.11189-5-nancy.lin@mediatek.com>
 <0fb7b063fc246c89430ddf310406ae954a3e3650.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

Thanks for the review.

On Fri, 2022-04-29 at 15:39 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Thu, 2022-04-28 at 18:53 +0800, Nancy.Lin wrote:
> > Add mt8195 vdosys1 routing table to the driver data of mtk-mmsys.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h    | 136
> > +++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       |   2 +
> >  include/linux/soc/mediatek/mtk-mmsys.h |   9 ++
> >  3 files changed, 147 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index abfe94a30248..51031d75e81e 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -75,6 +75,70 @@
> >  #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 <<
> > 16)
> >  #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			
> > (3 << 16)
> >  
> > +#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
> > +#define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			
> > 1
> > +
> > +#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
> > +#define MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1			
> > 1
> > +
> > +#define MT8195_VDO1_DISP_DPI1_SEL_IN				
> > 0xf10
> > +#define MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT		
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
> > +#define MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT		
> > 0
> > +
> > +#define MT8195_VDO1_MERGE4_SOUT_SEL				
> > 0xf18
> > +#define MT8195_MERGE4_SOUT_TO_DPI1_SEL				
> > 	2
> > +#define MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL				
> > 3
> > +
> > +#define MT8195_VDO1_MIXER_IN1_SEL_IN				
> > 0xf24
> > +#define MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_IN2_SEL_IN				
> > 0xf28
> > +#define MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_IN3_SEL_IN				
> > 0xf2c
> > +#define MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_IN4_SEL_IN				
> > 0xf30
> > +#define MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				
> > 0xf34
> > +#define MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL			
> > 	1
> > +
> > +#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
> > +#define MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2			
> > 1
> > +
> > +#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
> > +#define MT8195_SOUT_TO_MIXER_IN1_SEL				
> > 	
> > 1
> > +
> > +#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
> > +#define MT8195_SOUT_TO_MIXER_IN2_SEL				
> > 	
> > 1
> > +
> > +#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
> > +#define MT8195_SOUT_TO_MIXER_IN3_SEL				
> > 	
> > 1
> > +
> > +#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
> > +#define MT8195_SOUT_TO_MIXER_IN4_SEL				
> > 	
> > 1
> > +
> > +#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				
> > 0xf50
> > +#define MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT		
> > 	1
> > +
> > +#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				
> > 0xf58
> > +#define MT8195_MIXER_IN1_SOUT_TO_DISP_MIXER			
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				
> > 0xf5c
> > +#define MT8195_MIXER_IN2_SOUT_TO_DISP_MIXER			
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				
> > 0xf60
> > +#define MT8195_MIXER_IN3_SOUT_TO_DISP_MIXER			
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				
> > 0xf64
> > +#define MT8195_MIXER_IN4_SOUT_TO_DISP_MIXER			
> > 	
> > 0
> > +
> > +#define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> > 0xf68
> > +#define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			
> > 0
> > +
> >  static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[]
> > =
> > {
> >  	{
> >  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > @@ -364,6 +428,78 @@ static const struct mtk_mmsys_routes
> > mmsys_mt8195_routing_table[] = {
> >  		DDP_COMPONENT_DSC1, DDP_COMPONENT_MERGE0,
> >  		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
> >  		MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE
> > +	}, {
> > +		DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1,
> > +		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
> > +	}, {
> > +		DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1,
> > +		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
> > +	}, {
> > +		DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2,
> > +		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
> > +		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
> > +	}, {
> > +		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN1_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN2_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN3_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_SOUT_TO_MIXER_IN4_SEL
> > +	}, {
> > +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
> > +		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
> > +		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
> > +		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
> > +	}, {
> > +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
> > +		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
> > +	}, {
> > +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> > +		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
> > +		MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> > +		MT8195_VDO1_DISP_DPI1_SEL_IN, GENMASK(1, 0),
> > +		MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> > +		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_MERGE4_SOUT_TO_DPI1_SEL
> > +	}, {
> > +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> > +		MT8195_VDO1_DISP_DP_INTF0_SEL_IN, GENMASK(1, 0),
> > +		MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> > +		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
> > +		MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL
> >  	}
> >  };
> >  
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 548efed8dc1c..03c75a82c8d3 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -146,6 +146,8 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data = {
> >  static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data
> > = {
> >  	.io_start = 0x1c100000,
> >  	.clk_driver = "clk-mt8195-vdo1",
> > +	.routes = mmsys_mt8195_routing_table,
> 
> I think vdo0 and vdo1 are independent, so the routing table would
> also
> be independent. Merge these two table into one would waste time to
> search routing of other mmsys.
> 
OK, I will separate vdo0 and vdo1 routing tables.

> > +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> >  };
> >  
> >  static const struct mtk_mmsys_match_data mt8195_mmsys_match_data =
> > {
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index fb719fd1281c..b4388ba43341 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -28,7 +28,16 @@ enum mtk_ddp_comp_id {
> >  	DDP_COMPONENT_DSI1,
> >  	DDP_COMPONENT_DSI2,
> >  	DDP_COMPONENT_DSI3,
> > +	DDP_COMPONENT_ETHDR_MIXER,
> >  	DDP_COMPONENT_GAMMA,
> > +	DDP_COMPONENT_MDP_RDMA0,
> > +	DDP_COMPONENT_MDP_RDMA1,
> > +	DDP_COMPONENT_MDP_RDMA2,
> > +	DDP_COMPONENT_MDP_RDMA3,
> > +	DDP_COMPONENT_MDP_RDMA4,
> > +	DDP_COMPONENT_MDP_RDMA5,
> > +	DDP_COMPONENT_MDP_RDMA6,
> > +	DDP_COMPONENT_MDP_RDMA7,
> 
> These new component is not strongly related to mt8195 (maybe other
> SoC
> has these component), so I would like adding these new component to
> another patch.
> 
> Regards,
> CK
> 
OK

Regards,
Nancy

> >  	DDP_COMPONENT_MERGE0,
> >  	DDP_COMPONENT_MERGE1,
> >  	DDP_COMPONENT_MERGE2,
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!0Wkga9YarTOv3MlBvmu5OO8sxlpUAvQPPXXpjGSYuAyG50xmj9fqkSwgjSkQXI1v$
>  

