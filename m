Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB9A155832
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 14:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497B96FC90;
	Fri,  7 Feb 2020 13:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC086FC82
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 13:16:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55727AD55;
 Fri,  7 Feb 2020 13:16:15 +0000 (UTC)
Subject: Re: [PATCH] drm/cirrus: add drm_driver.release callback.
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200207121345.25639-1-kraxel@redhat.com>
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
Message-ID: <04253f60-c374-6eb1-53e9-fff2299658cd@suse.de>
Date: Fri, 7 Feb 2020 14:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207121345.25639-1-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1448747417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1448747417==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vWiAiFYFDSjXvdHMKsa0eatJA1wnAmM4k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vWiAiFYFDSjXvdHMKsa0eatJA1wnAmM4k
Content-Type: multipart/mixed; boundary="0UNtBLvA4uOHbcc5wWuhUjblFlWPhipdc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <04253f60-c374-6eb1-53e9-fff2299658cd@suse.de>
Subject: Re: [PATCH] drm/cirrus: add drm_driver.release callback.
References: <20200207121345.25639-1-kraxel@redhat.com>
In-Reply-To: <20200207121345.25639-1-kraxel@redhat.com>

--0UNtBLvA4uOHbcc5wWuhUjblFlWPhipdc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.02.20 um 13:13 schrieb Gerd Hoffmann:
> Move final cleanups from cirrus_pci_remove() to the new callback.
> Add drm_atomic_helper_shutdown() call to cirrus_pci_remove().
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/c=
irrus.c
> index a91fb0d7282c..39a9e964aac9 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -502,6 +502,16 @@ static void cirrus_mode_config_init(struct cirrus_=
device *cirrus)
> =20
>  /* ------------------------------------------------------------------ =
*/
> =20
> +static void cirrus_release(struct drm_device *dev)
> +{
> +	struct cirrus_device *cirrus =3D dev->dev_private;
> +
> +	drm_mode_config_cleanup(dev);
> +	iounmap(cirrus->mmio);
> +	iounmap(cirrus->vram);
> +	kfree(cirrus);
> +}
> +
>  DEFINE_DRM_GEM_FOPS(cirrus_fops);
> =20
>  static struct drm_driver cirrus_driver =3D {
> @@ -515,6 +525,7 @@ static struct drm_driver cirrus_driver =3D {
> =20
>  	.fops		 =3D &cirrus_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.release         =3D cirrus_release,
>  };
> =20
>  static int cirrus_pci_probe(struct pci_dev *pdev,
> @@ -596,14 +607,10 @@ static int cirrus_pci_probe(struct pci_dev *pdev,=

>  static void cirrus_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev =3D pci_get_drvdata(pdev);
> -	struct cirrus_device *cirrus =3D dev->dev_private;
> =20
>  	drm_dev_unregister(dev);
> -	drm_mode_config_cleanup(dev);
> -	iounmap(cirrus->mmio);
> -	iounmap(cirrus->vram);
> +	drm_atomic_helper_shutdown(dev);
>  	drm_dev_put(dev);
> -	kfree(cirrus);
>  	pci_release_regions(pdev);
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


--0UNtBLvA4uOHbcc5wWuhUjblFlWPhipdc--

--vWiAiFYFDSjXvdHMKsa0eatJA1wnAmM4k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl49Yx4ACgkQaA3BHVML
eiMtXAf/VzMYqgF7SypSGA1bMF0d9GIyj659fF5zNajxoPTbtaxZPtcPDXJCMwoW
iivOqe6ST42//C280daFteKV7wCx7yCww0KnA+X1sPT/6+RQEwKEpLoQovQaa5fM
SBPcS2hmeeq5CpXJch3ko+9cqagJD2H7zAzhOX+Sl7gLZSE7fQmtdBNoXbnbEUso
SigkqoEwtgGsEDliJJqU8lb2kd43YBOhpBbyabtDGSGecl/brrEUl8hHF8xnAh3y
Td0vqh5fHqMhg/2Y411eJDSrIDxi++mB/bJERF/hwfTkaUo1muMSM1QV3D8YWTGB
iTAxce401tBAjl3mpGYxPtwznblneg==
=McVl
-----END PGP SIGNATURE-----

--vWiAiFYFDSjXvdHMKsa0eatJA1wnAmM4k--

--===============1448747417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1448747417==--
