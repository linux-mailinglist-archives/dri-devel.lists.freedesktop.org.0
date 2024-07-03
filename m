Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3489264CC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DC110E927;
	Wed,  3 Jul 2024 15:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HwMQQpLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E936D10E927
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:28:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4A986232F;
 Wed,  3 Jul 2024 15:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A65EC3277B;
 Wed,  3 Jul 2024 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720020492;
 bh=lbN1Rxd6zbmlxQD8FA3Af9kMl3WnN9bObpEYgNlWH1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HwMQQpLnV/iubVavqP2ZQ4rRDNoi5/p3nTBbrEGzpkYrjynTarFXUKDXuXpaVjSpm
 3tJAgjuBP0uAJ+4BUK4KP3wL3rbfsPLVKxrOlhWrAYBKID4khDaAU6d8PVEYNBb/Sa
 XUgwOOGi9WRblLF9mvVZfMk35a2TkM3TBeEmF/8adFjeOVAeHWMPMokoARqDYOqIX7
 LdBKc0UkXxbO1rhvccJ5A1rqYY2tTSoqZDxLEksBmm06hkOEvS7J+y2vG5rdqOXHx/
 dJmHFQ98MPMUEVvYTanlAHxlAWwj5OXzanjwbRTxeDiRnfSlHscpAjItmZcdhks80b
 YB13B5mgEw8mg==
Date: Wed, 3 Jul 2024 16:28:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 18/23] dt-bindings: allwinner: add H616 DE33 bus,
 clock and display bindings
Message-ID: <20240703-concerned-geranium-dd89f3f82375@spud>
References: <20240703105454.41254-1-ryan@testtoast.com>
 <20240703105454.41254-19-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+eEIKlajZVU3LPGK"
Content-Disposition: inline
In-Reply-To: <20240703105454.41254-19-ryan@testtoast.com>
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


--+eEIKlajZVU3LPGK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 10:51:08PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>=20
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
>=20
> Add display engine bus, clock and mixer bindings for the DE33.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Probably this should be 3 patches given 3 subsystems, but the content is
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> --
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  .../bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml          | 1 +
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml      | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf65..ea7ee89158c61 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
> =20
>    reg:
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t=
-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83=
t-de2-clk.yaml
> index 70369bd633e40..7fcd55d468d49 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-cl=
k.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-cl=
k.yaml
> @@ -25,6 +25,7 @@ properties:
>        - const: allwinner,sun50i-a64-de2-clk
>        - const: allwinner,sun50i-h5-de2-clk
>        - const: allwinner,sun50i-h6-de3-clk
> +      - const: allwinner,sun50i-h616-de33-clk
>        - items:
>            - const: allwinner,sun8i-r40-de2-clk
>            - const: allwinner,sun8i-h3-de2-clk
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a8=
3t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun=
8i-a83t-de2-mixer.yaml
> index b75c1ec686ad2..c37eb8ae1b8ee 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> @@ -24,6 +24,7 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.2
>=20

--+eEIKlajZVU3LPGK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoVuBgAKCRB4tDGHoIJi
0qhdAQDHZObRLch0IVzBXUmjp8V5/U8ozUtteyspOOEko7TpdwD/dyWf+9gRcTdc
qDi2N9mUVeIxcm8S75vfpCNeXOGDfA4=
=Ay7P
-----END PGP SIGNATURE-----

--+eEIKlajZVU3LPGK--
