Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D5481BA2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 12:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A05E10E373;
	Thu, 30 Dec 2021 11:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8C110E373
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 11:11:43 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so31870563otu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 03:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Czr881vajn+zMvKnvNarIUGCjt+P/NqfiUXbcHCJi0k=;
 b=xuJ9mGjRXqaLXzsbm2e9UPttIxJdvqpNBLsVbvZ/gHiRJeh+nUrY9VTQ7kjKQ1OSlm
 U129wW/JCMD6n6kRwacYDVHgMt3iSlwHGAlq5pF8JKA83GtBfALyy/5seIC1UPru744D
 XKQwkA7n5pKpRTcRYkFwBhQ2HKafWMOVV28uPBiB8DqgH40LSokBMc1vTavOKSnAiyuQ
 E1OWFzAIDw3wB7e9mOeLNVbXr6cjkcUyf41iOIpFlhMBfwdNKpS/mR2552V4lR/T+9mw
 wx/GKfToib/FNKG4VV1nRY98iq7RnWlMwhSwFNdmoX3Ry63YaUazGlFtYxr6UZkAFs1S
 LSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Czr881vajn+zMvKnvNarIUGCjt+P/NqfiUXbcHCJi0k=;
 b=zPYSny9Sgf8/U2D94r6+zWDHhLNWIp/qP+N5m6P6G2pAAEjWlAqVCW+APIkt7g8O/9
 JW/hCQ7dOA0WhJw6CRYbp0t6eOjDLDGR+iGzfrnASaK0G4BAgx5Azjh0KS+j9L8afSny
 CWR+P3Tt/TxjJO0tNlYhIW1NHk47IKwoXvKLVOQGF53PNkjria3D9Vsxj38AO2MZ7a3G
 YDlBOQW3KSn/badz+qjogzCW2Z4/s/j1Bpl6qTv9bumUT1ejUfS1bsJV1BdXeu8Er94c
 XY81GB5vO7/z5fthKkr/LWUz89bLP0d8JVQF0xpXT3snvd9mXx9J9sAs1aoh2wOB85UP
 Zhow==
X-Gm-Message-State: AOAM531zfWRv7OOjjNcP8XLL8TteMhcMozzKVEsKAQX/HjJyKNJQfZFy
 km431+PmjOlTZ2xWu6/KagaHXE1OHYQoRoeeeaCC3g==
X-Google-Smtp-Source: ABdhPJzPYFci8h/7GlV2vqQ2ZFFuujJK8HBjGtBan2EDPSSGQXym8YGCqHdu/NQAr1+I6sj/Hd++7n+cLFscRdXruiE=
X-Received: by 2002:a9d:51c3:: with SMTP id d3mr21655218oth.152.1640862702517; 
 Thu, 30 Dec 2021 03:11:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Dec 2021 05:11:41 -0600
MIME-Version: 1.0
In-Reply-To: <Ycv5gnWDtosJhwjc@matsya>
References: <20211217150854.2081-1-granquet@baylibre.com>
 <20211217150854.2081-7-granquet@baylibre.com>
 <Ycv5gnWDtosJhwjc@matsya>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Thu, 30 Dec 2021 05:11:41 -0600
Message-ID: <CABnWg9sBdAhjUPnijiwLj-iFP_AHjP06FkzrqEmtXsSeGTYK0Q@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] phy: phy-mtk-dp: Add driver for DP phy
To: Vinod Koul <vkoul@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

Quoting Vinod Koul (2021-12-29 07:00:34)
>
> On 17-12-21, 16:08, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
>
> Pls cc relevant folks on cover so that they know what is going on in the
> series... Is this dependent on rest? It should not and can be sent and
> reviewed separately!
>

Sorry, I'm a bit of a noob...
I've used the get_maintainers.pl script to get the to: and cc: for each patch.
I'll make sure the cover has everyone included in the next revision.

The phy is not dependant on the rest, but this phy cannot be used outside of
the mt8195 Display Port context... as the phy is actually the same IP as the DP.

The DP driver has a functional dependency with the phy, they can be split into
two series as they both merge/compile on their own.

Do you want me to split the series with the phy on one hand the the DP driver
on the other?

