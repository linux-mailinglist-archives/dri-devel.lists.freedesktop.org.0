Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28734AED84
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A0010E66A;
	Wed,  9 Feb 2022 09:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5DB10E66A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:04:40 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 33E683202120;
 Wed,  9 Feb 2022 04:04:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 09 Feb 2022 04:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=wq9K8TIqqnII34EajKjY373KlBE8T1eHtSgtgD
 Cg1VE=; b=Pya8CREX5RM8DnTM39JZRbXdYNgBfsjerAFE7lVkHyHLKt81EdfLn+
 zE4M5+gZfBdllAF1CQ4xNRZYHjy1qPQ0ljG36wWwSI0EKZl7EDWgAG5chDJ4+zaK
 ikDdCzlJkuAOi1dBNXxx3OT4zq8/ImTEcEJ/vq94oGaqoCSE9/4OX0yaqkn8cwoJ
 /Yab8HR18Vp3gfBTDrShqgw8/XHuF28G/brRV9U2faenji0xKdVti8UKNP04kSvo
 5QHauJrO3WZEIs+4dluUxFvqLVvvwhcWlUvojo1re+KX8Ge0t95hbkRDSkc94Tyl
 SLUWz8WO6KeGuLTYS9HgjG5c1U5Q3cbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wq9K8TIqqnII34Eaj
 KjY373KlBE8T1eHtSgtgDCg1VE=; b=Fe15rbGRMwoDIk5kuiu6Od70IdKkYlG8V
 oLU/m9ABL2eiS/Fmy5Hdd9HJ1i5zFgrahrH5AEWMP/9DaxIrEKtNT52xoz4M/3A5
 IBvr0Ph4vp9tUTnI6ax5Qx4MaHDD/JR2ADJURDI4VNc7ZDxRYtHU+p58NbfSi6+9
 ochL05BI8V+y9c+fsn/BAH3FUgI3/qMfR8DbShwA9kFYNKAO6EDnyIezDPpJEt17
 ZV/vRKf7UES1UxM5ojrwbOdGjAqU97wesuNRDDDCGVWmPvfP9/VYrs/p1bPAhzV0
 qknkLP1U2Pxby1gnXRBB+vPyrcMq5UOhtR9T21+P4w/VoNvYYUEHQ==
X-ME-Sender: <xms:pYMDYrQHvfslFi17QUkDupfFQowH7GMOQxqtOdiCFw8tK5abMuQCQw>
 <xme:pYMDYswbTn4-gcYifEgAbGFbSW-aXz1yk8CZVc3nLUpnf8SrWYwX0bm3yMfgo8S1j
 xfPbG0HMrSCO05UoVc>
X-ME-Received: <xmr:pYMDYg12q3NgIG2qmvIY3cQQcYNUsRqUc8Ilaoo_dLMlA--Lsrp02d007QoUhMbUUMIYFvVFi_jgWhV0c-uydh3OfHIPNvlGGNtEEg4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeevtefhgfegtdfgueefgeduffejtdefteeufeehheekleffvdekheeijedt
 ueevnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpughotghinhdrtghomh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:poMDYrBd8KqlVIlYd3sk1kBhWk8yofBnBVSn_NfPLIDTLzsAqo2fBQ>
 <xmx:poMDYkjIB_dd1XaUGI48F-CszKvbrZ2u50A6kufM-MLsTP0ftFpinQ>
 <xmx:poMDYvqSh7_UFjcXaiYUzoRaewWGA0jDmAe3Sp5dZ0ZMH_4hEi4a0g>
 <xmx:poMDYvXBCw62C1Dw3qmwBjJCQROiWZehTfsYzPLzkAywfAm6t22Ezw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 04:04:37 -0500 (EST)
Date: Wed, 9 Feb 2022 10:04:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Message-ID: <20220209090436.yluv5jq6ulvkm6ij@houat>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-2-noralf@tronnes.org>
 <20220127093722.hsed3ny3gzk55o7w@houat>
 <YgGpWo80TvfTknhx@robh.at.kernel.org>
 <bebbd98c-ccba-b233-0299-45f58efee10b@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n7if6jelchhvgrp4"
