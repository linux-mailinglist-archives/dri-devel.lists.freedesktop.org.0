Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E700E1228D5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74216E988;
	Tue, 17 Dec 2019 10:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608566E466
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:46:12 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z193so2494531iof.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ip0hiAOAGDt2Zn2jc9xJBFP5O6eF1nFxxaAHttMRQBs=;
 b=cXA1Bl3mTQlm/tHcPWmsGjHavRtk5kGkUQmxikOOBWJ+v2JrdAG7nA2TTGbWy3K/OZ
 4s4qHcxtewVHxf/Ta96f5bWKFBahd4fDU+QbvSf0fBVvfXRENntpxzfo1ZMskzbeMP0z
 HNRnFfH+3ifPgV9uIPm2lA9WfKbqU7IN5JaM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ip0hiAOAGDt2Zn2jc9xJBFP5O6eF1nFxxaAHttMRQBs=;
 b=SrFmSlNVkM0MPNW3hbdF9fYhzre3wA32z4jN8ntjAMbC8mZHQ2FxmLZ/OhVKHyW16Q
 NU3SrixiZA6j8sBWVMrYMLl3VLrY6ARIdCKwvuhG9MrCAgFJ10LEx1jddtAIzJ4TU9ZM
 FklClD2pucamMSO5TkbYhyfu1QuteGTz7mzDNCnvKfoLf5iEH0JJkSwJaAnphvY8AxcR
 w5vwpa5G8iEL7AwdEUBdljhmpjxUfjGhF0Nk/d5SIrwQPDCVWfsGCWEI5QzbgeKKmxhL
 tokWtWGytdx37a22F/09PECFcHXaGlU6kFT4dP2QO3+AR/41+tUYEG9FzZ8M8b0xAgJz
 C/Kg==
X-Gm-Message-State: APjAAAWP0ezKoE6wwdui9GGW6mQ+TFWWRsHoIWCrfoW2OFTVKrYwZ1hj
 DZBEBPBa84mp5/U3/3ORyZwjfcPERhsexiiZQaxR9A==
X-Google-Smtp-Source: APXvYqwhCOzHLh7hd1IAXP0AHTn54KOBQI6JxJq4SsxdWpC0noHgtPBAHL8qzpRlSOBMKpIPpL5+lh3V+O56u2yZq2s=
X-Received: by 2002:a5d:9c10:: with SMTP id 16mr16759649ioe.150.1576485971480; 
 Mon, 16 Dec 2019 00:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-3-hsinyi@chromium.org>
 <20191213223816.GS4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213223816.GS4860@pendragon.ideasonboard.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 Dec 2019 16:45:45 +0800
Message-ID: <CAJMQK-gFn8WeokxGfAZ-akNvdEbQhPj_3Ax2sD7Ti6JcSvjF4g@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/4] drm: bridge: anx7688: Add anx7688 bridge
 driver support.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 14, 2019 at 6:38 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hsin-Yi and Nicolas,
>
> Thank you for the patch.
>
> On Wed, Dec 11, 2019 at 02:19:09PM +0800, Hsin-Yi Wang wrote:
> > From: Nicolas Boichat <drinkcat@chromium.org>
> >
> > ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
> > that has an internal microcontroller.
> >
> > The only reason a Linux kernel driver is necessary is to reject
> > resolutions that require more bandwidth than what is available on
> > the DP side. DP bandwidth and lane count are reported by the bridge
> > via 2 registers on I2C.
>
> How about power, doesn't this chip have power supplies that potentially
> need to be controlled ?
>
Ideally we should add power supplies as well, but the power is
supplied by ec in mt8173 oak board. And we only have this board can
test this driver. If we add power supplies in driver we can't test it.
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig            |   9 +
> >  drivers/gpu/drm/bridge/Makefile           |   1 +
> >  drivers/gpu/drm/bridge/analogix-anx7688.c | 202 ++++++++++++++++++++++
> >  3 files changed, 212 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/analogix-anx7688.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 34362976cd6f..1f3fc6bec842 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -16,6 +16,15 @@ config DRM_PANEL_BRIDGE
> >  menu "Display Interface Bridges"
> >       depends on DRM && DRM_BRIDGE
> >
> > +config DRM_ANALOGIX_ANX7688
> > +     tristate "Analogix ANX7688 bridge"
> > +     select DRM_KMS_HELPER
> > +     select REGMAP_I2C
> > +     ---help---
> > +       ANX7688 is a transmitter to support DisplayPort over USB-C for
> > +       smartphone and tablets.
> > +       This driver only supports the HDMI to DP component of the chip.
> > +
> >  config DRM_ANALOGIX_ANX78XX
> >       tristate "Analogix ANX78XX bridge"
> >       select DRM_KMS_HELPER
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > index 4934fcf5a6f8..7a1e0ec032e6 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
> >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> >  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> > diff --git a/drivers/gpu/drm/bridge/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix-anx7688.c
> > new file mode 100644
> > index 000000000000..baaed48d6201
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/analogix-anx7688.c
> > @@ -0,0 +1,202 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * ANX7688 HDMI->DP bridge driver
> > + *
> > + * Copyright 2016 Google LLC
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
>
> Are these registers defined by the ANX7688 hardware, or by the firmware
> running on the chip (and, I assume, developed by Google) ?
>
By firmware developed by ANX provided to Google.
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
> > +     u8 regs[2];
> > +     u8 dpbw, lanecount;
> > +     int totalbw, requiredbw;
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
> > +     .mode_fixup     = anx7688_bridge_mode_fixup,
> > +};
> > +
> > +static const struct regmap_config anx7688_regmap_config = {
> > +     .reg_bits = 8,
> > +     .val_bits = 8,
> > +};
> > +
> > +static int anx7688_i2c_probe(struct i2c_client *client,
> > +                          const struct i2c_device_id *id)
> > +{
> > +     struct anx7688 *anx7688;
> > +     struct device *dev = &client->dev;
> > +     int ret;
> > +     u8 buffer[4];
> > +     u16 vendor, device, fwversion;
> > +
> > +     anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
> > +     if (!anx7688)
> > +             return -ENOMEM;
> > +
> > +#if IS_ENABLED(CONFIG_OF)
> > +     anx7688->bridge.of_node = client->dev.of_node;
> > +#endif
> > +
> > +     anx7688->client = client;
> > +     i2c_set_clientdata(client, anx7688);
> > +
> > +     anx7688->regmap =
> > +             devm_regmap_init_i2c(client, &anx7688_regmap_config);
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
> > +static const struct i2c_device_id anx7688_id[] = {
> > +     { "anx7688", 0 },
> > +     { /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, anx7688_id);
> > +
> > +#if IS_ENABLED(CONFIG_OF)
> > +static const struct of_device_id anx7688_match_table[] = {
> > +     { .compatible = "analogix,anx7688", },
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, anx7688_match_table);
> > +#endif
> > +
> > +static struct i2c_driver anx7688_driver = {
> > +     .driver = {
> > +                .name = "anx7688",
> > +                .of_match_table = of_match_ptr(anx7688_match_table),
> > +               },
> > +     .probe = anx7688_i2c_probe,
> > +     .remove = anx7688_i2c_remove,
> > +     .id_table = anx7688_id,
> > +};
> > +
> > +module_i2c_driver(anx7688_driver);
> > +
> > +MODULE_DESCRIPTION("ANX7688 SlimPort Transmitter driver");
> > +MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
> > +MODULE_LICENSE("GPL v2");
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
