Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F936538B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 09:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE4C89C88;
	Tue, 20 Apr 2021 07:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1056289C80;
 Tue, 20 Apr 2021 07:51:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9712BB23F;
 Tue, 20 Apr 2021 07:51:28 +0000 (UTC)
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
 <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <52403618-62f5-2085-c245-e1e98762cccb@suse.de>
Date: Tue, 20 Apr 2021 09:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0260180435=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0260180435==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gQzpEqqhDoyhySzOfs5qkbaa7mzBt19EA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gQzpEqqhDoyhySzOfs5qkbaa7mzBt19EA
Content-Type: multipart/mixed; boundary="4hXKDfjTeiDGgeeZmmQD2sc8GodJ4lZ0X";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, zackr@vmware.com, shashank.sharma@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Message-ID: <52403618-62f5-2085-c245-e1e98762cccb@suse.de>
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx
 driver
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
 <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
In-Reply-To: <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>

--4hXKDfjTeiDGgeeZmmQD2sc8GodJ4lZ0X
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.04.21 um 15:51 schrieb Christian K=C3=B6nig:
> Am 16.04.21 um 15:46 schrieb Christian K=C3=B6nig:
>> Am 16.04.21 um 15:31 schrieb Thomas Zimmermann:
>>> The vmwgfx driver is the only remaining user of ttm_bo_mmap(). Inline=

