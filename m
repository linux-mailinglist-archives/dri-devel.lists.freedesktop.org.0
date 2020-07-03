Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC433213468
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 08:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA9F6E8CC;
	Fri,  3 Jul 2020 06:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF06A6E8CA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 06:45:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81AA7AD04;
 Fri,  3 Jul 2020 06:45:11 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Fixed the warning: Assignment of 0/1 to
 bool variable
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1593694455-31268-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <79453f85-850b-3554-c5e1-6aa763366685@suse.de>
Date: Fri, 3 Jul 2020 08:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593694455-31268-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0129853764=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0129853764==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NBvhXxCVjwJ0JRvqb3n89VGbiE0I9oqRz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NBvhXxCVjwJ0JRvqb3n89VGbiE0I9oqRz
Content-Type: multipart/mixed; boundary="SLBJedyK81fhBMwszy4ZnPXBndg7QdfLc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <79453f85-850b-3554-c5e1-6aa763366685@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Fixed the warning: Assignment of 0/1 to
 bool variable
References: <1593694455-31268-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1593694455-31268-1-git-send-email-tiantao6@hisilicon.com>

--SLBJedyK81fhBMwszy4ZnPXBndg7QdfLc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

thanks for improving the driver.

Am 02.07.20 um 14:54 schrieb Tian Tao:
> fixed the following warning:
> hibmc_drm_drv.c:296:1-18:WARNING: Assignment of 0/1 to bool variable.
> hibmc_drm_drv.c:301:2-19: WARNING: Assignment of 0/1 to bool variable.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 249c298..2fc0c97 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -294,12 +294,12 @@ static int hibmc_load(struct drm_device *dev)
>  		goto err;
>  	}
> =20
> -	priv->msi_enabled =3D 0;
> +	priv->msi_enabled =3D false;
>  	ret =3D pci_enable_msi(dev->pdev);

priv->msi_enabled is unused by the driver. Better remove it entirely. If
the MSI flag will be required later, there's already struct
pci_dev.msi_enabled.

Apart from that, the one-by-one approach to patching is somewhat
tedious. Could you collect patches and send them out in batches?  It
would make reviewing easier and give reviewers an idea of where you're
going with the driver.

Best regards
Thomas

>  	if (ret) {
>  		DRM_WARN("enabling MSI failed: %d\n", ret);
>  	} else {
> -		priv->msi_enabled =3D 1;
> +		priv->msi_enabled =3D true;
>  		ret =3D drm_irq_install(dev, dev->pdev->irq);
>  		if (ret)
>  			DRM_WARN("install irq failed: %d\n", ret);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SLBJedyK81fhBMwszy4ZnPXBndg7QdfLc--

--NBvhXxCVjwJ0JRvqb3n89VGbiE0I9oqRz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7+0/MUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMwjQgAvUNe69g3WnJQEfYLOPn0c895abnF
O6USnAAu63cHqyJHqygpzqGk/N6rU7bkLl4AQG3gQvlltZ3okwaofiHHFqrg8Krg
GYNW/Ybo75ec7WPoqu3kUkG7ra1dmCsk+nygs29sVnIvgaXeZLjcpgw4Kt+liIB6
CEIoL1LuWYpgFtrd6QlFcI2JzX7X7Ptj3AZ5jxouBtTM+dft+L+Q8SJXEGfj6CyT
/UxsG1m/QqyJLvAd2VubnoOmRHWagKa3AqzMlvD2euy/9b9RzxwaETpOyq9IonEX
WaAEiINOl8qAhMpS6ULWoQtb3Wvb6uNzX8MLnRlbbkeXzxmwNavE3qwT8w==
=gyd9
-----END PGP SIGNATURE-----

--NBvhXxCVjwJ0JRvqb3n89VGbiE0I9oqRz--

--===============0129853764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0129853764==--
