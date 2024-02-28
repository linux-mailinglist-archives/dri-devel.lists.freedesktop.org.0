Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA6B86BA48
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 22:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70410E0EE;
	Wed, 28 Feb 2024 21:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kTV2EXbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD0610E2FB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 21:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1709157392;
 bh=UJSLjHZkQMErzMOL11cZiUSz7UB/Osw2FGv+xjfbC+Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kTV2EXbPvj/M/s2NcOJLxLZvXApZJoZjDrAgCvNHIAzwassOJHXvxLZVdN3xMKKeP
 dwCj2D1MOnt6W+fRkYu+obVkkB2ifV6Qb+SBM1qau7+jNl1JfRfMYvebHpHKtYx5Xb
 +jRg8P9lXTIcXV2+QFsLd1CANTMLA0ZcLKKw5llziD/eDS2jcTJ753nTahVTjacQ3n
 nFO8qQNEzMmwRURHsTe36TIhTaj83NHb4N6mol5fFQVG1gZwvDzQKMO7P8L0YY4a1D
 uoRpOSnxqOsOsgZTCGQDzyNDFbRRlpGWKyqWH9X4YvToctFJxX8llDECGmu2f8K7js
 aUb/VrMPd/2lA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TlSqL396gz4wc6;
 Thu, 29 Feb 2024 08:56:29 +1100 (AEDT)
Date: Thu, 29 Feb 2024 08:56:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <20240229085628.44b5e53c@canb.auug.org.au>
In-Reply-To: <Zd9gWOnpPf5XbR-j@phenom.ffwll.local>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
 <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
 <20240221094643.4496313a@canb.auug.org.au>
 <Zd9gWOnpPf5XbR-j@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sxZ3OjgWSh4LhO4a4A4lwUw";
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

--Sig_/sxZ3OjgWSh4LhO4a4A4lwUw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, 28 Feb 2024 17:33:28 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > git://git.freedesktop.org/git/drm/drm.git#drm-fixes
> > git://git.freedesktop.org/git/drm/drm.git#drm-next =20
>=20
> To test out the process we've moved drm.git first. It's now here:
>=20
> https://gitlab.freedesktop.org/drm/kernel.git
>=20
> Still the same two branches. Can you please update the url? We haven't
> enabled the auto-mirror for this one, since we want to make sure the
> upgrade path in the tooling works and people do switch over to the new
> repo.

Done.  They seem to be fine.

--=20
Cheers,
Stephen Rothwell

--Sig_/sxZ3OjgWSh4LhO4a4A4lwUw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXfrAwACgkQAVBC80lX
0GweRwgAnGpWLdcehrtAmzrKqkzC8m87x1xjlghwjtNxqK0zbk0638o/IM5A4A/3
d0guDr5UZQ3T/Hgbu/IO7+AX28wjod1a96ya96aqCM7bHfFpA9N2Jhq/E06p08fC
HpoTiGKfdwP0fk5R62HSTM0QTfxmt+i52hstBzNYZ3xA5r/Pq8uGpBMi3Xj/94yr
vjhKiQPp/n/7QooLL6M4rj8UUc9SNut2h4VQJMsRnw29k1cWC08XWRaGhBbIlrSj
jjZlIAuKWQKuJc2xpNclWbRjur/vlznFzT3XSlAvkBTnfw3+O08vMTMIQJQWarvm
zbYL4B7ASbvPUZWi6geSfWN3iRFOUA==
=DcJf
-----END PGP SIGNATURE-----

--Sig_/sxZ3OjgWSh4LhO4a4A4lwUw--