> > This is a new driver that supports the integrated DisplayPort phy for
> > mediatek SoCs, especially the mt8195. The phy is integrated into the
> > DisplayPort controller and will be created by the mtk-dp driver. This
> > driver expects a struct regmap to be able to work on the same registers
> > as the DisplayPort controller. It sets the device data to be the struct
> > phy so that the DisplayPort controller can easily work with it.
> >
> > The driver does not have any devicetree bindings because the datasheet
> > does not list the controller and the phy as distinct units.
> >
> > The interaction with the controller can be covered by the configure
> > callback of the phy framework and its displayport parameters.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/phy/mediatek/Kconfig      |   8 ++
> >  drivers/phy/mediatek/Makefile     |   1 +
> >  drivers/phy/mediatek/phy-mtk-dp.c | 219 ++++++++++++++++++++++++++++++
> >  4 files changed, 229 insertions(+)
> >  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8b7a98daf8e05..c44829d8a74df 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6394,6 +6394,7 @@ L:      linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> >  S:   Supported
> >  F:   Documentation/devicetree/bindings/display/mediatek/
> >  F:   drivers/gpu/drm/mediatek/
> > +F:   drivers/phy/mediatek/phy-mtk-dp.c
> >  F:   drivers/phy/mediatek/phy-mtk-hdmi*
> >  F:   drivers/phy/mediatek/phy-mtk-mipi*
> >
> > diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> > index 55f8e6c048ab3..f7ec860590492 100644
> > --- a/drivers/phy/mediatek/Kconfig
> > +++ b/drivers/phy/mediatek/Kconfig
> > @@ -55,3 +55,11 @@ config PHY_MTK_MIPI_DSI
> >       select GENERIC_PHY
> >       help
> >         Support MIPI DSI for Mediatek SoCs.
> > +
> > +config PHY_MTK_DP
> > +     tristate "MediaTek DP-PHY Driver"
> > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> > +     depends on OF
> > +     select GENERIC_PHY
> > +     help
> > +       Support DisplayPort PHY for Mediatek SoCs.
> > diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> > index ace660fbed3a1..4ba1e06504346 100644
> > --- a/drivers/phy/mediatek/Makefile
> > +++ b/drivers/phy/mediatek/Makefile
> > @@ -3,6 +3,7 @@
> >  # Makefile for the phy drivers.
> >  #
> >
> > +obj-$(CONFIG_PHY_MTK_DP)             += phy-mtk-dp.o
> >  obj-$(CONFIG_PHY_MTK_TPHY)           += phy-mtk-tphy.o
> >  obj-$(CONFIG_PHY_MTK_UFS)            += phy-mtk-ufs.o
> >  obj-$(CONFIG_PHY_MTK_XSPHY)          += phy-mtk-xsphy.o
> > diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> > new file mode 100644
> > index 0000000000000..e0de2a367e788
> > --- /dev/null
> > +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> > @@ -0,0 +1,219 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 BayLibre
> > + * Author: Markus Schneider-Pargmann <msp@baylibre.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define PHY_OFFSET 0x1000
> > +
> > +#define MTK_DP_PHY_DIG_PLL_CTL_1             (PHY_OFFSET + 0x014)
> > +# define TPLL_SSC_EN                         BIT(3)
> > +
> > +#define MTK_DP_PHY_DIG_BIT_RATE                      (PHY_OFFSET + 0x03C)
> > +# define BIT_RATE_RBR                                0
> > +# define BIT_RATE_HBR                                1
> > +# define BIT_RATE_HBR2                               2
> > +# define BIT_RATE_HBR3                               3
> > +
> > +#define MTK_DP_PHY_DIG_SW_RST                        (PHY_OFFSET + 0x038)
> > +# define DP_GLB_SW_RST_PHYD                  BIT(0)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_3         (PHY_OFFSET + 0x138)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_3         (PHY_OFFSET + 0x238)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_3         (PHY_OFFSET + 0x338)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_3         (PHY_OFFSET + 0x438)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT   0x10
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT   (0x14 << 8)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT   (0x18 << 16)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT   (0x20 << 24)
>
> how about defining constants and using FEILD_PREP() to set the value.
> Here and few other places!
>
Noted for next revision,
Thanks.

> > +static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> > +{
> > +     struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +     u32 val;
> > +
> > +     if (opts->dp.set_rate) {
> > +             switch (opts->dp.link_rate) {
> > +             default:
> > +                     dev_err(&phy->dev,
> > +                             "Implementation error, unknown linkrate %x\n",
> > +                             opts->dp.link_rate);
> > +                     return -EINVAL;
> > +             case 1620:
> > +                     val = BIT_RATE_RBR;
> > +                     break;
> > +             case 2700:
> > +                     val = BIT_RATE_HBR;
> > +                     break;
> > +             case 5400:
> > +                     val = BIT_RATE_HBR2;
> > +                     break;
> > +             case 8100:
> > +                     val = BIT_RATE_HBR3;
> > +                     break;
> > +             }
> > +             regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
>
> interesting use of default :) which is correct!
>
> But why keep the regmap_write inside switch, you are anyway returning in
> default, so this write could be outside as well

Not my code here (as we are upstreaming code from the vendor tree).
My understanding is that the regmap_write() shouldn't be called if
dp.set_rate is false as val won't be set.

This doesn't actually happen because the only client for this phy is
the DP driver and we make sure to call it with dp.set_rate to true.

> --
> ~Vinod

Thx,
Guillaume.
