Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142CB59DAE8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 13:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE8C11A6ED;
	Tue, 23 Aug 2022 11:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC3711A05E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 11:30:28 +0000 (UTC)
X-UUID: 4193c841d59540278728a9813f1d2810-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5IUdramIkid/u6ApEZFUzQPcYeOozNSiBDrLooC1sGY=; 
 b=PTFVP4/Ha4uQLBY6CHAVX2QizqkUtt8+uLDTHmbUerHbcpRwD+6julRF+yzOcp/BTnb50Ce/5mCME44kVbgbiDC+VHP8m5J24a4cbQpDzb3NauTpQn0+rkaEjqceUEaycFNqaA9BYSfCs1hw69df/U4JqG7HZRiETeFeBC9SaRU=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:43a9cc4d-f10f-4c86-87ec-1a1039576b5f, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:54
X-CID-INFO: VERSION:1.1.10, REQID:43a9cc4d-f10f-4c86-87ec-1a1039576b5f, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_H
 amU,ACTION:release,TS:54
X-CID-META: VersionHash:84eae18, CLOUDID:02c58ac9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:9e9149611341,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 4193c841d59540278728a9813f1d2810-20220823
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 363795232; Tue, 23 Aug 2022 19:30:12 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 19:30:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Aug 2022 19:30:01 +0800
Message-ID: <140b3cd10317a5db781df180ce4efb697cdd641b.camel@mediatek.com>
Subject: Re: [PATCH v26 07/10] soc: mediatek: mmsys: add mmsys for support
 64 reset bits
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
 <nfraprado@collabora.com>
Date: Tue, 23 Aug 2022 19:30:01 +0800
In-Reply-To: <44c86ad9-8158-0a8a-ce31-a995c8d10e0b@gmail.com>
References: <20220819061011.7672-1-nancy.lin@mediatek.com>
 <20220819061011.7672-8-nancy.lin@mediatek.com>
 <44c86ad9-8158-0a8a-ce31-a995c8d10e0b@gmail.com>
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

On Tue, 2022-08-23 at 12:20 +0200, Matthias Brugger wrote:
> 
> On 19/08/2022 08:10, Nancy.Lin wrote:
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
> >   drivers/soc/mediatek/mtk-mmsys.c | 40 +++++++++++++++++++++----
> > -------
> >   drivers/soc/mediatek/mtk-mmsys.h |  1 +
> >   2 files changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 999be064103b..20ae751ad8a7 100644
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
> > @@ -128,6 +133,7 @@ static const struct mtk_mmsys_driver_data
> > mt8192_mmsys_driver_data = {
> >   	.routes = mmsys_mt8192_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> >   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> 
> You didn't reply to Nicolas regarding the reset numbers. I actually
> agree with 
> him that we will need the num_resets declared for all devices. Why do
> you think 
> this is not the case?
> 
> Regards,
> Matthias
> 

Sorry, I lost Nicolas's email. 

I checked with the mmsys git log with reset controller function.

1. Enric add mmsys reset controller function in [1]/[2].
   => in mtk_mmsys_reset_update(), all mmsys reset offset is
MMSYS_SW0_RST_B (0x140). 

2. After Enric's patch, Rex add sw0_rst_offset in mmsys driver data in
[3].

So, I think sw0_rst_offset is not zero. Instead of only add num_resets
but also need to add sw0_rst_offset for all mmsys. What do you think ?

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=f27ef2856343e2ddc392975d7b15120442e4d7b7
[2]

https://patchwork.kernel.org/project/linux-mediatek/cover/20210825102632.601614-1-enric.balletbo@collabora.com/
[3]

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=62dc30150c06774a8122c52aedd0eddaceaf5940

Regards,
Nancy
> 
> >   };
> >   
> >   static const struct mtk_mmsys_match_data mt8192_mmsys_match_data
> > = {
> > @@ -288,13 +294,19 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >   {
> >   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >   	unsigned long flags;
> > +	u32 offset;
> > +	u32 reg;
> > +
> > +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> > +	id = id % MMSYS_SW_RESET_PER_REG;
> > +	reg = mmsys->data->sw0_rst_offset + offset;
> >   
> >   	spin_lock_irqsave(&mmsys->lock, flags);
> >   
> >   	if (assert)
> > -		mtk_mmsys_update_bits(mmsys, mmsys->data-
> > >sw0_rst_offset, BIT(id), 0, NULL);
> > +		mtk_mmsys_update_bits(mmsys, reg, BIT(id), 0, NULL);
> >   	else
> > -		mtk_mmsys_update_bits(mmsys, mmsys->data-
> > >sw0_rst_offset, BIT(id), BIT(id), NULL);
> > +		mtk_mmsys_update_bits(mmsys, reg, BIT(id), BIT(id),
> > NULL);
> >   
> >   	spin_unlock_irqrestore(&mmsys->lock, flags);
> >   
> > @@ -351,18 +363,6 @@ static int mtk_mmsys_probe(struct
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
> > @@ -384,6 +384,18 @@ static int mtk_mmsys_probe(struct
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
> 
> 

