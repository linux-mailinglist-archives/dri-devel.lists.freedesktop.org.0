Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B26724D21
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 21:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8068210E39B;
	Tue,  6 Jun 2023 19:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD9A10E39B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 19:34:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 032D162CC6;
 Tue,  6 Jun 2023 19:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09098C433EF;
 Tue,  6 Jun 2023 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686080065;
 bh=8EDy4g29/S1znokLB5vVfHAJxVY5fZMjbfEqX1hXCIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXH3zcoAlzdEziIvREJLGbqv7b0siwY2St8YFPs48fjOXSXcK/FnTSFRFTlyeU8Yi
 6mPDJCVuQCxAmGGEeCZlzdjtesngxFnNr0AWr0gKp0T2wzYv/4b+flPcAyI10v/WrE
 l2gy7ny0qQcEIgCCetF8OKjh+N2unGy3czLwoqkbjO7ux3Bp+tMyrzbV2OVpL8iYzB
 YiV6NWZ4xg1NFF51JvAj3pE8H/jFbuqZG0i3GmE9oVnhJDXTDNQJKYEdHUa5r2pB6j
 F6rF5yauHE052wUtg25MKOPsYupflVncVdn3aB2A2FQ4f3A1FpiM4eiZobdjdI4K+i
 qjO6oNuxqL6Vg==
Date: Tue, 6 Jun 2023 20:34:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20230606-value-backfire-31e3ebf79071@spud>
References: <20230605062217.3716328-1-victor.liu@nxp.com>
 <20230605062217.3716328-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7YMIkTsAzSlnN58N"
Content-Disposition: inline
In-Reply-To: <20230605062217.3716328-2-victor.liu@nxp.com>
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
Cc: peng.fan@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, marex@denx.de, rfoss@kernel.org,
 jernej.skrabec@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7YMIkTsAzSlnN58N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 02:22:16PM +0800, Liu Ying wrote:
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.

The previous issues seem to be resolved & what you've got here looks
fine to me. Perhaps Krzysztof will disagree!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Newly introduced to replace the standalone dt-binding in v1 and v2. (Ro=
b)
>=20
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-bl=
k-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk=
-ctrl.yaml
> index b3554e7f9e76..3f550c30d93d 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.=
yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.=
yaml
> @@ -24,6 +24,12 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    '#power-domain-cells':
>      const: 1
> =20
> @@ -46,9 +52,43 @@ properties:
>        - const: csi
>        - const: dsi
> =20
> +  bridge@60:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: nxp,imx93-pdfc
> +
> +      reg:
> +        maxItems: 1
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Input port node to receive pixel data.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Output port node to downstream pixel data recei=
vers.
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - ports
> +
>  required:
>    - compatible
>    - reg
> +  - '#address-cells'
> +  - '#size-cells'
>    - power-domains
>    - clocks
>    - clock-names
> @@ -76,5 +116,33 @@ examples:
>                 <&clk IMX93_CLK_MIPI_DSI_GATE>;
>                 clock-names =3D "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
> +      #address-cells =3D <1>;
> +      #size-cells =3D <1>;
>        #power-domain-cells =3D <1>;
> +
> +      bridge@60 {
> +        compatible =3D "nxp,imx93-pdfc";
> +        reg =3D <0x60 0x4>;
> +
> +        ports {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          port@0 {
> +            reg =3D <0>;
> +
> +            pdfc_from_lcdif: endpoint {
> +              remote-endpoint =3D <&lcdif_to_pdfc>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg =3D <1>;
> +
> +            pdfc_to_panel: endpoint {
> +              remote-endpoint =3D <&panel_from_pdfc>;
> +            };
> +          };
> +        };
> +      };
>      };
> --=20
> 2.37.1
>=20

--7YMIkTsAzSlnN58N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH+KOgAKCRB4tDGHoIJi
0qTUAQCAIwEDBspj50xb8vJZ/cAzeXcU63walAvS9ME3SUbkpQD/QTiKL9oMyANI
GF2+4FaL98JVFt3B1Mh/fCmqgsboigg=
=Jctj
-----END PGP SIGNATURE-----

--7YMIkTsAzSlnN58N--
