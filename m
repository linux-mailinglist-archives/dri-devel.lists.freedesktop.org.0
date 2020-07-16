Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DCF221DEB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 10:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCBF6E0D3;
	Thu, 16 Jul 2020 08:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE7C6E0D3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:10:04 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A105D206F4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594887004;
 bh=9U/Tqnp37+a3UeCbN/Rd8sLUh7bqxMwNK0GSPU3rn7U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wggqkr5xOlvI11gL5GhhaE3oI/suTd+Hi+YGwApT11Nwv6ox56zE5IiyYFypBGlhY
 jfs36+UBZnUqb/tViUtmAbteBDswDZQtoZ33vcGAirQzL7F+LROkToy7Ud9ZsiQbgN
 MO+vlh9CwkxUZa0rFLPq6FbdBQ7j4DClq8fztFaI=
Received: by mail-lj1-f176.google.com with SMTP id x9so6118940ljc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 01:10:03 -0700 (PDT)
X-Gm-Message-State: AOAM532IygPFF+jT6Vt+qKRoFPR03wIbM0vrjaXZvW7Vyg/A4qGYbvpV
 mJqOc/3gLO/nCHz36kzcLzPSru+xtVre2eYzTSw=
X-Google-Smtp-Source: ABdhPJzE94jfzWT9AWo4FurM0W9Z82oSyu+4uwwucgFaCYrUgTyttVF3u34Y20/R6fRz8KgntDWAVgtJ4D5hSsfaIj4=
X-Received: by 2002:a2e:3a14:: with SMTP id h20mr1316035lja.331.1594887001943; 
 Thu, 16 Jul 2020 01:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-6-wens@kernel.org>
 <20200716080435.3td5il4eskh5jcru@gilmour.lan>
In-Reply-To: <20200716080435.3td5il4eskh5jcru@gilmour.lan>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 16 Jul 2020 16:09:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v64d_nc2tPwLV6YeQuLjCxbTddEk0yGUtnGvJ8Pjk1FfYQ@mail.gmail.com>
Message-ID: <CAGb2v64d_nc2tPwLV6YeQuLjCxbTddEk0yGUtnGvJ8Pjk1FfYQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: sun7i: Add MSI Primo73 tablet
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 4:04 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Tue, Jul 14, 2020 at 03:13:05PM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The Primo73 is an MSI branded Allwinner A20-based 7-inch tablet. It has
> > a metal back case with a plastic insert around where the WiFi antenna is.
> > The tablet is (as of July of 2020) no longer available from retailers.
> > Kernel sources (as required by GPL) are no longer available from the
> > vendor, MSI. The device support page still lists the link, but it is
> > dead.
> >
> > The tablet features a non-identifiable 1024x600 7" MIPI DPI TFT panel,
> > Goodix GT911-based capacitive touchscreen, 1GB DRAM, 8GB MLC NAND,
> > RTL8188ETV-based WiFi, an NXP MMA8452 accelerometer for orientation,
> > a GC2035 2 megapixel rear camera, a GC0308 0.3 megapixel front camera,
> > a mini-HDMI output, a micro-USB port, a headphone jack and single speaker.
> >
> > The board design is believe to follow Allwinner's reference design. This
> > judgement is based on the fact that the I/O pins and GPIO lines used
> > match up with the reference design. Assumptions about the regulator tree
> > are based on this.
> >
> > The LCD panel only has some serial number markings, and what appears to
> > be a part number: "OS1N71J003", which is also a prefix for one of the
> > serial number markings. Searching for this part number yielded no
> > results. As such, the color depth display timings are directly listed
> > in the device tree. The timing are from the FEX file recovered from the
> > device. The color depth was derived from the dithering setting from the
> > FEX file, as well as independent testing with a color gradient image.
> > The internal board, as well as the ribbon cable for the panel, route the
> > full 24 bits of color. So the 2 extra bits are dropped either by the
> > panel itself or somewhere within the LCD panel module casing.
> >
> > Add a device tree for this tablet. Almost the whole device is supported.
> > The only things missing are the two cameras, which don't have device
> > tree bindings or driver support. The vendor for the LCD panel is left
> > out, since there is nothing to go with.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >
> > The panel-dpi binding requires a more-specific compatible string.
> > However given the vendor of the panel is unknown, I'm not sure what
> > the best course of action is here. I opted to put the part number in
> > without a vendor prefix.
>
> I guess we could just make up a comptible from the tablet name here?
> Something like msi,primo73-panel ?

That might work. On the other hand, someone might take apart theirs
and find a different panel than mine, and not realize the timings
are off. Keeping the part number would still be useful, even if we
don't have any information on it.

> > ---
> >  arch/arm/boot/dts/Makefile              |   1 +
> >  arch/arm/boot/dts/sun7i-a20-primo73.dts | 279 ++++++++++++++++++++++++
> >  2 files changed, 280 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun7i-a20-primo73.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index e6a1cac0bfc7..c09cda958db5 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1133,6 +1133,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
> >       sun7i-a20-orangepi-mini.dtb \
> >       sun7i-a20-pcduino3.dtb \
> >       sun7i-a20-pcduino3-nano.dtb \
> > +     sun7i-a20-primo73.dtb \
> >       sun7i-a20-wexler-tab7200.dtb \
> >       sun7i-a20-wits-pro-a20-dkt.dtb
> >  dtb-$(CONFIG_MACH_SUN8I) += \
> > diff --git a/arch/arm/boot/dts/sun7i-a20-primo73.dts b/arch/arm/boot/dts/sun7i-a20-primo73.dts
> > new file mode 100644
> > index 000000000000..f3b1002ceb50
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun7i-a20-primo73.dts
> > @@ -0,0 +1,279 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2020 Chen-Yu Tsai <wens@csie.org>
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun7i-a20.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +
> > +/{
> > +     model = "MSI Primo73 Tablet";
> > +     compatible = "msi,primo73", "allwinner,sun7i-a20";
> > +
> > +     aliases {
> > +             serial0 = &uart0;
> > +     };
> > +
> > +     backlight: backlight {
> > +             compatible = "pwm-backlight";
> > +             pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
> > +             enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     hdmi-connector {
> > +             compatible = "hdmi-connector";
> > +             type = "b";
> > +
> > +             port {
> > +                     hdmi_con_in: endpoint {
> > +                             remote-endpoint = <&hdmi_out_con>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     panel: panel {
> > +             compatible = "os1n71j003", "panel-dpi";
> > +             backlight = <&backlight>;
> > +             power-supply = <&reg_vcc5v0>; /* Actually driven from IPSOUT */
> > +             enable-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
> > +             height-mm = <86>;
> > +             width-mm = <155>;
> > +             bits-per-color = <6>;
> > +
> > +             panel-timing {
> > +                     clock-frequency = <60000000>;
> > +                     hactive = <1024>;
> > +                     vactive = <600>;
> > +                     hfront-porch = <160>;
> > +                     hback-porch = <60>;
> > +                     hsync-len = <100>;
> > +                     vback-porch = <13>;
> > +                     vfront-porch = <10>;
> > +                     vsync-len = <10>;
> > +                     de-active = <1>;
> > +                     pixelclk-active = <0>;
> > +             };
>
> The clock frequency doesn't seem to match the rest of the timings
> though, it should be around 51MHz. Was this taken from the fex file too?

It was. I wonder if they somehow fixed up the timing in the driver.

ChenYu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
