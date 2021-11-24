Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9445C794
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 15:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAF26E921;
	Wed, 24 Nov 2021 14:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB406E91B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 14:37:10 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id bk14so5735078oib.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Q2uRSbObrkePrc/zqU3Ngfzhg//kzaNeGN8p2tOermY=;
 b=Wpox2BiFdw5LB7Mri2X9dtiqzggWUQ3ce3fZP7mGvLN2qWIr6R+qb7739+z+UBjH5Y
 OS+LZM7gbxWGZpx6sL0FuwcPnAJrceL277Xm0OZw0Cdzh48Qyo7n/KxiyjmgRBVcwI7w
 55ScnUVXV+7X6tEuenAlNjJYETvgv46xXhEpjVV6n16XzUJoVnLXYppv28YM4oEpXL1e
 a1eVfJrzmnWgKSX5TalRIpd6kQ+Ranj4PKYa/ADCd+1iwtWgVf6uSrXsLNztVFZm0wxY
 4nfgw4iSkpctL59G9mvP8cxWZax6OQjSv35bcfWMfBjWQ8jvUoa8CeY4kO2Ks9ZwL2nB
 weBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Q2uRSbObrkePrc/zqU3Ngfzhg//kzaNeGN8p2tOermY=;
 b=XKWezEOwLe/Fta6rAoi4Ky+piU6vOFMh0G8/7n+AdpEVZqxYEogz0OZaokADlHe3DU
 tRHTyj4CwQABe1jUr/gIewcepTcdyJ+w1JQogz9an6K1M9VuAJGfK4YZRVtzRawpkYWp
 QxTEQ0AAXaRrFDTUBM55Ec3tCmPa9mSgwDfywWh+lMmocUEyfPk+9HVEE3jU96tegreb
 twHGlv4w46/aHPZjZlBfpPBC9qkaEAg7NBvrZpC77kUIQ1OeWz8iSzH2mqKtS8zaeCkX
 /bQahlaQRv21DqOl2v+lvlP8aFRdMOCygo6F2x0PPC95GtLvYcVCUctAvlW2Qto2bsd3
 DIAg==
X-Gm-Message-State: AOAM530VbMMo5yA/SLNZypirAWb20czdXCx8gHJ6fq50HCUO99rUhk1a
 oSnCqvYl+NrT5nmUpR0KwXBzqxyJDEjlPNCxmW8USw==
X-Google-Smtp-Source: ABdhPJyoBHUu71mzUSytuaBHiGkmNvNWsL+cSNLvnOPaoc3aXwyog/l3opaP3KACCnJdmgbG+DjUrao2zYz9PhEs5To=
X-Received: by 2002:aca:1708:: with SMTP id j8mr6452479oii.62.1637764629846;
 Wed, 24 Nov 2021 06:37:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Nov 2021 14:37:08 +0000
MIME-Version: 1.0
In-Reply-To: <fb09289440d16a0a441cd31a5542d4a6850fabe9.camel@mediatek.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-7-granquet@baylibre.com>
 <fb09289440d16a0a441cd31a5542d4a6850fabe9.camel@mediatek.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Wed, 24 Nov 2021 14:37:08 +0000
Message-ID: <CABnWg9s3rR1S5QqUyyUkKtsUqq3GSSLbMFvfoLQUs=4ZGzGqWw@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] phy: phy-mtk-dp: Add driver for DP phy
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chunfeng,

Quoting Chunfeng Yun (2021-11-13 08:48:37)
> On Wed, 2021-11-10 at 14:06 +0100, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > This is a new driver that supports the integrated DisplayPort phy for
> > mediatek SoCs, especially the mt8195. The phy is integrated into the
> > DisplayPort controller and will be created by the mtk-dp driver. This
> > driver expects a struct regmap to be able to work on the same
> > registers
> > as the DisplayPort controller. It sets the device data to be the
> > struct
> > phy so that the DisplayPort controller can easily work with it.
> >
> > The driver does not have any devicetree bindings because the
> > datasheet
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
> >  drivers/phy/mediatek/phy-mtk-dp.c | 219
> > ++++++++++++++++++++++++++++++
> >  4 files changed, 229 insertions(+)
> >  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 170bbbeefc3f4..f9a71b6d2a4a9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6367,6 +6367,7 @@ L:      linux-mediatek@lists.infradead.org
> > (moderated for non-subscribers)
> >  S:   Supported
> >  F:   Documentation/devicetree/bindings/display/mediatek/
> >  F:   drivers/gpu/drm/mediatek/
> > +F:   drivers/phy/mediatek/phy-mtk-dp.c
> >  F:   drivers/phy/mediatek/phy-mtk-hdmi*
> >  F:   drivers/phy/mediatek/phy-mtk-mipi*
> >
> > diff --git a/drivers/phy/mediatek/Kconfig
> > b/drivers/phy/mediatek/Kconfig
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
> > diff --git a/drivers/phy/mediatek/Makefile
> > b/drivers/phy/mediatek/Makefile
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
> > diff --git a/drivers/phy/mediatek/phy-mtk-dp.c
> > b/drivers/phy/mediatek/phy-mtk-dp.c
> > new file mode 100644
> > index 0000000000000..4f8d26ec0346b
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
> Why not provide register base address in DTS?
> I find that phy's platform device is registered by dp driver but the
> one automatically created when parse dts?
>
This phy driver has no dt binding whatsoever, as it shares basically
the same hardware as the DP driver,
so everything has to be either hardcoded or passed through from the DP driver.

