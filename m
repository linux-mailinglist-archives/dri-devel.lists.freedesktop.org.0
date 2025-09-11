Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63951B53AFD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 20:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2962610EB78;
	Thu, 11 Sep 2025 18:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VpEybyKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62C010EB79
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 18:05:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 675514070B;
 Thu, 11 Sep 2025 18:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2304CC4CEF0;
 Thu, 11 Sep 2025 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757613926;
 bh=2KNA9CUisSqGTNs+pjOvgziFv5NqIjtSrtlbLeja3pI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VpEybyKX/63+ZZb6qs2IoyyE4FvNCGP90GL62zJKk7I3msaMsZEF9Je3lm11LNcYl
 3ilH5hwRhfIDQKRuUkuBJl6xw1xfSnqooP1IjChyM/T1GSdJCCbyJjRPHCdrQNcONe
 sHVNKF6evlm9h5qWuTpxJzuU4gl7EkL++4SaavOhrhb2ruTMRu1P4AtSD448tGQ89n
 ZLokA+XygCWCx9uGWyBQgLAPIztYDygimqgwZd8LtJCQg0Zfd+Pf8Jam9ZIOlbYaXO
 kUVUXbfQ68Fpmk1J50JQrriEpRalPtv7ePIJhyA+zlPcTcEGzFIy5G1T1m35yYY7Vs
 kpsxX79osoKpA==
Date: Thu, 11 Sep 2025 19:05:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
Message-ID: <20250911-iron-stadium-ea225e18bc42@spud>
References: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
 <20250911-cpitchen-mainline_gfx2d-v1-1-d7fab1a381ee@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TFmC7SfvXiIlch8N"
Content-Disposition: inline
In-Reply-To: <20250911-cpitchen-mainline_gfx2d-v1-1-d7fab1a381ee@microchip.com>
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


--TFmC7SfvXiIlch8N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 05:26:25PM +0200, Cyrille Pitchen wrote:
> The Microchip GFX2D GPU is embedded in the SAM9X60 and SAM9X7 SoC family.
> Describe how the GFX2D GPU is integrated in these SoCs, including
> register space, interrupt and clock.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> ---
>  .../devicetree/bindings/gpu/microchip,gfx2d.yaml   | 53 ++++++++++++++++=
++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml b=
/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e416e13bc6627a0fef3c70625=
a6a3e2d91636ffc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml

Filename matching a compatible please.

> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/microchip,gfx2d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip GFX2D GPU
> +
> +maintainers:
> +  - Cyrille Pitchen <cyrille.pitchen@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,sam9x60-gfx2d
> +      - microchip,sam9x7-gfx2d
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      const: periph_clk
> +    maxItems: 1

Why do you need clock-names if you only have one clock?
If there's a reason to keep it, drop the _clk - it's redundant.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    gfx2d@f0018000 {

"gfx2d" is not a generic node name, I assume this should actually be
"gpu"?

Cheers,
Conor.

> +      compatible =3D "microchip,sam9x60-gfx2d";
> +      reg =3D <0xf0018000 0x4000>;
> +      interrupts =3D <36 IRQ_TYPE_LEVEL_HIGH 0>;
> +      clocks =3D <&pmc PMC_TYPE_PERIPHERAL 36>;
> +      clock-names =3D "periph_clk";
> +    };
> +
> +...
>=20
> --=20
> 2.48.1
>=20
>=20

--TFmC7SfvXiIlch8N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMMPYAAKCRB4tDGHoIJi
0mCPAQC6UaFapuUKAGnIg8753752/OZNLNqKf7dFbaRi37RaxwEAhSubE7nu3aOl
m3nlEqNOdGn2aVpzZhbXTywzoJ2zugg=
=NuVS
-----END PGP SIGNATURE-----

--TFmC7SfvXiIlch8N--
