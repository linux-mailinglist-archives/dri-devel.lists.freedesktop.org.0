Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE625A0264
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEBEC505C;
	Wed, 24 Aug 2022 19:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A992B00E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 12:50:37 +0000 (UTC)
X-UUID: 925c46a5626b47498202442967aa0f65-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EQD9gzPecKAX3WUKFQ5gMqHbRvP/px4o2I2t3g4HB8E=; 
 b=OiT+Txk5kdDVXfPvOyWY/X7A2D6LElJLb7v2qNUv7K4EhGZN0eDm+w/MQuVp8lnsDZyoDMQ+Ex9bS60udUrmn7VSAQ6ORCfgsa8DrlLIxrZxw5rK15GQVrIKVVUhdkkJH2vobcSF2IJnL/2aufGgMZiW0OWdut/KbJKz1kEC260=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:bed4eb79-552b-43b8-81d3-a2616d4979fe, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:54
X-CID-INFO: VERSION:1.1.10, REQID:bed4eb79-552b-43b8-81d3-a2616d4979fe, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_H
 amU,ACTION:release,TS:54
X-CID-META: VersionHash:84eae18, CLOUDID:b38d6cc9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:6270cffab819,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 925c46a5626b47498202442967aa0f65-20220822
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 313314746; Mon, 22 Aug 2022 20:50:33 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 20:50:32 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Aug 2022 20:50:31 +0800
Message-ID: <49fcb1b354199b56279ecf1ccb90d48361de796d.camel@mediatek.com>
Subject: Re: [PATCH v2,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 22 Aug 2022 20:50:45 +0800
In-Reply-To: <20220819185400.aokd53xln6rmc3xk@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
 <20220819185400.aokd53xln6rmc3xk@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-08-19 at 14:54 -0400, Nícolas F. R. A. Prado wrote:
> Hi Xinlei,
> 
> On Fri, Aug 05, 2022 at 05:57:40PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add mmsys func to manipulate dpi output format config for MT8186.
> 
> func -> function
> config -> configuration
> 
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> 
> Same thing about the co-developed-by.
> 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > ---
> >  drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
> >  drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
> >  include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
> >  3 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > b/drivers/soc/mediatek/mt8186-mmsys.h
> > index eb1ad9c37a9c..620c062e4893 100644
> > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > @@ -3,6 +3,7 @@
> >  #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> >  #define __SOC_MEDIATEK_MT8186_MMSYS_H
> >  
> > +#define MT8186_DPI_OUTPUT_FORMAT		0X400
> 
> 0x400
> 
> (lowercase "x")
> 
> >  #define MT8186_MMSYS_OVL_CON			0xF04
> >  #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> >  #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 9bbf0103b225..0e71a3296046 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -252,6 +252,14 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >  
> > +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32
> > val,
> 
> confing -> config
> 
> But I'd add something to the name to indicate it handles specifically
> the
> format:
> 
> mtk_mmsys_ddp_dpi_fmt_config
> 
> Thanks,
> Nícolas

Hi Nícolas:

Thanks for your careful review.
I will correct it in the next version:
1. Modify key nouns in the description;
2. Modify the label of jitao to Co-developed-by;
3. Macro definition address lowercase problem and function naming.

If there are no other questions, I will send out the second edition in
the near future.

Best Regards!
xinlei

