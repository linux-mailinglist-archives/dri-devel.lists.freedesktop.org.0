Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F52127768
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 09:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0316189C51;
	Fri, 20 Dec 2019 08:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C543789862
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 08:45:00 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id z3so3346398qvn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 00:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vzSK70tmYICdI7ZCk1UcUGMpAjTFvS78MrydmHOHcYo=;
 b=do5tzFId6DnAg7EeJHqxprrYb8cSvaD5DBHa7s/gSCTHX5AyLZojRvr98qB52DJnMv
 S3NJbwbCVjJpYhVQbMlSMZrP+cO+PG6F+itH412oDmBgkbiZTbY00uXjzy7qP543A2b4
 tOHDVZPndett1spP7PEsFuCMWskvDzip2V7gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzSK70tmYICdI7ZCk1UcUGMpAjTFvS78MrydmHOHcYo=;
 b=cehCEobKjMfORRTM/qt4vtoS0dF27MxPRjKxLW0k0n2w3KT53sLskUbWFcd9r9emJu
 wO55g4tCG0k1LgwW5cawb7PEA13o4D2H2idnjWBzOnSmOc0aALhkvSPPSAEuoe102sA7
 JV+loBRis/c3GgqjirgaBaNZE10ISEX/Ovqi09fNoyjsJ+twenhxZ6HNh4PSfCNDBqVH
 Iee8bIH9LxEOf7H0qAk84hBHN0bvQnnYh/co0QS7elcjOJaEAKfCFyNktZ8OWPB6ykd4
 luyk23AiUspm8y3Mj44kETakt0kyvlU2WiTnPvc/orwLzQd6tMzEp1mZ7o1gJODg1egJ
 4tCg==
X-Gm-Message-State: APjAAAX7/Xzd4aGqQy/+ZdhgzkK8qU1CWycTB2zt5tLIHgaLf0BA/W2B
 1hNcv05C2Tya/x1q0FByRvFdiOqo0A1EDh0VASe2tQ==
X-Google-Smtp-Source: APXvYqwUhI78KjscQqqNQeAXom9IWeCdda1awqbRY8hxXzyAGqvLQfezMwTX66jthmsuGshJxdVmwQ9jcMlqhv8In08=
X-Received: by 2002:ad4:4182:: with SMTP id e2mr11549427qvp.187.1576831499557; 
 Fri, 20 Dec 2019 00:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20191220081738.1895-1-enric.balletbo@collabora.com>
 <20191220081738.1895-3-enric.balletbo@collabora.com>
