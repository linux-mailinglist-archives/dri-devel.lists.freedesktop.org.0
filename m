Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B5C5EB0D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 18:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B9710E255;
	Fri, 14 Nov 2025 17:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hi9ok3fM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D99A10EAEB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 17:58:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C4290440D3;
 Fri, 14 Nov 2025 17:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8BFC4CEF8;
 Fri, 14 Nov 2025 17:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763143109;
 bh=fryoWvsu2Z4WmMYM8YF93BB92SXVEnuFEGvkz9i67Ms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hi9ok3fMokEXLI8JYEdUXRbZmzH7WdEXZfM7P0y5B1ukVYd5a2lFdyk5v8cFTn6Rr
 elUylN1d695TjQDMDKPgsMVUjJQuwqFXM5qVGGBNlRtNHtjFEoAnL9q0n+8mCNFV3B
 LJRrTTKwlqBT+liV5ghPnamEDLvUETwHoZrkUl4E5nT6a5rTl/GW+hd/oDFgBgdl9u
 LQAS77uqP0vzf6USOs/tkpadxunEydge22x+HHZOhnAhsL/PzZ6tFRQyyTODDiDEDx
 34v9SaVpWuc0JOxwXvvJcZBTGNpZw6NV1zQGNnnO9Es4ObJ8siqjWWbjMKmjB3tR8d
 4SqYchh6nKnKQ==
Date: Fri, 14 Nov 2025 17:58:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, aradhya.bhatia@linux.dev,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, praneeth@ti.com,
 h-shenoy@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 1/3] dt-bindings: display: ti,am65x-dss: Add am62p dss
 compatible
Message-ID: <20251114-vanilla-pork-f3854bd230f2@spud>
References: <20251114064336.3683731-1-s-jain1@ti.com>
 <20251114064336.3683731-2-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AyuVjMkIZAGzT1i/"
Content-Disposition: inline
In-Reply-To: <20251114064336.3683731-2-s-jain1@ti.com>
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


--AyuVjMkIZAGzT1i/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 12:13:34PM +0530, Swamil Jain wrote:
> TI's AM62P SoC contains two instances of the TI Keystone Display
> SubSystem (DSS), each with two video ports and two video planes. These
> instances support up to three independent video streams through OLDI,
> DPI, and DSI interfaces.
>=20
> DSS0 (first instance) supports:
>  - Two OLDI transmitters on video port 1, configurable in dual-link or
>    single-link mode.
>  - DPI output on video port 2.
>=20
> DSS1 (second instance) supports:
>  - One OLDI transmitter on video port 1 (single-link mode only).
>  - DSI controller output on video port 2.
>=20
> The two OLDI transmitters can be configured in clone mode to drive a
> pair of identical OLDI single-link displays. DPI outputs from
> DSS0 VP2, DSS1 VP1, and DSS1 VP2 are multiplexed, allowing only one
> DPI output at a time.
>=20
> Add the compatible string "ti,am62p-dss" and update related
> description accordingly.
>=20
> AM62P has different power domains for DSS and OLDI compared to other
> Keystone SoCs. Therefore, add 'minItems' and set to 1 and update the
> 'maxItems' field in the power-domains property to 3 for the
> "ti,am62p-dss" compatible entry to reflect this hardware difference.
>=20
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 127 +++++++++++++++++-
>  1 file changed, 126 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 361e9cae6896..8bd188e7f09b 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -24,6 +24,19 @@ description: |
>    DPI signals are also routed internally to DSI Tx controller present wi=
thin the
>    SoC. Due to clocking limitations only one of the interface i.e. either=
 DSI or
>    DPI can be used at once.
> +  The AM62P has two instances of TI Keystone Display SubSystem, each wit=
h two
> +  video ports and two video planes. These instances can support up to 3
> +  independent video streams through OLDI, DPI, and DSI interfaces.
> +  DSS0 (first instance) supports:
> +    - Two OLDI TXes on video port 1, configurable in dual-link or
> +      single link clone mode
> +    - DPI output on video port 2
> +  DSS1 (second instance) supports:
> +    - One OLDI TX on video port 1 (single-link mode only)
> +    - DSI controller output on video port 2
> +  The two OLDI TXes can be configured in clone mode to drive a pair of
> +  identical OLDI single-link displays. DPI outputs from DSS0 VP2, DSS1 V=
P1,
> +  and DSS1 VP2 are muxed, allowing only one DPI output at a time.
> =20
>  properties:
>    compatible:
> @@ -31,6 +44,7 @@ properties:
>        - ti,am625-dss
>        - ti,am62a7-dss
>        - ti,am62l-dss
> +      - ti,am62p-dss
>        - ti,am65x-dss
> =20
>    reg:
> @@ -81,7 +95,8 @@ properties:
>      maxItems: 1
> =20
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
>      description: phandle to the associated power domain
> =20
>    dma-coherent:
> @@ -347,3 +362,113 @@ examples:

