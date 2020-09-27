Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F5E27A84D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8066E429;
	Mon, 28 Sep 2020 07:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6E76E0D8
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 13:02:17 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id k18so5780583ybh.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAgGtci5pGecpxPxGPjkaSEL4OVE7rwFSl1wZa7p8ZY=;
 b=ZM4F3xWDK6Hw1/9ibUUgPDIAgYDxVN3QLZsTkuSfAokHTmaggKeC633Lxv3P17nn3a
 okJzI1AnjcabtKEquUqGeCMD9S+DN93vG6imDFp5bUccfj0dX9VG7I+f9YFIiav3QMBw
 IQAFr9I1oJU0QAn7mCskfQ++jD5vouovrj/e563oA1YGT3ptndyrVhNtUJ9JGfUnGsuX
 sNJSiG8tIJ/kZFxOIn7s8fdG/6AH1xdfr6y8k+2a831tTL8dcGfT3UkmK5cdYBA3I5hc
 70wXMZj9nVM4pZVRb1yef5SV6GGTxp8YpfA+UdC9N5wymUKfCZKrEZ/MnRj39mcWzNVa
 CCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAgGtci5pGecpxPxGPjkaSEL4OVE7rwFSl1wZa7p8ZY=;
 b=G4TGuGYVT/n9W6xk415bDAVHt+xtRSL8lgdZblOheUIZZWSKQ+5oeczzr8W1t4oWoN
 dPgsrIIszh53sR9KeQUfiJxMxl3d/khRH0pGMqjRVPRxrLy8DOR3hx5W58w0qWJw1O0D
 JkRE/LuiLjMyX0eVI5h+glR5rpsRR+A5QMdHTYP+oHxU43CLSnoYW+WcDsoD3WbrDXI7
 heg8Z4HBHGapTPTqG8JRh8L1KOCE7wfY3C7xWLN+G3Ct6HBvtp+XhxXJTZZ2AewFEE/p
 RhdMe3Rv4gJaqdhtwj4TNpyW9GDZaF125xkVR7PYMnWq9MIxricg7XOMeMXTEX4JKZwb
 Mlfw==
X-Gm-Message-State: AOAM530NpIRT/Mjragmow7vuPYRZYQkK72fT7kJz2Tk5Bl1CjAIH36Yu
 NFbUr2WRIHNxBc1OTNsryK3XrsfEapzAIzHyK0o=
X-Google-Smtp-Source: ABdhPJyf2LbuC9m1ScfusKpq0d3iN7yhTosuIes5dzz8UTrb5Umw71LAHs+SEJ7Z0H8q1p3Wj4tzuzLMVTgelpoGODQ=
X-Received: by 2002:a25:6849:: with SMTP id d70mr9684946ybc.395.1601211736814; 
 Sun, 27 Sep 2020 06:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824004816.GS6002@pendragon.ideasonboard.com>
