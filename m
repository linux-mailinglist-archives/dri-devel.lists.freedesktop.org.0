Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E8D8A71
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F178889E69;
	Wed, 16 Oct 2019 08:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C27889E69
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:03:10 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95F022168B;
 Wed, 16 Oct 2019 08:03:09 +0000 (UTC)
Date: Wed, 16 Oct 2019 10:03:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v10 5/6] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Message-ID: <20191016080306.44pmo3rfmtnkgosq@gilmour>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-6-jagan@amarulasolutions.com>
 <20191007105708.raxavxk4n7bvxh7x@gilmour>
 <CAMty3ZCiwOGgwbsjTHvEZhwHGhsgb6_FeBs9hHgLai9=rV2_HQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZCiwOGgwbsjTHvEZhwHGhsgb6_FeBs9hHgLai9=rV2_HQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571212990;
 bh=wM/nUTK3S5psgEypnAz0OtgZ+jpM99/JuUjxmXaJLbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QCPGi1WVH+6Crkf1iDbM7YIS4z1GKzHDuhctLzfeInuMMn5u5nDXy5q+iDHNmXvrb
 M2GYnuqAUqL+5tCNIq8sknLo9+qH3E7ER6Gi7uJGEPEhb4YoZL80odrE/w5vwRzqYJ
 KnYL7dFRNfLvSpXT4Csnnc3JMz0IYoC5vjRwliAg=
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
Content-Type: multipart/mixed; boundary="===============0534481325=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0534481325==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="daxw7i7armk2zq3y"
Content-Disposition: inline


--daxw7i7armk2zq3y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 14, 2019 at 05:37:50PM +0530, Jagan Teki wrote:
> On Mon, Oct 7, 2019 at 4:27 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Sat, Oct 05, 2019 at 07:49:12PM +0530, Jagan Teki wrote:
> > > Add MIPI DSI pipeline for Allwinner A64.
> > >
> > > - dsi node, with A64 compatible since it doesn't support
> > >   DSI_SCLK gating unlike A33
> > > - dphy node, with A64 compatible with A33 fallback since
> > >   DPHY on A64 and A33 is similar
> > > - finally, attach the dsi_in to tcon0 for complete MIPI DSI
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 38 +++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > index 69128a6dfc46..ad4170b8aee0 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > @@ -382,6 +382,12 @@
> > >                                       #address-cells = <1>;
> > >                                       #size-cells = <0>;
> > >                                       reg = <1>;
> > > +
> > > +                                     tcon0_out_dsi: endpoint@1 {
> > > +                                             reg = <1>;
> > > +                                             remote-endpoint = <&dsi_in_tcon0>;
> > > +                                             allwinner,tcon-channel = <1>;
> > > +                                     };
> > >                               };
> > >                       };
> > >               };
> > > @@ -1003,6 +1009,38 @@
> > >                       status = "disabled";
> > >               };
> > >
> > > +             dsi: dsi@1ca0000 {
> > > +                     compatible = "allwinner,sun50i-a64-mipi-dsi";
> > > +                     reg = <0x01ca0000 0x1000>;
> > > +                     interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > > +                     clocks = <&ccu CLK_BUS_MIPI_DSI>;
> > > +                     clock-names = "bus";
> >
> > This won't validate with the bindings you have either here, since it
> > still expects bus and mod.
> >
> > I guess in that cas, we can just drop clock-names, which will require
> > a bit of work on the driver side as well.
>
> Okay.
> mod clock is not required for a64, ie reason we have has_mod_clk quirk
> patch. Adjust the clock-names: on dt-bindings would make sense here,
> what do you think?

I'm confused, what are you suggesting?

Maxime

--daxw7i7armk2zq3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXabOugAKCRDj7w1vZxhR
xaRxAQCMC8f5R5O0x3PDOXjho8DhgMeHnD0ME5PLyqwkpk557QD+JbRITmjTlYf0
FHZLWNsA4avNld7ActyJrkctTuut3AM=
=aBRs
-----END PGP SIGNATURE-----

--daxw7i7armk2zq3y--

--===============0534481325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0534481325==--
