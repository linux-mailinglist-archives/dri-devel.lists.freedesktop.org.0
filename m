Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7D913395
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 13:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6962710E05F;
	Sat, 22 Jun 2024 11:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nr97E3is";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2210510E05F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 11:56:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9E57BCE06B2;
 Sat, 22 Jun 2024 11:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59034C3277B;
 Sat, 22 Jun 2024 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719057369;
 bh=bEzn6fXDFwVpMlYuR07RzmqbdZcLx51KhVBOIz45SmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nr97E3isvn0cQYtepeO0r+f6dJYJQ/ba8/5xu8lrvb0Mh/PVl5930Km6YAkEmRTju
 nSce5/u9G36ZsueZhXZrOWTEKT1Gwhzjjw/T5QVcw6vbG8h6Y2dItc7EQ75NkTgBFu
 uU57zUgxqVboQ7qDQeDppU4kf8UECX596bz9D95vBsJJDbb9npxSFNNZCEF+ObJAvn
 MLW5pn8YmAFwIRUEdwLKfidQOwSEjpNaLo7KOSgIB3iXFf2kjt976rj5b046w4aCaf
 qtbeAoSCtM5hDRRWyzOOPqtiyzOFG9wK78Xgwehf5LLsJItjFwNsS1RNND+yAJ4j68
 Zcnzw+1wIjl4w==
Date: Sat, 22 Jun 2024 12:56:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
Message-ID: <20240622-ruse-stock-2c2b8d0b1cfb@spud>
References: <20240621155430.92894-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/FRKGiZx/KRqGQiy"
Content-Disposition: inline
In-Reply-To: <20240621155430.92894-1-marex@denx.de>
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


--/FRKGiZx/KRqGQiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 05:53:53PM +0200, Marek Vasut wrote:
> Document default DP port preemphasis configurable via new DT property
> "toshiba,pre-emphasis". This is useful in case the DP link properties
> are known and starting link training from preemphasis setting of 0 dB
> is not useful. The preemphasis can be set separately for both DP lanes
> in range 0=3D0dB, 1=3D3.5dB, 2=3D6dB .
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
> V2: - Fix the type to u8 array
>     - Fix the enum items to match what they represent
> ---
>  .../display/bridge/toshiba,tc358767.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc3=
58767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358=
767.yaml
> index 2ad0cd6dd49e0..6287eb2b40908 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.y=
aml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.y=
aml
> @@ -98,6 +98,24 @@ properties:
>              reference to a valid eDP panel input endpoint node. This por=
t is
>              optional, treated as DP panel if not defined
> =20
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              toshiba,pre-emphasis:
> +                description:
> +                  Display port output Pre-Emphasis settings for both por=
ts.

Why here and not in the port nodes?

> +                $ref: /schemas/types.yaml#/definitions/uint8-array
> +                minItems: 2
> +                maxItems: 2
> +                items:
> +                  enum:
> +                    - 0 # No pre-emphasis
> +                    - 1 # 3.5dB pre-emphasis
> +                    - 2 # 6dB pre-emphasis

I'd love to say please make this -bB and put this in units, but that'd
require it being a string..

> +
>      oneOf:
>        - required:
>            - port@0
> --=20
> 2.43.0
>=20

--/FRKGiZx/KRqGQiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZna71AAKCRB4tDGHoIJi
0oJAAP4yg+nH4MWPdvQx0vJQmZn2zlDtCFpSbj5+o33nzQg34gD/Vpq3YZxMx1EL
IAzii8Zj6FJ9jfSX4aA5lmrRQskXSgs=
=HVgL
-----END PGP SIGNATURE-----

--/FRKGiZx/KRqGQiy--
