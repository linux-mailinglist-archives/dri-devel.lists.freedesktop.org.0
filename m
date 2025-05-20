Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80DABDFBB
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8268810E53A;
	Tue, 20 May 2025 15:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SJ/x9hss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B409D10E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 15:58:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89876451BA;
 Tue, 20 May 2025 15:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EF7C4CEE9;
 Tue, 20 May 2025 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747756698;
 bh=0D6zpd/zMzHiZpO1VEpRkuO+fz8DrletF6eKHu5EFbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJ/x9hss3iK6HAmaYJ8dQZk9o8tGYAv2XZi3YGclAF7BQ/+nf/8KswyBtYsqhazGh
 X3a5FvYaQ37fg8xB81gyNVyFDMOkU3pSbxBm4Z9WiUyBfEvpQ+aTt34Y0zmYBLsSXv
 L1vfrqIbx9/H3E6abcnhYQkEMIoqxMjoLF7WyIgKOsZrMmRDYUjfk5RuGEa0vD79d8
 5SgNNfRJPXLyD7SLaxv191o/YbSSB8i0pLXh56CoV1iB5NDYss0W0zm3ERAIJCUJss
 ld80Ix/y7BkcNmvZArTATby2CCC6xgrwQu1H07zfPon91V4jtpMz7Uj9GLgmyyff96
 Nw3CMA9f0XwNA==
Date: Tue, 20 May 2025 16:58:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Message-ID: <20250520-fidelity-mooned-5d4262d0a7ef@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GxY0N8ktK80Cp8Ls"
Content-Disposition: inline
In-Reply-To: <20250520151112.3278569-1-hugo@hugovil.com>
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


--GxY0N8ktK80Cp8Ls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Allow to inherit valid properties from the dsi-controller. This fixes the
> following warning when adding a panel property:
>=20
> rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do n=
ot
>     match any of the regexes: 'pinctrl-[0-9]+'
>     from schema $id:
>         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
>=20
> Also add a panel property to the example.

I don't think adding the example should be in the same patch as a fix.

>=20
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
> V1 -> V2: add separate example
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi=
=2Eyaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> index e08c24633926b..5a99d9b9635e7 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -128,7 +128,7 @@ required:
>    - power-domains
>    - ports
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> =20
>  examples:
>    - |
> @@ -180,4 +180,69 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi1: dsi@10860000 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        compatible =3D "renesas,r9a07g044-mipi-dsi", "renesas,rzg2l-mipi=
-dsi";
> +        reg =3D <0x10860000 0x20000>;
> +        interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "seq0", "seq1", "vin1", "rcv",
> +                          "ferr", "ppi", "debug";
> +        clocks =3D <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
> +        clock-names =3D "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpc=
lk";
> +        resets =3D <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
> +                 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
> +                 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
> +        reset-names =3D "rst", "arst", "prst";
> +        power-domains =3D <&cpg>;
> +
> +        panel@0 {
> +            compatible =3D "rocktech,jh057n00900";
> +            reg =3D <0>;
> +            vcc-supply =3D <&reg_2v8_p>;
> +            iovcc-supply =3D <&reg_1v8_p>;
> +            reset-gpios =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint =3D <&dsi1_out>;
> +                };
> +            };
> +        };
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                dsi1_in: endpoint {
> +                    remote-endpoint =3D <&du_out_dsi1>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                dsi1_out: endpoint {
> +                    data-lanes =3D <1 2 3 4>;
> +                    remote-endpoint =3D <&panel_in>;
> +                };
> +            };
> +        };
> +    };
>  ...
>=20
> base-commit: 7c1a9408ce5f34ded5a85db81cf80e0975901685
> --=20
> 2.39.5
>=20

--GxY0N8ktK80Cp8Ls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCymkwAKCRB4tDGHoIJi
0sApAQC8C/iRVYSgNm1itU05EvPEZEBVdY6DI1FcKhilDUvTFAEAnxUxyctg9XlE
00HssAo8Fj0oCaqOMW36C/MmRTePOQU=
=FozJ
-----END PGP SIGNATURE-----

--GxY0N8ktK80Cp8Ls--