Content-Disposition: inline
In-Reply-To: <bebbd98c-ccba-b233-0299-45f58efee10b@tronnes.org>
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
Cc: david@lechnology.com, devicetree@vger.kernel.org,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n7if6jelchhvgrp4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Tue, Feb 08, 2022 at 01:16:44PM +0100, Noralf Tr=F8nnes wrote:
> Den 08.02.2022 00.20, skrev Rob Herring:
> > On Thu, Jan 27, 2022 at 10:37:22AM +0100, Maxime Ripard wrote:
> >> Hi,
> >>
> >> On Tue, Jan 25, 2022 at 06:56:58PM +0100, Noralf Tr=F8nnes wrote:
> >>> Add binding for MIPI DBI compatible SPI panels.
> >>>
> >>> v2:
> >>> - Fix path for panel-common.yaml
> >>> - Use unevaluatedProperties
> >>> - Drop properties which are in the allOf section
> >>> - Drop model property (Rob)
> >>>
> >>> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> >>> ---
> >>>  .../display/panel/panel-mipi-dbi-spi.yaml     | 59 +++++++++++++++++=
++
> >>>  1 file changed, 59 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/panel/p=
anel-mipi-dbi-spi.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mi=
pi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mip=
i-dbi-spi.yaml
> >>> new file mode 100644
> >>> index 000000000000..b7cbeea0f8aa
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-=
spi.yaml
> >>> @@ -0,0 +1,59 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.=
yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: MIPI DBI SPI Panels Device Tree Bindings
> >>> +
> >>> +maintainers:
> >>> +  - Noralf Tr=F8nnes <noralf@tronnes.org>
> >>> +
> >>> +description:
> >>> +  This binding is for display panels using a MIPI DBI controller
> >>> +  in SPI mode.
> >>> +
> >>> +allOf:
> >>> +  - $ref: panel-common.yaml#
> >>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: panel-mipi-dbi-spi
> >>
> >> You need contains here, otherwise it will error out if you have two co=
mpatibles.
> >=20
> > Shouldn't it always have 2?
> >=20
> > Either way, this has to be split up between a common, shareable schema=
=20
> > and specific, complete schema(s). Like this:
> >=20
> > - A schema for everything common (that allows additional properties)
> >=20
> > - A schema for 'panel-mipi-dbi-spi' referencing the common schema plus=
=20
> >   'unevaluatedProperties: false'
> >=20
> > - Schemas for panels with their own additional properties (regulators,=
=20
> >   GPIOs, etc.)
> >=20
> > LVDS was restructured like this IIRC.
>
> The whole point of this exercise is to avoid the need for controller
> specific bindings.

I'm not sure to follow you here, nothing that either Rob or I discussed
would require a controller specific binding.

It would require a controller compatible, but the binding itself can
just mandate a controller compatible in addition to the
panel-mipi-dbi-spi compatible, without enforcing anything wrt the
compatible itself.

And the driver will just match panel-mipi-dbi-spi so there won't be any
driver change either?

In essence, it would be similar to the bindings of panel-lvds or the
AT24 EEPROM binding: you have two compatibles, but the driver is generic
and will just infer its behaviour based on the DT properties (and in our
case will load a firmware based on the specific compatible).

Wouldn't that work?

