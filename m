Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FADA32631D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 14:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DD66E05A;
	Fri, 26 Feb 2021 13:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D576E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 13:08:00 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 201so6227965pfw.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 05:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tzbfgkTAyNzwu1QXGsyRHtE8D7jpqg1aWwO85PGpakc=;
 b=A9d94NYl+JdoHez6IIUVoYYGGYyHeUdM5FtRFjY1lKwP5C8tQYyzgE3MLl4zoJ2CDO
 Nk2uFJLcVmWYQVov5M3a5JWOb4yH0m0NKJrAECy3E34nEGFn5CAXmo2dlo3CqP6eYIYR
 29cZI9Wixauz6rqXJD0ev+Con89z9cXYEvVKRkCjNutgaR8NhOJ6COVB1s3vhCUx4e5n
 RoAboaaj+nqGw1Pa30VEk33bIbqtC3vAt7W+ZoUh3CV7WOliVWWPOpNmyJEcHEq2IUiO
 BgJzV6CGmbnZiS1bnaAow0VgK+EZibXPcRIqLJjMjpTVDU2c3u8k2BCAaa41mZJ+ItO+
 5kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tzbfgkTAyNzwu1QXGsyRHtE8D7jpqg1aWwO85PGpakc=;
 b=VN06+fron0At1afabnirkEpY2WM42+Qc1dgCE9JH08J9ttY7SyQHT/heFYCsQxhyeo
 ug0tW41Xlzwn7+MeY8iESj1ULCAFsr9wyjt5OOihZqnTTazBbCLkVJ9CrJRo/MF/GLXT
 VUolxTf4gjD76YX76Qlo8U11QGOw+kVUrbvtsyhz9GN2blKhkrGJ/BmqH3D5aPoEsslE
 c6ApHuqijcDXn8SW/cBYSGz7oeUbaK4Q2jsceqpUC97p12e/m7OSR77nnuAu1jdjrEyW
 Pt5n02qVwbTrmzrXtJtPfiMA7MNZASHMUI0eM/80mVYDIgWI6tj2x2rHhFp0VgZsBkn9
 Zmfw==
X-Gm-Message-State: AOAM531+SgtvShgxw3hm8OMt1Ix/XmXOuQ/vd/7RPvjI/0gAohAO1Auy
 cMyxzzPuS3mRouCRu6NGQtUaWQ9sHI+dmAEoYW0Zww==
X-Google-Smtp-Source: ABdhPJxlJqf6jsvBll/cK9x5MrNuv6EjLt4rwW1fXk5X7Tu0LGhY2490eYce6xhhWcmjTUCHwBH+Mbj68YpNfYWJ/a0=
X-Received: by 2002:a62:7888:0:b029:1ed:cc30:923e with SMTP id
 t130-20020a6278880000b02901edcc30923emr3336731pfc.12.1614344880265; Fri, 26
 Feb 2021 05:08:00 -0800 (PST)
MIME-Version: 1.0
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-6-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1613619715-28785-6-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 26 Feb 2021 14:07:49 +0100
Message-ID: <CAG3jFyufawQ=0UNgfbTgzkbqCYQ7LS-BMq7mXruX470iYBXMOw@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] drm/bridge: imx: Add i.MX8qm/qxp pixel combiner
 support
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

