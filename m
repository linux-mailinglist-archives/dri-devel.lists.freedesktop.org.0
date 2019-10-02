Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FC3C90F4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 20:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF056E17A;
	Wed,  2 Oct 2019 18:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3D36E17A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 18:37:41 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p10so16058771qkg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 11:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hmkljFFljXmUCd81gkqEPnlDGOwA606Mp326C3x3A34=;
 b=di3anoabRPQbKkFZEHrggIeIrbo0GW/Axt6OngXp1D6jZYax3cdO7JBhJ7KdCEPfy0
 md9++nO/aebnIZiMuQCuQGzDRMcg/xWlWMhknYA+IZlqU4k51uMaJUDr8zyw53RsVw5F
 cEiaWg8zhgU1mfEo1s1WVklpD9jcC+rDlyukwMKO7zhXBRfUyLFrjVTcc3F2EWDgtSNX
 71Euq+fUPklSA5VF3uxfzzq0MYhM4zHqjUNHaWQ83R0mCtmMgbFy46HPdYyZPT9f9Rry
 f9G9oJCDQ5tWYtM/hnh1w+J3KREO9EsSGl39p1maJzoUr0duHn2hp2P3OgRw336IrGdi
 dmBg==
X-Gm-Message-State: APjAAAXyvyHE0ug1n47/Q1MxB/qWjS2W6YYWH8o3RwVhw3wJi3XG3XvB
 +NsGWUzezpZVHZCWGfDM52E=
X-Google-Smtp-Source: APXvYqyoB0rBexauzNY+C+T1PPOjxoxYmFTr57TWMUqNPdvy0maLPWVetw7XAHKSmYLcngr8beaSjw==
X-Received: by 2002:a37:6651:: with SMTP id a78mr205001qkc.474.1570041460105; 
 Wed, 02 Oct 2019 11:37:40 -0700 (PDT)
Received: from smtp.gmail.com ([132.205.230.8])
 by smtp.gmail.com with ESMTPSA id l189sm4868qke.69.2019.10.02.11.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 11:37:39 -0700 (PDT)
Date: Wed, 2 Oct 2019 15:37:38 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Oleg Vasilev <omrigann@gmail.com>
Subject: Re: [PATCH] drm/vkms: prime import support
Message-ID: <20191002183738.n4jfe6znfjfipxut@smtp.gmail.com>
References: <20190930155924.21845-1-oleg.vasilev@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190930155924.21845-1-oleg.vasilev@intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hmkljFFljXmUCd81gkqEPnlDGOwA606Mp326C3x3A34=;
 b=iY13pQdYe/D1y0d74jchNDGnnczJ8fj8n23adgCWrNehH47zvS5qo7HpmJ56ojDN2i
 JyrEaPRTGQCKO9FeY16Gp8YF00Y7hzMEv0z29wa+MeGAlFApih4NX5aom9Y5GK2zbCVu
 mZse7SOrQZNCQp7w2vxzUuk2dXqZGn0CKXg7UsrIJuSLViS7xD/PvuEOXCDfanKy2Hi4
 gH5FI5kMDiy1298maykjT23yrlJBWMw7XYpgKSY/QyizgE6DiJoM6k4l330TilFpCalI
 9+WzpDhnJ2vYIXMpi2keRPItPMkazE7Zl20xD61mXPp7f5eOr43ettF7Cx2hEI3lHKBW
 XW3w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Simon Ser <simon.ser@intel.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0534958951=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0534958951==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ypbkjrg7z6xsdy3z"
Content-Disposition: inline


--ypbkjrg7z6xsdy3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Oleg,

Thanks for your patch, I'll apply it soon.

Tested-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

