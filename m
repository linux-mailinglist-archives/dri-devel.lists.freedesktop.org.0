Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA209B155F3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 01:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C9310E052;
	Tue, 29 Jul 2025 23:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tU7aTxra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3AA10E052
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 23:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1753831455;
 bh=6mTBlnRa8PfraSaaxyB4E03DncCpm/bdVtGK3eHDw28=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tU7aTxranuaaz+DwfXamuiJ/PpaLzLGSReMsdUZgXmLOHRlhUihAJRQ7xeG8ET8N6
 BSjXVXF/DsVBMbT4Xtr+uziHC7jNV1ezuY9hTGjoyk23SgzBNLVuHIisuslBFUW+qo
 HNaVzs5PQzB9eAJQu6ZPsHzyz+b0E1FAEv4PW557NRP3JGnAbOVh8IS7PdqEPbLHWn
 fu6Y0VaZOvSKML3e2A0XLJPg1TlpFYzdTmV0bnCK6dJOG3pQwBh5jySLSr34HeveKh
 mjcX6P11IzxTM6EhbGULbzRkJYZrQ1J4JEFBCv2oTgXrlmC2ZopXyVx/MSP102qDi6
 P12CytnqSM31Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsBHy73Dcz4w2R;
 Wed, 30 Jul 2025 09:24:14 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:27:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drm-nova tree
Message-ID: <20250730092746.1576eaa3@canb.auug.org.au>
In-Reply-To: <20250701155159.47b914a3@canb.auug.org.au>
References: <20250701155159.47b914a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AMgr8NzSUK_p=U_yMkTt9h=";
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

--Sig_/AMgr8NzSUK_p=U_yMkTt9h=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Jul 2025 15:51:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/gpu/nova-core/driver.rs
>=20
> between commit:
>=20
>   94a08721435c ("gpu: nova-core: increase BAR0 size to 16MB")
>=20
> from the drm-nova tree and commit:
>=20
>   f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")
>=20
> from the driver-core tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/gpu/nova-core/driver.rs
> index 518ef8739550,110f2b355db4..000000000000
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@@ -1,6 -1,6 +1,6 @@@
>   // SPDX-License-Identifier: GPL-2.0
>  =20
> - use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*,=
 sizes::SZ_16M};
>  -use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*,=
 sync::Arc};
> ++use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*,=
 sizes::SZ_16M, sync::Arc};
>  =20
>   use crate::gpu::Gpu;
>  =20

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AMgr8NzSUK_p=U_yMkTt9h=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJWPIACgkQAVBC80lX
0Gwbcgf/RCYzMVrfgLKrYwOzn0BcMoNWMGL7Z5Ew3wMyRelaWSOrkIvFHSL6m290
luqRdmfLxE1SPmZfD1mfW7f4sxEbzixFa0n8LCkGr+1NtfgMryLYrLAje9o1Tz5w
QvlFxuBSifzmMV4EKTSoKW6PLc1Ay9rQgk0ACcKkZ/QGBhVwqotFzLZElwTR5y5m
wjF0s0b8wTwqEl76qhkHRDS9ILaaA8XLQwWL3Hxy8IILm9siVQlngRsa+au1HqHf
HazP4ciXAWVkm4kxxLPg+z/mXlln7uGozB5m7Jn137tEjtAhhjQipKqiCQsx23pj
8wT6Jvwv/t/4+CVZJZ3GnL2nDEmiag==
=xobR
-----END PGP SIGNATURE-----

--Sig_/AMgr8NzSUK_p=U_yMkTt9h=--
