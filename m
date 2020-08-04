Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B81923B550
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ACD6E430;
	Tue,  4 Aug 2020 07:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAF46E430
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 07:00:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C51EBABE2;
 Tue,  4 Aug 2020 07:00:26 +0000 (UTC)
Subject: Re: [PATCH 38/59] drm/vram-helper: use wrapper to access memory
 managers
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-39-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <94940e11-3b07-2896-229e-a9c02815c087@suse.de>
Date: Tue, 4 Aug 2020 09:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804025632.3868079-39-airlied@gmail.com>
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
Cc: linux-graphics-maintainer@vmware.com, kraxel@redhat.com, sroland@vmware.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============0929841201=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0929841201==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2W6oEWGM9ZOwvzZJqDQ1qVq0UMk3crrJx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2W6oEWGM9ZOwvzZJqDQ1qVq0UMk3crrJx
Content-Type: multipart/mixed; boundary="V04e8QpZFtOgkECRAYk8oz4vrdypChOhx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Message-ID: <94940e11-3b07-2896-229e-a9c02815c087@suse.de>
Subject: Re: [PATCH 38/59] drm/vram-helper: use wrapper to access memory
 managers
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-39-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-39-airlied@gmail.com>

--V04e8QpZFtOgkECRAYk8oz4vrdypChOhx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.08.20 um 04:56 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 2099851c017e..a01768adb96d 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1075,7 +1075,7 @@ static int drm_vram_mm_debugfs(struct seq_file *m=
, void *data)
>  {
>  	struct drm_info_node *node =3D (struct drm_info_node *) m->private;
>  	struct drm_vram_mm *vmm =3D node->minor->dev->vram_mm;
> -	struct ttm_mem_type_manager *man =3D &vmm->bdev.man[TTM_PL_VRAM];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(&vmm->bdev, TTM=
_PL_VRAM);
>  	struct drm_printer p =3D drm_seq_file_printer(m);
> =20
>  	ttm_mem_type_manager_debug(man, &p);
> @@ -1103,7 +1103,7 @@ EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
>  static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device=
 *dev,
>  			    uint64_t vram_base, size_t vram_size)
>  {
> -	struct ttm_mem_type_manager *man =3D &vmm->bdev.man[TTM_PL_VRAM];
> +	struct ttm_mem_type_manager *man =3D ttm_manager_type(&vmm->bdev, TTM=
_PL_VRAM);
>  	int ret;
> =20
>  	vmm->vram_base =3D vram_base;
> @@ -1127,7 +1127,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *v=
mm, struct drm_device *dev,
> =20
>  static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
>  {
> -	ttm_range_man_fini(&vmm->bdev, &vmm->bdev.man[TTM_PL_VRAM]);
> +	ttm_range_man_fini(&vmm->bdev, ttm_manager_type(&vmm->bdev, TTM_PL_VR=
AM));
>  	ttm_bo_device_release(&vmm->bdev);
>  }
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--V04e8QpZFtOgkECRAYk8oz4vrdypChOhx--

--2W6oEWGM9ZOwvzZJqDQ1qVq0UMk3crrJx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8pB3oUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPWsAgAvyikB/nR7wSgAs7A1IA1kxyg9cX4
bbIL9EztX8WzVM1Az3nTnPHmfJ0RssotkWqhf2YaYDYF7GtdGXOVQN20X3uJwKhp
HjnI1sUEC6JIGdjmrg/tq+F3Qv5397IktvHXSBnVh7DRusslMNbYYFEY/WDb6sKP
PlqHwq+EWPjQD3fvAt6D9YJghH4051FsJPY9+KAjE4avyn8izM7cVJUiZEavsBKl
RKAGS8oLs8kvqyl4ZfFZh1auoVvCosGe3fXoMfA8P0MjsFTKIbb49M/2TG1JkJMr
Bm2PJDXpLtp3mWiVVo+Gh/XOuxVDfcVN5zsMte9LYtGQIkyb7WrmT1Oyeg==
=Kegc
-----END PGP SIGNATURE-----

--2W6oEWGM9ZOwvzZJqDQ1qVq0UMk3crrJx--

--===============0929841201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0929841201==--
