Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1F3BF9B1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FC36E8B8;
	Thu,  8 Jul 2021 12:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C3889F27;
 Thu,  8 Jul 2021 12:04:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 559D9201BA;
 Thu,  8 Jul 2021 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625745841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IZMvwLJnwvM+Gg9iQoczaGWGG0dhxSsxtWXgJwtxFuM=;
 b=S5+4jdVfAXgG8799WbPbmAGe9Rb6myofHjnRHWzSHcIOfjJrLP7QMhi95AdK92iEAKN5z+
 O5rDvCrz9S6VGx8f05UXufamBl1p9VzKHeksJg4D2dn1TU+KWs1EUQFvKchYW4DM7vStbk
 kwPGp3j+lRwa4KAE8LDjPemH2T3Bk3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625745841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IZMvwLJnwvM+Gg9iQoczaGWGG0dhxSsxtWXgJwtxFuM=;
 b=Cw9E+6jE4l0PQWB8Q+41heP1GSaBH2rTvJUmAZUYc1bMXf35peQdWdSzFRdeddsSLlGUS+
 0X27NMRHlkThPoCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29AF913BDF;
 Thu,  8 Jul 2021 12:04:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4ntECbHp5mDfUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 12:04:01 +0000
Subject: Re: [PATCH] drm/msm: Implement mmap as GEM object function
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
References: <20210624090341.8249-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6fc2bfe5-2a3a-2e7e-46f9-6c6d400ced0b@suse.de>
Date: Thu, 8 Jul 2021 14:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624090341.8249-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KhPh5XvBct89fMnaTP1nGGPGZO7HCTnDy"
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
--KhPh5XvBct89fMnaTP1nGGPGZO7HCTnDy
Content-Type: multipart/mixed; boundary="eJhsNnlHF4t7qdAnaXkwstQBhFvoQS69M";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Message-ID: <6fc2bfe5-2a3a-2e7e-46f9-6c6d400ced0b@suse.de>
Subject: Re: [PATCH] drm/msm: Implement mmap as GEM object function
References: <20210624090341.8249-1-tzimmermann@suse.de>
In-Reply-To: <20210624090341.8249-1-tzimmermann@suse.de>

--eJhsNnlHF4t7qdAnaXkwstQBhFvoQS69M
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for review

Am 24.06.21 um 11:03 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>=20
> The respective msm functions are being removed. The file_operations
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_drv.c       | 14 +-----
>   drivers/gpu/drm/msm/msm_drv.h       |  1 -
>   drivers/gpu/drm/msm/msm_fbdev.c     | 10 +----
>   drivers/gpu/drm/msm/msm_gem.c       | 67 ++++++++++++----------------=
-
>   drivers/gpu/drm/msm/msm_gem.h       |  3 --
>   drivers/gpu/drm/msm/msm_gem_prime.c | 11 -----
>   6 files changed, 31 insertions(+), 75 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> index fe7d17cd35ec..f62eaedfc0d7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -985,17 +985,7 @@ static const struct drm_ioctl_desc msm_ioctls[] =3D=
 {
>   	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query=
, DRM_RENDER_ALLOW),
>   };
>  =20
> -static const struct file_operations fops =3D {
> -	.owner              =3D THIS_MODULE,
> -	.open               =3D drm_open,
> -	.release            =3D drm_release,
> -	.unlocked_ioctl     =3D drm_ioctl,
> -	.compat_ioctl       =3D drm_compat_ioctl,
> -	.poll               =3D drm_poll,
> -	.read               =3D drm_read,
> -	.llseek             =3D no_llseek,
> -	.mmap               =3D msm_gem_mmap,
> -};
> +DEFINE_DRM_GEM_FOPS(fops);
>  =20
>   static const struct drm_driver msm_driver =3D {
>   	.driver_features    =3D DRIVER_GEM |
> @@ -1015,7 +1005,7 @@ static const struct drm_driver msm_driver =3D {
>   	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>   	.gem_prime_import_sg_table =3D msm_gem_prime_import_sg_table,
> -	.gem_prime_mmap     =3D msm_gem_prime_mmap,
> +	.gem_prime_mmap     =3D drm_gem_prime_mmap,
>   #ifdef CONFIG_DEBUG_FS
>   	.debugfs_init       =3D msm_debugfs_init,
>   #endif
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_dr=
v.h
> index 2668941df529..8f1e0d7c8bbb 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -300,7 +300,6 @@ void msm_gem_shrinker_cleanup(struct drm_device *de=
v);
>   struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *ob=
j);
>   int msm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map=
 *map);
