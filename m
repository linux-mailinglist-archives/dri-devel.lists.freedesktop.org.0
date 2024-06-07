Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE6900658
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 16:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3223F10EC73;
	Fri,  7 Jun 2024 14:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LQHpk2ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E0310EC73
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 14:23:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9D5C61F2E;
 Fri,  7 Jun 2024 14:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B01EC4AF07;
 Fri,  7 Jun 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717770211;
 bh=ISZhaErqzXGSDPIQLgclkeDjexf3+x7GOhhQxdcSvZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LQHpk2yenbmSJVf+xC5mxgAibeTuocZmLaqi+6teZQSCOr7uEs1N0HDXbc3daQWYm
 Vo3e0nftuS17WPYWNxtY1goc9Ap4lqIQ8ngIUlma/43FV/n+e89s5+xdyZzzu8JSnx
 obKV/VNZXi3gWOOuT79Bm9RG9irlZ0SsaExzsiI6ZIUAhlFoiXv0xQHWc8WLARiEbH
 AsFrTpwciW9PYaeTRTIiJ1UdennYmJXZ9j7jPde4GU46lHcOzpsx87ONUaQJCqT4Kl
 Cyg3rBOZVpCBLZMJOwB0WdZpOYpz3g0eYX0FE3B66mDDjSXXDMGIHUFduzLsnTAM3T
 rXuNfOmA6Zjzg==
Date: Fri, 7 Jun 2024 15:23:25 +0100
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
Subject: Re: [PATCH RFC 1/8] dt-bindings: bus: allwinner: add H616 DE33
 bindings
Message-ID: <20240607-gag-radiantly-37bc3ac76907@spud>
References: <20240607110227.49848-1-ryan@testtoast.com>
 <20240607110227.49848-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hvIN4zzpl43t4aeA"
Content-Disposition: inline
In-Reply-To: <20240607110227.49848-2-ryan@testtoast.com>
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


--hvIN4zzpl43t4aeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 10:59:57PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>=20
> Add display engine bus, clock and mixer bindings for the DE33.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml        | 1 +
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf65..65f4522e79879 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -25,6 +25,7 @@ properties:
>        - const: allwinner,sun50i-a64-de2
>        - items:
>            - const: allwinner,sun50i-h6-de3
> +          - const: allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2

This does not do what you think it does!
It needs to be
items:
  - enum:
      - h6
      - h616
  - const: a64

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

I think this is not right, as a corresponding driver change is missing.
Either you're missing a clock driver patch or you didn't test your dts.
Given the bus binding, I suspect that latter.

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

Your commit message should mention why a fallback is not suitable here.

Thanks,
Conor.

--hvIN4zzpl43t4aeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmMX3QAKCRB4tDGHoIJi
0jvaAQCS4w+ejgohzk9HZfC+mevGnd9ZrQLeHGv0X+xpA4ajowD/c4hDLZx9DGwS
aNy6loBF77ZiI11DguS/w5aI1g56ig4=
=xUMf
-----END PGP SIGNATURE-----

--hvIN4zzpl43t4aeA--
