Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C73BF9AB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B416E21A;
	Thu,  8 Jul 2021 12:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8336E21A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:02:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ECEFE201B9;
 Thu,  8 Jul 2021 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625745775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bqk4P66kfUPF0nZTSeMx/UpEB11u4JVq6Vaz9UQ/2c=;
 b=uk09hWmclWAeIBNVTmsoMVNS8+g9imZXMylOus6mqzkEhl3bzviQfYbzVis/78Iez3OU37
 MmwaA7HNsOjaEs01OF3I3vlJiSnEHVdV1Rrs9g2VoY/8ez8OSeMZPdcH1GbuTXPk3hnnnT
 oL+KpPuiDNRPzTYvEzrF+6uzVyj0xh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625745775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bqk4P66kfUPF0nZTSeMx/UpEB11u4JVq6Vaz9UQ/2c=;
 b=Dj7dVUL4IbxxFeR/bXTHKkjkeMSkjsxP+i7O0Y7OsgIjwi2anUO7vduH6vnTDk1QfZ5+1j
 9QLQovxiZUjZgpAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBBF213BDF;
 Thu,  8 Jul 2021 12:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uLSBMG/p5mCTUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 12:02:55 +0000
Subject: Re: [PATCH] drm/xen: Implement mmap as GEM object function
To: oleksandr_andrushchenko@epam.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210624095349.8874-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <02731933-2404-5834-a0bf-6aacbafa6cd1@suse.de>
Date: Thu, 8 Jul 2021 14:02:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624095349.8874-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sz55DMZojMrMiKXiWuCunu8RrlyzGWBGd"
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
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sz55DMZojMrMiKXiWuCunu8RrlyzGWBGd
Content-Type: multipart/mixed; boundary="2cnUca9kI22p8Xjoc733cFC69OgALfHLy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: oleksandr_andrushchenko@epam.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
Message-ID: <02731933-2404-5834-a0bf-6aacbafa6cd1@suse.de>
Subject: Re: [PATCH] drm/xen: Implement mmap as GEM object function
References: <20210624095349.8874-1-tzimmermann@suse.de>
In-Reply-To: <20210624095349.8874-1-tzimmermann@suse.de>

--2cnUca9kI22p8Xjoc733cFC69OgALfHLy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for review

