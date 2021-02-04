Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B930FF24
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 22:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AAA6EE6D;
	Thu,  4 Feb 2021 21:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E056EE6D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 21:16:08 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id w2so7921799ejk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 13:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZmzPGpKW18AQ4ku4zCHXfQnJDVYfmH1Kg9Vcru7zrCs=;
 b=JmiS9Kxg7Dg5ZY20zaPfaiUIlNxbLpCKtXFtjTSkH22a3lPlVYMM2uo89WJuGYc3ZG
 rb6bbghTDjo5I16yItiQqn4qxJpZ2S+Jfbtbfiqric74yyn9wp9KpOq0Z43e7cF+leQB
 1hu4ZeIU/sd8yD8NDJ6fC0ofekX9O5i+l/Svg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZmzPGpKW18AQ4ku4zCHXfQnJDVYfmH1Kg9Vcru7zrCs=;
 b=sy61mN5ButiiJpaVmb2aN+tNRs0dtGntEKiqyWWdtfbcr9ko7ycNM6pG4luU/ZxT43
 Gf00NAFPEf5b01eKNLT+3E2n9jnAWpV7082YYLsM+7/6xZD56Qj6liYjGImP9x1YCVng
 S7kVRK2ybtcfM6zM512OwgBi8p18kd3lQHVweGddbJI6wvTZL4yYPt6cYU7+I+FYvuiu
 R8376gfXREymizhPbOTm2UsW4Ii5KC8YN0jM4Uzx+ThcJiLVcLxkYzSAWyNtO99+vvBS
 rXhyRth2bR1gKwrFg1c3APbEJ4dCbs1fab0ExllyWSM7w2olWg91/tcng4P09UZXd+Z/
 9iZg==
X-Gm-Message-State: AOAM530FLHm/hEjRQqaRmtK4c9MqK0FbmJcSxbBA2HfeXCtvs6iz9nM2
 IQqhgn9WNBHxCad0LiQhc0h/cXAef2mYROyAmftsxw==
X-Google-Smtp-Source: ABdhPJzVNXPmxtrkepSqbEjcieJamAXAOk5hHZ2+R/qSCwCTw99ED8l2R44OfWAdD3eR+svseTpDu26RFcYvJ+cDMuU=
X-Received: by 2002:a17:906:40ca:: with SMTP id
 a10mr975712ejk.295.1612473366538; 
 Thu, 04 Feb 2021 13:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20210203071256.42050-1-jagan@amarulasolutions.com>
 <20210203071256.42050-2-jagan@amarulasolutions.com>
 <CAOf5uwkba925uEctVaEepGWL-Bs_k38aCyh=j5K2Dpe8MTzLgw@mail.gmail.com>
