Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699D5544C9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 11:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF4A10E357;
	Wed, 22 Jun 2022 09:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9275210E357
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 09:10:30 +0000 (UTC)
X-UUID: b3ef4931bde04d52bc9f167795624ef0-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:e75d7dcb-cd20-4817-b6f4-7bdfc6a1aef3, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:b14ad71, CLOUDID:92732a38-5e4b-44d7-80b2-bb618cb09d29,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: b3ef4931bde04d52bc9f167795624ef0-20220622
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1180519457; Wed, 22 Jun 2022 17:10:26 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 22 Jun 2022 17:10:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 17:10:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 17:10:25 +0800
Message-ID: <71bcd318d1bc3c730cb2587bf98d81207eafa8d6.camel@mediatek.com>
Subject: Re: [PATCH v23 04/10] soc: mediatek: add mtk_mmsys_update_bits API
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux@roeck-us.net>
Date: Wed, 22 Jun 2022 17:10:25 +0800
In-Reply-To: <9265790479c0822796ec7cd02ae6304014edde33.camel@mediatek.com>
References: <20220620091801.27680-1-nancy.lin@mediatek.com>
 <20220620091801.27680-5-nancy.lin@mediatek.com>
 <9265790479c0822796ec7cd02ae6304014edde33.camel@mediatek.com>
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

On Wed, 2022-06-22 at 11:01 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Mon, 2022-06-20 at 17:17 +0800, Nancy.Lin wrote:
> > Add mtk_mmsys_update_bits API. Simplify code for update  mmsys reg.
> > It is a preparation for adding support for mmsys config API.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Tested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-mmsys.c | 36 ++++++++++++++--------------
> > ----
> >  1 file changed, 16 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index a74c86197d6a..b7c7cd469343 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -192,22 +192,27 @@ static int
> > mtk_mmsys_find_match_drvdata(struct
> > mtk_mmsys *mmsys,
> >  	return -EINVAL;
> >  }
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
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >  			   enum mtk_ddp_comp_id cur,
> >  			   enum mtk_ddp_comp_id next)
> >  {
> >  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >  	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> > -	u32 reg;
> >  	int i;
> >  
> >  	for (i = 0; i < mmsys->data->num_routes; i++)
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
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> >  
> > @@ -217,15 +222,11 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >  {
> >  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >  	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> > -	u32 reg;
> >  	int i;
> >  
> >  	for (i = 0; i < mmsys->data->num_routes; i++)
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
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >  
> > @@ -234,18 +235,13 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >  {
> >  	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >  	unsigned long flags;
> > -	u32 reg;
> >  
> >  	spin_lock_irqsave(&mmsys->lock, flags);
> >  
> > -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> > -
> >  	if (assert)
> > -		reg &= ~BIT(id);
> > +		mtk_mmsys_update_bits(mmsys, mmsys->data-
> > > sw0_rst_offset, BIT(id), 0);
> > 
> >  	else
> > -		reg |= BIT(id);
> > -
> > -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> > +		mtk_mmsys_update_bits(mmsys, mmsys->data-
> > > sw0_rst_offset, BIT(id), BIT(id));
> 
> More simple code:
> mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id),
> assert ? 0 : BIT(id));
> 
> After this modification,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
OK, I will fix it.

BRs,
Nancy

> >  
> >  	spin_unlock_irqrestore(&mmsys->lock, flags);
> >  
> 
> 

