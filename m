Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46014BC6AC0
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 23:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9491610E0C3;
	Wed,  8 Oct 2025 21:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aVUTLXxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2B510E0C3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 21:22:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D2E86210C;
 Wed,  8 Oct 2025 21:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D60BC4CEE7;
 Wed,  8 Oct 2025 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759958573;
 bh=sOcycTE/foc4/tAc4gOrV9tZDXRBT7DUDt7ayt+7Ris=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aVUTLXxWBoYM0/HW7KulNWhVQ5C7mB1Gqyqtqr/HQdQ1i+2hjgMjBAYEdpoJsaH+r
 zYkg4PHbCmxMDiBZPpVAoqHIKnS+WDjrGArjes3Dj0dwcCx9eM/jWACMc0rMDHBZox
 BGZJ4F1ysu6wMBkolk+pT/zbz/NTd7EzXdWEt19OsvluqIOoZaLzppDOWsgDsU+u7F
 oiz63lbePsa4CkbOlSDg3spbBhmYwAZ2OWOgTjm/Cun5cZ+CZwjbIOS9IhISdC2t8V
 d9aqR4hIL7TwFjuKNGv2Ff3JDWDvmIno2Q+P6elJXLmPL/VKEJdZva/TS+fIQGIWQN
 2RVJ62Ft1/fYw==
Date: Wed, 8 Oct 2025 22:22:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20251008-broaden-antennae-02de66094ad3@spud>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-23-clamor95@gmail.com>
 <20251008-canopener-marsupial-a92355b656ef@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RwPRYaE9Gdjg3a7O"
Content-Disposition: inline
In-Reply-To: <20251008-canopener-marsupial-a92355b656ef@spud>
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


--RwPRYaE9Gdjg3a7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 10:21:06PM +0100, Conor Dooley wrote:
> On Wed, Oct 08, 2025 at 10:30:44AM +0300, Svyatoslav Ryhel wrote:
> > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> >=20
> > The #nvidia,mipi-calibrate-cells is not an introduction of property, su=
ch
> > property already exists in nvidia,tegra114-mipi.yaml and is used in
> > multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> > mipi calibration function and CSI function, in Tegra114+ mipi calibrati=
on
> > got a dedicated hardware block which is already supported. This property
> > here is used to align with mipi-calibration logic used by Tegra114+.
> >=20
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-csi.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-csi.yaml
> > new file mode 100644
> > index 000000000000..817b3097846b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-cs=
i.yaml
> > @@ -0,0 +1,135 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra20 CSI controller
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra20-csi
> > +      - nvidia,tegra30-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks: true
> > +  clock-names: true
> > +
> > +  avdd-dsi-csi-supply:
> > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  "#nvidia,mipi-calibrate-cells":
> > +    description:
> > +      The number of cells in a MIPI calibration specifier. Should be 1.
> > +      The single cell specifies an id of the pad that need to be
> > +      calibrated for a given device. Valid pad ids for receiver would =
be
> > +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    const: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: channel 0 represents CSI-A and 1 represents CSI-B
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        maximum: 1
> > +
> > +      nvidia,mipi-calibrate:
> > +        description: Should contain a phandle and a specifier specifyi=
ng
> > +          which pad is used by this CSI channel and needs to be calibr=
ated.
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: port receiving the video stream from the sensor
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: port sending the video stream to the VI
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra20-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +
> > +        clock-names: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra30-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +            - description: PAD A clock
> > +            - description: PAD B clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +            - const: csia-pad
> > +            - const: csib-pad
>=20
> This clocks section seems like it could get simpler. Since the clock
> descriptions are shared, and tegra20 has no clock-names, you could just
> move the detail of the properties out to where you have the ": true"
> stuff (we prefer that properties are defined outside of if/then/else
> blocks) and just restrict them here. For tegra20 that'd be
>=20
> if:
>   properties:
>     compatible:
>       contains:
>         enum:
>           - nvidia,tegra20-csi
> then:
>   properties:
>     clocks:
>       maxItems: 1
>=20
>     clock-names: false
>=20
> (although it could easily be maxItems: 1 ?)
> and for tegra30
>=20
> if:
>   properties:
>     compatible:
>       contains:
>         enum:
>           - nvidia,tegra30-csi
> then:
>   properties:
>     clocks:
>       minItems: 3
>=20
>     clock-names:
>       maxItems: 3
>=20
> Of course you'd then have to add minItems: 1 and maxItems: 3 to the
> extracted definitions.

Oh, also: if you want clock-names to ever actually be usable, you have
to require it. Otherwise a driver must be written to handle it not being
there.

> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +# see nvidia,tegra20-vi.yaml for an example
> > --=20
> > 2.48.1
> >=20



--RwPRYaE9Gdjg3a7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObWJQAKCRB4tDGHoIJi
0rdMAP0bO7fuCRBzgXRuU9adBFwpVmla4J/0SDMk3NczvgKdfQD/XkdtkeingVqx
rtKfHJ5Y7NcgOigGl5g3m0wmDawYkQg=
=/lHa
-----END PGP SIGNATURE-----

--RwPRYaE9Gdjg3a7O--
