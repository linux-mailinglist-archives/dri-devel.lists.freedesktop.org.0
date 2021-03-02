Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DBE32A262
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 15:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD2F6E950;
	Tue,  2 Mar 2021 14:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B246E94E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 14:22:55 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id w18so13925879pfu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 06:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55CV5Uii01XlVoSozVXVyFoeTH+tff8OgWug04ZDhmY=;
 b=WgE9mguXExxiweZEDJ5krszZiBSX73e4+IsDKu/0g8IGk18iHY3GRIBoQwrdaNgF3D
 Wa/xmpjnhb4/HfNbReL3XTHexCzkh8r4AKvF3j5kovNVbRi8WDKzh6VFtKmB4tTAFjf0
 ESB3enmEz0M/aERYjhI8QusT+qeh65eJEAhWaE6t0wjAaMEwrn73zxl/9NkKVfuhDG1r
 2PpVB+4wt/Egz1oz16n2nI+TPyAZz3iLfFuxqn2RTL/xhLn8wksmLOUl9ryJZ2z36YsE
 eiSsNnRE7BEhXZEiP8sJ1veF6MhmUse1OAGs4c1N2IyaBDhItrpKIgSqrQkZydYxNfJR
 AvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55CV5Uii01XlVoSozVXVyFoeTH+tff8OgWug04ZDhmY=;
 b=fAdSpFaSgsS+ijd55TRW/oBgf0Vdz5V6X9TpsIsKWCwCBwW7sWpz8nDSEmtRVFoyX2
 5OMwjciNH7L0QbzNaZ09Uctv4ONaFHMSSA4Go01mx97AFDpMUGr9poXc86aNQXxNdRmT
 39mSWcXUCzwLdgaSnphvudFLq+jKCkowbBalk8SEKsVfsUAlpVjGKYEkI457bRmVg+G7
 ahAUTW0u499a01nGmsV57U4MObSqMaWSXhuqshEPv4SPNRnsUWJdhzk0BYrjf4oxS15b
 /hYzEioClmpIwPAvmnPpg7ogkv41O5iJodOtIqxy9sb1jzG96WaVIlyt2wJWtPFvT3cE
 tqvQ==
X-Gm-Message-State: AOAM533RphUYNfumxt+hnow/4KpuhG3agPNu555w8M0sFtK5hRPtjywX
 t2FQxzI5cLSB80E0LKvUTrlPyqa32sbepuXDOaYDRg==
X-Google-Smtp-Source: ABdhPJy/BjbThnIpDQtd/a3becT65unXymeQ8C8wxZH2PzyHCSTsV/lwnu7MyP+v6xCb3dzzHOo/t4f9Y+6sfPF8LPo=
X-Received: by 2002:a65:5c42:: with SMTP id v2mr18455018pgr.339.1614694974868; 
 Tue, 02 Mar 2021 06:22:54 -0800 (PST)
MIME-Version: 1.0
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-11-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1613619715-28785-11-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 2 Mar 2021 15:22:43 +0100
Message-ID: <CAG3jFysTKXsmfx4x=XVdu3X0amE9EUOxN=bYo4eg+XjnqyFsVg@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] drm/bridge: imx: Add LDB driver helper support
To: Liu Ying <victor.liu@nxp.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 s.hauer@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kishon@ti.com,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, shawnguo@kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Liu,

Thanks for submitting this patch.

