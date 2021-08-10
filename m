Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72783E86AC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 01:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0529689F1B;
	Tue, 10 Aug 2021 23:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4F89F1B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 23:47:02 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id m193so1012479ybf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 16:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VMZc2dJG0IVvDii0ju/5gk9CLgIViJqtLaSJR0JaFr4=;
 b=tsObyjyGNKaaWd/XQtMX2ikFBbCOkak2xZoV4i5q9X/iLIajvaWzO3zjheULnyCF/F
 upR6zOg+WFekaC3TVEH0RRiFXqViDdtRu+yJ3N6pHZdQQD2mFwuBTAG/Hst/DZ+txfOr
 HzZvbnURCbGQs7/65nW2lKNMxdwP1DZrBDuIv1MVH5pxKXELQcsAbBJ1s1voaf/yuBzW
 BbBduIsSRWHGw09nKRDh1GWCmhxmX7IRYZjYsTqJRGo31iMUTvLWldThb9q7KOREd06z
 OxFATCOI+AstmwInuZXhrmmPHqPFVgIk3aB6tUITeHwYFTz+krFoIRNrbeCrH+MI8vEW
 +ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VMZc2dJG0IVvDii0ju/5gk9CLgIViJqtLaSJR0JaFr4=;
 b=MGBVNG8oz0I8kT5/Eqki9Qs+jd78jIxBzmOp1Hf7sXhT30rT2mddGt6M40Qkr/XNwk
 yspqQi0yctPI5cCEUhRbETab8sAV8nyabS1GnQFi+uSvkPOlQrMM9GuC+llK/kbee598
 w0tbkmks0aPnoh/H/zSBrWj1Z4VDIRL1TXGUCrFXO6cpeY34L3PvTk4TGSNIqAKfQheB
 FXnTiJLaLAi9uaJQu7Gv6ni9wPpGC8qvg7jPEiuSas914HyV1qXeCelQOr0bAIl91fKh
 9cxzE5B3p/VDyA0beysCJa2ZN4T2Rn1ZWj1nzL4GqYYTHI0UTryHeZN1ZY2uENCRMAAV
 1iIQ==
X-Gm-Message-State: AOAM532mQA2BZzRe6Bw//nST8Eu+s1WNxG8pGcepmXDU0tPX/M0fNyRI
 baefKoZQYrcM7nHdrn0NQF5dv33lwvBPcd/qd2k=
X-Google-Smtp-Source: ABdhPJz2jGiRfVs3tdMPjobotXKYCEf+KoQRuTVyKQHORzgudkLGxDROD/H42cfwDts5PBgsM8hLM6XMZ/+XSqyLWCE=
X-Received: by 2002:a25:d113:: with SMTP id i19mr41191742ybg.39.1628639221313; 
 Tue, 10 Aug 2021 16:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210810223123.2174596-1-pgwipeout@gmail.com>
 <3455830.ypAZr3mf50@diego>
In-Reply-To: <3455830.ypAZr3mf50@diego>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Aug 2021 19:46:50 -0400
Message-ID: <CAMdYzYp7FvkOt3u+UJfTep1qb5Vs_ynv4tLVyWbzmXtD+Bvo5w@mail.gmail.com>
Subject: Re: [BUG] dw-mipi-dsi-rockchip display corruption with dsi panel
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 7:11 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Peter,
>
> Am Mittwoch, 11. August 2021, 00:31:24 CEST schrieb Peter Geis:
> > Good Evening,
> >
> > I've been attempting to light off the feiyang fy07024di26a30d panel on
> > the rockpro64. This is the official panel from the Pine64 store.
> > I've confirmed it works with the downstream kernel on both the rk3399
> > and rk3566, but on the mainline driver the display is partially
> > corrupted (see attached photo: [1]).
> >
> > As you can see, the left half of the display is fine, but the right hal=
f
> > of the display is corrupted with the pixels smearing horizontally.
> >
> > I saw when the panel was added, some additional code was added to
> > handle burst mode in the sun6_mipi_dsi driver [2].
> > I've seen that the dw-mipi-dsi driver appears to already support burst
> > mode and I can't find anything out of place there.
> > I also haven't had much success finding anything obviously different in
> > the downstream driver vs the upstream driver that would explain this.
> >
> > Attached below is the in-progress dts changes for an example of how the
> > panel is plugged in.
>
> is that really a dual-dsi panel needing two dsi controllers to drive it?
>
> With that tiny resultion of 1024x600 I definitly wouldn't expect this,
> in contrast to say the 2048x1536 dual-dsi displays used in the
> Gru-Scarlet ChromeOS tablets.
>
> So maybe just drop the 2nd dsi controller connection in a first step?
> Because I really don't think that is the case on the hardware.
>
> The dual-dsi setup means that you have one vop supplying half of its
> display data to each of the 2 involved dsi controllers. And you're missin=
g
> in fact half of your display data.

Thanks, that was it.
I had tried removing the link previously, but I had to also disable
that controller altogether or the vop fails to probe silently.

That is a common issue I ran into when getting this all set up,
anything failed to probe for the dsi panel the vop just silently dies
in the background and graphics fail everywhere.

