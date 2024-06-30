Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894491D200
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 16:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737FE10E042;
	Sun, 30 Jun 2024 14:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ff/aOzUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5CD10E042
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 14:17:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C2F2ACE0AD6;
 Sun, 30 Jun 2024 14:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041B0C2BD10;
 Sun, 30 Jun 2024 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719757036;
 bh=OeWxeK/hAq3F4XgmyMlEfI6ENOAQhsAVS+UmRnEu2Nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ff/aOzUbI30EZmVRrbvhaDGnR9o5VV861hQnrRQIDmcvLywHaYyqq33V3lu3ZpS5v
 uv2sUS8BMBtkJ003PIdCy/O1/qkY1H7EqR4aWX3ITPrVuMAIZ72VbQW/KO7c01KA+9
 FvVUEBZhBeZq4KLDzTDjRUf2dAwVm+luTOijGf0ZXD7rU0Qs3ta/oLHTR2WbhGVLog
 nNnrV/ZKUuDhCI/lcLxHmcTu9K6XdaUjDSfvlAN6/jhXwoHjS6LcbHPjrKnqwjBz+W
 3KM9y3tyozQ6Lqat32EctqoY1jrKXccke5ADC0AQhweH3lQRLwY9NwcY/ZCCevHbVt
 TiuzKB4x8VqjA==
Date: Sun, 30 Jun 2024 15:17:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: st7701: Add Anbernic RG28XX
 panel
Message-ID: <20240630-babied-grill-13c840abb70a@spud>
References: <20240628051019.975172-1-kikuchan98@gmail.com>
 <20240628051019.975172-2-kikuchan98@gmail.com>
 <20240628-splashy-slug-1d74e3fd9fe6@spud>
 <CAG40kxERY2r2cj58kjVMMg1JVOChRKraKYFo_K5C5fnx0g80Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x1OfUyRHDxZE9NVr"
Content-Disposition: inline
In-Reply-To: <CAG40kxERY2r2cj58kjVMMg1JVOChRKraKYFo_K5C5fnx0g80Qw@mail.gmail.com>
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


--x1OfUyRHDxZE9NVr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 05:26:56PM +0900, Hironori KIKUCHI wrote:
> Hello Conor,
>=20
> Thank you for your reply.
>=20
> On Sat, Jun 29, 2024 at 1:27=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Fri, Jun 28, 2024 at 02:10:15PM +0900, Hironori KIKUCHI wrote:
> > > The RG28XX panel is a display panel of the Anbernic RG28XX, a handheld
> > > gaming device from Anbernic. It is 2.8 inches in size (diagonally) wi=
th
> > > a resolution of 480x640.
> > >
> > > This panel is driven by a variant of the ST7701 driver IC internally,
> > > confirmed by dumping and analyzing its BSP initialization sequence
> > > by using a logic analyzer. It is very similar to the existing
> > > densitron,dmt028vghmcmi-1a panel, but differs in some unknown
> > > register values, so add a new entry for the panel to distinguish them.
> > >
> > > Additionally, the panel is connected via SPI instead of MIPI DSI.
> > > So add and modify for SPI as well.
> > >
> > > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > > ---
> > >  .../display/panel/sitronix,st7701.yaml        | 69 +++++++++++++++++=
--
> > >  1 file changed, 64 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/sitronix=
,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7=
701.yaml
> > > index b348f5bf0a9..835ea436531 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701=
=2Eyaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701=
=2Eyaml
> > > @@ -20,21 +20,19 @@ description: |
> > >    Densitron DMT028VGHMCMI-1A is 480x640, 2-lane MIPI DSI LCD panel
> > >    which has built-in ST7701 chip.
> > >
> > > -allOf:
> > > -  - $ref: panel-common.yaml#
> > > -
> > >  properties:
> > >    compatible:
> > >      items:
> > >        - enum:
> > >            - anbernic,rg-arc-panel
> > > +          - anbernic,rg28xx-panel
> >
> > Please no wildcards in compatibles - what is the actual model of this
> > panel? I don't really want to see the model of the handheld here if
> > possible.
>=20
> Well, the "RG28XX" is the actual product name of the device...

Ah, I see. I didn't realise that.

> Besides, there is no vendor name or model name on the panel; there is
> no information at all.
> Since the panel cannot be disassembled from the housing of the device,
> I named it like this.
>=20
> >
> > >            - densitron,dmt028vghmcmi-1a
> > >            - elida,kd50t048a
> > >            - techstar,ts8550b
> > >        - const: sitronix,st7701
> > >
> > >    reg:
> > > -    description: DSI virtual channel used by that screen
> > > +    description: DSI / SPI channel used by that screen
> > >      maxItems: 1
> > >
> > >    VCC-supply:
> > > @@ -43,6 +41,13 @@ properties:
> > >    IOVCC-supply:
> > >      description: I/O system regulator
> > >
> > > +  dc-gpios:
> > > +    maxItems: 1
> > > +    description:
> > > +      Controller data/command selection (D/CX) in 4-line SPI mode.
> > > +      If not set, the controller is in 3-line SPI mode.
> > > +      Disallowed for DSI.
> > > +
> > >    port: true
> > >    reset-gpios: true
> > >    rotation: true
> > > @@ -57,7 +62,38 @@ required:
> > >    - port
> > >    - reset-gpios
> > >
> > > -additionalProperties: false
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            # SPI connected panels
> > > +            enum:
> > > +              - anbernic,rg28xx-panel
> > > +    then:
> > > +      $ref: /schemas/spi/spi-peripheral-props.yaml
> >
> > I'm not really keen on this. I'd rather see a different binding for the
> > SPI version compared to the MIPI ones. Is doing things like this common
> > for panels? If it is, I'll turn a blind eye..
>=20
> This might be the first case that a driver supports both DSI and SPI
> for a panel.
> The panel can be either a DSI device or an SPI device.

The commit message sounded like the panel was capable of doing SPI
instead of DSI, is that not the case and the panel is actually capable
of doing both, just happens to be connected as SPI in this particular
device?

> I'm not sure if this is the right way to represent it in the documentatio=
n...
>=20
> >
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          not:
> > > +            contains:
> > > +              # DSI or SPI without D/CX pin
> > > +              enum:
> > > +                - anbernic,rg-arc-panel
> > > +                - anbernic,rg28xx-panel
> > > +                - densitron,dmt028vghmcmi-1a
> > > +                - elida,kd50t048a
> > > +                - techstar,ts8550b
> >
> > This is all the compatibles in the file, so nothing is allowed to use
> > dc-gpios? Why bother adding it?
>=20
> There are 3 types of connections that the driver supports: DSI, SPI
> with D/CX pin, and SPI without D/CX pin.
> Although most SPI panels don't have a D/CX pin, theoretically "SPI
> with D/CX pin" exists.
> So, it's just prepared for that.
>=20
> IMHO, once it's found, the list should be negated. List panels for SPI
> with D/CX pin, instead.

To be honest, I'd just delete this complication until something arrives
that actually uses that pin.

Cheers,
Conor.

--x1OfUyRHDxZE9NVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoFo5gAKCRB4tDGHoIJi
0qshAQDKaLumFOWuN4jrXjbK4gsVoAH2fcl1soFQO6NFzf5UwAD/clQeMvJj+YfN
Da1uAHKzY0HmeY5HiUmeSFDTZ4GsZgI=
=rtsx
-----END PGP SIGNATURE-----

--x1OfUyRHDxZE9NVr--