>>> the code. The internal helper ttm_bo_vm_lookup() is now also part of
>>> vmwgfx as vmw_bo_vm_lookup().
>>>
>>> v2:
>>> =C2=A0=C2=A0=C2=A0=C2=A0* replace pr_err() with drm_err() (Zack)
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Reviewed-by: Zack Rusin <zackr@vmware.com>
>>> ---
>>> =C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 56 ++++++++++++++++=
++++++--
>>> =C2=A0 1 file changed, 53 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c=20
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> index cb9975889e2f..c8b6543b4e39 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> @@ -27,6 +27,32 @@
>>> =C2=A0 =C2=A0 #include "vmwgfx_drv.h"
>>> =C2=A0 +static struct ttm_buffer_object *vmw_bo_vm_lookup(struct=20
>>> ttm_device *bdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long offset,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long pages)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct vmw_private *dev_priv =3D container_of(bde=
v, struct=20
>>> vmw_private, bdev);
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm =3D &dev_priv->drm;
>>> +=C2=A0=C2=A0=C2=A0 struct drm_vma_offset_node *node;
>>> +=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *bo =3D NULL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 drm_vma_offset_lock_lookup(bdev->vma_manager);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 node =3D drm_vma_offset_lookup_locked(bdev->vma_m=
anager, offset,=20
>>> pages);
>>> +=C2=A0=C2=A0=C2=A0 if (likely(node)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D container_of(node,=20
struct ttm_buffer_object,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base.vma_node);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D ttm_bo_get_unless_=
zero(bo);
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 drm_vma_offset_unlock_lookup(bdev->vma_manager);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!bo)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(drm, "Could not f=
ind buffer object to map\n");
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return bo;
>>> +}
>>> +
>>> =C2=A0 int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const struct vm_operations_stru=
ct vmw_vm_ops =3D {
>>> @@ -41,10 +67,28 @@ int vmw_mmap(struct file *filp, struct=20
>>> vm_area_struct *vma)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv =3D filp->p=
rivate_data;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vmw_private *dev_priv =3D vmw_p=
riv(file_priv->minor->dev);
>>> -=C2=A0=C2=A0=C2=A0 int ret =3D ttm_bo_mmap(filp, vma, &dev_priv->bde=
v);
>>> +=C2=A0=C2=A0=C2=A0 struct ttm_device *bdev =3D &dev_priv->bdev;
>>> +=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *bo;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET=
_START))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 bo =3D vmw_bo_vm_lookup(bdev, vma->vm_pgoff, vma_=
pages(vma));
>>> +=C2=A0=C2=A0=C2=A0 if (unlikely(!bo))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (ret)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +=C2=A0=C2=A0=C2=A0 if (unlikely(!bo->bdev->funcs->verify_access)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EPERM;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unref;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 ret =3D bo->bdev->funcs->verify_access(bo, filp);=

>>
>> Is there any reason we can't call vmw_verify_access() directly here?
>>
>> Would allow us to completely nuke the verify_access callback as well=20
>> as far as I can see.
>=20
> Forget what I said, couldn't see the next patch in my mailbox at time o=
f=20
> writing.
>=20
> Whole series is Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd=
=2Ecom>

Thanks a lot. If I'm not mistaken, the patches at [1] need to go in=20
first. So it could take a a bit until this lands.

Otherwise, this series could go through the same tree as [1] if nouveau=20
and vmwgfx devs don't mind.

Best regards
Thomas

[1] https://patchwork.freedesktop.org/series/88822/

>=20
> Thanks for the nice cleanup,
> Christian.
>=20
>>
>> Regards,
>> Christian.
>>
>>> +=C2=A0=C2=A0=C2=A0 if (unlikely(ret !=3D 0))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unref;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_mmap_obj(vma, bo);
>>> +=C2=A0=C2=A0=C2=A0 if (unlikely(ret !=3D 0))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unref;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_ops =3D &vmw_vm_ops;
>>> =C2=A0 @@ -52,7 +96,13 @@ int vmw_mmap(struct file *filp, struct=20
>>> vm_area_struct *vma)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!is_cow_mapping(vma->vm_flags))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_flags =
=3D (vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 ttm_bo_put(bo); /* release extra ref taken=20
by=20
>>> ttm_bo_mmap_obj() */
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +out_unref:
>>> +=C2=A0=C2=A0=C2=A0 ttm_bo_put(bo);
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 /* struct vmw_validation_mem callback */
>>
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


--4hXKDfjTeiDGgeeZmmQD2sc8GodJ4lZ0X--

--gQzpEqqhDoyhySzOfs5qkbaa7mzBt19EA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB+h/8FAwAAAAAACgkQlh/E3EQov+B7
4w/8CdxG67uhYl2m7yiaoCqLylhg0vp0+DpL76ZlvDReGHl/qxbqAkaSDXDq7wN0+GlV6iixjNx2
3zcvPYSLKPi1YNJSBWWsOdLsRAhxtENUCcXJtkCmZ5fUFIy+7fv8KeSn6+I7HvTpqneexqNl4fBb
q+LmTG9bfOhV+wPW/1I6fTyESpubq2sN0+ma126xNj2eiD7Pt17c56fcjKxZ3mnYZXPRXiDZQWa8
4CYrywBzUzu3XvW1LLwle5tnCUllr+z4Pcd0nvPZv4xOM/mttf0k3Z494JkZzgjdwNgU7b9TiVUn
G94TkjzYletmDrJr76qErWrinI0e2Z9Yf8yMWOMNxo5ujwiwB586Kx+dPH3hpJORkDSQzwF9urKd
bO7ZDrdwiU308uYbhFJypI3YxqKIrJfoXfSrLW30xv+vFk3mjD8R5hp1uRCfGTgpqXsFmDELj4dG
aSJCG+8NtOR7B36DUslfbdI9yYR3+hCk4A5lamkCxllJgUrTV5bXw++aQZVEM7ynVGCELGKuXYiH
IwG96eUL4XfTRRyY76bhng1G41zj9dHOl4XkeMSE7boHQ0aOlaugxAGoDmzE9JC54DJuStzIeC5L
25K/1nDCL4LKJYu0DkP9FB0S8PxSnPiL32TA+omuGqZ7kwDshms4LwhpRbFjX6f5P9vh6FTgbr/p
SSo=
=ymPq
-----END PGP SIGNATURE-----

--gQzpEqqhDoyhySzOfs5qkbaa7mzBt19EA--

--===============0260180435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0260180435==--