Am 24.06.21 um 11:53 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>=20
> The respective xen functions are being removed. The file_operations
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/xen/xen_drm_front.c     |  16 +---
>   drivers/gpu/drm/xen/xen_drm_front_gem.c | 108 +++++++++--------------=
-
>   drivers/gpu/drm/xen/xen_drm_front_gem.h |   7 --
>   3 files changed, 44 insertions(+), 87 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/=
xen_drm_front.c
> index 9f14d99c763c..434064c820e8 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -469,19 +469,7 @@ static void xen_drm_drv_release(struct drm_device =
*dev)
>   	kfree(drm_info);
>   }
>  =20
> -static const struct file_operations xen_drm_dev_fops =3D {
> -	.owner          =3D THIS_MODULE,
> -	.open           =3D drm_open,
> -	.release        =3D drm_release,
> -	.unlocked_ioctl =3D drm_ioctl,
> -#ifdef CONFIG_COMPAT
> -	.compat_ioctl   =3D drm_compat_ioctl,
> -#endif
> -	.poll           =3D drm_poll,
> -	.read           =3D drm_read,
> -	.llseek         =3D no_llseek,
> -	.mmap           =3D xen_drm_front_gem_mmap,
> -};
> +DEFINE_DRM_GEM_FOPS(xen_drm_dev_fops);
>  =20
>   static const struct drm_driver xen_drm_driver =3D {
>   	.driver_features           =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_=
ATOMIC,
> @@ -489,7 +477,7 @@ static const struct drm_driver xen_drm_driver =3D {=

>   	.prime_handle_to_fd        =3D drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle        =3D drm_gem_prime_fd_to_handle,
>   	.gem_prime_import_sg_table =3D xen_drm_front_gem_import_sg_table,
> -	.gem_prime_mmap            =3D xen_drm_front_gem_prime_mmap,
> +	.gem_prime_mmap            =3D drm_gem_prime_mmap,
>   	.dumb_create               =3D xen_drm_drv_dumb_create,
>   	.fops                      =3D &xen_drm_dev_fops,
>   	.name                      =3D "xendrm-du",
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/=
xen/xen_drm_front_gem.c
> index b293c67230ef..dd358ba2bf8e 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -57,6 +57,47 @@ static void gem_free_pages_array(struct xen_gem_obje=
ct *xen_obj)
>   	xen_obj->pages =3D NULL;
>   }
>  =20
> +static int xen_drm_front_gem_object_mmap(struct drm_gem_object *gem_ob=
j,
> +					 struct vm_area_struct *vma)
> +{
> +	struct xen_gem_object *xen_obj =3D to_xen_gem_obj(gem_obj);
> +	int ret;
> +
> +	vma->vm_ops =3D gem_obj->funcs->vm_ops;
> +
> +	/*
> +	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set t=
he
> +	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to =
map
> +	 * the whole buffer.
> +	 */
> +	vma->vm_flags &=3D ~VM_PFNMAP;
> +	vma->vm_flags |=3D VM_MIXEDMAP;
> +	vma->vm_pgoff =3D 0;
> +
> +	/*
> +	 * According to Xen on ARM ABI (xen/include/public/arch-arm.h):
> +	 * all memory which is shared with other entities in the system
> +	 * (including the hypervisor and other guests) must reside in memory
> +	 * which is mapped as Normal Inner Write-Back Outer Write-Back
> +	 * Inner-Shareable.
> +	 */
> +	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> +
> +	/*
> +	 * vm_operations_struct.fault handler will be called if CPU access
> +	 * to VM is here. For GPUs this isn't the case, because CPU  doesn't
> +	 * touch the memory. Insert pages now, so both CPU and GPU are happy.=

> +	 *
> +	 * FIXME: as we insert all the pages now then no .fault handler must
> +	 * be called, so don't provide one
> +	 */
> +	ret =3D vm_map_pages(vma, xen_obj->pages, xen_obj->num_pages);
> +	if (ret < 0)
> +		DRM_ERROR("Failed to map pages into vma: %d\n", ret);
> +
> +	return ret;
> +}
> +
>   static const struct vm_operations_struct xen_drm_drv_vm_ops =3D {
>   	.open           =3D drm_gem_vm_open,
>   	.close          =3D drm_gem_vm_close,
> @@ -67,6 +108,7 @@ static const struct drm_gem_object_funcs xen_drm_fro=
nt_gem_object_funcs =3D {
>   	.get_sg_table =3D xen_drm_front_gem_get_sg_table,
>   	.vmap =3D xen_drm_front_gem_prime_vmap,
>   	.vunmap =3D xen_drm_front_gem_prime_vunmap,
> +	.mmap =3D xen_drm_front_gem_object_mmap,
>   	.vm_ops =3D &xen_drm_drv_vm_ops,
>   };
>  =20
> @@ -238,58 +280,6 @@ xen_drm_front_gem_import_sg_table(struct drm_devic=
e *dev,
>   	return &xen_obj->base;
>   }
>  =20
> -static int gem_mmap_obj(struct xen_gem_object *xen_obj,
> -			struct vm_area_struct *vma)
> -{
> -	int ret;
> -
> -	/*
> -	 * clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set t=
he
> -	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to =
map
> -	 * the whole buffer.
> -	 */
> -	vma->vm_flags &=3D ~VM_PFNMAP;
> -	vma->vm_flags |=3D VM_MIXEDMAP;
> -	vma->vm_pgoff =3D 0;
> -	/*
> -	 * According to Xen on ARM ABI (xen/include/public/arch-arm.h):
> -	 * all memory which is shared with other entities in the system
> -	 * (including the hypervisor and other guests) must reside in memory
> -	 * which is mapped as Normal Inner Write-Back Outer Write-Back
> -	 * Inner-Shareable.
> -	 */
> -	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> -
> -	/*
> -	 * vm_operations_struct.fault handler will be called if CPU access
> -	 * to VM is here. For GPUs this isn't the case, because CPU
> -	 * doesn't touch the memory. Insert pages now, so both CPU and GPU ar=
e
> -	 * happy.
> -	 * FIXME: as we insert all the pages now then no .fault handler must
> -	 * be called, so don't provide one
> -	 */
> -	ret =3D vm_map_pages(vma, xen_obj->pages, xen_obj->num_pages);
> -	if (ret < 0)
> -		DRM_ERROR("Failed to map pages into vma: %d\n", ret);
> -
> -	return ret;
> -}
> -
> -int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *v=
ma)
> -{
> -	struct xen_gem_object *xen_obj;
> -	struct drm_gem_object *gem_obj;
> -	int ret;
> -
> -	ret =3D drm_gem_mmap(filp, vma);
> -	if (ret < 0)
> -		return ret;
> -
> -	gem_obj =3D vma->vm_private_data;
> -	xen_obj =3D to_xen_gem_obj(gem_obj);
> -	return gem_mmap_obj(xen_obj, vma);
> -}
> -
>   int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj, stru=
ct dma_buf_map *map)
>   {
>   	struct xen_gem_object *xen_obj =3D to_xen_gem_obj(gem_obj);
> @@ -313,17 +303,3 @@ void xen_drm_front_gem_prime_vunmap(struct drm_gem=
_object *gem_obj,
>   {
>   	vunmap(map->vaddr);
>   }
> -
> -int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
> -				 struct vm_area_struct *vma)
> -{
> -	struct xen_gem_object *xen_obj;
> -	int ret;
> -
> -	ret =3D drm_gem_mmap_obj(gem_obj, gem_obj->size, vma);
> -	if (ret < 0)
> -		return ret;
> -
> -	xen_obj =3D to_xen_gem_obj(gem_obj);
> -	return gem_mmap_obj(xen_obj, vma);
> -}
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.h b/drivers/gpu/drm/=
xen/xen_drm_front_gem.h
> index a4e67d0a149c..eaea470f7001 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.h
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.h
> @@ -15,9 +15,7 @@ struct dma_buf_attachment;
>   struct dma_buf_map;
>   struct drm_device;
>   struct drm_gem_object;
> -struct file;
>   struct sg_table;
> -struct vm_area_struct;
>  =20
>   struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *de=
v,
>   						size_t size);
> @@ -33,15 +31,10 @@ struct page **xen_drm_front_gem_get_pages(struct dr=
m_gem_object *obj);
>  =20
>   void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *ge=
m_obj);
>  =20
> -int xen_drm_front_gem_mmap(struct file *filp, struct vm_area_struct *v=
ma);
> -
>   int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
>   				 struct dma_buf_map *map);
>  =20
>   void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
>   				    struct dma_buf_map *map);
>  =20
> -int xen_drm_front_gem_prime_mmap(struct drm_gem_object *gem_obj,
> -				 struct vm_area_struct *vma);
> -
>   #endif /* __XEN_DRM_FRONT_GEM_H */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--2cnUca9kI22p8Xjoc733cFC69OgALfHLy--

