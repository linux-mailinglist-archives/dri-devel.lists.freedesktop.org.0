Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8852F4854
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 11:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40696E427;
	Wed, 13 Jan 2021 10:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820606E427
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 10:09:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21E48AC8F;
 Wed, 13 Jan 2021 10:09:27 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Fix build error
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org
References: <1610529568-25754-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <020abb57-8f15-1908-50e6-cdcd67588f86@suse.de>
Date: Wed, 13 Jan 2021 11:09:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610529568-25754-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0818602461=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0818602461==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XTups1Kf2YVQZcgU5vSmBrPJUfIANkBo5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XTups1Kf2YVQZcgU5vSmBrPJUfIANkBo5
Content-Type: multipart/mixed; boundary="sczPSSomHQCyH09BN7ILCRqRSYR6O55RR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org
Message-ID: <020abb57-8f15-1908-50e6-cdcd67588f86@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Fix build error
References: <1610529568-25754-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1610529568-25754-1-git-send-email-tiantao6@hisilicon.com>

--sczPSSomHQCyH09BN7ILCRqRSYR6O55RR
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.01.21 um 10:19 schrieb Tian Tao:
> Fix the following errors:
> divers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:
> In function =E2=80=98hibmc_hw_map=E2=80=99:
> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:213:25:
> error: =E2=80=98dev=E2=80=99 undeclared (first use in this function);
>=20
> Fixes: 4d4dad21cc7bee "drm/hibmc: Remove references to struct drm_devic=
e.pdev"

I think I messed up the rebasing of this patch. Thank you for taking=20
care. hibmc_ttm.c can be removed. I can take care of this later today.

> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 0a2edc7..abd6250 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -210,7 +210,7 @@ static void hibmc_hw_config(struct hibmc_drm_privat=
e *priv)
>  =20
>   static int hibmc_hw_map(struct hibmc_drm_private *priv)
>   {
> -	struct pci_dev *pdev =3D dev->pdev;
> +	struct drm_device *dev =3D &priv->dev;
>   	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>   	resource_size_t addr, size, ioaddr, iosize;
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--sczPSSomHQCyH09BN7ILCRqRSYR6O55RR--

--XTups1Kf2YVQZcgU5vSmBrPJUfIANkBo5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/+xtUFAwAAAAAACgkQlh/E3EQov+B4
vA/+IhwzbEl2hVTpcI2a2Xv8izK4zi0pObEkWMZSojluS4wPigd80oPr8X9SVP8h50EYeY/g948F
EcbujBjKimC37dXvzuHfoy13jpIoLA37VwHxY/TurygWsptgIL+tzYFOsgJD9SDdplPbvwCnYOXF
GHGNRP+aQJyoJiFe/S3Xh00V1DaXpdIJHtDq/3KgD1nk1QRpZlBpJyHRWywO1ZQYWE2ahI1UYwv/
DhXSt2U7brGIv+Om8Dy/GU/huKng4t45CqDuOHwLHO1RI4idB4BEirNzxYDplA7q33jhikdFVmT/
fgYWFC7ngO/UuOb+orJzz5UvvpOVLqKuCTrydRChjOAAshLj8teQMFzhLP0uWxzvL4MD4idFM3x/
w1dN302Zhwawg92faocruKgxkqodYy9kNQqviBtcOecJ2M16YSURYn90GfrCQbGxsYW9Vp1IXLH6
EAPZXD2BU6ff8q/RCwWeSIS3S3CLkn6hZ41tB+gRpWk/WvqZ6KQ/0/1s22v98RzVADRn0dGYIZnq
VwIi3FVe9onyI8irW+vTOJWnmkjUP11C/hpGbN77VRCF/pjXL6dwBY5WpP9f4D8P6qAmjVQF+0JF
Y4xvDvNEFEKW2SP1lnjMMRp3CrXQRn1QlUDvnpI4Xg+8IejMANshD+JLxw3BhoI+1TLi0SwILTLC
sxs=
=H3bf
-----END PGP SIGNATURE-----

--XTups1Kf2YVQZcgU5vSmBrPJUfIANkBo5--

--===============0818602461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0818602461==--
