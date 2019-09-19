Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98586B786C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 13:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095446F7F7;
	Thu, 19 Sep 2019 11:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B851C6F7F7;
 Thu, 19 Sep 2019 11:25:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E4E5AE64;
 Thu, 19 Sep 2019 11:25:40 +0000 (UTC)
Subject: Re: [PATCH v3 07/11] drm/ttm: rename ttm_fbdev_mmap
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190919100223.13309-1-kraxel@redhat.com>
 <20190919100223.13309-8-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <a93f8308-3e77-59c8-548e-c0553b33e205@suse.de>
Date: Thu, 19 Sep 2019 13:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919100223.13309-8-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1916724901=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1916724901==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1Vl4XQmXHd78qivdStEU98KPXVJ7s4NIH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1Vl4XQmXHd78qivdStEU98KPXVJ7s4NIH
Content-Type: multipart/mixed; boundary="TzvBT24JB85x8wBrIXcljxPE6A7tpUr9f";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <a93f8308-3e77-59c8-548e-c0553b33e205@suse.de>
Subject: Re: [PATCH v3 07/11] drm/ttm: rename ttm_fbdev_mmap
References: <20190919100223.13309-1-kraxel@redhat.com>
 <20190919100223.13309-8-kraxel@redhat.com>
In-Reply-To: <20190919100223.13309-8-kraxel@redhat.com>

--TzvBT24JB85x8wBrIXcljxPE6A7tpUr9f
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.09.19 um 12:02 schrieb Gerd Hoffmann:
> Rename ttm_fbdev_mmap to ttm_bo_mmap_obj.  Move the vm_pgoff sanity
> check to amdgpu_bo_fbdev_mmap (only ttm_fbdev_mmap user in tree).
>=20
> The ttm_bo_mmap_obj function can now be used to map any buffer object.
> This allows to implement &drm_gem_object_funcs.mmap in gem ttm helpers.=

>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks. I find this to be a much cleaner interface than before.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> ---
>  include/drm/ttm/ttm_bo_api.h               | 10 ++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  5 ++++-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c            |  8 ++------
>  3 files changed, 10 insertions(+), 13 deletions(-)
>=20
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.=
h
> index 43c4929a2171..d2277e06316d 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -710,16 +710,14 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo, uns=
igned long start_page,
>  void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
> =20
>  /**
> - * ttm_fbdev_mmap - mmap fbdev memory backed by a ttm buffer object.
> + * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
>   *
>   * @vma:       vma as input from the fbdev mmap method.
> - * @bo:        The bo backing the address space. The address space wil=
l
> - * have the same size as the bo, and start at offset 0.
> + * @bo:        The bo backing the address space.
>   *
> - * This function is intended to be called by the fbdev mmap method
> - * if the fbdev address space is to be backed by a bo.
> + * Maps a buffer object.
>   */
> -int ttm_fbdev_mmap(struct vm_area_struct *vma, struct ttm_buffer_objec=
t *bo);
> +int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_obje=
ct *bo);
> =20
>  /**
>   * ttm_bo_mmap - mmap out of the ttm device address space.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_object.c
> index 2f11ebd95528..e5447e0d8b88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1051,7 +1051,10 @@ void amdgpu_bo_fini(struct amdgpu_device *adev)
>  int amdgpu_bo_fbdev_mmap(struct amdgpu_bo *bo,
>  			     struct vm_area_struct *vma)
>  {
> -	return ttm_fbdev_mmap(vma, &bo->tbo);
> +	if (vma->vm_pgoff !=3D 0)
> +		return -EACCES;
> +
> +	return ttm_bo_mmap_obj(vma, &bo->tbo);
>  }
> =20
>  /**
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> index b5314ef85a3d..6688d7893161 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -479,14 +479,10 @@ int ttm_bo_mmap(struct file *filp, struct vm_area=
_struct *vma,
>  }
>  EXPORT_SYMBOL(ttm_bo_mmap);
> =20
> -int ttm_fbdev_mmap(struct vm_area_struct *vma, struct ttm_buffer_objec=
t *bo)
> +int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_obje=
ct *bo)
>  {
> -	if (vma->vm_pgoff !=3D 0)
> -		return -EACCES;
> -
>  	ttm_bo_get(bo);
> -
>  	ttm_bo_mmap_vma_setup(bo, vma);
>  	return 0;
>  }
> -EXPORT_SYMBOL(ttm_fbdev_mmap);
> +EXPORT_SYMBOL(ttm_bo_mmap_obj);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--TzvBT24JB85x8wBrIXcljxPE6A7tpUr9f--

--1Vl4XQmXHd78qivdStEU98KPXVJ7s4NIH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2DZbMACgkQaA3BHVML
eiNZ8QgAkTCp+uwT0g6oLhkmYEgwDPEmHEvdPKTjp6X+r7iztEI/zXi0i6XCQqB+
k7Bv5MZtSEe6Yg5V1JSPKxZ0fW8W7Hib5g1hfOUpHrTvXtn+2YNPaEnSsn2+eMBG
YrBHQRrHhvUtIDQxnOgoYA3vusPw4aNQoOmBjUllBn9aVjZ6RhNOkqLi+5zqv5L7
NQAi05BaLdaC7M4YovLHhrsi3xIlLmY9+kqlKI8vycgN/2d1bwCGXTjCNic1Y/ub
DhUZgK7Gh+t2pQ0HCWvF8zeVk00HnQ0o7WtePndP0jCBK45WCNAHOmAoL5elh34u
KCmlXwrGEGOoybyCaVPbq+u0kT4nSg==
=Zvov
-----END PGP SIGNATURE-----

--1Vl4XQmXHd78qivdStEU98KPXVJ7s4NIH--

--===============1916724901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1916724901==--
