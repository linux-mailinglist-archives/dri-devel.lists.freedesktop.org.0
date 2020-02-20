Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553521669FB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448B6EE76;
	Thu, 20 Feb 2020 21:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B036EE76
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:38:07 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id r5so4010317qtt.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ya7BzNWkK/aNL6Tv2iIJrxyXJnuSHN2DAiGDBEKCFME=;
 b=rQTVaInbOR0nNBRyjg7OUiy8zpk8uVI/C0yvF8JrYqzIEQXaLVgUUhJRN1dp8pKmNm
 Gwz9SKu9e2EeGhGibjXdXOkIWcD65V5R0kSHQo/FV8h/yDspwYoe45a0PxLatb83l2R2
 E+gKsNlBxI/ALyh7kYSXTVAZqLVIqD1E9iGgDyO2G+22xyqxeW2MvHdqZdc0W14QJYTg
 2f96GaDm7RjwtN9iVrbBKVYzKK61yLmEFQTwQqwxAVhOpMiVh+lWjrYiqOjcNWiCuzsd
 sjrS1O0nXJqPVxmVmzKMUoIMysA64KkWboAHu9Tn9hwDODRe1zlRhxtx+7BVuZW96B3M
 t8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ya7BzNWkK/aNL6Tv2iIJrxyXJnuSHN2DAiGDBEKCFME=;
 b=b0Fnsw1xgOr3oa42S5LK0XLrUJDDLfB2KfNzwmtahPP+X/dHSCXNMZwb95gSl1V96e
 IKZjMfeMSEX45IIMMQRXn3URC++wPjEZz0HLyCyMHG2fI9DbW+qsWfKaQh/2aph7d4sp
 7bUsIWAaP0UaRcnpvgA5nNiyEuFMhgjkD02ltTUyXhB52gOxeoRu/56XLQI8SH13/OIA
 ktdexqcBXpPWmqqD8Mphkw2DyRurWJAJCcvN1GNHigPr1lncPX24KPb6iTldwTV93acS
 D7cUYi68WzfwpC+dm3Wu9UABNWB+SEs/dzFtLbOXq5xRmBS0jLJvWYJim1pLXWDUs9EX
 jOnQ==
X-Gm-Message-State: APjAAAVXUS4dAKgLS/6STIptqmp9bqCJeK7giUSWhHqMVsNTmvcLdJ9l
 GLZO2mn4QaMxJaSrTrkq6msP+gASzQVRPbyArBE=
X-Google-Smtp-Source: APXvYqx9EZC0JNyWfusuB4QXxIWZmS+pIpitlsLm35JVfJohfpkIicI2phemogyTKUpyQwwnIXHCmtWvSi7373Q46BM=
X-Received: by 2002:aed:2510:: with SMTP id v16mr28785378qtc.306.1582234686749; 
 Thu, 20 Feb 2020 13:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-7-anarsoul@gmail.com>
 <20200220141725.GG4998@pendragon.ideasonboard.com>
In-Reply-To: <20200220141725.GG4998@pendragon.ideasonboard.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 20 Feb 2020 13:37:53 -0800
Message-ID: <CA+E=qVe7vMwK3m-AfTiK+mL=9+rD7dNWjYSXBLgZZnMU1zPeSg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: allwinner: a64: enable LCD-related hardware
 for Pinebook
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Torsten Duwe <duwe@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 6:17 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Vasily,

Hi Laurent,

> Thank you for the patch.
>
> On Thu, Feb 20, 2020 at 12:35:08AM -0800, Vasily Khoruzhick wrote:
> > From: Icenowy Zheng <icenowy@aosc.io>
> >
> > Pinebook has an ANX6345 bridge connected to the RGB666 LCD output and
> > eDP panel input. The bridge is controlled via I2C that's connected to
> > R_I2C bus.
> >
> > Enable all this hardware in device tree.
> >
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  .../dts/allwinner/sun50i-a64-pinebook.dts     | 69 ++++++++++++++++++-
> >  1 file changed, 68 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> > index c06c540e6c08..f5633f550d8a 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> > @@ -48,6 +48,18 @@ lid_switch {
> >               };
> >       };
> >
> > +     panel_edp: panel-edp {
> > +             compatible = "neweast,wjfh116008a";
> > +             backlight = <&backlight>;
> > +             power-supply = <&reg_dc1sw>;
> > +
> > +             port {
> > +                     panel_edp_in: endpoint {
> > +                             remote-endpoint = <&anx6345_out_edp>;
> > +                     };
> > +             };
> > +     };
> > +
> >       reg_vbklt: vbklt {
> >               compatible = "regulator-fixed";
> >               regulator-name = "vbklt";
> > @@ -109,6 +121,10 @@ &dai {
> >       status = "okay";
> >  };
> >
> > +&de {
> > +     status = "okay";
> > +};
> > +
> >  &ehci0 {
> >       phys = <&usbphy 0>;
> >       phy-names = "usb";
> > @@ -119,6 +135,10 @@ &ehci1 {
> >       status = "okay";
> >  };
> >
> > +&mixer0 {
> > +     status = "okay";
> > +};
> > +
> >  &mmc0 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&mmc0_pins>;
> > @@ -177,12 +197,45 @@ &pwm {
> >       status = "okay";
> >  };
> >
> > -/* The ANX6345 eDP-bridge is on r_i2c */
> >  &r_i2c {
> >       clock-frequency = <100000>;
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&r_i2c_pl89_pins>;
> >       status = "okay";
> > +
> > +     anx6345: anx6345@38 {
> > +             compatible = "analogix,anx6345";
> > +             reg = <0x38>;
> > +             reset-gpios = <&pio 3 24 GPIO_ACTIVE_LOW>; /* PD24 */
> > +             dvdd25-supply = <&reg_dldo2>;
> > +             dvdd12-supply = <&reg_fldo1>;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     anx6345_in: port@0 {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +                             reg = <0>;
> > +                             anx6345_in_tcon0: endpoint@0 {
> > +                                     reg = <0>;
> > +                                     remote-endpoint = <&tcon0_out_anx6345>;
> > +                             };
>
> As there's a single endpoint, you can drop the reg property, the @0
> suffix, and the #address-cells and #size-cells property in the port@0
> node (but not in the ports node).

Will do

> > +                     };
> > +
> > +                     anx6345_out: port@1 {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +                             reg = <1>;
> > +
> > +                             anx6345_out_edp: endpoint@0 {
> > +                                     reg = <0>;
> > +                                     remote-endpoint = <&panel_edp_in>;
> > +                             };
>
> Same here.

Will do

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for reviewing the series!


>
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &r_pio {
> > @@ -357,6 +410,20 @@ &sound {
> >                       "MIC2", "Internal Microphone Right";
> >  };
> >
> > +&tcon0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&lcd_rgb666_pins>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&tcon0_out {
> > +     tcon0_out_anx6345: endpoint@0 {
> > +             reg = <0>;
> > +             remote-endpoint = <&anx6345_in_tcon0>;
> > +     };
> > +};
> > +
> >  &uart0 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&uart0_pb_pins>;
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
