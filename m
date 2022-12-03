Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB480641524
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 10:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC93610E18F;
	Sat,  3 Dec 2022 09:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402E588D18
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 09:03:54 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id i131so8705097ybc.9
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Dec 2022 01:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wijBlX/JM1G0Jpt0G/wdDKAqeWZzma/lbseUTYtPIfE=;
 b=qLnZH+uTIDSPXCsIHs1UeeMC+RCKRODcv7ZTxekCNtNNNMZR90q4xzVIQVctqtORjd
 RA7NcZX4zhGpyRH/F71pzDAW/ZzHtZkKW/L1crJfBbIQVfwJ7SbMT77J+hZKiOfUqS51
 tNK1OCuWGthiEGKW08LPdSYafFSQaxXAfptxFCGrjS9LwiL9lnQsRySRfwdMzaU/yctd
 tjsTrC8HtQ6MKhe4uMtQvpbCyU9tYbFrXTjinlPbNqNGLQFQ8XGSuxGwmIMzf8kdHqpo
 hexmUa11eTIwFTp9KKoysduPq248j+Yce8lZr7B2lf8xzAy//2lntUuIvMRAbeuQ0+Xo
 T0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wijBlX/JM1G0Jpt0G/wdDKAqeWZzma/lbseUTYtPIfE=;
 b=d/senVPPyFfiuIsqH7jfYKnxHuD/KJX0IM47RKZqbHo0G+PDCvmt56MCwwwNsU99cV
 4mZAl5D3VfEwLzXsexZJ7+M9o7vDdPyFkX/if0XRxoubrT+UVOvoLgsntxHbP2pM81Sw
 dpE3Se1WZzKXFvXeGjozdYxtoXlNRxoxzdj/nVkB8SlCbK6IZlnl7Cm/B6om9TbwAyy7
 ycz00XwiWbmt2i6wWUhcf24C87YhJUvHdDNeaSzOgkROWJ4pG4KOyr+CNg0OSTL8jdgx
 up7pzYsHe3BVItNPCaW9cuzFO+vCZhrop9gvgA/Iep7LFmMRSQ5NlilE3z8yeEdWoUyb
 b1eA==
X-Gm-Message-State: ANoB5pmXFRdDXdKl0fKuIsYPWqz+Azm4VQpqH8ENoL+C90EFqyccvwtq
 W1SyYbK3lt/Q3219l2BjoU7aY7EkECbaQ77SqAh7JQ==
X-Google-Smtp-Source: AA0mqf7qi2dWMHmmUQH4cBlnDMy3/tTYGcPS2xB4eNW4XHtEC1hmEPOeWU43m6B28n/vY+U9PEn7Gi8QqNhppZZziYA=
X-Received: by 2002:a25:d84d:0:b0:6f6:6d03:cdc3 with SMTP id
 p74-20020a25d84d000000b006f66d03cdc3mr28673864ybg.238.1670058233200; Sat, 03
 Dec 2022 01:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20221129172912.9576-1-macroalpha82@gmail.com>
 <20221129172912.9576-3-macroalpha82@gmail.com>
In-Reply-To: <20221129172912.9576-3-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Dec 2022 10:03:42 +0100
Message-ID: <CACRpkdZK9=Z1i3Uv=fwS=t=NXHJkucg9FYOCfog_qhomf9GV=w@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD
 panel
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

thanks for your patch!

overall this looks very good. Just some nitpicks.

On Tue, Nov 29, 2022 at 6:29 PM Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Support Samsung AMS495QA01 panel as found on the Anbernic RG503. Note
> This panel receives video signals via DSI, however it receives
> commands via 3-wire SPI.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

> +config DRM_PANEL_SAMSUNG_AMS495QA01
> +       tristate "Samsung AMS495QA01 DSI panel"

I am always a bit careful with these "Samsung" panels. Well the
panel is surely Samsungs and usually it has that name, but very often
it is mainly a display controller, made by someone else, then a physical
panel slapped on and then the actual display controller is obscured.

Typical example:
panel-novatek-nt35560.c handing Samsung ACX424AKP.

If you know the actual display controller, then the driver should be
renamed after that, but keeping the compatible and DT bindings
as is. The reason being that tomorrow there is an LG panel
using the same display controller and then we don't get duplicate
code.

It feels like this is a Novatek controller. Just a feeling I have.
Mostly from the way it does brightness using ELVSS and
gamma. But who knows.

> +       depends on OF && SPI
> +       depends on DRM_MIPI_DSI
> +       select DRM_MIPI_DBI

Nice that you use these helpers!

> +#include <linux/media-bus-format.h>
(...)
> +#include <linux/of_graph.h>

Hm. We get to this.

> +       /** @prepared: value tracking panel prepare status */
> +       bool prepared;

Drop this and associated code. The framework keeps track of this.

> +       /* Set gamma change */
> +       mipi_dbi_command(dbi, 0xf9, 0x00);

For cases like this where you know what the command does,
please add:

#define MCS_SET_GAMMA 0xf9

(MCS = Manufacturer Command Set, cf
drivers/gpu/drm/panel/panel-samsung-s6e63m0.h)

and collect them somewhere, then you can drop the comment
because it is self-evident what is going on.

> +       /* Undocumented command */
> +       mipi_dbi_command(dbi, 0x26, 0x00);
> +       /* Set ELVSS value */
> +       mipi_dbi_command(dbi, 0xb2, ams495qa01_elvss[tmp]);

Same.