With the below nit straightened out, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 18 Feb 2021 at 04:58, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds a drm bridge driver for i.MX8qm/qxp pixel combiner.
> The pixel combiner takes two output streams from a single display
> controller and manipulates the two streams to support a number
> of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured
> as either one screen, two screens, or virtual screens.  The pixel
> combiner is also responsible for generating some of the control signals
> for the pixel link output channel.  For now, the driver only supports
> the bypass mode.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3->v4:
> * No change.
>
> v2->v3:
> * No change.
>
> v1->v2:
> * No change.
>
>  drivers/gpu/drm/bridge/Kconfig                     |   2 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/imx/Kconfig                 |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 452 +++++++++++++++++++++
>  5 files changed, 464 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
>  create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index e4110d6c..84944e0 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -256,6 +256,8 @@ source "drivers/gpu/drm/bridge/adv7511/Kconfig"
>
>  source "drivers/gpu/drm/bridge/cadence/Kconfig"
>
> +source "drivers/gpu/drm/bridge/imx/Kconfig"
> +
>  source "drivers/gpu/drm/bridge/synopsys/Kconfig"
>
>  endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 86e7acc..bc80cae 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -27,4 +27,5 @@ obj-$(CONFIG_DRM_NWL_MIPI_DSI) += nwl-dsi.o
>
>  obj-y += analogix/
>  obj-y += cadence/
> +obj-y += imx/
>  obj-y += synopsys/
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> new file mode 100644
> index 00000000..f1c91b6
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -0,0 +1,8 @@
> +config DRM_IMX8QXP_PIXEL_COMBINER
> +       tristate "Freescale i.MX8QM/QXP pixel combiner"
> +       depends on OF
> +       depends on COMMON_CLK
> +       select DRM_KMS_HELPER
> +       help
> +         Choose this to enable pixel combiner found in
> +         Freescale i.MX8qm/qxp processors.
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> new file mode 100644
> index 00000000..7d7c8d6
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> new file mode 100644
> index 00000000..cd5b1be
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -0,0 +1,452 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_print.h>
> +
> +#define PC_CTRL_REG                    0x0
> +#define  PC_COMBINE_ENABLE             BIT(0)
> +#define  PC_DISP_BYPASS(n)             BIT(1 + 21 * (n))
> +#define  PC_DISP_HSYNC_POLARITY(n)     BIT(2 + 11 * (n))
> +#define  PC_DISP_HSYNC_POLARITY_POS(n) DISP_HSYNC_POLARITY(n)
> +#define  PC_DISP_VSYNC_POLARITY(n)     BIT(3 + 11 * (n))
> +#define  PC_DISP_VSYNC_POLARITY_POS(n) DISP_VSYNC_POLARITY(n)
> +#define  PC_DISP_DVALID_POLARITY(n)    BIT(4 + 11 * (n))
> +#define  PC_DISP_DVALID_POLARITY_POS(n)        DISP_DVALID_POLARITY(n)
> +#define  PC_VSYNC_MASK_ENABLE          BIT(5)
> +#define  PC_SKIP_MODE                  BIT(6)
> +#define  PC_SKIP_NUMBER_MASK           GENMASK(12, 7)
> +#define  PC_SKIP_NUMBER(n)             FIELD_PREP(PC_SKIP_NUMBER_MASK, (n))
> +#define  PC_DISP0_PIX_DATA_FORMAT_MASK GENMASK(18, 16)
> +#define  PC_DISP0_PIX_DATA_FORMAT(fmt) \
> +                               FIELD_PREP(PC_DISP0_PIX_DATA_FORMAT_MASK, (fmt))
> +#define  PC_DISP1_PIX_DATA_FORMAT_MASK GENMASK(21, 19)
> +#define  PC_DISP1_PIX_DATA_FORMAT(fmt) \
> +                               FIELD_PREP(PC_DISP1_PIX_DATA_FORMAT_MASK, (fmt))
> +
> +#define PC_BUF_PARA_REG                        0x10

This register is unused, keeping it in here to avoid future headaches
seems like a good idea.

