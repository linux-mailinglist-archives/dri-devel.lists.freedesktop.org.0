Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE615F8D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 22:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC7A6E881;
	Fri, 14 Feb 2020 21:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0C36E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 21:36:51 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f3so7892835qtc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 13:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m5KhOE4PNvZoXF3TifI93A6Lvas9K0K338Uwk0AYe14=;
 b=XBuvKO9eFrZxIPtIkiartRvhLhvtMV3tqRh8XfjNDIgpbsc+9IrjccKh7csGA7HsGC
 HzpORi6qAW06uHBdIitFNx0IQbhjDUBWHs/ROA3X0dxSWtLTdRjZbAV7Pjy9/LSAgo7P
 eUyqmyppyzXt/jDCf3yGCTfXXYKAFpGaVp9X8+kaWr1er7POHUxaNkhOo+vM5xjOSe2P
 erUaNqQ16AWo6NkmO2JZgSMcjafFspyFBdIA/WBAYck8akNtkh7B1UEENxHIm2+bwuhs
 OpjQuPtzqksbz+fzkUUaVPx0jZ+rKbr6WHC1/T9bd1b+2OAqfOVzBMrplq38q2vX2Zm2
 Xfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m5KhOE4PNvZoXF3TifI93A6Lvas9K0K338Uwk0AYe14=;
 b=QPvcaHWyGnnNtGiBk+1+Vk/JJ8w9AiIqgKRUm6Hkywv3EYh/7EWq6P7tXFWKZyoGz4
 8tjhqxMzymqcah+i64O78JA9RZ0BbKs/6epKikKOUwXxelmt6jgc5rgS3UAzSZr0JV9z
 EQJEBiTTj1S1elVQ3l6iMt/LoKyPt9QMeyrCZJV5/5K1hRY3qMHsTi2Fg/7cbbYvWd54
 TcZHnn1dY//FD+UC2YSi13tyGtGoxdtZ43EfAIuzE705q2jgjtFx2GIPMYpWlEPXlXmZ
 CPrzSowY2U0J9zhFv2LxiT3EkZf+4BRVfTn9eprdrg5Nl8rBQpRNGvHWThoPCN+CUNr4
 DC0w==
X-Gm-Message-State: APjAAAVT0aBVklNpcIyusuwVjnjIiYQXiDGWXIcGpZTUQB67SrpuxqzQ
 Lc1i5o0WI3FBsarzsDG6ttLfG6RM/zOYRefyKlE=
X-Google-Smtp-Source: APXvYqy8FMbNdPTX5FDUlBNHG3WKwaklHvSCumiPPrua9S/dcDEyPUqRf/ATgl5q4nHKRydpwQdTzUIGanTSLruIzzo=
X-Received: by 2002:ac8:3418:: with SMTP id u24mr4217596qtb.87.1581716210577; 
 Fri, 14 Feb 2020 13:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
In-Reply-To: <20200213145416.890080-2-enric.balletbo@collabora.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 14 Feb 2020 13:36:24 -0800
Message-ID: <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 6:54 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> From: Nicolas Boichat <drinkcat@chromium.org>
>
> ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
> that has an internal microcontroller.
>
> The only reason a Linux kernel driver is necessary is to reject
> resolutions that require more bandwidth than what is available on
> the DP side. DP bandwidth and lane count are reported by the bridge
> via 2 registers on I2C.

It is true only for your particular platform where usb-c part is
managed by firmware. Pinephone has the same anx7688 but linux will
need a driver that manages usb-c in addition to DP.

I'd suggest making it MFD driver from the beginning, or at least make
proper bindings so we don't have to rework it and introduce binding
incompatibilities in future.

> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
> Changes in v2:
> - Move driver to drivers/gpu/drm/bridge/analogix.
> - Make the driver OF only so we can reduce the ifdefs.
> - Update the Copyright to 2020.
> - Use probe_new so we can get rid of the i2c_device_id table.
>
>  drivers/gpu/drm/bridge/analogix/Kconfig       |  12 ++
>  drivers/gpu/drm/bridge/analogix/Makefile      |   1 +
>  .../drm/bridge/analogix/analogix-anx7688.c    | 188 ++++++++++++++++++
>  3 files changed, 201 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
>
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> index e1fa7d820373..af7c2939403c 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -11,6 +11,18 @@ config DRM_ANALOGIX_ANX6345
>           ANX6345 transforms the LVTTL RGB output of an
>           application processor to eDP or DisplayPort.
>
> +config DRM_ANALOGIX_ANX7688
> +       tristate "Analogix ANX7688 bridge"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       select REGMAP_I2C
> +       help
> +         ANX7688 is an ultra-low power 4k Ultra-HD (4096x2160p60)
> +         mobile HD transmitter designed for portable devices. The
> +         ANX7688 converts HDMI 2.0 to DisplayPort 1.3 Ultra-HD
> +         including an intelligent crosspoint switch to support
> +         USB Type-C.
> +
>  config DRM_ANALOGIX_ANX78XX
>         tristate "Analogix ANX78XX bridge"
>         select DRM_ANALOGIX_DP
> diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> index 97669b374098..27cd73635c8c 100644
> --- a/drivers/gpu/drm/bridge/analogix/Makefile
> +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o analogix-i2c-dptx.o
>  obj-$(CONFIG_DRM_ANALOGIX_ANX6345) += analogix-anx6345.o
> +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
>  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
>  obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> new file mode 100644
> index 000000000000..10a7cd0f9126
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ANX7688 HDMI->DP bridge driver
> + *
> + * Copyright 2020 Google LLC
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <drm/drm_bridge.h>
> +
> +/* Register addresses */
> +#define VENDOR_ID_REG 0x00
> +#define DEVICE_ID_REG 0x02
> +
> +#define FW_VERSION_REG 0x80
> +
> +#define DP_BANDWIDTH_REG 0x85
> +#define DP_LANE_COUNT_REG 0x86
> +
> +#define VENDOR_ID 0x1f29
> +#define DEVICE_ID 0x7688
> +
> +/* First supported firmware version (0.85) */
> +#define MINIMUM_FW_VERSION 0x0085
> +
> +struct anx7688 {
> +       struct drm_bridge bridge;
> +       struct i2c_client *client;
> +       struct regmap *regmap;
> +
> +       bool filter;
> +};
> +
> +static inline struct anx7688 *bridge_to_anx7688(struct drm_bridge *bridge)
> +{
> +       return container_of(bridge, struct anx7688, bridge);
> +}
> +
> +static bool anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> +                                     const struct drm_display_mode *mode,
> +                                     struct drm_display_mode *adjusted_mode)
> +{
> +       struct anx7688 *anx7688 = bridge_to_anx7688(bridge);
> +       int totalbw, requiredbw;
> +       u8 dpbw, lanecount;
> +       u8 regs[2];
> +       int ret;
> +
> +       if (!anx7688->filter)
> +               return true;
> +
> +       /* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
> +       ret = regmap_bulk_read(anx7688->regmap, DP_BANDWIDTH_REG, regs, 2);
> +       if (ret < 0) {
> +               dev_err(&anx7688->client->dev,
> +                       "Failed to read bandwidth/lane count\n");
> +               return false;
> +       }
> +       dpbw = regs[0];
> +       lanecount = regs[1];
> +
> +       /* Maximum 0x19 bandwidth (6.75 Gbps Turbo mode), 2 lanes */
> +       if (dpbw > 0x19 || lanecount > 2) {
> +               dev_err(&anx7688->client->dev,
> +                       "Invalid bandwidth/lane count (%02x/%d)\n",
> +                       dpbw, lanecount);
> +               return false;
> +       }
> +
> +       /* Compute available bandwidth (kHz) */
> +       totalbw = dpbw * lanecount * 270000 * 8 / 10;
> +
> +       /* Required bandwidth (8 bpc, kHz) */
> +       requiredbw = mode->clock * 8 * 3;
> +
> +       dev_dbg(&anx7688->client->dev,
> +               "DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
> +               totalbw, dpbw, lanecount, requiredbw);
> +
> +       if (totalbw == 0) {
> +               dev_warn(&anx7688->client->dev,
> +                        "Bandwidth/lane count are 0, not rejecting modes\n");
> +               return true;
> +       }
> +
> +       return totalbw >= requiredbw;
> +}
> +
> +static const struct drm_bridge_funcs anx7688_bridge_funcs = {
> +       .mode_fixup = anx7688_bridge_mode_fixup,
> +};
> +
> +static const struct regmap_config anx7688_regmap_config = {
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +};
> +
> +static int anx7688_i2c_probe(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       struct anx7688 *anx7688;
> +       u16 vendor, device;
> +       u16 fwversion;
> +       u8 buffer[4];
> +       int ret;
> +
> +       anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
> +       if (!anx7688)
> +               return -ENOMEM;
> +
> +       anx7688->bridge.of_node = dev->of_node;
> +       anx7688->client = client;
> +       i2c_set_clientdata(client, anx7688);
> +
> +       anx7688->regmap = devm_regmap_init_i2c(client, &anx7688_regmap_config);
> +
> +       /* Read both vendor and device id (4 bytes). */
> +       ret = regmap_bulk_read(anx7688->regmap, VENDOR_ID_REG, buffer, 4);
> +       if (ret) {
> +               dev_err(dev, "Failed to read chip vendor/device id\n");
> +               return ret;
> +       }
> +
> +       vendor = (u16)buffer[1] << 8 | buffer[0];
> +       device = (u16)buffer[3] << 8 | buffer[2];
> +       if (vendor != VENDOR_ID || device != DEVICE_ID) {
> +               dev_err(dev, "Invalid vendor/device id %04x/%04x\n",
> +                       vendor, device);
> +               return -ENODEV;
> +       }
> +
> +       ret = regmap_bulk_read(anx7688->regmap, FW_VERSION_REG, buffer, 2);
> +       if (ret) {
> +               dev_err(&client->dev, "Failed to read firmware version\n");
> +               return ret;
> +       }
> +
> +       fwversion = (u16)buffer[0] << 8 | buffer[1];
> +       dev_info(dev, "ANX7688 firwmare version %02x.%02x\n",
> +                buffer[0], buffer[1]);
> +
> +       /* FW version >= 0.85 supports bandwidth/lane count registers */
> +       if (fwversion >= MINIMUM_FW_VERSION) {
> +               anx7688->filter = true;
> +       } else {
> +               /* Warn, but not fail, for backwards compatibility. */
> +               dev_warn(dev,
> +                        "Old ANX7688 FW version (%02x.%02x), not filtering\n",
> +                        buffer[0], buffer[1]);
> +       }
> +
> +       anx7688->bridge.funcs = &anx7688_bridge_funcs;
> +       drm_bridge_add(&anx7688->bridge);
> +
> +       return 0;
> +}
> +
> +static int anx7688_i2c_remove(struct i2c_client *client)
> +{
> +       struct anx7688 *anx7688 = i2c_get_clientdata(client);
> +
> +       drm_bridge_remove(&anx7688->bridge);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id anx7688_match_table[] = {
> +       { .compatible = "analogix,anx7688", },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, anx7688_match_table);
> +
> +static struct i2c_driver anx7688_driver = {
> +       .probe_new = anx7688_i2c_probe,
> +       .remove = anx7688_i2c_remove,
> +       .driver = {
> +               .name = "anx7688",
> +               .of_match_table = anx7688_match_table,
> +       },
> +};
> +
> +module_i2c_driver(anx7688_driver);
> +
> +MODULE_DESCRIPTION("ANX7688 HDMI->DP bridge driver");
> +MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
> +MODULE_LICENSE("GPL");
> --
> 2.25.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
