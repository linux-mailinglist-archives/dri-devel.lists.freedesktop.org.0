Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B55053D8BCB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 12:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5898D6E891;
	Wed, 28 Jul 2021 10:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405D06E852
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 10:32:00 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id l126so3182010oib.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 03:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5FmPty+N5ZcichQzXMzHfN0dH/qL8aGaMzdP7cxzJM=;
 b=n91B40wXj+MhLSjDiE1xwHFb9mfl212Wj+bWA/eWPvF6QbdBKCD5oNL4tEK/WuVLAp
 iPluwU724rN3kdydpz93lb3N11njPjAjtHPH+TzW9xI32VR+nZL0Z7vTW2ABWXJeUC8/
 Znef0KKbCwAC/TYj0uSw7HNonCFylDSoErGLOgNXART5EBt9x78+74Fx+rwm8yZJEA0s
 4Qi+WJfz8z+jSkgpcCI21GbFbIaVK7+cLPgEklVIPRjEKKrZeRnJb/0VCWAi2eqDrIPw
 zOeJvoeOMU+b7Z7Xbb/ljzZOiabMnfkU1wAXacGUP8CWMs01ig6IL9LfatkKLyaA74BK
 NiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5FmPty+N5ZcichQzXMzHfN0dH/qL8aGaMzdP7cxzJM=;
 b=Gmlt7ziTf4KvKGS8NSAblozSqoxXEfrYdrREDy1kxAf3hyheBRprz/PAOa3q3Jekl3
 HyjS1ZHH6Skbo/ThLABEXHeHbo+bqeFphSDy2a+dNMCzHBeZwTfAlmJaWJon2qkhXCmu
 IXOs/1uare0i9z9CzvYjBmecOSAHTPXSUt/wDVSMFEFtBw2sl2fLUCSl7lSbFy2uDOEY
 NUFV7sdsxCgfsTXeuZ7zxVxP1OctPguepOy40/4NrCd282K8ar/2JhT3DD1Ep0PGjduN
 M+Cch2TVFnaElhfHRttgJDIF7PoJvbDuhZymXh0GHlVZW+fWOWtu03J+qaTKrMedp0yb
 wprg==
X-Gm-Message-State: AOAM533lTw5KS74ykIOgBihfafLabXwSxHQRdiporbq4XEE0cPAQMNHQ
 R6LpAVirJGHKLNSI/ID+Vx3KT8n8aRroapkQJPM=
X-Google-Smtp-Source: ABdhPJysV5Oj8jZdYHs2pQ2NNGU6Sd68SOf29TWzZF3jvR4KuBHo9ZG0N8NnGMbjNROfeV3WTqLcT9xSzy6V1x+8dqA=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr17712844oif.47.1627468319411; 
 Wed, 28 Jul 2021 03:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-10-nancy.lin@mediatek.com>
 <CAFqH_53bnNvjGjZ2S8oyAx2t0if-YpQyZcb9sRapG2q21X4fGw@mail.gmail.com>
 <692eeb1314da94e28ccc8722b94c7ce8cae6c880.camel@mediatek.com>
