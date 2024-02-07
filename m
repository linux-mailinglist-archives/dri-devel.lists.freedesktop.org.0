Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076B84C29E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 03:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F008F10EA96;
	Wed,  7 Feb 2024 02:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oOx4/ocs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D4210E938;
 Wed,  7 Feb 2024 02:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1707273963;
 bh=m2IP95JMxveFFleg+ObudlZMqaQ8gm6KHoaDb35aFKI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oOx4/ocs8S0lWgpb3QhHNdFts+H21JtLfPIcuExLd/OXS4tM25Sa6zNHlxuGhrsp5
 nRBoA132+HaKTuZTX1plfj4v3R4946hkF7X9xnFVCVPGcjU7J7YIWTv4k9wW6mCNBS
 PdJq/lHsIvBAscyROOTICm3vGmN9NTBPmU0kLLGK9ttnCQTK1hbNvUhFIj32y9YWcX
 aK/uMPXr8DhCReWnIv4lsUkHVPGyGLi0t3oNuM345KH6L0QhwnqvAUMF6vnJWp3G8J
 sVJqlQwUhyqMVjuNy2yqFSMnPYOmnO56qe+XDpmeMYYMhPDLimFj1STh7yst0m/GO0
 2QFfmEpzbnaIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TV4HZ6lWPz4wcC;
 Wed,  7 Feb 2024 13:46:02 +1100 (AEDT)
Date: Wed, 7 Feb 2024 13:46:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240207134600.5ab91ba8@canb.auug.org.au>
In-Reply-To: <20240206122822.12a2df89@canb.auug.org.au>
References: <20240206122822.12a2df89@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//rg3B1F4UH/_d07_M7NfKGO";
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

--Sig_//rg3B1F4UH/_d07_M7NfKGO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Feb 2024 12:28:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

drivers/gpu/drm/xe/xe_bo.c:41:10: error: 'struct ttm_placement' has no memb=
er named 'num_busy_placement'; did you mean 'num_placement'?
   41 |         .num_busy_placement =3D 1,
      |          ^~~~~~~~~~~~~~~~~~
      |          num_placement
drivers/gpu/drm/xe/xe_bo.c:41:31: error: excess elements in struct initiali=
zer [-Werror]
   41 |         .num_busy_placement =3D 1,
      |                               ^
