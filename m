Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3412D2F63FC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 16:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C726E41D;
	Thu, 14 Jan 2021 15:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB3F6E41D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 15:15:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8058EAE61;
 Thu, 14 Jan 2021 15:15:31 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
To: kieran.bingham+renesas@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
 <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
 <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6afaad84-505a-87e7-a7ce-9f45c9cc79bd@suse.de>
Date: Thu, 14 Jan 2021 16:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1167508393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1167508393==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3DiZ0YlIy5LMjrXqzxUCfRkT0THclz5UC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3DiZ0YlIy5LMjrXqzxUCfRkT0THclz5UC
Content-Type: multipart/mixed; boundary="69PIRYNg45ns0TFJcXm5CCbvcvS6A79n6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kieran.bingham+renesas@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <6afaad84-505a-87e7-a7ce-9f45c9cc79bd@suse.de>
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
 <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
 <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>
In-Reply-To: <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>

--69PIRYNg45ns0TFJcXm5CCbvcvS6A79n6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.01.21 um 15:34 schrieb Kieran Bingham:
> Hi Thomas,
>=20
> On 14/01/2021 13:26, Thomas Zimmermann wrote:
>> Hi Kieran
>>
>> Am 14.01.21 um 13:51 schrieb Kieran Bingham:
>>> Hi Thomas,
>>>
>>> On 23/11/2020 11:56, Thomas Zimmermann wrote:
>>>> The new GEM object function drm_gem_cma_mmap() sets the VMA flags
>>>> and offset as in the old implementation and immediately maps in the
>>>> buffer's memory pages.
>>>>
>>>> Changing CMA helpers to use the GEM object function allows for the
>>>> removal of the special implementations for mmap and gem_prime_mmap
>>>> callbacks. The regular functions drm_gem_mmap() and drm_gem_prime_mm=
ap()
>>>> are now used.
>>>
>>> I've encountered a memory leak regression in our Renesas R-Car DU tes=
ts,
>>> and git bisection has led me to this patch (as commit f5ca8eb6f9).
>>>
>>> Running the tests sequentially, while grepping /proc/meminfo for Cma,=
 it
>>> is evident that CMA memory is not released, until exhausted and the
>>> allocations fail (seen in [0]) shown by the error report:
>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 self.fbs.append(pykms.DumbFramebuffer(self=
=2Ecard, mode.hdisplay,
>>>> mode.vdisplay, "XR24"))
>>>> ValueError: DRM_IOCTL_MODE_CREATE_DUMB failed: Cannot allocate memor=
y
>>>
>>>
>>> Failing tests at f5ca8eb6f9 can be seen at [0], while the tests pass
>>> successfully [1] on the commit previous to that (bc2532ab7c2):
>>>
>>> Reverting f5ca8eb6f9 also produces a successful pass [2]
>>>
>>>  =C2=A0 [0] https://paste.ubuntu.com/p/VjPGPgswxR/ # Failed at f5ca8e=
b6f9
>>>  =C2=A0 [1] https://paste.ubuntu.com/p/78RRp2WpNR/ # Success at bc253=
2ab7c2
>>>  =C2=A0 [2] https://paste.ubuntu.com/p/qJKjZZN2pt/ # Success with rev=
ert
>>>
>>>
>>> I don't believe we handle mmap specially in the RCar-DU driver, so I
>>> wonder if this issue has hit anyone else as well?
>>>
>>> Any ideas of a repair without a revert ? Or do we just need to submit=
 a
>>> revert?
>>
>> I think we might not be setting the VMA ops and therefore not finalize=

>> the BO correctly. Could you please apply the attched (quick-and-dirty)=

>> patch and try again?
>=20
> Thanks for the quick response.
>=20
> I can confirm the quick-and-dirty patch resolves the issue:
>    https://paste.ubuntu.com/p/sKDp3dNvwV/
>=20
> You can add a
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Great! If you don't mind, I'd also add you in the Reported-by tag.

>=20
> if it stays like that, but I suspect there might be a better place to
> initialise the ops rather than in the mmap call itself.