In-Reply-To: <CAOf5uwkba925uEctVaEepGWL-Bs_k38aCyh=j5K2Dpe8MTzLgw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 5 Feb 2021 02:45:54 +0530
Message-ID: <CAMty3ZAWKg98K=ZWwPf9ivvBmrOHcC2A6q3+4O6M6m6SYWcmjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: bridge: Add SN65DSI84 DSI to LVDS bridge
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 2:51 PM Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Hi
>
> On Wed, Feb 3, 2021 at 8:13 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > SN65DSI84 is a Single Channel DSI to Dual-link LVDS bridge from
> > Texas Instruments.
> >
> > SN65DSI83, SN65DSI85 are variants of the same family of bridge
> > controllers.
> >
> > Right now the bridge driver is supporting a single link, dual-link
> > support requires to initiate I2C Channel B registers.
> >
> > Tested with STM32MP1 MIPI DSI host design configuration.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > - dropped the mdelays between commands as delays in init script in
> >   datasheet is based Aardvark I2C host adaptor.
> >   https://e2e.ti.com/support/interface/f/138/t/974276
> >
> >  MAINTAINERS                           |   6 +
> >  drivers/gpu/drm/bridge/Kconfig        |  19 ++
> >  drivers/gpu/drm/bridge/Makefile       |   1 +
> >  drivers/gpu/drm/bridge/ti-sn65dsi84.c | 457 ++++++++++++++++++++++++++
> >  4 files changed, 483 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi84.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 12dd1fff2a39..44750ff7640c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5984,6 +5984,12 @@ S:       Maintained
> >  F:     Documentation/devicetree/bindings/display/ti/
> >  F:     drivers/gpu/drm/omapdrm/
> >
> > +DRM DRIVERS FOR TI SN65DSI84 DSI TO LVDS BRIDGE
> > +M:     Jagan Teki <jagan@amarulasolutions.com>
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/display/bridge/ti,sn65dsi84.yaml
> > +F:     drivers/gpu/drm/bridge/ti-sn65dsi84.c
> > +
> >  DRM DRIVERS FOR V3D
> >  M:     Eric Anholt <eric@anholt.net>
> >  S:     Supported
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index e4110d6ca7b3..6494881bffb3 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -232,6 +232,25 @@ config DRM_TI_TFP410
> >         help
> >           Texas Instruments TFP410 DVI/HDMI Transmitter driver
> >
> > +config DRM_TI_SN65DSI84
> > +       tristate "TI SN65DSI84 DSI to LVDS bridge"
> > +       depends on OF
> > +       select DRM_KMS_HELPER
> > +       select REGMAP_I2C
> > +       select DRM_PANEL
> > +       select DRM_MIPI_DSI
> > +       help
> > +         Texas Instruments SN65DSI84 Single Channel DSI to Dual-link LVDS
> > +         bridge driver.
> > +
> > +         Bridge decodes MIPI DSI 18bpp RGB666 and 240bpp RG888 packets and
> > +         converts the formatted video data stream to a FlatLink compatible
> > +         LVDS output operating at pixel clocks operating from 25 MHx to
> > +         154 MHz.
> > +
> > +         SN65DSI84 offers a Dual-Link LVDS, Single-Link LVDS interface with
> > +         four data lanes per link.
> > +
> >  config DRM_TI_SN65DSI86
> >         tristate "TI SN65DSI86 DSI to eDP bridge"
> >         depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > index 86e7acc76f8d..3906052ef639 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
> >  obj-$(CONFIG_DRM_TOSHIBA_TC358768) += tc358768.o
> >  obj-$(CONFIG_DRM_TOSHIBA_TC358775) += tc358775.o
> >  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
> > +obj-$(CONFIG_DRM_TI_SN65DSI84) += ti-sn65dsi84.o
> >  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
> >  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> >  obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi84.c b/drivers/gpu/drm/bridge/ti-sn65dsi84.c
> > new file mode 100644
> > index 000000000000..27a9074db17e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi84.c
> > @@ -0,0 +1,457 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 Engicam srl
> > + * Copyright (C) 2021 Amarula Solutions(India)
> > + * Author: Jagan Teki <jagan@amarulasolutions.com>
> > + */
> > +
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +
> > +/* sn65dsi84 registers */
> > +#define SN65DSI_SOFT_RESET             0x09
> > +#define SN65DSI_LVDS_CLK               0x0a
> > +#define SN65DSI_CLK_DIV                        0x0b
> > +#define SN65DSI_CLK_PLL                        0x0d
> > +#define SN65DSI_DSI_CFG                        0x10
> > +#define SN65DSI_DSI_CLK_EQ             0x11
> > +#define SN65DSI_DSI_CLK_RANGE          0x12
> > +#define SN65DSI_LVDS_MODE              0x18
> > +#define SN65DSI_CHA_LINE_LO            0x20
> > +#define SN65DSI_CHA_LINE_HI            0x21
> > +#define SN65DSI_CHA_VIRT_LO            0x24
> > +#define SN65DSI_CHA_VIRT_HI            0x25
> > +#define SN65DSI_CHA_SYNC_DELAY_LO      0x28
> > +#define SN65DSI_CHA_SYNC_DELAY_HI      0x29
> > +#define SN65DSI_CHA_HSYNC_WIDTH_LO     0x2c
> > +#define SN65DSI_CHA_HSYNC_WIDTH_HI     0x2d
> > +#define SN65DSI_CHA_VSYNC_WIDTH_LO     0x30
> > +#define SN65DSI_CHA_VSYNC_WIDTH_HI     0x31
> > +#define SN65DSI_CHA_HBACK_PORCH                0x34
> > +#define SN65DSI_CHA_VBACK_PORCH                0x36
> > +#define SN65DSI_CHA_HFRONT_PORCH       0x38
> > +#define SN65DSI_CHA_VFRONT_PORCH       0x3a
> > +#define SN65DSI_CHA_ERR                        0xe5
> > +
> > +/* sn65dsi register bits */
> > +#define SN65DSI_RESET_EN               BIT(0)
> > +#define SN65DSI_PLL_EN                 BIT(0)
> > +#define SN65DSI_LVDS_CLK_MASK          GENMASK(3, 1)
> > +#define SN65DSI_LVDS_CLK_SHIFT         1
> > +#define SN65DSI_LVDS_CLK_SRC_DSI       BIT(0)
> > +#define SN65DSI_CLK_DIV_MASK           GENMASK(7, 3)
> > +#define SN65DSI_CLK_DIV_SHIFT          3
> > +#define SN65DSI_DSI_LANE_MASK          GENMASK(4, 3)
> > +#define SN65DSI_DSI_LANE_SHIFT         3
> > +#define SN65DSI_LVDS_LINK_CFG          BIT(4)
> > +#define SN65DSI_LVDS_CHA_24BPP         BIT(3)
> > +#define SN65DSI_CHA_LOW_SYNC_DELAY     0x20
> > +#define SN65DSI_CHA_HIGH_SYNC_DELAY    0x00
> > +
> > +struct sn65dsi {
> > +       struct device                   *dev;
> > +       struct drm_bridge               bridge;
> > +       struct drm_bridge               *panel_bridge;
> > +
> > +       struct device_node              *host_node;
> > +       struct mipi_dsi_device          *dsi;
> > +       u8                              dsi_lanes;
> > +
> > +       struct regmap                   *regmap;
> > +       struct gpio_desc                *enable;
> > +};
>
> I suggest a better name. 3 different families are compatible here

