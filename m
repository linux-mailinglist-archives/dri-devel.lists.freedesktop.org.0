Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55FAA4A26D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 20:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F56810ECDE;
	Fri, 28 Feb 2025 19:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o92qY2rT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD7910ECDE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 19:07:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D25C6115D;
 Fri, 28 Feb 2025 19:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26D9C4CED6;
 Fri, 28 Feb 2025 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740769662;
 bh=F42vuMZF0te3sC+FWTrmRgS93g6PkTya0sIJ9ITrL98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o92qY2rTY0BjlooX0qfoATkWz+K359ID7Mju2Ifa9XZgHWgYkSz1eVgbb00O4p2EH
 Xw3cawWaoD09ZcFZ8iF50TbUxM81hb9NOCmHIwMR2vmGZluIBJGJm4CT6Z7EmWgWqK
 NPP4dHBRG6so9ZMs3zh5jwHBLZVeIaANl9+eFyBPTtpr8ihqv3VTUw4NB9aqnSTGzg
 +z+f56C/CurfaKxVTXFOGfX6mj8tVDnY4vRlzBpR/GPzlIgn+Iu8T2VnUXMH1X/6sp
 c0T0Q5+pddy9Ulx2760+LzHf6WvGHyUHcMiZjp+qSeNfeDom1OBQ4Fp98p/LC0Iln5
 5HC0W2TinPfQw==
Date: Fri, 28 Feb 2025 19:07:38 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: gpu: v3d: Add SMS to the registers' list
Message-ID: <20250228-living-viewer-b1fc55214b7b@spud>
References: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
 <20250226-v3d-gpu-reset-fixes-v1-4-83a969fdd9c1@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5/v2yBxQRDxn4l+Q"
Content-Disposition: inline
In-Reply-To: <20250226-v3d-gpu-reset-fixes-v1-4-83a969fdd9c1@igalia.com>
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


--5/v2yBxQRDxn4l+Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 04:59:02PM -0300, Ma=EDra Canal wrote:
> V3D 7.1 exposes a new register block, called V3D_SMS. As BCM2712 has a
> V3D 7.1 core, add a new register item to the list. Similar to the GCA
> and bridge register, SMS is optional and should only be added for V3D
> 7.1 variants.
>=20
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Do=
cumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> index dc078ceeca9ac3447ba54a7c8830821f0b2a7f9f..8a3d3fc6065d7756da141bda4=
dc522f63be5e9a1 100644
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -27,14 +27,16 @@ properties:
>        - description: core0 register (required)
>        - description: GCA cache controller register (if GCA controller pr=
esent)
>        - description: bridge register (if no external reset controller)
> +      - description: SMS register (if SMS controller present)
>      minItems: 2
> =20
>    reg-names:
>      items:
>        - const: hub
>        - const: core0
> -      - enum: [ bridge, gca ]
> -      - enum: [ bridge, gca ]
> +      - enum: [ bridge, gca, sms ]
> +      - enum: [ bridge, gca, sms ]
> +      - enum: [ bridge, gca, sms ]
>      minItems: 2

Can you add a per-compatible restriction, to only allow maxItems: 2
when the compatible is not mcb2712 please?

--5/v2yBxQRDxn4l+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IJegAKCRB4tDGHoIJi
0rD/AQDpFB6kgEhVXBwM9SSaXMh6IwtYiE76vY7y2Xo7nMjMtgD+LyBHPyk4Edl3
fscwWQ0NW9LOHeRDPbwqTOh9YDv1ggQ=
=CPgn
-----END PGP SIGNATURE-----

--5/v2yBxQRDxn4l+Q--
