Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE270E2AC
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0569010E0F3;
	Tue, 23 May 2023 17:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7635F10E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:16:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40745634EF;
 Tue, 23 May 2023 17:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4448FC433D2;
 Tue, 23 May 2023 17:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684862181;
 bh=iMe9lBpINyeB8cu57c5B8+Lffy8FHuyk30JlWbMxKYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tnDfjXVHSXOOly0+ajrGW9n/RY66Wlcvrdge09lyrjZ51A2XBUnHCtcoryrddXlNq
 Zy8gGoMymJg/clnm/EqsVA1FU1t6+W5adxz1yeuJfh+jhEZrYMtaf0jDYI/LVoU5P3
 CJWseZQ4nx+PaawmFH7HGrMuFKOnkr/OyuQBefXtd/HV0kyuhYujzmg2aRt9YaRtXN
 4V8rNpkVt6TYvuKD+H6orHiStTuDbUKDefrDhTg3FapovU+X0uDSjstM606s3lzs02
 8K/MjB1B0oXx2cs8qsLxMsWJc6SUS3IO1U0zfEcY/LT/C10V8N9vi3qjM21Ayuz55O
 P8nP2brCrd4FA==
Date: Tue, 23 May 2023 18:16:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: move LVDS data-mapping
 definition to separate file
Message-ID: <20230523-bonus-unreeling-deae67ad7d26@spud>
References: <20230523-simplepanel_support_nondefault_datamapping-v2-0-87196f0d0b64@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v2-1-87196f0d0b64@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="obJa2JPt3Nxbbqgt"
Content-Disposition: inline
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v2-1-87196f0d0b64@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 patchwork-jzi@pengutronix.de, kernel@pengutronix.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--obJa2JPt3Nxbbqgt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 10:19:41AM +0200, Johannes Zink wrote:
> As the LVDS data-mapping property is required in multiple bindings: move
> it to separate file and include instead of duplicating it.
>=20
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
>=20
> ---
>=20
> Changes:
>=20
> v1 -> v2: worked in Rob's review findings (thank you for reviewing my
>           work): extract common properties to
>           file and include it instead of duplicating it
> ---
>  .../bindings/display/lvds-data-mapping.yaml        | 84 ++++++++++++++++=
++++++
>  .../devicetree/bindings/display/lvds.yaml          | 75 +++-------------=
---
>  2 files changed, 92 insertions(+), 67 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/lvds-data-mapping.=
yaml b/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
> new file mode 100644
> index 000000000000..17ef5c9a5a90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/lvds-data-mapping.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LVDS Data Mapping
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |+

Apparently this + is a "chomping indicator", but I have no clue why that
is needed here. You didn't add it though and the movement seems faithful
to me, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. =
Multiple
> +  incompatible data link layers have been used over time to transmit ima=
ge data
> +  to LVDS devices. This bindings supports devices compatible with the fo=
llowing
> +  specifications.
> +
> +  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, Febr=
uary
> +  1999 (Version 1.0), Japan Electronic Industry Development Association =
(JEIDA)
> +  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> +  Semiconductor
> +  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Vid=
eo
> +  Electronics Standards Association (VESA)
> +
> +  Device compatible with those specifications have been marketed under t=
he
> +  FPD-Link and FlatLink brands.
> +
> +properties:
> +  data-mapping:
> +    enum:
> +      - jeida-18
> +      - jeida-24
> +      - vesa-24
> +    description: |
> +      The color signals mapping order.
> +
> +      LVDS data mappings are defined as follows.
> +
> +      - "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [L=
DI] and
> +        [VESA] specifications. Data are transferred as follows on 3 LVDS=
 lanes.
