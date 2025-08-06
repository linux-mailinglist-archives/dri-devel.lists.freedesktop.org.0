Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA66B1CA98
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 19:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF7310E294;
	Wed,  6 Aug 2025 17:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AOfxbTAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FA210E294
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 17:22:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8ED5B452A5;
 Wed,  6 Aug 2025 17:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BBAC4CEE7;
 Wed,  6 Aug 2025 17:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754500957;
 bh=gYQ6c5dWzSfZxOgWBka1UO6gIcE9AQVGbQWooNNv3Tk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AOfxbTAoG2YGp6j2BENEn/arpS/1dP3KamEWAaZ9w9o1+QUovQpw5cH9gP2szJyEC
 xaMchNgDrWERluE/3baEOdMVQ97LmGXriveDnYcuQ2i/Bx1i94+vdWJwBR+c6cuEoH
 CcX3YwvUswegmddUexuX95AZ0ZFvEIt3mrqiED2s8tQCO//Awhduj3DY66QDYQhcI8
 fcTJpcLYA4iTzdH8m+e7rRDMy23wYd8V4et746RjY86oLnf8/KuQL5B/YwJ/Mf8K8O
 eDIDkh0dG0ORioC3q4g0n9Gie5Pga5szbxWPiALr0I8XPeQbxfw6cyJXWftrnoVf0u
 r61ssjfJxLdtA==
Date: Wed, 6 Aug 2025 18:22:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: display: sitronix,st7920: Add DT schema
Message-ID: <20250806-contend-retread-066519296adc@spud>
References: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
 <20250806-st7920-v1-2-64ab5a34f9a0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1LYms6pz+HKcRlUi"
Content-Disposition: inline
In-Reply-To: <20250806-st7920-v1-2-64ab5a34f9a0@gmail.com>
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


--1LYms6pz+HKcRlUi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 02:48:10PM +0200, Iker Pedrosa wrote:
> Add binding for Sitronix ST7920 display.
>=20
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  .../bindings/display/sitronix,st7920.yaml          | 55 ++++++++++++++++=
++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7920.ya=
ml b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..caee85f98c6d242dfab737292=
10f8c34b23a3a99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sitronix,st7920.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST7920 LCD Display Controllers
> +
> +maintainers:
> +  - Iker Pedrosa <ikerpedrosam@gmail.com>
> +
> +description: |
> +  The Sitronix ST7920 is a controller for monochrome dot-matrix graphica=
l LCDs,
> +  most commonly used for 128x64 pixel displays.
> +  This binding supports connecting the display via a standard SPI bus.
> +
> +properties:
> +  compatible:
> +    const: sitronix,st7920
> +
> +  reg:
> +    description: The chip-select number for the device on the SPI bus.
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    description: Maximum SPI clock frequency in Hz.
> +    maximum: 600000
> +
> +  spi-cs-high:
> +    type: boolean
> +    description: Indicates the chip select is active high.

Don't redefine this, it's defined in spi-peripheral-props.yaml:
  spi-cs-high:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      The device requires the chip select active high.

spi-max-frequency's type comes from there, so you need it for that too.


> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-max-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Example: ST7920 connected to an SPI bus
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        display@0 {
> +            compatible =3D "sitronix,st7920";
> +            reg =3D <0>; // Chip select 0
> +            spi-max-frequency =3D <600000>;
> +            spi-cs-high;
> +        };
> +    };
>=20
> --=20
> 2.50.1
>=20

--1LYms6pz+HKcRlUi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJOPWAAKCRB4tDGHoIJi
0sA6AQCF0ossiP7vgh/45UnUA5I1avEKhd0F7ScxlmG+sn0wpwD+NHhKInkH4WMh
+ZgnvS3mmW0e0vj6/+mphoI7Nt9GyQQ=
=d4yO
-----END PGP SIGNATURE-----

--1LYms6pz+HKcRlUi--
