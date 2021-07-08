Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8573BF9A8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D376E218;
	Thu,  8 Jul 2021 12:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717AB6E218
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:01:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFBF8201B9;
 Thu,  8 Jul 2021 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625745691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z/XC84Y8Csxe3fvQCmTMHrEy9tJGik1nSS43Bv0YSE4=;
 b=i1oLh3jlXbaIaof5XFzjQirDKFl4hmbHDxPInh1680+hXGScuAMyq9774ZGf+u/tD6Rxpe
 I3yeCN56GyLO7oEmbOCANKvacgepArNrYPk4brvLN27SudevO+UD9ZHYjFjeISnGQm8TJV
 B6+lvFIFLD7ZK/DZC4JxlO3ZPRJeBx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625745691;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z/XC84Y8Csxe3fvQCmTMHrEy9tJGik1nSS43Bv0YSE4=;
 b=wbibhFklhb2F197H6w/nIqvAl2ob/HuHrkNuPjL46VRqRgyOV8epQ1ylmrSgGg0qyJlBBY
 eYTs5zxjlsz+MzDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9338313BDF;
 Thu,  8 Jul 2021 12:01:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZGp2Ihvp5mAoUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 12:01:31 +0000
Subject: Re: [PATCH] drm/rockchip: Implement mmap as GEM object function
To: hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch
References: <20210624095502.8945-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <30a0370e-b2b6-9579-7b31-6bc7d68fc8e9@suse.de>
Date: Thu, 8 Jul 2021 14:01:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624095502.8945-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CTdv7Jmn98K7iDS4AqCQfuaXv0HI4etoz"
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CTdv7Jmn98K7iDS4AqCQfuaXv0HI4etoz
Content-Type: multipart/mixed; boundary="bwmEIjXADoZPGnv76DXn81uZ0iTjyK82w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Message-ID: <30a0370e-b2b6-9579-7b31-6bc7d68fc8e9@suse.de>
Subject: Re: [PATCH] drm/rockchip: Implement mmap as GEM object function
References: <20210624095502.8945-1-tzimmermann@suse.de>
In-Reply-To: <20210624095502.8945-1-tzimmermann@suse.de>

--bwmEIjXADoZPGnv76DXn81uZ0iTjyK82w
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for review

