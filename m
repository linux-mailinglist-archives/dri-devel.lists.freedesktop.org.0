Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E3339B06C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 04:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0356F565;
	Fri,  4 Jun 2021 02:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8175E6F565;
 Fri,  4 Jun 2021 02:33:15 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fx6J66Q5gz9s24;
 Fri,  4 Jun 2021 12:33:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1622773993;
 bh=PI/M/29Ock5JHzx2zr66W++GeZ/U0IKD0LbQp0JwrXU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tS0GnyhRUyMX7YkKooRxu4MD0k2C8Yr8GOOdkrrI7lN0UR9zA6HVu5xEI6BZVDhpz
 kiqH0osXpGTdPRvMW6rSnt6iYlOnteYDzU7r95vLwHb2prnU3RTRkHfx94GotArtH1
 Po/+4445iECQnlLUdewS2OQrgt/NnwoszzAeTQy5IlZf1ttyPye/UQXJ0uHMUxBPzM
 V8cObkW5OGbK8AjRLeBl19uhcfwYRafbKTqJawH2Rm1VS/aMUHT3aGeZSfS9jaV9K5
 SoOIXMpD3WRR51Mtme4a+hJmJVBFTSQda8dsWLwD3/6IYv3Wmn0yVRN6lGIQe9+qrl
 fvsUb+R6DI8qg==
