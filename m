Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791F923B547
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 08:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BAE6E42C;
	Tue,  4 Aug 2020 06:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555406E42C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 06:54:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B956DAC7D;
 Tue,  4 Aug 2020 06:54:55 +0000 (UTC)
Subject: Re: [PATCH 07/59] drm/vram-helper: remove populate/unpopulate
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-8-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cfbe4a84-411b-ea50-add3-86a78204ae48@suse.de>
Date: Tue, 4 Aug 2020 08:54:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804025632.3868079-8-airlied@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1809771652=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1809771652==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AU98K5RczMBriWgiqlOU7WICu51gIcTmy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AU98K5RczMBriWgiqlOU7WICu51gIcTmy
Content-Type: multipart/mixed; boundary="8NdSQEkarTWd53oDsxZzVYlmZPCfdaMS0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Message-ID: <cfbe4a84-411b-ea50-add3-86a78204ae48@suse.de>
Subject: Re: [PATCH 07/59] drm/vram-helper: remove populate/unpopulate
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-8-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-8-airlied@gmail.com>

--8NdSQEkarTWd53oDsxZzVYlmZPCfdaMS0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.08.20 um 04:55 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> The default path for populate/unpopulate is already this.
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 5f03c6137ef9..a93a00966f3a 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1061,8 +1061,6 @@ static int bo_driver_io_mem_reserve(struct ttm_bo=
_device *bdev,
> =20
>  static struct ttm_bo_driver bo_driver =3D {
>  	.ttm_tt_create =3D bo_driver_ttm_tt_create,
> -	.ttm_tt_populate =3D ttm_pool_populate,
> -	.ttm_tt_unpopulate =3D ttm_pool_unpopulate,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D bo_driver_evict_flags,
>  	.move_notify =3D bo_driver_move_notify,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8NdSQEkarTWd53oDsxZzVYlmZPCfdaMS0--

--AU98K5RczMBriWgiqlOU7WICu51gIcTmy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8pBi8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP2+ggAuiI8AN9iRRjJGXARyTJpL3sHWksC
se6AHlyINFv1mpKDWb01DBAj8oQJKIKUqCZg8LlwdsePyd/t1teTau3IX/MaWwu4
0YBTLnz/Ydc1rK00sjK48d0s57//ox6+yC8xnwJf1zJjcfdyBc9CqR163ByIIck6
sDWs+ew41HgKLD1snipPIld3NTefQPcYDyPTOjfLr9n/osmISmw+q5x2DIy9fbe/
ynAc+OEEgvW3uiZvKYQr92esx61Vfe4rk7rl+ZVacdrAPxIZoREO3qRjFxcnVJA+
BL3p1cN8LFmLGbnt9Fx3bkNgU2ARqk12BLZjMI2Q/I9FsfF+3PDSkEDNpQ==
=iLx/
-----END PGP SIGNATURE-----

--AU98K5RczMBriWgiqlOU7WICu51gIcTmy--

--===============1809771652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1809771652==--
