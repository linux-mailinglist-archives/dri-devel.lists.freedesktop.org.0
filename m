Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3E31B8D7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8536E1BE;
	Mon, 15 Feb 2021 12:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82A989E52
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:16:43 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id z9so3806256pjl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 04:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DeDYtEfRi0hJefLwRou98WAyW17C6CotjGPrIaF6Opg=;
 b=R19TAtzhD29RvoNTbpygxJOV0JdPYzXw3XaevAa9Z77VBpcws1yAxgWOjcOEED5R/A
 X9dccd1JhZYV+oih5RiuB7f/2tF9bbeYBuZEIaZdFS5WG5aYHbr2LVSM23QokPazttVd
 h+bJjLNTy8mo19ohimwa/Mn7KF0iy+8Gj4GG7+CrXZJCgv5RZpizv89Ve+NrskN3eSUI
 /ALCKS95GpmfyMVugweVtnBU5yRyNVhsKXSDQ6fQMDhuG1KQO1u/aspdnKWDNOjCg3hN
 D6pZMKdO1WyZ5RBriFUuNVyZKFkw25BCz1fsSom7hGWYBRn7th2K2nbfJA4F7/OnarpO
 TEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DeDYtEfRi0hJefLwRou98WAyW17C6CotjGPrIaF6Opg=;
 b=savr/aMUPpZdVWs8uWhA4Pkx5ckFiKxRi6kCtaRuK+7CBPcj+I1PvyIDL4aGpCsj84
 27Kbe9k8mNqTQeh8KwOsH4fSKyC8PO1VK3mbGI1PlC4v2jK6MQGITXAhWWYFAGS6C3Lg
 xciPodWAIr2RkfmcQW0iC+A13CMqPTLEiFwNZJZ1GkIq+NaJLWtCjC84eMGsFVu2JlMA
 vMWA/itFhNvkyj2mZUM06WQRh/OV2vcKN5nKmLi5RsdQUH1piDMI85pWmSg7sRfDXyOj
 7Hmd85PhKxZhCNnTE9BWP6FE+xhUBltTol/1hMNvbloYis6TqlfK092jgzB366GnYlob
 hA2Q==
X-Gm-Message-State: AOAM530uJs9Tcvmu0Q8pnk5NbNTcWw9kdEC6hVs+iyF5FQDXkqPztC/p
 D5asMKm+GD1uCmevsVx/irSoOvK3pjiy+bOyuP/NlpM5f2ZwEw==
X-Google-Smtp-Source: ABdhPJxKJPXBIkrJvoCWKvjC0z3G5P9VbUUHAvWm84Y5OjBwtt29HQbzlUF7aOINyslFLRRuswfcwxxB/W9FM2bCC/8=
X-Received: by 2002:a17:90a:70c1:: with SMTP id a1mr671576pjm.19.1613391403368; 
 Mon, 15 Feb 2021 04:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
 <20210214175211.105107-2-jagan@amarulasolutions.com>
In-Reply-To: <20210214175211.105107-2-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 15 Feb 2021 13:16:32 +0100
Message-ID: <CAG3jFyvE1K7jkyaiPDQ8XpykbLMacAZhb5i67dJE=KucQwg_Zw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB
 bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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
 Jonas Karlman <jonas@kwiboo.se>, linux-amarula@amarulasolutions.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Jagan,

Thanks for submitting this driver, it looks really nice, but
checkpatch.pl has some minor issues with it. Again I'd suggest
deferring to the convertor->converter spelling change even though both
seem to be perfectly valid English.

With the below fixed, feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Sun, 14 Feb 2021 at 18:55, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.

WARNING: 'Convertor' may be misspelled - perhaps 'Converter'?
#6:
ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
                           ^^^^^^^^^


>
> It has a flexible configuration of MIPI DSI signal input and
> produce RGB565, RGB666, RGB888 output format.
>
> Add bridge driver for it.

Currently this driver only supports MIPI_DSI_FMT_RGB888, maybe this
should be noted in the commit msg.

>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - updated the driver to inline with new drm bridge style
>
>  MAINTAINERS                              |   6 +
>  drivers/gpu/drm/bridge/Kconfig           |  11 ++
>  drivers/gpu/drm/bridge/Makefile          |   1 +
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 222 +++++++++++++++++++++++
>  4 files changed, 240 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/chipone-icn6211.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d241b832aae..4f1084aae50d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5529,6 +5529,12 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
>  F:     drivers/gpu/drm/panel/panel-boe-himax8279d.c
>
> +DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTOR BRIDGE

WARNING: 'CONVERTOR' may be misspelled - perhaps 'CONVERTER'?
#30: FILE: MAINTAINERS:5533:
+DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTOR BRIDGE
                                                ^^^^^^^^^


> +M:     Jagan Teki <jagan@amarulasolutions.com>
> +S:     Maintained
> +F:     drivers/gpu/drm/bridge/chipone-icn6211.c
> +F:     Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
#34: FILE: MAINTAINERS:5537:
+F:     drivers/gpu/drm/bridge/chipone-icn6211.c
+F:     Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml


> +
>  DRM DRIVER FOR FARADAY TVE200 TV ENCODER
>  M:     Linus Walleij <linus.walleij@linaro.org>
>  S:     Maintained
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index e4110d6ca7b3..49d1565b7f25 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -27,6 +27,17 @@ config DRM_CDNS_DSI
>           Support Cadence DPI to DSI bridge. This is an internal
>           bridge and is meant to be directly embedded in a SoC.
>
> +config DRM_CHIPONE_ICN6211
> +       tristate "Chipone ICN6211 MIPI-DSI/RGB Convertor bridge"

WARNING: 'Convertor' may be misspelled - perhaps 'Converter'?
#48: FILE: drivers/gpu/drm/bridge/Kconfig:31:
+       tristate "Chipone ICN6211 MIPI-DSI/RGB Convertor bridge"
                                               ^^^^^^^^^


> +       depends on OF
> +       select DRM_MIPI_DSI
> +       select DRM_PANEL_BRIDGE
> +       help
> +         ICN6211 is MIPI-DSI/RGB Convertor bridge from chipone.

WARNING: 'Convertor' may be misspelled - perhaps 'Converter'?
#53: FILE: drivers/gpu/drm/bridge/Kconfig:36:
+         ICN6211 is MIPI-DSI/RGB Convertor bridge from chipone.
                                  ^^^^^^^^^

> +
> +         It has a flexible configuration of MIPI DSI signal input
> +         and produce RGB565, RGB666, RGB888 output format.
> +

WARNING: please write a paragraph that describes the config symbol fully
#47: FILE: drivers/gpu/drm/bridge/Kconfig:30:
+config DRM_CHIPONE_ICN6211


>  config DRM_CHRONTEL_CH7033
>         tristate "Chrontel CH7033 Video Encoder"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 86e7acc76f8d..3eb84b638988 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> +obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> new file mode 100644
> index 000000000000..3f478f21a4a5
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2020 Amarula Solutions(India)

2020-2021?

