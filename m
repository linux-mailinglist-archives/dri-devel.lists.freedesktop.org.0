Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C4C9BD450
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA30A10E5F3;
	Tue,  5 Nov 2024 18:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t/Y+TCUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDA510E5F3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:13:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C4FB5A43801;
 Tue,  5 Nov 2024 18:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75ADFC4CECF;
 Tue,  5 Nov 2024 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730830436;
 bh=j/hVO0QTQ7lh4OLZKHXt9OfuNaNn7hMoHNsw5w3AxGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t/Y+TCUd+UCPFyz/QmYOaNyOrEY1F37aPU3mTkW94gcgl6YKusgTFEavVQPhoeeIv
 1g25+SjPc863n/03n17Q8U9+vubjmu/gxSHJ0FwrPO41zjM8FNNp/gP6dEqmG2n2er
 9KW3n3/R4c6vJ6TiAAjCbiqNirR7q4OgkSP0BBfkg+Xvp50q9Z6R92N4hnJtltMI75
 ssHBAEY7YDX0LcU08JrKl6NgWaUBPwVHaIqAiXKsce8YC8up4aOciVTBdIPAsHEtd2
 AXxX75o5LueqSOLgkNBl21uKzU1/+LmOy1z8R6Upf1iga/VyFvU/LwZF8e2frzRNN+
 REGnoAwCz4KmQ==
Date: Tue, 5 Nov 2024 18:13:50 +0000
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
Message-ID: <20241105-endearing-huddling-30728a002321@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
 <20241105-disarm-baggie-e2563299a24f@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h6DOoDpaBp8hRAn5"
Content-Disposition: inline
In-Reply-To: <20241105-disarm-baggie-e2563299a24f@spud>
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


--h6DOoDpaBp8hRAn5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 06:05:54PM +0000, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 03:58:09PM +0000, Matt Coster wrote:
> > The single existing GPU (AXE-1-16M) only requires a single power domain.
> > Subsequent patches will add support for BXS-4-64 MC1, which has two pow=
er
> > domains. Add infrastructure now to allow for this.
> >=20
> > Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> > ---
> >  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 ++++++++++++++=
+++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 6924831d3e9dd9b2b052ca8f9d7228ff25526532..55f422be1bc5b7564e3e81f=
24c4b93857f3e12fe 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -49,7 +49,16 @@ properties:
> >      maxItems: 1
> > =20
> >    power-domains:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  power-domain-names:
> > +    oneOf:
> > +      - items:
> > +          - const: a
> > +      - items:
> > +          - const: a
> > +          - const: b

Additionally, a & b? Are those actually the names for the power domains?

> > =20
> >  required:
> >    - compatible
> > @@ -57,10 +66,27 @@ required:
> >    - clocks
> >    - clock-names
> >    - interrupts
> > +  - power-domains
> > +  - power-domain-names
>=20
> A new required property is an ABI break. Please explain why this is
> acceptable in your commit message.
>=20
> > =20
> >  additionalProperties: false
> > =20
> >  allOf:
> > +  # Cores with a single power domain
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            anyOf:
> > +              - const: img,img-axe-1-16m
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          minItems: 1
> > +          maxItems: 1
> > +        power-domain-names:
> > +          items:
> > +            - const: a
> >    # Vendor integrations using a single clock domain
> >    - if:
> >        properties:
> > @@ -90,4 +116,5 @@ examples:
> >          clock-names =3D "core";
> >          interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> >          power-domains =3D <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> > +        power-domain-names =3D "a";
> >      };
> >=20
> > --=20
> > 2.47.0
> >=20



--h6DOoDpaBp8hRAn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypgXgAKCRB4tDGHoIJi
0tmqAP9uwcomPx5whZkcSbKHa8dRJnwZZX53eRiq8F+FqIWxuAD6A6vFpCuNo4V0
stf8zberB2p7Bwefhwsl5aJGNmHl/QY=
=EWBb
-----END PGP SIGNATURE-----

--h6DOoDpaBp8hRAn5--
