Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF9B42C52
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E373A10E20E;
	Wed,  3 Sep 2025 21:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hSqxcrke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98C210E20E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 21:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1756936765;
 bh=PIa0niA/4AlwlM9E4tjybdLVnEWdDgMPU3ANN5fUC4Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hSqxcrke7MMTmnLlKjEvXx0Ne+Ik76ChMtKj0ChJF4uma3ten+SW1nmjCdiGd2ImE
 xb82dcp+ctZOFSUvnYDNEEi8ghH4TrVL5+UHuCvYCwoARodVuxj9KOJM/IOnqW6FV4
 3dun6KjwwUbsVzpvR+Pq92XKTYfeYqFz3EgKJe1wuZDkY85Iuji0lyUuW/BIe+1qRz
 jQ89KWto+F/J4oppXuczqS76q+7161hGySqMNu/cA32vc31CDNM/GKGQ5Z5KOHdWVr
 9KCXDhAh5rro8Mp7sHZ8xZdB2lEr1F5Itt67ATYo0B7I/wFrINhDxpAa5pcR/cc7hp
 bhOBSPG8iwQrg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHGjS6xr0z4w8w;
 Thu,  4 Sep 2025 07:59:24 +1000 (AEST)
Date: Thu, 4 Sep 2025 07:59:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <daeinki@gmail.com>, Inki Dae <inki.dae@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Message-ID: <20250904075923.537b45bd@canb.auug.org.au>
In-Reply-To: <54f68544fa192779e15b46257dd0bfb4@disroot.org>
References: <20250821112740.75a41814@canb.auug.org.au>
 <20250826121320.4931c6eb@canb.auug.org.au>
 <20250901122226.20a39858@canb.auug.org.au>
 <20250902130304.1f80f4c6@canb.auug.org.au>
 <54f68544fa192779e15b46257dd0bfb4@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z0mf2Kafgc6qVvH5J7cupN0";
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

--Sig_/Z0mf2Kafgc6qVvH5J7cupN0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kaustabh,

On Wed, 03 Sep 2025 15:51:03 +0000 Kaustabh Chakraborty <kauschluss@disroot=
.org> wrote:
>
> This commit is from commit [1] of branch [2]. However, the macro is
> defined in commit [3] of branch [4]. I had sent those patches in a single
> patchset, though.
>=20
> I guess the merge strategy would be exynos-drm-misc-next, followed by exy=
nos-drm-next.
>=20
> Let me know if you need to know anything else. Thanks!
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t/commit/?h=3Dexynos-drm-next&id=3Dd07e4c00696f53510ec8a23dcba0c4ac87840874
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t/log/?h=3Dexynos-drm-next
>=20
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t/commit/?h=3Dexynos-drm-misc-next&id=3Dbcd0d93e902e54e6b404b574b3a6b23315b=
cea8d
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t/log/?h=3Dexynos-drm-misc-next

The problem is that nobody has ever asked me to merge [4] into
linux-next ... I also presume that it will be merged into the drm-fixes
tree (or Linus' tree) at some point and that hasn't happened either.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z0mf2Kafgc6qVvH5J7cupN0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi4ujsACgkQAVBC80lX
0GzprAf7BYE6bMzEMBsEqnNFlvw2ahURAnILT17daPzS0pnfImPiw+P6BkrYGexL
jnU19lF1JxGER7DJTxHRHr2OqB6q7D7jolBNSF51HoJJJC6ew1+sP9nmqPfWSeDA
j3sSWDWm0hahudxmsHp47CBxVEkGuZ9kQKhPwYKOtoFZboliAsv5oFBn+bosOOXO
I80WkRqXxGhgCAnsKct/BF6IOp1Ed7BHvEa+p+xO8PFo58swsXSpfyF1dGmkSAL0
rswLqIlirx3BwialHUk48J/ATD2Xv32HeaGbf0F4nrHJgpQxBtVsvlPKN+PEs3e8
rju+9ywcMqjtPYLDOgtMRnUfqKllyQ==
=i5si
-----END PGP SIGNATURE-----

--Sig_/Z0mf2Kafgc6qVvH5J7cupN0--
