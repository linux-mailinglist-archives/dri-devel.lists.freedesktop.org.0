Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B49B438D60
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 04:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4115F89D1D;
	Mon, 25 Oct 2021 02:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC8289D1D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 02:10:28 +0000 (UTC)
X-UUID: ab96db6f3e4c4feaa6135842c07fc47c-20211025
X-UUID: ab96db6f3e4c4feaa6135842c07fc47c-20211025
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 996132421; Mon, 25 Oct 2021 10:10:25 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 25 Oct 2021 10:10:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 10:10:24 +0800
Message-ID: <6f55c349e1325635198795d1a67c302bdcadd9ac.camel@mediatek.com>
Subject: Re: [PATCH v6 12/16] drm/mediatek: add display merge api support
 for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Mon, 25 Oct 2021 10:10:24 +0800
In-Reply-To: <CAAOTY_-wwXHMq4fB9wNGub=Sh-Ep3aOJJPaNTch2zebhZzEvkA@mail.gmail.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-13-nancy.lin@mediatek.com>
 <CAAOTY_-wwXHMq4fB9wNGub=Sh-Ep3aOJJPaNTch2zebhZzEvkA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Thanks for the review.

On Thu, 2021-10-21 at 23:02 +0800, Chun-Kuang Hu wrote:
> > 

> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年10月4日 週一 下午2:21寫道：
> > 
> > Add merge new API.
> > 1. Vdosys1 merge1~merge4 support HW mute function, so add unmute
> > API.
> > 2. Add merge new advance config API. The original merge API is
> >    mtk_ddp_comp_funcs function prototype. The API interface
> > parameters
> >    cannot be modified, so add a new config API for extension.
> > 3. Add merge enable/disable API for cmdq support. The ovl_adaptor
> > merges
> >    are configured with each drm plane update. Need to
> > enable/disable
> >    merge with cmdq making sure all the settings taken effect in the
> >    same vblank.
> 
> Separate this patch into three patches.
> 
OK.

> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  6 ++
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 86
> > ++++++++++++++++++++---
> >  2 files changed, 82 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index b3a372cab0bd..2446ad0a4977 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -63,6 +63,12 @@ void mtk_merge_config(struct device *dev,
> > unsigned int width,
> >                       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> >  void mtk_merge_start(struct device *dev);
> >  void mtk_merge_stop(struct device *dev);
> > +void mtk_merge_advance_config(struct device *dev, unsigned int
> > l_w, unsigned int r_w,
> > +                             unsigned int h, unsigned int
> > vrefresh, unsigned int bpc,
> > +                             struct cmdq_pkt *cmdq_pkt);
> > +void mtk_merge_unmute(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt);
> > +void mtk_merge_enable(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt);
> > +void mtk_merge_disable(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt);
> > 
> >  void mtk_ovl_bgclr_in_on(struct device *dev);
> >  void mtk_ovl_bgclr_in_off(struct device *dev);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > index b05e1df79c3d..696bb948352b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > @@ -17,6 +17,7 @@
> >  #define DISP_REG_MERGE_CTRL            0x000
> >  #define MERGE_EN                               1
> >  #define DISP_REG_MERGE_CFG_0           0x010
> > +#define DISP_REG_MERGE_CFG_1           0x014
> >  #define DISP_REG_MERGE_CFG_4           0x020
> >  #define DISP_REG_MERGE_CFG_10          0x038
> >  /* no swap */
> > @@ -25,9 +26,12 @@
> >  #define DISP_REG_MERGE_CFG_12          0x040
> >  #define CFG_10_10_1PI_2PO_BUF_MODE             6
> >  #define CFG_10_10_2PI_2PO_BUF_MODE             8
> > +#define CFG_11_10_1PI_2PO_MERGE                        18
> >  #define FLD_CFG_MERGE_MODE                     GENMASK(4, 0)
> >  #define DISP_REG_MERGE_CFG_24          0x070
> >  #define DISP_REG_MERGE_CFG_25          0x074
> > +#define DISP_REG_MERGE_CFG_26          0x078
> > +#define DISP_REG_MERGE_CFG_27          0x07c
> >  #define DISP_REG_MERGE_CFG_36          0x0a0
> >  #define ULTRA_EN                               BIT(0)
> >  #define PREULTRA_EN                            BIT(4)
> > @@ -54,26 +58,52 @@
> >  #define FLD_PREULTRA_TH_LOW                    GENMASK(15, 0)
> >  #define FLD_PREULTRA_TH_HIGH                   GENMASK(31, 16)
> > 
> > +#define DISP_REG_MERGE_MUTE_0          0xf00
> > +
> >  struct mtk_disp_merge {
> >         void __iomem *regs;
> >         struct clk *clk;
> >         struct clk *async_clk;
> >         struct cmdq_client_reg          cmdq_reg;
> >         bool                            fifo_en;
> > +       bool                            mute_support;
> 
> Align indent of members.
> 
OK.
> >  };
> > 
> >  void mtk_merge_start(struct device *dev)
> > +{
> > +       mtk_merge_enable(dev, NULL);
> > +}
> > +
> > +void mtk_merge_stop(struct device *dev)
> >  {
> >         struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > 
> > -       writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> > +       mtk_merge_disable(dev, NULL);
> >  }
> > 
> > -void mtk_merge_stop(struct device *dev)
> > +void mtk_merge_enable(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt)
> 
> The difference of mtk_merge_enable() and mtk_merge_start() is cmdq
> support, but the naming make them so different. So I would like this
> function name to be mtk_merge_start_cmdq().
> 
OK.
> > +{
> > +       struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > +
> > +       mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> > +                     DISP_REG_MERGE_CTRL);
> > +}
> > +
> > +void mtk_merge_disable(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt)
> 
> Ditto.

