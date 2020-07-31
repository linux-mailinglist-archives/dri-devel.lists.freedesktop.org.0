Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC1233F46
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 08:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179D36E9E5;
	Fri, 31 Jul 2020 06:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4A66E9E1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 06:43:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D308AC5E;
 Fri, 31 Jul 2020 06:43:36 +0000 (UTC)
Subject: Re: [PATCH 02/49] drm/vram-helper: call the ttm manager debug function
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-3-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a4488286-9761-f1d6-5096-013ca955ecb0@suse.de>
Date: Fri, 31 Jul 2020 08:43:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731040520.3701599-3-airlied@gmail.com>
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
Cc: kraxel@redhat.com, sroland@vmware.com, christian.koenig@amd.com,
 bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1168479775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1168479775==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rBVvIsiJgOt8xc4l5oxxqniHOZnwCqGGN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rBVvIsiJgOt8xc4l5oxxqniHOZnwCqGGN
Content-Type: multipart/mixed; boundary="AIgcFaoHNtmuDcNxQjmHRcxHURYmSx2DF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Message-ID: <a4488286-9761-f1d6-5096-013ca955ecb0@suse.de>
Subject: Re: [PATCH 02/49] drm/vram-helper: call the ttm manager debug
 function
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-3-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-3-airlied@gmail.com>

--AIgcFaoHNtmuDcNxQjmHRcxHURYmSx2DF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 31.07.20 um 06:04 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> This code was assuming there was a drm_mm here, don't do
> that call the correct API.

Maybe put a semicolon after 'that' for readability.

>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index a93a00966f3a..b6f158ab0f5a 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1075,12 +1075,10 @@ static int drm_vram_mm_debugfs(struct seq_file =
*m, void *data)
>  {
>  	struct drm_info_node *node =3D (struct drm_info_node *) m->private;
>  	struct drm_vram_mm *vmm =3D node->minor->dev->vram_mm;
> -	struct drm_mm *mm =3D vmm->bdev.man[TTM_PL_VRAM].priv;
> +	struct ttm_mem_type_manager *man =3D &vmm->bdev.man[TTM_PL_VRAM];
>  	struct drm_printer p =3D drm_seq_file_printer(m);
> =20
> -	spin_lock(&ttm_bo_glob.lru_lock);
> -	drm_mm_print(mm, &p);
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	man->func->debug(man, &p);
>  	return 0;
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


--AIgcFaoHNtmuDcNxQjmHRcxHURYmSx2DF--

--rBVvIsiJgOt8xc4l5oxxqniHOZnwCqGGN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8jvYoUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPC6Af/QQgTbfQNETokSaVsG4yp5m6ofzJx
qqXSXgM2azmMQABE2UnJhkAW5sBAsvz9Y/AwnVWGX31pE5mp2KcbuN7NBBOyUBUw
QkSIboo5aJx3aNYsij4iIgs+IlDoJk8ZtyOuPIabrzkis2ErYBp725MR8GUgSNBH
Dsg/pRZBVmjhcfV8GhDEskp6j97BZeVrQGoLlBQElu0jXHWzG2rrPVbnKHHIxsjC
HU603duhAHR+5foetPUbplEx5fr9F340Y4SEJdFEUpFC3tOTz6fZfm6p7aIgxJOz
3XQq/mkP5qtqxJEnJdMNFClNXaTxSS6wP7DhvW3iaXZD2WGmCRsLhQ+l3Q==
=+ubm
-----END PGP SIGNATURE-----

--rBVvIsiJgOt8xc4l5oxxqniHOZnwCqGGN--

--===============1168479775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1168479775==--
