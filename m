Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC7A6911
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 14:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B5C89320;
	Tue,  3 Sep 2019 12:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845A789320
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 12:55:24 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n197so33634656iod.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 05:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RYqrOtjAsQGkqB7LnaHhXg7Rg3FRxSXFhhJcqVl6WfQ=;
 b=YgqPoFWu5kVftObtezuCPxbWYBzxziLtU2Shla/p8QPCo2n0I4AbBa6ek1R+LRHIxU
 fUs1NOKX9UCfqlr2hr2IkR3wWAhfvCV78BQa8ZILhNAdZnHD2UGBaC01L+kh55cD7cMs
 6ONLaYy/w6/D0FH2viYobjcxV54wFiMzFigQKDxVEuHnVx9pXeGawPQVmawOxLUmXmyq
 3csqGVKoYtLUtky85VERmTuv/J5S5scWGMkOQu4R56YIk1dkSOYk6Eg0uuIpTvhnIPHn
 5DdMzLIjMWaSi1UV/drEjYsOToWJQXaIVxp9zK4p6fWVgf3WlAt/SFPclLMa1ElzVGbM
 hxgg==
X-Gm-Message-State: APjAAAVHojsaWxuSwyHXCKIFy5Nk0paN4H0PBlG4k68vviYMXQz8kL9F
 SpqnHolpcIxTm3g0Vwl62bo=
X-Google-Smtp-Source: APXvYqxfldIzTmxWYepNoiz2Xf/hL2JUMxVySCaNYoGDHZoe1nxrGOUabB/QD8hKe4udN7tI84Iyig==
X-Received: by 2002:a6b:b487:: with SMTP id
 d129mr21998616iof.223.1567515323818; 
 Tue, 03 Sep 2019 05:55:23 -0700 (PDT)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id w6sm15327873iob.29.2019.09.03.05.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 05:55:23 -0700 (PDT)
Date: Tue, 3 Sep 2019 08:55:43 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Oleg Vasilev <oleg.vasilev@intel.com>
Subject: Re: [PATCH v2] drm/vkms: prime import support
Message-ID: <20190903125543.s2rchok3lbqrcios@smtp.gmail.com>
References: <20190821135443.4826-1-oleg.vasilev@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190821135443.4826-1-oleg.vasilev@intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RYqrOtjAsQGkqB7LnaHhXg7Rg3FRxSXFhhJcqVl6WfQ=;
 b=vEZ+qWOqFfIhZGsnVWBjyG1SPGFX0DzLPd4nqkW7vMg7XLBd7zZoGgmDMAZx72B/Hd
 cwSrUurRNMHHScx8l2Aeg5WtWXM5I2j1F1rcnNtIgKxu8+UQg6qPCE7282SFLDx69Khj
 wRdkWOJm4jiGhQRSqtx2RC2mSo+JPIRounUTtxcmXY1sDPbbL5pcZIYXMNgNqEp0gZQk
 Ipd2GUE1i0tjnMyBn/Zmt8PCwc0sy9UsgwFqPS3DpnVpG7XPYEmIt5AktosKElucCfW8
 /IV2Xih/EHQyXhum7DSTTmvXtH1goOAqmL5+uGhOLwXTLN9YAA8kFANDg/b7Fg13yMGy
 u5JA==
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
Content-Type: multipart/mixed; boundary="===============0722770637=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0722770637==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hxrb5iqqaxfnzlya"
Content-Disposition: inline


--hxrb5iqqaxfnzlya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Oleg,

First of all, thank you for keeping working on this feature. You did a
great job here. I just have a comments inline.

