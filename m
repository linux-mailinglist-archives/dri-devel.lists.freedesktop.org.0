Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9924C43EA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 12:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547DE10E1C9;
	Fri, 25 Feb 2022 11:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CF810E1C7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 11:49:52 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso5921109ooa.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 03:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7CaoA3Uf3+S7DwsJUxaMYisyGapg8ps+3goNhqGa/U0=;
 b=DVhPtupPS/+6Z5lginIeboI1WwHylZMKuVgFNOdBfO7daNAj/sjbh47fwogpg+jOT9
 J8byvYivG6eEG3F368W857lJdP5y1ig08cNGVp4lT10mNo83BFCaODhRQNJo+XMq6zzs
 WnNdCf6oy2F1p72lZPT/Y6VWcAJ+bSw44aqyEwjvaTNMEHC+k5Btme9ZPcGzDoBAjiuY
 Q7K+0AZCMshTsq6+edJBdSiEJRKmR5HXEmIba1KF98RIBxFUBIh8k7c8iDvPwVyvd2g+
 8bfrKndHbA5cQOSgeKPsrOnqmFYYsnXtk4N4nI+8n0JhXMWBCxBKXMcfnXyJZIpXOjl2
 0BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7CaoA3Uf3+S7DwsJUxaMYisyGapg8ps+3goNhqGa/U0=;
 b=uudVXeXeI9aj6EXYMeQ1EDTnGQbaeTHnX620LTjjCF9eXhR7lle5exabIMyTejmk/h
 PAGUHzKS8tlXHfdNXy9is2jOo084L8oh0mDp5dGbnF6YxMubpHzacv88Q5WncY6TBmh0
 BjvQiB28wZJLFd6/7B/sAzr/T2pyNIPQ5lShwunIoVrrtjhv/ExPrL1rzhH9xK/MLGdo
 fRKEaie+TbDlloGwqi8I7fIdNRJae0Gfz1Pj0j43g+5Lm6xxuywi27acA35s8MEz/EMh
 MMXPvKQPGHFV5yQapjbtHi+z6NzaPsGb1Sm1hvEyh+qbLS6bz7EyDorG7mMq6pLqgom6
 12HA==
X-Gm-Message-State: AOAM533iCuE5GrECvN3WNYOWlmIlt5ciPXHF2aaJZW5klSkL9u0OV6Ln
 WfxU0DTmiJ8odMOGXLXOZhQ4JHZ9E0fxFBh9i+kNVA==
X-Google-Smtp-Source: ABdhPJym28jh6caShkcMZmecKjdgFCCt1cLlRid1IVYYv7gZMf+oUREfLjPQV+8p9HJOnPAGBxXlBM7gCV+NwXCRPCY=
X-Received: by 2002:a05:6870:b486:b0:d6:f01f:41cc with SMTP id
 y6-20020a056870b48600b000d6f01f41ccmr286022oap.41.1645789791633; Fri, 25 Feb
 2022 03:49:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 03:49:51 -0800
MIME-Version: 1.0
In-Reply-To: <bdd867fe-3103-a99b-e9ec-02df6a18d385@collabora.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-15-granquet@baylibre.com>
 <bdd867fe-3103-a99b-e9ec-02df6a18d385@collabora.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 03:49:51 -0800