>
>
> Heiko
>
>
>
> > I admit, I have little understanding of the mipi-dsi internal workings,
> > so I'm reaching out to the experts on how to correct this.
> >
> > Thank you for your time,
> > Peter Geis
> >
> > [1] https://photos.app.goo.gl/LBA9M2WcweGaEb4cA
> > [2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/2018111=
6163916.29621-1-jagan@amarulasolutions.com/
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/=
arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
> > index 687a5afa5d2c..af55a30297ae 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
> > @@ -20,6 +20,13 @@ chosen {
> >               stdout-path =3D "serial2:1500000n8";
> >       };
> >
> > +     backlight: backlight {
> > +             compatible =3D "pwm-backlight";
> > +             pwms =3D <&pwm0 0 1000000 0>;
> > +             brightness-levels =3D <0 4 8 16 32 64 128 255>;
> > +             default-brightness-level =3D <128>;
> > +     };
> > +
> >       clkin_gmac: external-gmac-clock {
> >               compatible =3D "fixed-clock";
> >               clock-frequency =3D <125000000>;
> > @@ -69,7 +76,7 @@ diy_led: led-1 {
> >
> >       fan: pwm-fan {
> >               compatible =3D "pwm-fan";
> > -             cooling-levels =3D <0 150 200 255>;
> > +             cooling-levels =3D <0 100 150 255>;
> >               #cooling-cells =3D <2>;
> >               fan-supply =3D <&vcc12v_dcin>;
> >               pwms =3D <&pwm1 0 50000 0>;
> > @@ -220,6 +227,16 @@ vdd_log: vdd-log {
> >               regulator-max-microvolt =3D <1700000>;
> >               vin-supply =3D <&vcc5v0_sys>;
> >       };
> > +
> > +     avdd: avdd {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "avdd";
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             regulator-min-microvolt =3D <11000000>;
> > +             regulator-max-microvolt =3D <11000000>;
> > +             vin-supply =3D <&vcc3v3_s0>;
> > +     };
> >  };
> >
> >  &cpu_l0 {
> > @@ -428,8 +445,8 @@ regulator-state-mem {
> >
> >                       vcc3v0_touch: LDO_REG2 {
> >                               regulator-name =3D "vcc3v0_touch";
> > -                             regulator-always-on;
> > -                             regulator-boot-on;
> > +//                           regulator-always-on;
> > +//                           regulator-boot-on;
> >                               regulator-min-microvolt =3D <3000000>;
> >                               regulator-max-microvolt =3D <3000000>;
> >                               regulator-state-mem {
> > @@ -518,8 +535,8 @@ regulator-state-mem {
> >
> >                       vcc3v3_s0: SWITCH_REG2 {
> >                               regulator-name =3D "vcc3v3_s0";
> > -                             regulator-always-on;
> > -                             regulator-boot-on;
> > +//                           regulator-always-on;
> > +//                           regulator-boot-on;
> >                               regulator-state-mem {
> >                                       regulator-off-in-suspend;
> >                               };
> > @@ -593,6 +610,19 @@ fusb0: typec-portc@22 {
> >               vbus-supply =3D <&vcc5v0_typec>;
> >               status =3D "okay";
> >       };
> > +
> > +     touch: touchscreen@5d {
> > +             compatible =3D "goodix,gt911";
> > +             reg =3D <0x5d>;
> > +             AVDD28-supply =3D <&vcc3v0_touch>;
> > +             VDDIO-supply =3D <&vcc3v0_touch>;
> > +             interrupt-parent =3D <&gpio4>;
> > +             interrupts =3D <RK_PD5 IRQ_TYPE_EDGE_FALLING>;
> > +             irq-gpios =3D <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
> > +             reset-gpios =3D <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
> > +//           touchscreen-inverted-x;
> > +//           touchscreen-inverted-y;
> > +     };
> >  };
> >
> >  &i2s0 {
> > @@ -628,6 +658,88 @@ &io_domains {
> >       gpio1830-supply =3D <&vcc_3v0>;
> >  };
> >
> > +&mipi_dsi {
> > +     status =3D "okay";
> > +     clock-master;
> > +
> > +     ports {
> > +             mipi_out: port@1 {
> > +                     reg =3D <1>;
> > +
> > +                     mipi_out_panel: endpoint {
> > +                             remote-endpoint =3D <&mipi_in_panel>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     mipi_panel: panel@0 {
> > +             compatible =3D "feiyang,fy07024di26a30d";
> > +             reg =3D <0>;
> > +             backlight =3D <&backlight>;
> > +             reset-gpios =3D <&gpio4 25 GPIO_ACTIVE_HIGH>;
> > +//           enable-gpios =3D <&gpio4 25 GPIO_ACTIVE_HIGH>;
> > +             width-mm =3D <154>;
> > +             height-mm =3D <86>;
> > +             rotation =3D <0>;
> > +             avdd-supply =3D <&avdd>;
> > +             dvdd-supply =3D <&vcc3v3_s0>;
> > +
> > +             display-timings {
> > +                     native-mode =3D <&timing0>;
> > +                     timing0: timing0 {
> > +                             clock-frequency =3D <50000000>;
> > +                             hactive =3D <1024>;
> > +                             vactive =3D <600>;
> > +                             hfront-porch =3D <160>;
> > +                             hback-porch =3D <160>;
> > +                             hsync-len =3D <10>;
> > +                             vback-porch =3D <23>;
> > +                             vfront-porch =3D <12>;
> > +                             vsync-len =3D <1>;
> > +                             hsync-active =3D <0>;
> > +                             vsync-active =3D <0>;
> > +                             pixelclk-active =3D <0>;
> > +                             de-active =3D <0>;
> > +                     };
> > +             };
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             mipi_in_panel: endpoint {
> > +                                     remote-endpoint =3D <&mipi_out_pa=
nel>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             mipi1_in_panel: endpoint@1 {
> > +                                     remote-endpoint =3D <&mipi1_out_p=
anel>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&mipi_dsi1 {
> > +     status =3D "okay";
> > +
> > +     ports {
> > +             mipi1_out: port@1 {
> > +                     reg =3D <1>;
> > +
> > +                     mipi1_out_panel: endpoint {
> > +                             remote-endpoint =3D <&mipi1_in_panel>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >  &pcie0 {
> >       ep-gpios =3D <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
> >       num-lanes =3D <4>;
> >
>
>
>
>
