Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD563D2BD6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 20:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C776EA92;
	Thu, 22 Jul 2021 18:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055BE6EA8F;
 Thu, 22 Jul 2021 18:22:46 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A938E226BF;
 Thu, 22 Jul 2021 18:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626978164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0BiNFIu0MEqXEfJZC+qyDSlJni8faM4VaraLZAbd0VE=;
 b=M+OVP8zvk8TMB4Eiw281i7mHk/UmSzx+SH4pjZbq17Cg9kyQgPaSc4LDznGo8hGnAj7eMK
 wdw9un21ggJ8SqowILivw7O7QM3NLwLf4mLYbc/78OudElZHQn+mALSr0Ox3JZC4EQmEQA
 75CGuyhhji2m5plotR20PtWhVluDwEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626978164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0BiNFIu0MEqXEfJZC+qyDSlJni8faM4VaraLZAbd0VE=;
 b=9T8HaMdY97AJmrZ6P7XhIe3OxbFdGzoe+fZtOpDj45GrDhAm7j5bCG4n3PAOpjMNpW8FeY
 NxQHjQbk54yHWJAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8A34F13C49;
 Thu, 22 Jul 2021 18:22:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ahhAIHS3+WB8PgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Jul 2021 18:22:44 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-3-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 2/4] drm/shmem-helper: Switch to vmf_insert_pfn
Message-ID: <573242f9-a29e-73d9-3efb-51c436d636fd@suse.de>
Date: Thu, 22 Jul 2021 20:22:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713205153.1896059-3-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AU4G00cJMaaK1LNjOnqQ1OhvEdBbg55W7"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AU4G00cJMaaK1LNjOnqQ1OhvEdBbg55W7
Content-Type: multipart/mixed; boundary="UYmxzJj7k7ciJgBGm6uMVhCao7f1vbknX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <573242f9-a29e-73d9-3efb-51c436d636fd@suse.de>
Subject: Re: [PATCH v4 2/4] drm/shmem-helper: Switch to vmf_insert_pfn
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20210713205153.1896059-3-daniel.vetter@ffwll.ch>

--UYmxzJj7k7ciJgBGm6uMVhCao7f1vbknX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I'm not knowledgeable enougth to give this a full review. If you can=20
just answer my questions, fell free to add an

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

to the patch. :)

Am 13.07.21 um 22:51 schrieb Daniel Vetter:
> We want to stop gup, which isn't the case if we use vmf_insert_page

What is gup?

> and VM_MIXEDMAP, because that does not set pte_special.
>=20
> v2: With this shmem gem helpers now definitely need CONFIG_MMU (0day)
>=20
> v3: add more depends on MMU. For usb drivers this is a bit awkward,
> but really it's correct: To be able to provide a contig mapping of
> buffers to userspace on !MMU platforms we'd need to use the cma
> helpers for these drivers on those platforms. As-is this wont work.
>=20
> Also not exactly sure why vm_insert_page doesn't go boom, because that
> definitely wont fly in practice since the pages are non-contig to
> begin with.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>   drivers/gpu/drm/Kconfig                | 2 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
>   drivers/gpu/drm/gud/Kconfig            | 2 +-
>   drivers/gpu/drm/tiny/Kconfig           | 4 ++--
>   drivers/gpu/drm/udl/Kconfig            | 1 +
>   5 files changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0d372354c2d0..314eefa39892 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -211,7 +211,7 @@ config DRM_KMS_CMA_HELPER
>  =20
>   config DRM_GEM_SHMEM_HELPER
>   	bool
> -	depends on DRM
> +	depends on DRM && MMU
>   	help
>   	  Choose this if you need the GEM shmem helper functions
>  =20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index d5e6d4568f99..296ab1b7c07f 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -542,7 +542,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fau=
lt *vmf)
>   	} else {
>   		page =3D shmem->pages[page_offset];
>  =20
> -		ret =3D vmf_insert_page(vma, vmf->address, page);
> +		ret =3D vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
>   	}
>  =20
>   	mutex_unlock(&shmem->pages_lock);
> @@ -612,7 +612,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, =
struct vm_area_struct *vma)
>   		return ret;
>   	}
>  =20
> -	vma->vm_flags |=3D VM_MIXEDMAP | VM_DONTEXPAND;
> +	vma->vm_flags |=3D VM_PFNMAP | VM_DONTEXPAND;
>   	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>   	if (shmem->map_wc)
>   		vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
> diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
> index 1c8601bf4d91..9c1e61f9eec3 100644
> --- a/drivers/gpu/drm/gud/Kconfig
> +++ b/drivers/gpu/drm/gud/Kconfig
> @@ -2,7 +2,7 @@
>  =20
>   config DRM_GUD
>   	tristate "GUD USB Display"
> -	depends on DRM && USB
> +	depends on DRM && USB && MMU
>   	select LZ4_COMPRESS
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_SHMEM_HELPER

