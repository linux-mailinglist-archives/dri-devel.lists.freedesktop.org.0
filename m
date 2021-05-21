Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C456F38BBAF
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 03:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C876F59D;
	Fri, 21 May 2021 01:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B822A6F59D;
 Fri, 21 May 2021 01:38:30 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmTlS1Z85z9sV5;
 Fri, 21 May 2021 11:38:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1621561108;
 bh=4Fb+1sWp4AEVdRzTjOYK4Ft+EIzJhCyYWl/H051C5Ks=;
 h=Date:From:To:Cc:Subject:From;
 b=Lao+G0QQ2gwqnbik/zz+3IYRZ7vr6ocxWUHHa7JdDmIf79+x1YKQpG+TB82PDv7Yn
 LSvMJrCGKhfZFKfWD9y475LyDXIiqxPxZMQOVfH6aH0bIYEMu7LmrESnmx6ZB777UD
 WRw0K1XWJjXCIXBrKzfqgb+2UwfBqZnzhB6w/ntNSeqfkjn0/Nma/GDX2hoytGz+AB
 vCJjSm5pkZpRT53a3ez4lMEzSEUa1i4E0qKqsHzB/jUrYAia0H5vz899ufYVXmgpwi
 GjHJVf0Rh6WdxRlB+t/dm98K2xHoOyZ05StGV/nVZhBkelWx4DjFIVSKOiQcDT7o/x
 OIqeBol0YRYaA==
Date: Fri, 21 May 2021 11:38:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20210521113827.675898b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oCpAwbq_zZh.NtAEmX83p3b";
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

--Sig_/oCpAwbq_zZh.NtAEmX83p3b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c

between commit:

  35bba8313b95 ("drm/amdgpu: Convert driver sysfs attributes to static attr=
ibutes")

from the drm-misc tree and commit:

  589939d40116 ("drm/amdgpu: fix coding style and documentation in amdgpu_v=
ram_mgr.c")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index a99d196b05df,a52e17ed3df6..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@@ -162,74 -181,6 +181,10 @@@ static struct attribute *amdgpu_vram_mg
  	NULL
  };
 =20
 +const struct attribute_group amdgpu_vram_mgr_attr_group =3D {
 +	.attrs =3D amdgpu_vram_mgr_attributes
 +};
 +
- static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
-=20
- /**
-  * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
-  *
-  * @adev: amdgpu_device pointer
-  *
-  * Allocate and initialize the VRAM manager.
-  */
- int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
- {
- 	struct amdgpu_vram_mgr *mgr =3D &adev->mman.vram_mgr;
- 	struct ttm_resource_manager *man =3D &mgr->manager;
-=20
- 	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
-=20
- 	man->func =3D &amdgpu_vram_mgr_func;
-=20
- 	drm_mm_init(&mgr->mm, 0, man->size);
- 	spin_lock_init(&mgr->lock);
- 	INIT_LIST_HEAD(&mgr->reservations_pending);
- 	INIT_LIST_HEAD(&mgr->reserved_pages);
-=20
- 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
- 	ttm_resource_manager_set_used(man, true);
- 	return 0;
- }
-=20
- /**
-  * amdgpu_vram_mgr_fini - free and destroy VRAM manager
-  *
-  * @adev: amdgpu_device pointer
-  *
-  * Destroy and free the VRAM manager, returns -EBUSY if ranges are still
-  * allocated inside it.
-  */
- void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
- {
- 	struct amdgpu_vram_mgr *mgr =3D &adev->mman.vram_mgr;
- 	struct ttm_resource_manager *man =3D &mgr->manager;
- 	int ret;
- 	struct amdgpu_vram_reservation *rsv, *temp;
-=20
- 	ttm_resource_manager_set_used(man, false);
-=20
- 	ret =3D ttm_resource_manager_evict_all(&adev->mman.bdev, man);
- 	if (ret)
- 		return;
-=20
- 	spin_lock(&mgr->lock);
- 	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
- 		kfree(rsv);
-=20
- 	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
- 		drm_mm_remove_node(&rsv->mm_node);
- 		kfree(rsv);
- 	}
- 	drm_mm_takedown(&mgr->mm);
- 	spin_unlock(&mgr->lock);
-=20
- 	ttm_resource_manager_cleanup(man);
- 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
- }
-=20
  /**
   * amdgpu_vram_mgr_vis_size - Calculate visible node size
   *
@@@ -444,10 -396,10 +400,10 @@@ static int amdgpu_vram_mgr_new(struct t
  		pages_per_node =3D HPAGE_PMD_NR;
  #else
  		/* default to 2MB */
- 		pages_per_node =3D (2UL << (20UL - PAGE_SHIFT));
+ 		pages_per_node =3D 2UL << (20UL - PAGE_SHIFT);
  #endif
- 		pages_per_node =3D max((uint32_t)pages_per_node,
- 				     tbo->page_alignment);
+ 		pages_per_node =3D max_t(uint32_t, pages_per_node,
 -				       mem->page_alignment);
++				       tbo->page_alignment);
  		num_nodes =3D DIV_ROUND_UP(mem->num_pages, pages_per_node);
  	}
 =20
@@@ -465,38 -417,29 +421,29 @@@
  	mem->start =3D 0;
  	pages_left =3D mem->num_pages;
 =20
