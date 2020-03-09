Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9AE17D9FB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 08:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97756E226;
	Mon,  9 Mar 2020 07:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B476E226
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 07:43:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8FF11AF72;
 Mon,  9 Mar 2020 07:43:38 +0000 (UTC)
Subject: Re: [PATCH] drm: Make drm_pci_agp_init legacy
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200307093702.2269-1-chris@chris-wilson.co.uk>
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
Message-ID: <49e52d96-9dd3-aa83-6358-d6848f417675@suse.de>
Date: Mon, 9 Mar 2020 08:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307093702.2269-1-chris@chris-wilson.co.uk>
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
Content-Type: multipart/mixed; boundary="===============1586362831=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1586362831==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LyBMDxBdDOz5rISREFFUpD0TUUX3YVphf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LyBMDxBdDOz5rISREFFUpD0TUUX3YVphf
Content-Type: multipart/mixed; boundary="H1zxTSzE2rTKozMRjMI0szezfgBYx8FqF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
Message-ID: <49e52d96-9dd3-aa83-6358-d6848f417675@suse.de>
Subject: Re: [PATCH] drm: Make drm_pci_agp_init legacy
References: <20200307093702.2269-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200307093702.2269-1-chris@chris-wilson.co.uk>

--H1zxTSzE2rTKozMRjMI0szezfgBYx8FqF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.03.20 um 10:37 schrieb Chris Wilson:
> Pull the drm_pci_agp_init() underneath the legacy ifdeffry alongside it=
s
> only caller.

My I suggest to change the commit message slightly, because the patch
actually moves drm_pci_agp_destroy(). Something along 'implement
_destroy() before _init() to protect the latter by CONFIG_DRM_LEGACY'
should do.

>=20
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

In any case

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_pci.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 5218475ad7e7..81aa21561982 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -166,6 +166,18 @@ int drm_irq_by_busid(struct drm_device *dev, void =
*data,
>  	return drm_pci_irq_by_busid(dev, p);
>  }
> =20
> +void drm_pci_agp_destroy(struct drm_device *dev)
> +{
> +	if (dev->agp) {
> +		arch_phys_wc_del(dev->agp->agp_mtrr);
> +		drm_legacy_agp_clear(dev);
> +		kfree(dev->agp);
> +		dev->agp =3D NULL;
> +	}
> +}
> +
> +#ifdef CONFIG_DRM_LEGACY
> +
>  static void drm_pci_agp_init(struct drm_device *dev)
>  {
>  	if (drm_core_check_feature(dev, DRIVER_USE_AGP)) {
> @@ -180,18 +192,6 @@ static void drm_pci_agp_init(struct drm_device *de=
v)
>  	}
>  }
> =20
> -void drm_pci_agp_destroy(struct drm_device *dev)
> -{
> -	if (dev->agp) {
> -		arch_phys_wc_del(dev->agp->agp_mtrr);
> -		drm_legacy_agp_clear(dev);
> -		kfree(dev->agp);
> -		dev->agp =3D NULL;
> -	}
> -}
> -
> -#ifdef CONFIG_DRM_LEGACY
> -
>  static int drm_get_pci_dev(struct pci_dev *pdev,
>  			   const struct pci_device_id *ent,
>  			   struct drm_driver *driver)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--H1zxTSzE2rTKozMRjMI0szezfgBYx8FqF--

--LyBMDxBdDOz5rISREFFUpD0TUUX3YVphf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5l86YACgkQaA3BHVML
eiMjZgf7BDeJop+jf8kpLw2NhHeP3CXFxwEG1BT/y+dRNrp+VXdYUtG8l0V4LyXN
yqdbeFg3U6hwD6Lwx7ffzANOnu/kfxcaQ5KHhPQ9GvdMnGb8WD0ThoH/gy05J0FE
Dj245eo3YUEZgNJ0bDz7zuQ1H5L8TjGA6lGAfPfq70wKFkGhC7ryUWeprKSGBR9V
2N2oSvLieidE8ySIlgRfAp5zbpjXS1OZTGQCQhsvIgszwXIV5JkkFgBuad8XQ+/J
VhuCSpelDs6Oeir/UMPTEhJPXQwjgE4Xl/irYwJJw58GzwKiG3xSduhsGrfO+TKZ
Q1bM00tuhB7Sge7Iy/oZr1ox6uzA/Q==
=NfXx
-----END PGP SIGNATURE-----

--LyBMDxBdDOz5rISREFFUpD0TUUX3YVphf--

--===============1586362831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1586362831==--