I'm a kconfig noob, so this is rather a question than a review comment:



If DRM_GEM_SHMEM_HELPER already depends on MMU, this select will fail on =

non-MMU platforms? Why does the driver also depend on MMU? Simply to=20
make the item disappear in menuconfig?

Best regards
Thomas

> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfi=
g
> index 5593128eeff9..c11fb5be7d09 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -44,7 +44,7 @@ config DRM_CIRRUS_QEMU
>  =20
>   config DRM_GM12U320
>   	tristate "GM12U320 driver for USB projectors"
> -	depends on DRM && USB
> +	depends on DRM && USB && MMU
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_SHMEM_HELPER
>   	help
> @@ -53,7 +53,7 @@ config DRM_GM12U320
>  =20
>   config DRM_SIMPLEDRM
>   	tristate "Simple framebuffer driver"
> -	depends on DRM
> +	depends on DRM && MMU
>   	select DRM_GEM_SHMEM_HELPER
>   	select DRM_KMS_HELPER
>   	help
> diff --git a/drivers/gpu/drm/udl/Kconfig b/drivers/gpu/drm/udl/Kconfig
> index 1f497d8f1ae5..c744175c6992 100644
> --- a/drivers/gpu/drm/udl/Kconfig
> +++ b/drivers/gpu/drm/udl/Kconfig
> @@ -4,6 +4,7 @@ config DRM_UDL
>   	depends on DRM
>   	depends on USB
>   	depends on USB_ARCH_HAS_HCD
> +	depends on MMU
>   	select DRM_GEM_SHMEM_HELPER
>   	select DRM_KMS_HELPER
>   	help
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--UYmxzJj7k7ciJgBGm6uMVhCao7f1vbknX--

--AU4G00cJMaaK1LNjOnqQ1OhvEdBbg55W7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD5t3MFAwAAAAAACgkQlh/E3EQov+DO
mg//aIaiwrqNj6OOeDx0je0Vq6lOAee2i1jJTip7MAzgPNP6nT5/2n8IJmfIsGrvEJKzC0fcysMQ
nfNn+yYvGdr3okpO2iBCkKFK0y0zfOz+5p0yuuHlVxJi/GMOiSBkc29DSkb9r9JeOGIA7ZsPRi/L
NRMjNtP7kLvRE3ZMIpea9pfX2cFuj+i7fEhUi2gl0bPGyAhZE4BhK4vEDtCq9uJyjz+/5lL3MbJY
Yt/XLCx+4Y2AbVGoS0xs6bfnsPQKFi7kRMeBY9Tk5ELIKbB5qiD5h05knJGYt2vDEyyCAhP9e/Yl
8LaBCp2+N5xk73DwQCsrr8+Suq7Er7YA9Iv6rXoBqWHGQrGbCAobD1vKLDXq3e+xkGPHxRMKhms8
D8fZyniMjGXHzlu9EaTSzf9hRK7VM5509fbpyIqVrW5mPuSijLrCetRcA/6WlOT/Y0XZl5ZrewQp
HHHCLIgtgCcc9NUP0UI21MWcCtTL9Mwy4GQDCnWqXIGZXnwFlmzEr2UTzXTOAASXA1nvDhpkiQBc
6+Mab+rv1hOFktUcT3SPGjejcGHy4jAi2EqcUeCs41D0j6XqAy8gZH5Mm/3UKoHSKFoGrT9h/lNR
1BPvPwIM4bZP3t5DN0XMzO0ZkRZEJmiOhFQrGGkMC37TyUQVN47BJoKwlwpmiNBTdrEWiHywzFew
iHg=
=88XR
-----END PGP SIGNATURE-----

--AU4G00cJMaaK1LNjOnqQ1OhvEdBbg55W7--
