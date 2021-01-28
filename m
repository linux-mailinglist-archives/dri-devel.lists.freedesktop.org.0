Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAC030716D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C487C6E93F;
	Thu, 28 Jan 2021 08:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FC046E93F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 08:28:55 +0000 (UTC)
X-UUID: 5397cb3bff6a4caaa801396a2e088ba8-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xXCb6L2ZXCrCP94s27k1hE1RsAxmrD2LYXcFbF5uA0E=; 
 b=RiyGXxxpZEBLKoq9ur0bn2LeFudUXgsHBCNRK+Lk6nZ9IUh9+8lTPzaIKrrNTaSdj7hfGjEVMb0aLX9W3I7Vx+KfDDdjh+hJuKqIxCEMYYZBcF+wNGhoPFRR8XA1TwLqFs7huugE14N1BOpLDqJYRH7QTxR7QpU+ILMZPxGKFpw=;
X-UUID: 5397cb3bff6a4caaa801396a2e088ba8-20210128
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1201663129; Thu, 28 Jan 2021 16:28:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 16:28:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 16:28:44 +0800
Message-ID: <1611822524.23925.4.camel@mtksdaap41>
Subject: Re: [PATCH v11 7/9] drm/mediatek: enable dither function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 16:28:44 +0800
In-Reply-To: <CAJMQK-h1_d1+SpxMC8LGPJK=X9HHoJ_ueFzV2Sq44buCiaXFUA@mail.gmail.com>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-8-hsinyi@chromium.org>
 <1611819766.16091.4.camel@mtksdaap41> <1611820770.1947.8.camel@mhfsdcap03>
 <1611821233.18369.4.camel@mtksdaap41> <1611821396.1947.10.camel@mhfsdcap03>
 <CAJMQK-h1_d1+SpxMC8LGPJK=X9HHoJ_ueFzV2Sq44buCiaXFUA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 16FFF3C473B8505D6216BE76A3CFAA9D7D5ECBF80795522F50D2FF9FE06560AF2000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David
 Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-01-28 at 16:18 +0800, Hsin-Yi Wang wrote:
> On Thu, Jan 28, 2021 at 4:10 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > On Thu, 2021-01-28 at 16:07 +0800, CK Hu wrote:
> > > On Thu, 2021-01-28 at 15:59 +0800, Yongqiang Niu wrote:
> > > > On Thu, 2021-01-28 at 15:42 +0800, CK Hu wrote:
> > > > > Hi, Hsin-Yi:
> > > > >
> > > > > On Thu, 2021-01-28 at 15:28 +0800, Hsin-Yi Wang wrote:
> > > > > > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > >
> > > > > > for 5 or 6 bpc panel, we need enable dither function
> > > > > > to improve the display quality
> > > > > >
> > > > > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++++++++++++-
> > > > > >  1 file changed, 43 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > index 8173f709272be..e85625704d611 100644
> > > > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > @@ -53,7 +53,9 @@
> > > > > >  #define DITHER_EN                              BIT(0)
> > > > > >  #define DISP_DITHER_CFG                                0x0020
> > > > > >  #define DITHER_RELAY_MODE                      BIT(0)
> > > > > > +#define DITHER_ENGINE_EN                       BIT(1)
> > > > > >  #define DISP_DITHER_SIZE                       0x0030
> > > > > > +#define DITHER_REG(idx)                                (0x100 + (idx) * 4)
> > > > > >
> > > > > >  #define LUT_10BIT_MASK                         0x03ff
> > > > > >
> > > > > > @@ -313,8 +315,48 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
> > > > > >  {
> > > > > >         struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > > > > >
> > > > > > +       bool enable = false;
> > > > > > +
> > > > > > +       /* default value for dither reg 5 to 14 */
> > > > > > +       const u32 dither_setting[] = {
> > > > > > +               0x00000000, /* 5 */
> > > > > > +               0x00003002, /* 6 */
> > > > > > +               0x00000000, /* 7 */
> > > > > > +               0x00000000, /* 8 */
> > > > > > +               0x00000000, /* 9 */
> > > > > > +               0x00000000, /* 10 */
> > > > > > +               0x00000000, /* 11 */
> > > > > > +               0x00000011, /* 12 */
> > > > > > +               0x00000000, /* 13 */
> > > > > > +               0x00000000, /* 14 */
> > > > >
> > > > > Could you explain what is this?
> > > >
> > > > this is dither 5 to dither 14 setting
> > > > this will be useless, we just need set dither 5 and dither 7 like
> > > > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_5);
> > > > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_7);
> > > > other value is same with hardware default value.
> > > >
> > > >
> > > > >
> > > > > > +       };
> > > > > > +
> > > > > > +       if (bpc == 5 || bpc == 6) {
> > > > > > +               enable = true;
> > > > > > +               mtk_ddp_write(cmdq_pkt,
> > > > > > +                             DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_NEW_BIT_MODE,
> > > > > > +                             &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> > > > > > +               mtk_ddp_write(cmdq_pkt,
> > > > > > +                             DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> > > > > > +                             DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > > > >
> > > > > This result in 0x50505050, but previous version is 0x50504040, so this
> > > > > version is correct and previous version is incorrect?
> > > >
> > > > the new version set r g b 3 channel same, seams more reasonable
> > > >
> > > >
> > >
> > > So all the setting of DISP_DITHER_5, DISP_DITHER_7, DISP_DITHER_15,
> > > DISP_DITHER_16 is identical to mtk_dither_set(), so call
> > > mtk_dither_set() instead of duplication here.
> > >
> >
> > dither enable set in mtk_dither_set is
> > mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, CFG);
> >
> > that is different 8183 and mt8192.
> > mt8173 dither enable in gamma is bit2
> > mt8183 and mt8192 dither engine enable is bit 1
> >
> >
> 
> We can still call mtk_dither_set() for bpc is 5 or 6 here, though it
> will be set to bit2,
> but later in mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN :
> DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG); it
> will be correct back to bit 1.
> 
> Is this reasonable?

Looks weird. Maybe pass some information into mtk_dither_set() to set
DISP_DITHERING correctly. 

I find one thing need to be fixed. CFG should be lower case.

Regards,
CK

> 
> > > Regards,
> > > CK
> > > > >
> > > > > Regards,
> > > > > CK
> > > > >
> > > > > > +                             &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> > > > > > +       }
> > > > > > +
> > > > > > +
> > > > > > +       if (enable) {
> > > > > > +               u32 idx;
> > > > > > +
> > > > > > +               for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
> > > > > > +                       mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
> > > > > > +                                     DITHER_REG(idx + 5));
> > > > > > +       }
> > > > > > +
> > > > > >         mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> > > > > > -       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > > +        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > >  }
> > > > > >
> > > > > >  static void mtk_dither_start(struct device *dev)
> > > > >
> > > > >
> > > >
> > > >
> > >
> > >
> >

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
