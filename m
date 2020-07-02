Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D833211EBD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 10:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8AD6E542;
	Thu,  2 Jul 2020 08:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E326E542
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 08:27:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6975ADC5;
 Thu,  2 Jul 2020 08:27:53 +0000 (UTC)
Subject: Re: [PATCH v3] drm/hisilicon: Use drmm_kzalloc() instead of
 devm_kzalloc()
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1593676183-28525-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <55c1bdad-774c-816e-e4a9-2618c753af31@suse.de>
Date: Thu, 2 Jul 2020 10:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593676183-28525-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============0109100258=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0109100258==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Lgq7URjLO88AKaZN3vvii7yT64qitiixJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Lgq7URjLO88AKaZN3vvii7yT64qitiixJ
Content-Type: multipart/mixed; boundary="UO1V1ZdZPJnmIhbjKwFrgdm7sAetUj1rd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <55c1bdad-774c-816e-e4a9-2618c753af31@suse.de>
Subject: Re: [PATCH v3] drm/hisilicon: Use drmm_kzalloc() instead of
 devm_kzalloc()
References: <1593676183-28525-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1593676183-28525-1-git-send-email-tiantao6@hisilicon.com>

--UO1V1ZdZPJnmIhbjKwFrgdm7sAetUj1rd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Thanks! Applied to drm-misc-next

Best regards
Thomas

Am 02.07.20 um 09:49 schrieb Tian Tao:
> using the new API drmm_kzalloc() instead of devm_kzalloc()
>=20
> v3:
> still fixed include statements sorted alphabetically.
>=20
> v2:
> keep the DRM include statements sorted alphabetically.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index a6fd0c2..249c298 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_irq.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -267,7 +268,7 @@ static int hibmc_load(struct drm_device *dev)
>  	struct hibmc_drm_private *priv;
>  	int ret;
> =20
> -	priv =3D devm_kzalloc(dev->dev, sizeof(*priv), GFP_KERNEL);
> +	priv =3D drmm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv) {
>  		DRM_ERROR("no memory to allocate for hibmc_drm_private\n");
>  		return -ENOMEM;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--UO1V1ZdZPJnmIhbjKwFrgdm7sAetUj1rd--

--Lgq7URjLO88AKaZN3vvii7yT64qitiixJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl79moMUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNTCwf/TxN8IsqjACFZOPAKYEzO8uPYKkC2
QfBJ+4MomJDKjP8NFxVCuCH0GDDAUeiG5+alvSlDNPcqvvHScVW2QA95T7gGwHYU
1JSUk6iBby8i6g7OItxGCsiplQV2eTGNgrtLCotZoSeZxUFFeRAmvCuv75E2KJxw
u06O9UN1Awfy2JGuGtryocLBXhP77tH7g0jOLCYSG5DlWnyWpVTAYlbpnECh8veX
XlkU07Ro6FU+9CGknR7d0l/J2xjPJBoT69UvQklMNUCYi9tZ4tI2ilLAckEkn46G
5b5DPbPQXuv8FcKz8BpXUm68nKAxX3gH0JgvE1EQ/mYQnuzgOxiyGOHABw==
=QT2O
-----END PGP SIGNATURE-----

--Lgq7URjLO88AKaZN3vvii7yT64qitiixJ--

--===============0109100258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0109100258==--