I think that's the fix, basically. We could put such a line as a=20
fall-back somewhere into the DRM core code. But I don't know if this=20
really works with all drivers. Maybe there's one that requires vm_ops to =

be NULL.

Thanks for reporting this issue and testing quickly.

Best regards
Thomas

>=20
> Happy to do further testing as required.
>=20
> --
> Regards
>=20
> Kieran
>=20
>=20
>> Best regards
>> Thomas
>>
>>>
>>> I've yet to fully understand the implications of the patch below.
>>>
>>> Thanks
>>> --=20
>>> Regards
>>>
>>> Kieran
>>>
>>>
>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>  =C2=A0 drivers/gpu/drm/drm_file.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
>>>>  =C2=A0 drivers/gpu/drm/drm_gem_cma_helper.c | 121 +++++++++--------=
----------
>>>>  =C2=A0 drivers/gpu/drm/pl111/pl111_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +-
>>>>  =C2=A0 drivers/gpu/drm/vc4/vc4_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>  =C2=A0 include/drm/drm_gem_cma_helper.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 10 +--
>>>>  =C2=A0 5 files changed, 44 insertions(+), 94 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c=

>>>> index b50380fa80ce..80886d50d0f1 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -113,8 +113,7 @@ bool drm_dev_needs_global_mutex(struct drm_devic=
e
>>>> *dev)
>>>>  =C2=A0=C2=A0 * The memory mapping implementation will vary dependin=
g on how the
>>>> driver
>>>>  =C2=A0=C2=A0 * manages memory. Legacy drivers will use the deprecat=
ed
>>>> drm_legacy_mmap()
>>>>  =C2=A0=C2=A0 * function, modern drivers should use one of the provi=
ded
>>>> memory-manager
>>>> - * specific implementations. For GEM-based drivers this is
>>>> drm_gem_mmap(), and
>>>> - * for drivers which use the CMA GEM helpers it's drm_gem_cma_mmap(=
).
>>>> + * specific implementations. For GEM-based drivers this is
>>>> drm_gem_mmap().
>>>>  =C2=A0=C2=A0 *
>>>>  =C2=A0=C2=A0 * No other file operations are supported by the DRM us=
erspace API.
>>>> Overall the
>>>>  =C2=A0=C2=A0 * following is an example &file_operations structure::=

>>>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c
>>>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>>>> index 6a4ef335ebc9..7942cf05cd93 100644
>>>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>>>> @@ -38,6 +38,7 @@ static const struct drm_gem_object_funcs
>>>> drm_gem_cma_default_funcs =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .print_info =3D drm_gem_cma_print_in=
fo,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .get_sg_table =3D drm_gem_cma_get_sg=
_table,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vmap =3D drm_gem_cma_vmap,
>>>> +=C2=A0=C2=A0=C2=A0 .mmap =3D drm_gem_cma_mmap,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vm_ops =3D &drm_gem_cma_vm_ops,
>>>>  =C2=A0 };
>>>>  =C2=A0 @@ -277,62 +278,6 @@ const struct vm_operations_struct
>>>> drm_gem_cma_vm_ops =3D {
>>>>  =C2=A0 };
>>>>  =C2=A0 EXPORT_SYMBOL_GPL(drm_gem_cma_vm_ops);
>>>>  =C2=A0 -static int drm_gem_cma_mmap_obj(struct drm_gem_cma_object *=
cma_obj,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vma)
>>>> -{
>>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 /*
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * Clear the VM_PFNMAP flag that was set by=
 drm_gem_mmap(), and
>>>> set the
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * vm_pgoff (used as a fake buffer offset b=
y DRM) to 0 as we
>>>> want to map
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * the whole buffer.
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0 vma->vm_flags &=3D ~VM_PFNMAP;
>>>> -=C2=A0=C2=A0=C2=A0 vma->vm_pgoff =3D 0;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 ret =3D dma_mmap_wc(cma_obj->base.dev->dev, vma,=
 cma_obj->vaddr,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 cma_obj->paddr, vma->vm_end - vma->vm_start);
>>>> -=C2=A0=C2=A0=C2=A0 if (ret)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_vm_close(vma);
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 return ret;
>>>> -}
>>>> -
>>>> -/**
>>>> - * drm_gem_cma_mmap - memory-map a CMA GEM object
>>>> - * @filp: file object
>>>> - * @vma: VMA for the area to be mapped
>>>> - *
>>>> - * This function implements an augmented version of the GEM DRM fil=
e
>>>> mmap
>>>> - * operation for CMA objects: In addition to the usual GEM VMA setu=
p it
>>>> - * immediately faults in the entire object instead of using on-dema=
ind
>>>> - * faulting. Drivers which employ the CMA helpers should use this
>>>> function
>>>> - * as their ->mmap() handler in the DRM device file's file_operatio=
ns
>>>> - * structure.
>>>> - *
>>>> - * Instead of directly referencing this function, drivers should us=
e
>>>> the
>>>> - * DEFINE_DRM_GEM_CMA_FOPS().macro.
>>>> - *
>>>> - * Returns:
>>>> - * 0 on success or a negative error code on failure.
>>>> - */
>>>> -int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)=