Date: Fri, 4 Jun 2021 12:33:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20210604123309.2e5b546a@canb.auug.org.au>
In-Reply-To: <20210603124847.19a6dacf@canb.auug.org.au>
References: <20210603124847.19a6dacf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yECzrtYfgiiWPQ5yqoFW6qz";
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yECzrtYfgiiWPQ5yqoFW6qz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Jun 2021 12:48:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the amdgpu tree got conflicts in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>=20
> between commit:
>=20
>   d3116756a710 ("drm/ttm: rename bo->mem and make it a pointer")
>=20
> from the drm-misc tree and commits:
>=20
>   b453e42a6e8b ("drm/amdgpu: Add new placement for preemptible SG BOs")
>   2a675640bc2d ("drm/amdgpu: move shadow bo validation to VM code")
>   59276f056fb7 ("drm/amdgpu: switch to amdgpu_bo_vm for vm code")
>   19a1d9350be6 ("drm/amdgpu: flush gart changes after all BO recovery")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 663aa7d2e2ea,86259435803e..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@@ -459,10 -479,11 +461,11 @@@ static int amdgpu_bo_move(struct ttm_bu
>   {
>   	struct amdgpu_device *adev;
>   	struct amdgpu_bo *abo;
>  -	struct ttm_resource *old_mem =3D &bo->mem;
>  +	struct ttm_resource *old_mem =3D bo->resource;
>   	int r;
>  =20
> - 	if (new_mem->mem_type =3D=3D TTM_PL_TT) {
> + 	if (new_mem->mem_type =3D=3D TTM_PL_TT ||
> + 	    new_mem->mem_type =3D=3D AMDGPU_PL_PREEMPT) {
>   		r =3D amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
>   		if (r)
>   			return r;
> @@@ -989,8 -1012,9 +995,9 @@@ int amdgpu_ttm_alloc_gart(struct ttm_bu
>   			return r;
>   		}
>  =20
> + 		amdgpu_gart_invalidate_tlb(adev);
>  -		ttm_resource_free(bo, &bo->mem);
>  -		bo->mem =3D tmp;
>  +		ttm_resource_free(bo, bo->resource);
>  +		ttm_bo_assign_mem(bo, &tmp);
>   	}
>  =20
>   	return 0;
> @@@ -1348,7 -1373,16 +1356,16 @@@ static bool amdgpu_ttm_bo_eviction_valu
>   		}
>   	}
>  =20
>  -	switch (bo->mem.mem_type) {
>  +	switch (bo->resource->mem_type) {
> + 	case AMDGPU_PL_PREEMPT:
> + 		/* Preemptible BOs don't own system resources managed by the
> + 		 * driver (pages, VRAM, GART space). They point to resources
> + 		 * owned by someone else (e.g. pageable memory in user mode
> + 		 * or a DMABuf). They are used in a preemptible context so we
> + 		 * can guarantee no deadlocks and good QoS in case of MMU
> + 		 * notifiers or DMABuf move notifiers from the resource owner.
> + 		 */
> + 		return false;
>   	case TTM_PL_TT:
>   		if (amdgpu_bo_is_amdgpu_bo(bo) &&
>   		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
> @@@ -1767,8 -1809,13 +1791,9 @@@ void amdgpu_ttm_fini(struct amdgpu_devi
>   	amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
>   	amdgpu_ttm_fw_reserve_vram_fini(adev);
>  =20
>  -	if (adev->mman.aper_base_kaddr)
>  -		iounmap(adev->mman.aper_base_kaddr);
>  -	adev->mman.aper_base_kaddr =3D NULL;
>  -
>   	amdgpu_vram_mgr_fini(adev);
>   	amdgpu_gtt_mgr_fini(adev);
> + 	amdgpu_preempt_mgr_fini(adev);
>   	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
>   	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GWS);
>   	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_OA);
> @@@ -1919,7 -2010,12 +1944,12 @@@ int amdgpu_fill_buffer(struct amdgpu_b
>   		return -EINVAL;
>   	}
>  =20
>  -	if (bo->tbo.mem.mem_type =3D=3D AMDGPU_PL_PREEMPT) {
> ++	if (bo->tbo.resource->mem_type =3D=3D AMDGPU_PL_PREEMPT) {
> + 		DRM_ERROR("Trying to clear preemptible memory.\n");
> + 		return -EINVAL;
> + 	}
> +=20
>  -	if (bo->tbo.mem.mem_type =3D=3D TTM_PL_TT) {
>  +	if (bo->tbo.resource->mem_type =3D=3D TTM_PL_TT) {
>   		r =3D amdgpu_ttm_alloc_gart(&bo->tbo);
>   		if (r)
>   			return r;
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index bcfd4a8d0288,1923f035713a..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@@ -657,11 -657,10 +658,11 @@@ void amdgpu_vm_move_to_lru_tail(struct=20
>   		if (!bo->parent)
>   			continue;
>  =20
>  -		ttm_bo_move_to_lru_tail(&bo->tbo, &bo->tbo.mem,
>  +		ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
>   					&vm->lru_bulk_move);
> - 		if (bo->shadow)
> - 			ttm_bo_move_to_lru_tail(&bo->shadow->tbo,
> + 		if (shadow)
>  -			ttm_bo_move_to_lru_tail(&shadow->tbo, &shadow->tbo.mem,
> ++			ttm_bo_move_to_lru_tail(&shadow->tbo,
>  +						shadow->tbo.resource,
>   						&vm->lru_bulk_move);
>   	}
>   	spin_unlock(&adev->mman.bdev.lru_lock);
> @@@ -1818,11 -1853,12 +1859,12 @@@ int amdgpu_vm_bo_update(struct amdgpu_d
>   			struct drm_gem_object *gobj =3D dma_buf->priv;
>   			struct amdgpu_bo *abo =3D gem_to_amdgpu_bo(gobj);
>  =20
>  -			if (abo->tbo.mem.mem_type =3D=3D TTM_PL_VRAM)
>  +			if (abo->tbo.resource->mem_type =3D=3D TTM_PL_VRAM)
>   				bo =3D gem_to_amdgpu_bo(gobj);
>   		}
>  -		mem =3D &bo->tbo.mem;
>  +		mem =3D bo->tbo.resource;
> - 		if (mem->mem_type =3D=3D TTM_PL_TT)
> + 		if (mem->mem_type =3D=3D TTM_PL_TT ||
> + 		    mem->mem_type =3D=3D AMDGPU_PL_PREEMPT)
>   			pages_addr =3D bo->tbo.ttm->dma_address;
>   	}
>  =20

This is now a conflict between the drm-misc tree and the drm tree.

(I fixed up the resolution above)

--=20
Cheers,
Stephen Rothwell

--Sig_/yECzrtYfgiiWPQ5yqoFW6qz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC5kOUACgkQAVBC80lX
0GwEiAf/VGcAUYUYLioC3aoowvJpGA8nk3tWS96lNH3jMLTFMMSBkypojeycWOSN
Mo2EWWOMmr2YQFQ1mq7QHBZINzPo65Kji3y5s3dqMAtMSQtZW05c/D78nHJvmjf1
IBG/JFS/XQRkl33n8eQaekSSRvc0Fz+vLaBQCWcMVE9dTnZ5vGcZC/S2V32cpTj1
x5WizJeAN9gJyg7v98tPETlYQSTtQ1vioepYpzvGrxSe4g4AxXs1Wv1kuu+kIc1i
9IVAfKb9n+FBfaW+Obyw1hrLSQ4bpp/ejI76uNNdqGI6EcGCEUm3VphwJ+HE26gu
5zGWLzlPJWpMoDM1qGc9pIIMnkTEgQ==
=dudl
-----END PGP SIGNATURE-----

--Sig_/yECzrtYfgiiWPQ5yqoFW6qz--
