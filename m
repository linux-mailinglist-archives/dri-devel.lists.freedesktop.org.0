Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E01558D8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 14:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE96A6FCA1;
	Fri,  7 Feb 2020 13:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F12F6E060;
 Fri,  7 Feb 2020 13:56:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C2854AFAE;
 Fri,  7 Feb 2020 13:56:49 +0000 (UTC)
Subject: Re: [PATCH] drm/qxl: add drm_driver.release callback.
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200207121405.25895-1-kraxel@redhat.com>
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
Message-ID: <4a6aae3a-5148-8593-0efe-1786cb0bf41e@suse.de>
Date: Fri, 7 Feb 2020 14:56:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207121405.25895-1-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1676215608=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1676215608==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="j5pSowMF1RznSZGlCiEpo0AL1G951df4M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--j5pSowMF1RznSZGlCiEpo0AL1G951df4M
Content-Type: multipart/mixed; boundary="bNca9cXX2dHZkq7Z8zobbXzJw9YbrdHUn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <4a6aae3a-5148-8593-0efe-1786cb0bf41e@suse.de>
Subject: Re: [PATCH] drm/qxl: add drm_driver.release callback.
References: <20200207121405.25895-1-kraxel@redhat.com>
In-Reply-To: <20200207121405.25895-1-kraxel@redhat.com>

--bNca9cXX2dHZkq7Z8zobbXzJw9YbrdHUn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.02.20 um 13:14 schrieb Gerd Hoffmann:
> Move final cleanups to qxl_drm_release() callback.
> Add drm_atomic_helper_shutdown() call to qxl_pci_remove().
>=20
> Reorder calls in qxl_device_fini().  Cleaning up gem & ttm
> might trigger qxl commands, so we should do that before
> releaseing command rings.

Should the second part be a separate patch?

Best regards
Thomas

>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 21 ++++++++++++++-------
>  drivers/gpu/drm/qxl/qxl_kms.c |  8 ++++----
>  2 files changed, 18 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_dr=
v.c
> index 1d601f57a6ba..8044363ba0f2 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -34,6 +34,7 @@
>  #include <linux/pci.h>
> =20
>  #include <drm/drm.h>
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -132,21 +133,25 @@ qxl_pci_probe(struct pci_dev *pdev, const struct =
pci_device_id *ent)
>  	return ret;
>  }
> =20
> +static void qxl_drm_release(struct drm_device *dev)
> +{
> +	struct qxl_device *qdev =3D dev->dev_private;
> +
> +	qxl_modeset_fini(qdev);
> +	qxl_device_fini(qdev);
> +	dev->dev_private =3D NULL;
> +	kfree(qdev);
> +}
> +
>  static void
>  qxl_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev =3D pci_get_drvdata(pdev);
> -	struct qxl_device *qdev =3D dev->dev_private;
> =20
>  	drm_dev_unregister(dev);
> -
> -	qxl_modeset_fini(qdev);
> -	qxl_device_fini(qdev);
> +	drm_atomic_helper_shutdown(dev);
>  	if (is_vga(pdev))
>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> -
> -	dev->dev_private =3D NULL;
> -	kfree(qdev);
>  	drm_dev_put(dev);
>  }
> =20
> @@ -279,6 +284,8 @@ static struct drm_driver qxl_driver =3D {
>  	.major =3D 0,
>  	.minor =3D 1,
>  	.patchlevel =3D 0,
> +
> +	.release =3D qxl_drm_release,
>  };
> =20
>  static int __init qxl_init(void)
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_km=
s.c
> index bfc1631093e9..70b20ee4741a 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -299,12 +299,12 @@ void qxl_device_fini(struct qxl_device *qdev)
>  {
>  	qxl_bo_unref(&qdev->current_release_bo[0]);
>  	qxl_bo_unref(&qdev->current_release_bo[1]);
> -	flush_work(&qdev->gc_work);
> -	qxl_ring_free(qdev->command_ring);
> -	qxl_ring_free(qdev->cursor_ring);
> -	qxl_ring_free(qdev->release_ring);
>  	qxl_gem_fini(qdev);
>  	qxl_bo_fini(qdev);
> +	flush_work(&qdev->gc_work);
> +	qxl_ring_free(qdev->command_ring);
> +	qxl_ring_free(qdev->cursor_ring);
> +	qxl_ring_free(qdev->release_ring);
>  	io_mapping_free(qdev->surface_mapping);
>  	io_mapping_free(qdev->vram_mapping);
>  	iounmap(qdev->ram_header);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--bNca9cXX2dHZkq7Z8zobbXzJw9YbrdHUn--

--j5pSowMF1RznSZGlCiEpo0AL1G951df4M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl49bJ4ACgkQaA3BHVML
eiOOmQf6AoWbKa22Ovy6vMK3tNMpamOd23WriCqWH1ef4o8NQhAhb+p8gPG86IO2
IHSmslvxRb3EIfMMm9A36Ju2OqPO0l7taQos50EyrBMHiWhcfGRmJXPTC//I2Xht
A7kPTBe3QFALi0bgTx2b4NweWijkR+8+YXBSI0FoXngsZ370PdLx74kYw8YMmrzS
cr7cWAcqOWtaxB5Nz5z7kHDx91qXlbwmqOB2xmmVNMDoMDL2Y07QIFHX36Dzw+Ux
MxdzyfGwZwPVvQojh25IBSlDCknWnaYwxw0HcHmB7STtmIJ3HnFhB/eSu7mdA2oh
BuCiP4FUTOk76pdSddmEQ3dqtlvJBg==
=wLW5
-----END PGP SIGNATURE-----

--j5pSowMF1RznSZGlCiEpo0AL1G951df4M--

--===============1676215608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1676215608==--
