Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E43515D879
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 14:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381FE6F928;
	Fri, 14 Feb 2020 13:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA67C6F928
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 13:30:00 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id w47so6918479qtk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WczbSpdMfBJudZ25Ddor05iTOTahCwUaq+Ka7MWgDgo=;
 b=Y/baTSTUkEFUsoByjUmrmIuaruzpBzlRmHAY0gw/CZP40CMzbhb1h4MaWlbRoUNIg+
 tsJwhVyGRNxJQj5gAq9Soz9xnWD0F5o58c5KVK+tZwdQL3M6/07iWk71Tyrecut7bSzS
 pTzpUdlHpSOqgNBKyo1FwMkysPw1f71Y0TWuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WczbSpdMfBJudZ25Ddor05iTOTahCwUaq+Ka7MWgDgo=;
 b=BYPKX86g/KgCsrkvJuZBjI3KFVVGQ0sbFNZeRqBgO7avQ5RfcRtJ7ZmR9uq/I+RzfM
 xs+XcxWZOAT/IlooOIZm5bx87slFUlBESl4xDeRJMfV6QXbZTk42yTY+Rb/furjcSdPi
 1QvY/uKWRksf9adRWRgXIxQ8E64Bn6nws0c2iF5kC+v6JPB43D/+BvcVrOCRi/c4vrS+
 DOFhQFLBtmFx+LwRb/bHByGchmLIsUIq0CgjBenON/6bfd93ESo/DcrtrwcsIpgMCuXW
 NS/3ndOKthgFiGIQqdSL3JFQI3rkR0QAkFTnA6pBan7nCoIafU5k3H39GQgAHMEVJCNL
 X8sA==
X-Gm-Message-State: APjAAAXWkGMX3McES2IOE8zcSqkuZIrlZdoDe8PCxVlO6zGMn1+ujFYu
 Xh84Qzqw8Xw5ra2Q18fIZ7yC8MFs5Pq5msYnVPcXSw==
X-Google-Smtp-Source: APXvYqzOLiAo73evg90fCi05XKAW9KgBcfZPjTdJ6nVoVMYgc4iaiAThbdNcysh7XXibk0LYb7hCQOSGzyPtnIv1Vrg=
X-Received: by 2002:ac8:4446:: with SMTP id m6mr2544214qtn.159.1581686999672; 
 Fri, 14 Feb 2020 05:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <CGME20200214080840eucas1p223598941230d34cf33893c60dfa42ebc@eucas1p2.samsung.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
 <6ed3c044-3573-35d4-ff17-7a40c83ac3af@samsung.com>
