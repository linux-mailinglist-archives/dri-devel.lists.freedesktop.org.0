Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686E9571AF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 19:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC9C10E310;
	Mon, 19 Aug 2024 17:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hoZfb1pV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B3310E310
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 17:11:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB887CE0AD0;
 Mon, 19 Aug 2024 17:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECA4C32782;
 Mon, 19 Aug 2024 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724087513;
 bh=yxprBbzXIBreAd4YHR01Nx4Vzjx/xfk6ZsgZ20Vi1C8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hoZfb1pVyS8RNG47epcVVwfA4Z+MrQWiW3ZH9/Bld0xoj7PCXasdTiQrAQjXQNLJH
 0ILEux1Zzhd2il3gVgONY5U+P/VVFNgytAJoaFXVcNpyKwqLUSRflOGjYS87lypn89
 cwLsoC8Ox9/4oQCdakE39SCmI3a8Kflv9JP9xaVBS211aTAb9Kp8YGdVXwP1LACrRz
 sj9xcnfd1Zi91xmDQyj/ICkXSK4yzcx92ZZf5I28DwH7T/P/BNAnQYbpNqCLXxab5j
 Rv1x5v2D/Ob0fPKAkz/EHpYwkCBEDPIHbnuzZMoB2vzDPvBSyEjtQGk7SNokpphG8E
 RESaOJeSN2MQw==
Date: Mon, 19 Aug 2024 18:11:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: display: renesas,du: add top-level
 constraints
Message-ID: <20240819-destiny-sampling-e9bdaa79e128@spud>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
 <20240818173003.122025-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xUU/JYu+XtKbnnug"
Content-Disposition: inline
In-Reply-To: <20240818173003.122025-2-krzysztof.kozlowski@linaro.org>
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


--xUU/JYu+XtKbnnug
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:03PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks, clock-names, interrupts, resets, reset-names, renesas,cmms
> and renesas,vsps.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/display/renesas,du.yaml          | 26 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/=
Documentation/devicetree/bindings/display/renesas,du.yaml
> index 147842b6465a..9a2d1c08cb1f 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -46,12 +46,26 @@ properties:
>      maxItems: 1
> =20
>    # See compatible-specific constraints below.
> -  clocks: true
> -  clock-names: true
> +  clocks:
> +    minItems: 1
> +    maxItems: 8
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 8
> +
>    interrupts:
> +    minItems: 1
> +    maxItems: 4
>      description: Interrupt specifiers, one per DU channel
> -  resets: true
> -  reset-names: true
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 2
> =20
>    power-domains:
>      maxItems: 1
> @@ -77,6 +91,8 @@ properties:
> =20
>    renesas,cmms:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 2
> +    maxItems: 4
>      items:
>        maxItems: 1
>      description:
> @@ -85,6 +101,8 @@ properties:
> =20
>    renesas,vsps:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        items:
>          - description: phandle to VSP instance that serves the DU channel
> --=20
> 2.43.0
>=20

--xUU/JYu+XtKbnnug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN81AAKCRB4tDGHoIJi
0lqzAQDEzNVptamgSWR7ZQT4b0vDeHuVE/bagG1JpSirSojIkgD5AYcRIBIW8BLr
eqgIzbzIMcv8p4Npru/ForYsRWGYWww=
=R730
-----END PGP SIGNATURE-----

--xUU/JYu+XtKbnnug--