- 	spin_lock(&mgr->lock);
- 	for (i =3D 0; pages_left >=3D pages_per_node; ++i) {
- 		unsigned long pages =3D rounddown_pow_of_two(pages_left);
-=20
- 		/* Limit maximum size to 2GB due to SG table limitations */
- 		pages =3D min(pages, (2UL << (30 - PAGE_SHIFT)));
-=20
- 		r =3D drm_mm_insert_node_in_range(mm, &nodes[i], pages,
- 						pages_per_node, 0,
- 						place->fpfn, lpfn,
- 						mode);
- 		if (unlikely(r))
- 			break;
-=20
- 		vis_usage +=3D amdgpu_vram_mgr_vis_size(adev, &nodes[i]);
- 		amdgpu_vram_mgr_virt_start(mem, &nodes[i]);
- 		pages_left -=3D pages;
- 	}
+ 	/* Limit maximum size to 2GB due to SG table limitations */
+ 	pages =3D min(pages_left, 2UL << (30 - PAGE_SHIFT));
 =20
- 	for (; pages_left; ++i) {
- 		unsigned long pages =3D min(pages_left, pages_per_node);
+ 	i =3D 0;
+ 	spin_lock(&mgr->lock);
+ 	while (pages_left) {
 -		uint32_t alignment =3D mem->page_alignment;
 +		uint32_t alignment =3D tbo->page_alignment;
 =20
- 		if (pages =3D=3D pages_per_node)
+ 		if (pages >=3D pages_per_node)
  			alignment =3D pages_per_node;
 =20
- 		r =3D drm_mm_insert_node_in_range(mm, &nodes[i],
- 						pages, alignment, 0,
- 						place->fpfn, lpfn,
- 						mode);
- 		if (unlikely(r))
+ 		r =3D drm_mm_insert_node_in_range(mm, &nodes[i], pages, alignment,
+ 						0, place->fpfn, lpfn, mode);
+ 		if (unlikely(r)) {
+ 			if (pages > pages_per_node) {
+ 				if (is_power_of_2(pages))
+ 					pages =3D pages / 2;
+ 				else
+ 					pages =3D rounddown_pow_of_two(pages);
+ 				continue;
+ 			}
  			goto error;
+ 		}
 =20
  		vis_usage +=3D amdgpu_vram_mgr_vis_size(adev, &nodes[i]);
  		amdgpu_vram_mgr_virt_start(mem, &nodes[i]);
@@@ -724,3 -672,73 +676,65 @@@ static const struct ttm_resource_manage
  	.free	=3D amdgpu_vram_mgr_del,
  	.debug	=3D amdgpu_vram_mgr_debug
  };
+=20
+ /**
+  * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
+  *
+  * @adev: amdgpu_device pointer
+  *
+  * Allocate and initialize the VRAM manager.
+  */
+ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
+ {
+ 	struct amdgpu_vram_mgr *mgr =3D &adev->mman.vram_mgr;
+ 	struct ttm_resource_manager *man =3D &mgr->manager;
 -	int ret;
+=20
+ 	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
+=20
+ 	man->func =3D &amdgpu_vram_mgr_func;
+=20
+ 	drm_mm_init(&mgr->mm, 0, man->size);
+ 	spin_lock_init(&mgr->lock);
+ 	INIT_LIST_HEAD(&mgr->reservations_pending);
+ 	INIT_LIST_HEAD(&mgr->reserved_pages);
+=20
 -	/* Add the two VRAM-related sysfs files */
 -	ret =3D sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 -	if (ret)
 -		DRM_ERROR("Failed to register sysfs\n");
 -
+ 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
+ 	ttm_resource_manager_set_used(man, true);
+ 	return 0;
+ }
+=20
+ /**
+  * amdgpu_vram_mgr_fini - free and destroy VRAM manager
+  *
+  * @adev: amdgpu_device pointer
+  *
+  * Destroy and free the VRAM manager, returns -EBUSY if ranges are still
+  * allocated inside it.
+  */
+ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
+ {
+ 	struct amdgpu_vram_mgr *mgr =3D &adev->mman.vram_mgr;
+ 	struct ttm_resource_manager *man =3D &mgr->manager;
+ 	int ret;
+ 	struct amdgpu_vram_reservation *rsv, *temp;
+=20
+ 	ttm_resource_manager_set_used(man, false);
+=20
+ 	ret =3D ttm_resource_manager_evict_all(&adev->mman.bdev, man);
+ 	if (ret)
+ 		return;
+=20
+ 	spin_lock(&mgr->lock);
+ 	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
+ 		kfree(rsv);
+=20
+ 	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
+ 		drm_mm_remove_node(&rsv->mm_node);
+ 		kfree(rsv);
+ 	}
+ 	drm_mm_takedown(&mgr->mm);
+ 	spin_unlock(&mgr->lock);
+=20
 -	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
 -
+ 	ttm_resource_manager_cleanup(man);
+ 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
+ }

--Sig_/oCpAwbq_zZh.NtAEmX83p3b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnDxMACgkQAVBC80lX
0GyKLQgAiPeALS3dRJg5R/+nn69plxC99oU6C/fOultRYw0tP1km0eSIYgQJfPQ7
Oqh7ABsnY8oXd/cdUK2tqFm+hGlbv0ovpAof1QSIghel2CCUIaJU8OBNOkKJzmgt
o3lP8iXWxYwvekYIjCK3qETzamW3jo+h7lpQKHr5Zp3J4cUXlDSVmbS8f6MjaYrc
xSHWVKwB4Ye67Lh78BPi1cyuUC+p8LyXlZrMdR47ehzGP+xNvg8FYpIgPcy/pF3T
rEBgMs+PFrnJx4x6y9Ehwb1CUL3yOAR7xFAG1RMvshvO7lcHp2Dl2aFT6rIIJB4H
SNge7yo0aprgG03AImH2lTKgd8objw==
=g5ja
-----END PGP SIGNATURE-----

--Sig_/oCpAwbq_zZh.NtAEmX83p3b--
