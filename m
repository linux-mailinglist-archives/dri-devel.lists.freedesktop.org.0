Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D17E1E24
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0634010E2B9;
	Mon,  6 Nov 2023 10:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7F10E2B5;
 Mon,  6 Nov 2023 10:20:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 356B960E17;
 Mon,  6 Nov 2023 10:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF57C433C8;
 Mon,  6 Nov 2023 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699266015;
 bh=sDYW0TRJRxyc4I9EmZsQAlSRuE+iAjaN8hcKiYYNorE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ctz0qxB3zM5gewHjXvMpL8p8TOGGzn2ksEC8gHoW1p8Rx7eaDSvzCuib5IS1vnghE
 yDDmdVyycmJuajzSdylCHkAFZUMIVFdI89TrOds3ykXL8p0NiSMR5BRJiyCgd5oONO
 g0QPD5QLxTYyjsievHX9hccPxVD0hMtJsSGono19y96tZOS/hgkxh3aLdgipV+rug1
 rnGuRKHEsN+tSAFbu7slnFsACYN5lrA5rxYXJIMJ8dGJgrtR75XUH4Vo0o6YTYK6Wk
 cSyiOC9tZG82kWWkeb75BcKktF4K3HuvV3MwfYfKURJv/YWFDXuQ6/kJxey4Tsi5XF
 GmMxY4GIyjcfA==
Date: Mon, 6 Nov 2023 11:20:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <uqzfduftpqlq35pdndovsqtmksjpxr5ei2utz45lwjhnsgchxh@grbzyctiig7w>
References: <CAGWvnynOWoKT1EWkL8ELfRVxSUjm-hBQnnjb-w2Gq-tmOFm0Hg@mail.gmail.com>
 <1807db8f-2ba6-0838-1d4c-39ff4cb7a34d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x7sguxvdi7tbullb"
Content-Disposition: inline
In-Reply-To: <1807db8f-2ba6-0838-1d4c-39ff4cb7a34d@linux.intel.com>
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


--x7sguxvdi7tbullb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2023 at 11:01:51AM +0100, Thomas Hellstr=F6m wrote:
> Hi, David.
>=20
> On 11/3/23 17:37, David Edelsohn wrote:
> > Dual-license drm_gpuvm to GPL-2.0 OR MIT.
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 02ce6baacdad..08c088319652 100644 ---
> > a/drivers/gpu/drm/drm_gpuvm.c <https://cgit.freedesktop.org/drm/drm-mis=
c/tree/drivers/gpu/drm/drm_gpuvm.c?id=3D6f2eeef4a0aa9791bbba9d353641a6e067b=
b86c1>
> > +++ b/drivers/gpu/drm/drm_gpuvm.c <https://cgit.freedesktop.org/drm/drm=
-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=3Df7749a549b4f4db0c02e6b3d3800ea4=
00dd76c12>
> > @@ -1,4 +1,4 @@
> > -// SPDX-License-Identifier: GPL-2.0-only
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > /*
> > * Copyright (c) 2022 Red Hat.
> > *
> > The above SPDX License Identifier change is incorrect and no longer
> > valid. The change misunderstood the syntax of SPDX license identifiers
> > and boolean operations. GPL-2.0-only is the name of the license and mea=
ns
> > GPL 2.0 only, as opposed to GPL 2.0 or later. The "only" does not
> > refer to restrictions on other licenses in the identifier and should not
> > have been
> > removed. The hyphens designated that the name was a single unit.
> > The SPDX License Identifier boolean operators, such as OR, are a
> > separate layer
> > of syntax.
> > The SPDX License Identifier should be
> > GPL-2.0-only OR MIT
> > Thanks, David
>=20
> The author has acked the change / relicensing, which is also described in
> the commit title so could you please elaborate why you think it is not
> valid?

I think their point isn't so much about the license itself but rather
the SPDX syntax to express it.

Maxime

--x7sguxvdi7tbullb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUi93QAKCRDj7w1vZxhR
xXiNAP0YF7aE4+ycE+id+XxBf6I4WSW202tKdrqCpa5p0SzhzwD+OkyvMiX0WKTR
7dlz6mTKQVOz7JKEaTJEilqDgDU51A4=
=jdPE
-----END PGP SIGNATURE-----

--x7sguxvdi7tbullb--
