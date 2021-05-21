Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414238BB6E
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 03:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E466F58A;
	Fri, 21 May 2021 01:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2B46F58A;
 Fri, 21 May 2021 01:16:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmTG80RMQz9sV5;
 Fri, 21 May 2021 11:16:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1621559793;
 bh=0WNkIgrA5cfmh3dmtALKkENB1bfAKE9i33zwcoPdfNE=;
 h=Date:From:To:Cc:Subject:From;
 b=naCHoUABSw8zQLb3bEhbRCRnS5kjvp2zFRi5996J338KmrLaOpEZ4Vajaq+XBrq2/
 HaITpAVVYsZMtFLd2qZuaQfIeANZtVAHAeDIqf8XOU1ntu7DRaD/MGa3KAT/FO7fCy
 gT974IUryYPpxWR9LRO5AXgtroikkExXyMtO9MZgWfVLZR6AmRvdTOZfGcJNs2iQ9r
 hb+l56TkvayW+/9LViPn+jwt2dT2dP5Z5go5xjp2+s5KsDPFtdYJmk5ST0xT8ByFfn
 IC1RcjEqSQr77qkhsCilDsFBd02o1aIUezVEM00985l+9Fa0hCy9LAeFmSs3HN9T5s
 x7t9zUL5FMpjQ==
Date: Fri, 21 May 2021 11:16:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20210521111631.76bc1636@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GIQsj9oI_7T=LGV07W5ScTp";
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/GIQsj9oI_7T=LGV07W5ScTp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c

