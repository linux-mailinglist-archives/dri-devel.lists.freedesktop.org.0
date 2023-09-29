Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F140C7B35FE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 16:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D05A10E065;
	Fri, 29 Sep 2023 14:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2305F10E065
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 14:47:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 21BF6CE249B;
 Fri, 29 Sep 2023 14:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13711C433C8;
 Fri, 29 Sep 2023 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695998854;
 bh=Zsc0ozzmruut0k5IrakLREwaGxD6O+/5m5ivceEo3qY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R9t+ASYXVc2M4MUN9IyaQ52WUcktw5QrtlYarATXNevvslH1FqBVT9dSLixjLX9vf
 CGk1ckw3mLXm7OZfizqnFSM9ZMHyqp7U8SOYPoCQRHON7Z4vyBt3cxC/k5W5l57d+s
 QYvgH4tLjZGfsqVIOImwplwSz1w6xcYVSrq8BwTWpRHm9FaeYyWQEUQhLZUYTIToZy
 xvOukPvsToCHLVpkrMdhh8dCQ8A4BcnvqHGA8HOpDa04OCrZ4l4cp8uIbxUBMXTeI3
 Yi/Jqxdg3hV72Twj8KfHhnZbV/OLPJJVv3efsaEeFlm4fO0b8gzIqWg+4cN1bRFDW5
 yvDAh+QycImBg==
Date: Fri, 29 Sep 2023 15:47:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI PVI
Message-ID: <20230929-divisible-recreate-c7631ac0c3fb@spud>
References: <20230928125536.1782715-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T02JhtT8tTCvrF+h"
Content-Disposition: inline
In-Reply-To: <20230928125536.1782715-1-l.stach@pengutronix.de>
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
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 patchwork-lst@pengutronix.de, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--T02JhtT8tTCvrF+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 02:55:35PM +0200, Lucas Stach wrote:
> Add binding for the i.MX8MP HDMI parallel video interface block.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
8mp-hdmi-pvi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdm=
i-pvi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-=
pvi.yaml
> new file mode 100644
> index 000000000000..df29006b4090
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.y=
aml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pvi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Video Interface
> +
> +maintainers:
> +  - Lucas Stach <l.stach@pengutronix.de>
> +
> +description: |

This | is not needed as there's no formatting here requiring
preservation.

Otherwise, looks grand to me. You can fix that up if you resend I guess.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +  The HDMI parallel video interface is a timing and sync generator block=
 in the
> +  i.MX8MP SoC, that sits between the video source and the HDMI TX contro=
ller.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-hdmi-pvi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input from the LCDIF controller.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the HDMI TX controller.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    display-bridge@32fc4000 {
> +        compatible =3D "fsl,imx8mp-hdmi-pvi";
> +        reg =3D <0x32fc4000 0x40>;
> +        interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH>;
> +        power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                pvi_from_lcdif3: endpoint {
> +                    remote-endpoint =3D <&lcdif3_to_pvi>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                pvi_to_hdmi_tx: endpoint {
> +                    remote-endpoint =3D <&hdmi_tx_from_pvi>;
> +                };
> +            };
> +        };
> +    };
> --=20
> 2.39.2
>=20

--T02JhtT8tTCvrF+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRbjgAAKCRB4tDGHoIJi
0gXBAPwPBDaiYDc8hq6tp4XOeUkvQNTen/BbQbLeJBcno8mVuwEAp+63lm+uYdjb
3TDKFinQCoyicCVhekpei48NJJ0+NQ8=
=jfJp
-----END PGP SIGNATURE-----

--T02JhtT8tTCvrF+h--