OK.
> 
> >  {
> >         struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > 
> > -       writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> > +       mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> > +                     DISP_REG_MERGE_CTRL);
> > +}
> > +
> > +void mtk_merge_unmute(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt)
> 
> I'm not sure whether it's worth to have this function. It seems that
> mtk_merge_enable() imply mtk_merge_unmute(). So I would like to move
> this function into mtk_merge_enable().
> And I would like to mute in mtk_merge_disable() to let register be
> restored.
> 
> Regards,
> Chun-Kuang.
> 
OK. I will remove the unmute API, and move unmute function into merge
start/stop.

> > +{
> > +       struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > +
> > +       if (priv->mute_support)
> > +               mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv-
> > >regs,
> > +                             DISP_REG_MERGE_MUTE_0);
> >  }
> > 
> >  static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
> > @@ -98,12 +128,19 @@ static void mtk_merge_fifo_setting(struct
> > mtk_disp_merge *priv,
> >  void mtk_merge_config(struct device *dev, unsigned int w,
> >                       unsigned int h, unsigned int vrefresh,
> >                       unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> > +{
> > +       mtk_merge_advance_config(dev, w, 0, h, vrefresh, bpc,
> > cmdq_pkt);
> > +}
> > +
> > +void mtk_merge_advance_config(struct device *dev, unsigned int
> > l_w, unsigned int r_w,
> > +                             unsigned int h, unsigned int
> > vrefresh, unsigned int bpc,
> > +                             struct cmdq_pkt *cmdq_pkt)
> >  {
> >         struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> >         unsigned int mode = CFG_10_10_1PI_2PO_BUF_MODE;
> > 
> > -       if (!h || !w) {
> > -               dev_err(dev, "%s: input width(%d) or height(%d) is
> > invalid\n", __func__, w, h);
> > +       if (!h || !l_w) {
> > +               dev_err(dev, "%s: input width(%d) or height(%d) is
> > invalid\n", __func__, l_w, h);
> >                 return;
> >         }
> > 
> > @@ -112,14 +149,41 @@ void mtk_merge_config(struct device *dev,
> > unsigned int w,
> >                 mode = CFG_10_10_2PI_2PO_BUF_MODE;
> >         }
> > 
> > -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv-
> > >regs,
> > +       if (r_w)
> > +               mode = CFG_11_10_1PI_2PO_MERGE;
> > +
> > +       mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg,
> > priv->regs,
> >                       DISP_REG_MERGE_CFG_0);
> > -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv-
> > >regs,
> > +       mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg,
> > priv->regs,
> > +                     DISP_REG_MERGE_CFG_1);
> > +       mtk_ddp_write(cmdq_pkt, h << 16 | (l_w + r_w), &priv-
> > >cmdq_reg, priv->regs,
> >                       DISP_REG_MERGE_CFG_4);
> > -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv-
> > >regs,
> > +       /*
> > +        * DISP_REG_MERGE_CFG_24 is merge SRAM0 w/h
> > +        * DISP_REG_MERGE_CFG_25 is merge SRAM1 w/h.
> > +        * If r_w > 0, the merge is in merge mode (input0 and
> > input1 merge together),
> > +        * the input0 goes to SRAM0, and input1 goes to SRAM1.
> > +        * If r_w = 0, the merge is in buffer mode, the input goes
> > through SRAM0 and
> > +        * then to SRAM1. Both SRAM0 and SRAM1 are set to the same
> > size.
> > +        */
> > +       mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg,
> > priv->regs,
> >                       DISP_REG_MERGE_CFG_24);
> > -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv-
> > >regs,
> > -                     DISP_REG_MERGE_CFG_25);
> > +       if (r_w)
> > +               mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv-
> > >cmdq_reg, priv->regs,
> > +                             DISP_REG_MERGE_CFG_25);
> > +       else
> > +               mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv-
> > >cmdq_reg, priv->regs,
> > +                             DISP_REG_MERGE_CFG_25);
> > +
> > +       /*
> > +        * DISP_REG_MERGE_CFG_26 and DISP_REG_MERGE_CFG_27 is only
> > used in LR merge.
> > +        * Only take effect when the merge is setting to merge
> > mode.
> > +        */
> > +       mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg,
> > priv->regs,
> > +                     DISP_REG_MERGE_CFG_26);
> > +       mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg,
> > priv->regs,
> > +                     DISP_REG_MERGE_CFG_27);
> > +
> >         mtk_ddp_write_mask(cmdq_pkt, SWAP_MODE, &priv->cmdq_reg,
> > priv->regs,
> >                            DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
> >         mtk_ddp_write_mask(cmdq_pkt, mode, &priv->cmdq_reg, priv-
> > >regs,
> > @@ -205,6 +269,8 @@ static int mtk_disp_merge_probe(struct
> > platform_device *pdev)
> >         priv->fifo_en = of_property_read_bool(dev->of_node,
> >                                               "mediatek,merge-fifo-
> > en");
> > 
> > +       priv->mute_support = of_property_read_bool(dev->of_node,
> > +                                                  "mediatek,merge-
> > mute");
> >         platform_set_drvdata(pdev, priv);
> > 
> >         ret = component_add(dev, &mtk_disp_merge_component_ops);
> > --
> > 2.18.0
> > 

