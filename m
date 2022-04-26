Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FB50F65E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2758210E51E;
	Tue, 26 Apr 2022 08:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C09210E51E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:56:13 +0000 (UTC)
X-UUID: ece299d785854b2d8d31040d7a9aadc4-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:148b2043-ba81-47a9-b43e-a9eb4c9870b5, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e5de84c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ece299d785854b2d8d31040d7a9aadc4-20220426
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 807469282; Tue, 26 Apr 2022 16:56:09 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 16:56:08 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 16:56:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 16:56:07 +0800
Message-ID: <4f7df36754381c4c7352a9dbdbe79bb65ebf82d0.camel@mediatek.com>
Subject: Re: [PATCH v17 07/21] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 26 Apr 2022 16:56:07 +0800
In-Reply-To: <6e06f2a0-ee9b-4cf4-85a3-243ed3121c50@gmail.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-8-nancy.lin@mediatek.com>
 <6e06f2a0-ee9b-4cf4-85a3-243ed3121c50@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

Thanks for the review.

On Fri, 2022-04-22 at 13:37 +0200, Matthias Brugger wrote:
> 
> On 16/04/2022 04:07, Nancy.Lin wrote:
> > MT8195 vdosys1 has more than 32 reset bits and a different reset
> > base
> > than other chips. Modify mmsys for support 64 bit and different
> > reset
> > base.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   drivers/soc/mediatek/mt8195-mmsys.h |  1 +
> >   drivers/soc/mediatek/mtk-mmsys.c    | 39 ++++++++++++++++++----
> > -------
> >   drivers/soc/mediatek/mtk-mmsys.h    |  1 +
> >   3 files changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index 5469073e3073..0a286fa5a824 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -139,6 +139,7 @@
> >   #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> > 0xf68
> >   #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			
> > 0
> >   
> > +#define MT8195_VDO1_SW0_RST_B		0x1d0
> >   #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
> >   #define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
> >   #define MT8195_VDO1_HDR_TOP_CFG		0xd00
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index ea04aa2c3840..d7c806f9e494 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -20,6 +20,8 @@
> >   #include "mt8195-mmsys.h"
> >   #include "mt8365-mmsys.h"
> >   
> > +#define MMSYS_SW_RESET_PER_REG 32
> > +
> >   static const struct mtk_mmsys_driver_data
> > mt2701_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt2701-mm",
> >   	.routes = mmsys_default_routing_table,
> > @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >   	.routes = mmsys_default_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> >   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8173_mmsys_match_data
> > = {
> > @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >   	.routes = mmsys_mt8183_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> >   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8183_mmsys_match_data
> > = {
> > @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> > mt8186_mmsys_driver_data = {
> >   	.routes = mmsys_mt8186_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> >   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8186_mmsys_match_data
> > = {
> > @@ -148,6 +153,8 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data = {
> >   	.clk_driver = "clk-mt8195-vdo1",
> >   	.routes = mmsys_mt8195_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > +	.sw0_rst_offset = MT8195_VDO1_SW0_RST_B,
> > +	.num_resets = 64,
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8195_mmsys_match_data
> > = {
> > @@ -234,18 +241,22 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >   {
> >   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >   	unsigned long flags;
> > +	u32 offset;
> >   	u32 reg;
> >   
> > +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> > +	id = id % MMSYS_SW_RESET_PER_REG;
> > +
> >   	spin_lock_irqsave(&mmsys->lock, flags);
> >   
> > -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> > +	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset +
> > offset);
> >   
> >   	if (assert)
> >   		reg &= ~BIT(id);
> >   	else
> >   		reg |= BIT(id);
> >   
> > -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> > +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset +
> > offset);
> >   
> >   	spin_unlock_irqrestore(&mmsys->lock, flags);
> >   
> > @@ -360,18 +371,6 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   		return ret;
> >   	}
> >   
> > -	spin_lock_init(&mmsys->lock);
> > -
> > -	mmsys->rcdev.owner = THIS_MODULE;
> > -	mmsys->rcdev.nr_resets = 32;
> > -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> > -	mmsys->rcdev.of_node = pdev->dev.of_node;
> > -	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> > >rcdev);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "Couldn't register mmsys reset
> > controller: %d\n", ret);
> > -		return ret;
> > -	}
> > -
> 
> I'm not sure why you move that code block. It's not explained in the
> commit message.
> 
> Regards,
> Matthias

The reason for moving the code block is the need for getting mmsys-
>data first and then getting the nr_resets from mmsys->data-
>num_resets. So I move the whole reset code section behind the get
mmsys->data code section. I will explain more detail in the commit
message.

Regards,
Nancy