In-Reply-To: <6ed3c044-3573-35d4-ff17-7a40c83ac3af@samsung.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 14 Feb 2020 21:29:48 +0800
Message-ID: <CANMq1KD1QuXQA3cj6ymjNzrOFWH73XDTkrps7wn-HSzCD88BQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Icenowy Zheng <icenowy@aosc.io>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 8:18 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> On 13.02.2020 15:54, Enric Balletbo i Serra wrote:
> > From: Nicolas Boichat <drinkcat@chromium.org>
> >
> > ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
> > that has an internal microcontroller.
> >
> > The only reason a Linux kernel driver is necessary is to reject
> > resolutions that require more bandwidth than what is available on
> > the DP side. DP bandwidth and lane count are reported by the bridge
> > via 2 registers on I2C.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > ---
> >
> > Changes in v2:
> > - Move driver to drivers/gpu/drm/bridge/analogix.
> > - Make the driver OF only so we can reduce the ifdefs.
> > - Update the Copyright to 2020.
> > - Use probe_new so we can get rid of the i2c_device_id table.
> >
> >  drivers/gpu/drm/bridge/analogix/Kconfig       |  12 ++
> >  drivers/gpu/drm/bridge/analogix/Makefile      |   1 +
> >  .../drm/bridge/analogix/analogix-anx7688.c    | 188 ++++++++++++++++++
> >  3 files changed, 201 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> > index e1fa7d820373..af7c2939403c 100644
> > --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> > +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> > @@ -11,6 +11,18 @@ config DRM_ANALOGIX_ANX6345
> >         ANX6345 transforms the LVTTL RGB output of an
> >         application processor to eDP or DisplayPort.
> >
> > +config DRM_ANALOGIX_ANX7688
> > +     tristate "Analogix ANX7688 bridge"
> > +     depends on OF
> > +     select DRM_KMS_HELPER
> > +     select REGMAP_I2C
> > +     help
> > +       ANX7688 is an ultra-low power 4k Ultra-HD (4096x2160p60)
> > +       mobile HD transmitter designed for portable devices. The
> > +       ANX7688 converts HDMI 2.0 to DisplayPort 1.3 Ultra-HD
> > +       including an intelligent crosspoint switch to support
> > +       USB Type-C.
> > +
> >  config DRM_ANALOGIX_ANX78XX
> >       tristate "Analogix ANX78XX bridge"
> >       select DRM_ANALOGIX_DP
> > diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> > index 97669b374098..27cd73635c8c 100644
> > --- a/drivers/gpu/drm/bridge/analogix/Makefile
> > +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o analogix-i2c-dptx.o
> >  obj-$(CONFIG_DRM_ANALOGIX_ANX6345) += analogix-anx6345.o
> > +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
> >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> >  obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> > new file mode 100644
> > index 000000000000..10a7cd0f9126
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> > @@ -0,0 +1,188 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * ANX7688 HDMI->DP bridge driver
> > + *
> > + * Copyright 2020 Google LLC
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +#include <drm/drm_bridge.h>
> > +
> > +/* Register addresses */
> > +#define VENDOR_ID_REG 0x00
> > +#define DEVICE_ID_REG 0x02
> > +
> > +#define FW_VERSION_REG 0x80
> > +
> > +#define DP_BANDWIDTH_REG 0x85
> > +#define DP_LANE_COUNT_REG 0x86
> > +
> > +#define VENDOR_ID 0x1f29
> > +#define DEVICE_ID 0x7688
> > +
> > +/* First supported firmware version (0.85) */
> > +#define MINIMUM_FW_VERSION 0x0085
> > +
> > +struct anx7688 {
> > +     struct drm_bridge bridge;
> > +     struct i2c_client *client;
> > +     struct regmap *regmap;
> > +
> > +     bool filter;
> > +};
> > +
> > +static inline struct anx7688 *bridge_to_anx7688(struct drm_bridge *bridge)
> > +{
> > +     return container_of(bridge, struct anx7688, bridge);
> > +}
> > +
> > +static bool anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> > +                                   const struct drm_display_mode *mode,
> > +                                   struct drm_display_mode *adjusted_mode)
> > +{
> > +     struct anx7688 *anx7688 = bridge_to_anx7688(bridge);
> > +     int totalbw, requiredbw;
> > +     u8 dpbw, lanecount;
> > +     u8 regs[2];
> > +     int ret;
> > +
> > +     if (!anx7688->filter)
> > +             return true;
> > +
> > +     /* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
> > +     ret = regmap_bulk_read(anx7688->regmap, DP_BANDWIDTH_REG, regs, 2);
> > +     if (ret < 0) {
> > +             dev_err(&anx7688->client->dev,
> > +                     "Failed to read bandwidth/lane count\n");
> > +             return false;
> > +     }
> > +     dpbw = regs[0];
> > +     lanecount = regs[1];
>
>
> Are these values hw invariant? Or they are result of cable probe/training?
>
> In 1st case this code should go rather to mode_valid.

2nd case. They're the result of probing/training of the DP link:
number of lanes (1 or 2), and bandwidth (RBR, HBR, HBR2...).

> > +
> > +     /* Maximum 0x19 bandwidth (6.75 Gbps Turbo mode), 2 lanes */
> > +     if (dpbw > 0x19 || lanecount > 2) {
> > +             dev_err(&anx7688->client->dev,
> > +                     "Invalid bandwidth/lane count (%02x/%d)\n",
> > +                     dpbw, lanecount);
> > +             return false;
> > +     }
> > +
> > +     /* Compute available bandwidth (kHz) */
> > +     totalbw = dpbw * lanecount * 270000 * 8 / 10;
> > +
> > +     /* Required bandwidth (8 bpc, kHz) */
> > +     requiredbw = mode->clock * 8 * 3;
> > +
> > +     dev_dbg(&anx7688->client->dev,
> > +             "DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
> > +             totalbw, dpbw, lanecount, requiredbw);
> > +
> > +     if (totalbw == 0) {
> > +             dev_warn(&anx7688->client->dev,
> > +                      "Bandwidth/lane count are 0, not rejecting modes\n");
> > +             return true;
> > +     }
> > +
> > +     return totalbw >= requiredbw;
> > +}
> > +
> > +static const struct drm_bridge_funcs anx7688_bridge_funcs = {
> > +     .mode_fixup = anx7688_bridge_mode_fixup,
> > +};
> > +
> > +static const struct regmap_config anx7688_regmap_config = {
> > +     .reg_bits = 8,
> > +     .val_bits = 8,
> > +};
> > +
> > +static int anx7688_i2c_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev = &client->dev;
> > +     struct anx7688 *anx7688;
> > +     u16 vendor, device;
> > +     u16 fwversion;
> > +     u8 buffer[4];
> > +     int ret;
> > +
> > +     anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
> > +     if (!anx7688)
> > +             return -ENOMEM;
> > +
> > +     anx7688->bridge.of_node = dev->of_node;
> > +     anx7688->client = client;
> > +     i2c_set_clientdata(client, anx7688);
> > +
> > +     anx7688->regmap = devm_regmap_init_i2c(client, &anx7688_regmap_config);
> > +
> > +     /* Read both vendor and device id (4 bytes). */
> > +     ret = regmap_bulk_read(anx7688->regmap, VENDOR_ID_REG, buffer, 4);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to read chip vendor/device id\n");
> > +             return ret;
> > +     }
> > +
> > +     vendor = (u16)buffer[1] << 8 | buffer[0];
> > +     device = (u16)buffer[3] << 8 | buffer[2];
>
>
> Here we have little endian, and...
>
>
> > +     if (vendor != VENDOR_ID || device != DEVICE_ID) {
> > +             dev_err(dev, "Invalid vendor/device id %04x/%04x\n",
> > +                     vendor, device);
> > +             return -ENODEV;
> > +     }
> > +
> > +     ret = regmap_bulk_read(anx7688->regmap, FW_VERSION_REG, buffer, 2);
> > +     if (ret) {
> > +             dev_err(&client->dev, "Failed to read firmware version\n");
> > +             return ret;
> > +     }
> > +
> > +     fwversion = (u16)buffer[0] << 8 | buffer[1];
>
>
> ...here big endian.
>
> Is it correct?
>
>
> Overall driver looks OK.
>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>
>  --
> Regards
> Andrzej
>
>
> > +     dev_info(dev, "ANX7688 firwmare version %02x.%02x\n",
> > +              buffer[0], buffer[1]);
> > +
> > +     /* FW version >= 0.85 supports bandwidth/lane count registers */
> > +     if (fwversion >= MINIMUM_FW_VERSION) {
> > +             anx7688->filter = true;
> > +     } else {
> > +             /* Warn, but not fail, for backwards compatibility. */
> > +             dev_warn(dev,
> > +                      "Old ANX7688 FW version (%02x.%02x), not filtering\n",
> > +                      buffer[0], buffer[1]);
> > +     }
> > +
> > +     anx7688->bridge.funcs = &anx7688_bridge_funcs;
> > +     drm_bridge_add(&anx7688->bridge);
> > +
> > +     return 0;
> > +}
> > +
> > +static int anx7688_i2c_remove(struct i2c_client *client)
> > +{
> > +     struct anx7688 *anx7688 = i2c_get_clientdata(client);
> > +
> > +     drm_bridge_remove(&anx7688->bridge);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id anx7688_match_table[] = {
> > +     { .compatible = "analogix,anx7688", },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, anx7688_match_table);
> > +
> > +static struct i2c_driver anx7688_driver = {
> > +     .probe_new = anx7688_i2c_probe,
> > +     .remove = anx7688_i2c_remove,
> > +     .driver = {
> > +             .name = "anx7688",
> > +             .of_match_table = anx7688_match_table,
> > +     },
> > +};
> > +
> > +module_i2c_driver(anx7688_driver);
> > +
> > +MODULE_DESCRIPTION("ANX7688 HDMI->DP bridge driver");
> > +MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
> > +MODULE_LICENSE("GPL");
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
