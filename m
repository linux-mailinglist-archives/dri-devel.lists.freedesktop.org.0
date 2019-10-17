Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C18EDA946
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 11:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6FF6EA3A;
	Thu, 17 Oct 2019 09:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CEF6EA3A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 09:52:28 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B95B62089C;
 Thu, 17 Oct 2019 09:52:27 +0000 (UTC)
Date: Thu, 17 Oct 2019 11:52:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v10 5/6] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Message-ID: <20191017095225.ntx647ivegaldlyf@gilmour>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-6-jagan@amarulasolutions.com>
 <20191007105708.raxavxk4n7bvxh7x@gilmour>
 <CAMty3ZCiwOGgwbsjTHvEZhwHGhsgb6_FeBs9hHgLai9=rV2_HQ@mail.gmail.com>
 <20191016080306.44pmo3rfmtnkgosq@gilmour>
 <CAMty3ZCTE=W+TNRvdowec-eYB625j97uG8F3fzVMtRFsKsqFFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZCTE=W+TNRvdowec-eYB625j97uG8F3fzVMtRFsKsqFFQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571305948;
 bh=heLEKgwZ+8tjeXiZgv0CPgKfpmZiF5bmE7FHzvgHG+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+YmYI1z9eZrzwEKTLFUr4EVSMVwK9S3XiuOS6OyFaaq+ox6zAiNOaHGNcYHm9sEo
 SylGURPaZBepmZVpjBV+KovC6jML6u+iyobMfY9FjT+yOtJc8+7QGJhbK5lE2hk0yb
 +MHx+XDdULSnmYjPTqOAXJLSD3MyflKJ/JGrKKNw=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0706749731=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0706749731==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qmuvblcb44ik4jdi"
Content-Disposition: inline


--qmuvblcb44ik4jdi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2019 at 02:19:44PM +0530, Jagan Teki wrote:
> On Wed, Oct 16, 2019 at 1:33 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Mon, Oct 14, 2019 at 05:37:50PM +0530, Jagan Teki wrote:
> > > On Mon, Oct 7, 2019 at 4:27 PM Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > On Sat, Oct 05, 2019 at 07:49:12PM +0530, Jagan Teki wrote:
> > > > > Add MIPI DSI pipeline for Allwinner A64.
> > > > >
> > > > > - dsi node, with A64 compatible since it doesn't support
> > > > >   DSI_SCLK gating unlike A33
> > > > > - dphy node, with A64 compatible with A33 fallback since
> > > > >   DPHY on A64 and A33 is similar
> > > > > - finally, attach the dsi_in to tcon0 for complete MIPI DSI
> > > > >
> > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 38 +++++++++++++++++++
> > > > >  1 file changed, 38 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > > > index 69128a6dfc46..ad4170b8aee0 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > > > @@ -382,6 +382,12 @@
> > > > >                                       #address-cells = <1>;
> > > > >                                       #size-cells = <0>;
> > > > >                                       reg = <1>;
> > > > > +
> > > > > +                                     tcon0_out_dsi: endpoint@1 {
> > > > > +                                             reg = <1>;
> > > > > +                                             remote-endpoint = <&dsi_in_tcon0>;
> > > > > +                                             allwinner,tcon-channel = <1>;
> > > > > +                                     };
> > > > >                               };
> > > > >                       };
> > > > >               };
> > > > > @@ -1003,6 +1009,38 @@
> > > > >                       status = "disabled";
> > > > >               };
> > > > >
> > > > > +             dsi: dsi@1ca0000 {
> > > > > +                     compatible = "allwinner,sun50i-a64-mipi-dsi";
> > > > > +                     reg = <0x01ca0000 0x1000>;
> > > > > +                     interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +                     clocks = <&ccu CLK_BUS_MIPI_DSI>;
> > > > > +                     clock-names = "bus";
> > > >
> > > > This won't validate with the bindings you have either here, since it
> > > > still expects bus and mod.
> > > >
> > > > I guess in that cas, we can just drop clock-names, which will require
> > > > a bit of work on the driver side as well.
> > >
> > > Okay.
> > > mod clock is not required for a64, ie reason we have has_mod_clk quirk
> > > patch. Adjust the clock-names: on dt-bindings would make sense here,
> > > what do you think?
> >
> > I'm confused, what are you suggesting?
>
> Sorry for the confusion.
>
> The mod clock is not required for A64 and we have a patch for handling
> mod clock using has_mod_clk quirk(on the series), indeed the mod clock
> is available in A31 and not needed for A64. So, to satisfy this
> requirement the clock-names on dt-bindings can update to make mod
> clock-name is optional and bus clock is required.

No, the bus clock name is not needed if there's only one clock.

> I'm not exactly sure, this is correct but trying to understand if it
> is possible or not? something like
>
>    clocks:
>       minItems: 1
>       maxItems: 2
>      items:
>        - description: Bus Clock
>        - description: Module Clock

That's correct.

>    clock-names:
>       minItems: 1
>       maxItems: 2
>      items:
>        - const: bus
>        - const: mod

Here, just keep the current clock-names definition, and make it
required only for SoCs that are not the A64

Maxime

--qmuvblcb44ik4jdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXag52QAKCRDj7w1vZxhR
xb61APwI3pT187DnoWidQOdHcwSDhwtfnY5i43XaAc7tdaAkdQEAp+g/w4/dneO3
Vt2IfHqycYDGHUPJU8g6q4R6umrzPA0=
=ObSz
-----END PGP SIGNATURE-----

--qmuvblcb44ik4jdi--

--===============0706749731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0706749731==--
