Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0135510F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 12:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9573E89C98;
	Tue,  6 Apr 2021 10:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A9689C85;
 Tue,  6 Apr 2021 10:38:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61B06B142;
 Tue,  6 Apr 2021 10:38:11 +0000 (UTC)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
Message-ID: <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
Date: Tue, 6 Apr 2021 12:38:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0823219316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0823219316==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DlEMyx97wEecQakExZoFxgsu9Ueoy78O4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DlEMyx97wEecQakExZoFxgsu9Ueoy78O4
Content-Type: multipart/mixed; boundary="cY5UB9S9eRZ9UDqBxYDChsSPO0FV63ekz";
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
Message-ID: <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
In-Reply-To: <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>

--cY5UB9S9eRZ9UDqBxYDChsSPO0FV63ekz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.04.21 um 11:35 schrieb Christian K=C3=B6nig:
> Am 06.04.21 um 11:08 schrieb Thomas Zimmermann:
>> Moving the driver-specific mmap code into a GEM object function allows=

>> for using DRM helpers for various mmap callbacks.
>>
>> This change resolves several inconsistencies between regular mmap and
>> prime-based mmap. The vm_ops field in vma is now set for all mmap'ed
>> areas. Previously it way only set for regular mmap calls, prime-based
>> mmap used TTM's default vm_ops. The check for kfd_bo has been taken
>> from amdgpu_verify_access(), which is not called any longer and has
>> been removed.
>>
>> As a side effect, amdgpu_ttm_vm_ops and amdgpu_ttm_fault() are now
>> implemented in amdgpu's GEM code.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |=C2=A0 2 -
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
 | 64 +++++++++++++++++++
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=
 | 71 ---------------------
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 -
>> =C2=A0 6 files changed, 66 insertions(+), 122 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index e0c4f7c7f1b9..19c5ab08d9ec 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -42,52 +42,6 @@
>> =C2=A0 #include <linux/pci-p2pdma.h>
>> =C2=A0 #include <linux/pm_runtime.h>
>> -/**
>> - * amdgpu_gem_prime_mmap - &drm_driver.gem_prime_mmap implementation
>> - * @obj: GEM BO
>> - * @vma: Virtual memory area
>> - *
>> - * Sets up a userspace mapping of the BO's memory in the given
>> - * virtual memory area.
>> - *
>> - * Returns:
>> - * 0 on success or a negative error code on failure.
>> - */
>> -int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct vm_area_struct *vma)
>> -{
>> -=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
>> -=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo-=
>tbo.bdev);
>> -=C2=A0=C2=A0=C2=A0 unsigned asize =3D amdgpu_bo_size(bo);
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 if (!vma->vm_file)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> -
>> -=C2=A0=C2=A0=C2=A0 if (adev =3D=3D NULL)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> -
>> -=C2=A0=C2=A0=C2=A0 /* Check for valid size. */
>> -=C2=A0=C2=A0=C2=A0 if (asize < vma->vm_end - vma->vm_start)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> -
>> -=C2=A0=C2=A0=C2=A0 if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (bo->flags & AMDGPU_GEM_CR=
EATE_NO_CPU_ACCESS)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPERM;
>> -=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 vma->vm_pgoff +=3D amdgpu_bo_mmap_offset(bo) >> PA=
GE_SHIFT;
>> -
>> -=C2=A0=C2=A0=C2=A0 /* prime mmap does not need to check access, so al=
low here */
>> -=C2=A0=C2=A0=C2=A0 ret =3D drm_vma_node_allow(&obj->vma_node,=20
>> vma->vm_file->private_data);
>> -=C2=A0=C2=A0=C2=A0 if (ret)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_mmap(vma->vm_file, vma, &adev->mman=
=2Ebdev);
>> -=C2=A0=C2=A0=C2=A0 drm_vma_node_revoke(&obj->vma_node, vma->vm_file->=
private_data);
>> -
>> -=C2=A0=C2=A0=C2=A0 return ret;
>> -}
>> -
>> =C2=A0 static int
>> =C2=A0 __dma_resv_make_exclusive(struct dma_resv *obj)
>> =C2=A0 {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
>> index 39b5b9616fd8..3e93b9b407a9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
>> @@ -31,8 +31,6 @@ struct drm_gem_object=20
>> *amdgpu_gem_prime_import(struct drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct dma_buf *dma_buf);
>> =C2=A0 bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *ade=
v,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct=
 amdgpu_bo *bo);
