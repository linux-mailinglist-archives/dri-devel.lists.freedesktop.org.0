Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D7362197
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50F36EA4F;
	Fri, 16 Apr 2021 14:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E616EA4F;
 Fri, 16 Apr 2021 14:00:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34B41B12D;
 Fri, 16 Apr 2021 14:00:39 +0000 (UTC)
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3f0d0a8b-fa40-a4c6-fb0a-991fc6729806@suse.de>
Date: Fri, 16 Apr 2021 16:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1226863605=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1226863605==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x2rSL5UwlVquz7IVn5gXAmWjRXaDyqWI6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x2rSL5UwlVquz7IVn5gXAmWjRXaDyqWI6
Content-Type: multipart/mixed; boundary="KAxHHaUTOdLuCF1VreK1RtsudTRHa32UF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Message-ID: <3f0d0a8b-fa40-a4c6-fb0a-991fc6729806@suse.de>
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx
 driver
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
In-Reply-To: <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>

--KAxHHaUTOdLuCF1VreK1RtsudTRHa32UF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.04.21 um 15:46 schrieb Christian K=C3=B6nig:
> Am 16.04.21 um 15:31 schrieb Thomas Zimmermann:
>> The vmwgfx driver is the only remaining user of ttm_bo_mmap(). Inline
>> the code. The internal helper ttm_bo_vm_lookup() is now also part of
>> vmwgfx as vmw_bo_vm_lookup().
>>
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* replace pr_err() with drm_err() (Zack)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Zack Rusin <zackr@vmware.com>
>> ---
>> =C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 56 +++++++++++++++++=
+++++--
>> =C2=A0 1 file changed, 53 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c=20
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> index cb9975889e2f..c8b6543b4e39 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> @@ -27,6 +27,32 @@
>> =C2=A0 #include "vmwgfx_drv.h"
>> +static struct ttm_buffer_object *vmw_bo_vm_lookup(struct ttm_device=20
>> *bdev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long offset,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long pages)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vmw_private *dev_priv =3D container_of(bdev=
, struct=20
>> vmw_private, bdev);
>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm =3D &dev_priv->drm;
>> +=C2=A0=C2=A0=C2=A0 struct drm_vma_offset_node *node;
>> +=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *bo =3D NULL;
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_vma_offset_lock_lookup(bdev->vma_manager);
>> +
>> +=C2=A0=C2=A0=C2=A0 node =3D drm_vma_offset_lookup_locked(bdev->vma_ma=
nager, offset,=20
>> pages);
>> +=C2=A0=C2=A0=C2=A0 if (likely(node)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D container_of(node, =
struct ttm_buffer_object,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base.vma_node);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D ttm_bo_get_unless_z=
ero(bo);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 drm_vma_offset_unlock_lookup(bdev->vma_manager);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!bo)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(drm, "Could not fi=
nd buffer object to map\n");
>> +
>> +=C2=A0=C2=A0=C2=A0 return bo;
>> +}
>> +
>> =C2=A0 int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const struct vm_operations_struc=
t vmw_vm_ops =3D {
>> @@ -41,10 +67,28 @@ int vmw_mmap(struct file *filp, struct=20
>> vm_area_struct *vma)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv =3D filp->pr=
ivate_data;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vmw_private *dev_priv =3D vmw_pr=
iv(file_priv->minor->dev);
>> -=C2=A0=C2=A0=C2=A0 int ret =3D ttm_bo_mmap(filp, vma, &dev_priv->bdev=
);
>> +=C2=A0=C2=A0=C2=A0 struct ttm_device *bdev =3D &dev_priv->bdev;
>> +=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *bo;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_=
START))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> +=C2=A0=C2=A0=C2=A0 bo =3D vmw_bo_vm_lookup(bdev, vma->vm_pgoff, vma_p=
ages(vma));
>> +=C2=A0=C2=A0=C2=A0 if (unlikely(!bo))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> -=C2=A0=C2=A0=C2=A0 if (ret)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 if (unlikely(!bo->bdev->funcs->verify_access)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EPERM;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unref;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 ret =3D bo->bdev->funcs->verify_access(bo, filp);
>=20
> Is there any reason we can't call vmw_verify_access() directly here?
>=20
> Would allow us to completely nuke the verify_access callback as well as=20

> far as I can see.

We have to spare something for patches 6 and 7. Otherwise they'd be=20
empty. ;)

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>> +=C2=A0=C2=A0=C2=A0 if (unlikely(ret !=3D 0))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unref;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_mmap_obj(vma, bo);
>> +=C2=A0=C2=A0=C2=A0 if (unlikely(ret !=3D 0))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unref;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_ops =3D &vmw_vm_ops;
>> @@ -52,7 +96,13 @@ int vmw_mmap(struct file *filp, struct=20
>> vm_area_struct *vma)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!is_cow_mapping(vma->vm_flags))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_flags =3D=20
(vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
>> +=C2=A0=C2=A0=C2=A0 ttm_bo_put(bo); /* release extra ref taken by ttm_=
bo_mmap_obj() */
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +out_unref:
>> +=C2=A0=C2=A0=C2=A0 ttm_bo_put(bo);
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 }
>> =C2=A0 /* struct vmw_validation_mem callback */
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


--KAxHHaUTOdLuCF1VreK1RtsudTRHa32UF--

--x2rSL5UwlVquz7IVn5gXAmWjRXaDyqWI6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB5mIYFAwAAAAAACgkQlh/E3EQov+Dk
cQ/+InrAMAvEwtRpmhrDg4Kb637mWixYAgcbmbwgoAacHBnleb1h6XIPgpsyrorjnWvPTut5yssO
oZoOtz0dQZ7ZON4g0AqIMii3TVgfv9fyUpSAYz3EgyTdvwgVVLiK+n8TV1qtQLEKOd/nruYd9DKa
21KPTqWiUc5/InrMDmRlE5IDNlEEM6IVF9e7MZlsHKVNVXppKX4bxNQ7AYNPrCYswa+Bj3OCoE2E
Sa5ZduJV4dzVji5BR4aBSdYHZBU5fvvHu2UHF3HU+ElyL4iC0+90jS1sSoMQ9bwmHq4EXg3jjCNG
KwX/YU4kKWNQomolVbW7mZpzTnHQmCy11bbfoHcUwqPGkc5MUwCjCpaOf1xcitW96zNNCa6p0Ohm
NY2CS+vq0TLdorJvYp8q59E1mViz9ThaKe+OCfGhtf/Zqd1xZrdRCmaFDhG+AwvmDL2f3T+oAJKL
haYLrgHbaMaim6LXij4+7ZTNmU0jbCYBtIsydcCvn3hK4J0ikaT7sKwXaBCmJJ7vxE2Y3KzfuKWC
DZfPSVD/DOGY+0ZbdwE1wrUvXhq44mQiy/U3cpfT7zaK6cZhC5O6vkzCLPz6vq8KV/ixsmT2cqWa
Zoybc2vykiFL79cS0d8iTE5vr+as7ixANhKUr9WwKOOEGcb0ipVj1NS3mPWGo6YMMbfBvt/FWwhz
HIk=
=V+VK
-----END PGP SIGNATURE-----

--x2rSL5UwlVquz7IVn5gXAmWjRXaDyqWI6--

--===============1226863605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1226863605==--