>   void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_=
map *map);
> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_stru=
ct *vma);
>   struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_devic=
e *dev,
>   		struct dma_buf_attachment *attach, struct sg_table *sg);
>   int msm_gem_prime_pin(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_=
fbdev.c
> index 227404077e39..07225907fd2d 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
> +#include <drm/drm_prime.h>
>  =20
>   #include "msm_drv.h"
>   #include "msm_gem.h"
> @@ -48,15 +49,8 @@ static int msm_fbdev_mmap(struct fb_info *info, stru=
ct vm_area_struct *vma)
>   	struct drm_fb_helper *helper =3D (struct drm_fb_helper *)info->par;
>   	struct msm_fbdev *fbdev =3D to_msm_fbdev(helper);
>   	struct drm_gem_object *bo =3D msm_framebuffer_bo(fbdev->fb, 0);
> -	int ret =3D 0;
>  =20
> -	ret =3D drm_gem_mmap_obj(bo, bo->size, vma);
> -	if (ret) {
> -		pr_err("%s:drm_gem_mmap_obj fail\n", __func__);
> -		return ret;
> -	}
> -
> -	return msm_gem_mmap_obj(bo, vma);
> +	return drm_gem_prime_mmap(bo, vma);
>   }
>  =20
>   static int msm_fbdev_create(struct drm_fb_helper *helper,
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> index b61f5466e522..71d835bc575d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -211,46 +211,6 @@ void msm_gem_put_pages(struct drm_gem_object *obj)=

>   	msm_gem_unlock(obj);
>   }
>  =20
> -int msm_gem_mmap_obj(struct drm_gem_object *obj,
> -		struct vm_area_struct *vma)
> -{
> -	struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> -
> -	vma->vm_flags &=3D ~VM_PFNMAP;
> -	vma->vm_flags |=3D VM_MIXEDMAP;
> -
> -	if (msm_obj->flags & MSM_BO_WC) {
> -		vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_f=
lags));
> -	} else if (msm_obj->flags & MSM_BO_UNCACHED) {
> -		vma->vm_page_prot =3D pgprot_noncached(vm_get_page_prot(vma->vm_flag=
s));
> -	} else {
> -		/*
> -		 * Shunt off cached objs to shmem file so they have their own
> -		 * address_space (so unmap_mapping_range does what we want,
> -		 * in particular in the case of mmap'd dmabufs)
> -		 */
> -		vma->vm_pgoff =3D 0;
> -		vma_set_file(vma, obj->filp);
> -
> -		vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> -	}
> -
> -	return 0;
> -}
> -
> -int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	ret =3D drm_gem_mmap(filp, vma);
> -	if (ret) {
> -		DBG("mmap failed: %d", ret);
> -		return ret;
> -	}
> -
> -	return msm_gem_mmap_obj(vma->vm_private_data, vma);
> -}
> -
>   static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
>   {
>   	struct vm_area_struct *vma =3D vmf->vma;
> @@ -1119,6 +1079,32 @@ void msm_gem_free_object(struct drm_gem_object *=
obj)
>   	kfree(msm_obj);
>   }
>  =20
> +static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_a=
rea_struct *vma)
> +{
> +	struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> +
> +	vma->vm_flags &=3D ~VM_PFNMAP;
> +	vma->vm_flags |=3D VM_MIXEDMAP;
> +
> +	if (msm_obj->flags & MSM_BO_WC) {
> +		vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_f=
lags));
> +	} else if (msm_obj->flags & MSM_BO_UNCACHED) {
> +		vma->vm_page_prot =3D pgprot_noncached(vm_get_page_prot(vma->vm_flag=
s));
> +	} else {
> +		/*
> +		 * Shunt off cached objs to shmem file so they have their own
> +		 * address_space (so unmap_mapping_range does what we want,
> +		 * in particular in the case of mmap'd dmabufs)
> +		 */
> +		vma->vm_pgoff =3D 0;
> +		vma_set_file(vma, obj->filp);
> +
> +		vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> +	}
> +
> +	return 0;
> +}
> +
>   /* convenience method to construct a GEM buffer object, and userspace=
 handle */