between commit:

  35bba8313b95 ("drm/amdgpu: Convert driver sysfs attributes to static attr=
ibutes")

from the drm-misc tree and commit:

  a614b336f1c1 ("drm/amdgpu: fix coding style and documentation in amdgpu_g=
tt_mgr.c")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index a4404da8ca6d,8860545344c7..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@@ -75,75 -80,6 +80,16 @@@ static DEVICE_ATTR(mem_info_gtt_total,=20
  static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
  	           amdgpu_mem_info_gtt_used_show, NULL);
 =20
 +static struct attribute *amdgpu_gtt_mgr_attributes[] =3D {
 +	&dev_attr_mem_info_gtt_total.attr,
 +	&dev_attr_mem_info_gtt_used.attr,
 +	NULL
 +};
 +
 +const struct attribute_group amdgpu_gtt_mgr_attr_group =3D {
 +	.attrs =3D amdgpu_gtt_mgr_attributes
 +};
 +
- static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
- /**
-  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
-  *
-  * @adev: amdgpu_device pointer
-  * @gtt_size: maximum size of GTT
-  *
-  * Allocate and initialize the GTT manager.
-  */
- int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
- {
- 	struct amdgpu_gtt_mgr *mgr =3D &adev->mman.gtt_mgr;
- 	struct ttm_resource_manager *man =3D &mgr->manager;
- 	uint64_t start, size;
-=20
- 	man->use_tt =3D true;
- 	man->func =3D &amdgpu_gtt_mgr_func;
-=20
- 	ttm_resource_manager_init(man, gtt_size >> PAGE_SHIFT);
-=20
- 	start =3D AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
- 	size =3D (adev->gmc.gart_size >> PAGE_SHIFT) - start;
- 	drm_mm_init(&mgr->mm, start, size);
- 	spin_lock_init(&mgr->lock);
- 	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
-=20
- 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
- 	ttm_resource_manager_set_used(man, true);
- 	return 0;
- }
-=20
- /**
-  * amdgpu_gtt_mgr_fini - free and destroy GTT manager
-  *
-  * @adev: amdgpu_device pointer
-  *
-  * Destroy and free the GTT manager, returns -EBUSY if ranges are still
-  * allocated inside it.
-  */
- void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
- {
- 	struct amdgpu_gtt_mgr *mgr =3D &adev->mman.gtt_mgr;
- 	struct ttm_resource_manager *man =3D &mgr->manager;
- 	int ret;
-=20
- 	ttm_resource_manager_set_used(man, false);
-=20
- 	ret =3D ttm_resource_manager_evict_all(&adev->mman.bdev, man);
- 	if (ret)
- 		return;
-=20
- 	spin_lock(&mgr->lock);
- 	drm_mm_takedown(&mgr->mm);
- 	spin_unlock(&mgr->lock);
-=20
- 	ttm_resource_manager_cleanup(man);
- 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
- }
-=20
  /**
   * amdgpu_gtt_mgr_has_gart_addr - Check if mem has address space
   *
@@@ -306,3 -249,76 +259,61 @@@ static const struct ttm_resource_manage
  	.free =3D amdgpu_gtt_mgr_del,
  	.debug =3D amdgpu_gtt_mgr_debug
  };
+=20
+ /**
+  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
+  *
+  * @adev: amdgpu_device pointer
+  * @gtt_size: maximum size of GTT
+  *
+  * Allocate and initialize the GTT manager.
+  */
+ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
+ {
+ 	struct amdgpu_gtt_mgr *mgr =3D &adev->mman.gtt_mgr;
+ 	struct ttm_resource_manager *man =3D &mgr->manager;
+ 	uint64_t start, size;
 -	int ret;
+=20
+ 	man->use_tt =3D true;
+ 	man->func =3D &amdgpu_gtt_mgr_func;
+=20
+ 	ttm_resource_manager_init(man, gtt_size >> PAGE_SHIFT);
+=20
+ 	start =3D AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
+ 	size =3D (adev->gmc.gart_size >> PAGE_SHIFT) - start;
+ 	drm_mm_init(&mgr->mm, start, size);
+ 	spin_lock_init(&mgr->lock);
+ 	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
+=20
 -	ret =3D device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
 -	if (ret) {
 -		DRM_ERROR("Failed to create device file mem_info_gtt_total\n");
 -		return ret;
 -	}
 -	ret =3D device_create_file(adev->dev, &dev_attr_mem_info_gtt_used);
 -	if (ret) {
 -		DRM_ERROR("Failed to create device file mem_info_gtt_used\n");
 -		return ret;
 -	}
 -
+ 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
+ 	ttm_resource_manager_set_used(man, true);
+ 	return 0;
+ }
+=20
+ /**
+  * amdgpu_gtt_mgr_fini - free and destroy GTT manager
+  *
+  * @adev: amdgpu_device pointer
+  *
+  * Destroy and free the GTT manager, returns -EBUSY if ranges are still
+  * allocated inside it.
+  */
+ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
+ {
+ 	struct amdgpu_gtt_mgr *mgr =3D &adev->mman.gtt_mgr;
+ 	struct ttm_resource_manager *man =3D &mgr->manager;
+ 	int ret;
+=20
+ 	ttm_resource_manager_set_used(man, false);
+=20
+ 	ret =3D ttm_resource_manager_evict_all(&adev->mman.bdev, man);
+ 	if (ret)
+ 		return;
+=20
+ 	spin_lock(&mgr->lock);
+ 	drm_mm_takedown(&mgr->mm);
+ 	spin_unlock(&mgr->lock);
+=20
 -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
 -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
 -
+ 	ttm_resource_manager_cleanup(man);
+ 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
+ }

--Sig_/GIQsj9oI_7T=LGV07W5ScTp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnCe8ACgkQAVBC80lX
0GwKIwgAhjuZMVGTmOGOWLUbWqTbS90TLgG+5O1tgSLqsHhxQuJ7OuX2TXivSEQ9
7WrzDwBVJOtEsz0mBk02/XHYjBW/mdpSCjb0so92d3GnIC+FtSeztwbl5dY5jgur
CnKWE0QI7V/z9ckGH+cgfgUE3QNgzjRzLdTjebRn5pKYP4gh1FWujBCS3g96BK3U
EEBjRtSwWiccwejdjbqZz/gfhWX+jJ/m/bH6N3J5stYUINgY9hyH8fVSw2z8PgrX
kFWRirmVbGAu6KCG7W2qLT5yha/jA9im7m28mXh616v6wY0YFCxWdRnmH8CnCAIp
r6hNVjLCvObBYMS2c7Mux4H08qF6Dw==
=3Byw
-----END PGP SIGNATURE-----

--Sig_/GIQsj9oI_7T=LGV07W5ScTp--
