Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 035843BF9B3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4351C6E8BB;
	Thu,  8 Jul 2021 12:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2A36E8BB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:04:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13CC322293;
 Thu,  8 Jul 2021 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625745874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7GH1thQ2JWwQZFD8WQ4L0889oKgkhJnCtKtbRCFBd0=;
 b=PL8dxrnh5ZOMVhmXwAaRCrXK2sSB8YY2MuyIUw2iTdnvetKNZ+NJmOgj3A6sx6o08o5AWw
 VqUYhj4+Fc5fhNqOuKfhYAAvFEHaDyBxzKL3MxjlZyu1hkXh182g+C6WXa9MIeVLpa+FxG
 EsYHIhy5De5RdbK+qFmHi562qyYO8RA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625745874;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7GH1thQ2JWwQZFD8WQ4L0889oKgkhJnCtKtbRCFBd0=;
 b=kxdnPbDJ8Vj1LVgoVtWhXIKuCjd+1GF1ENIAQ4GfGKWBDr7Z+SsItO8n5N/Fk+nE5LJf7e
 MzeddkGd1BrUgrDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9FD613BDF;
 Thu,  8 Jul 2021 12:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9o49NNHp5mADUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 12:04:33 +0000
Subject: Re: [PATCH] drm/mediatek: Implement mmap as GEM object function
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, matthias.bgg@gmail.com
References: <20210624090126.8167-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bfc36cc4-1efa-8b1d-710d-568ea366d6c5@suse.de>
Date: Thu, 8 Jul 2021 14:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624090126.8167-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7aIhsQVnZUmmjx8X3jpJO4m49lRm2adCx"
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
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7aIhsQVnZUmmjx8X3jpJO4m49lRm2adCx
Content-Type: multipart/mixed; boundary="cKFGqa1ZsEmq5ZxZsYSqjQWhAakFmZQ1y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Message-ID: <bfc36cc4-1efa-8b1d-710d-568ea366d6c5@suse.de>
Subject: Re: [PATCH] drm/mediatek: Implement mmap as GEM object function
References: <20210624090126.8167-1-tzimmermann@suse.de>
In-Reply-To: <20210624090126.8167-1-tzimmermann@suse.de>

--cKFGqa1ZsEmq5ZxZsYSqjQWhAakFmZQ1y
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for review