> This binding will cover all specifics about these
> controllers except for one thing and that is the controller
> configuration. Each controller has its own configuration commands. These
> commands will be loaded as a firmware file based on the compatible and
> applied by the driver.
>=20
> So this binding, the panel-common and spi-peripheral-props covers
> everything except for the controller configuration.
>=20
> Here's a copy of the DBI spec: https://www.docin.com/p-219732497.html
>=20
> This is my current version of the binding:
>=20
> # SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> %YAML 1.2
> ---
> $id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
> $schema: http://devicetree.org/meta-schemas/core.yaml#
>=20
> title: MIPI DBI SPI Panel
>=20
> maintainers:
>   - Noralf Tr=F8nnes <noralf@tronnes.org>
>=20
> description: |
>   This binding is for display panels using a MIPI DBI compatible controll=
er
>   in SPI mode.
>=20
>   The MIPI Alliance Standard for Display Bus Interface defines the
> electrical
>   and logical interfaces for display controllers historically used in mob=
ile
>   phones. The standard defines 4 display architecture types and this
> binding is
>   for type 1 which has full frame memory. There are 3 interface types in =
the
>   standard and type C is the serial interface.
>=20
>   The standard defines the following interface signals for type C:
>   - Power:
>     - Vdd: Power supply for display module
>     - Vddi: Logic level supply for interface signals
>     Combined into one in this binding called: power-supply
>   - Interface:
>     - CSx: Chip select
>     - SCL: Serial clock
>     - Dout: Serial out
>     - Din: Serial in
>     - SDA: Bidrectional in/out
>     - D/CX: Data/command selection, high=3Ddata, low=3Dcommand
>       Called dc-gpios in this binding.
>     - RESX: Reset when low
>       Called reset-gpios in this binding.
>=20
>   The type C interface has 3 options:
>=20
>     - Option 1: 9-bit mode and D/CX as the 9th bit
>       |              Command              |  the next command or
> following data  |
>=20
> |<0><D7><D6><D5><D4><D3><D2><D1><D0>|<D/CX><D7><D6><D5><D4><D3><D2><D1><D=
0>|
>=20
>     - Option 2: 16-bit mode and D/CX as a 9th bit
>       |              Command or data                              |
>       |<X><X><X><X><X><X><X><D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
>=20
>     - Option 3: 8-bit mode and D/CX as a separate interface line
>       |        Command or data         |
>       |<D7><D6><D5><D4><D3><D2><D1><D0>|
>=20
>   The panel resolution is specified using the panel-timing node properties
>   hactive (width) and vactive (height). The other mandatory panel-timing
>   properties should be set to zero except clock-frequency which can be
>   optionally set to inform about the actual pixel clock frequency.
>=20
>   If the panel is wired to the controller at an offset specify this using
>   hback-porch (x-offset) and vback-porch (y-offset).
>=20
> allOf:
>   - $ref: panel-common.yaml#
>   - $ref: /schemas/spi/spi-peripheral-props.yaml#
>=20
> properties:
>   compatible:
>     contains:
>       const: panel-dbi-spi
>=20
>   write-only:
>     type: boolean
>     description:
>       Controller is not readable (ie. MISO is not wired up).
>=20
>   dc-gpios:
>     maxItems: 1
>     description: |
>       Controller data/command selection (D/CX) in 4-line SPI mode.
>       If not set, the controller is in 3-line SPI mode.
>=20
> required:
>   - compatible
>   - reg
>   - panel-timing
>=20
> unevaluatedProperties: false
>=20
> examples:
>   - |
>     #include <dt-bindings/gpio/gpio.h>
>=20
>     spi {
>             #address-cells =3D <1>;
>             #size-cells =3D <0>;
>=20
>             display@0{
>                     compatible =3D "sainsmart18", "panel-dbi-spi";
>                     reg =3D <0>;
>                     spi-max-frequency =3D <40000000>;
>=20
>                     dc-gpios =3D <&gpio 24 GPIO_ACTIVE_HIGH>;
>                     reset-gpios =3D <&gpio 25 GPIO_ACTIVE_HIGH>;
>                     write-only;
>=20
>                     backlight =3D <&backlight>;
>=20
>                     width-mm =3D <35>;
>                     height-mm =3D <28>;
>=20
>                     panel-timing {
>                         hactive =3D <160>;
>                         vactive =3D <128>;
>                         hback-porch =3D <0>;
>                         vback-porch =3D <0>;
>=20
>                         clock-frequency =3D <0>;
>                         hfront-porch =3D <0>;
>                         hsync-len =3D <0>;
>                         vfront-porch =3D <0>;
>                         vsync-len =3D <0>;
>                     };
>             };
>     };
>=20
> ...

Yep, this looks good to me

Maxime

--n7if6jelchhvgrp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgODpAAKCRDj7w1vZxhR
xSxbAP0STkNaOv+6gW8aB65V5FKJkW8dVY4gY81QoeRmMIPZ9AD/Xptm8Fyg8QZ2
dRhBvocyBAREN4inlqxhxFBv822IewA=
=APzv
-----END PGP SIGNATURE-----

--n7if6jelchhvgrp4--