>> -int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct vm_area_struct *vma);
>> =C2=A0 extern const struct dma_buf_ops amdgpu_dmabuf_ops;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 76f48f79c70b..e96d2758f4bb 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1656,7 +1656,7 @@ static const struct file_operations=20
>> amdgpu_driver_kms_fops =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flush =3D amdgpu_flush,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .release =3D drm_release,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .unlocked_ioctl =3D amdgpu_drm_ioctl,
>> -=C2=A0=C2=A0=C2=A0 .mmap =3D amdgpu_mmap,
>> +=C2=A0=C2=A0=C2=A0 .mmap =3D drm_gem_mmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .poll =3D drm_poll,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .read =3D drm_read,
>> =C2=A0 #ifdef CONFIG_COMPAT
>> @@ -1719,7 +1719,7 @@ static const struct drm_driver amdgpu_kms_driver=
=20
>> =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd =3D drm_gem_prime_h=
andle_to_fd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle =3D drm_gem_prime_f=
d_to_handle,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_import =3D amdgpu_gem_prime_=
import,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_mmap =3D amdgpu_gem_prime_mmap,
>> +=C2=A0=C2=A0=C2=A0 .gem_prime_mmap =3D drm_gem_prime_mmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .desc =3D DRIVER_DESC,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index fb7171e5507c..fe93faad05f2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -41,6 +41,36 @@
>> =C2=A0 static const struct drm_gem_object_funcs amdgpu_gem_object_func=
s;
>> +static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
>=20
> Please name that function amdgpu_gem_fault or amdgpu_gem_object_fault
>=20
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *bo =3D vmf->vma->vm_priv=
ate_data;
>> +=C2=A0=C2=A0=C2=A0 vm_fault_t ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_vm_reserve(bo, vmf);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D amdgpu_bo_fault_reserve_notify(bo);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm=
_page_prot,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_BO_VM=
_NUM_PREFAULT, 1);
>> +=C2=A0=C2=A0=C2=A0 if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags &=20
>> FAULT_FLAG_RETRY_NOWAIT))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +unlock:
>> +=C2=A0=C2=A0=C2=A0 dma_resv_unlock(bo->base.resv);
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static const struct vm_operations_struct amdgpu_ttm_vm_ops =3D {
>> +=C2=A0=C2=A0=C2=A0 .fault =3D amdgpu_ttm_fault,
>> +=C2=A0=C2=A0=C2=A0 .open =3D ttm_bo_vm_open,
>> +=C2=A0=C2=A0=C2=A0 .close =3D ttm_bo_vm_close,
>> +=C2=A0=C2=A0=C2=A0 .access =3D ttm_bo_vm_access
>> +};
>> +
>> =C2=A0 static void amdgpu_gem_object_free(struct drm_gem_object *gobj)=

