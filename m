Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB41FF0C3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 13:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819CC6E3A8;
	Thu, 18 Jun 2020 11:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D19B6E3A8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 11:37:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4941FACA7;
 Thu, 18 Jun 2020 11:37:22 +0000 (UTC)
Subject: Re: [PATCH v2] drm/hisilicon: Add the shutdown for hibmc_pci_driver
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1586998974-24234-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <42a8f817-7319-fe03-1979-1a5a47bbe26e@suse.de>
Date: Thu, 18 Jun 2020 13:37:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1586998974-24234-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============2032508065=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2032508065==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ol9vxYNx3H2xNuzBDuflgO99LMJGwzPCV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ol9vxYNx3H2xNuzBDuflgO99LMJGwzPCV
Content-Type: multipart/mixed; boundary="VrEBWyRyJ78mNqtFctzS0kAzzRmLvBSfF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, puck.chen@hisilicon.com,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <42a8f817-7319-fe03-1979-1a5a47bbe26e@suse.de>
Subject: Re: [PATCH v2] drm/hisilicon: Add the shutdown for hibmc_pci_driver
References: <1586998974-24234-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1586998974-24234-1-git-send-email-tiantao6@hisilicon.com>

--VrEBWyRyJ78mNqtFctzS0kAzzRmLvBSfF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.04.20 um 03:02 schrieb Tian Tao:
> add the shutdown function to release the resource.

Why is this necessary for hibmc? The other PCI drivers don't require a
shutdown method.

>=20
> v2:
> Remove the unnecessary unmap function.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index a6fd0c2..0250a10 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -337,7 +337,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  	dev->pdev =3D pdev;
>  	pci_set_drvdata(pdev, dev);
> =20
> -	ret =3D pci_enable_device(pdev);
> +	ret =3D pcim_enable_device(pdev);

This probably makes sense.

Best regards
Thomas

>  	if (ret) {
>  		DRM_ERROR("failed to enable pci device: %d\n", ret);
>  		goto err_free;
> @@ -376,6 +376,11 @@ static void hibmc_pci_remove(struct pci_dev *pdev)=

>  	drm_dev_put(dev);
>  }
> =20
> +static void hibmc_pci_shutdown(struct pci_dev *pdev)
> +{
> +	hibmc_pci_remove(pdev);
> +}
> +
>  static struct pci_device_id hibmc_pci_table[] =3D {
>  	{ PCI_VDEVICE(HUAWEI, 0x1711) },
>  	{0,}
> @@ -386,6 +391,7 @@ static struct pci_driver hibmc_pci_driver =3D {
>  	.id_table =3D	hibmc_pci_table,
>  	.probe =3D	hibmc_pci_probe,
>  	.remove =3D	hibmc_pci_remove,
> +	.shutdown =3D	hibmc_pci_shutdown,
>  	.driver.pm =3D    &hibmc_pm_ops,
>  };
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VrEBWyRyJ78mNqtFctzS0kAzzRmLvBSfF--

--ol9vxYNx3H2xNuzBDuflgO99LMJGwzPCV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7rUe0ACgkQaA3BHVML
eiNgeAgAn2zAwsp4nbP1Bkjj2b0uFQjM3LoP3hmR1tf6+2RS/7Fh6O/6Wlt92iLj
I7lvk8Xt5yUUU65GkdKSZOhenrlw/5H2dunSQORLOTE2DRusQpMNZAHUsWKQKR44
8J/Gz3SfCsMFsxFsOSla26hWAL3dt80Ak9KdZnAXKZfZwu7HXGIuwHBXf8swbqT4
rfeE2WXBcNdEsZBA6y1ZIh6nU4kYwjXhgF+3YYD0pBRdFH2WPYN8jzYZYaPxVhx2
KvT34LUTk9HEoHJwkgOEPE0ChaPbOZjTLJbgqNsAROM8Waxd+IQTDTvafwvWKDBn
9bNATELq+tTY61NMCk6UZ+ICf0+lDA==
=p3bI
-----END PGP SIGNATURE-----

--ol9vxYNx3H2xNuzBDuflgO99LMJGwzPCV--

--===============2032508065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2032508065==--
