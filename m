Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B008134E4AC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 11:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96996E890;
	Tue, 30 Mar 2021 09:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0986E890
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 09:46:20 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id k8so2170430pgf.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pRxeY4zIQSSMn7FNL8ksfWGCdPGEP6fbNk6A6z/kOXY=;
 b=uq92Rf0sULmraS5RarSlr0AwP3CjVUD0omykPRDX30sPN0H2481x1fk9F0r8HvjJE/
 3ppnxcsdLo7mA+T4Y1OJvc5O2uGroY7wsQ10HJgCRphl/ClHPpEu01adMaieKZ3SSc17
 eX9l6MqhT4nJR4rdH2ylYQLbGvWNbvaHvbC25vnVCrRniq8OJJmTYIblNKHS+TCJhO6y
 wTo5ZkqJ0h9uBpCO8MOJCCCIwkdGxdM0Qdhm1R1zHsz2lCNjlJ85Wg9emxugfxiRPYMX
 U6f5vj29Kx4PowKmJXYZ4sPjdC+WScXuDFBjf6cfiSFwZtBXYNdR/eyKxVMO9lRWO0Nm
 UIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pRxeY4zIQSSMn7FNL8ksfWGCdPGEP6fbNk6A6z/kOXY=;
 b=iXtB3ISKTeqdu/2bB43ZbXyg2b9f6oF4BG9J78SJxQYpZD6M9BG9fw/mnx2oDEcCel
 qBcAACH7Xcs+dpA1hbMzxi59vTfIS/OeYlYlREJz97fzttx1sPG/ggr2qJ+KmpVAO0Rf
 VKFjesssiOo9k1Budjs6QP8N9PWArw2/td6lVnkApnOlfkhnPLDVb4HIXikaYJBKFV/h
 946kJfcYpowHWZuKQt5bMtdkP4TpvT2dvOMdDzsl3xWmHi+PetNkaJh5qnM68TSx/TP9
 85KRdbPauhRbr54wmcxZnXI1NEeAgA8RPjCBE0M7eDjfuCA2k9BXvrvBwp58KLZ84COx
 Tilg==
X-Gm-Message-State: AOAM532IN2+uFcNi5fh2LbrYiWvyFfepEztuPNVipfCtoIGDKsTR5G2g
 oj0o0Prhh18aNXiLDAl8qUpdS/Hv8VUTiBm1Iy4h2Q==
X-Google-Smtp-Source: ABdhPJwvk/ycGoIb9WaUK44TsWKCK8QYt53DL+uCg4tLzaTUO37ggITcslKuWRam0s9AFm+ixHzUTdCnmrLzpNZ1m0I=
X-Received: by 2002:a62:80cf:0:b029:1f3:1959:2e42 with SMTP id
 j198-20020a6280cf0000b02901f319592e42mr28831599pfd.39.1617097580333; Tue, 30
 Mar 2021 02:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-11-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1615952569-4711-11-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 30 Mar 2021 11:46:09 +0200
Message-ID: <CAG3jFyumkoNDEJ7hZGmHUj_YqMXXmR0emiFGH4-vK3jJH7Y=vg@mail.gmail.com>
Subject: Re: [PATCH v6 10/14] drm/bridge: imx: Add LDB driver helper support
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, lee.jones@linaro.org,
 kishon@ti.com, linux-imx@nxp.com, linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 s.hauer@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Liu,

checkpatch --strict is listing some nits for this patch, with those
fixed feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 17 Mar 2021 at 04:57, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds a helper to support LDB drm bridge drivers for
> i.MX SoCs.  Helper functions supported by this helper should
> implement common logics for all LDB modules embedded in i.MX SoCs.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5->v6:
> * No change.
>
> v4->v5:
> * Make imx-ldb-helper be a pure object to be linked with i.MX8qxp LDB bridge
>   driver and i.MX8qm LDB bridge driver. (Robert)
> * Move 'imx_ldb_helper.h' to 'drivers/gpu/drm/bridge/imx/imx-ldb-helper.h'.
>   (Robert)
> * s/__FSL_IMX_LDB__/__IMX_LDB_HELPER__/  for 'imx-ldb-helper.h'.
>
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
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 232 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h |  98 ++++++++++++
>  2 files changed, 330 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> new file mode 100644
> index 00000000..d01c4ff9
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2012 Sascha Hauer, Pengutronix
> + * Copyright 2019,2020 NXP
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#include "imx-ldb-helper.h"
> +
> +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
> +{
> +       return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
> +}
> +
> +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
> +{
> +       return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
> +              ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> +}
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
> diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> new file mode 100644
> index 00000000..748c378
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +/*
> + * Copyright 2019,2020 NXP
> + */
> +
> +#ifndef __IMX_LDB_HELPER__
> +#define __IMX_LDB_HELPER__
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
> +#endif /* __IMX_LDB_HELPER__ */
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