I don't think you need a new 15 line example to add 2 power domains when
everything else remains the same.

Please also restrict the power domains by compatible. I'm not sure
reading this binding if the new device can function with 1 power domain,
but your binding permits that as well as not being clear that other
devices only need one.

pw-bot: changes-requested

Cheers,
Conor.

>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +    dss0: dss@30200000 {
> +        compatible =3D "ti,am62p-dss";
> +        reg =3D <0x30200000 0x1000>, /* common */
> +              <0x30202000 0x1000>, /* vidl1 */
> +              <0x30206000 0x1000>, /* vid */
> +              <0x30207000 0x1000>, /* ovr1 */
> +              <0x30208000 0x1000>, /* ovr2 */
> +              <0x3020a000 0x1000>, /* vp1: Used for OLDI */
> +              <0x3020b000 0x1000>, /* vp2: Used as DPI Out */
> +              <0x30201000 0x1000>; /* common1 */
> +        reg-names =3D "common", "vidl1", "vid",
> +                    "ovr1", "ovr2", "vp1", "vp2", "common1";
> +        power-domains =3D <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>,
> +                        <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>,
> +                        <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>;
> +        clocks =3D <&k3_clks 186 6>,
> +                 <&dss0_vp1_clk>,
> +                 <&k3_clks 186 2>;
> +        clock-names =3D "fck", "vp1", "vp2";
> +        interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        oldi-transmitters {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            oldi0_am62p: oldi@0 {
> +                reg =3D <0>;
> +                clocks =3D <&k3_clks 186 0>;
> +                clock-names =3D "serial";
> +                ti,oldi-io-ctrl =3D <&dss_oldi_io_ctrl>;
> +
> +                ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                        reg =3D <0>;
> +                        oldi0_am62p_in: endpoint {
> +                            remote-endpoint =3D <&dpi0_am62p_out0>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg =3D <1>;
> +                        oldi0_am62p_out: endpoint {
> +                            remote-endpoint =3D <&panel0_in>;
> +                        };
> +                    };
> +                };
> +            };
> +
> +            oldi1_am62p: oldi@1 {
> +                reg =3D <1>;
> +                clocks =3D <&k3_clks 186 0>;
> +                clock-names =3D "serial";
> +                ti,oldi-io-ctrl =3D <&dss_oldi_io_ctrl>;
> +
> +                ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                        reg =3D <0>;
> +                        oldi1_am62p_in: endpoint {
> +                            remote-endpoint =3D <&dpi0_am62p_out1>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg =3D <1>;
> +                        oldi1_am62p_out: endpoint {
> +                            remote-endpoint =3D <&panel1_in>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                reg =3D <0>;
> +                dpi0_am62p_out0: endpoint@0 {
> +                    reg =3D <0>;
> +                    remote-endpoint =3D <&oldi0_am62p_in>;
> +                };
> +                dpi0_am62p_out1: endpoint@1 {
> +                    reg =3D <1>;
> +                    remote-endpoint =3D <&oldi1_am62p_in>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                dpi1_am62p_out: endpoint {
> +                    remote-endpoint =3D <&dpi_bridge>;
> +                };
> +            };
> +        };
> +    };

--AyuVjMkIZAGzT1i/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRdtvwAKCRB4tDGHoIJi
0ttbAQC16MyMUkfdNqx+a9H2XVlR2u59K8BxBrCj5RXPqKZEkwD/S8ZZpItCJ9cy
riqB1RfQ5J8rs35JfXdDY5nmgNWA3wo=
=kFjl
-----END PGP SIGNATURE-----

--AyuVjMkIZAGzT1i/--