Am 24.06.21 um 11:55 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>=20
> The respective rockchip functions are being removed. The file_operation=
s
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   | 13 +-----
>   drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  3 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 44 +++++-------------=
-
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |  7 ---
>   4 files changed, 15 insertions(+), 52 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_drv.c
> index b730b8d5d949..2e3ab573a817 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -208,16 +208,7 @@ static void rockchip_drm_unbind(struct device *dev=
)
>   	drm_dev_put(drm_dev);
>   }
>  =20
> -static const struct file_operations rockchip_drm_driver_fops =3D {
> -	.owner =3D THIS_MODULE,
> -	.open =3D drm_open,
> -	.mmap =3D rockchip_gem_mmap,
> -	.poll =3D drm_poll,
> -	.read =3D drm_read,
> -	.unlocked_ioctl =3D drm_ioctl,
> -	.compat_ioctl =3D drm_compat_ioctl,
> -	.release =3D drm_release,
> -};
> +DEFINE_DRM_GEM_FOPS(rockchip_drm_driver_fops);
>  =20
>   static const struct drm_driver rockchip_drm_driver =3D {
>   	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> @@ -226,7 +217,7 @@ static const struct drm_driver rockchip_drm_driver =
=3D {
>   	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
>   	.gem_prime_import_sg_table	=3D rockchip_gem_prime_import_sg_table,
> -	.gem_prime_mmap		=3D rockchip_gem_mmap_buf,
> +	.gem_prime_mmap		=3D drm_gem_prime_mmap,
>   	.fops			=3D &rockchip_drm_driver_fops,
>   	.name	=3D DRIVER_NAME,
>   	.desc	=3D DRIVER_DESC,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gp=
u/drm/rockchip/rockchip_drm_fbdev.c
> index 2fdc455c4ad7..d8418dd39d0e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
> +#include <drm/drm_prime.h>
>   #include <drm/drm_probe_helper.h>
>  =20
>   #include "rockchip_drm_drv.h"
> @@ -24,7 +25,7 @@ static int rockchip_fbdev_mmap(struct fb_info *info,
>   	struct drm_fb_helper *helper =3D info->par;
>   	struct rockchip_drm_private *private =3D to_drm_private(helper);
>  =20
> -	return rockchip_gem_mmap_buf(private->fbdev_bo, vma);
> +	return drm_gem_prime_mmap(private->fbdev_bo, vma);
>   }
>  =20
>   static const struct fb_ops rockchip_drm_fbdev_ops =3D {
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_gem.c
> index 7971f57436dd..63eb73b624aa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -240,12 +240,22 @@ static int rockchip_drm_gem_object_mmap(struct dr=
m_gem_object *obj,
>   	int ret;
>   	struct rockchip_gem_object *rk_obj =3D to_rockchip_obj(obj);
>  =20
> +	/*
> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map th=
e
> +	 * whole buffer from the start.
> +	 */
> +	vma->vm_pgoff =3D 0;
> +
>   	/*
>   	 * We allocated a struct page table for rk_obj, so clear
>   	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().=

>   	 */
> +	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>   	vma->vm_flags &=3D ~VM_PFNMAP;
>  =20
> +	vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_fl=
ags));
> +	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
> +
>   	if (rk_obj->pages)
>   		ret =3D rockchip_drm_gem_object_mmap_iommu(obj, vma);
>   	else
> @@ -257,39 +267,6 @@ static int rockchip_drm_gem_object_mmap(struct drm=
_gem_object *obj,
>   	return ret;
>   }
>  =20
> -int rockchip_gem_mmap_buf(struct drm_gem_object *obj,
> -			  struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> -	if (ret)
> -		return ret;
> -
> -	return rockchip_drm_gem_object_mmap(obj, vma);
> -}
> -
> -/* drm driver mmap file operations */
> -int rockchip_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	struct drm_gem_object *obj;
> -	int ret;
> -
> -	ret =3D drm_gem_mmap(filp, vma);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map th=
e
> -	 * whole buffer from the start.
> -	 */
> -	vma->vm_pgoff =3D 0;
> -
> -	obj =3D vma->vm_private_data;
> -
> -	return rockchip_drm_gem_object_mmap(obj, vma);
> -}
> -
>   static void rockchip_gem_release_object(struct rockchip_gem_object *r=
k_obj)
>   {
>   	drm_gem_object_release(&rk_obj->base);
> @@ -301,6 +278,7 @@ static const struct drm_gem_object_funcs rockchip_g=
em_object_funcs =3D {
>   	.get_sg_table =3D rockchip_gem_prime_get_sg_table,
>   	.vmap =3D rockchip_gem_prime_vmap,
>   	.vunmap	=3D rockchip_gem_prime_vunmap,
> +	.mmap =3D rockchip_drm_gem_object_mmap,
>   	.vm_ops =3D &drm_gem_cma_vm_ops,
>   };
>  =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h b/drivers/gpu/=
drm/rockchip/rockchip_drm_gem.h
> index 5a70a56cd406..47c1861eece0 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
> @@ -34,13 +34,6 @@ rockchip_gem_prime_import_sg_table(struct drm_device=
 *dev,
>   int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_bu=
f_map *map);
>   void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma=
_buf_map *map);
>  =20
> -/* drm driver mmap file operations */
> -int rockchip_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -
> -/* mmap a gem object to userspace. */
> -int rockchip_gem_mmap_buf(struct drm_gem_object *obj,
> -			  struct vm_area_struct *vma);
> -
>   struct rockchip_gem_object *
>   	rockchip_gem_create_object(struct drm_device *drm, unsigned int size=
,
>   				   bool alloc_kmap);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--bwmEIjXADoZPGnv76DXn81uZ0iTjyK82w--

--CTdv7Jmn98K7iDS4AqCQfuaXv0HI4etoz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDm6RsFAwAAAAAACgkQlh/E3EQov+AB
fQ//awAlpYxZCeLpyqjWWOEURZl7agv2KjhOJfTMXo5oGaqxXRf/leTtvf7IVNMfMPFwYegjOt17
LIuKNy91qXO4ZanI+yuMyMF0nwav7caFB8n5lhocCB9TsnCm3Xr0ciOoVbH6VA+shcjznvXYLjta
ZfROcyCvDY1/Wfi+EAgtG8wzFzXgJZrXOw/mHjXx26HiXk+EFQ/Gn/ADFGoIp6yz+LFqD5ChSWMq
4Qflx8pr46PfojV3P3DU0QpNSDClkLnh/5qMr1HOFSyGqcGuw2mf4lxjmfPS3Z2R7YjWtMSAKSXd
xaWjf789APtN7gVlZm1eOOEx7skYuULK4dJPaoCEZ3oOlW9V8X9AW7qNwBRcE4e1ixG0uoke6/Ok
Cqmvu2e53P436nOWcNW+CbN/xI2wutkwsJdO3TBKb8csm/Y8xs5yAkrjpPC6HqO+tndWOl8Xa5Pb
zSRpnvy/6oFa+4Tdp+TMVOHKk0VTjzk7Pred9WP6SKiBC0QSai4hmTA8DltiqqawymWggs9jkHLA
m2CAfbPuHPpQUdeMX6HaWgYRCk7zg/ldZF6EG7eDouwsiYkrUNs6YZEtZiTupervbjgYZ4vpLDZb
KLP7cZT0Y3CHWk0vPI7hjYoda5l3THeDodlH8aqG1Mhyqe/21lAGMYHEjAXsPWmjP2DsxFTbDf1M
rn8=
=bWCU
-----END PGP SIGNATURE-----

--CTdv7Jmn98K7iDS4AqCQfuaXv0HI4etoz--