--sz55DMZojMrMiKXiWuCunu8RrlyzGWBGd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDm6W8FAwAAAAAACgkQlh/E3EQov+CG
Jw//VGeqNQ9YnFxiPMekzgOrmQfYifS4YcOAyiOaYd/1DyR7shk9AhVWU1DtO9P4Aj09WZB81sIW
8aOwARPN5nDKTNHjQMJD6EU5spAm5tUB7hV3p9Iw0Z74LTsyAESh5rSZhIWQFRyDppFNDMH+KeSp
4jS1N5vemsUH/lmiBvsEwq/UYlSKb++LsLfGfP7hknz3msUiwL69pVoYHtnnurY9xlDX6xvc0e/S
fuwPhWJofLQzCa4WKtuyXGaA5sl+mMl4OOGTQAxZXRl67uo1k4CH28zrOFd/YbP/KBYDFODtTpGu
4KtxcTTmrFvoJT5non3diBAJ7/RGIIWU4ElOZtBIvvHtRGfnf4IB1WbYNQLcy7v5uXfDb7fnfk8f
9ifVrXDIDZA6PBX7j7+fDdsKUgXCSxk/ypFQ8o19j/Gv/6hKV5foZM/W5zc2cMkCCkHkwPoOnUwa
8eM3qR10bNSi94D/ceNAOwnC1AMUShVMI/hhzVnosXGS5MfAREZWO16bnmNrBZI+39wGKK90N+6q
pn0um17obu298jqH57Z8cVCWGTL78tAHPmcZakfQ65FM7deD7dTTYLoJMugWMmzUWbD7ra0npqU2
AjCutzmUsef/bYfH3whAMyUTkiW7iF5TnWC5UIFKmaogcXly8ivp4XOiVmXCeOSUttWsyuk61zOZ
MCM=
=p5NF
-----END PGP SIGNATURE-----

--sz55DMZojMrMiKXiWuCunu8RrlyzGWBGd--
