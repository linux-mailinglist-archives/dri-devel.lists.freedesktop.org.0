Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE903BF9EC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242826E8DE;
	Thu,  8 Jul 2021 12:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5B26E8BE;
 Thu,  8 Jul 2021 12:15:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 776E7201BE;
 Thu,  8 Jul 2021 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625746526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=90TfgrvvBTclyzIoGhRNnDzBVxCUDVmNQEkvhVVEPig=;
 b=RbMVvPtrVEaEowx51NJgejOshNQWZnuPu6IhXPId7hUb5mK/aCryeBRVsLt6cFAyfnHulD
 oZ6vn4V6IR3+KKv8TQyyZFIsEwQpmt6TGYCZFu862J5PeQe5q3FpwqkhoXmnTflt3h0OZw
 UmKLSrevkmvytZapSjPUg/Z/ooOecBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625746526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=90TfgrvvBTclyzIoGhRNnDzBVxCUDVmNQEkvhVVEPig=;
 b=p0ehDLeZwcC6syASSzahkuQo5NWH7Lv9zBQmyTbBufw+Q/QkoLwNCS+qs7SAEJs4TMen5m
 7uy1emE05SdXi3BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48D9713BDF;
 Thu,  8 Jul 2021 12:15:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id El0uEF7s5mB6VAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 12:15:26 +0000
Subject: Re: [PATCH] drm/msm: Implement mmap as GEM object function
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
References: <20210624090341.8249-1-tzimmermann@suse.de>
 <6fc2bfe5-2a3a-2e7e-46f9-6c6d400ced0b@suse.de>
Message-ID: <2e5ea192-6f86-c74a-2719-1d40aa99997b@suse.de>
Date: Thu, 8 Jul 2021 14:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6fc2bfe5-2a3a-2e7e-46f9-6c6d400ced0b@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UdoqJxZS5vRGi4Hb2F483wOAdz4sSNKWC"
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UdoqJxZS5vRGi4Hb2F483wOAdz4sSNKWC
Content-Type: multipart/mixed; boundary="y9WCve1kCGMZGvlH00hVkuq5ADwVKsTKz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Message-ID: <2e5ea192-6f86-c74a-2719-1d40aa99997b@suse.de>
Subject: Re: [PATCH] drm/msm: Implement mmap as GEM object function
References: <20210624090341.8249-1-tzimmermann@suse.de>
 <6fc2bfe5-2a3a-2e7e-46f9-6c6d400ced0b@suse.de>
In-Reply-To: <6fc2bfe5-2a3a-2e7e-46f9-6c6d400ced0b@suse.de>

--y9WCve1kCGMZGvlH00hVkuq5ADwVKsTKz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 08.07.21 um 14:04 schrieb Thomas Zimmermann:
> ping for review

Nevermind, there's a newer version of this patch at

https://lore.kernel.org/dri-devel/20210706084753.8194-1-tzimmermann@suse.=
de/

Best regards
Thomas

>=20
> Am 24.06.21 um 11:03 schrieb Thomas Zimmermann:
>> Moving the driver-specific mmap code into a GEM object function allows=

>> for using DRM helpers for various mmap callbacks.
>>
>> The respective msm functions are being removed. The file_operations
>> structure fops is now being created by the helper macro
>> DEFINE_DRM_GEM_FOPS().
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> =C2=A0 drivers/gpu/drm/msm/msm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 14 +-----
>> =C2=A0 drivers/gpu/drm/msm/msm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/msm/msm_fbdev.c=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +-=
---
>> =C2=A0 drivers/gpu/drm/msm/msm_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 67 ++++++++++++-----------------
>> =C2=A0 drivers/gpu/drm/msm/msm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 --
>> =C2=A0 drivers/gpu/drm/msm/msm_gem_prime.c | 11 -----
>> =C2=A0 6 files changed, 31 insertions(+), 75 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c=20
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index fe7d17cd35ec..f62eaedfc0d7 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -985,17 +985,7 @@ static const struct drm_ioctl_desc msm_ioctls[] =3D=
 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY=