drivers/gpu/drm/xe/xe_bo.c:41:31: note: (near initialization for 'sys_place=
ment')
drivers/gpu/drm/xe/xe_bo.c:42:10: error: 'struct ttm_placement' has no memb=
er named 'busy_placement'; did you mean 'num_placement'?
   42 |         .busy_placement =3D &sys_placement_flags,
      |          ^~~~~~~~~~~~~~
      |          num_placement
drivers/gpu/drm/xe/xe_bo.c:42:27: error: excess elements in struct initiali=
zer [-Werror]
   42 |         .busy_placement =3D &sys_placement_flags,
      |                           ^
drivers/gpu/drm/xe/xe_bo.c:42:27: note: (near initialization for 'sys_place=
ment')
drivers/gpu/drm/xe/xe_bo.c:55:10: error: 'struct ttm_placement' has no memb=
er named 'num_busy_placement'; did you mean 'num_placement'?
   55 |         .num_busy_placement =3D 1,
      |          ^~~~~~~~~~~~~~~~~~
      |          num_placement
drivers/gpu/drm/xe/xe_bo.c:55:31: error: excess elements in struct initiali=
zer [-Werror]
   55 |         .num_busy_placement =3D 1,
      |                               ^
drivers/gpu/drm/xe/xe_bo.c:55:31: note: (near initialization for 'tt_placem=
ent')
drivers/gpu/drm/xe/xe_bo.c:56:10: error: 'struct ttm_placement' has no memb=
er named 'busy_placement'; did you mean 'num_placement'?
   56 |         .busy_placement =3D &sys_placement_flags,
      |          ^~~~~~~~~~~~~~
      |          num_placement
drivers/gpu/drm/xe/xe_bo.c:56:27: error: excess elements in struct initiali=
zer [-Werror]
   56 |         .busy_placement =3D &sys_placement_flags,
      |                           ^
drivers/gpu/drm/xe/xe_bo.c:56:27: note: (near initialization for 'tt_placem=
ent')
drivers/gpu/drm/xe/xe_bo.c: In function '__xe_bo_placement_for_flags':
drivers/gpu/drm/xe/xe_bo.c:233:18: error: 'struct ttm_placement' has no mem=
ber named 'num_busy_placement'; did you mean 'num_placement'?
  233 |                 .num_busy_placement =3D c,
      |                  ^~~~~~~~~~~~~~~~~~
      |                  num_placement
drivers/gpu/drm/xe/xe_bo.c:233:39: error: excess elements in struct initial=
izer [-Werror]
  233 |                 .num_busy_placement =3D c,
      |                                       ^
drivers/gpu/drm/xe/xe_bo.c:233:39: note: (near initialization for '(anonymo=
us)')
drivers/gpu/drm/xe/xe_bo.c:234:18: error: 'struct ttm_placement' has no mem=
ber named 'busy_placement'; did you mean 'num_placement'?
  234 |                 .busy_placement =3D bo->placements,
      |                  ^~~~~~~~~~~~~~
      |                  num_placement
drivers/gpu/drm/xe/xe_bo.c:234:35: error: excess elements in struct initial=
izer [-Werror]
  234 |                 .busy_placement =3D bo->placements,
      |                                   ^~
drivers/gpu/drm/xe/xe_bo.c:234:35: note: (near initialization for '(anonymo=
us)')
drivers/gpu/drm/xe/xe_bo.c: In function 'xe_evict_flags':
drivers/gpu/drm/xe/xe_bo.c:254:36: error: 'struct ttm_placement' has no mem=
ber named 'num_busy_placement'; did you mean 'num_placement'?
  254 |                         placement->num_busy_placement =3D 0;
      |                                    ^~~~~~~~~~~~~~~~~~
      |                                    num_placement
drivers/gpu/drm/xe/xe_bo.c: In function '__xe_bo_fixed_placement':
drivers/gpu/drm/xe/xe_bo.c:1356:18: error: 'struct ttm_placement' has no me=
mber named 'num_busy_placement'; did you mean 'num_placement'?
 1356 |                 .num_busy_placement =3D 1,
      |                  ^~~~~~~~~~~~~~~~~~
      |                  num_placement
drivers/gpu/drm/xe/xe_bo.c:1356:39: error: excess elements in struct initia=
lizer [-Werror]
 1356 |                 .num_busy_placement =3D 1,
      |                                       ^
drivers/gpu/drm/xe/xe_bo.c:1356:39: note: (near initialization for '(anonym=
ous)')
drivers/gpu/drm/xe/xe_bo.c:1357:18: error: 'struct ttm_placement' has no me=
mber named 'busy_placement'; did you mean 'num_placement'?
 1357 |                 .busy_placement =3D place,
      |                  ^~~~~~~~~~~~~~
      |                  num_placement
drivers/gpu/drm/xe/xe_bo.c:1357:35: error: excess elements in struct initia=
lizer [-Werror]
 1357 |                 .busy_placement =3D place,
      |                                   ^~~~~
drivers/gpu/drm/xe/xe_bo.c:1357:35: note: (near initialization for '(anonym=
ous)')
drivers/gpu/drm/xe/xe_bo.c: In function 'xe_bo_migrate':
drivers/gpu/drm/xe/xe_bo.c:2115:19: error: 'struct ttm_placement' has no me=
mber named 'num_busy_placement'; did you mean 'num_placement'?
 2115 |         placement.num_busy_placement =3D 1;
      |                   ^~~~~~~~~~~~~~~~~~
      |                   num_placement
drivers/gpu/drm/xe/xe_bo.c:2117:19: error: 'struct ttm_placement' has no me=
mber named 'busy_placement'; did you mean 'num_placement'?
 2117 |         placement.busy_placement =3D &requested;
      |                   ^~~~~~~~~~~~~~
      |                   num_placement

> Caused by commit
>=20
>   a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
>=20
> interacting with commit
>=20
>   dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>=20
> (and maybe others) from Linus' tree (v6.8-rc1).

Given that the latter above commit(s) are also in the drm-misc tree, I
have just used the drm-misc tree from next-20240205 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//rg3B1F4UH/_d07_M7NfKGO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXC7ugACgkQAVBC80lX
0GxCKQf/dFGRZp+POtnOvcJVZCr2J0Ev71DeNEa2uRbyt3MxCeKKbYhn3C8OwzHn
6U68cQh+3dotTrMBYUS8cqIAmS6gRPiav+sD5jtHhcY+sDExezR++zA+qnYIaMTB
23qjm8jjRgxu9uh5I/vdV+PvZmS3ladqi31zhpGRa0ZRKPoWrNE4vGUE/PNX71i4
K+aHusdr3cISIsDbX/Rzvo8pUmIOG44+L8LJtVeKlnhQho8WqOqvaR/wdSsKptNl
NbzCT/BM2jN3R1CGPzcWtxKCCKHNnQRLLIHI1RN9imujD2Ri6MvMEE9sxi0lfRHL
QyjSsEqhWGT2dovnMsrzkWj1sqLebw==
=nAVV
-----END PGP SIGNATURE-----

--Sig_//rg3B1F4UH/_d07_M7NfKGO--