> +static int ams495qa01_prepare(struct drm_panel *panel)
> +{
> +       struct ams495qa01 *db = to_ams495qa01(panel);
> +       struct mipi_dbi *dbi = &db->dbi;
> +       int ret;
> +
> +       if (db->prepared)
> +               return 0;

As mentioned skip this.

> +       /* Power up */
> +       ret = regulator_enable(db->reg_vdd);
> +       if (ret) {
> +               dev_err(db->dev, "failed to enable vdd regulator: %d\n", ret);
> +               return ret;
> +       }
> +       if (db->reg_elvdd) {

Do you really need to if() this? I thought the regulator
framework would just ignore the calls for an optional
regulator.

> +       /* Password to start command sequence */
> +       mipi_dbi_command(dbi, 0xf0, 0x5a, 0x5a);
> +       mipi_dbi_command(dbi, 0xf1, 0x5a, 0x5a);

Use the #defines from:
drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
I'm pretty sure they mean the same thing:

#define MCS_LEVEL_2_KEY         0xf0
#define MCS_MTP_KEY             0xf1

> +       /* Analog Power condition set */
> +       mipi_dbi_command(dbi, 0xf4, 0x33, 0x42, 0x00, 0x08);
> +       mipi_dbi_command(dbi, 0xf5, 0x00, 0x06, 0x26, 0x35, 0x03);

Define MCS_ commands.

> +       /* GTCON set */
> +       mipi_dbi_command(dbi, 0xf7, 0x20);
> +
> +       /* TEMP_SWIRE set */
> +       mipi_dbi_command(dbi, 0xb2, 0x06, 0x06, 0x06, 0x06);
> +
> +       /* ELVSS_CON set */
> +       mipi_dbi_command(dbi, 0xb1, 0x07, 0x00, 0x10);
> +
> +       /* Gateless signal set */
> +       mipi_dbi_command(dbi, 0xf8, 0x7f, 0x7a, 0x89, 0x67, 0x26, 0x38,
> +                        0x00, 0x00, 0x09, 0x67, 0x70, 0x88, 0x7a,
> +                        0x76, 0x05, 0x09, 0x23, 0x23, 0x23);

Dito

> +       db->prepared = true;

Drop.

> +static int ams495qa01_unprepare(struct drm_panel *panel)
> +{
> +       struct ams495qa01 *db = to_ams495qa01(panel);
> +       struct mipi_dbi *dbi = &db->dbi;
> +
> +       if (!db->prepared)
> +               return 0;

Drop.

> +static int ams495qa01_get_modes(struct drm_panel *panel,
> +                               struct drm_connector *connector)
> +{
> +       struct ams495qa01 *db = to_ams495qa01(panel);
> +       const struct ams495qa01_panel_info *panel_info = db->panel_info;
> +       struct drm_display_mode *mode;
> +       static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +       unsigned int i;
> +
> +       for (i = 0; i < panel_info->num_modes; i++) {
> +               mode = drm_mode_duplicate(connector->dev,
> +                                         &panel_info->display_modes[i]);
> +               if (!mode)
> +                       return -ENOMEM;
> +
> +               drm_mode_set_name(mode);
> +
> +               mode->type = DRM_MODE_TYPE_DRIVER;
> +               if (panel_info->num_modes == 1)
> +                       mode->type |= DRM_MODE_TYPE_PREFERRED;

I think you should probably set the preferred mode even
if there are several of them? But maybe just on the first
or something. (A bit unsure here, Sam?)

> +static int ams495qa01_probe(struct spi_device *spi)
> +{
> +       struct device *dev = &spi->dev;
> +       struct device_node *endpoint, *dsi_host_node;
(...)
> +       db->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);

I would request this GPIOD_OUT_HIGH so reset is asserted on probe.

> +       db->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);

And this GPIOD_OUT_LOW so panel is disabled after probe.

> +       /*
> +        * Get the DSI controller that is supplying data for this display
> +        * which is controlled via SPI 3-wire.
> +        */
> +       endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +       if (!endpoint) {
> +               dev_err(dev, "failed to get endpoint\n");
> +               return -ENODEV;
> +       }
> +       dsi_host_node = of_graph_get_remote_port_parent(endpoint);
> +       if (!dsi_host_node) {
> +               dev_err(dev, "failed to get remote port parent\n");
> +               goto put_endpoint;
> +       }
> +       dsi_host = of_find_mipi_dsi_host_by_node(dsi_host_node);
> +       if (!dsi_host) {
> +               dev_err(dev, "failed to find dsi host\n");
> +               goto put_host;
> +       }
> +       info.node = of_graph_get_remote_port(endpoint);
> +       if (!info.node) {
> +               dev_err(dev, "failed to get remote port node\n");
> +               ret = -ENODEV;
> +               goto put_host;
> +       }
> +
> +       db->dsi_dev = devm_mipi_dsi_device_register_full(dev, dsi_host, &info);

I don't get this part.

Why do you have to go through all this trouble when no other panel
drivers, not even the other SPI DBI panel drivers, does this?

drm_of_find_panel_or_bridge() should typically result in the core
doing all the lookup and connecting for you from the host side
should it not?

At the very least this requires a big comment about what is
going on and why and what makes this necessary.

I can only guess the following:

> +       db->dsi_dev->lanes = 2;
> +       db->dsi_dev->format = MIPI_DSI_FMT_RGB888;
> +       db->dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> +
> +       drm_panel_init(&db->panel, dev, &ams495qa01_drm_funcs,
> +                      DRM_MODE_CONNECTOR_DSI);

Pixel data passes to the display using DSI but all display control
is done over SPI, and the core will not help with this.

So from the display controller POV this is a DSI display
and from the display POV this is an SPI-controlled display.
So it sits on two buses. Data path is on DSI, control path
is on SPI.

This would be kind of odd actually, normally DSI displays
do the display control over DSI as well. SPI control is usually
used on DPI displays. But I'm not surprised.

If this is necessary, isn't this something we need to teach the
core to handle instead of adding quirks like this to all drivers that
have this characteristic?

Yours,
Linus Walleij
