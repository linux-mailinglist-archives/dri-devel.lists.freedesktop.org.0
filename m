Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA4B3F28E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 05:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7281D10E041;
	Tue,  2 Sep 2025 03:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KatPvi7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB6010E041
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 03:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1756782186;
 bh=DC+oKZZYxqWcrJpyWP/DWxEAJRgFryniOiFt72m9hk4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KatPvi7g1Nw65lso4s10kJSihpm4gZXr/NsjhquAU2bDC/9x1dZ9mng7zM602oBb4
 2o1bbgA5+C/PHqUuPuZAp+tccWaQxWmHQOse65y4+pzjhYnzUQCWzRLzoX3V+MFyZW
 kZJzF569bj5GNoaWjw5iVSPOrNYGI9VFtOUnGZBePOU+ea06G/51A/XAbJGclF8uuS
 I6twKv1dwt7DNkOSLO6XRprCw6PNUPmcJYjx40QPCCEL/KvpggBlFSODEK2WT7NEDe
 L3uwjLYr83KzoyVdJGnMAvKbM5sdmTTBimeXBSwBuR2KMYblJWphCznhUircmiRxT0
 iaP6XCN7FGSWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cG9Xn15lbz4w9V;
 Tue,  2 Sep 2025 13:03:05 +1000 (AEST)
Date: Tue, 2 Sep 2025 13:03:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Inki Dae <daeinki@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Kaustabh Chakraborty
 <kauschluss@disroot.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Message-ID: <20250902130304.1f80f4c6@canb.auug.org.au>
In-Reply-To: <20250901122226.20a39858@canb.auug.org.au>
References: <20250821112740.75a41814@canb.auug.org.au>
 <20250826121320.4931c6eb@canb.auug.org.au>
 <20250901122226.20a39858@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+b2F+nsi+ou0j8IYjHeDy/x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/+b2F+nsi+ou0j8IYjHeDy/x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Sep 2025 12:22:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 26 Aug 2025 12:13:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Thu, 21 Aug 2025 11:27:40 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > After merging the drm-exynos tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >=20
> > > drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:20: error: 'DSIM_TYPE_EXY=
NOS7870' undeclared here (not in a function); did you mean 'DSIM_TYPE_EXYNO=
S5410'?
> > >   158 |         .hw_type =3D DSIM_TYPE_EXYNOS7870,
> > >       |                    ^~~~~~~~~~~~~~~~~~~~
> > >       |                    DSIM_TYPE_EXYNOS5410
> > >=20
> > > Caused by commit
> > >=20
> > >   d07e4c00696f ("drm/exynos: dsi: add support for exynos7870")
> > >=20
> > > I have used the drm-exynos tree from next-20250820 for today.   =20
> >=20
> > I am still seeing this failure. =20
>=20
> I am still seeing this failure.

Today, I have just reverted that commit instead of the whole branch,

--=20
Cheers,
Stephen Rothwell

--Sig_/+b2F+nsi+ou0j8IYjHeDy/x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi2XmgACgkQAVBC80lX
0GxL0QgAi41jeaE5Qn2T1A78VvF7HiCC39PD+ifyWxGBOfP/fNjSCwS2+1SKx7+i
ZaaNXjzt7TVDaP5SntF6X1oa3qqU1RXgpVupusH0M1E6URngmXkrc3QxxJyz+/Pb
MxiKeYoGaiyW/OdzWBpxCZ1WempBamr0mpO2K4EScDuGugxx4QcJ4E6x0R/o8PjV
frpR8XcdkErmd8eq14m2Y6fbO9DaZ+jI6I/8Hok2cfU9ARduyNt5RMF0uNq1rOuG
ozGO4VQ463Yu+hlysos6wZD1QCRxIedUbqK4PT9HKG7siFFjyWoLdqG4IG+pbqnT
v729GqxxHkbdCidKyFMKb+WnNyN7Mg==
=hZOr
-----END PGP SIGNATURE-----

--Sig_/+b2F+nsi+ou0j8IYjHeDy/x--