Am 24.06.21 um 11:01 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>=20
> The respective mediatek functions are being removed. The file_operation=
s
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 13 ++------
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 44 +++++++------------------=
-
>   drivers/gpu/drm/mediatek/mtk_drm_gem.h |  3 --
>   3 files changed, 14 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_drv.c
> index b46bdb8985da..bbfefb29c211 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -300,16 +300,7 @@ static void mtk_drm_kms_deinit(struct drm_device *=
drm)
>   	component_unbind_all(drm->dev, drm);
>   }
>  =20
> -static const struct file_operations mtk_drm_fops =3D {
> -	.owner =3D THIS_MODULE,
> -	.open =3D drm_open,
> -	.release =3D drm_release,
> -	.unlocked_ioctl =3D drm_ioctl,
> -	.mmap =3D mtk_drm_gem_mmap,
> -	.poll =3D drm_poll,
> -	.read =3D drm_read,
> -	.compat_ioctl =3D drm_compat_ioctl,
> -};
> +DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
>  =20
>   /*
>    * We need to override this because the device used to import the mem=
ory is
> @@ -332,7 +323,7 @@ static const struct drm_driver mtk_drm_driver =3D {=

>   	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>   	.gem_prime_import =3D mtk_drm_gem_prime_import,
>   	.gem_prime_import_sg_table =3D mtk_gem_prime_import_sg_table,
> -	.gem_prime_mmap =3D mtk_drm_gem_mmap_buf,
> +	.gem_prime_mmap =3D drm_gem_prime_mmap,
>   	.fops =3D &mtk_drm_fops,
>  =20
>   	.name =3D DRIVER_NAME,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_gem.c
> index 280ea0d5e840..d0544962cfc1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -14,11 +14,14 @@
>   #include "mtk_drm_drv.h"
>   #include "mtk_drm_gem.h"
>  =20
> +static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj, struct =
vm_area_struct *vma);
> +
>   static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs =3D=
 {
>   	.free =3D mtk_drm_gem_free_object,
>   	.get_sg_table =3D mtk_gem_prime_get_sg_table,
>   	.vmap =3D mtk_drm_gem_prime_vmap,
>   	.vunmap =3D mtk_drm_gem_prime_vunmap,
> +	.mmap =3D mtk_drm_gem_object_mmap,
>   	.vm_ops =3D &drm_gem_cma_vm_ops,
>   };
>  =20
> @@ -145,11 +148,19 @@ static int mtk_drm_gem_object_mmap(struct drm_gem=
_object *obj,
>   	struct mtk_drm_gem_obj *mtk_gem =3D to_mtk_gem_obj(obj);
>   	struct mtk_drm_private *priv =3D obj->dev->dev_private;
>  =20
> +	/*
> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map th=
e
> +	 * whole buffer from the start.
> +	 */
> +	vma->vm_pgoff =3D 0;
> +
>   	/*
>   	 * dma_alloc_attrs() allocated a struct page table for mtk_gem, so c=
lear
>   	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().=

>   	 */
> -	vma->vm_flags &=3D ~VM_PFNMAP;
> +	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> +	vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_fl=
ags));
> +	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>  =20
>   	ret =3D dma_mmap_attrs(priv->dma_dev, vma, mtk_gem->cookie,
>   			     mtk_gem->dma_addr, obj->size, mtk_gem->dma_attrs);
> @@ -159,37 +170,6 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_=
object *obj,
>   	return ret;
>   }
>  =20
> -int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj, struct vm_area_st=
ruct *vma)
> -{
> -	int ret;
> -
> -	ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> -	if (ret)
> -		return ret;
> -
> -	return mtk_drm_gem_object_mmap(obj, vma);
> -}
> -
> -int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	struct drm_gem_object *obj;
> -	int ret;
> -
> -	ret =3D drm_gem_mmap(filp, vma);
> -	if (ret)
> -		return ret;
> -
> -	obj =3D vma->vm_private_data;
> -
> -	/*
> -	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map th=
e
> -	 * whole buffer from the start.
> -	 */
> -	vma->vm_pgoff =3D 0;
> -
> -	return mtk_drm_gem_object_mmap(obj, vma);
> -}
> -
>   /*
>    * Allocate a sg_table for this GEM object.
>    * Note: Both the table's contents, and the sg_table itself must be f=
reed by
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_gem.h
> index 6da5ccb4b933..9a359a06cb73 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> @@ -39,9 +39,6 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm=
_device *dev, size_t size,
>   					   bool alloc_kmap);
>   int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_de=
vice *dev,
>   			    struct drm_mode_create_dumb *args);
> -int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj,
> -			 struct vm_area_struct *vma);
>   struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *ob=
j);
>   struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_devic=
e *dev,
>   			struct dma_buf_attachment *attach, struct sg_table *sg);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cKFGqa1ZsEmq5ZxZsYSqjQWhAakFmZQ1y--

--7aIhsQVnZUmmjx8X3jpJO4m49lRm2adCx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDm6dEFAwAAAAAACgkQlh/E3EQov+DJ
8hAAxqa6jZBGmkdWfCxGkAnp6HMWf0cUHxsxjcGrJsALOHE9TTGy4vIO7etzGXAxliD9yxggC0bL
R434+PdJJojQGmHtouNWy0AfK5JOsjPm/hTNCpoSJ1O2l8TMn4buYUgTuJFZrPWVzo13HIWa/oQv
jNDnfB5WaBuVRpYv5Cj7w2lKuB6v0PlaMY2N5qjKp4WSZzEeL7+0JQNM2fVR9RRYSChyLXqFaORP
VlwWGKrUcIiCfj6QvaEHeI8h3byif5U/Yx+7HmRrEW/fnOc02QZzWO0LtOU1KKAPOAlXcicAUp7s
ATOpIowdwQKRuPYOPufgJshJMeiVldddx/+08DHbe9/VEfwaN9+TYqA+1XSdQsTIkWyAMLxm2com
1ymR3z8bOVv6IlSV/qnp9IMNaJ10Y5IU503yqBnwBkAgA+fOiSTYKZjuZoWm3dVh6eOEo/BYJkVX
pt/BSlr+cahBmtA95FQCNG/nONVTdhFAgN0uxXhd/TibLR/JZ99ZtM4JORGQqQpu6qoo2M4BpGhV
wwmQ8AJhUwBE5GK7xVXVMRYf+63jQn4e5f7xNqVrCBexzhSf6ssxNT1bijIRUwLty1Yn3wwBfPSj
RqFtxTZbIxGZ8k1NS5SLno7AtbJKC5LeAiaTQEUP7+XTsa/1JevrjRj1uDDhMBQ+PMu74Rmy2Foh
yPA=
=gg2+
-----END PGP SIGNATURE-----

--7aIhsQVnZUmmjx8X3jpJO4m49lRm2adCx--
