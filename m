Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C805132A19B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 14:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB746E10A;
	Tue,  2 Mar 2021 13:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC5A6E10A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 13:54:11 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id u12so2038435pjr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 05:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8S7PNftm7oYv7qvavsxyYzrGV/rkszu4y/GO7OeWvEg=;
 b=bxzW6pMr51AzquJih0X8bZaPUjfzWiPADUp9e+kdb5axkEnGjBS2CI25GqAxT/6ffY
 r63uedqkPRSPfxKVpyllUVF8L+w8uOAVOkLP3Ow1r9vK8unzZFgmviov/ub2Y5KzYrEA
 G9qs+Jqu/+/d5SFlpWzOn2jHv5KNK2zjXAmJ61/hl5rD5///MO1s86vO2lhHIsJ4qBhR
 h1tWGhdliiFCTgbu5T1su+zyaGgmRc4kcC0THTuMiE8wgUELdFIiZPoLcFJ+uiSTGLOb
 0uYGv3g3vMvPgbQ8R0nzRJVhA55nXPWia0YcUpuVwzwBl+3MJA6P+hLAI7r6PjwlpxKQ
 NtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8S7PNftm7oYv7qvavsxyYzrGV/rkszu4y/GO7OeWvEg=;
 b=Xvp/qFGQP39tpCiTTMpI9+LFWR9B2VK46/MhtAv23d4vmFMjznbfpFAZK5qhpTz1Ki
 gNcI1e2TIGDuyIuUw3WAUjOSVB3z/lrqT0sG0Rm8lVlp+vwq51bdgtWea6KFpuTDqAWO
 sPkQWd3emk5lYxk9XQ8B6yLrV9m2LmCPLY6FeblxG9mKBrTXU0jYROcODfa+R50KVRAK
 xno5+FvALEWwP/Zg9hl3JdUY7a1e87sF4RqjAGz7q6NNwlWi4pZ9Wpq6zyrhMS25pNQa
 pijaTF/NSnoVEJ/X5HT1Ef/7dp0uVxk6dhE8S/4PYoQi2tuXSDu8MW/B0iKSN/kLaIZ5
 +Y3w==
X-Gm-Message-State: AOAM530Tui22qoef5pLZrRO6tKYbYJ+iM5Ed3+pI0dsLdlEXSfuSlih0
 hlclhfmUxjhuh5/9lhvjs1NKZBttR9piYXHv0j1GCQ==
X-Google-Smtp-Source: ABdhPJzZ0iYI7gvgGA4IoDxrHZcRchb0jzt0bcOnR+n6GvT95kY1Ch/XMromADk3mKac56sRh5VN4D3cNHreyWeaiNo=
X-Received: by 2002:a17:902:f68a:b029:e5:b17f:9154 with SMTP id
 l10-20020a170902f68ab02900e5b17f9154mr4064607plg.28.1614693251072; Tue, 02
 Mar 2021 05:54:11 -0800 (PST)
MIME-Version: 1.0
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-8-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1613619715-28785-8-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 2 Mar 2021 14:53:58 +0100
Message-ID: <CAG3jFyuncs+BznKUV2M8zfMt_PCwyq+wps_wRB8QaOYxezXzOg@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel
 link support
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