>   int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,=

>   		uint32_t size, uint32_t flags, uint32_t *handle,
> @@ -1156,6 +1142,7 @@ static const struct drm_gem_object_funcs msm_gem_=
object_funcs =3D {
>   	.get_sg_table =3D msm_gem_prime_get_sg_table,
>   	.vmap =3D msm_gem_prime_vmap,
>   	.vunmap =3D msm_gem_prime_vunmap,
> +	.mmap =3D msm_gem_object_mmap,
>   	.vm_ops =3D &vm_ops,
>   };
>  =20
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> index 03e2cc2a2ce1..8508163088a9 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -112,9 +112,6 @@ struct msm_gem_object {
>   };
>   #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
>  =20
> -int msm_gem_mmap_obj(struct drm_gem_object *obj,
> -			struct vm_area_struct *vma);
> -int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>   uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
>   int msm_gem_get_iova(struct drm_gem_object *obj,
>   		struct msm_gem_address_space *aspace, uint64_t *iova);
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/=
msm_gem_prime.c
> index 9880348a4dc7..fc94e061d6a7 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -39,17 +39,6 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj=
, struct dma_buf_map *map)
>   	msm_gem_put_vaddr(obj);
>   }
>  =20
> -int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_stru=
ct *vma)
> -{
> -	int ret;
> -
> -	ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> -	if (ret < 0)
> -		return ret;
> -
> -	return msm_gem_mmap_obj(vma->vm_private_data, vma);
> -}
> -
>   struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_devic=
e *dev,
>   		struct dma_buf_attachment *attach, struct sg_table *sg)
>   {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eJhsNnlHF4t7qdAnaXkwstQBhFvoQS69M--

--KhPh5XvBct89fMnaTP1nGGPGZO7HCTnDy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDm6bAFAwAAAAAACgkQlh/E3EQov+BY
8A/+OuES7Njvd/kUB8duV1EUcExgqt2uH1wjxWYJXkCuw4yJpKdaVOFmhJjQatltXkUv0ZpD/JoL
gGSYAlBIKheh4lo3pwWuRGV7dZHyNS6YFYvFXNhns+HY+eTb9Z4+Rkw5f3XG1DH8gUwiYAGv+G9b
5fmxRG47BrTBmtGZQmHRUnKsTYxfM/dr+b2YEZq3PovNvjZuDT7lse/rFMQbkvuR7Ii/nrPyhSRj
G4NqiHFy+RF3UJs7CIIajyMY50z9dRMpueXc3ezj1Ne13h/9s1Jq/4cs7rxAoEk9f/aZvUtLqc7x
MkTBQWwNfB/b18QG2J8jLPYzC8A4qdJANy1S76OghmYljXoFjcqvbyNKp4F/zJvMlIMFI4lKEYUA
EKIMDY95MCD6N0eSC0RIvPrwmKjZQf6zHD6Hoi+PwYVtCDtfa+eYICdri/k8qWctRh5e0t5Rjy62
PUclF1DQB2NyGCzbvnZQH+vrfrqEJ3rbwlAvUqJVTKBZOBinSI06c4p1P2C5I3IdLKWZvJjZQ5Lu
NmuSjHK7QHtOrP3LiIjkXK7leF1BNSg5Jai6MUtuUgWsRPlqXzE+uAf6fV1M012g2+cqu8jb9hlW
VNSa0dfJdjmF50pNZcG7eYws7HmZKo1+iAKEboUE03jTF6oWckdLAVTkeaYAGcvKTnE4xsfkn8rO
uKY=
=EqsH
-----END PGP SIGNATURE-----

--KhPh5XvBct89fMnaTP1nGGPGZO7HCTnDy--
