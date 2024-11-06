Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E8A9BF3E7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 18:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115C410E738;
	Wed,  6 Nov 2024 17:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ApH/yve7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B264510E73C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 17:06:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B0D96A44172;
 Wed,  6 Nov 2024 17:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD25BC4CECD;
 Wed,  6 Nov 2024 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730912806;
 bh=Osy2vFRVeMd9d4xPWdCbKDRnNTUTz3AzLAA1gmYcZWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ApH/yve7hfFkIWz8NxQI4YWwvUKSSr2K0uNrGI9klXB3LWLiZGNYs8aRlsKRuGfIj
 VeR6RqxMVFmLW3pFprKcjapbxD1pgJo7zdQkYeVsAVXS8iQBMa69l2634SxB7Kp8KU
 Bpzc2AeuuVggLHHN3wb3cG/5W4e6x7isacM6schd59G/mlAOsY4FwLVOtBXnRfzOO3
 JmCubQh3b/LNlCJuof5tT/ZPg8qLOqZ7g0R+e+1ysPzxz7Af+9xzeUobz80bRrPhaE
 cnEPbpcRby6mYK3i3AtzeC6DJscubyPnX25UPDaNcaHRIPHLPmfwjWf2qZrEGH1OjJ
 /ximySYwjsXow==
Date: Wed, 6 Nov 2024 17:06:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 02/21] dt-bindings: gpu: img: Further constrain clocks
Message-ID: <20241106-fragment-luckiness-51ccb4bd2b4e@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com>
 <20241105-blooper-unflawed-6181022944d9@spud>
 <5b26e693-d37f-41ee-b119-32ef648de6f4@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7/EssgUtkRYKje0N"
Content-Disposition: inline
In-Reply-To: <5b26e693-d37f-41ee-b119-32ef648de6f4@imgtec.com>
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


--7/EssgUtkRYKje0N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:17:53AM +0000, Matt Coster wrote:
> On 05/11/2024 18:16, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 03:58:08PM +0000, Matt Coster wrote:
> >> All Imagination GPUs use three clocks: core, mem and sys. All reasonab=
ly
> >> modern Imagination GPUs also support a single-clock mode where the SoC
> >> only hooks up core and the other two are derived internally. On GPUs w=
hich
> >> support this mode, it is the default and most commonly used integratio=
n.
> >>
> >> Codify this "1 or 3" constraint in our bindings and hang the specifics=
 off
> >> the vendor compatible string to mirror the integration-time choice.
> >>
> >> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> >> ---
> >>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 27 +++++++++++++=
++-------
> >>  1 file changed, 19 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> index ef7070daf213277d0190fe319e202fdc597337d4..6924831d3e9dd9b2b052ca=
8f9d7228ff25526532 100644
> >> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> @@ -30,15 +30,20 @@ properties:
> >>      maxItems: 1
> >> =20
> >>    clocks:
> >> -    minItems: 1
> >> -    maxItems: 3
> >> +    oneOf:
> >> +      - minItems: 1
> >> +        maxItems: 1
> >> +      - minItems: 3
> >> +        maxItems: 3
> >=20
> > Just put the outer constraints here and...
> >=20
> >>    clock-names:
> >> -    items:
> >> -      - const: core
> >> -      - const: mem
> >> -      - const: sys
> >> -    minItems: 1
> >> +    oneOf:
> >> +      - items:
> >> +          - const: core
> >> +      - items:
> >> +          - const: core
> >> +          - const: mem
> >> +          - const: sys
> >> =20
> >>    interrupts:
> >>      maxItems: 1
> >> @@ -56,15 +61,21 @@ required:
> >>  additionalProperties: false
> >> =20
> >>  allOf:
> >> +  # Vendor integrations using a single clock domain
> >>    - if:
> >>        properties:
> >>          compatible:
> >>            contains:
> >> -            const: ti,am62-gpu
> >> +            anyOf:
> >> +              - const: ti,am62-gpu
> >>      then:
> >>        properties:
> >>          clocks:
> >> +          minItems: 1
> >>            maxItems: 1
> >=20
> > ...adjust the constraints in conditional bits. Setting minItems to 1
> > should be a nop too. Pretty sure what you already had here was actually
> > already sufficient.
> >=20
> > Cheers,
> > Conor.
>=20
> Is there an implicit constraint ensuring "clocks" and "clock-names" are
> the same size? I wasn't sure if we could rely on that, hence the
> slightly odd constraint on "clocks". The only real goal here is to
> codify that you can't have one of "mem" or "sys". it's both or nothing.

You can just constrain clock-names: maxItems: 1 like you have already
done for clocks. The items list that was already in the file enforces
that the first clock provided must be core. When you add your new
compatible you can set clock{-names}: minItems: 3 for it, and that will
ensure that either 1 clock (core) or all 3 are the only options.

--7/EssgUtkRYKje0N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyuiIAAKCRB4tDGHoIJi
0jRkAQDGZQfnlzA6wVW+zIxouu+T1KIMoChkv7UzyuIaXs06nAEAmyPWR4iVUQZq
mzvYlkKzFEVKWuN3OjfBXjh9lFrzVQI=
=IFE4
-----END PGP SIGNATURE-----

--7/EssgUtkRYKje0N--