I only have one comment below. With that addressed, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 18 Feb 2021 at 04:59, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
> The pixel link forms a standard asynchronous linkage between
> pixel sources(display controller or camera module) and pixel
> consumers(imaging or displays).  It consists of two distinct
> functions, a pixel transfer function and a control interface.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3->v4:
> * No change.
>
> v2->v3:
> * Drop two macros which help define functions and define them directly.
> * Properly disable all pixel link controls to POR value by calling
>   imx8qxp_pixel_link_disable_all_controls() from
>   imx8qxp_pixel_link_bridge_probe().
>
> v1->v2:
> * Rewrite the function to find the next bridge by properly using OF APIs
>   and dropping unnecessary DT validation. (Rob)
>
>  drivers/gpu/drm/bridge/imx/Kconfig              |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile             |   1 +
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 426 ++++++++++++++++++++++++
>  3 files changed, 435 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index f1c91b6..4d1f027 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -6,3 +6,11 @@ config DRM_IMX8QXP_PIXEL_COMBINER
>         help
>           Choose this to enable pixel combiner found in
>           Freescale i.MX8qm/qxp processors.
> +
> +config DRM_IMX8QXP_PIXEL_LINK
> +       tristate "Freescale i.MX8QM/QXP display pixel link"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       help
> +         Choose this to enable display pixel link found in
> +         Freescale i.MX8qm/qxp processors.
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 7d7c8d6..c15469f 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> new file mode 100644
> index 00000000..2e5ba4a
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -0,0 +1,426 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#include <linux/firmware/imx/svc/misc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_print.h>
> +
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +
> +#define DRIVER_NAME            "imx8qxp-display-pixel-link"
> +#define PL_MAX_MST_ADDR                3
> +#define PL_MAX_NEXT_BRIDGES    2
> +
> +struct imx8qxp_pixel_link {
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct device *dev;
> +       struct imx_sc_ipc *ipc_handle;
> +       int id;
> +       int stream_id;
> +       int dc_id;
> +       u32 sink_rsc;
> +       u32 mst_addr;
> +       u8 mst_addr_ctrl;
> +       u8 mst_en_ctrl;
> +       u8 mst_vld_ctrl;
> +       u8 sync_ctrl;
> +};
> +
> +static void imx8qxp_pixel_link_enable_mst_en(struct imx8qxp_pixel_link *pl)
> +{
> +       int ret;
> +
> +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +                                     pl->mst_en_ctrl, true);
> +       if (ret)
> +               DRM_DEV_ERROR(pl->dev,
> +                       "failed to enable DC%d stream%d pixel link mst_en: %d\n",
> +                                               pl->dc_id, pl->stream_id, ret);
> +}
> +
> +static void imx8qxp_pixel_link_enable_mst_vld(struct imx8qxp_pixel_link *pl)
> +{
> +       int ret;
> +
> +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +                                     pl->mst_vld_ctrl, true);
> +       if (ret)
> +               DRM_DEV_ERROR(pl->dev,
> +               "failed to enable DC%d stream%d pixel link mst_vld: %d\n",
> +                                               pl->dc_id, pl->stream_id, ret);
> +}
> +
> +static void imx8qxp_pixel_link_enable_sync(struct imx8qxp_pixel_link *pl)
> +{
> +       int ret;
> +
> +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +                                     pl->sync_ctrl, true);
> +       if (ret)
> +               DRM_DEV_ERROR(pl->dev,
> +                       "failed to enable DC%d stream%d pixel link sync: %d\n",
> +                                               pl->dc_id, pl->stream_id, ret);
> +}
> +
> +static int imx8qxp_pixel_link_disable_mst_en(struct imx8qxp_pixel_link *pl)
> +{
> +       int ret;
> +
> +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +                                     pl->mst_en_ctrl, false);
> +       if (ret)
> +               DRM_DEV_ERROR(pl->dev,
> +               "failed to disable DC%d stream%d pixel link mst_en: %d\n",
> +                                               pl->dc_id, pl->stream_id, ret);
> +
> +       return ret;
> +}
> +
> +static int imx8qxp_pixel_link_disable_mst_vld(struct imx8qxp_pixel_link *pl)
> +{
> +       int ret;
> +
> +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +                                     pl->mst_vld_ctrl, false);
> +       if (ret)
> +               DRM_DEV_ERROR(pl->dev,
> +               "failed to disable DC%d stream%d pixel link mst_vld: %d\n",
> +                                               pl->dc_id, pl->stream_id, ret);
> +
> +       return ret;
> +}
> +
> +static int imx8qxp_pixel_link_disable_sync(struct imx8qxp_pixel_link *pl)
> +{
> +       int ret;
> +
> +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +                                     pl->sync_ctrl, false);
> +       if (ret)
> +               DRM_DEV_ERROR(pl->dev,
> +                       "failed to disable DC%d stream%d pixel link sync: %d\n",
> +                                               pl->dc_id, pl->stream_id, ret);
> +
> +       return ret;
> +}
> +
> +static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
> +{
> +       int ret;
> +
> +       ret = imx_sc_misc_set_control(pl->ipc_handle,
> +                                     pl->sink_rsc, pl->mst_addr_ctrl,
> +                                     pl->mst_addr);
> +       if (ret)
> +               DRM_DEV_ERROR(pl->dev,
> +                   "failed to set DC%d stream%d pixel link mst addr(%u): %d\n",
> +                   pl->dc_id, pl->stream_id, pl->mst_addr, ret);
> +}
> +
> +static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
> +                                           enum drm_bridge_attach_flags flags)
> +{
> +       struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               DRM_DEV_ERROR(pl->dev,
> +                             "do not support creating a drm_connector\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!bridge->encoder) {
> +               DRM_DEV_ERROR(pl->dev, "missing encoder\n");
> +               return -ENODEV;
> +       }
> +
> +       return drm_bridge_attach(bridge->encoder,
> +                                pl->next_bridge, bridge,
> +                                DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static void
> +imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
> +                                  const struct drm_display_mode *mode,
> +                                  const struct drm_display_mode *adjusted_mode)
> +{
> +       struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +       imx8qxp_pixel_link_set_mst_addr(pl);
> +}
> +
> +static void imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
> +                             struct drm_bridge_state *old_bridge_state)
> +{
> +       struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +       imx8qxp_pixel_link_enable_mst_en(pl);
> +       imx8qxp_pixel_link_enable_mst_vld(pl);
> +       imx8qxp_pixel_link_enable_sync(pl);
> +}
> +
> +static void imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
> +                               struct drm_bridge_state *old_bridge_state)
> +{
> +       struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +       imx8qxp_pixel_link_disable_mst_en(pl);
> +       imx8qxp_pixel_link_disable_mst_vld(pl);
> +       imx8qxp_pixel_link_disable_sync(pl);
> +}
> +
> +static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
> +       MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
> +       MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
> +};
> +
> +static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts); i++) {
> +               if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static u32 *
> +imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *bridge_state,
> +                                       struct drm_crtc_state *crtc_state,
> +                                       struct drm_connector_state *conn_state,
> +                                       u32 output_fmt,
> +                                       unsigned int *num_input_fmts)
> +{
> +       u32 *input_fmts;
> +
> +       if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
> +               return NULL;
> +
> +       *num_input_fmts = 1;
> +
> +       input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +       if (!input_fmts)
> +               return NULL;
> +
> +       input_fmts[0] = output_fmt;
> +
> +       return input_fmts;
> +}
> +
> +static u32 *
> +imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *bridge_state,
> +                                       struct drm_crtc_state *crtc_state,
> +                                       struct drm_connector_state *conn_state,
> +                                       unsigned int *num_output_fmts)
> +{
> +       *num_output_fmts = ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
> +       return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
> +                       sizeof(imx8qxp_pixel_link_bus_output_fmts), GFP_KERNEL);
> +}
> +
> +static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset           = drm_atomic_helper_bridge_reset,
> +       .attach                 = imx8qxp_pixel_link_bridge_attach,
> +       .mode_set               = imx8qxp_pixel_link_bridge_mode_set,
> +       .atomic_enable          = imx8qxp_pixel_link_bridge_atomic_enable,
> +       .atomic_disable         = imx8qxp_pixel_link_bridge_atomic_disable,
> +       .atomic_get_input_bus_fmts =
> +                       imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts,
> +       .atomic_get_output_bus_fmts =
> +                       imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts,
> +};
> +
> +static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl)
> +{
> +       int ret;
> +
> +       ret = imx8qxp_pixel_link_disable_mst_en(pl);
> +       if (ret)
> +               return ret;
> +
> +       ret = imx8qxp_pixel_link_disable_mst_vld(pl);
> +       if (ret)
> +               return ret;
> +
> +       return imx8qxp_pixel_link_disable_sync(pl);
> +}
> +
> +static struct drm_bridge *
> +imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
> +{
> +       struct device_node *np = pl->dev->of_node;
> +       struct device_node *port, *remote;
> +       struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
> +       u32 port_id;
> +       bool found_port = false;
> +       int reg, ep_cnt = 0;
> +       int bridge_sel = 0;     /* select the first next bridge by default */

Is this comment on the wrong line?

> +
> +       for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
> +               port = of_graph_get_port_by_id(np, port_id);
> +               if (!port)
> +                       continue;
> +
> +               if (of_device_is_available(port)) {
> +                       found_port = true;
> +                       of_node_put(port);
> +                       break;
> +               }
> +
> +               of_node_put(port);
> +       }
> +
> +       if (!found_port) {
> +               DRM_DEV_ERROR(pl->dev, "no available output port\n");
> +               return ERR_PTR(-ENODEV);
> +       }
> +
> +       for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
> +               remote = of_graph_get_remote_node(np, port_id, reg);
> +               if (!remote)
> +                       continue;
> +
> +               if (!of_device_is_available(remote->parent)) {
> +                       DRM_DEV_DEBUG(pl->dev,
> +                          "port%u endpoint%u remote parent is not available\n",
> +                                                               port_id, reg);
> +                       of_node_put(remote);
> +                       continue;
> +               }
> +
> +               next_bridge[ep_cnt] = of_drm_find_bridge(remote);
> +               if (!next_bridge[ep_cnt]) {
> +                       of_node_put(remote);
> +                       return ERR_PTR(-EPROBE_DEFER);
> +               }
> +
> +               /* specially select the next bridge with companion PXL2DPI */
> +               if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
> +                       bridge_sel = ep_cnt;
> +
> +               ep_cnt++;
> +
> +               of_node_put(remote);
> +       }
> +
> +       pl->mst_addr = port_id - 1;
> +
> +       return next_bridge[bridge_sel];
> +}
> +
> +static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
> +{
> +       struct imx8qxp_pixel_link *pl;
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np = dev->of_node;
> +       int ret;
> +
> +       pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
> +       if (!pl)
> +               return -ENOMEM;
> +
> +       ret = imx_scu_get_handle(&pl->ipc_handle);
> +       if (ret) {
> +               if (ret != -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> +                                                                       ret);
> +               return ret;
> +       }
> +
> +       pl->id = of_alias_get_id(np, "dc_pl");
> +       if (pl->id < 0) {
> +               DRM_DEV_ERROR(dev,
> +                             "failed to get pixel link node alias id: %d\n",
> +                                                               pl->id);
> +               return pl->id;
> +       }
> +
> +       pl->dev = dev;
> +
> +       pl->dc_id = pl->id / 2;
> +       pl->stream_id = pl->id % 2;
> +
> +       pl->sink_rsc = pl->dc_id ? IMX_SC_R_DC_1 : IMX_SC_R_DC_0;
> +
> +       if (pl->stream_id == 0) {
> +               pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST1_ADDR;
> +               pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST1_ENB;
> +               pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST1_VLD;
> +               pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL0;
> +       } else {
> +               pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST2_ADDR;
> +               pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST2_ENB;
> +               pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST2_VLD;
> +               pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL1;
> +       }
> +
> +       /* disable all controls to POR default */
> +       ret = imx8qxp_pixel_link_disable_all_controls(pl);
> +       if (ret)
> +               return ret;
> +
> +       pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
> +       if (IS_ERR(pl->next_bridge)) {
> +               ret = PTR_ERR(pl->next_bridge);
> +               if (ret != -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
> +                                                                       ret);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, pl);
> +
> +       pl->bridge.driver_private = pl;
> +       pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
> +       pl->bridge.of_node = np;
> +
> +       drm_bridge_add(&pl->bridge);
> +
> +       return ret;
> +}
> +
> +static int imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
> +{
> +       struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
> +
> +       drm_bridge_remove(&pl->bridge);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {
> +       { .compatible = "fsl,imx8qm-dc-pixel-link", },
> +       { .compatible = "fsl,imx8qxp-dc-pixel-link", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
> +
> +static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
> +       .probe  = imx8qxp_pixel_link_bridge_probe,
> +       .remove = imx8qxp_pixel_link_bridge_remove,
> +       .driver = {
> +               .of_match_table = imx8qxp_pixel_link_dt_ids,
> +               .name = DRIVER_NAME,
> +       },
> +};
> +module_platform_driver(imx8qxp_pixel_link_bridge_driver);
> +
> +MODULE_DESCRIPTION("i.MX8QXP/QM display pixel link bridge driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRIVER_NAME);
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