Message-ID: <CABnWg9tfutasgiUaLBvb8CxTycLKf8Ry=9PMi2Vtu2JeB4a=dQ@mail.gmail.com>
Subject: Re: [PATCH v8 14/19] phy: phy-mtk-dp: Add driver for DP phy
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@linux.ie, 
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com, 
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mripard@kernel.org, 
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de, 
 vkoul@kernel.org
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting AngeloGioacchino Del Regno (2022-02-21 15:31:51)
> Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
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
> >   MAINTAINERS                       |   1 +
> >   drivers/phy/mediatek/Kconfig      |   8 ++
> >   drivers/phy/mediatek/Makefile     |   1 +
> >   drivers/phy/mediatek/phy-mtk-dp.c | 199 ++++++++++++++++++++++++++++++
> >   4 files changed, 209 insertions(+)
> >   create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fca970a46e77a..33a05d396dd03 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6467,6 +6467,7 @@ L:      linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> >   S:  Supported
> >   F:  Documentation/devicetree/bindings/display/mediatek/
> >   F:  drivers/gpu/drm/mediatek/
> > +F:   drivers/phy/mediatek/phy-mtk-dp.c
> >   F:  drivers/phy/mediatek/phy-mtk-hdmi*
> >   F:  drivers/phy/mediatek/phy-mtk-mipi*
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
> >   # Makefile for the phy drivers.
> >   #
> >
> > +obj-$(CONFIG_PHY_MTK_DP)             += phy-mtk-dp.o
> >   obj-$(CONFIG_PHY_MTK_TPHY)          += phy-mtk-tphy.o
> >   obj-$(CONFIG_PHY_MTK_UFS)           += phy-mtk-ufs.o
> >   obj-$(CONFIG_PHY_MTK_XSPHY)         += phy-mtk-xsphy.o
> > diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> > new file mode 100644
> > index 0000000000000..2841dd3f22543
> > --- /dev/null
> > +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> > @@ -0,0 +1,199 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
>
> Would be nice to add:
>
>   * phy-mtk-dp.c - MediaTek DisplayPort PHY driver
>   *
>
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
> > +#define TPLL_SSC_EN                                  BIT(3)
> > +
> > +#define MTK_DP_PHY_DIG_BIT_RATE              (PHY_OFFSET + 0x03C)
> > +#define BIT_RATE_RBR                         0
> > +#define BIT_RATE_HBR                         1
> > +#define BIT_RATE_HBR2                                2
> > +#define BIT_RATE_HBR3                                3
> > +
> > +#define MTK_DP_PHY_DIG_SW_RST                (PHY_OFFSET + 0x038)
> > +#define DP_GLB_SW_RST_PHYD                   BIT(0)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_3         (PHY_OFFSET + 0x138)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_3         (PHY_OFFSET + 0x238)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_3         (PHY_OFFSET + 0x338)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_3         (PHY_OFFSET + 0x438)
> > +#define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT    0x10
>
> BIT(4)
>
> > +#define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT    (0x14 << 8)
> > +#define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT    (0x18 << 16)
> > +#define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT    (0x20 << 24)
>
> Please use the GENMASK() macro for these definitions.
>
I will convert all the definitions to BIT() and GENMASK() for v9

> > +#define DRIVING_PARAM_3_DEFAULT              (XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT    0x18
> > +#define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT    (0x1e << 8)
> > +#define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT    (0x24 << 16)
> > +#define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT    (0x20 << 24)
> > +#define DRIVING_PARAM_4_DEFAULT              (XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT    0x28
> > +#define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT    (0x30 << 8)
> > +#define DRIVING_PARAM_5_DEFAULT              (XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT   0x00
>
> This is just 0
>
> > +#define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT   (0x04 << 8)
> > +#define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT   (0x08 << 16)
> > +#define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT   (0x10 << 24)
> > +#define DRIVING_PARAM_6_DEFAULT              (XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT   0x00
>
> ...just 0 again
>
> > +#define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT   (0x06 << 8)
> > +#define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT   (0x0c << 16)
> > +#define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT   (0x00 << 24)
>
> zero shifted by a million bits is still zero, so this statement does not make sense
>
> > +#define DRIVING_PARAM_7_DEFAULT              (XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT   0x08
> > +#define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT   (0x00 << 8)
>
> Same here.
>
> > +#define DRIVING_PARAM_8_DEFAULT              (XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
> > +
> > +struct mtk_dp_phy {
> > +     struct regmap *regs;
> > +};
> > +
> > +static int mtk_dp_phy_init(struct phy *phy)
> > +{
> > +     struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +     u32 driving_params[] = {
> > +             DRIVING_PARAM_3_DEFAULT,
> > +             DRIVING_PARAM_4_DEFAULT,
> > +             DRIVING_PARAM_5_DEFAULT,
> > +             DRIVING_PARAM_6_DEFAULT,
> > +             DRIVING_PARAM_7_DEFAULT,
> > +             DRIVING_PARAM_8_DEFAULT
> > +     };
> > +
> > +     regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
> > +                       driving_params, ARRAY_SIZE(driving_params));
> > +     regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
> > +                       driving_params, ARRAY_SIZE(driving_params));
> > +     regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
> > +                       driving_params, ARRAY_SIZE(driving_params));
> > +     regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
> > +                       driving_params, ARRAY_SIZE(driving_params));
> > +
> > +     return 0;
> > +}
> > +
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
> > +     }
> > +
> > +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
> > +                        TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mtk_dp_phy_reset(struct phy *phy)
> > +{
> > +     struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +
> > +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> > +                        DP_GLB_SW_RST_PHYD, 0);
>
> Please, when you add delays/sleeps, add a comment explaining the reason for that.
>
> To you.. and to me as well.. the reason is very much known and honestly obvious,
> but let's be nice with people that don't know the MediaTek platforms :)
>
It's sadly not obvious to me, I've asked mediatek engineers mutlple
times for these
kind of information, but I'm rather short on information... :-/

