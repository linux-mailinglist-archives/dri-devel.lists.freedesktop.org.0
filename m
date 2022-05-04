Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E20519389
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 03:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D9C10E478;
	Wed,  4 May 2022 01:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D417710E478
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 01:36:25 +0000 (UTC)
X-UUID: 7b76a2315ff4434e95a226aa64066ef7-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:cee8f844-9481-479e-bc83-c47e6495e2cb, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:7d71992f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7b76a2315ff4434e95a226aa64066ef7-20220504
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1770905408; Wed, 04 May 2022 09:36:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 4 May 2022 09:36:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 May 2022 09:36:18 +0800
Message-ID: <7707ae9a9e5ac1e860e0620b9e1009be1425c9cc.camel@mediatek.com>
Subject: Re: [PATCH v19 06/25] soc: mediatek: add mtk_mmsys_write_reg API
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
Date: Wed, 4 May 2022 09:36:18 +0800
In-Reply-To: <c6be6d95-35f0-fb62-2d10-53f974ba67e4@collabora.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-7-nancy.lin@mediatek.com>
 <c6be6d95-35f0-fb62-2d10-53f974ba67e4@collabora.com>
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

Hi Angelo,

Thanks for the review.

On Tue, 2022-05-03 at 14:19 +0200, AngeloGioacchino Del Regno wrote:
> Il 03/05/22 12:23, Nancy.Lin ha scritto:
> > Add mtk_mmsys_write_reg API. Simplify code for writing mmsys reg.
> > It is a preparation for adding support for mmsys config API.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 35 ++++++++++++++-------------
> > -----
> >   1 file changed, 15 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index ab3c5cbb0175..3e2e5e3f721d 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -191,22 +191,26 @@ static int
> > mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> >   	return -EINVAL;
> >   }
> >   
> > +static void mtk_mmsys_write_reg(struct mtk_mmsys *mmsys, u32
> > offset, u32 mask, u32 val)
> > +{
> > +	u32 tmp;
> > +
> > +	tmp = readl_relaxed(mmsys->regs + offset);
> > +	tmp = (tmp & ~mask) | val;
> > +	writel_relaxed(tmp, mmsys->regs + offset);
> > +}
> > +
> 
> Uhm... this is the equivalent of regmap_update_bits(): I fear that
> calling this
> mtk_mmsys_write_reg() may lead to confusion.
> 
> I think that a more appropriate name would be mtk_mmsys_update_bits()
> or
> something similar, recalling that this is not just a register write,
> but
> a RMW.
> 
> Regards,
> Angelo

Thanks for your suggestion. I will refine the function name in the next
revision.

Regards,
Nancy

