Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620E9BD415
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C3F10E5F1;
	Tue,  5 Nov 2024 18:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JXPa2yZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C005310E605
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:06:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EB816A437D5;
 Tue,  5 Nov 2024 18:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C10C4CED1;
 Tue,  5 Nov 2024 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730829959;
 bh=FA8YasXCkWty96pqWC0zbLicpOpd5y8Au/gsIejDV2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JXPa2yZbl/YzFD6fN4IXrDTqd8EwkmHkksEM8AHSCKJIe5fBIMXKc59E24o2vevU7
 F2Ky3cwcsfqyKhbJRbeLpmreL3FYIzP/Cnrs4yI1gZbOXE/WJHbsF8l1nToXJ16qi5
 ax6x+yTZg+dbK7mXDVBLqVgy582W8oySuJApcK9ugfntggedBUYWjYAnwv9g3yRB6r
 pOsFUKhR+L7C1qeJdHFtJitcQu3U/Jrvy71zMhrEWSU+t6AmJoPsLuPFWz3OQiOZ2a
 2KSA5SPrmgJiJCoLNrQbyg4TvEzEJqUaF/HLw9xgNi2IhIsBCPDDFADHvp0kuIhkSd
 FXPH0XThYaJgg==
Date: Tue, 5 Nov 2024 18:05:54 +0000
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
Subject: Re: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
Message-ID: <20241105-disarm-baggie-e2563299a24f@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RoFUdNR+eVTM1NxM"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
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


--RoFUdNR+eVTM1NxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:09PM +0000, Matt Coster wrote:
> The single existing GPU (AXE-1-16M) only requires a single power domain.
> Subsequent patches will add support for BXS-4-64 MC1, which has two power
> domains. Add infrastructure now to allow for this.
>=20
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 ++++++++++++++++=
+++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 6924831d3e9dd9b2b052ca8f9d7228ff25526532..55f422be1bc5b7564e3e81f24=
c4b93857f3e12fe 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -49,7 +49,16 @@ properties:
>      maxItems: 1
> =20
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domain-names:
> +    oneOf:
> +      - items:
> +          - const: a
> +      - items:
> +          - const: a
> +          - const: b
> =20
>  required:
>    - compatible
> @@ -57,10 +66,27 @@ required:
>    - clocks
>    - clock-names
>    - interrupts
> +  - power-domains
> +  - power-domain-names

A new required property is an ABI break. Please explain why this is
acceptable in your commit message.

> =20
>  additionalProperties: false
> =20
>  allOf:
> +  # Cores with a single power domain
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: img,img-axe-1-16m
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 1
> +          maxItems: 1
> +        power-domain-names:
> +          items:
> +            - const: a
>    # Vendor integrations using a single clock domain
>    - if:
>        properties:
> @@ -90,4 +116,5 @@ examples:
>          clock-names =3D "core";
>          interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>          power-domains =3D <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> +        power-domain-names =3D "a";
>      };
>=20
> --=20
> 2.47.0
>=20

--RoFUdNR+eVTM1NxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypegQAKCRB4tDGHoIJi
0hvYAP41d81+vVbGwurEhXKOPcmyx+xk6+iazN0Bol8EGVlghgEAg8Np/YUjcJ45
HQFB+cbVr2jjAxIggFlx2U/eGOrdAA0=
=CO6v
-----END PGP SIGNATURE-----

--RoFUdNR+eVTM1NxM--
