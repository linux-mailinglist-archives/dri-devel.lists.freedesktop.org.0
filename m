Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D0A9E706
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 06:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FE110E364;
	Mon, 28 Apr 2025 04:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n+OR4rGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD1710E364;
 Mon, 28 Apr 2025 04:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1745814294;
 bh=Pi/iIMCSJTDwYpAX7VGNjNL+T038S3Xs7GDOBapDxyk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n+OR4rGl69tAMaeHFyv40owrPKk2Qvq0FgWnuAWtmdHunJocbqdP2hZS7BBU9RDjw
 aSzyrrpsibL76AZFlL5+MwbI56Apclq/k7wTUrLahWkfWf2Y6IhiDfv6/rKkwbg0in
 +P190Z8qMYmgFJxlc51RTcGRNd06Pj5EtGLXLzDCdPWTyhAwMMDAzHjoeaXRWTqkJX
 eon2+44oBJOqXC0VCO/dQJnmUFrXsjN1kqQ6sXHn5J3/oR54ua1uUSo5MBMu7Y+JQn
 mDOLR7jlTzCeyrJRNkNhX+RrVPx7Z6hBhn3xu6GLs6mYx5BRkgMWrmLLBlKJtftaTY
 a41wzzm/V2ZIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm9Mp0Bf5z4wyh;
 Mon, 28 Apr 2025 14:24:53 +1000 (AEST)
Date: Mon, 28 Apr 2025 14:24:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20250428142452.64ff7dd7@canb.auug.org.au>
In-Reply-To: <20250428133013.5ad6b6b7@canb.auug.org.au>
References: <20250428133013.5ad6b6b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A2wB=lPK0WB_n+yZjXAX+G5";
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

--Sig_/A2wB=lPK0WB_n+yZjXAX+G5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Apr 2025 13:30:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from drivers/gpu/drm/xe/xe_bo.c:3118:
> drivers/gpu/drm/xe/tests/xe_bo.c: In function 'ccs_test_migrate':
> drivers/gpu/drm/xe/tests/xe_bo.c:63:15: error: too many arguments to func=
tion 'xe_bo_evict'
>    63 |         ret =3D xe_bo_evict(bo, true);
>       |               ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_bo.c:2939:5: note: declared here
>  2939 | int xe_bo_evict(struct xe_bo *bo)
>       |     ^~~~~~~~~~~
>=20
> Caused by commit
>=20
>   55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")
>=20
> I have used the drm tree from next-20250424 for today.

The fix for this turned up in the drm-xe tree while I was writing the
above.  I have now used the current drm tree combined with the current
drm-xe tree for today.  So the drm tree on its own is broken as above,
but linux-next is not.

--=20
Cheers,
Stephen Rothwell

--Sig_/A2wB=lPK0WB_n+yZjXAX+G5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPAxQACgkQAVBC80lX
0GzHOgf+I1NaDO9ZHmexBHMt/XiPvkGsTAvn9fA8pR3qyGKurtxJOPAuea/9Rjvx
OI8a8icC4ZFa0w4IqnSdtU4uF+fZje6rUVm7HLeBf6nBr5zOb3y3Myv5/DlakR+Q
tTlscB7tBnTgJozR9ZcfhaBGQXblxL4IYZkbvDwpnMfEAuMqQDwlOHTpZI4+Wb8T
wnnv2h47yZ13H8g7P8qA4GiEjpdtz41b43/IKWB6Smebr3MqtYEoMw86OIxwysiI
h9vGr6/rlO3/d5RS6N/QGaL/Z/jqJkAb6aAsRbkKZali9Qp/iIjyQXcGu9KTD43G
Hx/kWZ8z/yYKDKLmBgsSWDsNLZ8+WQ==
=qDw9
-----END PGP SIGNATURE-----

--Sig_/A2wB=lPK0WB_n+yZjXAX+G5--