In-Reply-To: <20200824004816.GS6002@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 27 Sep 2020 14:01:50 +0100
Message-ID: <CA+V-a8uq44hKOxbwBXZ_90q6e4JjCEPwOWp4BDY7BJJaP1Cg6g@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Aug 24, 2020 at 1:48 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Thu, Aug 13, 2020 at 03:00:41PM +0100, Lad Prabhakar wrote:
> > The iwg21d comes with a 7" capacitive touch screen, therefore
> > add support for it.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Everything seems to match the schematics :-)
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> > v1->v2
> > * This patch is part of series [1] (rest of the patches have be accepted
> >   by Geert [2]).
> > * Added regulator for lvds
> > * Added reset pin for touchpanel
> > * This patch is based on series [3]
> >
> > [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> >     ?series=330277
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> > [3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> >     ?series=330957
> > ---
> >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >
Would you be queueing this patch along with DRM driver patches for v5.10 ?

Cheers,
Prabhakar

> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > index b3461a61a4bf..9bf4fbd9c736 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > @@ -30,6 +30,7 @@
> >
> >  /dts-v1/;
> >  #include "r8a7742-iwg21m.dtsi"
> > +#include <dt-bindings/pwm/pwm.h>
> >
> >  / {
> >       model = "iWave Systems RainboW-G21D-Qseven board based on RZ/G1H";
> > @@ -52,6 +53,51 @@
> >               clock-frequency = <26000000>;
> >       };
> >
> > +     lcd_backlight: backlight {
> > +             compatible = "pwm-backlight";
> > +             pwms = <&tpu 2 5000000 0>;
> > +             brightness-levels = <0 4 8 16 32 64 128 255>;
> > +             pinctrl-0 = <&backlight_pins>;
> > +             pinctrl-names = "default";
> > +             default-brightness-level = <7>;
> > +             enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
> > +     };
> > +
> > +     lvds-receiver {
> > +             compatible = "ti,ds90cf384a", "lvds-decoder";
> > +             vcc-supply = <&vcc_3v3_tft1>;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +                             lvds_receiver_in: endpoint {
> > +                                     remote-endpoint = <&lvds0_out>;
> > +                             };
> > +                     };
> > +                     port@1 {
> > +                             reg = <1>;
> > +                             lvds_receiver_out: endpoint {
> > +                                     remote-endpoint = <&panel_in>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     panel {
> > +             compatible = "edt,etm0700g0dh6";
> > +             backlight = <&lcd_backlight>;
> > +             power-supply = <&vcc_3v3_tft1>;
> > +
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint = <&lvds_receiver_out>;
> > +                     };
> > +             };
> > +     };
> > +
> >       reg_1p5v: 1p5v {
> >               compatible = "regulator-fixed";
> >               regulator-name = "1P5V";
> > @@ -75,6 +121,17 @@
> >               };
> >       };
> >
> > +     vcc_3v3_tft1: regulator-panel {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "vcc-3v3-tft1";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             enable-active-high;
> > +             startup-delay-us = <500>;
> > +             gpio = <&gpio5 28 GPIO_ACTIVE_HIGH>;
> > +     };
> > +
> >       vcc_sdhi2: regulator-vcc-sdhi2 {
> >               compatible = "regulator-fixed";
> >
> > @@ -129,12 +186,34 @@
> >               VDDIO-supply = <&reg_3p3v>;
> >               VDDD-supply = <&reg_1p5v>;
> >       };
> > +
> > +     touch: touchpanel@38 {
> > +             compatible = "edt,edt-ft5406";
> > +             reg = <0x38>;
> > +             interrupt-parent = <&gpio0>;
> > +             interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> > +             /* GP1_29 is also shared with audio codec reset pin */
> > +             reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
> > +             vcc-supply = <&vcc_3v3_tft1>;
> > +     };
> >  };
> >
> >  &cmt0 {
> >       status = "okay";
> >  };
> >
> > +&du {
> > +     status = "okay";
> > +};
> > +
> > +&gpio0 {
> > +     touch-interrupt {
> > +             gpio-hog;
> > +             gpios = <24 GPIO_ACTIVE_LOW>;
> > +             input;
> > +     };
> > +};
> > +
> >  &hsusb {
> >       pinctrl-0 = <&usb0_pins>;
> >       pinctrl-names = "default";
> > @@ -165,6 +244,11 @@
> >               function = "avb";
> >       };
> >
> > +     backlight_pins: backlight {
> > +             groups = "tpu0_to2";
> > +             function = "tpu0";
> > +     };
> > +
> >       i2c2_pins: i2c2 {
> >               groups = "i2c2_b";
> >               function = "i2c2";
> > @@ -208,6 +292,17 @@
> >       };
> >  };
> >
> > +&lvds0 {
> > +     status = "okay";
> > +     ports {
> > +             port@1 {
> > +                     lvds0_out: endpoint {
> > +                             remote-endpoint = <&lvds_receiver_in>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >  &rcar_sound {
> >       pinctrl-0 = <&sound_pins>;
> >       pinctrl-names = "default";
> > @@ -261,6 +356,10 @@
> >       shared-pin;
> >  };
> >
> > +&tpu {
> > +     status = "okay";
> > +};
> > +
> >  &usbphy {
> >       status = "okay";
> >  };
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