On 09/30, Oleg Vasilev wrote:
> Bring dmabuf sharing through implementing prime_import_sg_table callback.
> This will help to validate userspace conformance in prime configurations
> without using any actual hardware (e.g. in the cloud).
>=20
> This enables kms_prime IGT testcase on vkms.
>=20
> V2:
>  - Rodrigo: styleguide + return code check
> V3:
>  - Rodrigo: remove redundant vkms_gem_create_private
>=20
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Simon Ser <simon.ser@intel.com>
> Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
> Signed-off-by: Oleg Vasilev <omrigann@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 12 ++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.h |  6 ++++++
>  drivers/gpu/drm/vkms/vkms_gem.c | 27 +++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 80524a22412a..54703463d966 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -11,7 +11,9 @@
> =20
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> =20
> +#include <drm/drm_gem.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> @@ -103,6 +105,8 @@ static struct drm_driver vkms_driver =3D {
>  	.gem_vm_ops		=3D &vkms_gem_vm_ops,
>  	.gem_free_object_unlocked =3D vkms_gem_free_object,
>  	.get_vblank_timestamp	=3D vkms_get_vblank_timestamp,
> +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> +	.gem_prime_import_sg_table =3D vkms_prime_import_sg_table,
> =20
>  	.name			=3D DRIVER_NAME,
>  	.desc			=3D DRIVER_DESC,
> @@ -157,6 +161,14 @@ static int __init vkms_init(void)
>  	if (ret)
>  		goto out_unregister;
> =20
> +	ret =3D dma_coerce_mask_and_coherent(vkms_device->drm.dev,
> +					   DMA_BIT_MASK(64));
> +
> +	if (ret) {
> +		DRM_ERROR("Could not initialize DMA support\n");
> +		goto out_fini;
> +	}
> +
>  	vkms_device->drm.irq_enabled =3D true;
> =20
>  	ret =3D drm_vblank_init(&vkms_device->drm, 1);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 5a95100fa18b..7d52e24564db 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -137,6 +137,12 @@ int vkms_gem_vmap(struct drm_gem_object *obj);
> =20
>  void vkms_gem_vunmap(struct drm_gem_object *obj);
> =20
> +/* Prime */
> +struct drm_gem_object *
> +vkms_prime_import_sg_table(struct drm_device *dev,
> +			   struct dma_buf_attachment *attach,
> +			   struct sg_table *sg);
> +
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
>  					size_t *count);
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_=
gem.c
> index 6489bfe0a149..2e01186fb943 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -1,7 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0+
> =20
> +#include <linux/dma-buf.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/vmalloc.h>
> +#include <drm/drm_prime.h>
> =20
>  #include "vkms_drv.h"
> =20
> @@ -218,3 +220,28 @@ int vkms_gem_vmap(struct drm_gem_object *obj)
>  	mutex_unlock(&vkms_obj->pages_lock);
>  	return ret;
>  }
> +
> +struct drm_gem_object *
> +vkms_prime_import_sg_table(struct drm_device *dev,
> +			   struct dma_buf_attachment *attach,
> +			   struct sg_table *sg)
> +{
> +	struct vkms_gem_object *obj;
> +	int npages;
> +
> +	obj =3D __vkms_gem_create(dev, attach->dmabuf->size);
> +	if (IS_ERR(obj))
> +		return ERR_CAST(obj);
> +
> +	npages =3D PAGE_ALIGN(attach->dmabuf->size) / PAGE_SIZE;
> +	DRM_DEBUG_PRIME("Importing %d pages\n", npages);
> +
> +	obj->pages =3D kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL=
);
> +	if (!obj->pages) {
> +		vkms_gem_free_object(&obj->gem);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	drm_prime_sg_to_page_addr_arrays(sg, obj->pages, NULL, npages);
> +	return &obj->gem;
> +}
> --=20
> 2.17.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--ypbkjrg7z6xsdy3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2U7nIACgkQWJzP/com
vP86eg/+M0HdKKq+6M1XbMw9h5ALTVnoCnw6az0zoKXl9Dx/SRDE2F7uaucfidWB
wLmJj3j3uSYiPgm1WcTHt+7CHqPlxVCfiIO09UYgsMxQu19p4VGnmRgAtfXZ0BsU
Bo4/lBb3Hx8cjxJm/+dhg3h2WI3KivT4menMmdgbitlrK5XwtSMfEzYqxS7hDHmr
aY+vc9DX+pkLEcWvA558hxYdaabioqIegy3j3loUb3vQRLns6CkNnMYAT83KyqZF
ixr3AH4Hr2jGkKEAcXrQfwtmmt2xIz0whg87lJ+3U4eXvje9tgVTB2e+1jcaJo1f
dDK+6vf2dPPbhEJxSlTMeoN5CdmusHYbRIaSDhNxVx9SzG0c+DvCKHx/UmStczHW
MVVXV2BoVWebAmRMGOVDWwYjRZ0xHKtjJPaJoVoE6U3hnqL5hnLMrQ/8bJ5QPrNe
IuSxxCJktf3u5DeM61Dxs0RV0iMgnN2B84NctMRqHNA1WJ0r1Uox807jMgRH3w0R
5ytwoVuwoHUpYx6ZPRhilPjj0MudOjJR7l2e+karoHMxfy5gAOG8ZkmGBq9KE9aL
HBohb2saGMA+tt0HaNaJXJgtpBojTy1Mu15nqU5pMqm9Z9tNk9dSF0eEfSNiU0lH
3xArVTG1aXCbW16Nt4FSmfAM/7uckz5ViN+v2Js/CYTxHyk2ZOg=
=YXn0
-----END PGP SIGNATURE-----

--ypbkjrg7z6xsdy3z--

--===============0534958951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0534958951==--
