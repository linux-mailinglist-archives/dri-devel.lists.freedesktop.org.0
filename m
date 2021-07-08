Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2482F3BF9B6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4C76E8B5;
	Thu,  8 Jul 2021 12:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932FE6E8B5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:05:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F434220D5;
 Thu,  8 Jul 2021 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625745912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x86zdx99+DRFmmWseHawCr5E5oFbq535MTLP5SjRHBw=;
 b=aOgQKh/DqId+UqVMC3f2ZkBbFqcgdS/I9NBENHYbR19aQPxOYpDJyFzmW9nRhfaRacZs8N
 /jgxpR7UYBkKD4nXwJgjUSJp+2WDV8Ew08/6/9qSLZvlRCPhTtI6ZNB8hTBX6z8RZ8j/hH
 ivp4upuJgobjSWv4WUvCgooq3ZDK2D4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625745912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x86zdx99+DRFmmWseHawCr5E5oFbq535MTLP5SjRHBw=;
 b=vFCImedlM7kL85cnm18aqkMpdI/9G0jjdOrFgJr7h9SnkvS+QwSy2RXlP11gZC2AsmIt+1
 tIl/RgmFKDzDjLDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EED7F13BDF;
 Thu,  8 Jul 2021 12:05:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y4hUOffp5mApUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 12:05:11 +0000
Subject: Re: [PATCH] drm/exynox: Implement mmap as GEM object function
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
 krzysztof.kozlowski@canonical.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
References: <20210624090010.8086-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6ebaed9e-6f86-1e5f-aa33-1a0cb6e825dc@suse.de>
Date: Thu, 8 Jul 2021 14:05:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624090010.8086-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TmncTDefJnHiveBjRrAcgdm9jsyBHY7Pk"
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
Cc: linaro-mm-sig@lists.linaro.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TmncTDefJnHiveBjRrAcgdm9jsyBHY7Pk
Content-Type: multipart/mixed; boundary="idlRb0oF7LIyIGwCLdx8rO7h1hDB3UjDj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
 krzysztof.kozlowski@canonical.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Message-ID: <6ebaed9e-6f86-1e5f-aa33-1a0cb6e825dc@suse.de>
Subject: Re: [PATCH] drm/exynox: Implement mmap as GEM object function
References: <20210624090010.8086-1-tzimmermann@suse.de>
In-Reply-To: <20210624090010.8086-1-tzimmermann@suse.de>

--idlRb0oF7LIyIGwCLdx8rO7h1hDB3UjDj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for review

Am 24.06.21 um 11:00 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>=20
> The respective exynos functions are being removed. The file_operations
> structure exynos_drm_driver_fops is now being created by the helper mac=
ro
> DEFINE_DRM_GEM_FOPS().
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/exynos/exynos_drm_drv.c   | 13 ++-----
>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 ++---------
>   drivers/gpu/drm/exynos/exynos_drm_gem.c   | 43 +++++-----------------=
-
>   drivers/gpu/drm/exynos/exynos_drm_gem.h   |  5 ---
>   4 files changed, 13 insertions(+), 68 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/=
exynos/exynos_drm_drv.c
> index e60257f1f24b..1d46751cad02 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -102,16 +102,7 @@ static const struct drm_ioctl_desc exynos_ioctls[]=
 =3D {
>   			DRM_RENDER_ALLOW),
>   };
>  =20
> -static const struct file_operations exynos_drm_driver_fops =3D {
> -	.owner		=3D THIS_MODULE,
> -	.open		=3D drm_open,
> -	.mmap		=3D exynos_drm_gem_mmap,
> -	.poll		=3D drm_poll,
> -	.read		=3D drm_read,
> -	.unlocked_ioctl	=3D drm_ioctl,
> -	.compat_ioctl =3D drm_compat_ioctl,
> -	.release	=3D drm_release,
> -};
> +DEFINE_DRM_GEM_FOPS(exynos_drm_driver_fops);
>  =20
>   static const struct drm_driver exynos_drm_driver =3D {
>   	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM
> @@ -124,7 +115,7 @@ static const struct drm_driver exynos_drm_driver =3D=
 {
>   	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
>   	.gem_prime_import	=3D exynos_drm_gem_prime_import,
>   	.gem_prime_import_sg_table	=3D exynos_drm_gem_prime_import_sg_table,=

> -	.gem_prime_mmap		=3D exynos_drm_gem_prime_mmap,
> +	.gem_prime_mmap		=3D drm_gem_prime_mmap,
>   	.ioctls			=3D exynos_ioctls,
>   	.num_ioctls		=3D ARRAY_SIZE(exynos_ioctls),
>   	.fops			=3D &exynos_drm_driver_fops,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/dr=
m/exynos/exynos_drm_fbdev.c
> index 5147f5929be7..02c97b9ca926 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -15,6 +15,7 @@
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
> +#include <drm/drm_prime.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/exynos_drm.h>
>  =20
> @@ -39,25 +40,8 @@ static int exynos_drm_fb_mmap(struct fb_info *info,
>   	struct drm_fb_helper *helper =3D info->par;
>   	struct exynos_drm_fbdev *exynos_fbd =3D to_exynos_fbdev(helper);
>   	struct exynos_drm_gem *exynos_gem =3D exynos_fbd->exynos_gem;
> -	unsigned long vm_size;
> -	int ret;
> -
> -	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> -
> -	vm_size =3D vma->vm_end - vma->vm_start;
> -
> -	if (vm_size > exynos_gem->size)
> -		return -EINVAL;
>  =20
> -	ret =3D dma_mmap_attrs(to_dma_dev(helper->dev), vma, exynos_gem->cook=
ie,
> -			     exynos_gem->dma_addr, exynos_gem->size,
> -			     exynos_gem->dma_attrs);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(to_dma_dev(helper->dev), "failed to mmap.\n");
> -		return ret;
> -	}
> -
> -	return 0;
> +	return drm_gem_prime_mmap(&exynos_gem->base, vma);
>   }
>  =20
>   static const struct fb_ops exynos_drm_fb_ops =3D {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/=
exynos/exynos_drm_gem.c
> index 4396224227d1..c4b63902ee7a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -17,6 +17,8 @@
>   #include "exynos_drm_drv.h"
>   #include "exynos_drm_gem.h"
>  =20
> +static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_a=
rea_struct *vma);
> +
>   static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bo=
ol kvmap)
>   {
>   	struct drm_device *dev =3D exynos_gem->base.dev;
> @@ -135,6 +137,7 @@ static const struct vm_operations_struct exynos_drm=
_gem_vm_ops =3D {
>   static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs =
=3D {
>   	.free =3D exynos_drm_gem_free_object,
>   	.get_sg_table =3D exynos_drm_gem_prime_get_sg_table,
> +	.mmap =3D exynos_drm_gem_mmap,
>   	.vm_ops =3D &exynos_drm_gem_vm_ops,
>   };
>  =20
> @@ -354,12 +357,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *f=
ile_priv,
>   	return 0;
>   }
>  =20
> -static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
> -				   struct vm_area_struct *vma)
> +static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_a=
rea_struct *vma)
>   {
>   	struct exynos_drm_gem *exynos_gem =3D to_exynos_gem(obj);
>   	int ret;
>  =20
> +	if (obj->import_attach)
> +		return dma_buf_mmap(obj->dma_buf, vma, 0);
> +
> +	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> +
>   	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags =3D 0x%x\n",
>   			  exynos_gem->flags);
>  =20
> @@ -385,26 +392,6 @@ static int exynos_drm_gem_mmap_obj(struct drm_gem_=
object *obj,
>   	return ret;
>   }
>  =20
> -int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)=

