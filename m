Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1CA121FE5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 01:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2084D6E8F9;
	Tue, 17 Dec 2019 00:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7AB6E8F9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 00:41:03 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id e5so6075942qtm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+kE5W3b4zu/hvxZe1M6EhDV9fY8daatHW41ZRA5b05M=;
 b=X0VjqV+Pg1qRE/4Xz80A1JM4QEmbswh//Z+uudRM7Rb3ow1JFkFVabTMMetu2qMuIB
 qrTYklVy2kSoxg7zUe5B1d0DiOP81eczAQhLlZ+AfeRhE56yhXTcLjXr/BP2w4WJcg31
 1ShZcF43x61NUj/aAPVlKiqRhMtMyuDOZPJg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kE5W3b4zu/hvxZe1M6EhDV9fY8daatHW41ZRA5b05M=;
 b=L+yYdt4APhZczKApkndBPAhm8VCxKwjLDBYwqaKetleAmuz8l5cMnw6N0RZxdDrog/
 jNjMH6OSno//6wUEtHlr1417tJQ9LE0bbv0qZmF2NLnh3/FT/BP8IK0rJLshV9uZdbz0
 vyxSHH5fH3gZtF2Gh2QkkrGwdtOArxiIITay0d6ha1Le+c1OCmSeu7Aba7AYAXLRy8Ms
 WRoNXZ+BtKFAaEEsa/fVbgLnjC+UIhdaI5ayPaLyJ+4sHiCcZf4bo9mHlAGnygrDgk5/
 amE6fPHBaXqn8nHg67v9frQMQpxF3ZcJl4IGTtsL4XnCTD5Tvhag2mBEy+EYSCmtr+AL
 ryTg==
X-Gm-Message-State: APjAAAUqwiQa/LNz+LJDp1wT3+H2ocVFQQOkbvaDVKRL5fvoDC/d3AM4
 qplqwbYgrKVWgaowUhkawbVjutxABBgQQ6ICcgIbyw==
X-Google-Smtp-Source: APXvYqw9un+XJMWpOauoHaPJwdImf14rClSV80k9Uv8SjOdohErpxVHlWZBtLe0Q6Oy5LpoPy5c+2wpJ8ftiJ9zGNro=
X-Received: by 2002:ac8:3946:: with SMTP id t6mr2220436qtb.278.1576543262546; 
 Mon, 16 Dec 2019 16:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-3-hsinyi@chromium.org>
 <20191213223816.GS4860@pendragon.ideasonboard.com>
 <CAJMQK-gFn8WeokxGfAZ-akNvdEbQhPj_3Ax2sD7Ti6JcSvjF4g@mail.gmail.com>
 <CANMq1KDh=ehp0RDFRLQ5OCTibrK=Uzp2UFVLM+7AhwpVp-X=yQ@mail.gmail.com>
 <20191216163910.GC14502@pendragon.ideasonboard.com>
 <CANMq1KA1OMMzwLVMhFeb-zLuPLJsXrvVMji=u0RZ_kWnQprvoA@mail.gmail.com>
In-Reply-To: <CANMq1KA1OMMzwLVMhFeb-zLuPLJsXrvVMji=u0RZ_kWnQprvoA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 17 Dec 2019 08:40:51 +0800
Message-ID: <CANMq1KABX4RwNHDYaXHTpJXOQdO1HdnNy8=aAfaZTVPJaSfpfQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/4] drm: bridge: anx7688: Add anx7688 bridge
 driver support.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Matthias Brugger <mbrugger@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Brilliant, I managed to accidentally send the email below, and send
it as HTML, sorry about that... ASCII art in gmail is hard ,-(

Take 2:)

Hi Laurent,

