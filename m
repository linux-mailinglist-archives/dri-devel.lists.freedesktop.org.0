Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB6B1B0CCE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 15:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B63A6E56D;
	Mon, 20 Apr 2020 13:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EECB6E267;
 Mon, 20 Apr 2020 13:37:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 346BBABAD;
 Mon, 20 Apr 2020 13:37:03 +0000 (UTC)
Subject: Re: [PATCH 01/59] drm: Add devm_drm_dev_alloc macro
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-2-daniel.vetter@ffwll.ch>
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
Message-ID: <4d5229c2-acb4-b76f-13c7-88a5f3de4760@suse.de>
Date: Mon, 20 Apr 2020 15:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-2-daniel.vetter@ffwll.ch>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1198966902=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1198966902==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Yu6iFqa29W91N7Gjmk3pihack2wIuy9tF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Yu6iFqa29W91N7Gjmk3pihack2wIuy9tF
Content-Type: multipart/mixed; boundary="tT7KGiuHqCyEOyJfg9Z70bxVEhaiFvBBa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <4d5229c2-acb4-b76f-13c7-88a5f3de4760@suse.de>
Subject: Re: [PATCH 01/59] drm: Add devm_drm_dev_alloc macro
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20200415074034.175360-2-daniel.vetter@ffwll.ch>

--tT7KGiuHqCyEOyJfg9Z70bxVEhaiFvBBa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.04.20 um 09:39 schrieb Daniel Vetter:
> Add a new macro helper to combine the usual init sequence in drivers,
> consisting of a kzalloc + devm_drm_dev_init + drmm_add_final_kfree
> triplet. This allows us to remove the rather unsightly
> drmm_add_final_kfree from all currently merged drivers.
>=20
> The kerneldoc is only added for this new function. Existing kerneldoc
> and examples will be udated at the very end, since once all drivers
> are converted over to devm_drm_dev_alloc we can unexport a lot of
> interim functions and make the documentation for driver authors a lot
> cleaner and less confusing. There will be only one true way to
> initialize a drm_device at the end of this, which is going to be
> devm_drm_dev_alloc.
>=20
> v2:
> - Actually explain what this is for in the commit message (Sam)
> - Fix checkpatch issues (Sam)
>=20
> Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Sorry for being late. A number of nits are listed below. In any case:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> ---
>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
>  include/drm/drm_drv.h     | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 1bb4f636b83c..8e1813d2a12e 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -739,6 +739,29 @@ int devm_drm_dev_init(struct device *parent,
>  }
>  EXPORT_SYMBOL(devm_drm_dev_init);
> =20
> +void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *d=
river,
> +			   size_t size, size_t offset)

Maybe rename 'offset' of 'dev_offset' to make the relationship clear.

> +{
> +	void *container;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	container =3D kzalloc(size, GFP_KERNEL);
> +	if (!container)
> +		return ERR_PTR(-ENOMEM);
> +
> +	drm =3D container + offset;

While convenient, I somewhat dislike the use of void* variables. I'd use
unsigned char* for container and do an explicit cast to struct
drm_device* here.

> +	ret =3D devm_drm_dev_init(parent, drm, driver);
> +	if (ret) {
> +		kfree(container);
> +		return ERR_PTR(ret);
> +	}
> +	drmm_add_final_kfree(drm, container);
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__devm_drm_dev_alloc);
> +
>  /**
>   * drm_dev_alloc - Allocate new DRM device
>   * @driver: DRM driver to allocate device for
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index e7c6ea261ed1..f07f15721254 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -626,6 +626,39 @@ int devm_drm_dev_init(struct device *parent,
>  		      struct drm_device *dev,
>  		      struct drm_driver *driver);
> =20
> +void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *d=
river,
> +			   size_t size, size_t offset);
> +
> +/**
> + * devm_drm_dev_alloc - Resource managed allocation of a &drm_device i=
nstance
> + * @parent: Parent device object
> + * @driver: DRM driver
> + * @type: the type of the struct which contains struct &drm_device
> + * @member: the name of the &drm_device within @type.
> + *
> + * This allocates and initialize a new DRM device. No device registrat=
ion is done.
> + * Call drm_dev_register() to advertice the device to user space and r=
egister it
> + * with other core subsystems. This should be done last in the device
> + * initialization sequence to make sure userspace can't access an inco=
nsistent
> + * state.
> + *
> + * The initial ref-count of the object is 1. Use drm_dev_get() and
> + * drm_dev_put() to take and drop further ref-counts.
> + *
> + * It is recommended that drivers embed &struct drm_device into their =
own device
> + * structure.
> + *
> + * Note that this manages the lifetime of the resulting &drm_device
> + * automatically using devres. The DRM device initialized with this fu=
nction is
> + * automatically put on driver detach using drm_dev_put().
> + *
> + * RETURNS:
> + * Pointer to new DRM device, or ERR_PTR on failure.
> + */
> +#define devm_drm_dev_alloc(parent, driver, type, member) \

I'd replace 'member' with 'dev_field' to make the relation ship clear.

> +	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
> +				       offsetof(type, member)))
> +
>  struct drm_device *drm_dev_alloc(struct drm_driver *driver,
>  				 struct device *parent);
>  int drm_dev_register(struct drm_device *dev, unsigned long flags);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--tT7KGiuHqCyEOyJfg9Z70bxVEhaiFvBBa--

--Yu6iFqa29W91N7Gjmk3pihack2wIuy9tF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6dpXsACgkQaA3BHVML
eiOwOAf/Vc6ln+MHL6RpejOTZvAZqwWIyE5I2ICWXJcYLYGv6uu87WxH4qSXbZnz
37PiqdZNSvu4O2jr6Jb+kb7l10UBWYrQi1g0yy2zQdc5z2hZNUqZGmSSOTfq+Jxj
G69y+Fin2bYWThzjKPH7IG1Z3K0VDv+lAuTKTIja4woSG4wQ8W9/pSoHF+C0nhAh
E6OO1ofjdWWx+72FveIkrUjm639M77QaJxzOT8PrxK+qeFLZ9d+0JBGMKpk+l6/y
hf6LNAPUpUpf8VKbFeu2Yq4AZIU5Okhq0/xuBJQR9dQ4ojtnD55UFnHNfeaNWpl5
B7uoOuZWySJC6fQAQLDidyE1nRgNvw==
=mN2Z
-----END PGP SIGNATURE-----

--Yu6iFqa29W91N7Gjmk3pihack2wIuy9tF--

--===============1198966902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1198966902==--