> -{
> -	struct drm_gem_object *obj;
> -	int ret;
> -
> -	/* set vm_area_struct. */
> -	ret =3D drm_gem_mmap(filp, vma);
> -	if (ret < 0) {
> -		DRM_ERROR("failed to mmap.\n");
> -		return ret;
> -	}
> -
> -	obj =3D vma->vm_private_data;
> -
> -	if (obj->import_attach)
> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
> -
> -	return exynos_drm_gem_mmap_obj(obj, vma);
> -}
> -
>   /* low-level interface prime helpers */
>   struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device =
*dev,
>   					    struct dma_buf *dma_buf)
> @@ -466,15 +453,3 @@ exynos_drm_gem_prime_import_sg_table(struct drm_de=
vice *dev,
>   	exynos_gem->sgt =3D sgt;
>   	return &exynos_gem->base;
>   }
> -
> -int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
> -			      struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> -	if (ret < 0)
> -		return ret;
> -
> -	return exynos_drm_gem_mmap_obj(obj, vma);
> -}
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/=
exynos/exynos_drm_gem.h
> index a23272fb96fb..79d7e1a87419 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -96,9 +96,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_=
priv,
>   			       struct drm_device *dev,
>   			       struct drm_mode_create_dumb *args);
>  =20
> -/* set vm_flags and we can change the vm attribute to other one at her=
e. */
> -int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)=
;
> -
>   /* low-level interface prime helpers */
>   struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device =
*dev,
>   					    struct dma_buf *dma_buf);
> @@ -107,7 +104,5 @@ struct drm_gem_object *
>   exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>   				     struct dma_buf_attachment *attach,
>   				     struct sg_table *sgt);
> -int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
> -			      struct vm_area_struct *vma);
>  =20
>   #endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--idlRb0oF7LIyIGwCLdx8rO7h1hDB3UjDj--

--TmncTDefJnHiveBjRrAcgdm9jsyBHY7Pk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDm6fcFAwAAAAAACgkQlh/E3EQov+B8
lw//cRmuoxBlOXmm0LKuC4HcrkTquQpHNmcYzoVsuE7/w4KPs2K/0HFoA8Tiac2GWdxoA+FX3Qut
0UQ+J/bVDuiMLHkgDt38pno8mAaGnKYPZ0cNIPXrSSMFroW7usmM6OBVuGSh94XO+KyIocXPEsvt
YsQiJ4+izOb9Ci+bIQsyoE5/IUobm6YrlQUaE5KQFXf9hZmaEm/VHO/MuPJjf66jQO/YWrGrHa51
B1KeXgTtvIYAvQTLUAQj4mpwsfwHeuqNr+e24J3Cz5WnMiAPcnGxY/grfs1nX3NL944iehWr36l2
/i1RZAkdJcE/3uv9lPCPV1LHYUW82lWZNLNS6BLSuX0wiYtJijuqi8iC8TxdUoGpA3t/YC9RNzfM
YERf7IFKJ/RilXLPthpIV3oJ5ixtVIHxbvNGiz5e7o9U5/ZxRPNNctvayqc3plxnjzWEnGxFZ26z
DQLCCYJ3KxqoEfexnHF3i4rVlnITqWqXiBOJo/LsyKfXqNMOIx4xPThzlSlj3CUy2SqMOwoVVkAW
y+7pHt032T0HuTIZB/GoQc3H+FErW92hgVyYRPDlTWSb4DG+fuL4uUlHJmo9IBA54qs1YgC0c608
l7NlpgOPrkL8qlNVRbX557hvpyPfaJya+4Vv/y6GDFEL4n6EVP9vPLN9FADEN0D/JtpAOeDhQ7f2
LSU=
=yOQP
-----END PGP SIGNATURE-----

--TmncTDefJnHiveBjRrAcgdm9jsyBHY7Pk--