sn65dsi83/84/85 are similar chips. Do you mean ti-sn65dsi8x.c it can
confuse with exiting ti-sn65dsi86.c, doesn't it?

> > +
> > +static const struct regmap_config sn65dsi_regmap_config = {
> > +       .reg_bits = 8,
> > +       .val_bits = 8,
> > +       .max_register = SN65DSI_CHA_ERR,
> > +       .name = "sn65dsi",
> > +       .cache_type = REGCACHE_RBTREE,
> > +};
> > +
> > +static inline struct sn65dsi *bridge_to_sn65dsi(struct drm_bridge *bridge)
> > +{
> > +       return container_of(bridge, struct sn65dsi, bridge);
> > +}
> > +
> > +static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
> > +{
> > +       return &bridge->encoder->crtc->state->mode;
> > +}
> > +
> > +static void sn65dsi_setup_channels(struct sn65dsi *sn,
> > +                                  struct drm_display_mode *mode)
> > +{
> > +       u32 hsync_len, hfront_porch, hback_porch;
> > +       u32 vsync_len, vfront_porch, vback_porch;
> > +
> > +       hfront_porch = mode->hsync_start - mode->hdisplay;
> > +       hsync_len = mode->hsync_end - mode->hsync_start;
> > +       hback_porch = mode->htotal - mode->hsync_end;
> > +
> > +       vfront_porch = mode->vsync_start - mode->vdisplay;
> > +       vsync_len = mode->vsync_end - mode->vsync_start;
> > +       vback_porch = mode->vtotal - mode->vsync_end;
> > +
> > +       /* cha, lower 8-bits of hdisplay */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_LINE_LO, mode->hdisplay & 0xff);
> > +
> > +       /* cha, upper 4-bits of hdisplay */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_LINE_HI, (mode->hdisplay >> 8) & 0xff);
> > +
> > +       /* cha, lower 8-bits of vdisplay */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_VIRT_LO, mode->vdisplay & 0xff);
> > +
> > +       /* cha, upper 4-bits of vdisplay */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_VIRT_HI, (mode->vdisplay >> 8) & 0xff);
> > +
> > +       /*cha, lower sync delay */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_SYNC_DELAY_LO, SN65DSI_CHA_LOW_SYNC_DELAY);
> > +
> > +       /*cha, upper sync delay */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_SYNC_DELAY_HI, SN65DSI_CHA_HIGH_SYNC_DELAY);
> > +
> > +       /* cha, lower 8-bits of hsync_len */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_HSYNC_WIDTH_LO, hsync_len & 0xff);
> > +
> > +       /* cha, upper 2-bits of hsync_len */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_HSYNC_WIDTH_HI, (hsync_len >> 8) & 0xff);
> > +
> > +       /* cha, lower 8-bits of vsync_len */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_VSYNC_WIDTH_LO, vsync_len & 0xff);
> > +
> > +       /* cha, upper 2-bits of vsync_len */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_VSYNC_WIDTH_HI, (vsync_len >> 8) & 0xff);
> > +
> > +       /* cha, hback_porch */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_HBACK_PORCH, hback_porch & 0xff);
> > +
> > +       /* cha, vback_porch */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_VBACK_PORCH, vback_porch & 0xff);
> > +
> > +       /* cha, hfront_porch */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_HFRONT_PORCH, hfront_porch & 0xff);
> > +
> > +       /* cha, vfront_porch */
> > +       regmap_write(sn->regmap, SN65DSI_CHA_VFRONT_PORCH, vfront_porch & 0xff);
> > +}
> > +
> > +static int sn65dsi_get_clk_range(int min, int max, unsigned long clock,
> > +                                unsigned long start, unsigned long diff)
> > +{
> > +       unsigned long next;
> > +       int i;
> > +
> > +       for (i = min; i <= max; i++) {
> > +               next = start + diff;
> > +               if (start <= clock && clock < next)
> > +                       return i;
> > +
> > +               start += diff;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static void sn65dsi_enable(struct drm_bridge *bridge)
> > +{
> > +       struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
> > +       struct drm_display_mode *mode = bridge_to_mode(bridge);
> > +       int bpp = mipi_dsi_pixel_format_to_bpp(sn->dsi->format);
> > +       unsigned int lanes = sn->dsi->lanes;
> > +       unsigned int pixel_clk = mode->clock * 1000;
> > +       unsigned int dsi_clk = pixel_clk * bpp / (lanes * 2);
> > +       unsigned int val;
> > +
> > +       /* reset SOFT_RESET bit */
> > +       regmap_write(sn->regmap, SN65DSI_SOFT_RESET, 0x0);
> > +
> > +       msleep(10);
> > +
> > +       /* reset PLL_EN bit */
> > +       regmap_write(sn->regmap, SN65DSI_CLK_PLL, 0x0);
> > +
> > +       msleep(10);
> > +
> > +       /* setup lvds clock */
> > +       val = sn65dsi_get_clk_range(0, 5, pixel_clk, 25000000, 25000000);
> > +       if (val < 0) {
> > +               DRM_DEV_ERROR(sn->dev, "invalid LVDS clock range %d\n", val);
> > +               return;
> > +       }
> > +
> > +       regmap_update_bits(sn->regmap, SN65DSI_LVDS_CLK,
> > +                          SN65DSI_LVDS_CLK_MASK,
> > +                          val << SN65DSI_LVDS_CLK_SHIFT);
> > +
> > +       regmap_update_bits(sn->regmap, SN65DSI_LVDS_CLK,
> > +                          SN65DSI_LVDS_CLK_SRC_DSI,
> > +                          SN65DSI_LVDS_CLK_SRC_DSI);
> > +
> > +       /* setup bridge clock divider */
> > +       val = (dsi_clk / pixel_clk) - 1;
> > +       regmap_update_bits(sn->regmap, SN65DSI_CLK_DIV,
> > +                          SN65DSI_CLK_DIV_MASK,
> > +                          val << SN65DSI_CLK_DIV_SHIFT);
> > +
> > +       /* configure dsi */
> > +       regmap_update_bits(sn->regmap, SN65DSI_DSI_CFG,
> > +                          SN65DSI_DSI_LANE_MASK,
> > +                          lanes << SN65DSI_DSI_LANE_SHIFT);
> > +
> > +       /* dsi clock range */
> > +       val = sn65dsi_get_clk_range(8, 100, dsi_clk, 40000000, 5000000);
> > +       if (val < 0) {
> > +               DRM_DEV_ERROR(sn->dev, "invalid DSI clock range %d\n", val);
> > +               return;
> > +       }
> > +
> > +       regmap_write(sn->regmap, SN65DSI_DSI_CLK_RANGE, val);
> > +
> > +       /* setup lvds channels */
> > +       regmap_read(sn->regmap, SN65DSI_LVDS_MODE, &val);
> > +       if (bpp == 24)
> > +               val |= SN65DSI_LVDS_CHA_24BPP;
> > +       regmap_write(sn->regmap, SN65DSI_LVDS_MODE, val);
>
> This register should have even how data are packed by dsi. There are two mode
> mode 1 and mode 2.

You mean BIT:3, 2 CHA_24BPP_MODE, CHB_24BPP_MODE?

The above SN64DSI_LVDS_CHA_24BPP is the same and it is updating CHA
for now as CHB is not supported yet.

>
> > +
> > +       /* TODO Channel B required to set up for dual-link LVDS */
> > +       sn65dsi_setup_channels(sn, mode);
> > +
> > +       /* set SOFT_RESET bit */
> > +       regmap_write(sn->regmap, SN65DSI_SOFT_RESET, SN65DSI_RESET_EN);
> > +
> > +       msleep(10);
> > +
> > +       /* set PLL_EN bit */
> > +       regmap_write(sn->regmap, SN65DSI_CLK_PLL, SN65DSI_PLL_EN);
> > +
> > +       msleep(10);
> > +}
> > +
> > +static void sn65dsi_disable(struct drm_bridge *bridge)
> > +{
> > +       struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
> > +
> > +       /* set PLL_EN bit */
> > +       regmap_write(sn->regmap, SN65DSI_CLK_PLL, 0x0);
> > +
> > +       msleep(10);
> > +
> > +       /* set SOFT_RESET bit */
> > +       regmap_write(sn->regmap, SN65DSI_SOFT_RESET, 0x0);
> > +
> > +       msleep(10);
>
> Can you point me out the documenation where is written

I can see the sequence pointed in 7.4.3 Initialization Sequence

>
> > +}
> > +
> > +static void sn65dsi_post_disable(struct drm_bridge *bridge)
> > +{
> > +       struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
> > +
> > +       gpiod_set_value_cansleep(sn->enable, 1);
> > +
> > +       msleep(10);
> > +
> > +       gpiod_set_value_cansleep(sn->enable, 0);
> > +
> > +       msleep(10);
>
> Again is there any description about the reset time in datasheet. If
> so, please point to the section
>
> > +}
> > +
> > +static void sn65dsi_pre_enable(struct drm_bridge *bridge)
> > +{
> > +       struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
> > +
> > +       gpiod_set_value_cansleep(sn->enable, 0);
> > +
> > +       msleep(10);
> > +
> > +       gpiod_set_value_cansleep(sn->enable, 1);
> > +
> > +       msleep(10);
>
> Ditto
>
> > +}
> > +
> > +static int sn65dsi_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
> > +{
> > +       struct sn65dsi *sn = bridge_to_sn65dsi(bridge);
> > +       struct mipi_dsi_host *host;
> > +       struct mipi_dsi_device *dsi;
> > +       const struct mipi_dsi_device_info info = { .type = "sn65dsi",
> > +                                                  .channel = 0,
> > +                                                  .node = NULL,
> > +                                                };
> > +       int ret;
> > +
> > +       host = of_find_mipi_dsi_host_by_node(sn->host_node);
> > +       if (!host) {
> > +               DRM_DEV_ERROR(sn->dev, "failed to find dsi host\n");
> > +               return -EPROBE_DEFER;
> > +       }
> > +
> > +       dsi = mipi_dsi_device_register_full(host, &info);
> > +       if (IS_ERR(dsi)) {
> > +               DRM_DEV_ERROR(sn->dev, "failed to create dsi device\n");
> > +               return PTR_ERR(sn->dsi);
> > +       }
> > +
> > +       sn->dsi = dsi;
> > +       dsi->lanes = sn->dsi_lanes;
> > +       dsi->format = MIPI_DSI_FMT_RGB888;
> > +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> > +
> > +       ret = mipi_dsi_attach(dsi);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(sn->dev, "failed to attach dsi host\n");
> > +               goto err_dsi_attach;
> > +       }
> > +
> > +       return drm_bridge_attach(bridge->encoder, sn->panel_bridge,
> > +                                &sn->bridge, flags);
> > +
> > +err_dsi_attach:
> > +       mipi_dsi_device_unregister(dsi);
> > +       return ret;
> > +}
> > +
> > +static const struct drm_bridge_funcs sn65dsi_bridge_funcs = {
> > +       .attach         = sn65dsi_attach,
> > +       .pre_enable     = sn65dsi_pre_enable,
> > +       .enable         = sn65dsi_enable,
> > +       .disable        = sn65dsi_disable,
> > +       .post_disable   = sn65dsi_post_disable,
> > +};
> > +
> > +static int sn65dsi_parse_dt(struct sn65dsi *sn)
> > +{
> > +       struct device *dev = sn->dev;
> > +       struct device_node *endpoint, *parent;
> > +       struct property *prop;
> > +       struct drm_panel *panel;
> > +       int len = 0;
> > +       int ret;
> > +
> > +       sn->enable = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> > +       if (IS_ERR(sn->enable)) {
> > +               DRM_DEV_ERROR(dev, "failed to get enable gpio\n");
> > +               return PTR_ERR(sn->enable);
> > +       }
> > +
> > +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> > +       if (ret < 0)
> > +               return ret;
> > +       if (!panel)
> > +               return -ENODEV;
> > +
> > +       sn->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +       if (IS_ERR(sn->panel_bridge))
> > +               return PTR_ERR(sn->panel_bridge);
> > +
> > +       /*
> > +        * To get the data-lanes of dsi, we need to access the port1 of dsi_out
> > +        * from the port0 of bridge.
> > +        */
> > +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> > +       if (endpoint) {
>
> What is happen if you have no endpoint should not already fail?

You mean for !endpoint case? it would return -EINVAL. the next lanes
cases would return for no endpoint cases.

Jagan.
-- 
Jagan Teki,
Amarula Solutions India Pvt. Ltd.
Co-Founder & Embedded Linux Architect
405/E-Block, Sri Lakshmi Shubham Arcade, Chandanagar, Hyderabad - 500050, India
M. (+91) 910 009 0959
[`as] http://www.amarulasolutions.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