> > +     usleep_range(50, 200);
> > +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> > +                        DP_GLB_SW_RST_PHYD, 1);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct phy_ops mtk_dp_phy_dev_ops = {
> > +     .init = mtk_dp_phy_init,
> > +     .configure = mtk_dp_phy_configure,
> > +     .reset = mtk_dp_phy_reset,
> > +     .owner = THIS_MODULE,
> > +};
> > +
> > +static int mtk_dp_phy_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct mtk_dp_phy *dp_phy;
> > +     struct phy *phy;
>
>         struct regmap *regs = (blah);
>
>         if (!dp_phy->regs)
>                 return -EINVAL;
>
> Doing that before allocating the dp_phy struct seems sensible as, even
> if it's unlikely that this platform data is not passed, we'd be sparing
> some time around.
>
> Besides - I think that the error message is not necessary here, but, if
> you really want to keep it, please return dev_err_probe(): using it in
> these cases is also allowed.
>
You are right, it's logical to return as early as possible.

> > +
> > +     dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> > +     if (!dp_phy)
> > +             return -ENOMEM;
> > +
> > +     dp_phy->regs = *(struct regmap **)dev->platform_data;
> > +     if (!dp_phy->regs) {
> > +             dev_err(dev, "No data passed, requires struct regmap**\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
>
>         if (IS_ERR(phy))
>                 return dev_err_probe(dev, PTR_ERR(phy), "Cannot create DP PHY\n");
>
> > +     if (IS_ERR(phy)) {
> > +             dev_err(dev, "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
> > +             return PTR_ERR(phy);
> > +     }
> > +     phy_set_drvdata(phy, dp_phy);
> > +
> > +     if (!dev->of_node)
>
> This will never happen if you use DT to probe this driver - and please do!
>
> An example device-tree binding would be:
>
> dp_phy: phy@somewhere {
>         compatible = "mediatek,mt8195-dp-phy", "mediatek,dp-phy";
>         reg = <...>;
>         #phy-cells = <0>;
> };
>
> mtk_dp: displayport-controller@somewhere_else {
>         compatible = "mediatek,mt8195-edp-tx", "mediatek,edp-tx";
>         reg = <....>;
>         other-properties;
>
>         phys = <&dp_phy>;
>         phy-names = "dp";
> };
>
> Also, remember: since you're nicely using regmap, if you - for any reason - need
> to share the same iospace between the two drivers, you can always use a
> syscon node for that purpose.
>
Sadly, I'm not using DT to prove this driver... and this driver will
probably never
be used with DT.
This phy is actually an integral part of the dp ip, this driver is
only a "logical"
separation between the DP/phy functionnalities.
It's probed from the DP driver with a call to `platform_register_device()`.
Both the DP and phy driver share the same regmap struct.

Markus tried to explain that in the commit message, please tell me if this needs
a reword?
The original discussion is here:
https://lore.kernel.org/all/CAAOTY__cJMqcAieEraJ2sz4gi0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com/

I didn't know about syscon, I'll have a look... but it's definitively what
I'm doing here...

> > +             phy_create_lookup(phy, "dp", dev_name(dev));
> > +
> > +     return 0;
> > +}
> > +
> > +struct platform_driver mtk_dp_phy_driver = {
> > +     .probe = mtk_dp_phy_probe,
> > +     .driver = {
> > +             .name = "mediatek-dp-phy",
> > +     },
> > +};
> > +module_platform_driver(mtk_dp_phy_driver);
> > +
> > +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> > +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
> > +MODULE_LICENSE("GPL v2");
>
