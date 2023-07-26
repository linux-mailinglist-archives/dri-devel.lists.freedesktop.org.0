Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE2762807
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 03:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A474B10E406;
	Wed, 26 Jul 2023 01:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4450510E406
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 01:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1690333830;
 bh=x81De0pyPq/SqFSFmk4EAkh9ZgAg19r+n3E+hX4bWn8=;
 h=Date:From:To:Cc:Subject:From;
 b=XXI+kGZcIIAiMbkcPVwkd8Ri5HUoisUR4qXDrU0ZSdooBCn3+qisR/r1z8y342fBL
 2yueWtURHxa1ylTeX2ee9qP48kFz7lwhHnAY5VNiGLEpmAHVoiXnPrA+MKVXwm1TsT
 1RtfyKeWxRNgFtLdn8v5yVIVGfRbYMtoYp/SYZaxlS0oyVewmyPRCxYfAsL1yXpadr
 EGLot4+l5az9FOujR3SbqKdI65mHpk7Gj3s+VQL1AgKtOTVlbcuivjNInUUGFd0qKN
 qspHULOZHDksHu+Rgp/w8Vr/tdzPCGg8jOCBVVvmsdov3zZh+GFDjYW95Z9+YKTS6h
 H8u216zxuEZ8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R9bRn1dQYz4wZs;
 Wed, 26 Jul 2023 11:10:29 +1000 (AEST)
Date: Wed, 26 Jul 2023 11:10:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20230726111018.6a023a7d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GcJb70x6Xj5jHq4d7Cvw41N";
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/GcJb70x6Xj5jHq4d7Cvw41N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

between commit:

  8a206685d36f ("drm/amdgpu: use drm_exec for GEM and CSA handling v2")

from the drm tree and commit:

  30953c4d000b ("drm/amdgpu: Fix style issues in amdgpu_gem.c")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 7da871972a8e,992dfd3de49c..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@@ -226,9 -229,6 +225,9 @@@ static void amdgpu_gem_object_close(str
  		goto out_unlock;
 =20
  	r =3D amdgpu_vm_clear_freed(adev, vm, &fence);
 +	if (unlikely(r < 0))
- 		dev_err(adev->dev, "failed to clear page "
- 			"tables on GEM object close (%ld)\n", r);
++		dev_err(adev->dev, "failed to clear page tables on GEM object close (%l=
d)\n",
++			r);
  	if (r || !fence)
  		goto out_unlock;
 =20

--Sig_/GcJb70x6Xj5jHq4d7Cvw41N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTAcnoACgkQAVBC80lX
0GzdbAgAgDrIqg6GLxXBvoD801tI5aVqEARno9PYvGQtHs9Udzhu6k7B8yiMfswn
xnovXnIyBf2OTzgzawjbN8pdAG2UC2bXQjZvOCykQutIqHRRBVJ/nLbNMd2bIdGG
1d9emDP5uFhf9vDldFkQfDqvvQEomE+hhlRJGG72W4FOg4j834X7JFFZmOsCN6sM
hsokD/iHbfFSdSqlZbSyGAZjdyXDfnaz1Wj1fDjLeeEkHi+sXKQtnMMDd7TSviEn
DXplwdQ48lpQD5baOMsCtQB3z7X/ahg1hmwxG7Z/3s2/wb5EgxT6p+1ay49YXfzN
757MBtlRPIkFp08pneBd6rjPVkcYZw==
=tN22
-----END PGP SIGNATURE-----

--Sig_/GcJb70x6Xj5jHq4d7Cvw41N--
