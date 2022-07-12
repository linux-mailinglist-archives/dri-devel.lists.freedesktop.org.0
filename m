Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F188571125
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 06:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6212F10F77D;
	Tue, 12 Jul 2022 04:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE45510E074
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 04:16:37 +0000 (UTC)
X-UUID: e3ae4dfafe8e413e81d3d4da97a65d5a-20220712
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:47b0542e-b3ab-4d3b-808f-efa5539b97ca, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:51
X-CID-INFO: VERSION:1.1.8, REQID:47b0542e-b3ab-4d3b-808f-efa5539b97ca, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:51
X-CID-META: VersionHash:0f94e32, CLOUDID:e8f20764-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:fa3c282ba099,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: e3ae4dfafe8e413e81d3d4da97a65d5a-20220712
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2142321456; Tue, 12 Jul 2022 12:16:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Jul 2022 12:16:30 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jul 2022 12:16:29 +0800
Message-ID: <a31e232115019f6ec670c4955ae8bde7696918ac.camel@mediatek.com>
Subject: Re: [PATCH 1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <yongqiang.niu@mediatek.com>, <enric.balletbo@collabora.com>
Date: Tue, 12 Jul 2022 12:17:00 +0800
In-Reply-To: <65d390ab-7f80-8bd4-66f5-442c46da4f00@gmail.com>
References: <1656645344-12062-1-git-send-email-xinlei.lee@mediatek.com>
 <1656645344-12062-2-git-send-email-xinlei.lee@mediatek.com>
 <65d390ab-7f80-8bd4-66f5-442c46da4f00@gmail.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-07-06 at 16:20 +0200, Matthias Brugger wrote:
> 
> On 01/07/2022 05:15, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add mmsys func to manipulate dpi output format config for MT8186.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
> >   drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
> >   include/linux/soc/mediatek/mtk-mmsys.h | 2 ++
> >   3 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > b/drivers/soc/mediatek/mt8186-mmsys.h
> > index eb1ad9c37a9c..0b450b00b829 100644
> > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > @@ -3,6 +3,7 @@
> >   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> >   #define __SOC_MEDIATEK_MT8186_MMSYS_H
> >   
> > +#define MT8186_MMSYS_DUMMY0			0X400
> 
> I don't have access to the datasheet, but I really wonder if it's
> really called 
> dummy0. If so, you would need to explain in more detail in the commit
> message.
> 
> Regards,
> Matthias
> 
> >   #define MT8186_MMSYS_OVL_CON			0xF04
> >   #define MT8186_MMSYS_OVL0_CON_MASK			0x3
> >   #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 2b0b805c65dd..de3f11cb931f 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -252,6 +252,14 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >   
> > +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32
> > val,
> > +			       struct cmdq_pkt *cmdq_pkt)
> > +{
> > +	mtk_mmsys_update_bits(dev_get_drvdata(dev),
> > MT8186_MMSYS_DUMMY0, mask,
> > +			      val, cmdq_pkt);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_confing);
> > +
> >   void mtk_mmsys_merge_async_config(struct device *dev, int idx,
> > int width, int height,
> >   				  struct cmdq_pkt *cmdq_pkt)
> >   {
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 343e093f0fc3..40c538c0664b 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -90,4 +90,6 @@ void mtk_mmsys_mixer_in_config(struct device
> > *dev, int idx, bool alpha_sel, u16
> >   void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap,
> >   				     struct cmdq_pkt *cmdq_pkt);
> >   
> > +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32
> > val,
> > +			       struct cmdq_pkt *cmdq_pkt);
> >   #endif /* __MTK_MMSYS_H */

Hi Matthias

Thank you for your suggestion.
I'm sorry for not explaining what this register does in detail, I'll
explain it in the next commit message.

Best Regards!
xinlei

