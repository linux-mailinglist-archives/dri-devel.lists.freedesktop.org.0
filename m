Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6515F94F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 23:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011246E884;
	Fri, 14 Feb 2020 22:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C866E884
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 22:17:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id v195so10717629qkb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 14:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EpAHhN0cyInJreWWweeARToNma6rlTvT9YgtHzWXZsw=;
 b=V83wipgT/v49rf7JULunCDVfsFC2O1HPVnCk0H8hnz5jKepozJS88aT1805KWfqOy2
 +ATGbFYeNM4Nu0rZDIFv8ZzpsOC34peo1n8I7BMNTY7F7OdV6VxSoZxWaZrCqPdRjnzj
 QqnaKawQWWR665lVGbTwzkI67i9J8jGpB9VMAKjiS/Hh/0Z0u3y8VDp8xDRSMLUB89z0
 hUybvURroRUe9Zk9I1khJ4qw7dR24GHVWshqoNxlZvGBwGHWpvzQeKRJObRR97bi9biY
 9PM2gfL7r8k34Yj+UHmTA3yUmQrujWbbiTBO+Usb/6yI/ZRgZZbBWtZQthBcIE/wzYN7
 zPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpAHhN0cyInJreWWweeARToNma6rlTvT9YgtHzWXZsw=;
 b=EmwQzGKMas1MJAhj5tWPN2xvhS8gyv7i4tFfaBWnaINMTWnY2lSbJYtNZ3xkuw4llC
 3Yr2CBEEcxW6ZJdN/G5zZKeFkSz85I/coZxFQV1YtZ5b4SMdL+HxdKbRnIJJqLcZ08lL
 o11lNkhCfB8ENJVBCfz4mN1ctNi+KTP+yo/rWaOEgDsv1eZQIrkzWNYjkgO8nE4uEvEM
 wIlV1NG2ZOkslWcWgtGS8V2Q6+20NVh/XB6OjqObHp+H3ahN/KpaOFsYSLQKzs7gsyw9
 QsIx86wfH0i3e8a9Z1Hkwjb/r0i6FVUdk1s8oUXEbReaKl+HuFbu2SSDfiGMeCD5Mqjh
 ImGw==
X-Gm-Message-State: APjAAAV4OWBCpKTsMWFnLul2kj7hj327IfFM5uOle7kwQYumU84u39Yb
 /YjLaQY4PBxS4F/H9Rq94ft2wIS0k2fSEkw18tI=
X-Google-Smtp-Source: APXvYqzo9uxOLQdAS1DTa26MdzW9YO3EpTIBY9HGjc3TwmPTU1iKXLodrOuPRPhs4DuZ8TbPPh1Fye4HrrjwmwCNmpA=
X-Received: by 2002:a37:e210:: with SMTP id g16mr4614534qki.413.1581718649012; 
 Fri, 14 Feb 2020 14:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
 <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
 <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
In-Reply-To: <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 14 Feb 2020 14:17:02 -0800
Message-ID: <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: Enric Balletbo Serra <eballetbo@gmail.com>, Icenowy Zheng <icenowy@aosc.io>
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
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 1:53 PM Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
>
> Hi Vasily,
>
> Missatge de Vasily Khoruzhick <anarsoul@gmail.com> del dia dv., 14 de
> febr. 2020 a les 22:36:
> >
> > On Thu, Feb 13, 2020 at 6:54 AM Enric Balletbo i Serra
> > <enric.balletbo@collabora.com> wrote:
> > >
> > > From: Nicolas Boichat <drinkcat@chromium.org>
> > >
> > > ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
> > > that has an internal microcontroller.
> > >
> > > The only reason a Linux kernel driver is necessary is to reject
> > > resolutions that require more bandwidth than what is available on
> > > the DP side. DP bandwidth and lane count are reported by the bridge
> > > via 2 registers on I2C.
> >
> > It is true only for your particular platform where usb-c part is
> > managed by firmware. Pinephone has the same anx7688 but linux will
> > need a driver that manages usb-c in addition to DP.
> >
> > I'd suggest making it MFD driver from the beginning, or at least make
> > proper bindings so we don't have to rework it and introduce binding
> > incompatibilities in future.
> >
>
> Do you have example code on how the ANX7866 is used in pinephone?
> There is a repo somewhere?

I don't think it's implemented yet. I've CCed Icenowy in case if she
has anything.

