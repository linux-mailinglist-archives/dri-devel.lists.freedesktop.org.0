Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D99BF54E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 19:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9187F10E75A;
	Wed,  6 Nov 2024 18:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j2kbkIVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8E410E75A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 18:33:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6E3C5A4424E;
 Wed,  6 Nov 2024 18:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0069C4CEC6;
 Wed,  6 Nov 2024 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730918020;
 bh=y2p9ZXBMTA9Kxb0m1NNUcP0JaTs+i1CzMOB0sUQFJ88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j2kbkIVVWaM3yO7REJyQCuGZCGdvolulDmtWYZJ0519Ine255Oc+aU0EfsQBl5qnz
 ZhVvIX8tYeXL5CG1bDHiVCtWL6JSaB9HWVHfUZgUiwPJfC3+tN7AjLZr7YrAWJ+9zX
 huQL2/Vw2aWIHmrd1fWltvMnj2gEnIql62lTQCRJnygS54B5HtRx26fqV7u5QrhlRE
 nqXaQ+4jXROb6fWlsgz5HtTGJ6fPPGDPclGFwzEWUO6JQ/QMcXNJw4QeoYDHK+2QlK
 Y9qWRWt5TDUSMbESUMfXKUu6tXKgV3nzYV8Se/Bv1/RUunU692C2eKh45GN3w2Mxqd
 NfilyF32y3EWg==
Date: Wed, 6 Nov 2024 18:33:34 +0000
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
Subject: Re: [PATCH 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20241106-motivator-mama-5a9d8d14aece@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
 <20241105-sulfite-justness-d7b7fb98905c@spud>
 <fd3d9f34-0e8f-44a1-ac21-2ee0c49d65fa@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uwRbB0EuidyiYIep"
Content-Disposition: inline
In-Reply-To: <fd3d9f34-0e8f-44a1-ac21-2ee0c49d65fa@imgtec.com>
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


--uwRbB0EuidyiYIep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:18:10AM +0000, Matt Coster wrote:
> On 05/11/2024 18:03, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 03:58:14PM +0000, Matt Coster wrote:
> >> +    / {
> >> +        #address-cells =3D <2>;
> >> +        #size-cells =3D <2>;
> >> +        interrupt-controller;
> >> +        #interrupt-cells =3D <3>;
> >> +
> >> +        gpu@4e20000000 {
> >> +            compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,=
img-rogue";
> >> +            reg =3D /bits/ 64 <0x4e2000 0000 0x80000>;
> >=20
> > Can you format this normally please? Drop the #address/size-cells down
> > to 1 if you're against having 0x0s.
>=20
> Sure. I thought /bits/ was the "new" way of doing things, but I'm not
> really bothered either way.

Maybe in other cases, I've never seen it for reg. The dts coding style
examples even have 0x0s in them. For other properties, sure this might
be the "new" way of doing it but not for reg, probably in part because
it makes it difficult to see if the number matches the number of cells
in #address/size-cells.

--uwRbB0EuidyiYIep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyu2fgAKCRB4tDGHoIJi
0kWlAP9yWsCojC2B4lhypgsjcV7rscFmE6WzqejRkjQrCUmWsgD/bTWjxUFQ+uvC
x36sUGD0EDrdVAQB+gNiLRi+EDhv7Ag=
=VsBN
-----END PGP SIGNATURE-----

--uwRbB0EuidyiYIep--