,=20
>> msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>> =C2=A0 };
>> -static const struct file_operations fops =3D {
>> -=C2=A0=C2=A0=C2=A0 .owner=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D THIS_MODULE,
>> -=C2=A0=C2=A0=C2=A0 .open=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_open,
>> -=C2=A0=C2=A0=C2=A0 .release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_release,
>> -=C2=A0=C2=A0=C2=A0 .unlocked_ioctl=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_io=
ctl,
>> -=C2=A0=C2=A0=C2=A0 .compat_ioctl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D drm_compat_ioctl,
>> -=C2=A0=C2=A0=C2=A0 .poll=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_poll,
>> -=C2=A0=C2=A0=C2=A0 .read=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_read,
>> -=C2=A0=C2=A0=C2=A0 .llseek=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D no_llseek,
>> -=C2=A0=C2=A0=C2=A0 .mmap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D msm_gem_mmap,
>> -};
>> +DEFINE_DRM_GEM_FOPS(fops);
>> =C2=A0 static const struct drm_driver msm_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_features=C2=A0=C2=A0=C2=A0 =3D =
DRIVER_GEM |
>> @@ -1015,7 +1005,7 @@ static const struct drm_driver msm_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd =3D drm_gem_prime_h=
andle_to_fd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle =3D drm_gem_prime_f=
d_to_handle,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_import_sg_table =3D msm_gem_=
prime_import_sg_table,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_mmap=C2=A0=C2=A0=C2=A0=C2=A0 =3D msm_ge=
m_prime_mmap,
>> +=C2=A0=C2=A0=C2=A0 .gem_prime_mmap=C2=A0=C2=A0=C2=A0=C2=A0 =3D drm_ge=
m_prime_mmap,
>> =C2=A0 #ifdef CONFIG_DEBUG_FS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .debugfs_init=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D msm_debugfs_init,
>> =C2=A0 #endif
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h=20
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index 2668941df529..8f1e0d7c8bbb 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -300,7 +300,6 @@ void msm_gem_shrinker_cleanup(struct drm_device=20
>> *dev);
>> =C2=A0 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_obje=
ct=20
>> *obj);
>> =C2=A0 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct=20
>> dma_buf_map *map);
>> =C2=A0 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct=20
>> dma_buf_map *map);
>> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct=20
>> vm_area_struct *vma);
>> =C2=A0 struct drm_gem_object *msm_gem_prime_import_sg_table(struct=20
>> drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_=
attachment *attach, struct sg_table *sg);
>> =C2=A0 int msm_gem_prime_pin(struct drm_gem_object *obj);
>> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c=20
>> b/drivers/gpu/drm/msm/msm_fbdev.c
>> index 227404077e39..07225907fd2d 100644
>> --- a/drivers/gpu/drm/msm/msm_fbdev.c
>> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
>> @@ -8,6 +8,7 @@
>> =C2=A0 #include <drm/drm_crtc.h>
>> =C2=A0 #include <drm/drm_fb_helper.h>
>> =C2=A0 #include <drm/drm_fourcc.h>
>> +#include <drm/drm_prime.h>
>> =C2=A0 #include "msm_drv.h"
>> =C2=A0 #include "msm_gem.h"
>> @@ -48,15 +49,8 @@ static int msm_fbdev_mmap(struct fb_info *info,=20
>> struct vm_area_struct *vma)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_fb_helper *helper =3D (struc=
t drm_fb_helper *)info->par;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct msm_fbdev *fbdev =3D to_msm_fbde=
v(helper);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *bo =3D msm_frame=
buffer_bo(fbdev->fb, 0);
>> -=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> -=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_mmap_obj(bo, bo->size, vma);
>> -=C2=A0=C2=A0=C2=A0 if (ret) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("%s:drm_gem_mmap_ob=
j fail\n", __func__);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0 return msm_gem_mmap_obj(bo, vma);
>> +=C2=A0=C2=A0=C2=A0 return drm_gem_prime_mmap(bo, vma);
>> =C2=A0 }
>> =C2=A0 static int msm_fbdev_create(struct drm_fb_helper *helper,
>> diff --git a/drivers/gpu/drm/msm/msm_gem.c=20
>> b/drivers/gpu/drm/msm/msm_gem.c
>> index b61f5466e522..71d835bc575d 100644
>> --- a/drivers/gpu/drm/msm/msm_gem.c
>> +++ b/drivers/gpu/drm/msm/msm_gem.c
>> @@ -211,46 +211,6 @@ void msm_gem_put_pages(struct drm_gem_object *obj=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msm_gem_unlock(obj);
>> =C2=A0 }
>> -int msm_gem_mmap_obj(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vma=
)
>> -{
>> -=C2=A0=C2=A0=C2=A0 struct msm_gem_object *msm_obj =3D to_msm_bo(obj);=

>> -
>> -=C2=A0=C2=A0=C2=A0 vma->vm_flags &=3D ~VM_PFNMAP;
>> -=C2=A0=C2=A0=C2=A0 vma->vm_flags |=3D VM_MIXEDMAP;
>> -
>> -=C2=A0=C2=A0=C2=A0 if (msm_obj->flags & MSM_BO_WC) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_page_prot =3D=20
>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>> -=C2=A0=C2=A0=C2=A0 } else if (msm_obj->flags & MSM_BO_UNCACHED) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_page_prot =3D=20
>> pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>> -=C2=A0=C2=A0=C2=A0 } else {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Shunt off cached o=
bjs to shmem file so they have their own
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * address_space (so =
unmap_mapping_range does what we want,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * in particular in t=
he case of mmap'd dmabufs)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_pgoff =3D 0;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma_set_file(vma, obj->fil=
p);
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_page_prot =3D vm_g=
et_page_prot(vma->vm_flags);
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0 return 0;
>> -}
>> -
>> -int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>> -{
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_mmap(filp, vma);
>> -=C2=A0=C2=A0=C2=A0 if (ret) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DBG("mmap failed: %d", ret=
);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0 return msm_gem_mmap_obj(vma->vm_private_data, vma)=
;
>> -}
>> -
>> =C2=A0 static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vma =3D vmf->vma=
;
>> @@ -1119,6 +1079,32 @@ void msm_gem_free_object(struct drm_gem_object =

>> *obj)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(msm_obj);
>> =C2=A0 }
>> +static int msm_gem_object_mmap(struct drm_gem_object *obj, struct=20
>> vm_area_struct *vma)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct msm_gem_object *msm_obj =3D to_msm_bo(obj);=

