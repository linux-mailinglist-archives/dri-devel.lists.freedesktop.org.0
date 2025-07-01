Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCADAEEC9D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 04:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E1810E4DC;
	Tue,  1 Jul 2025 02:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lUUnx8lU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C988E10E4DB;
 Tue,  1 Jul 2025 02:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1751338626;
 bh=MVTkN7/J0c+9dQrkOSPWftCW3TSNeubg8mqKHXjVHfY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lUUnx8lU4RmHD8r9FqrF2CxcaUmYQ065lbBnNjmZ5P01ZqExNUaHIDLDGWSRYcYUe
 RpJiedQ4kARx13+uDlMINDB5Pj7br+xPAhu7Qu2Ef7xA31aFUCV1YE2zGFpem8lQ4m
 LnrvNYxY6uClZnSru5K12ZY4aW41NK6UvOJ+3rH+BNQyv/q40w7vnWF2sTl+PEQ0GB
 0LsctpYkvlgG7aEVhxcwGiRyjuGzyLHQ+OG58aVNVENs98OoBzBjwgSHBhtKoQf5ed
 Z8WYBFQO7qQFDsCEzl2ng4Quvu+bIDu6LmvLN5BSVIEEGO1LidkTlZ9D6OXvAEfU7p
 e/hPWAzBE1e9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWSNy186Zz4wvb;
 Tue,  1 Jul 2025 12:57:06 +1000 (AEST)
Date: Tue, 1 Jul 2025 12:57:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20250701125705.5d5fb3f0@canb.auug.org.au>
In-Reply-To: <20250701125443.5ba945e2@canb.auug.org.au>
References: <20250701125443.5ba945e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=YUQ=d1Wd9WUo0uc8G0JV96";
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

--Sig_/=YUQ=d1Wd9WUo0uc8G0JV96
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Jul 2025 12:54:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>=20
> between commit:
>=20
>   ebe43542702c ("drm/amdgpu: switch job hw_fence to amdgpu_fence")
>=20
> from Linus' tree and commit:
>=20
>   d0c35c84dcfa ("drm/amdgpu: remove job parameter from amdgpu_fence_emit(=
)")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I used the latter version of the conflicting section.
--=20
Cheers,
Stephen Rothwell

--Sig_/=YUQ=d1Wd9WUo0uc8G0JV96
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjToEACgkQAVBC80lX
0GyBKQf40+SClgVhEt8CgG9eiqkriaGoXHUZxe+c55LvQo3eKxkJKFPvB9r8pwYf
givB8lYk5o0eUO4NBpxJ8D4ROumvXHrAuapvSzaYDbXyuCA8oHH7l42yNxFpnqjG
fLlWBSRMN6POpXOJpIaNU7JfYK42OEf1sS4iQswQ/G1l9ZJafn0CdSrDb/gwhyUw
MYsbQvDSfuOGu+pkbnDWKC75muTCcoJFXddVdYHE58qTtPLShMJuXErSTzfCl5Ac
UZR2W+veCv9LpfRWBauEoqzhEzT3rz/VZZq7OhhkfEfaJc1EhOarNXGuF+yVYTp+
Ob9+Qf8omsBYKyTcXsLI3oyac6Sb
=U09u
-----END PGP SIGNATURE-----

--Sig_/=YUQ=d1Wd9WUo0uc8G0JV96--