>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *robj =3D gem_to_amdgp=
u_bo(gobj);
>> @@ -201,6 +231,38 @@ static void amdgpu_gem_object_close(struct=20
>> drm_gem_object *obj,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_eu_backoff_reservation(&ticket, &li=
st);
>> =C2=A0 }
>> +static int amdgpu_gem_prime_mmap(struct drm_gem_object *obj, struct=20
>> vm_area_struct *vma)
>> +{
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
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Don't verify access for KFD BOs. They don'=
t have a GEM
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * object associated with them.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 if (bo->kfd_bo)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>=20
> Who does the access verification now?

This is somewhat confusing.

I took this check as-is, including the comment, from amdgpu's=20
verify_access function. The verify_access function was called by=20
ttm_bo_mmap. It returned 0 and ttm_bo_mmap did the mapping.

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
>> +out:
>> +=C2=A0=C2=A0=C2=A0 return drm_gem_ttm_mmap(obj, vma);
>> +}
>> +
>> =C2=A0 static const struct drm_gem_object_funcs amdgpu_gem_object_func=
s =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .free =3D amdgpu_gem_object_free,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .open =3D amdgpu_gem_object_open,
>> @@ -208,6 +270,8 @@ static const struct drm_gem_object_funcs=20
>> amdgpu_gem_object_funcs =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .export =3D amdgpu_gem_prime_export,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vmap =3D drm_gem_ttm_vmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vunmap =3D drm_gem_ttm_vunmap,
>> +=C2=A0=C2=A0=C2=A0 .mmap =3D amdgpu_gem_prime_mmap,
>> +=C2=A0=C2=A0=C2=A0 .vm_ops =3D &amdgpu_ttm_vm_ops,
>> =C2=A0 };
>> =C2=A0 /*
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 1c6131489a85..d9de91a517c6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -152,32 +152,6 @@ static void amdgpu_evict_flags(struct=20
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
>> -=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * Don't verify access for KFD BOs. They don'=
t have a GEM
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * object associated with them.
>> -=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 if (abo->kfd_bo)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> -
>> -=C2=A0=C2=A0=C2=A0 if (amdgpu_ttm_tt_get_usermm(bo->ttm))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EPERM;
>> -=C2=A0=C2=A0=C2=A0 return drm_vma_node_verify_access(&abo->tbo.base.v=
ma_node,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filp->private_d=
ata);
>> -}

Here's the orignal verification code. It gives a free pass to KFD.

>> -
>> =C2=A0 /**
>> =C2=A0=C2=A0 * amdgpu_ttm_map_buffer - Map memory into the GART window=
s
>> =C2=A0=C2=A0 * @bo: buffer object to map
>> @@ -1531,7 +1505,6 @@ static struct ttm_device_funcs amdgpu_bo_driver =
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
>> @@ -1906,50 +1879,6 @@ void amdgpu_ttm_set_buffer_funcs_status(struct =

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

And this was the mmap callback in struct file_operations. It calls=20
ttm_bo_mmap(), which skips verification for KFD BOs. To the best of my=20
knowledge, there was no additional verification for these KFD BOs.

The original code in amdgpu_gem_prime_mmap() did seom verification, but=20
didn't handle KFD specially. I guess, PRIME needs GEM and KFD BOs=20
wouldn't quailify.

In the end I went with the semantics I found in amdgpu_mmap() and=20
handled KFD specially. Let me know if this requires to be changed.

Best regards
Thomas

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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cY5UB9S9eRZ9UDqBxYDChsSPO0FV63ekz--

--DlEMyx97wEecQakExZoFxgsu9Ueoy78O4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBsOhIFAwAAAAAACgkQlh/E3EQov+Cy
ehAAuigg86A1nSdjImYm7zjvHU0c59wRCjzurzr8zHhB2lfZuFOyFR2KYL5D7rpAe/Eqz2tEMrq3
Cq6zO2Bff9iN76cBa61F+1ize2piuQ5VjSojQ0ZVkyrm/tw0MH5x6iaee48yiv0yzKgeqE/hj8a1
E8nMNiUCGKZdQ61DKP6Ui8pZT2pkf88KKAl4uZeNKCIpWBX5dfXzZ+MuEMLaVogXqTDtsgTs8MmA
coTiz4y7TXmyh9Xoa7qVQ23T5OWka71YKaV0n59P3MDPH012aAYWfrtjgKoFniyZMZhEhWcvdoFr
EOsI3Uilne4bbW5uGXNgb2ux4K4rGhQxpOnGVoYegrc7g9sZAUWkA11RsFj7zF4aYSJZT2LmjlnL
ujl7xS4RUQM0vTM2Qjvyy9RWLC0slNjZTZ0eec7WfQnash9i0kLPEwfF8AzA/+3X/ob+iU30ULP1
woF+p9XSNoDVrxCrKliVJsVhvnyZFwT/oiZ1VE86SlaubwGO4t9w+xJ6/Ik+Ogyw63Lo36OUxdnb
xt9oXllA0H7D0x+ww1g320TjxIyA7A3bl3qxPNw6kjjzp+3jVS67ZTvS6Brv6jJUwpQv6VMyBMAb
uzcBFubG7Zp8mqIkm9i20qIWSvEOgk836TSdC8VgJnNUL7e9nJbcqJhNtSaJanP11CJy9vZw3SQq
iRY=
=ZOo+
-----END PGP SIGNATURE-----

--DlEMyx97wEecQakExZoFxgsu9Ueoy78O4--

--===============0823219316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0823219316==--