In-Reply-To: <20191220081738.1895-3-enric.balletbo@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 20 Dec 2019 16:44:48 +0800
Message-ID: <CANMq1KBHsc8oqcjWnjLPCpRToyOm16X6EcQqmqPjZf=D7wA2-Q@mail.gmail.com>
Subject: Re: [PATCH v22 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 4:17 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> From: Jitao Shi <jitao.shi@mediatek.com>
>
> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [uli: followed API changes, removed FW update feature]
> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> [snip]
>
>  drivers/gpu/drm/bridge/Kconfig         |  11 +
>  drivers/gpu/drm/bridge/Makefile        |   1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c | 354 +++++++++++++++++++++++++

Half the size! Sounds great.

Mostly nits below.

>  3 files changed, 366 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/parade-ps8640.c
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> new file mode 100644
> index 000000000000..aa0045037f44
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -0,0 +1,354 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016 MediaTek Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#define PAGE2_GPIO_H           0xa7
> +#define PS_GPIO9               BIT(1)
> +#define PAGE2_I2C_BYPASS       0xea
> +#define I2C_BYPASS_EN          0xd0
> +#define PAGE2_MCS_EN           0xf3
> +#define MCS_EN                 BIT(0)
> +#define PAGE3_SET_ADD          0xfe
> +#define VDO_CTL_ADD            0x13
> +#define VDO_DIS                        0x18
> +#define VDO_EN                 0x1c
> +
> +/*
> + * PS8640 uses multiple addresses:
> + * page[0]: for DP control
> + * page[1]: for VIDEO Bridge
> + * page[2]: for control top
> + * page[3]: for DSI Link Control1
> + * page[4]: for MIPI Phy
> + * page[5]: for VPLL
> + * page[6]: for DSI Link Control2
> + * page[7]: for SPI ROM mapping
> + */
> +enum page_addr_offset {
> +       PAGE0_DP_CNTL = 0,
> +       PAGE1_VDO_BDG,
> +       PAGE2_TOP_CNTL,
> +       PAGE3_DSI_CNTL1,
> +       PAGE4_MIPI_PHY,
> +       PAGE5_VPLL,
> +       PAGE6_DSI_CNTL2,
> +       PAGE7_SPI_CNTL,
> +       MAX_DEVS
> +};
> +
> +struct ps8640 {
> +       struct drm_bridge bridge;
> +       struct drm_bridge *panel_bridge;
> +       struct mipi_dsi_device *dsi;
> +       struct i2c_client *page[MAX_DEVS];
> +       struct regulator_bulk_data supplies[2];
> +       struct gpio_desc *gpio_reset;
> +       struct gpio_desc *gpio_powerdown;
> +};
> +
> +static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> +{
> +       return container_of(e, struct ps8640, bridge);
> +}
> +
> +static int ps8640_bridge_unmute(struct ps8640 *ps_bridge)
> +{
> +       struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
> +       u8 vdo_ctrl_buf[] = { VDO_CTL_ADD, VDO_EN };

nit: const?

> +       int ret;
> +
> +       ret = i2c_smbus_write_i2c_block_data(client, PAGE3_SET_ADD,
> +                                            sizeof(vdo_ctrl_buf),
> +                                            vdo_ctrl_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int ps8640_bridge_mute(struct ps8640 *ps_bridge)
> +{
> +       struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
> +       u8 vdo_ctrl_buf[] = { VDO_CTL_ADD, VDO_DIS };

ditto

> +       int ret;
> +
> +       ret = i2c_smbus_write_i2c_block_data(client, PAGE3_SET_ADD,
> +                                            sizeof(vdo_ctrl_buf),
> +                                            vdo_ctrl_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}

Since the 2 functions are almost the same, you could shrink the driver
a bit further by merging them into one with a boolean parameter? (then
maybe give up on the const u8 comment).

> +
> +static void ps8640_pre_enable(struct drm_bridge *bridge)
> +{
> +       struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +       struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
> +       unsigned long timeout;
> +       int ret, status;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
> +                                   ps_bridge->supplies);
> +       if (ret < 0) {
> +               DRM_ERROR("cannot enable regulators %d\n", ret);
> +               return;
> +       }
> +
> +       gpiod_set_value(ps_bridge->gpio_powerdown, 1);
> +       gpiod_set_value(ps_bridge->gpio_reset, 0);
> +       usleep_range(2000, 2500);
> +       gpiod_set_value(ps_bridge->gpio_reset, 1);
> +
> +       /*
> +        * Wait for the ps8640 embedded MCU to be ready
> +        * First wait 200ms and then check the MCU ready flag every 20ms
> +        */
> +       msleep(200);
> +
> +       timeout = jiffies + msecs_to_jiffies(200) + 1;
> +
> +       while (time_is_after_jiffies(timeout)) {
> +               status = i2c_smbus_read_byte_data(client, PAGE2_GPIO_H);
> +               if (status < 0) {
> +                       DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", status);
> +                       goto err_regulators_disable;
> +               }
> +               if ((status & PS_GPIO9) == PS_GPIO9)
> +                       break;
> +
> +               msleep(20);
> +       }
> +
> +       msleep(50);
> +
> +       /*
> +        * The Manufacturer Command Set (MCS) is a device dependent interface
> +        * intended for factory programming of the display module default
> +        * parameters. Once the display module is configured, the MCS shall be
> +        * disabled by the manufacturer. Once disabled, all MCS commands are
> +        * ignored by the display interface.
> +        */
> +       status = i2c_smbus_read_byte_data(client, PAGE2_MCS_EN);
> +       if (status < 0) {
> +               DRM_ERROR("failed read PAGE2_MCS_EN: %d\n", status);
> +               goto err_regulators_disable;
> +       }
> +
> +       ret = i2c_smbus_write_byte_data(client, PAGE2_MCS_EN,
> +                                       status & ~MCS_EN);
> +       if (ret < 0) {
> +               DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
> +               goto err_regulators_disable;
> +       }
> +
> +       ret = ps8640_bridge_unmute(ps_bridge);
> +       if (ret)
> +               DRM_ERROR("failed to enable unmutevideo: %d\n", ret);

failed to unmute? Or failed to enable?

> +
> +       /* Switch access edp panel's edid through i2c */
> +       ret = i2c_smbus_write_byte_data(client, PAGE2_I2C_BYPASS,
> +                                       I2C_BYPASS_EN);
> +       if (ret < 0) {
> +               DRM_ERROR("failed write PAGE2_I2C_BYPASS: %d\n", ret);
> +               goto err_regulators_disable;
> +       }
> +
> +       return;
> +
> +err_regulators_disable:
> +       regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> +                              ps_bridge->supplies);
> +}
> +
> +static void ps8640_post_disable(struct drm_bridge *bridge)
> +{
> +       struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +       int ret;
> +
> +       ret = ps8640_bridge_mute(ps_bridge);
> +       if (ret < 0)
> +               DRM_ERROR("failed to unmutevideo: %d\n", ret);

ditto

> +
> +       gpiod_set_value(ps_bridge->gpio_reset, 0);
> +       gpiod_set_value(ps_bridge->gpio_powerdown, 0);
> +       ret = regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> +                                    ps_bridge->supplies);
> +       if (ret < 0)
> +               DRM_ERROR("cannot disable regulators %d\n", ret);
> +}
> +
> +int ps8640_bridge_attach(struct drm_bridge *bridge)
> +{
> +       struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +       struct device *dev = &ps_bridge->page[0]->dev;
> +       struct device_node *in_ep, *dsi_node;
> +       struct mipi_dsi_device *dsi;
> +       struct mipi_dsi_host *host;
> +       int ret;
> +       const struct mipi_dsi_device_info info = { .type = "ps8640",
> +                                                  .channel = 0,
> +                                                  .node = NULL,
> +                                                };
> +       /* port@0 is ps8640 dsi input port */
> +       in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> +       if (!in_ep)
> +               return -ENODEV;
> +
> +       dsi_node = of_graph_get_remote_port_parent(in_ep);
> +       of_node_put(in_ep);
> +       if (!dsi_node)
> +               return -ENODEV;
> +
> +       host = of_find_mipi_dsi_host_by_node(dsi_node);
> +       of_node_put(dsi_node);
> +       if (!host)
> +               return -ENODEV;
> +
> +       dsi = mipi_dsi_device_register_full(host, &info);
> +       if (IS_ERR(dsi)) {
> +               dev_err(dev, "failed to create dsi device\n");
> +               ret = PTR_ERR(dsi);
> +               return ret;
> +       }
> +
> +       ps_bridge->dsi = dsi;
> +
> +       dsi->host = host;
> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +                         MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +       dsi->format = MIPI_DSI_FMT_RGB888;
> +       dsi->lanes = 4;
> +       ret = mipi_dsi_attach(dsi);
> +       if (ret)
> +               goto err_dsi_attach;
> +
> +       /* Attach the panel-bridge to the dsi bridge */
> +       return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
> +                                &ps_bridge->bridge);
> +
> +err_dsi_attach:
> +       mipi_dsi_device_unregister(dsi);
> +       return ret;
> +}
> +
> +static const struct drm_bridge_funcs ps8640_bridge_funcs = {
> +       .attach = ps8640_bridge_attach,
> +       .post_disable = ps8640_post_disable,
> +       .pre_enable = ps8640_pre_enable,
> +};
> +
> +static int ps8640_probe(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       struct device_node *np = dev->of_node;
> +       struct ps8640 *ps_bridge;
> +       struct drm_panel *panel;
> +       int ret;
> +       u32 i;
> +
> +       ps_bridge = devm_kzalloc(dev, sizeof(*ps_bridge), GFP_KERNEL);
> +       if (!ps_bridge)
> +               return -ENOMEM;
> +
> +       /* port@1 is ps8640 output port */
> +       ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> +       if (ret < 0)
> +               return ret;
> +       if (!panel)
> +               return -ENODEV;
> +
> +       panel->connector_type = DRM_MODE_CONNECTOR_eDP;
> +
> +       ps_bridge->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +       if (IS_ERR(ps_bridge->panel_bridge))
> +               return PTR_ERR(ps_bridge->panel_bridge);
> +
> +       ps_bridge->supplies[0].supply = "vdd33";
> +       ps_bridge->supplies[1].supply = "vdd12";
> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->supplies),
> +                                     ps_bridge->supplies);
> +       if (ret)
> +               return ret;
> +
> +       ps_bridge->gpio_powerdown = devm_gpiod_get(&client->dev, "powerdown",
> +                                                  GPIOD_OUT_LOW);
> +       if (IS_ERR(ps_bridge->gpio_powerdown))
> +               return PTR_ERR(ps_bridge->gpio_powerdown);
> +
> +       /*
> +        * Request the reset pin low to avoid the bridge being
> +        * initialized prematurely
> +        */
> +       ps_bridge->gpio_reset = devm_gpiod_get(&client->dev, "reset",
> +                                              GPIOD_OUT_LOW);
> +       if (IS_ERR(ps_bridge->gpio_reset))
> +               return PTR_ERR(ps_bridge->gpio_reset);
> +
> +       ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
> +       ps_bridge->bridge.of_node = dev->of_node;
> +
> +       ps_bridge->page[PAGE0_DP_CNTL] = client;
> +
> +       for (i = 1; i < ARRAY_SIZE(ps_bridge->page); i++) {
> +               ps_bridge->page[i] = devm_i2c_new_dummy_device(&client->dev,
> +                                                            client->adapter,
> +                                                            client->addr + i);
> +               if (IS_ERR(ps_bridge->page[i])) {
> +                       dev_err(dev, "failed i2c dummy device, address%02x\n",

Space after address?

> +                               client->addr + i);
> +                       return PTR_ERR(ps_bridge->page[i]);
> +               }
> +       }
> +
> +       i2c_set_clientdata(client, ps_bridge);
> +
> +       drm_bridge_add(&ps_bridge->bridge);
> +
> +       return 0;
> +}
> +
> +static int ps8640_remove(struct i2c_client *client)
> +{
> +       struct ps8640 *ps_bridge = i2c_get_clientdata(client);
> +
> +       drm_bridge_remove(&ps_bridge->bridge);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id ps8640_match[] = {
> +       { .compatible = "parade,ps8640" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, ps8640_match);
> +
> +static struct i2c_driver ps8640_driver = {
> +       .probe_new = ps8640_probe,
> +       .remove = ps8640_remove,
> +       .driver = {
> +               .name = "ps8640",
> +               .of_match_table = ps8640_match,
> +       },
> +};
> +module_i2c_driver(ps8640_driver);
> +
> +MODULE_AUTHOR("Jitao Shi <jitao.shi@mediatek.com>");
> +MODULE_AUTHOR("CK Hu <ck.hu@mediatek.com>");

Since you just did a major refactor, do you want to add your name here?

> +MODULE_DESCRIPTION("PARADE ps8640 DSI-eDP converter driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.20.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