>> +
>> +=C2=A0=C2=A0=C2=A0 vma->vm_flags &=3D ~VM_PFNMAP;
>> +=C2=A0=C2=A0=C2=A0 vma->vm_flags |=3D VM_MIXEDMAP;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (msm_obj->flags & MSM_BO_WC) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_page_prot =3D=20
>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>> +=C2=A0=C2=A0=C2=A0 } else if (msm_obj->flags & MSM_BO_UNCACHED) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_page_prot =3D=20
>> pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Shunt off cached o=
bjs to shmem file so they have their own
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * address_space (so =
unmap_mapping_range does what we want,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * in particular in t=
he case of mmap'd dmabufs)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_pgoff =3D 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma_set_file(vma, obj->fil=
p);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma->vm_page_prot =3D vm_g=
et_page_prot(vma->vm_flags);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> =C2=A0 /* convenience method to construct a GEM buffer object, and=20
>> userspace handle */
>> =C2=A0 int msm_gem_new_handle(struct drm_device *dev, struct drm_file =
*file,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t size, =
uint32_t flags, uint32_t *handle,
>> @@ -1156,6 +1142,7 @@ static const struct drm_gem_object_funcs=20
>> msm_gem_object_funcs =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .get_sg_table =3D msm_gem_prime_get_sg_=
table,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vmap =3D msm_gem_prime_vmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vunmap =3D msm_gem_prime_vunmap,
>> +=C2=A0=C2=A0=C2=A0 .mmap =3D msm_gem_object_mmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vm_ops =3D &vm_ops,
>> =C2=A0 };
>> diff --git a/drivers/gpu/drm/msm/msm_gem.h=20
>> b/drivers/gpu/drm/msm/msm_gem.h
>> index 03e2cc2a2ce1..8508163088a9 100644
>> --- a/drivers/gpu/drm/msm/msm_gem.h
>> +++ b/drivers/gpu/drm/msm/msm_gem.h
>> @@ -112,9 +112,6 @@ struct msm_gem_object {
>> =C2=A0 };
>> =C2=A0 #define to_msm_bo(x) container_of(x, struct msm_gem_object, bas=
e)
>> -int msm_gem_mmap_obj(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct vm_area_struct *vma);
>> -int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>> =C2=A0 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
>> =C2=A0 int msm_gem_get_iova(struct drm_gem_object *obj,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct msm_gem_=
address_space *aspace, uint64_t *iova);
>> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c=20
>> b/drivers/gpu/drm/msm/msm_gem_prime.c
>> index 9880348a4dc7..fc94e061d6a7 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
>> @@ -39,17 +39,6 @@ void msm_gem_prime_vunmap(struct drm_gem_object=20
>> *obj, struct dma_buf_map *map)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msm_gem_put_vaddr(obj);
>> =C2=A0 }
>> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct=20
>> vm_area_struct *vma)
>> -{
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 return msm_gem_mmap_obj(vma->vm_private_data, vma)=
;
>> -}
>> -
>> =C2=A0 struct drm_gem_object *msm_gem_prime_import_sg_table(struct=20
>> drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_=
attachment *attach, struct sg_table *sg)
>> =C2=A0 {
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--y9WCve1kCGMZGvlH00hVkuq5ADwVKsTKz--

--UdoqJxZS5vRGi4Hb2F483wOAdz4sSNKWC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDm7F0FAwAAAAAACgkQlh/E3EQov+B0
+g//UcISuf6Bi1Sl37S+kJSQiUH84leDyFEUl1pjNP5lLzXz0OBpBP/X5ebi+Z8xRk3Do3N+2f8p
TUHNPgkRsYnjD/UqKnt1qdhg4pmPfuR9U5+XKXtqGg3hGjmSEO+jYz6iFP3vL02EeoadO1eQ/oJW
APmvNLRis81CaKIbGxhGS3rI6FtyZ5e0Hw1eEGmiayPiLceyG6ckR+dNMBmLXaHy2Owo1u0odBPv
oLfQAEau0pELLC+IJLScSRtR09g6fWPM38QPcCyx8Py0im1sfd0bqPtQ2LPMOoLzWTFh5csottiU
KY5ZUlGHKta1rzC1mZaNKG9mj5WybUJ4tzYqA+omzuv/yrtHnpb1++uGe8LEeL6FazcpMLwKYoie
oZhqyw/AKlWo33aCTS7J+M6y27/j/mEK9WIQgKKUJNSXRmnoLH4cT+ooEtCC6mb0kNiTufXA/5xB
SB9aphP0+rB9eMnoVALI8uZpAp0QHMwnaWKS0TggG0lIF0jRnHM2s7xe1Aesly24xnRMkwuTxyeQ
Fkf3+DiQE4HBrYmGjiF8/Q/Rc/YLk1d/Iveis0fHXhblWqKrbK98vLrNPEhydynwLMR0F6dgizlQ
G7IrK6kqK2KPbsKYmrGNqkUqDOuB24VaqGZiXYN1ZdPA5vfqufzn0dZRSKz3FXYELeZCLRCIEBkA
h4k=
=tPm/
-----END PGP SIGNATURE-----

--UdoqJxZS5vRGi4Hb2F483wOAdz4sSNKWC--
