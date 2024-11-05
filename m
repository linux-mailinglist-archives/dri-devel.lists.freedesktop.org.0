Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFBB9BD465
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC88710E5F9;
	Tue,  5 Nov 2024 18:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WHgQ8Ljq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153BF10E5F9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:16:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B22215C53DF;
 Tue,  5 Nov 2024 18:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BA4C4CECF;
 Tue,  5 Nov 2024 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730830602;
 bh=gxbmixww9e8I54+a85Lk0u6Qwx29iopkn1bwWVNFU5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHgQ8LjqxMiYEcG4CIthiY+qyb8BJdbl9bqOF8Vdv1Giz2jL4Qm+VprGqVquRtP11
 csBm24NGhMOP9JX4x7Dm7bLaabuorAtEVqVAXySPJ2TTvMAtgvgaodmQA82oUpllaB
 wuIZbJuGQcYZoEXft7YQ2osOP+9l9i4gK49e+YHxH+iYuBvEBNSYIhaAbKGLuF47Ti
 SwkXgjjDYM64f5w1DsnZjNE/5Z5QAZ5kQRpPDinJ5HglGx9bPZgv/WZPR0ggoAPAJe
 2Na7tgqYoQRtHFwnL1zdfmLBedKBXJi//RPvNNJNkbej5IWHuxpgZeXlfITLKBf1Ow
 UgehZeMzcKlkw==
Date: Tue, 5 Nov 2024 18:16:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 02/21] dt-bindings: gpu: img: Further constrain clocks
Message-ID: <20241105-blooper-unflawed-6181022944d9@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TeFaw0Jl+M7/bDvg"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com>
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


--TeFaw0Jl+M7/bDvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:08PM +0000, Matt Coster wrote:
> All Imagination GPUs use three clocks: core, mem and sys. All reasonably
> modern Imagination GPUs also support a single-clock mode where the SoC
> only hooks up core and the other two are derived internally. On GPUs which
> support this mode, it is the default and most commonly used integration.
>=20
> Codify this "1 or 3" constraint in our bindings and hang the specifics off
> the vendor compatible string to mirror the integration-time choice.
>=20
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 27 +++++++++++++++-=
------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index ef7070daf213277d0190fe319e202fdc597337d4..6924831d3e9dd9b2b052ca8f9=
d7228ff25526532 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -30,15 +30,20 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    minItems: 1
> -    maxItems: 3
> +    oneOf:
> +      - minItems: 1
> +        maxItems: 1
> +      - minItems: 3
> +        maxItems: 3

Just put the outer constraints here and...

>    clock-names:
> -    items:
> -      - const: core
> -      - const: mem
> -      - const: sys
> -    minItems: 1
> +    oneOf:
> +      - items:
> +          - const: core
> +      - items:
> +          - const: core
> +          - const: mem
> +          - const: sys
> =20
>    interrupts:
>      maxItems: 1
> @@ -56,15 +61,21 @@ required:
>  additionalProperties: false
> =20
>  allOf:
> +  # Vendor integrations using a single clock domain
>    - if:
>        properties:
>          compatible:
>            contains:
> -            const: ti,am62-gpu
> +            anyOf:
> +              - const: ti,am62-gpu
>      then:
>        properties:
>          clocks:
> +          minItems: 1
>            maxItems: 1

=2E..adjust the constraints in conditional bits. Setting minItems to 1
should be a nop too. Pretty sure what you already had here was actually
already sufficient.

Cheers,
Conor.

> +        clock-names:
> +          items:
> +            - const: core
> =20
>  examples:
>    - |
>=20
> --=20
> 2.47.0
>=20

--TeFaw0Jl+M7/bDvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyphBAAKCRB4tDGHoIJi
0mt+AQCX5TGxUHLmqloLO4UQ2/Z5nICBf/HCL/Q8rZcVfo8ebAEAlFYu7OnzNesz
ZWwQOmVqab0lEHWZg2h1BTjxEg+tFwA=
=fITo
-----END PGP SIGNATURE-----

--TeFaw0Jl+M7/bDvg--
