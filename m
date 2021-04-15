Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE73608F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 14:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738976EA49;
	Thu, 15 Apr 2021 12:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ED16E183;
 Thu, 15 Apr 2021 12:11:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95DFEAF4F;
 Thu, 15 Apr 2021 12:11:11 +0000 (UTC)
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Implement mmap as GEM object function
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
References: <20210415101740.21847-1-tzimmermann@suse.de>
 <20210415101740.21847-3-tzimmermann@suse.de>
 <a62230ca-a800-20b9-01bb-c74dd19ef412@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ceb6e5df-25ba-a31b-5a24-44a7bb964009@suse.de>
Date: Thu, 15 Apr 2021 14:11:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a62230ca-a800-20b9-01bb-c74dd19ef412@amd.com>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1837933900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1837933900==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pmMjG4wVVuKWNJE59kdLozS885YbW0iSk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pmMjG4wVVuKWNJE59kdLozS885YbW0iSk
Content-Type: multipart/mixed; boundary="yhoBttp0rv0llyX1xoE8kdZAdSPTqSirv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Message-ID: <ceb6e5df-25ba-a31b-5a24-44a7bb964009@suse.de>
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Implement mmap as GEM object function
References: <20210415101740.21847-1-tzimmermann@suse.de>
 <20210415101740.21847-3-tzimmermann@suse.de>
 <a62230ca-a800-20b9-01bb-c74dd19ef412@amd.com>
In-Reply-To: <a62230ca-a800-20b9-01bb-c74dd19ef412@amd.com>

--yhoBttp0rv0llyX1xoE8kdZAdSPTqSirv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.04.21 um 13:38 schrieb Christian K=C3=B6nig:
> Am 15.04.21 um 12:17 schrieb Thomas Zimmermann:
>> Moving the driver-specific mmap code into a GEM object function allows=

>> for using DRM helpers for various mmap callbacks.
>>
>> This change resolves several inconsistencies between regular mmap and
>> prime-based mmap. The vm_ops field in vma is now set for all mmap'ed
>> areas. Previously it way only set for regular mmap calls, prime-based
>> mmap used TTM's default vm_ops. The function amdgpu_verify_access() is=

>> no longer being called and therefore removed by this patch.
>>
>> As a side effect, amdgpu_ttm_vm_ops and amdgpu_ttm_fault() are now
>> implemented in amdgpu's GEM code.
>>
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* rename amdgpu_ttm_vm_ops and amdgpu_ttm_faul=
t() to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_gem_vm_ops and amdgpu_gem_fault(=
) (Christian)
>> =C2=A0=C2=A0=C2=A0=C2=A0* the check for kfd_bo has meanwhile been remo=
ved
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> [SNIP]
>> +static int amdgpu_gem_prime_mmap(struct drm_gem_object *obj, struct=20
>> vm_area_struct *vma)
>> +{
>=20
> Mhm, just double checking this function is now a core GEM function and =

> not prime specific?
>=20
> If yes maybe drop the _prime part.

No problem, but other functions in the GEM callbacks are also named=20
_prime_. Probably needs a clean-up.

>=20
>> +=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
>> +=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo-=
>tbo.bdev);
>> +=C2=A0=C2=A0=C2=A0 unsigned long asize =3D amdgpu_bo_size(bo);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!vma->vm_file)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!adev)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Check for valid size. */
>> +=C2=A0=C2=A0=C2=A0 if (asize < vma->vm_end - vma->vm_start)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>=20
> Shouldn't we have that check in the common code?

It's at [1]. I didn't really bother about tidying up the checks=20
themselves. We can drop all these except for the usermm branch below.=20
Same for the radeon patch.

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/v5.12-rc7/source/drivers/gpu/drm/drm_gem=
=2Ec#L1059

>=20
> Apart from that looks good to me.
>=20
> Christian.
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (bo->flags & AMDGPU_GEM_CR=
EATE_NO_CPU_ACCESS)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPERM;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return drm_gem_ttm_mmap(obj, vma);
>> +}
>> +
>> =C2=A0 static const struct drm_gem_object_funcs amdgpu_gem_object_func=
s =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .free =3D amdgpu_gem_object_free,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .open =3D amdgpu_gem_object_open,
>> @@ -212,6 +266,8 @@ static const struct drm_gem_object_funcs=20
>> amdgpu_gem_object_funcs =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .export =3D amdgpu_gem_prime_export,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vmap =3D drm_gem_ttm_vmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vunmap =3D drm_gem_ttm_vunmap,
>> +=C2=A0=C2=A0=C2=A0 .mmap =3D amdgpu_gem_prime_mmap,
>> +=C2=A0=C2=A0=C2=A0 .vm_ops =3D &amdgpu_gem_vm_ops,
>> =C2=A0 };
>> =C2=A0 /*
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 1485f33c3cc7..d4083c19402b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -152,25 +152,6 @@ static void amdgpu_evict_flags(struct=20
>> ttm_buffer_object *bo,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *placement =3D abo->placement;
>> =C2=A0 }
>> -/**
>> - * amdgpu_verify_access - Verify access for a mmap call
>> - *
>> - * @bo:=C2=A0=C2=A0=C2=A0 The buffer object to map
>> - * @filp: The file pointer from the process performing the mmap
>> - *
>> - * This is called by ttm_bo_mmap() to verify whether a process
>> - * has the right to mmap a BO to their process space.
>> - */
>> -static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct =

>> file *filp)
>> -{
>> -=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *abo =3D ttm_to_amdgpu_bo(bo);
>> -
>> -=C2=A0=C2=A0=C2=A0 if (amdgpu_ttm_tt_get_usermm(bo->ttm))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPERM;
>> -=C2=A0=C2=A0=C2=A0 return drm_vma_node_verify_access(&abo->tbo.base.v=
ma_node,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filp->private_d=
ata);
>> -}
>> -
>> =C2=A0 /**
>> =C2=A0=C2=A0 * amdgpu_ttm_map_buffer - Map memory into the GART window=
s
>> =C2=A0=C2=A0 * @bo: buffer object to map
>> @@ -1522,7 +1503,6 @@ static struct ttm_device_funcs amdgpu_bo_driver =
=3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .eviction_valuable =3D amdgpu_ttm_bo_ev=
iction_valuable,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .evict_flags =3D &amdgpu_evict_flags,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .move =3D &amdgpu_bo_move,
>> -=C2=A0=C2=A0=C2=A0 .verify_access =3D &amdgpu_verify_access,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .delete_mem_notify =3D &amdgpu_bo_delet=
e_mem_notify,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .release_notify =3D &amdgpu_bo_release_=
notify,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .io_mem_reserve =3D &amdgpu_ttm_io_mem_=
reserve,
>> @@ -1897,50 +1877,6 @@ void amdgpu_ttm_set_buffer_funcs_status(struct =

>> amdgpu_device *adev, bool enable)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev->mman.buffer_funcs_enabled =3D ena=
ble;
>> =C2=A0 }
>> -static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
>> -{
>> -=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *bo =3D vmf->vma->vm_priv=
ate_data;
>> -=C2=A0=C2=A0=C2=A0 vm_fault_t ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_vm_reserve(bo, vmf);
>> -=C2=A0=C2=A0=C2=A0 if (ret)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D amdgpu_bo_fault_reserve_notify(bo);
>> -=C2=A0=C2=A0=C2=A0 if (ret)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm=
_page_prot,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_BO_VM=
_NUM_PREFAULT, 1);
>> -=C2=A0=C2=A0=C2=A0 if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags &=20
>> FAULT_FLAG_RETRY_NOWAIT))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> -unlock:
>> -=C2=A0=C2=A0=C2=A0 dma_resv_unlock(bo->base.resv);
>> -=C2=A0=C2=A0=C2=A0 return ret;
>> -}
>> -
>> -static const struct vm_operations_struct amdgpu_ttm_vm_ops =3D {
>> -=C2=A0=C2=A0=C2=A0 .fault =3D amdgpu_ttm_fault,
>> -=C2=A0=C2=A0=C2=A0 .open =3D ttm_bo_vm_open,
>> -=C2=A0=C2=A0=C2=A0 .close =3D ttm_bo_vm_close,
>> -=C2=A0=C2=A0=C2=A0 .access =3D ttm_bo_vm_access
>> -};
>> -
>> -int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma)
>> -{
>> -=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv =3D filp->private_data;=

>> -=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D drm_to_adev(file_pr=
iv->minor->dev);
>> -=C2=A0=C2=A0=C2=A0 int r;
>> -
>> -=C2=A0=C2=A0=C2=A0 r =3D ttm_bo_mmap(filp, vma, &adev->mman.bdev);
>> -=C2=A0=C2=A0=C2=A0 if (unlikely(r !=3D 0))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> -
>> -=C2=A0=C2=A0=C2=A0 vma->vm_ops =3D &amdgpu_ttm_vm_ops;
>> -=C2=A0=C2=A0=C2=A0 return 0;
>> -}
>> -
>> =C2=A0 int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_o=
ffset,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t dst_offset, uint32_t byte_count,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_resv *resv,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index dec0db8b0b13..6e51faad7371 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -146,7 +146,6 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct dma_resv *resv,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct dma_fence **fence);
>> -int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
>> =C2=A0 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>> =C2=A0 int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
>> =C2=A0 uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev,=20
>> uint32_t type);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yhoBttp0rv0llyX1xoE8kdZAdSPTqSirv--

--pmMjG4wVVuKWNJE59kdLozS885YbW0iSk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB4LV4FAwAAAAAACgkQlh/E3EQov+D/
vw/9Et3TRmKROx+ayS6e84x+zlzYOVDdM6qW9gUKUii5q4xlTrEbZIzS91errESrs6YKDPnat92T
8B8lda7UtRegsT2Gq1MeUt+4ghNVYACNuEpkQEIjt9fhxwd0qDng53oCs/Ei5ofacgF92vzJvDI0
595tWpMaFMB+7YYBSi2SgMkCaajVJFqAn0NiaGphUV+gQbGz8D/DTK6HekFPtkzRoEMPUGwiy4z1
BZ9wYG4AMQb/pf1hUjankcFpI3d7J9gjQUz+WOTsv6z5YGimifLtshV4OHB8LfcM8FintwOHFWYs
LWANbi7mkqkuvraExmP0shP+g3aPq7UWkKfFRD0XpP8WHdkQVAPi1kJPSrcGLo0EQdqz3CBzvmza
D06WHjt1lVkmIS+kPkEBbNvJZZVFIrJbecbYXB67i97zZK8RV8qdJSWXXda7VdjN7jUmNgF8i6vN
I4eeC6tV8GeZJKpRFuzKFBaVvgeMG0kqkVbmmqsJK9oLb39Iyr+ExbrbeVC1gIi28eWx9Gv38T/Z
RaRRKLgC2D06JUY+XKo82YZge3SRefz9OsmiTSK7uoMzy9u6lg8m1OHqewopbMAXtDbPKkrbPLai
HoiVTVpVSBLd2OtByPXi1HEMkGL3OCVu51pSAKXh2/8co6/Cep/wqeuROYnXj3zzx8gbWnTJ5fCU
VIo=
=ZTNY
-----END PGP SIGNATURE-----

--pmMjG4wVVuKWNJE59kdLozS885YbW0iSk--

--===============1837933900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1837933900==--