> +
> +      Slot          0       1       2       3       4       5       6
> +                ________________                         _______________=
__
> +      Clock                     \_______________________/
> +                  ______  ______  ______  ______  ______  ______  ______
> +      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__=
><
> +      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__=
><
> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__=
><
> +
> +      - "jeida-24" - 24-bit data mapping compatible with the [DSIM] and =
[LDI]
> +        specifications. Data are transferred as follows on 4 LVDS lanes.
> +
> +      Slot          0       1       2       3       4       5       6
> +                ________________                         _______________=
__
> +      Clock                     \_______________________/
> +                  ______  ______  ______  ______  ______  ______  ______
> +      DATA0     ><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__=
><
> +      DATA1     ><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__=
><
> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__=
><
> +      DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__=
><
> +
> +      - "vesa-24" - 24-bit data mapping compatible with the [VESA] speci=
fication.
> +        Data are transferred as follows on 4 LVDS lanes.
> +
> +      Slot          0       1       2       3       4       5       6
> +                ________________                         _______________=
__
> +      Clock                     \_______________________/
> +                  ______  ______  ______  ______  ______  ______  ______
> +      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__=
><
> +      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__=
><
> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__=
><
> +      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__=
><
> +
> +      Control signals are mapped as follows.
> +
> +      CTL0: HSync
> +      CTL1: VSync
> +      CTL2: Data Enable
> +      CTL3: 0
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/lvds.yaml b/Docume=
ntation/devicetree/bindings/display/lvds.yaml
> index 7cd2ce7e9c33..2200f986c3cf 100644
> --- a/Documentation/devicetree/bindings/display/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/lvds.yaml
> @@ -6,83 +6,24 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: LVDS Display Common Properties
> =20
> +allOf:
> +  - $ref: lvds-data-mapping.yaml#
> +
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>    - Thierry Reding <thierry.reding@gmail.com>
> =20
>  description: |+
> -  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. =
Multiple
> -  incompatible data link layers have been used over time to transmit ima=
ge data
> -  to LVDS devices. This bindings supports devices compatible with the fo=
llowing
> -  specifications.
> -
> -  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, Febr=
uary
> -  1999 (Version 1.0), Japan Electronic Industry Development Association =
(JEIDA)
> -  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> -  Semiconductor
> -  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Vid=
eo
> -  Electronics Standards Association (VESA)
> -
> -  Device compatible with those specifications have been marketed under t=
he
> -  FPD-Link and FlatLink brands.
> +  This binding extends the data mapping defined in lvds-data-mapping.yam=
l.
> +  It supports reversing the bit order on the formats defined there in or=
der
> +  to accomodate for even more specialized data formats, since a variety =
of
> +  data formats and layouts is used to drive LVDS displays.
> =20
>  properties:
> -  data-mapping:
> -    enum:
> -      - jeida-18
> -      - jeida-24
> -      - vesa-24
> -    description: |
> -      The color signals mapping order.
> -
> -      LVDS data mappings are defined as follows.
> -
> -      - "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [L=
DI] and
> -        [VESA] specifications. Data are transferred as follows on 3 LVDS=
 lanes.
> -
> -      Slot          0       1       2       3       4       5       6
> -                ________________                         _______________=
__
> -      Clock                     \_______________________/
> -                  ______  ______  ______  ______  ______  ______  ______
> -      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__=
><
> -      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__=
><
> -      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__=
><
> -
> -      - "jeida-24" - 24-bit data mapping compatible with the [DSIM] and =
[LDI]
> -        specifications. Data are transferred as follows on 4 LVDS lanes.
> -
> -      Slot          0       1       2       3       4       5       6
> -                ________________                         _______________=
__
> -      Clock                     \_______________________/
> -                  ______  ______  ______  ______  ______  ______  ______
> -      DATA0     ><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__=
><
> -      DATA1     ><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__=
><
> -      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__=
><
> -      DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__=
><
> -
> -      - "vesa-24" - 24-bit data mapping compatible with the [VESA] speci=
fication.
> -        Data are transferred as follows on 4 LVDS lanes.
> -
> -      Slot          0       1       2       3       4       5       6
> -                ________________                         _______________=
__
> -      Clock                     \_______________________/
> -                  ______  ______  ______  ______  ______  ______  ______
> -      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__=
><
> -      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__=
><
> -      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__=
><
> -      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__=
><
> -
> -      Control signals are mapped as follows.
> -
> -      CTL0: HSync
> -      CTL1: VSync
> -      CTL2: Data Enable
> -      CTL3: 0
> -
>    data-mirror:
>      type: boolean
>      description:
> -      If set, reverse the bit order described in the data mappings below=
 on all
> +      If set, reverse the bit order described in the data mappings on all
>        data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
> =20
>  additionalProperties: true
>=20
> --=20
> 2.39.2
>=20

--obJa2JPt3Nxbbqgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGz03wAKCRB4tDGHoIJi
0tgnAP9/FO1t8FTNiW76SS0Y1uOTadEtQC5y54WUf1aTk2lfeAEAhVf3ARq1vfHY
qr7v7ByAynDFQnXp8JJOFP1J8QiZIw8=
=D53i
-----END PGP SIGNATURE-----

--obJa2JPt3Nxbbqgt--
