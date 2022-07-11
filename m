Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9349856D469
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 07:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A20C10EC97;
	Mon, 11 Jul 2022 05:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9500811A352
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 05:53:00 +0000 (UTC)
X-UUID: e3c1c3db69ba4d1699447d7170d07ee2-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:dc5af464-2796-4d8f-a62d-f35428f31708, OB:0,
 LO
 B:10,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:50
X-CID-INFO: VERSION:1.1.8, REQID:dc5af464-2796-4d8f-a62d-f35428f31708, OB:0,
 LOB:
 10,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:50
X-CID-META: VersionHash:0f94e32, CLOUDID:3e381187-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:e85d7af3f061,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: e3c1c3db69ba4d1699447d7170d07ee2-20220711
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 312251192; Mon, 11 Jul 2022 13:52:53 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Jul 2022 13:52:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jul 2022 13:52:51 +0800
Message-ID: <632d03e8773520faf0eba3bb7c716435b54b6794.camel@mediatek.com>
Subject: Re: [PATCH v24 04/10] soc: mediatek: add mtk_mmsys_update_bits API
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Mon, 11 Jul 2022 13:52:49 +0800
In-Reply-To: <d1a93418-587b-a03d-ed9b-01646345deeb@gmail.com>
References: <20220622130824.29143-1-nancy.lin@mediatek.com>
 <20220622130824.29143-5-nancy.lin@mediatek.com>
 <d1a93418-587b-a03d-ed9b-01646345deeb@gmail.com>
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

On Fri, 2022-07-08 at 17:34 +0200, Matthias Brugger wrote:
> 
> On 22/06/2022 15:08, Nancy.Lin wrote:
> > Add mtk_mmsys_update_bits API. Simplify code for update  mmsys reg.
> > It is a preparation for adding support for mmsys config API.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Tested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 37 +++++++++++++------------
> > -------
> >   1 file changed, 15 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index a74c86197d6a..ca5bf07114fa 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -192,22 +192,27 @@ static int
> > mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> >   	return -EINVAL;
> >   }
> >   
> > +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32
> > offset, u32 mask, u32 val)
> > +{
> > +	u32 tmp;
> > +
> > +	tmp = readl_relaxed(mmsys->regs + offset);
> > +	tmp = (tmp & ~mask) | val;
> > +	writel_relaxed(tmp, mmsys->regs + offset);
> > +}
> > +
> >   void mtk_mmsys_ddp_connect(struct device *dev,
> >   			   enum mtk_ddp_comp_id cur,
> >   			   enum mtk_ddp_comp_id next)
> >   {
> >   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> > -	u32 reg;
> >   	int i;
> >   
> >   	for (i = 0; i < mmsys->data->num_routes; i++)
> > -		if (cur == routes[i].from_comp && next ==
> > routes[i].to_comp) {
> > -			reg = readl_relaxed(mmsys->regs +
> > routes[i].addr);
> > -			reg &= ~routes[i].mask;
> > -			reg |= routes[i].val;
> > -			writel_relaxed(reg, mmsys->regs +
> > routes[i].addr);
> > -		}
> > +		if (cur == routes[i].from_comp && next ==
> > routes[i].to_comp)
> > +			mtk_mmsys_update_bits(mmsys, routes[i].addr,
> > routes[i].mask,
> > +					      routes[i].val);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> >   
> > @@ -217,15 +222,11 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >   {
> >   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> > -	u32 reg;
> >   	int i;
> >   
> >   	for (i = 0; i < mmsys->data->num_routes; i++)
> > -		if (cur == routes[i].from_comp && next ==
> > routes[i].to_comp) {
> > -			reg = readl_relaxed(mmsys->regs +
> > routes[i].addr);
> > -			reg &= ~routes[i].mask;
> > -			writel_relaxed(reg, mmsys->regs +
> > routes[i].addr);
> > -		}
> > +		if (cur == routes[i].from_comp && next ==
> > routes[i].to_comp)
> > +			mtk_mmsys_update_bits(mmsys, routes[i].addr,
> > routes[i].mask, 0);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >   
> > @@ -234,18 +235,10 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >   {
> >   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >   	unsigned long flags;
> > -	u32 reg;
> >   
> >   	spin_lock_irqsave(&mmsys->lock, flags);
> >   
> > -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> > -
> > -	if (assert)
> > -		reg &= ~BIT(id);
> > -	else
> > -		reg |= BIT(id);
> > -
> > -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> > +	mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset,
> > BIT(id), assert ? 0 : BIT(id));
> 
> Let's be this a normal if (assert) else but calling
> mtk_mmsys_update_bits().
> 
> Other then that patch looks good.
> 
> Matthias
> 
OK, I will change to

if (asssert)
    mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id),
0);
else
    mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id),
BIT(id));

BRs,
Nancy

> >   
> >   	spin_unlock_irqrestore(&mmsys->lock, flags);
> >   

