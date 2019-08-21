Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA9498816
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 01:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE81689306;
	Wed, 21 Aug 2019 23:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6592A89306;
 Wed, 21 Aug 2019 23:50:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46DPYS5Jxfz9sBp;
 Thu, 22 Aug 2019 09:50:36 +1000 (AEST)
Date: Thu, 22 Aug 2019 09:50:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the drm and
 drm-intel trees
Message-ID: <20190822095029.0fd063d4@canb.auug.org.au>
In-Reply-To: <20190814125433.20147fb7@canb.auug.org.au>
References: <20190814125433.20147fb7@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566431439;
 bh=0IxaCMguw7mIywx2R9a7SL80AVSgxKu3pkkK/b5qwxA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TUqqHRU+J1iZV3fNWXZP07Qzg9lMnPwa62+T+ObBT5uAb/2acuR9ml16pzMp1KFc6
 ZdsINKxsyvaf07NQwSStTjJBplOSxIczMLVZWW6K8cvu5v94s9p2XjYzedccXfvOoS
 At55wLFM0JL+nQCrQ7pnNcDe0nz+2WkYHv40gDRQYlRTvU4Cq0Rt6yjkvqQLAy0EFH
 kWy4F9U0sX9wKMDyt3Wghs7fJ4y5lq32ptvzHm7Nb5TU2zUEj536spgMsmeOhhsE8d
 Fwuq4hRr9jG7EUJb+XcbEEHjbmhuVW1xnzrDi7kAr4bbzhyXcBUMzxgUIRwn8C7oX8
 qwFZll2fRN+4g==
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
Content-Type: multipart/mixed; boundary="===============2113828358=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2113828358==
Content-Type: multipart/signed; boundary="Sig_/pqDYB7qH+83yIm0QxI/PxPA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pqDYB7qH+83yIm0QxI/PxPA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 14 Aug 2019 12:54:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>   drivers/gpu/drm/i915/i915_vma.c
>   drivers/gpu/drm/i915/i915_gem_batch_pool.c
>   drivers/gpu/drm/i915/gem/i915_gem_object.c
>   drivers/gpu/drm/i915/gt/intel_engine_pool.c
>=20
> between commits:
>=20
>   a93615f900bd ("drm/i915: Throw away the active object retirement comple=
xity")
>   12c255b5dad1 ("drm/i915: Provide an i915_active.acquire callback")
>   cd2a4eaf8c79 ("drm/i915: Report resv_obj allocation failure")
>   b40d73784ffc ("drm/i915: Replace struct_mutex for batch pool serialisat=
ion")
>   ab2f7a5c18b5 ("drm/amdgpu: Implement VRAM wipe on release")
>   0c159ffef628 ("drm/i915/gem: Defer obj->base.resv fini until RCU callba=
ck")
>=20
> from the drm and drm-intel trees and commit:
>=20
>   52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below and I added the following merge fix patch) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

So the parts of this that affected the drm tree are now fixed, but the
conflicts between the drm-intel and drm-misc trees are now between the
drm-intel and drm trees.

The added patch becomes:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Aug 2019 12:48:39 +1000
Subject: [PATCH] drm: fix up fallout from "dma-buf: rename reservation_obje=
ct to dma_resv"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/intel_engine_pool.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

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

I think the remaining merge resolution is:

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

--=20
Cheers,
Stephen Rothwell

--Sig_/pqDYB7qH+83yIm0QxI/PxPA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1d2MUACgkQAVBC80lX
0GzVkAf+NS5yNROpnuYKxJ9NZMqwpXSwX1Lp8xFoFus6j8tDOmh5EmqfTc1GYGPG
KEM6K0fwt917csvjAqIVZyg54e1EzOpUbhwX6VZ8dQ+FJ7WbxL3B0M6AKlvxUQ5f
WNWZzSvh5md42plUh795v0M2F4kBBIIL66HNR52Cd7J7HaEtIa+XXdbIn4FYbQk2
be7Z+ZNMqwypHzCorlneJHU18K6TcnoOF+LsiDG23xTXXx3j0lONPWGttvoSwlSw
jBnlQyiv04eowSaBGcS9ohBu+lsF+aWT6gdmAOhyEjPoTZwLhevQhX0r+OZBsWtT
it8Kp5BE7186KJcgnrlk6q0BY3VQLg==
=kiwf
-----END PGP SIGNATURE-----

--Sig_/pqDYB7qH+83yIm0QxI/PxPA--

--===============2113828358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2113828358==--
