Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBBD8C9BE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 04:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FF86E22A;
	Wed, 14 Aug 2019 02:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F54F6E21A;
 Wed, 14 Aug 2019 02:54:40 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467Z1Q3Zrpz9sN1;
 Wed, 14 Aug 2019 12:54:33 +1000 (AEST)
Date: Wed, 14 Aug 2019 12:54:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm and
 drm-intel trees
Message-ID: <20190814125433.20147fb7@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1565751277;
 bh=pnshXtAEAaY0k7nVDf7DTgaFW2krmKG1q4o+k+yvbPU=;
 h=Date:From:To:Cc:Subject:From;
 b=MSegR/AvH8/o79fAuMHcrDSCK/M0pb7KnAPJrpbAhsRVGeefdLNr65v7lVcMMN7Tc
 K0U6s5L054IPTsOQx2oF2mFGgeUUPIPjB2Qj0PB/KmqzCVsKtfrEjerSLA/cP+u7UV
 Qd22ZgjS7P87zqDepi6oWCotZdhYFk8Idl092FKrkRbWClQ2LSI/IVXzughxycRZjx
 yOmjRxPH29ZnecSXbtGuIef5VwPFMmTBq+On4ksUnrJg+hYrjIOvMYeEToUgUv4pCA
 ur6UaFfbKlWaskzrN+NxaWSY/8mPmc0auEHWSgm+21C6wQ6qaMFZ9K/10B5tx6zFYl
 p2ID6CZetpwSA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============2082232839=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2082232839==
Content-Type: multipart/signed; boundary="Sig_/07c9HVqAookgL3hIp9iskP4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/07c9HVqAookgL3hIp9iskP4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
  drivers/gpu/drm/i915/i915_vma.c
  drivers/gpu/drm/i915/i915_gem_batch_pool.c
  drivers/gpu/drm/i915/gem/i915_gem_object.c
  drivers/gpu/drm/i915/gt/intel_engine_pool.c

between commits:

  a93615f900bd ("drm/i915: Throw away the active object retirement complexi=
ty")
  12c255b5dad1 ("drm/i915: Provide an i915_active.acquire callback")
  cd2a4eaf8c79 ("drm/i915: Report resv_obj allocation failure")
  b40d73784ffc ("drm/i915: Replace struct_mutex for batch pool serialisatio=
n")
  ab2f7a5c18b5 ("drm/amdgpu: Implement VRAM wipe on release")
  0c159ffef628 ("drm/i915/gem: Defer obj->base.resv fini until RCU callback=
")

from the drm and drm-intel trees and commit:

  52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")

from the drm-misc tree.

I fixed it up (see below and I added the following merge fix patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Aug 2019 12:48:39 +1000
Subject: [PATCH] drm: fix up fallout from "dma-buf: rename reservation_obje=
ct to dma_resv"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c  | 2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pool.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_object.c
index dfd4aa68c806..6ebe61e14f29 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1242,7 +1242,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_objec=
t *bo)
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
 		return;
=20
-	reservation_object_lock(bo->base.resv, NULL);
+	dma_resv_lock(bo->base.resv, NULL);
=20
 	r =3D amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
 	if (!WARN_ON(r)) {
@@ -1250,7 +1250,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_objec=
t *bo)
 		dma_fence_put(fence);
 	}
=20
-	reservation_object_unlock(bo->base.resv);
+	dma_resv_unlock(bo->base.resv);
 }
=20
 /**
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i=
915/gem/i915_gem_object.c
index 3929c3a6b281..67dc61e02c9f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -154,7 +154,7 @@ static void __i915_gem_free_object_rcu(struct rcu_head =
*head)
 		container_of(head, typeof(*obj), rcu);
 	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
=20
-	reservation_object_fini(&obj->base._resv);
+	dma_resv_fini(&obj->base._resv);
 	i915_gem_object_free(obj);
=20
 	GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pool.c b/drivers/gpu/drm/=
i915/gt/intel_engine_pool.c
index 03d90b49584a..4cd54c569911 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pool.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pool.c
@@ -43,12 +43,12 @@ static int pool_active(struct i915_active *ref)
 {
 	struct intel_engine_pool_node *node =3D
 		container_of(ref, typeof(*node), active);
-	struct reservation_object *resv =3D node->obj->base.resv;
+	struct dma_resv *resv =3D node->obj->base.resv;
 	int err;
=20
-	if (reservation_object_trylock(resv)) {
-		reservation_object_add_excl_fence(resv, NULL);
-		reservation_object_unlock(resv);
+	if (dma_resv_trylock(resv)) {
+		dma_resv_add_excl_fence(resv, NULL);
+		dma_resv_unlock(resv);
 	}
=20
 	err =3D i915_gem_object_pin_pages(node->obj);
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_vma.c
index 8be1bbef40e5,ebfd03d117cd..000000000000
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@@ -911,21 -951,16 +911,21 @@@ int i915_vma_move_to_active(struct i915
  		if (intel_fb_obj_invalidate(obj, ORIGIN_CS))
  			__i915_active_request_set(&obj->frontbuffer_write, rq);
 =20
- 		reservation_object_add_excl_fence(vma->resv, &rq->fence);
++		dma_resv_add_excl_fence(vma->resv, &rq->fence);
 +		obj->write_domain =3D I915_GEM_DOMAIN_RENDER;
  		obj->read_domains =3D 0;
 +	} else {
- 		err =3D reservation_object_reserve_shared(vma->resv, 1);
++		err =3D dma_resv_reserve_shared(vma->resv, 1);
 +		if (unlikely(err))
 +			return err;
 +
- 		reservation_object_add_shared_fence(vma->resv, &rq->fence);
++		dma_resv_add_shared_fence(vma->resv, &rq->fence);
 +		obj->write_domain =3D 0;
  	}
  	obj->read_domains |=3D I915_GEM_GPU_DOMAINS;
 +	obj->mm.dirty =3D true;
 =20
 -	if (flags & EXEC_OBJECT_NEEDS_FENCE)
 -		__i915_active_request_set(&vma->last_fence, rq);
 -
 -	export_fence(vma, rq, flags);
 +	GEM_BUG_ON(!i915_vma_is_active(vma));
  	return 0;
  }
 =20

--Sig_/07c9HVqAookgL3hIp9iskP4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Td+kACgkQAVBC80lX
0GzU8Af+KtbzLAIC/g1NfEN0dDKWUtuerpCRsRNbqfG6sDdQaN3xyMD+BdWzifLn
zeNEae4NDLy36jPsJv7QJw+Xb/HMR6y9BvkFhxTbDy80zTHH4BW/SVVES0f8IhQg
24xVCazCBmRJgTef5zatUtI4rB0angmBlwgzc+lfV6gaeyRuoWk26mhu3nyxJ9DI
CCpVYufENS8B2esIU8GIwT/xBqrvOFGO7HpfAxhPmmqIjNGbeu8K/dE2acMBaOBl
bTCTNH6lVp2H7Mj0UP1ZHyfAmTWhjX2bBKux5o0wI/3GpdMSsvX3hJZaH/VsjB2S
K6ZPgpDbByYUBytWShudc35FDA93lA==
=tx55
-----END PGP SIGNATURE-----

--Sig_/07c9HVqAookgL3hIp9iskP4--

--===============2082232839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2082232839==--