On 08/21, Oleg Vasilev wrote:
> Bring dmabuf sharing through implementing prime_import_sg_table callback.
> This will help to validate userspace conformance in prime configurations
> without using any actual hardware (e.g. in the cloud).
>=20
> This enables kms_prime on vkms.
>=20
> V2:
>  - Rodrigo: styleguide + return code check
>=20
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Simon Ser <simon.ser@intel.com>
> Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 12 +++++++++
>  drivers/gpu/drm/vkms/vkms_drv.h |  9 +++++++
>  drivers/gpu/drm/vkms/vkms_gem.c | 46 +++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 44ab9f8ef8be..09598f949b9b 100644
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
> index 5a95100fa18b..6bf195c91097 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -126,6 +126,9 @@ struct drm_gem_object *vkms_gem_create(struct drm_dev=
ice *dev,
>  				       u32 *handle,
>  				       u64 size);
> =20
> +struct vkms_gem_object *vkms_gem_create_private(struct drm_device *dev,
> +						u64 size);
> +
>  vm_fault_t vkms_gem_fault(struct vm_fault *vmf);
> =20
>  int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
> @@ -137,6 +140,12 @@ int vkms_gem_vmap(struct drm_gem_object *obj);
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
> index 6489bfe0a149..b7565f48e054 100644
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
> @@ -118,6 +120,25 @@ struct drm_gem_object *vkms_gem_create(struct drm_de=
vice *dev,
>  	return &obj->gem;
>  }
> =20
> +struct vkms_gem_object *vkms_gem_create_private(struct drm_device *dev,
> +						u64 size)
> +{
> +	struct vkms_gem_object *obj;
> +
> +	obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> +
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	size =3D roundup(size, PAGE_SIZE);
> +
> +	drm_gem_private_object_init(dev, &obj->gem, size);
> +
> +	mutex_init(&obj->pages_lock);
> +
> +	return obj;
> +}
> +

I suppose that any other function or helper do not invoke this function,
am I right?

If so, I recommend you to remove it from this patch. IMHO, add a
function that is not used yet may make the code hard to understand and
maintain.

Thanks

>  int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
>  		     struct drm_mode_create_dumb *args)
>  {
> @@ -218,3 +239,28 @@ int vkms_gem_vmap(struct drm_gem_object *obj)
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
> 2.23.0
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--hxrb5iqqaxfnzlya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1uYs4ACgkQWJzP/com
vP/XVQ//f52ZgFbZnfojT0tOMTjqwoTUBNn1VXu6G/wQ2cd5a/b0e8t7bX7HvFMH
oAgB8qc/Y9Y2QNF0gPVRZrEXEcrFIIuKh9KXAQtuexaOpuWIZl4b/nn25Zqm+zUn
muSKv3JQrwUV84AaqmWz7G8alocAeVR1F3SbWuXbd7e3bBTNRFpZHKCOSHIPWbJ3
cEyNJ7xhooUKym98hL8VIAXH9ai9hGmzZuAotuizyHn1YKOHqzEy+BB2XngZWi23
orbm8B9MvosKv7ga4e6TJasJ9FxZnas0JDumV6UHSR/i2yD11uOcHaf61z91VTFy
uq+jUg+q/WJU+SlGPHS+SCk6W7+8T+VDmC5I1lnwhqHfwTzK9MIvSI91fz+pSVDp
lDi5vZ+orYV0vxP9nizuIhzyFQhvRrZQ/2JzFItDNq8QpfZJzNHsMOOb4hhYEYVc
rJg6Sozpn9bGPaQ1MnkvHmnBJCbZoPVqKyYauyWZimQVku4xGff0H8GRrF8PgWfi
8tnMJomxk1QUVgA1MG0yPUyEBp0SGDhQcpqewpxhQYxW6hNXd9609xnfw9zb2bcT
VF56h3zOkllZ7LXxI6ucatWV81ZdYGsnrzXYaoXtgysU7nE+SK0j9pEdN28bVkjb
+7U06mZIhoH3chrVmcg5I8RjGGhbeU/xcnJjASAiwdNa8FdghVk=
=6+u+
-----END PGP SIGNATURE-----

--hxrb5iqqaxfnzlya--

--===============0722770637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0722770637==--