> On Tue, Dec 17, 2019 at 12:39 AM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hello Nicolas and Hsin-Yi,
> >
> > On Mon, Dec 16, 2019 at 06:19:24PM +0800, Nicolas Boichat wrote:
> > > On Mon, Dec 16, 2019 at 4:46 PM Hsin-Yi Wang wrote:
> > > > On Sat, Dec 14, 2019 at 6:38 AM Laurent Pinchart wrote:
> > > > > On Wed, Dec 11, 2019 at 02:19:09PM +0800, Hsin-Yi Wang wrote:
> > > > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > > > >
> > > > > > ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
> > > > > > that has an internal microcontroller.
> > > > > >
> > > > > > The only reason a Linux kernel driver is necessary is to reject
> > > > > > resolutions that require more bandwidth than what is available on
> > > > > > the DP side. DP bandwidth and lane count are reported by the bridge
> > > > > > via 2 registers on I2C.
> > > > >
> > > > > How about power, doesn't this chip have power supplies that potentially
> > > > > need to be controlled ?
> > > > >
> > > > Ideally we should add power supplies as well, but the power is
> > > > supplied by ec in mt8173 oak board. And we only have this board can
> > > > test this driver. If we add power supplies in driver we can't test it.
> > >
> > > To clarify a bit more, this is because this chip is actually a
> > > TCPC+mux+HDMI=>DP converter
> > > (https://www.analogix.com/en/products/convertersbridges/anx7688). In
> > > Chromebook architecture, TCPC+mux is controlled by the EC (including
> > > power and other control pins), and the only reason we need a driver
> > > for the HDMI=>DP converter is to get the number of lanes on the DP
> > > side and filter out resolutions. Also, the converter is on a different
> > > I2C address and it could almost be considered as a separate device.
> > >
> > > (of course we could write a kernel driver for the TCPC+mux but we'll
> > > leave that to others if there's ever a board that is built with the
> > > TCPC part connected to the AP)
> >
> > Is the mux the one that is handled through a gpio-mux driver in this
> > series, or a different mux ?
>

It's a different mux: it's the usual USB-C mux that takes in USB 3.0
and DP (internally converted from HDMI), and decides which 2 lanes to
use for each (4 lanes in total, but DP can only take 2 with this
converter), and flip if necessary. This is all controlled by the EC
(like on most other Chromebooks), so this is transparent to the kernel
on this hardware.

> > It would really, really help if you could
> > show a block diagram of the related hardware (including the EC), as this
> > is quite confusing. With every e-mail exchanged there's a bit more
> > information that change my understanding of the issue, I can't really
> > provide guidance without a full overview.

https://lkml.org/lkml/2019/12/9/548 that you drew is accurate for the
display part of the problem.

You can just add a USB3 connection to the above (there's also I2C
interface to the EC of course to control the TCPC/mux aspect of it,
but that's on different I2C addresses). Something like this:

                                      +-----------+
 +---------+         +------+    /--> | HDMI      |
 | MT8173  |  HDMI   |   -->| --/     | Connector |
 |  HDMI   | ------> |--/   |         +-----------+
 | Encoder |         |    ->| --\     +-----------+      +-----------+
 +---------+         +------+    \--> | ANX7688   | ---> | USB-C     |
                                      | Bridge    |      | Connector |
                              USB3--> | + mux     |      |           |
                                      +-----------+      +-----------+
                                         ^     ^
                                   (I2C) |     | (I2C)
   MT8173 (DP lane count/bw readback) -- +     + -- EC (TCPC+mux control)

Power is also fully controlled by the EC.

(the product brief has a good diagram of the internals of the ANX7688:
https://www.analogix.com/en/system/files/AA-002281-PB-6-ANX7688_Product_Brief.pdf)

The ANX7688 bridge could _almost_ work driverless (and it does
already), the _only_ thing that the driver is doing is filtering out
impossible resolution based on DP (over USB-C) number of lanes and
bandwidth. This is required to support, for example, old monitors that
may only do RBR over DP (so we can't drive the full resolution over 2
DP lanes, we'd need 4 lanes, and we need to filter out the higher
resolution modes).

> > > > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/bridge/Kconfig            |   9 +
> > > > > >  drivers/gpu/drm/bridge/Makefile           |   1 +
> > > > > >  drivers/gpu/drm/bridge/analogix-anx7688.c | 202 ++++++++++++++++++++++
> > > > > >  3 files changed, 212 insertions(+)
> > > > > >  create mode 100644 drivers/gpu/drm/bridge/analogix-anx7688.c
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > > > > index 34362976cd6f..1f3fc6bec842 100644
> > > > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > > > @@ -16,6 +16,15 @@ config DRM_PANEL_BRIDGE
> > > > > >  menu "Display Interface Bridges"
> > > > > >       depends on DRM && DRM_BRIDGE
> > > > > >
> > > > > > +config DRM_ANALOGIX_ANX7688
> > > > > > +     tristate "Analogix ANX7688 bridge"
> > > > > > +     select DRM_KMS_HELPER
> > > > > > +     select REGMAP_I2C
> > > > > > +     ---help---
> > > > > > +       ANX7688 is a transmitter to support DisplayPort over USB-C for
> > > > > > +       smartphone and tablets.
> > > > > > +       This driver only supports the HDMI to DP component of the chip.
> > > > > > +
> > > > > >  config DRM_ANALOGIX_ANX78XX
> > > > > >       tristate "Analogix ANX78XX bridge"
> > > > > >       select DRM_KMS_HELPER
> > > > > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > > > > index 4934fcf5a6f8..7a1e0ec032e6 100644
> > > > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > > > @@ -1,4 +1,5 @@
> > > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > > > +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
> > > > > >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> > > > > >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> > > > > >  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> > > > > > diff --git a/drivers/gpu/drm/bridge/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix-anx7688.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..baaed48d6201
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/bridge/analogix-anx7688.c
> > > > > > @@ -0,0 +1,202 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * ANX7688 HDMI->DP bridge driver
> > > > > > + *
> > > > > > + * Copyright 2016 Google LLC
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/i2c.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/regmap.h>
> > > > > > +#include <drm/drm_bridge.h>
> > > > > > +
> > > > > > +/* Register addresses */
> > > > > > +#define VENDOR_ID_REG 0x00
> > > > > > +#define DEVICE_ID_REG 0x02
> > > > > > +
> > > > > > +#define FW_VERSION_REG 0x80
> > > > > > +
> > > > > > +#define DP_BANDWIDTH_REG 0x85
> > > > > > +#define DP_LANE_COUNT_REG 0x86
> > > > >
> > > > > Are these registers defined by the ANX7688 hardware, or by the firmware
> > > > > running on the chip (and, I assume, developed by Google) ?
> > > > >
> > > > By firmware developed by ANX provided to Google.
> > >
> > > We asked for these registers to be added to ANX FW, and this is the FW
> > > that is used by all elm/hana Chromebooks (I have no idea about other
> > > ANX customers...). We have facilities to update the ANX FW from
> > > coreboot/depthcharge on Chromebooks, but that does not really matter:
> > > the factory FW of all MP Chromebooks does provide these registers.
> >
> > So the driver is specific to Chromebooks, it doesn't support all
> > ANX7688. Sweet :-(
>

FWIW, this is a 3+ year old part, so it appears that nobody else cares anyway?

Also, this driver is only required to implement the mode filtering,
which, possibly, is only supported by the Google version of the FW (I
have no idea what other customers ANX has for this part, if they care
about this problem, and if so, how they solve it).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
