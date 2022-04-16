Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FB50321D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 03:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F1110E532;
	Sat, 16 Apr 2022 01:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0780E10E526
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 01:03:22 +0000 (UTC)
X-UUID: a7a9cc8ac24a4a94a4549e077688e8f5-20220416
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0b0355d9-89cf-4c71-b2bb-d2d5a0201157, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:8c4512ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a7a9cc8ac24a4a94a4549e077688e8f5-20220416
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 838796539; Sat, 16 Apr 2022 09:03:17 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 16 Apr 2022 09:03:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Apr 2022 09:03:15 +0800
Message-ID: <3eaac61a834fedeaf2f8a54ad2f5d14ecda60194.camel@mediatek.com>
Subject: Re: [PATCH v16 09/22] soc: mediatek: add mtk-mutex support for
 mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux@roeck-us.net>
Date: Sat, 16 Apr 2022 09:03:15 +0800
In-Reply-To: <088784fbbe5b42a4dd9e796f0cf75a928a3b5a40.camel@mediatek.com>
References: <20220318142009.2796-1-nancy.lin@mediatek.com>
 <20220318142009.2796-10-nancy.lin@mediatek.com>
 <088784fbbe5b42a4dd9e796f0cf75a928a3b5a40.camel@mediatek.com>
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

Hi CK,

Thanks for the review.

On Tue, 2022-03-22 at 10:27 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Fri, 2022-03-18 at 22:19 +0800, Nancy.Lin wrote:
> > Add mtk-mutex support for mt8195 vdosys1.
> > The vdosys1 path component contains ovl_adaptor, merge5,
> > and dp_intf1. Ovl_adaptor is composed of several sub-elements.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 54
> > ++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index cb791671d751..70e6043e99df 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -129,6 +129,35 @@
> >  #define MT8195_MUTEX_MOD_DISP_PWM0		BIT(27)
> >  #define MT8195_MUTEX_MOD_DISP_PWM1		BIT(28)
> >  
> > +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA0	BIT(0)
> > +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA1	BIT(1)
> > +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA2	BIT(2)
> > +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA3	BIT(3)
> > +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA4	BIT(4)
> > +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA5	BIT(5)
> > +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA6	BIT(6)
> > +#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA7	BIT(7)
> > +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE0	BIT(8)
> > +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE1	BIT(9)
> > +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE2	BIT(10)
> > +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE3	BIT(11)
> > +#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE4	BIT(12)
> > +#define MT8195_MUTEX_MOD_DISP1_VPP2_DL_RELAY	BIT(13)
> > +#define MT8195_MUTEX_MOD_DISP1_VPP3_DL_RELAY	BIT(14)
> > +#define MT8195_MUTEX_MOD_DISP1_VDO0_DSC_DL_ASYNC	BIT(15)
> > +#define MT8195_MUTEX_MOD_DISP1_VDO0_MERGE_DL_ASYNC	BIT(16)
> > +#define MT8195_MUTEX_MOD_DISP1_VDO1_OUT_DL_RELAY	BIT(17)
> > +#define MT8195_MUTEX_MOD_DISP1_DISP_MIXER	BIT(18)
> > +#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE0	BIT(19)
> > +#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE1	BIT(20)
> > +#define MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE0	BIT(21)
> > +#define MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE1	BIT(22)
> > +#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_BE0	BIT(23)
> > +#define MT8195_MUTEX_MOD_DISP1_HDR_MLOAD	BIT(24)
> > +#define MT8195_MUTEX_MOD_DISP1_DPI0		BIT(25)
> > +#define MT8195_MUTEX_MOD_DISP1_DPI1		BIT(26)
> > +#define MT8195_MUTEX_MOD_DISP1_DP_INTF0		BIT(27)
> > +
> >  #define MT2712_MUTEX_MOD_DISP_PWM2		BIT(10)
> >  #define MT2712_MUTEX_MOD_DISP_OVL0		BIT(11)
> >  #define MT2712_MUTEX_MOD_DISP_OVL1		BIT(12)
> > @@ -332,6 +361,27 @@ static const u64
> > mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> >  	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
> >  	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
> >  	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
> > +	[DDP_COMPONENT_OVL_ADAPTOR] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA0
> > > 
> 
> I would like to expose each mod instead of ovl adaptor. ovl adaptor
> is
> an application that combine these mod to achieve ovl function, maybe
> another application would combine part of these mod to achieve
> another
> function. Let application to decide the combination.
> 
> Regards,
> CK
> 
OK, I will separate ovl_adaptor component in next revision.

Regards,
Nancy

> > +				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA1
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA2
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA3
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA4
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA5
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA6
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA7
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE0
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE1
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE2
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE3
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE
> > 0 |
> > +				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE
> > 1 |
> > +				      MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE
> > 0 |
> > +				      MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE
> > 1 |
> > +				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_BE
> > 0 |
> > +				      MT8195_MUTEX_MOD_DISP1_HDR_MLOAD
> > > 
> > 
> > +				      MT8195_MUTEX_MOD_DISP1_DISP_MIXER
> > ,
> > +	[DDP_COMPONENT_MERGE5] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE4,
> > +	[DDP_COMPONENT_DP_INTF1] = MT8195_MUTEX_MOD_DISP1_DP_INTF0,
> >  };
> >  
> >  static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> > @@ -517,6 +567,9 @@ void mtk_mutex_add_comp(struct mtk_mutex
> > *mutex,
> >  	case DDP_COMPONENT_DP_INTF0:
> >  		sof_id = MUTEX_SOF_DP_INTF0;
> >  		break;
> > +	case DDP_COMPONENT_DP_INTF1:
> > +		sof_id = MUTEX_SOF_DP_INTF1;
> > +		break;
> >  	default:
> >  		if (mtx->data->mutex_mod[id] <= BIT(31)) {
> >  			offset = DISP_REG_MUTEX_MOD(mtx->data-
> > > mutex_mod_reg,
> > 
> > @@ -557,6 +610,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex
> > *mutex,
> >  	case DDP_COMPONENT_DPI0:
> >  	case DDP_COMPONENT_DPI1:
> >  	case DDP_COMPONENT_DP_INTF0:
> > +	case DDP_COMPONENT_DP_INTF1:
> >  		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
> >  			       mtx->regs +
> >  			       DISP_REG_MUTEX_SOF(mtx->data-
> > > mutex_sof_reg,
> 
> 