>>>> -{
>>>> -=C2=A0=C2=A0=C2=A0 struct drm_gem_cma_object *cma_obj;
>>>> -=C2=A0=C2=A0=C2=A0 struct drm_gem_object *gem_obj;
>>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_mmap(filp, vma);
>>>> -=C2=A0=C2=A0=C2=A0 if (ret)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 gem_obj =3D vma->vm_private_data;
>>>> -=C2=A0=C2=A0=C2=A0 cma_obj =3D to_drm_gem_cma_obj(gem_obj);
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 return drm_gem_cma_mmap_obj(cma_obj, vma);
>>>> -}
>>>> -EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
>>>> -
>>>>  =C2=A0 #ifndef CONFIG_MMU
>>>>  =C2=A0 /**
>>>>  =C2=A0=C2=A0 * drm_gem_cma_get_unmapped_area - propose address for =
mapping in
>>>> noMMU cases
>>>> @@ -500,33 +445,6 @@ drm_gem_cma_prime_import_sg_table(struct
>>>> drm_device *dev,
>>>>  =C2=A0 }
>>>>  =C2=A0 EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
>>>>  =C2=A0 -/**
>>>> - * drm_gem_cma_prime_mmap - memory-map an exported CMA GEM object
>>>> - * @obj: GEM object
>>>> - * @vma: VMA for the area to be mapped
>>>> - *
>>>> - * This function maps a buffer imported via DRM PRIME into a usersp=
ace
>>>> - * process's address space. Drivers that use the CMA helpers should=

>>>> set this
>>>> - * as their &drm_driver.gem_prime_mmap callback.
>>>> - *
>>>> - * Returns:
>>>> - * 0 on success or a negative error code on failure.
>>>> - */
>>>> -int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct vm_area_struct *vma)
>>>> -{
>>>> -=C2=A0=C2=A0=C2=A0 struct drm_gem_cma_object *cma_obj;
>>>> -=C2=A0=C2=A0=C2=A0 int ret;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
>>>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 cma_obj =3D to_drm_gem_cma_obj(obj);
>>>> -=C2=A0=C2=A0=C2=A0 return drm_gem_cma_mmap_obj(cma_obj, vma);
>>>> -}
>>>> -EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
>>>> -
>>>>  =C2=A0 /**
>>>>  =C2=A0=C2=A0 * drm_gem_cma_vmap - map a CMA GEM object into the ker=
nel's virtual
>>>>  =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 address space
>>>> @@ -553,6 +471,43 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj=
,
>>>> struct dma_buf_map *map)
>>>>  =C2=A0 }
>>>>  =C2=A0 EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
>>>>  =C2=A0 +/**
>>>> + * drm_gem_cma_mmap - memory-map an exported CMA GEM object
>>>> + * @obj: GEM object
>>>> + * @vma: VMA for the area to be mapped
>>>> + *
>>>> + * This function maps a buffer into a userspace process's address
>>>> space.
>>>> + * In addition to the usual GEM VMA setup it immediately faults in
>>>> the entire
>>>> + * object instead of using on-demand faulting. Drivers that use the=
 CMA
>>>> + * helpers should set this as their &drm_gem_object_funcs.mmap
>>>> callback.
>>>> + *
>>>> + * Returns:
>>>> + * 0 on success or a negative error code on failure.
>>>> + */
>>>> +int drm_gem_cma_mmap(struct drm_gem_object *obj, struct
>>>> vm_area_struct *vma)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_cma_object *cma_obj;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Clear the VM_PFNMAP flag that was set by=
 drm_gem_mmap(), and