On Thu, 18 Feb 2021 at 04:59, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds a helper to support LDB drm bridge drivers for
> i.MX SoCs.  Helper functions exported from this driver should
> implement common logics for all LDB modules embedded in i.MX SoCs.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3->v4:
> * No change.
>
> v2->v3:
> * Call syscon_node_to_regmap() to get regmap instead of
>   syscon_regmap_lookup_by_phandle().
>
> v1->v2:
> * No change.
>
>  drivers/gpu/drm/bridge/imx/Kconfig          |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile         |   1 +
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 248 ++++++++++++++++++++++++++++
>  include/drm/bridge/imx_ldb_helper.h         |  98 +++++++++++
>  4 files changed, 355 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
>  create mode 100644 include/drm/bridge/imx_ldb_helper.h
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 1ea1ce7..23e24fd 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -1,3 +1,11 @@
> +config DRM_IMX_LVDS_BRIDGE_HELPER
> +       tristate "Freescale i.MX LVDS display bridge helper"
> +       depends on OF
> +       select DRM_PANEL_BRIDGE
> +       help
> +         Helper to support Freescale i.MX LVDS Display Bridge(LDB).
> +         This bridge is embedded in a SoC.
> +
>  config DRM_IMX8QXP_PIXEL_COMBINER
>         tristate "Freescale i.MX8QM/QXP pixel combiner"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index e74dd64..902b703 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,3 +1,4 @@
> +obj-$(CONFIG_DRM_IMX_LVDS_BRIDGE_HELPER) += imx-ldb-helper.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> new file mode 100644
> index 00000000..94d7f9e
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2012 Sascha Hauer, Pengutronix
> + * Copyright 2019,2020 NXP
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/bridge/imx_ldb_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
> +{
> +       return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
> +}
> +EXPORT_SYMBOL_GPL(ldb_channel_is_single_link);
> +
> +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
> +{
> +       return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
> +              ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> +}
> +EXPORT_SYMBOL_GPL(ldb_channel_is_split_link);
> +
> +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> +                                  struct drm_bridge_state *bridge_state,
> +                                  struct drm_crtc_state *crtc_state,
> +                                  struct drm_connector_state *conn_state)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +
> +       ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
> +       ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(ldb_bridge_atomic_check_helper);
> +
> +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> +                               const struct drm_display_mode *mode,
> +                               const struct drm_display_mode *adjusted_mode)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +
> +       if (is_split)
> +               ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
> +
> +       switch (ldb_ch->out_bus_format) {
> +       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +               break;
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +               if (ldb_ch->chno == 0 || is_split)
> +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
> +               if (ldb_ch->chno == 1 || is_split)
> +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
> +               break;
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +               if (ldb_ch->chno == 0 || is_split)
> +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
> +                                        LDB_BIT_MAP_CH0_JEIDA;
> +               if (ldb_ch->chno == 1 || is_split)
> +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
> +                                        LDB_BIT_MAP_CH1_JEIDA;
> +               break;
> +       }
> +}
> +EXPORT_SYMBOL_GPL(ldb_bridge_mode_set_helper);
> +
> +void ldb_bridge_enable_helper(struct drm_bridge *bridge)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +
> +       /*
> +        * Platform specific bridge drivers should set ldb_ctrl properly
> +        * for the enablement, so just write the ctrl_reg here.
> +        */
> +       regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> +}
> +EXPORT_SYMBOL_GPL(ldb_bridge_enable_helper);
> +
> +void ldb_bridge_disable_helper(struct drm_bridge *bridge)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +
> +       if (ldb_ch->chno == 0 || is_split)
> +               ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> +       if (ldb_ch->chno == 1 || is_split)
> +               ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> +
> +       regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> +}
> +EXPORT_SYMBOL_GPL(ldb_bridge_disable_helper);
> +
> +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> +                            enum drm_bridge_attach_flags flags)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               DRM_DEV_ERROR(ldb->dev,
> +                             "do not support creating a drm_connector\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!bridge->encoder) {
> +               DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
> +               return -ENODEV;
> +       }
> +
> +       return drm_bridge_attach(bridge->encoder,
> +                               ldb_ch->next_bridge, bridge,
> +                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +EXPORT_SYMBOL_GPL(ldb_bridge_attach_helper);
> +
> +int ldb_init_helper(struct ldb *ldb)
> +{
> +       struct device *dev = ldb->dev;
> +       struct device_node *np = dev->of_node;
> +       struct device_node *child;
> +       int ret;
> +       u32 i;
> +
> +       ldb->regmap = syscon_node_to_regmap(np->parent);
> +       if (IS_ERR(ldb->regmap)) {
> +               ret = PTR_ERR(ldb->regmap);
> +               if (ret != -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> +               return ret;
> +       }
> +
> +       for_each_available_child_of_node(np, child) {
> +               struct ldb_channel *ldb_ch;
> +
> +               ret = of_property_read_u32(child, "reg", &i);
> +               if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> +                       ret = -EINVAL;
> +                       DRM_DEV_ERROR(dev,
> +                                     "invalid channel node address: %u\n", i);
> +                       of_node_put(child);
> +                       return ret;
> +               }
> +
> +               ldb_ch = ldb->channel[i];
> +               ldb_ch->ldb = ldb;
> +               ldb_ch->chno = i;
> +               ldb_ch->is_available = true;
> +               ldb_ch->np = child;
> +
> +               ldb->available_ch_cnt++;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(ldb_init_helper);
> +
> +int ldb_find_next_bridge_helper(struct ldb *ldb)
> +{
> +       struct device *dev = ldb->dev;
> +       struct ldb_channel *ldb_ch;
> +       int ret, i;
> +
> +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +               ldb_ch = ldb->channel[i];
> +
> +               if (!ldb_ch->is_available)
> +                       continue;
> +
> +               ret = drm_of_find_panel_or_bridge(ldb_ch->np, 1, 0,
> +                                                 &ldb_ch->panel,
> +                                                 &ldb_ch->next_bridge);
> +               if (ret) {
> +                       if (ret != -EPROBE_DEFER)
> +                               DRM_DEV_ERROR(dev,
> +                                       "failed to find panel or bridge: %d\n",
> +                                                                       ret);
> +                       return ret;
> +               }
> +
> +               if (ldb_ch->panel) {
> +                       ldb_ch->next_bridge = devm_drm_panel_bridge_add(dev,
> +                                                               ldb_ch->panel);
> +                       if (IS_ERR(ldb_ch->next_bridge)) {
> +                               ret = PTR_ERR(ldb_ch->next_bridge);
> +                               DRM_DEV_ERROR(dev,
> +                                       "failed to add panel bridge: %d\n",
> +                                                                       ret);
> +                               return ret;
> +                       }
> +               }
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(ldb_find_next_bridge_helper);
> +
> +void ldb_add_bridge_helper(struct ldb *ldb,
> +                          const struct drm_bridge_funcs *bridge_funcs)
> +{
> +       struct ldb_channel *ldb_ch;
> +       int i;
> +
> +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +               ldb_ch = ldb->channel[i];
> +
> +               if (!ldb_ch->is_available)
> +                       continue;
> +
> +               ldb_ch->bridge.driver_private = ldb_ch;
> +               ldb_ch->bridge.funcs = bridge_funcs;
> +               ldb_ch->bridge.of_node = ldb_ch->np;
> +
> +               drm_bridge_add(&ldb_ch->bridge);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(ldb_add_bridge_helper);
> +
> +void ldb_remove_bridge_helper(struct ldb *ldb)
> +{
> +       struct ldb_channel *ldb_ch;
> +       int i;
> +
> +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +               ldb_ch = ldb->channel[i];
> +
> +               if (!ldb_ch->is_available)
> +                       continue;
> +
> +               drm_bridge_remove(&ldb_ch->bridge);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(ldb_remove_bridge_helper);
> +
> +MODULE_DESCRIPTION("Freescale i.MX LVDS Display Bridge driver helper");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:imx-ldb-helper");

I'm not entirely sure why this set of helper functions should be a
module. It's not a driver, but rather a toolbox for the LDB driver,
which is fine, but there is no situation I can see where this module
would be unloaded and the LDB driver would be loaded.

> diff --git a/include/drm/bridge/imx_ldb_helper.h b/include/drm/bridge/imx_ldb_helper.h
> new file mode 100644
> index 00000000..2a7ba97
> --- /dev/null
> +++ b/include/drm/bridge/imx_ldb_helper.h

This header is specific to this driver, and I would expect it to not
be useful to other drivers. Additionally the filename has a different
format than the .c file it corresponds to. I would change the name and
path to "drivers/gpu/drm/bridge/imx/imx-ldb-helper.h".

> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +/*
> + * Copyright 2019,2020 NXP
> + */
> +
> +#ifndef __FSL_IMX_LDB__
> +#define __FSL_IMX_LDB__
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_panel.h>
> +
> +#define LDB_CH0_MODE_EN_TO_DI0         (1 << 0)
> +#define LDB_CH0_MODE_EN_TO_DI1         (3 << 0)
> +#define LDB_CH0_MODE_EN_MASK           (3 << 0)
> +#define LDB_CH1_MODE_EN_TO_DI0         (1 << 2)
> +#define LDB_CH1_MODE_EN_TO_DI1         (3 << 2)
> +#define LDB_CH1_MODE_EN_MASK           (3 << 2)
> +#define LDB_SPLIT_MODE_EN              (1 << 4)
> +#define LDB_DATA_WIDTH_CH0_24          (1 << 5)
> +#define LDB_BIT_MAP_CH0_JEIDA          (1 << 6)
> +#define LDB_DATA_WIDTH_CH1_24          (1 << 7)
> +#define LDB_BIT_MAP_CH1_JEIDA          (1 << 8)
> +#define LDB_DI0_VS_POL_ACT_LOW         (1 << 9)
> +#define LDB_DI1_VS_POL_ACT_LOW         (1 << 10)
> +
> +#define MAX_LDB_CHAN_NUM               2
> +
> +enum ldb_channel_link_type {
> +       LDB_CH_SINGLE_LINK,
> +       LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS,
> +       LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS,
> +};
> +
> +struct ldb;
> +
> +struct ldb_channel {
> +       struct ldb *ldb;
> +       struct drm_bridge bridge;
> +       struct drm_panel *panel;
> +       struct drm_bridge *next_bridge;
> +       struct device_node *np;
> +       u32 chno;
> +       bool is_available;
> +       u32 in_bus_format;
> +       u32 out_bus_format;
> +       enum ldb_channel_link_type link_type;
> +};
> +
> +struct ldb {
> +       struct regmap *regmap;
> +       struct device *dev;
> +       struct ldb_channel *channel[MAX_LDB_CHAN_NUM];
> +       unsigned int ctrl_reg;
> +       u32 ldb_ctrl;
> +       unsigned int available_ch_cnt;
> +};
> +
> +#define bridge_to_ldb_ch(b)    container_of(b, struct ldb_channel, bridge)
> +
> +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
> +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
> +
> +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> +                                  struct drm_bridge_state *bridge_state,
> +                                  struct drm_crtc_state *crtc_state,
> +                                  struct drm_connector_state *conn_state);
> +
> +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> +                               const struct drm_display_mode *mode,
> +                               const struct drm_display_mode *adjusted_mode);
> +
> +void ldb_bridge_enable_helper(struct drm_bridge *bridge);
> +
> +void ldb_bridge_disable_helper(struct drm_bridge *bridge);
> +
> +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> +                            enum drm_bridge_attach_flags flags);
> +
> +int ldb_init_helper(struct ldb *ldb);
> +
> +int ldb_find_next_bridge_helper(struct ldb *ldb);
> +
> +void ldb_add_bridge_helper(struct ldb *ldb,
> +                          const struct drm_bridge_funcs *bridge_funcs);
> +
> +void ldb_remove_bridge_helper(struct ldb *ldb);
> +
> +#endif /* __FSL_IMX_LDB__ */
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
