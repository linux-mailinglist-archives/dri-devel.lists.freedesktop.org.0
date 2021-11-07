Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21941447647
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 23:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B779089DDF;
	Sun,  7 Nov 2021 22:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B99489DDF;
 Sun,  7 Nov 2021 22:31:25 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HnTVZ1jgRz4xd4;
 Mon,  8 Nov 2021 09:31:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1636324281;
 bh=9Z5GYdWA78hrsdCWSQ0i9WtTgQ98iIso88MZBedtccY=;
 h=Date:From:To:Cc:Subject:From;
 b=f3MuNWNv9vKPg87fW5H/sVmBgXMepxqtJOBGuVdmAMEAWTwU6iKdidcKY9sbGXMfy
 lUAIg0CM/CSahYfxUiI5gnc+uueJR0s0SPHUVx5VasIuvs4HWPIY5WubRSpbYpvJ2Z
 DgNSSkA7EiGGdxmuRf5kpXMwJRyfAO3WBgv7WjGbp3WkRdW9TtWO27zbg/xI8HJ/Vx
 G09fponfjEMjacfE7WzCW+M9fi2lt1Hjc+Ro5rzW42Djc6GxLP9yutSYz+afNi89bt
 M+bo3odiRZbb7Teejfcc5mgBXfLBcpWs0TiD9OkSvnKZseXQpD/n0yBPfmakqRE31s
 BVLvFcK08YL4Q==
Date: Mon, 8 Nov 2021 09:31:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with the origin tree
Message-ID: <20211108093114.12dde19b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xVuPQyygmteliXR405bmI+I";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xVuPQyygmteliXR405bmI+I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

between commit:

  9ae807f0ec6a ("drm/amdgpu: clean up inconsistent indenting")

from the origin tree and commit:

  0d979509539e ("drm/ttm: remove ttm_bo_vm_insert_huge()")

from the drm-misc tree.

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
index a573424a6e0b,a1e63ba4c54a..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@@ -60,9 -60,10 +60,9 @@@ static vm_fault_t amdgpu_gem_fault(stru
  			goto unlock;
  		}
 =20
 -		 ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 -						TTM_BO_VM_NUM_PREFAULT);
 -
 -		 drm_dev_exit(idx);
 +		ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
- 					       TTM_BO_VM_NUM_PREFAULT, 1);
++					       TTM_BO_VM_NUM_PREFAULT);
 +		drm_dev_exit(idx);
  	} else {
  		ret =3D ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
  	}

--Sig_/xVuPQyygmteliXR405bmI+I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGIU7IACgkQAVBC80lX
0GzmTAf9HYnSJ+9qZoiBiBmrkMU2I9mv4K1XRQmu/9ShHGdTV3/eb7ImO/q9HHOD
YAafVU6JOjuvNTTfouoM1o1CEhPuetF0wyTRYJI0QzJchrUsQlBhpff/SHcaNbfl
RzBbn+dAx+kRfqIBiYzBYuVI8xoov/5PhhsnxUnis0uz9XZP+40UDTBtrWkBFXu3
Oii5r+BsbIg0VBvpuvYi+9vA7RozQn957fL0OfXk4GhWHImTm0rucIHPsD9fwb3E
8zuAZfCIsXO86SQP8lV/R9qmYAT0KxJsmJdhAKdclSrpsTWqRxRyfhcQSVbKcfbs
UsiUr5FtMnVs7TR9ghnDG5CM0eDwdw==
=9aE7
-----END PGP SIGNATURE-----

--Sig_/xVuPQyygmteliXR405bmI+I--
