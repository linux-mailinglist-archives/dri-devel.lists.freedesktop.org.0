Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6A1A953F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101EA6E8F7;
	Wed, 15 Apr 2020 07:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410CF6E8F1;
 Wed, 15 Apr 2020 07:55:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 000A4ACB0;
 Wed, 15 Apr 2020 07:55:06 +0000 (UTC)
Subject: Re: [PATCH 11/59] drm/udl: Use devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-12-daniel.vetter@ffwll.ch>
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
Message-ID: <6d9cd277-6e07-4db1-a7e1-01d3de1c84db@suse.de>
Date: Wed, 15 Apr 2020 09:55:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-12-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1473407707=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1473407707==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m6l5uby3AaTIacvlB2wLP2zkrkZ0ML1AS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m6l5uby3AaTIacvlB2wLP2zkrkZ0ML1AS
Content-Type: multipart/mixed; boundary="Zv4BKzCpSxGaNzSCdUDPIxx48phv31ZOM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.l.velikov@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>
Message-ID: <6d9cd277-6e07-4db1-a7e1-01d3de1c84db@suse.de>
Subject: Re: [PATCH 11/59] drm/udl: Use devm_drm_dev_alloc
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-12-daniel.vetter@ffwll.ch>
In-Reply-To: <20200415074034.175360-12-daniel.vetter@ffwll.ch>

--Zv4BKzCpSxGaNzSCdUDPIxx48phv31ZOM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 15.04.20 um 09:39 schrieb Daniel Vetter:
> Also init the fbdev emulation before we register the device, that way
> we can rely on the auto-cleanup and simplify the probe error code even
> more.
>=20
> v2: Rebase on top of Thomas' patches to remove the return value from
> drm_fbdev_generic_setup()
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/udl/udl_drv.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_dr=
v.c
> index 9cc6d075cb40..523f60e02a85 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -57,27 +57,20 @@ static struct udl_device *udl_driver_create(struct =
usb_interface *interface)
>  	struct udl_device *udl;
>  	int r;
> =20
> -	udl =3D kzalloc(sizeof(*udl), GFP_KERNEL);
> -	if (!udl)
> -		return ERR_PTR(-ENOMEM);
> -
> -	r =3D drm_dev_init(&udl->drm, &driver, &interface->dev);
> -	if (r) {
> -		kfree(udl);
> -		return ERR_PTR(r);
> -	}
> +	udl =3D devm_drm_dev_alloc(&interface->dev, &driver,
> +				 struct udl_device, drm);
> +	if (IS_ERR(udl))
> +		return udl;
> =20
>  	udl->udev =3D udev;
>  	udl->drm.dev_private =3D udl;
> -	drmm_add_final_kfree(&udl->drm, udl);
> =20
>  	r =3D udl_init(udl);
> -	if (r) {
> -		drm_dev_put(&udl->drm);
> +	if (r)
>  		return ERR_PTR(r);
> -	}
> =20
>  	usb_set_intfdata(interface, udl);
> +
>  	return udl;
>  }
> =20
> @@ -93,17 +86,13 @@ static int udl_usb_probe(struct usb_interface *inte=
rface,
> =20
>  	r =3D drm_dev_register(&udl->drm, 0);
>  	if (r)
> -		goto err_free;
> +		return r;
> =20
>  	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
> =20
>  	drm_fbdev_generic_setup(&udl->drm, 0);
> =20
>  	return 0;
> -
> -err_free:
> -	drm_dev_put(&udl->drm);
> -	return r;
>  }
> =20
>  static void udl_usb_disconnect(struct usb_interface *interface)
> @@ -113,7 +102,6 @@ static void udl_usb_disconnect(struct usb_interface=
 *interface)
>  	drm_kms_helper_poll_fini(dev);
>  	udl_drop_usb(dev);
>  	drm_dev_unplug(dev);
> -	drm_dev_put(dev);
>  }
> =20
>  /*
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Zv4BKzCpSxGaNzSCdUDPIxx48phv31ZOM--

--m6l5uby3AaTIacvlB2wLP2zkrkZ0ML1AS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6WvdoACgkQaA3BHVML
eiOpxwf+K6Svt+ZHHlU4OC3AEY0CrvVpJlY+W3aPIY+R/A9Pr4AjlG3mKxcP6wpr
A/kAMpdxPE5PRTLcOCL4Yt59YE1WONAW9rG215qL8TaHWhVpdGrOnrBnclWlU5PE
+Ys+3Vbvf7gP1MOVdcCn0HMCJgCkQg8jmHfgSFXuhZ//VNgoKhf0E0fa0IjRfel9
5W0JSmqFijpJ9c0GGp4NF5FYIjG0kfTPzKa2mOvzNtWpw0mTdBnIRiIfzYrGcnA0
WMAw/C+awSJP/AFl9baca5a6AmlydhG9Ip4SnJY4UG+BpboXdLOzepiQQJGd5Ik0
Xps9rVqg8uhQb/xjhOzOHPoS9PfDIg==
=xF8S
-----END PGP SIGNATURE-----

--m6l5uby3AaTIacvlB2wLP2zkrkZ0ML1AS--

--===============1473407707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1473407707==--
