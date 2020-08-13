Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ACE245D00
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6E46E427;
	Mon, 17 Aug 2020 07:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC076E0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 12:55:02 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id q16so3243216ybk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=75NAxvaDs5TZCdspioaGSmnreFOKWfDZk5QjErLtQWo=;
 b=CDjvd4jRQ4l4RbEGS7kLoVz83KH2o2s7f6rdC0YEkG0f8Va0KUGU5njmNmvWD0j9O2
 RfANcDqb2X+yWziaXZEzlqOWhHgeTL5f/SXl5lb/HJJBolKmL8PtCbAybApFYU+4oNy+
 lnxF35PhN+5FMSGJj7yvZ7+IaMhqk+Zr8Er4UrJAtC1B6RMdi44Rt0whIC9p5hiRDI5t
 RfaFR/cw7Y4b7tmBtWDoizH2xMs4738luDMcpqysPS53DKQksGYxvXrMEIOO6EKOPvsf
 ii3XQiL+ZlfdLla0STQiINsAwKKJAMkoTsBMKTHQiS4jiBtGJI7vp72c0zujwo8S7HEC
 Lxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=75NAxvaDs5TZCdspioaGSmnreFOKWfDZk5QjErLtQWo=;
 b=j4HVk1ezT/KZ+Zsv2l1zfBbI1BdmVItIr4aykGHJHggbwxDy6rPmQrOqs43ACUt3xc
 HlzYAc/4pc+ej2f1nqIiS975W/Si0SL4stbW9GXRXgQr9e1VNPAtqKFaEojaOoTweJbh
 itWys83JzVhGwAb/b/W4z1/kbI+w67zTYpC2q9dINA2tNvpFPvc5Qyy0kpmtJ1uYrAw+
 W5VKT/G2BsfXzQEX/Xi98E3EfeQldddjWiQj+LN33/Y5uZtsoEbwitISZ6AVrYCFu6A/
 FOF3pluiv6QP15W50CQkvBSGu/a2MTfMSNhyadIEkIVxat580UifibmIDTI/6VtikYeb
 ZSmA==
X-Gm-Message-State: AOAM5307qtOLKOnCDgU39ErV5vuDOwYIrgjR+fraSSDkcmY5vPR4ErVs
 jGJPBH/JJ1ukXIW5GpkxW9Vs4Qe3+G3iB8M/0/Q=
X-Google-Smtp-Source: ABdhPJyorRbchJgGCyTLDbB3eJQXWKepkgtINQSgf1E6LPJzQ0rtraBZ92Kn14p9F4+c7jW6VIEg4dj5p7BbrEEtpHs=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr6436845ybc.76.1597323301408; 
 Thu, 13 Aug 2020 05:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200811112638.GF6054@pendragon.ideasonboard.com>
In-Reply-To: <20200811112638.GF6054@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Aug 2020 13:54:35 +0100
Message-ID: <CA+V-a8sVA9r3_yrM6z7EX-XGp1d6Wy-6LjWsO7Td93C-236jvg@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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

Thank you for the review.

On Tue, Aug 11, 2020 at 12:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Aug 07, 2020 at 06:49:54PM +0100, Lad Prabhakar wrote:
> > The iwg21d comes with a 7" capacitive touch screen, therefore
> > add support for it.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 84 +++++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > index b3461a61a4bf..cf59fd61e422 100644
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
> > @@ -52,6 +53,50 @@
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
>
> It's actually a power supply, not an enable GPIO, but it doesn't matter
> much, I don't think there's a need to declare a regulator just for the
> sake of it.
>
Agreed will leave it as is.

> > +     };
> > +
> > +     lvds-receiver {
> > +             compatible = "ti,ds90cf384a", "lvds-decoder";
> > +             powerdown-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
>
> This should be handled as a shared power supply, as it's also needed for
> the touch screen. Biju has sent patches for the iwg20d that fixes a
> probe issue due to that problem, I think you can just copy the fix.
>
Done.

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
> > @@ -129,12 +174,31 @@
> >               VDDIO-supply = <&reg_3p3v>;
> >               VDDD-supply = <&reg_1p5v>;
> >       };
> > +
> > +     touch: touchpanel@38 {
> > +             compatible = "edt,edt-ft5406";
> > +             reg = <0x38>;
> > +             interrupt-parent = <&gpio0>;
> > +             interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
>
> Should the reset GPIO also be wired ? It seems to be shared with the
> audio codec though, which is annoying.
>
Done.

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
>
> Is this needed, or does requesting the interrupt in the touch screen
> driver configured the GPIO to an input automatically ?
>
Yes this is needed, the touch driver does not configure the pin as
GPIO input without this touch doesn't work.

Cheers,
Prabhakar
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
