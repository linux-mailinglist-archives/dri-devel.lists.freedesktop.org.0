Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268308CEFC9
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2024 17:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF8B10ED90;
	Sat, 25 May 2024 15:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hZeTM+9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B544210ED90
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 15:22:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1C756341C;
 Sat, 25 May 2024 15:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2D4C2BD11;
 Sat, 25 May 2024 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716650535;
 bh=3tbcRNxeNzL8TcNwxdvGvDZ9O4pCgSBfeWFvCWSk6yQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZeTM+9zlWR9siOzeSHwoQa1iLcxr0TtyU4cAdodleN8jDl6Rb2ciAdF8xJiORxHP
 1qcitlDEX9AeC7ii90ub4GotgIl/Vph5rL6VPlNfXlLUeI/FewH5RkhauC8IUJSpVi
 en6+CAV+PgCzk/50+0yUZa/TJrbyBqqIZ6erC3F8IarXNoQzFxSYMiTqHRXM5glPQf
 SivaYikabYFoRQp6enuCNKZcI3kv2udIhwbf6Cf7AHm1P+Q+uMOFgM/K2BlAOZ2xSg
 aLh8mxDde6dnj07PXcMvJB3zId+ktHHrqQsFMNdjpL1QzUp7XnNZPflDwUpoE8M830
 KOmBj5+CK9AEg==
Date: Sat, 25 May 2024 16:22:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Message-ID: <20240525-velvet-citable-a45dd06847a7@spud>
References: <20240524103506.187277-1-ryan@testtoast.com>
 <20240524103506.187277-2-ryan@testtoast.com>
 <20240524-purveyor-outlying-5201f700a56e@spud>
 <a7363cd2-4e2e-4894-8a16-f1913927e332@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9hL0IbwgYO6baJb1"
Content-Disposition: inline
In-Reply-To: <a7363cd2-4e2e-4894-8a16-f1913927e332@app.fastmail.com>
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


--9hL0IbwgYO6baJb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 09:26:48AM +1200, Ryan Walklin wrote:
> On Sat, 25 May 2024, at 7:10 AM, Conor Dooley wrote:
>=20
> Thanks for the review!
>=20
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: wl-355608-a8
> >
> > You're missing a vendor prefix here. And when you add it, update the
> > filename to match.
>=20
> Thanks, I don't actually know the vendor, would it be acceptable to just =
use "wl"?

You mean, "wl,355608-a8"? I did a wee bit of googling of the thing, and
yeah, there's nothing that a surface level search turns up for it -
other than they appeared to have a logo with a W in a circle...
I think if we genuinely do not know what the vendor is then we just
don't have a prefix.

> >> +            compatible =3D "wl_355608_a8";
> >
> > This doesn't match what you documented, be sure to run dt_binding_check.
>=20
> Thanks, changed underscore to dash mid-patch and neglected to fix all
> the examples (and the subsequent code patch it seems. Will correct.
> Is there a preference one way or another?=20

Not _s :)

--9hL0IbwgYO6baJb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlICIgAKCRB4tDGHoIJi
0iagAP4+6uJlXfivXe4GQy7XinPInLQ7G7t86u+LVeDXy5cYWQD+L5mrwGAnA8RF
A0Ek4kwuI7vNh7txGvgWjCKX1H4LiA0=
=U4zk
-----END PGP SIGNATURE-----

--9hL0IbwgYO6baJb1--