>>>> set the
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * vm_pgoff (used as a fake buffer offset b=
y DRM) to 0 as we
>>>> want to map
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the whole buffer.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_=
node);
>>>> +=C2=A0=C2=A0=C2=A0 vma->vm_flags &=3D ~VM_PFNMAP;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 cma_obj =3D to_drm_gem_cma_obj(obj);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D dma_mmap_wc(cma_obj->base.dev->dev, vma,=
 cma_obj->vaddr,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 cma_obj->paddr, vma->vm_end - vma->vm_start);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_vm_close(vma);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
>>>> +
>>>>  =C2=A0 /**
>>>>  =C2=A0=C2=A0 * drm_gem_cma_prime_import_sg_table_vmap - PRIME impor=
t another
>>>> driver's
>>>>  =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 scatter/gather table and get the v=
irtual address of the buffer
>>>> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c
>>>> b/drivers/gpu/drm/pl111/pl111_drv.c
>>>> index 40e6708fbbe2..e4dcaef6c143 100644
>>>> --- a/drivers/gpu/drm/pl111/pl111_drv.c
>>>> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
>>>> @@ -228,7 +228,7 @@ static const struct drm_driver pl111_drm_driver =
=3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd =3D drm_gem_prim=
e_handle_to_fd,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle =3D drm_gem_prim=
e_fd_to_handle,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_import_sg_table =3D pl111=
_gem_import_sg_table,
>>>> -=C2=A0=C2=A0=C2=A0 .gem_prime_mmap =3D drm_gem_cma_prime_mmap,
>>>> +=C2=A0=C2=A0=C2=A0 .gem_prime_mmap =3D drm_gem_prime_mmap,
>>>>  =C2=A0 =C2=A0 #if defined(CONFIG_DEBUG_FS)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .debugfs_init =3D pl111_debugfs_init=
,
>>>> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_=
bo.c
>>>> index 813e6cb3f9af..dc316cb79e00 100644
>>>> --- a/drivers/gpu/drm/vc4/vc4_bo.c
>>>> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
>>>> @@ -782,7 +782,7 @@ int vc4_prime_mmap(struct drm_gem_object *obj,
>>>> struct vm_area_struct *vma)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINV=
AL;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 return drm_gem_cma_prime_mmap(obj, vma);=

>>>> +=C2=A0=C2=A0=C2=A0 return drm_gem_prime_mmap(obj, vma);
>>>>  =C2=A0 }
>>>>  =C2=A0 =C2=A0 int vc4_prime_vmap(struct drm_gem_object *obj, struct=
 dma_buf_map
>>>> *map)
>>>> diff --git a/include/drm/drm_gem_cma_helper.h
>>>> b/include/drm/drm_gem_cma_helper.h
>>>> index 4680275ab339..0a9711caa3e8 100644
>>>> --- a/include/drm/drm_gem_cma_helper.h
>>>> +++ b/include/drm/drm_gem_cma_helper.h
>>>> @@ -59,7 +59,7 @@ struct drm_gem_cma_object {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .poll=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_poll,\
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .read=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_read,\
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .llseek=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D noop_llseek,\
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mmap=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D drm_gem_cma_mmap,\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mmap=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D drm_gem_mmap,\
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_GEM_CMA_=
UNMAPPED_AREA_FOPS \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 @@ -76,9 +76,6 @@ int drm_gem_cma_dumb_create(struct drm_fil=
e
>>>> *file_priv,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *drm,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_mode_create_dumb *args);
>>>>  =C2=A0 -/* set vm_flags and we can change the VM attribute to other=
 one at
>>>> here */
>>>> -int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)=
;
>>>> -
>>>>  =C2=A0 /* allocate physical memory */
>>>>  =C2=A0 struct drm_gem_cma_object *drm_gem_cma_create(struct drm_dev=
ice *drm,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 size_t size);
>>>> @@ -101,9 +98,8 @@ struct drm_gem_object *
>>>>  =C2=A0 drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_attachment *=
attach,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sgt);
>>>> -int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct vm_area_struct *vma);
>>>>  =C2=A0 int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_=
buf_map
>>>> *map);
>>>> +int drm_gem_cma_mmap(struct drm_gem_object *obj, struct
>>>> vm_area_struct *vma);
>>>>  =C2=A0 =C2=A0 /**
>>>>  =C2=A0=C2=A0 * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM dr=
iver operations
>>>> @@ -123,7 +119,7 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj,=

>>>> struct dma_buf_map *map);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd=C2=A0=C2=A0=C2=A0=
 =3D drm_gem_prime_handle_to_fd, \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle=C2=A0=C2=A0=C2=A0=
 =3D drm_gem_prime_fd_to_handle, \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_import_sg_table =3D drm_g=
em_cma_prime_import_sg_table, \
>>>> -=C2=A0=C2=A0=C2=A0 .gem_prime_mmap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D drm_gem_cma_prime_mmap
>>>> +=C2=A0=C2=A0=C2=A0 .gem_prime_mmap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D drm_gem_prime_mmap
>>>>  =C2=A0 =C2=A0 /**
>>>>  =C2=A0=C2=A0 * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
>>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--69PIRYNg45ns0TFJcXm5CCbvcvS6A79n6--

--3DiZ0YlIy5LMjrXqzxUCfRkT0THclz5UC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAAYBIFAwAAAAAACgkQlh/E3EQov+Aw
0RAAx8L7ZjOMb5fj4oT4U7ZTgBqXMAD2KfM02EYF3t7immMRB0+h0bOcnpgqR3s2NpfOl3LFlk2S
xN7oUtwUcAgP3DGcqdyS+Nd/HwtzPmTy9nXug0IdYb3B3DYoYAXI4EGlV7CiGTESjgoRo3+IkKh8
snNMQ7XefdV5B9cEe3ADcYLDPKWTYP6ETGGRP8kqLMTbXlVCYCwwPkE6QWzScoQcCpmsNgrgqaxA
fJnkdg/VOrrCec0MFwNzupdDFWD3hf/vTMZYg46JS2pJq+RXOBiCX5TPwzJUD4+XrUdoY9nRL/Z3
O1Ys7Emj/wjYAHUFn9Rg5RUeBKvyGpZOclJDDFBI98Rmk3IVYPPJ8bMs9o55t9Aw4bpgjC80wmAR
oRjI+YqsmS23XLMKVY9tyko/jPBK4jvKp+K7nYDJfJ8yOg5oBCGYJu0Mr4JBu5pGsfgT7oF47gf/
8JDiLrtE3mITHKQBYTaXaUWZZeIankKCeHF/ysXskz/4A+FxAQ3it7BKgYTvLNy3NhDurQy7YiM1
Bzb8lehIbFSPBBu87SA0NczGWktoaZmuR3ZeeewByrACn1XFcOvw8cps7v0YYLsv1hhCp9f8LLKE
8chqjl37tEOCLlHAw8P3lBVDzk+TR7+pzvY4KcAMVYk2p/szezZ6IFD59Y6MqXadO81msWIYc8Tn
bVQ=
=SF+x
-----END PGP SIGNATURE-----

--3DiZ0YlIy5LMjrXqzxUCfRkT0THclz5UC--

--===============1167508393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1167508393==--