> > +
> > +#define MTK_DP_PHY_DIG_PLL_CTL_1             (PHY_OFFSET + 0x014)
> > +# define TPLL_SSC_EN                         BIT(3)
> > +
> > +#define MTK_DP_PHY_DIG_BIT_RATE                      (PHY_OFFSET +
> > 0x03C)
> > +# define BIT_RATE_RBR                                0
> > +# define BIT_RATE_HBR                                1
> > +# define BIT_RATE_HBR2                               2
> > +# define BIT_RATE_HBR3                               3
> > +
> > +#define MTK_DP_PHY_DIG_SW_RST                        (PHY_OFFSET +
> > 0x038)
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
> > +# define DRIVING_PARAM_3_DEFAULT             (XTP_LN_TX_LCTXC0_SW0_P
> > RE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_P
> > RE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_P
> > RE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW0_P
> > RE3_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_4         (PHY_OFFSET + 0x13C)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_4         (PHY_OFFSET + 0x23C)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_4         (PHY_OFFSET + 0x33C)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_4         (PHY_OFFSET + 0x43C)
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT   0x18
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT   (0x1e << 8)
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT   (0x24 << 16)
> > +# define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT   (0x20 << 24)
> > +# define DRIVING_PARAM_4_DEFAULT             (XTP_LN_TX_LCTXC0_SW1_P
> > RE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW1_P
> > RE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW1_P
> > RE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW2_P
> > RE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_5         (PHY_OFFSET + 0x140)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_5         (PHY_OFFSET + 0x240)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_5         (PHY_OFFSET + 0x340)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_5         (PHY_OFFSET + 0x440)
> > +# define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT   0x28
> > +# define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT   (0x30 << 8)
> > +# define DRIVING_PARAM_5_DEFAULT             (XTP_LN_TX_LCTXC0_SW2_P
> > RE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXC0_SW3_P
> > RE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_6         (PHY_OFFSET + 0x144)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_6         (PHY_OFFSET + 0x244)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_6         (PHY_OFFSET + 0x344)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_6         (PHY_OFFSET + 0x444)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT  0x00
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT  (0x04 << 8)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT  (0x08 << 16)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT  (0x10 << 24)
> > +# define DRIVING_PARAM_6_DEFAULT             (XTP_LN_TX_LCTXCP1_SW0_
> > PRE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_
> > PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_
> > PRE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW0_
> > PRE3_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_7         (PHY_OFFSET + 0x148)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_7         (PHY_OFFSET + 0x248)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_7         (PHY_OFFSET + 0x348)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_7         (PHY_OFFSET + 0x448)
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT  0x00
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT  (0x06 << 8)
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT  (0x0c << 16)
> > +# define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT  (0x00 << 24)
> > +# define DRIVING_PARAM_7_DEFAULT             (XTP_LN_TX_LCTXCP1_SW1_
> > PRE0_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW1_
> > PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW1_
> > PRE2_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW2_
> > PRE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_8         (PHY_OFFSET + 0x14C)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_8         (PHY_OFFSET + 0x24C)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_8         (PHY_OFFSET + 0x34C)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_8         (PHY_OFFSET + 0x44C)
> > +# define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT  0x08
> > +# define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT  (0x00 << 8)
> > +# define DRIVING_PARAM_8_DEFAULT             (XTP_LN_TX_LCTXCP1_SW2_
> > PRE1_DEFAULT | \
> > +                                              XTP_LN_TX_LCTXCP1_SW3_
> > PRE0_DEFAULT)
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
> > +static int mtk_dp_phy_configure(struct phy *phy, union
> > phy_configure_opts *opts)
> > +{
> > +     struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +     u32 val;
> > +
> > +     if (opts->dp.set_rate) {
> > +             switch (opts->dp.link_rate) {
> > +             default:
> > +                     dev_err(&phy->dev,
> > +                             "Implementation error, unknown linkrate
> > %x\n",
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
> > +             regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE,
> > val);
> > +     }
> > +
> > +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
> > +                        TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN :
> > 0);
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
> > +
> > +     dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> > +     if (!dp_phy)
> > +             return -ENOMEM;
> > +
> > +     dp_phy->regs = *(struct regmap **)dev->platform_data;
> > +     if (!dp_phy->regs) {
> > +             dev_err(dev, "No data passed, requires struct
> > regmap**\n");
> > +             return -EINVAL;
> > +     }
> Why not get it from dts?
>
No dt bindings, this is passed from the dp driver (which triggers the
probe of the phy btw).

> > +
> > +     phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
> > +     if (IS_ERR(phy)) {
> > +             dev_err(dev, "Failed to create DP PHY: %ld\n",
> > PTR_ERR(phy));
> > +             return PTR_ERR(phy);
> > +     }
> > +     phy_set_drvdata(phy, dp_phy);
> > +
> > +     // Set device data to the phy so that mtk-dp can get it easily
> use /* */
> > +     dev_set_drvdata(dev, phy);
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
