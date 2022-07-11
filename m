Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3786B56D470
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 08:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4686914A542;
	Mon, 11 Jul 2022 06:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A7414A542
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 06:01:31 +0000 (UTC)
X-UUID: 7901b37e049948beaa035464ae23ba02-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:9671ab06-cf11-4b38-bb3e-226074a8eb0f, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:0f94e32, CLOUDID:4cecee63-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 7901b37e049948beaa035464ae23ba02-20220711
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1088967757; Mon, 11 Jul 2022 14:01:11 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Jul 2022 14:01:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jul 2022 14:01:09 +0800
Message-ID: <da67ea583a1cb2f5ccb34d4b748b96361983e32c.camel@mediatek.com>
Subject: Re: [PATCH v24 07/10] soc: mediatek: mmsys: add mmsys for support
 64 reset bits
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Mon, 11 Jul 2022 14:01:09 +0800
In-Reply-To: <5841cdea-2587-5bd8-3e6c-19e49121677a@gmail.com>
References: <20220622130824.29143-1-nancy.lin@mediatek.com>
 <20220622130824.29143-8-nancy.lin@mediatek.com>
 <5841cdea-2587-5bd8-3e6c-19e49121677a@gmail.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
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

On Fri, 2022-07-08 at 17:42 +0200, Matthias Brugger wrote:
> 
> On 22/06/2022 15:08, Nancy.Lin wrote:
> > Add mmsys for support 64 reset bits. It is a preparation for MT8195
> > vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
> > 
> > 1. Add the number of reset bits in mmsys private data
> > 2. move the whole "reset register code section" behind the
> > "get mmsys->data" code section for getting the num_resets in mmsys-
> > >data.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 35 ++++++++++++++++++++-------
> > -----
> >   drivers/soc/mediatek/mtk-mmsys.h |  1 +
> >   2 files changed, 23 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 16be77d5acac..47b72ae72cc2 100644
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
> > @@ -288,10 +293,14 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >   {
> >   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >   	unsigned long flags;
> > +	u32 offset;
> > +
> > +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> > +	id = id % MMSYS_SW_RESET_PER_REG;
> >   
> >   	spin_lock_irqsave(&mmsys->lock, flags);
> >   
> > -	mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset,
> > BIT(id),
> > +	mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset +
> > offset, BIT(id),
> >   			      assert ? 0 : BIT(id), NULL);
> 
> reg = mmsys->data->sw0_rst_offset + offset;
> mtk_mmsys_update_bits(mmsys, reg, BIT(id),
>                        assert ? 0 : BIT(id), NULL);
> 
> Other then that, patch looks good.
> By the way setting val depending on assert in the function call gets
> (for me) 
> hard to read, as I said earlier.
> 
> Regards,
> Matthias
> 
OK, I will add reg variable and modify it as you said in [1].

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220622130824.29143-5-nancy.lin@mediatek.com/

BRs,
Nancy

> >   
> >   	spin_unlock_irqrestore(&mmsys->lock, flags);
> > @@ -349,18 +358,6 @@ static int mtk_mmsys_probe(struct
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
> >   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	if (!res) {
> >   		dev_err(dev, "Couldn't get mmsys resource\n");
> > @@ -382,6 +379,18 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   		mmsys->data = match_data->drv_data[0];
> >   	}
> >   
> > +	spin_lock_init(&mmsys->lock);
> > +
> > +	mmsys->rcdev.owner = THIS_MODULE;
> > +	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
> > +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> > +	mmsys->rcdev.of_node = pdev->dev.of_node;
> > +	ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> > >rcdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Couldn't register mmsys reset
> > controller: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> >   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> >   	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> >   	if (ret)
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > b/drivers/soc/mediatek/mtk-mmsys.h
> > index f01ba206481d..20a271b80b3b 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > @@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
> >   	const struct mtk_mmsys_routes *routes;
> >   	const unsigned int num_routes;
> >   	const u16 sw0_rst_offset;
> > +	const u32 num_resets;
> >   };
> >   
> >   struct mtk_mmsys_match_data {

