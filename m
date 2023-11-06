Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E016A7E1EFF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D70F10E2CD;
	Mon,  6 Nov 2023 10:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB7810E2C9;
 Mon,  6 Nov 2023 10:55:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0DE24CE0A0A;
 Mon,  6 Nov 2023 10:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA6DC433C8;
 Mon,  6 Nov 2023 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699268118;
 bh=SBZK5b3bKY8ubnFznm4nFk+h5kcaLCckfQv/6tPu678=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myx08iB+R1Jn1D8uFN77B3Jh/T+9219K2FPOus3hli1FoLpCZFzgUcNxMqnkNfu+V
 ab56BelLz/gIy2IbwKcD/JO4yq/jKw2fuiA0KYqPWFQwxgK3fqZgkIULeKKFB22Pf4
 REmvL9xnh/QAizQ79JNwQrqNwEVnezkGh9vVv1lkTnPqb7bAkzBgUjzBgLjZHAsBjn
 F7ALT5bZBt10gV4ZhN73/iIKZ1MxWZ54dA/J8gklzfIGwh+P6Hw8TUH15hpRdY1KGw
 GUZPlYrmvP9gFeSsC/Qw9e3b8pI8KCr2Lo2IU2afrfXS1lE1AwsuOhjPTThtY/Tqhx
 Cb1pU566w9K2Q==
Date: Mon, 6 Nov 2023 11:55:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <5lfrhdpkwhpgzipgngojs3tyqfqbesifzu5nf4l5q3nhfdhcf2@25nmiq7tfrew>
References: <CAGWvnynOWoKT1EWkL8ELfRVxSUjm-hBQnnjb-w2Gq-tmOFm0Hg@mail.gmail.com>
 <1807db8f-2ba6-0838-1d4c-39ff4cb7a34d@linux.intel.com>
 <uqzfduftpqlq35pdndovsqtmksjpxr5ei2utz45lwjhnsgchxh@grbzyctiig7w>
 <bd34dffe-86ba-bf1a-b12f-33611da0a7ca@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vicadpbzqb32mrcn"
Content-Disposition: inline
In-Reply-To: <bd34dffe-86ba-bf1a-b12f-33611da0a7ca@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Edelsohn <dje.gcc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vicadpbzqb32mrcn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2023 at 11:37:34AM +0100, Thomas Hellstr=F6m wrote:
> On 11/6/23 11:20, Maxime Ripard wrote:
> > On Mon, Nov 06, 2023 at 11:01:51AM +0100, Thomas Hellstr=F6m wrote:
> > > Hi, David.
> > >=20
> > > On 11/3/23 17:37, David Edelsohn wrote:
> > > > Dual-license drm_gpuvm to GPL-2.0 OR MIT.
> > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuv=
m.c
> > > > index 02ce6baacdad..08c088319652 100644 ---
> > > > a/drivers/gpu/drm/drm_gpuvm.c <https://cgit.freedesktop.org/drm/drm=
-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=3D6f2eeef4a0aa9791bbba9d353641a6e=
067bb86c1>
> > > > +++ b/drivers/gpu/drm/drm_gpuvm.c <https://cgit.freedesktop.org/drm=
/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=3Df7749a549b4f4db0c02e6b3d380=
0ea400dd76c12>
> > > > @@ -1,4 +1,4 @@
> > > > -// SPDX-License-Identifier: GPL-2.0-only
> > > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > > /*
> > > > * Copyright (c) 2022 Red Hat.
> > > > *
> > > > The above SPDX License Identifier change is incorrect and no longer
> > > > valid. The change misunderstood the syntax of SPDX license identifi=
ers
> > > > and boolean operations. GPL-2.0-only is the name of the license and=
 means
> > > > GPL 2.0 only, as opposed to GPL 2.0 or later. The "only" does not
> > > > refer to restrictions on other licenses in the identifier and shoul=
d not
> > > > have been
> > > > removed. The hyphens designated that the name was a single unit.
> > > > The SPDX License Identifier boolean operators, such as OR, are a
> > > > separate layer
> > > > of syntax.
> > > > The SPDX License Identifier should be
> > > > GPL-2.0-only OR MIT
> > > > Thanks, David
> > > The author has acked the change / relicensing, which is also describe=
d in
> > > the commit title so could you please elaborate why you think it is not
> > > valid?
> > I think their point isn't so much about the license itself but rather
> > the SPDX syntax to express it.
> >=20
> > Maxime
>=20
> Hm. There are a pretty large number of these in drm with the same syntax:
>=20
> SPDX-License-Identifier: GPL-2.0 OR MIT
>=20
> So I read it as whe shouldn't have change "Licence A" to "Licence B OR
> C" but instead should have changed it to "Licence A OR C", hence the
> *change* (rather than the syntax) would no longer be valid.
>=20
> Perhaps I have had too little coffee this morning.
>=20
> I'd appreciate if David could clarify.

Either way, one of the issue is that GPL-2.0 was deprecated in favour of
GPL-2.0-only

https://spdx.org/licenses/GPL-2.0.html

So you effectively changed the preferred syntax to the deprecated one in
the process of adding the new license.

I think that's what David was saying, but there might be something else :)

Maxime

--vicadpbzqb32mrcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUjGEwAKCRDj7w1vZxhR
xfE9AP4/CC19seAY8YeQeZ4uvcyWeXGcD2rLP4XX8lFLr2jO6QEA/P9NpAwIlTky
ZGk/oyEqLrhlzktulXcEKgyp5qIxjAg=
=9vB9
-----END PGP SIGNATURE-----

--vicadpbzqb32mrcn--