> Thanks,
>  Enric
>
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > > ---
> > >
> > > Changes in v2:
> > > - Move driver to drivers/gpu/drm/bridge/analogix.
> > > - Make the driver OF only so we can reduce the ifdefs.
> > > - Update the Copyright to 2020.
> > > - Use probe_new so we can get rid of the i2c_device_id table.
> > >
> > >  drivers/gpu/drm/bridge/analogix/Kconfig       |  12 ++
> > >  drivers/gpu/drm/bridge/analogix/Makefile      |   1 +
> > >  .../drm/bridge/analogix/analogix-anx7688.c    | 188 ++++++++++++++++++
> > >  3 files changed, 201 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> > > index e1fa7d820373..af7c2939403c 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> > > @@ -11,6 +11,18 @@ config DRM_ANALOGIX_ANX6345
> > >           ANX6345 transforms the LVTTL RGB output of an
> > >           application processor to eDP or DisplayPort.
> > >
> > > +config DRM_ANALOGIX_ANX7688
> > > +       tristate "Analogix ANX7688 bridge"
> > > +       depends on OF
> > > +       select DRM_KMS_HELPER
> > > +       select REGMAP_I2C
> > > +       help
> > > +         ANX7688 is an ultra-low power 4k Ultra-HD (4096x2160p60)
> > > +         mobile HD transmitter designed for portable devices. The
> > > +         ANX7688 converts HDMI 2.0 to DisplayPort 1.3 Ultra-HD
> > > +         including an intelligent crosspoint switch to support
> > > +         USB Type-C.
> > > +
> > >  config DRM_ANALOGIX_ANX78XX
> > >         tristate "Analogix ANX78XX bridge"
> > >         select DRM_ANALOGIX_DP
> > > diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> > > index 97669b374098..27cd73635c8c 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/Makefile
> > > +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> > > @@ -1,5 +1,6 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >  analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o analogix-i2c-dptx.o
> > >  obj-$(CONFIG_DRM_ANALOGIX_ANX6345) += analogix-anx6345.o
> > > +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
> > >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> > >  obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
> > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> > > new file mode 100644
> > > index 000000000000..10a7cd0f9126
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> > > @@ -0,0 +1,188 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * ANX7688 HDMI->DP bridge driver
> > > + *
> > > + * Copyright 2020 Google LLC
> > > + */
> > > +
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/regmap.h>
> > > +#include <drm/drm_bridge.h>
> > > +
> > > +/* Register addresses */
> > > +#define VENDOR_ID_REG 0x00
> > > +#define DEVICE_ID_REG 0x02
> > > +
> > > +#define FW_VERSION_REG 0x80
> > > +
> > > +#define DP_BANDWIDTH_REG 0x85
> > > +#define DP_LANE_COUNT_REG 0x86
> > > +
> > > +#define VENDOR_ID 0x1f29
> > > +#define DEVICE_ID 0x7688
> > > +
> > > +/* First supported firmware version (0.85) */
> > > +#define MINIMUM_FW_VERSION 0x0085
> > > +
> > > +struct anx7688 {
> > > +       struct drm_bridge bridge;
> > > +       struct i2c_client *client;
> > > +       struct regmap *regmap;
> > > +
> > > +       bool filter;
> > > +};
> > > +
> > > +static inline struct anx7688 *bridge_to_anx7688(struct drm_bridge *bridge)
> > > +{
> > > +       return container_of(bridge, struct anx7688, bridge);
> > > +}
> > > +
> > > +static bool anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> > > +                                     const struct drm_display_mode *mode,
> > > +                                     struct drm_display_mode *adjusted_mode)
> > > +{
> > > +       struct anx7688 *anx7688 = bridge_to_anx7688(bridge);
> > > +       int totalbw, requiredbw;
> > > +       u8 dpbw, lanecount;
> > > +       u8 regs[2];
> > > +       int ret;
> > > +
> > > +       if (!anx7688->filter)
> > > +               return true;
> > > +
> > > +       /* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
> > > +       ret = regmap_bulk_read(anx7688->regmap, DP_BANDWIDTH_REG, regs, 2);
> > > +       if (ret < 0) {
> > > +               dev_err(&anx7688->client->dev,
> > > +                       "Failed to read bandwidth/lane count\n");
> > > +               return false;
> > > +       }
> > > +       dpbw = regs[0];
> > > +       lanecount = regs[1];
> > > +
> > > +       /* Maximum 0x19 bandwidth (6.75 Gbps Turbo mode), 2 lanes */
> > > +       if (dpbw > 0x19 || lanecount > 2) {
> > > +               dev_err(&anx7688->client->dev,
> > > +                       "Invalid bandwidth/lane count (%02x/%d)\n",
> > > +                       dpbw, lanecount);
> > > +               return false;
> > > +       }
> > > +
> > > +       /* Compute available bandwidth (kHz) */
> > > +       totalbw = dpbw * lanecount * 270000 * 8 / 10;
> > > +
> > > +       /* Required bandwidth (8 bpc, kHz) */
> > > +       requiredbw = mode->clock * 8 * 3;
> > > +
> > > +       dev_dbg(&anx7688->client->dev,
> > > +               "DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
> > > +               totalbw, dpbw, lanecount, requiredbw);
> > > +
> > > +       if (totalbw == 0) {
> > > +               dev_warn(&anx7688->client->dev,
> > > +                        "Bandwidth/lane count are 0, not rejecting modes\n");
> > > +               return true;
> > > +       }
> > > +
> > > +       return totalbw >= requiredbw;
> > > +}
> > > +
> > > +static const struct drm_bridge_funcs anx7688_bridge_funcs = {
> > > +       .mode_fixup = anx7688_bridge_mode_fixup,
> > > +};
> > > +
> > > +static const struct regmap_config anx7688_regmap_config = {
> > > +       .reg_bits = 8,
> > > +       .val_bits = 8,
> > > +};
> > > +
> > > +static int anx7688_i2c_probe(struct i2c_client *client)
> > > +{
> > > +       struct device *dev = &client->dev;
> > > +       struct anx7688 *anx7688;
> > > +       u16 vendor, device;
> > > +       u16 fwversion;
> > > +       u8 buffer[4];
> > > +       int ret;
> > > +
> > > +       anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
> > > +       if (!anx7688)
> > > +               return -ENOMEM;
> > > +
> > > +       anx7688->bridge.of_node = dev->of_node;
> > > +       anx7688->client = client;
> > > +       i2c_set_clientdata(client, anx7688);
> > > +
> > > +       anx7688->regmap = devm_regmap_init_i2c(client, &anx7688_regmap_config);
> > > +
> > > +       /* Read both vendor and device id (4 bytes). */
> > > +       ret = regmap_bulk_read(anx7688->regmap, VENDOR_ID_REG, buffer, 4);
> > > +       if (ret) {
> > > +               dev_err(dev, "Failed to read chip vendor/device id\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       vendor = (u16)buffer[1] << 8 | buffer[0];
> > > +       device = (u16)buffer[3] << 8 | buffer[2];
> > > +       if (vendor != VENDOR_ID || device != DEVICE_ID) {
> > > +               dev_err(dev, "Invalid vendor/device id %04x/%04x\n",
> > > +                       vendor, device);
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       ret = regmap_bulk_read(anx7688->regmap, FW_VERSION_REG, buffer, 2);
> > > +       if (ret) {
> > > +               dev_err(&client->dev, "Failed to read firmware version\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       fwversion = (u16)buffer[0] << 8 | buffer[1];
> > > +       dev_info(dev, "ANX7688 firwmare version %02x.%02x\n",
> > > +                buffer[0], buffer[1]);
> > > +
> > > +       /* FW version >= 0.85 supports bandwidth/lane count registers */
> > > +       if (fwversion >= MINIMUM_FW_VERSION) {
> > > +               anx7688->filter = true;
> > > +       } else {
> > > +               /* Warn, but not fail, for backwards compatibility. */
> > > +               dev_warn(dev,
> > > +                        "Old ANX7688 FW version (%02x.%02x), not filtering\n",
> > > +                        buffer[0], buffer[1]);
> > > +       }
> > > +
> > > +       anx7688->bridge.funcs = &anx7688_bridge_funcs;
> > > +       drm_bridge_add(&anx7688->bridge);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int anx7688_i2c_remove(struct i2c_client *client)
> > > +{
> > > +       struct anx7688 *anx7688 = i2c_get_clientdata(client);
> > > +
> > > +       drm_bridge_remove(&anx7688->bridge);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct of_device_id anx7688_match_table[] = {
> > > +       { .compatible = "analogix,anx7688", },
> > > +       { }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, anx7688_match_table);
> > > +
> > > +static struct i2c_driver anx7688_driver = {
> > > +       .probe_new = anx7688_i2c_probe,
> > > +       .remove = anx7688_i2c_remove,
> > > +       .driver = {
> > > +               .name = "anx7688",
> > > +               .of_match_table = anx7688_match_table,
> > > +       },
> > > +};
> > > +
> > > +module_i2c_driver(anx7688_driver);
> > > +
> > > +MODULE_DESCRIPTION("ANX7688 HDMI->DP bridge driver");
> > > +MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.25.0
> > >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
