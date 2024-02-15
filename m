Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EAB856A81
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EC010E518;
	Thu, 15 Feb 2024 17:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eDTIumQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E1410E9F9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:06:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D86161DD2;
 Thu, 15 Feb 2024 17:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A6FC433C7;
 Thu, 15 Feb 2024 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708016771;
 bh=KElkYGBiD4v/kDlWoYsOgMzKDGtsKxpQOCFbAZgDAVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eDTIumQmpuZVkJkzWHyYLh0IuxXqavUkd4qjsMqzWFvyYWz4KeoQ+TwHO9smxpUYI
 YIC4RqUQj0sxEFYKk9ygbusIsvORwn6Iu5Yj5Sm9ffDC1bt3whW4vUHSyUlaWKbutR
 l0CM8rWQ3N6I3GITQlC423KdwEoWnVbcDCQCoizqTTqWAXU5o8UUN7Rn63hYNXfv4i
 3iQUBhPGRSj8Om7WGtuLeI9ouBEN+10/CTzy73L/OyERIEWJOfXUZhBg1mVJw+BY24
 NnBy1pVp75czHbx8XEp00QMdjeAXYLp58h1zdpeYo+ZKvysjlueBrIAF4IAssTEYK3
 8CkXtqv+UfKhA==
Date: Thu, 15 Feb 2024 17:06:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quentin.schulz@theobroma-systems.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/3] dt-bindings: display: ltk500hd1829: add variant
 compatible for ltk101b4029w
Message-ID: <20240215-boat-grid-d50f0eccec67@spud>
References: <20240215090515.3513817-1-heiko@sntech.de>
 <20240215090515.3513817-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uAgW2Em0kHJeJUhg"
Content-Disposition: inline
In-Reply-To: <20240215090515.3513817-3-heiko@sntech.de>
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


--uAgW2Em0kHJeJUhg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 10:05:14AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> Add the compatible for the ltk101b4029w panel, that is really similar
> to the ltk500hd1829.

Please mention what makes the devices incompatible. "really similar" is
vague and could be used for a device that was only cosmetically
different.

With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../bindings/display/panel/leadtek,ltk500hd1829.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk5=
00hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk=
500hd1829.yaml
> index c5944b4d636c5..d589f16772145 100644
> --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd182=
9.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd182=
9.yaml
> @@ -14,7 +14,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: leadtek,ltk500hd1829
> +    enum:
> +      - leadtek,ltk101b4029w
> +      - leadtek,ltk500hd1829
>    reg: true
>    backlight: true
>    reset-gpios: true
> --=20
> 2.39.2
>=20

--uAgW2Em0kHJeJUhg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc5EfgAKCRB4tDGHoIJi
0mg8AQDnVMCCNnW/BjpK3m7RSYd2PlygPSQcY9KfMc/u+FOnmAD+JfhDWteO5rdB
4I4vgyPxLWbg0qw+KHEZIn4ucWBjmwY=
=AQS2
-----END PGP SIGNATURE-----

--uAgW2Em0kHJeJUhg--