In-Reply-To: <692eeb1314da94e28ccc8722b94c7ce8cae6c880.camel@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 28 Jul 2021 12:31:47 +0200
Message-ID: <CAFqH_51k9wGgAUmFCkx2M9Nbefzxw0rBLTmQwkXzEyOFVKwuJA@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] soc: mediatek: mmsys: Add reset controller
 support for MT8195 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nancy,

Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dc., 28 de jul.
2021 a les 8:01:
>
> Hi Enric,
>
> Thanks for your review.
>
> On Fri, 2021-07-23 at 12:57 +0200, Enric Balletbo Serra wrote:
> > Hi Nancy,
> >
> > Thank you for your patch.
> >
> > Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de
> > jul.
> > 2021 a les 11:46:
> > >
> > > Among other features the mmsys driver should implement a reset
> > > controller to be able to reset different bits from their space.
> > >
> >
> > I'm working on a series that does the same, it should be nice if we
> > can coordinate [1]
> >
> > [1]
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=515355__;!!CTRNKA9wMg0ARbw!xP6Ko9hF-3KasGgr7-8Aby_tCwiU2M6gFBAngDLVcJjzooj-MEeTcNG8cf2e9wGb$
> >
> >
> OK, I will add this series to my reference base in the next patch
> revision.
>
> > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > ---
> > >  drivers/soc/mediatek/mt8195-mmsys.h |  1 +
> > >  drivers/soc/mediatek/mtk-mmsys.c    | 77
> > > +++++++++++++++++++++++++++++
> > >  drivers/soc/mediatek/mtk-mmsys.h    |  1 +
> > >  3 files changed, 79 insertions(+)
> > >
> > > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > > b/drivers/soc/mediatek/mt8195-mmsys.h
> > > index 4bdb2087250c..a7f6e275bfe5 100644
> > > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > > @@ -154,6 +154,7 @@
> > >  #define DISP_DP_INTF0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT     (1
> > > << 0)
> > >  #define DISP_DP_INTF0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT       (2
> > > << 0)
> > >
> > > +#define MT8195_VDO1_SW0_RST_B           0x1d0
> > >  #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD        0xe30
> > >  #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD        0xe40
> > >  #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD        0xe50
> > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > > b/drivers/soc/mediatek/mtk-mmsys.c
> > > index d0f4a407f8f8..1ae04efeadab 100644
> > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > @@ -4,10 +4,12 @@
> > >   * Author: James Liao <jamesjj.liao@mediatek.com>
> > >   */
> > >
> > > +#include <linux/delay.h>
> > >  #include <linux/device.h>
> > >  #include <linux/io.h>
> > >  #include <linux/of_device.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/reset-controller.h>
> > >  #include <linux/soc/mediatek/mtk-mmsys.h>
> > >
> > >  #include "mtk-mmsys.h"
> > > @@ -15,6 +17,8 @@
> > >  #include "mt8183-mmsys.h"
> > >  #include "mt8195-mmsys.h"
> > >
> > > +#define MMSYS_SW_RESET_PER_REG 32
> > > +
> > >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > > = {
> > >         .clk_driver = "clk-mt2701-mm",
> > >         .routes = mmsys_default_routing_table,
> > > @@ -65,12 +69,15 @@ static const struct mtk_mmsys_driver_data
> > > mt8195_vdosys1_driver_data = {
> > >         .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > >         .config = mmsys_mt8195_config_table,
> > >         .num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
> > > +       .sw_reset_start = MT8195_VDO1_SW0_RST_B,
> >
> > That change is interesting and I think I should also take it into
> > consideration with my series.
> >
> > >  };
> > >
> > >  struct mtk_mmsys {
> > >         void __iomem *regs;
> > >         struct cmdq_client_reg cmdq_base;
> > >         const struct mtk_mmsys_driver_data *data;
> > > +       spinlock_t lock; /* protects mmsys_sw_rst_b reg */
> >
> > Seems that mmsys_sw_rst_b reg has different names for different SoCs?
> > I mean I know that for MT8173 and MT8183 the register is called
> > mmsys_sw0_rst_b but looks like for MT8195 the name is vdo1_sw0_rst_b?
> > So maybe we should update this comment to be more generic.
> >
> Yes, the name of MT8195 vdosys1 sw reset is called VDOSYS1_SW0_RST_B
> and the name of vdosys0 sw reset is called GLOBAL0_SW0_RST_B. They have
> a different name. Maybe we can change the comment to "protects mmsys sw
> reset reg".
>
> > >
>
> > > +       struct reset_controller_dev rcdev;
> > >  };
> > >
> > >  void mtk_mmsys_ddp_connect(struct device *dev,
> > > @@ -148,6 +155,63 @@ void mtk_mmsys_ddp_config(struct device *dev,
> > > enum mtk_mmsys_config_type config,
> > >  }
> > >  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
> > >
> > > +static int mtk_mmsys_reset_update(struct reset_controller_dev
> > > *rcdev, unsigned long id,
> > > +                                 bool assert)
> > > +{
> > > +       struct mtk_mmsys *mmsys = container_of(rcdev, struct
> > > mtk_mmsys, rcdev);
> > > +       unsigned long flags;
> > > +       u32 reg;
> > > +       int i;
> > > +       u32 offset;
> > > +
> > > +       offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> > > +       id = 1 << (id % MMSYS_SW_RESET_PER_REG);
> > > +
> > > +       spin_lock_irqsave(&mmsys->lock, flags);
> > > +
> > > +       reg = readl_relaxed(mmsys->regs + mmsys->data-
> > > >sw_reset_start + offset);
> > > +
> > > +       if (assert)
> > > +               reg &= ~BIT(id);
> > > +       else
> > > +               reg |= BIT(id);
> > > +
> > > +       writel_relaxed(reg, mmsys->regs + mmsys->data-
> > > >sw_reset_start + offset);
> > > +
> > > +       spin_unlock_irqrestore(&mmsys->lock, flags);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int mtk_mmsys_reset_assert(struct reset_controller_dev
> > > *rcdev, unsigned long id)
> > > +{
> > > +       return mtk_mmsys_reset_update(rcdev, id, true);
> > > +}
> > > +
> > > +static int mtk_mmsys_reset_deassert(struct reset_controller_dev
> > > *rcdev, unsigned long id)
> > > +{
> > > +       return mtk_mmsys_reset_update(rcdev, id, false);
> > > +}
> > > +
> > > +static int mtk_mmsys_reset(struct reset_controller_dev *rcdev,
> > > unsigned long id)
> > > +{
> > > +       int ret;
> > > +
> > > +       ret = mtk_mmsys_reset_assert(rcdev, id);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       usleep_range(1000, 1100);
> > > +
> >
> > One question that I received in my series, and I couldn't answer
> > because I don't have the datasheet, is if
> > is this known to be enough for all IP cores that can be reset by this
> > controller? Is this time specified in the datasheet?
>
> It only takes few cycles for the reset. The 1000us is enough for the
> reset to take effect.
>

Saying enough looks to me that 1000us is a random number, is there any
specific real number in the datasheet?

Note that I'm not against it, just want to make sure the number makes sense.


> > > +       return mtk_mmsys_reset_deassert(rcdev, id);
> > > +}
> > > +
> > > +static const struct reset_control_ops mtk_mmsys_reset_ops = {
> > > +       .assert = mtk_mmsys_reset_assert,
> > > +       .deassert = mtk_mmsys_reset_deassert,
> > > +       .reset = mtk_mmsys_reset,
> > > +};
> > > +
> > >  static int mtk_mmsys_probe(struct platform_device *pdev)
> > >  {
> > >         struct device *dev = &pdev->dev;
> > > @@ -174,6 +238,19 @@ static int mtk_mmsys_probe(struct
> > > platform_device *pdev)
> > >         if (ret)
> > >                 dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> > >  #endif
> > > +
> > > +       spin_lock_init(&mmsys->lock);
> > > +
> > > +       mmsys->rcdev.owner = THIS_MODULE;
> > > +       mmsys->rcdev.nr_resets = 64;
> >
> > Is the number of resets 64 for MT8195? I think is 32 for MT8173 and
> > MT8183. Can you confirm?
> >
> > Thanks,
> >   Enric
> >
> The number of resets in MT8195 vdosys1 is 64 (43 resets are used, 21
> are not used).
>

Ok, thanks for the information.

> > > +       mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> > > +       mmsys->rcdev.of_node = pdev->dev.of_node;
> > > +       ret = devm_reset_controller_register(&pdev->dev, &mmsys-
> > > >rcdev);
> > > +       if (ret) {
> > > +               dev_err(&pdev->dev, "Couldn't register mmsys reset
> > > controller: %d\n", ret);
> > > +               return ret;
> > > +       }
> > > +
> > >         platform_set_drvdata(pdev, mmsys);
> > >
> > >         clks = platform_device_register_data(&pdev->dev, mmsys-
> > > >data->clk_driver,
> > > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > > b/drivers/soc/mediatek/mtk-mmsys.h
> > > index 084b1f5f3c88..cc57c3895c51 100644
> > > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > > @@ -87,6 +87,7 @@ struct mtk_mmsys_driver_data {
> > >         const unsigned int num_routes;
> > >         const struct mtk_mmsys_config *config;
> > >         const unsigned int num_configs;
> > > +       u32 sw_reset_start;
> > >  };
> > >
> > >  /*
> > > --
> > > 2.18.0
> > >