> + * Author: Jagan Teki <jagan@amarulasolutions.com>
> + */
> +
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_mipi_dsi.h>
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct chipone {
> +       struct device *dev;
> +       struct drm_bridge bridge;
> +       struct drm_bridge *panel_bridge;
> +       struct gpio_desc *reset_gpio;
> +};
> +
> +static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
> +{
> +       return container_of(bridge, struct chipone, bridge);
> +}
> +
> +static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
> +{
> +       return &bridge->encoder->crtc->state->adjusted_mode;
> +}
> +
> +static void chipone_post_disable(struct drm_bridge *bridge)
> +{
> +       struct chipone *icn = bridge_to_chipone(bridge);
> +
> +       gpiod_set_value(icn->reset_gpio, 0);
> +
> +       msleep(50);
> +}
> +
> +static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
> +                                   size_t len)
> +{
> +       struct mipi_dsi_device *dsi = to_mipi_dsi_device(icn->dev);
> +
> +       return mipi_dsi_generic_write(dsi, seq, len);
> +}
> +
> +#define CHIPONE_DSI(icn, seq...)                               \
> +       {                                                       \
> +               const u8 d[] = { seq };                         \
> +               chipone_dsi_write(icn, d, ARRAY_SIZE(d));       \
> +       }
> +
> +static void chipone_enable(struct drm_bridge *bridge)
> +{
> +       struct chipone *icn = bridge_to_chipone(bridge);
> +       struct drm_display_mode *mode = bridge_to_mode(bridge);
> +
> +       CHIPONE_DSI(icn, 0x7A, 0xC1);
> +
> +       /* lower 8 bits of hdisplay */
> +       CHIPONE_DSI(icn, 0x20, mode->hdisplay & 0xff);
> +
> +       /* lower 8 bits of vdisplay */
> +       CHIPONE_DSI(icn, 0x21, mode->vdisplay & 0xff);
> +
> +       /**
> +        * lsb nibble: 2nd nibble of hdisplay
> +        * msb nibble: 2nd nibble of vdisplay
> +        */
> +       CHIPONE_DSI(icn, 0x22, (((mode->hdisplay >> 8) & 0xf) |
> +                   (((mode->vdisplay >> 8) & 0xf) << 4)));
> +
> +       /* HFP */
> +       CHIPONE_DSI(icn, 0x23, mode->hsync_start - mode->hdisplay);
> +
> +       /* HSYNC */
> +       CHIPONE_DSI(icn, 0x24, mode->hsync_end - mode->hsync_start);
> +
> +       /* HBP */
> +       CHIPONE_DSI(icn, 0x25, mode->htotal - mode->hsync_end);
> +
> +       CHIPONE_DSI(icn, 0x26, 0x00);
> +
> +       /* VFP */
> +       CHIPONE_DSI(icn, 0x27, mode->vsync_start - mode->vdisplay);
> +
> +       /* VSYNC */
> +       CHIPONE_DSI(icn, 0x28, mode->vsync_end - mode->vsync_start);
> +
> +       /* VBP */
> +       CHIPONE_DSI(icn, 0x29, mode->vtotal - mode->vsync_end);
> +
> +       /* dsi specific sequence */
> +       CHIPONE_DSI(icn, MIPI_DCS_SET_TEAR_OFF, 0x80);
> +       CHIPONE_DSI(icn, MIPI_DCS_SET_ADDRESS_MODE, 0x28);
> +       CHIPONE_DSI(icn, 0xB5, 0xA0);
> +       CHIPONE_DSI(icn, 0x5C, 0xFF);
> +       CHIPONE_DSI(icn, MIPI_DCS_SET_COLUMN_ADDRESS, 0x01);
> +       CHIPONE_DSI(icn, MIPI_DCS_GET_POWER_SAVE, 0x92);
> +       CHIPONE_DSI(icn, 0x6B, 0x71);
> +       CHIPONE_DSI(icn, 0x69, 0x2B);
> +       CHIPONE_DSI(icn, MIPI_DCS_ENTER_SLEEP_MODE, 0x40);
> +       CHIPONE_DSI(icn, MIPI_DCS_EXIT_SLEEP_MODE, 0x98);
> +
> +       /* icn6211 specific sequence */
> +       CHIPONE_DSI(icn, 0xB6, 0x20);
> +       CHIPONE_DSI(icn, 0x51, 0x20);
> +       CHIPONE_DSI(icn, 0x09, 0x10);
> +
> +       msleep(120);
> +}
> +
> +static void chipone_pre_enable(struct drm_bridge *bridge)
> +{
> +       struct chipone *icn = bridge_to_chipone(bridge);
> +
> +       gpiod_set_value(icn->reset_gpio, 1);
> +       msleep(20);
> +
> +       gpiod_set_value(icn->reset_gpio, 0);
> +       msleep(20);
> +
> +       gpiod_set_value(icn->reset_gpio, 1);
> +       msleep(50);
> +}
> +
> +static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
> +{
> +       struct chipone *icn = bridge_to_chipone(bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, icn->panel_bridge, bridge, flags);
> +}
> +
> +static const struct drm_bridge_funcs chipone_bridge_funcs = {
> +       .post_disable = chipone_post_disable,
> +       .enable = chipone_enable,
> +       .pre_enable = chipone_pre_enable,
> +       .attach = chipone_attach,
> +};
> +
> +static int chipone_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct device *dev = &dsi->dev;
> +       struct drm_panel *panel;
> +       struct chipone *icn;
> +       int ret;
> +
> +       icn = devm_kzalloc(dev, sizeof(struct chipone), GFP_KERNEL);
> +       if (!icn)
> +               return -ENOMEM;
> +
> +       mipi_dsi_set_drvdata(dsi, icn);
> +       icn->dev = dev;
> +
> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +       dsi->format = MIPI_DSI_FMT_RGB888;
> +       dsi->lanes = 4;
> +
> +       icn->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(icn->reset_gpio)) {
> +               DRM_DEV_ERROR(dev, "failed to get reset GPIO\n");
> +               return PTR_ERR(icn->reset_gpio);
> +       }
> +
> +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> +       if (ret)
> +               return ret;
> +
> +       icn->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +       if (IS_ERR(icn->panel_bridge))
> +               return PTR_ERR(icn->panel_bridge);
> +
> +       icn->bridge.funcs = &chipone_bridge_funcs;
> +       icn->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +       icn->bridge.of_node = dev->of_node;
> +
> +       drm_bridge_add(&icn->bridge);
> +
> +       ret = mipi_dsi_attach(dsi);
> +       if (ret < 0) {
> +               drm_bridge_remove(&icn->bridge);
> +               dev_err(dev, "failed to attach dsi\n");
> +       }
> +
> +       return ret;
> +}
> +
> +static int chipone_remove(struct mipi_dsi_device *dsi)
> +{
> +       struct chipone *icn = mipi_dsi_get_drvdata(dsi);
> +
> +       mipi_dsi_detach(dsi);
> +       drm_bridge_remove(&icn->bridge);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id chipone_of_match[] = {
> +       { .compatible = "chipone,icn6211", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, chipone_of_match);
> +
> +static struct mipi_dsi_driver chipone_driver = {
> +       .probe = chipone_probe,
> +       .remove = chipone_remove,
> +       .driver = {
> +               .name = "chipone-icn6211",
> +               .owner = THIS_MODULE,
> +               .of_match_table = chipone_of_match,
> +       },
> +};
> +module_mipi_dsi_driver(chipone_driver);
> +
> +MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
> +MODULE_DESCRIPTION("Chipone ICN6211 MIPI-DSI to RGB Convertor Bridge");

WARNING: 'Convertor' may be misspelled - perhaps 'Converter'?
#298: FILE: drivers/gpu/drm/bridge/chipone-icn6211.c:221:
+MODULE_DESCRIPTION("Chipone ICN6211 MIPI-DSI to RGB Convertor Bridge");
                                                     ^^^^^^^^^


> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