> +#define  PC_BUF_ACTIVE_DEPTH_MASK      GENMASK(10, 0)
> +#define  PC_BUF_ACTIVE_DEPTH(n)                FIELD_PREP(PC_BUF_ACTIVE_DEPTH_MASK, (n))
> +
> +#define PC_SW_RESET_REG                        0x20
> +#define  PC_SW_RESET_N                 BIT(0)
> +#define  PC_DISP_SW_RESET_N(n)         BIT(1 + (n))
> +#define  PC_FULL_RESET_N               (PC_SW_RESET_N |                \
> +                                        PC_DISP_SW_RESET_N(0) |        \
> +                                        PC_DISP_SW_RESET_N(1))
> +
> +#define PC_REG_SET                     0x4
> +#define PC_REG_CLR                     0x8
> +
> +#define DRIVER_NAME                    "imx8qxp-pixel-combiner"
> +
> +enum imx8qxp_pc_pix_data_format {
> +       RGB,
> +       YUV444,
> +       YUV422,
> +       SPLIT_RGB,

YUV444, YUV422 & SPLIT_RGB are also unused, but if their values are
compatible with the PC_DISP0_PIX_DATA_FORMAT macro I think keeping
them around for future reference is a good idea.

> +};
> +
> +struct imx8qxp_pc_channel {
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct imx8qxp_pc *pc;
> +       unsigned int stream_id;
> +       bool is_available;
> +};
> +
> +struct imx8qxp_pc {
> +       struct device *dev;
> +       struct imx8qxp_pc_channel ch[2];
> +       struct clk *clk_apb;
> +       void __iomem *base;
> +};
> +
> +static inline u32 imx8qxp_pc_read(struct imx8qxp_pc *pc, unsigned int offset)
> +{
> +       return readl(pc->base + offset);
> +}
> +
> +static inline void
> +imx8qxp_pc_write(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
> +{
> +       writel(value, pc->base + offset);
> +}
> +
> +static inline void
> +imx8qxp_pc_write_set(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
> +{
> +       imx8qxp_pc_write(pc, offset + PC_REG_SET, value);
> +}
> +
> +static inline void
> +imx8qxp_pc_write_clr(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
> +{
> +       imx8qxp_pc_write(pc, offset + PC_REG_CLR, value);
> +}
> +
> +static enum drm_mode_status
> +imx8qxp_pc_bridge_mode_valid(struct drm_bridge *bridge,
> +                            const struct drm_display_info *info,
> +                            const struct drm_display_mode *mode)
> +{
> +       if (mode->hdisplay > 2560)
> +               return MODE_BAD_HVALUE;
> +
> +       return MODE_OK;
> +}
> +
> +static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
> +                                   enum drm_bridge_attach_flags flags)
> +{
> +       struct imx8qxp_pc_channel *ch = bridge->driver_private;
> +       struct imx8qxp_pc *pc = ch->pc;
> +
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               DRM_DEV_ERROR(pc->dev,
> +                             "do not support creating a drm_connector\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!bridge->encoder) {
> +               DRM_DEV_ERROR(pc->dev, "missing encoder\n");
> +               return -ENODEV;
> +       }
> +
> +       return drm_bridge_attach(bridge->encoder,
> +                                ch->next_bridge, bridge,
> +                                DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static void
> +imx8qxp_pc_bridge_mode_set(struct drm_bridge *bridge,
> +                          const struct drm_display_mode *mode,
> +                          const struct drm_display_mode *adjusted_mode)
> +{
> +       struct imx8qxp_pc_channel *ch = bridge->driver_private;
> +       struct imx8qxp_pc *pc = ch->pc;
> +       u32 val;
> +       int ret;
> +
> +       ret = pm_runtime_get_sync(pc->dev);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(pc->dev,
> +                             "failed to get runtime PM sync: %d\n", ret);
> +
> +       ret = clk_prepare_enable(pc->clk_apb);
> +       if (ret)
> +               DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
> +                                                               __func__,  ret);
> +
> +       /* HSYNC to pixel link is active low. */
> +       imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
> +                               PC_DISP_HSYNC_POLARITY(ch->stream_id));
> +
> +       /* VSYNC to pixel link is active low. */
> +       imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
> +                               PC_DISP_VSYNC_POLARITY(ch->stream_id));
> +
> +       /* Data enable to pixel link is active high. */
> +       imx8qxp_pc_write_set(pc, PC_CTRL_REG,
> +                               PC_DISP_DVALID_POLARITY(ch->stream_id));
> +
> +       /* Mask the first frame output which may be incomplete. */
> +       imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_VSYNC_MASK_ENABLE);
> +
> +       /* Only support RGB currently. */
> +       val = imx8qxp_pc_read(pc, PC_CTRL_REG);
> +       if (ch->stream_id == 0) {
> +               val &= ~PC_DISP0_PIX_DATA_FORMAT_MASK;
> +               val |= PC_DISP0_PIX_DATA_FORMAT(RGB);
> +       } else {
> +               val &= ~PC_DISP1_PIX_DATA_FORMAT_MASK;
> +               val |= PC_DISP1_PIX_DATA_FORMAT(RGB);
> +       }
> +       imx8qxp_pc_write(pc, PC_CTRL_REG, val);
> +
> +       /* Only support bypass mode currently. */
> +       imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_DISP_BYPASS(ch->stream_id));
> +
> +       clk_disable_unprepare(pc->clk_apb);
> +}
> +
> +static void imx8qxp_pc_bridge_atomic_disable(struct drm_bridge *bridge,
> +                               struct drm_bridge_state *old_bridge_state)
> +{
> +       struct imx8qxp_pc_channel *ch = bridge->driver_private;
> +       struct imx8qxp_pc *pc = ch->pc;
> +       int ret;
> +
> +       ret = pm_runtime_put(pc->dev);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(pc->dev, "failed to put runtime PM: %d\n", ret);
> +}
> +
> +static const u32 imx8qxp_pc_bus_output_fmts[] = {
> +       MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
> +       MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
> +};
> +
> +static bool imx8qxp_pc_bus_output_fmt_supported(u32 fmt)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(imx8qxp_pc_bus_output_fmts); i++) {
> +               if (imx8qxp_pc_bus_output_fmts[i] == fmt)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static u32 *
> +imx8qxp_pc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *bridge_state,
> +                                       struct drm_crtc_state *crtc_state,
> +                                       struct drm_connector_state *conn_state,
> +                                       u32 output_fmt,
> +                                       unsigned int *num_input_fmts)
> +{
> +       u32 *input_fmts;
> +
> +       if (!imx8qxp_pc_bus_output_fmt_supported(output_fmt))
> +               return NULL;
> +
> +       *num_input_fmts = 1;
> +
> +       input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +       if (!input_fmts)
> +               return NULL;
> +
> +       switch (output_fmt) {
> +       case MEDIA_BUS_FMT_RGB888_1X36_CPADLO:
> +               input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X30_CPADLO;
> +               break;
> +       case MEDIA_BUS_FMT_RGB666_1X36_CPADLO:
> +               input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X30_CPADLO;
> +               break;
> +       default:
> +               kfree(input_fmts);
> +               input_fmts = NULL;
> +               break;
> +       }
> +
> +       return input_fmts;
> +}
> +
> +static u32 *
> +imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *bridge_state,
> +                                       struct drm_crtc_state *crtc_state,
> +                                       struct drm_connector_state *conn_state,
> +                                       unsigned int *num_output_fmts)
> +{
> +       *num_output_fmts = ARRAY_SIZE(imx8qxp_pc_bus_output_fmts);
> +       return kmemdup(imx8qxp_pc_bus_output_fmts,
> +                       sizeof(imx8qxp_pc_bus_output_fmts), GFP_KERNEL);
> +}
> +
> +static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset           = drm_atomic_helper_bridge_reset,
> +       .mode_valid             = imx8qxp_pc_bridge_mode_valid,
> +       .attach                 = imx8qxp_pc_bridge_attach,
> +       .mode_set               = imx8qxp_pc_bridge_mode_set,
> +       .atomic_disable         = imx8qxp_pc_bridge_atomic_disable,
> +       .atomic_get_input_bus_fmts =
> +                               imx8qxp_pc_bridge_atomic_get_input_bus_fmts,
> +       .atomic_get_output_bus_fmts =
> +                               imx8qxp_pc_bridge_atomic_get_output_bus_fmts,
> +};
> +
> +static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
> +{
> +       struct imx8qxp_pc *pc;
> +       struct imx8qxp_pc_channel *ch;
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np = dev->of_node;
> +       struct device_node *child, *remote;
> +       u32 i;
> +       int ret;
> +
> +       pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
> +       if (!pc)
> +               return -ENOMEM;
> +
> +       pc->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(pc->base))
> +               return PTR_ERR(pc->base);
> +
> +       pc->dev = dev;
> +
> +       pc->clk_apb = devm_clk_get(dev, "apb");
> +       if (IS_ERR(pc->clk_apb)) {
> +               ret = PTR_ERR(pc->clk_apb);
> +               if (ret != -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "failed to get apb clock: %d\n",
> +                                                                       ret);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, pc);
> +       pm_runtime_enable(dev);
> +
> +       for_each_available_child_of_node(np, child) {
> +               ret = of_property_read_u32(child, "reg", &i);
> +               if (ret || i > 1) {
> +                       ret = -EINVAL;
> +                       DRM_DEV_ERROR(dev,
> +                                     "invalid channel(%u) node address\n", i);
> +                       goto free_child;
> +               }
> +
> +               ch = &pc->ch[i];
> +               ch->pc = pc;
> +               ch->stream_id = i;
> +
> +               remote = of_graph_get_remote_node(child, 1, 0);
> +               if (!remote) {
> +                       ret = -ENODEV;
> +                       DRM_DEV_ERROR(dev,
> +                           "channel%u failed to get port1's remote node: %d\n",
> +                                                                       i, ret);
> +                       goto free_child;
> +               }
> +
> +               ch->next_bridge = of_drm_find_bridge(remote);
> +               if (!ch->next_bridge) {
> +                       of_node_put(remote);
> +                       ret = -EPROBE_DEFER;
> +                       DRM_DEV_DEBUG_DRIVER(dev,
> +                               "channel%u failed to find next bridge: %d\n",
> +                                                                       i, ret);
> +                       goto free_child;
> +               }
> +
> +               of_node_put(remote);
> +
> +               ch->bridge.driver_private = ch;
> +               ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
> +               ch->bridge.of_node = child;
> +               ch->is_available = true;
> +
> +               drm_bridge_add(&ch->bridge);
> +       }
> +
> +       return 0;
> +
> +free_child:
> +       of_node_put(child);
> +
> +       if (i == 1 && pc->ch[0].next_bridge)
> +               drm_bridge_remove(&pc->ch[0].bridge);
> +
> +       pm_runtime_disable(dev);
> +       return ret;
> +}
> +
> +static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
> +{
> +       struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
> +       struct imx8qxp_pc_channel *ch;
> +       int i;
> +
> +       for (i = 0; i < 2; i++) {
> +               ch = &pc->ch[i];
> +
> +               if (!ch->is_available)
> +                       continue;
> +
> +               drm_bridge_remove(&ch->bridge);
> +               ch->is_available = false;
> +       }
> +
> +       pm_runtime_disable(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
> +       int ret;
> +
> +       ret = clk_prepare_enable(pc->clk_apb);
> +       if (ret)
> +               DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
> +                                                               __func__,  ret);
> +
> +       /* Disable pixel combiner by full reset. */
> +       imx8qxp_pc_write_clr(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
> +
> +       clk_disable_unprepare(pc->clk_apb);
> +
> +       /* Ensure the reset takes effect. */
> +       usleep_range(10, 20);
> +
> +       return ret;
> +}
> +
> +static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
> +       int ret;
> +
> +       ret = clk_prepare_enable(pc->clk_apb);
> +       if (ret) {
> +               DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
> +                                                               __func__, ret);
> +               return ret;
> +       }
> +
> +       /* out of reset */
> +       imx8qxp_pc_write_set(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
> +
> +       clk_disable_unprepare(pc->clk_apb);
> +
> +       return ret;
> +}
> +
> +static const struct dev_pm_ops imx8qxp_pc_pm_ops = {
> +       SET_RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend,
> +                          imx8qxp_pc_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id imx8qxp_pc_dt_ids[] = {
> +       { .compatible = "fsl,imx8qm-pixel-combiner", },
> +       { .compatible = "fsl,imx8qxp-pixel-combiner", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
> +
> +static struct platform_driver imx8qxp_pc_bridge_driver = {
> +       .probe  = imx8qxp_pc_bridge_probe,
> +       .remove = imx8qxp_pc_bridge_remove,
> +       .driver = {
> +               .pm = &imx8qxp_pc_pm_ops,
> +               .name = DRIVER_NAME,
> +               .of_match_table = imx8qxp_pc_dt_ids,
> +       },
> +};
> +module_platform_driver(imx8qxp_pc_bridge_driver);
> +
> +MODULE_DESCRIPTION("i.MX8QM/QXP pixel combiner bridge driver");
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
