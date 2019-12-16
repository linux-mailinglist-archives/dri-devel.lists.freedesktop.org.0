Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 049261203A1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 12:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737216E4CA;
	Mon, 16 Dec 2019 11:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278376E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:20:47 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77993206CB;
 Mon, 16 Dec 2019 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576495247;
 bh=Mpc6KplCorpdPPjd389Z2K1v+WF0Ie2Wk28APYU3EIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UGMeVmTnoijpaXf0URFSEnCAv2QMv1w4vRp1RBYhvOjr4CWEskkLNUgDf2fd+/91T
 u9eHV45b6wdXZsbDBv6MufHf+l5akQjQKX51yICGrGeVg8jgDQZilSbp6BAom+IqcC
 Y7wsZm3BFQcwZ8XuLl9OoumuAFnRAITIuNShN1oI=
Date: Mon, 16 Dec 2019 12:20:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v12 1/7] dt-bindings: sun6i-dsi: Document A64 MIPI-DSI
 controller
Message-ID: <20191216112042.f4xvlgnbm4dk6wkq@gilmour.lan>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
 <20191203134816.5319-2-jagan@amarulasolutions.com>
 <20191204133600.gnv6dnhk6upe7xod@gilmour.lan>
 <CAMty3ZDU57Hj3ZSBC6sSMFWN9-HQadA03hmXUNUVS1W0UQQ3DA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZDU57Hj3ZSBC6sSMFWN9-HQadA03hmXUNUVS1W0UQQ3DA@mail.gmail.com>
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1609406784=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1609406784==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j7bmzwiznwnaw3ax"
Content-Disposition: inline


--j7bmzwiznwnaw3ax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 04:37:20PM +0530, Jagan Teki wrote:
> On Wed, Dec 4, 2019 at 7:06 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Tue, Dec 03, 2019 at 07:18:10PM +0530, Jagan Teki wrote:
> > > The MIPI DSI controller in Allwinner A64 is similar to A33.
> > >
> > > But unlike A33, A64 doesn't have DSI_SCLK gating so it is valid
> > > to have separate compatible for A64 on the same driver.
> > >
> > > DSI_SCLK uses mod clock-names on dt-bindings, so the same
> > > is not required for A64.
> > >
> > > On that note
> > > - A64 require minimum of 1 clock like the bus clock
> > > - A33 require minimum of 2 clocks like both bus, mod clocks
> > >
> > > So, update dt-bindings so-that it can document both A33,
> > > A64 bindings requirements.
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > > Changes for v12:
> > > - Use 'enum' instead of oneOf+const
> > >
> > >  .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 20 +++++++++++++++++--
> > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > index dafc0980c4fa..b91446475f35 100644
> > > --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > @@ -15,7 +15,9 @@ properties:
> > >    "#size-cells": true
> > >
> > >    compatible:
> > > -    const: allwinner,sun6i-a31-mipi-dsi
> > > +    enum:
> > > +      - allwinner,sun6i-a31-mipi-dsi
> > > +      - allwinner,sun50i-a64-mipi-dsi
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -24,6 +26,8 @@ properties:
> > >      maxItems: 1
> > >
> > >    clocks:
> > > +    minItems: 1
> > > +    maxItems: 2
> > >      items:
> > >        - description: Bus Clock
> > >        - description: Module Clock
> > > @@ -63,13 +67,25 @@ required:
> > >    - reg
> > >    - interrupts
> > >    - clocks
> > > -  - clock-names
> > >    - phys
> > >    - phy-names
> > >    - resets
> > >    - vcc-dsi-supply
> > >    - port
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +         compatible:
> > > +           contains:
> > > +             const: allwinner,sun6i-a31-mipi-dsi
> > > +      then:
> > > +        properties:
> > > +          clocks:
> > > +            minItems: 2
> > > +        required:
> > > +          - clock-names
> > > +
> >
> > Your else condition should check that the number of clocks items is 1
> > on the A64
>
> But the minItems mentioned as 1 in clocks, which is unchanged number
> by default. doesn't it sufficient?

In the main schema, it's said that the clocks property can have one or
two elements (to cover the A31 case that has one, and the A64 case
that has 2).

This is fine.

Later on, you enforce that the A64 has two elements, and this is fine
too.

However, you never check that on the A31 you only have one clock, and
you could very well have two and no one would notice.

Maxime

--j7bmzwiznwnaw3ax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdoigAKCRDj7w1vZxhR
xeS/AP9UV7Xns9t5VOhLEF+tbuQ+jcstzHVAz1d0xXveWqK7uAEAqK1mC/scTm09
qaYD48OkBiF38cUHEBrXBJdLGSE9gQI=
=7xiu
-----END PGP SIGNATURE-----

--j7bmzwiznwnaw3ax--

--===============1609406784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1609406784==--
