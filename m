Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2BF1C9749
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 19:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272BF6EA3F;
	Thu,  7 May 2020 17:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2241E6EA3F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 17:20:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BE4EABCE;
 Thu,  7 May 2020 17:20:19 +0000 (UTC)
Subject: Re: [PATCH 08/36] drm: remove drm_driver::gem_free_object
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-9-emil.l.velikov@gmail.com>
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
Message-ID: <f4fe1d12-7dda-3034-2692-c4b763259eed@suse.de>
Date: Thu, 7 May 2020 19:20:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200507150822.114464-9-emil.l.velikov@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2004714900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2004714900==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9PmG90LdZvMdmgBMhKWp9Sy9kW1SZfZUm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9PmG90LdZvMdmgBMhKWp9Sy9kW1SZfZUm
Content-Type: multipart/mixed; boundary="EUUyfgrQEC3TZ9tQoKgP3vCE8t9HOcJYn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Message-ID: <f4fe1d12-7dda-3034-2692-c4b763259eed@suse.de>
Subject: Re: [PATCH 08/36] drm: remove drm_driver::gem_free_object
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-9-emil.l.velikov@gmail.com>
In-Reply-To: <20200507150822.114464-9-emil.l.velikov@gmail.com>

--EUUyfgrQEC3TZ9tQoKgP3vCE8t9HOcJYn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.05.20 um 17:07 schrieb Emil Velikov:
> From: Emil Velikov <emil.velikov@collabora.com>
>=20
> No drivers set the callback, so remove it all together.
>=20
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem.c | 22 +++-------------------
>  include/drm/drm_drv.h     |  8 --------
>  include/drm/drm_gem.h     |  5 +++--
>  3 files changed, 6 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 12fa121d0966..dab8763b2e73 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -975,15 +975,10 @@ drm_gem_object_free(struct kref *kref)
>  		container_of(kref, struct drm_gem_object, refcount);
>  	struct drm_device *dev =3D obj->dev;
> =20
> -	if (obj->funcs) {
> +	if (obj->funcs)
>  		obj->funcs->free(obj);
> -	} else if (dev->driver->gem_free_object_unlocked) {
> +	else if (dev->driver->gem_free_object_unlocked)
>  		dev->driver->gem_free_object_unlocked(obj);
> -	} else if (dev->driver->gem_free_object) {
> -		WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> -
> -		dev->driver->gem_free_object(obj);
> -	}
>  }
>  EXPORT_SYMBOL(drm_gem_object_free);
> =20
> @@ -999,21 +994,10 @@ EXPORT_SYMBOL(drm_gem_object_free);
>  void
>  drm_gem_object_put_unlocked(struct drm_gem_object *obj)
>  {
> -	struct drm_device *dev;
> -
>  	if (!obj)
>  		return;
> =20
> -	dev =3D obj->dev;
> -
> -	if (dev->driver->gem_free_object) {
> -		might_lock(&dev->struct_mutex);
> -		if (kref_put_mutex(&obj->refcount, drm_gem_object_free,
> -				&dev->struct_mutex))
> -			mutex_unlock(&dev->struct_mutex);
> -	} else {
> -		kref_put(&obj->refcount, drm_gem_object_free);
> -	}
> +	kref_put(&obj->refcount, drm_gem_object_free);
>  }
>  EXPORT_SYMBOL(drm_gem_object_put_unlocked);
> =20
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 6d457652f199..e6eff508f687 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -327,14 +327,6 @@ struct drm_driver {
>  	 */
>  	void (*debugfs_init)(struct drm_minor *minor);
> =20
> -	/**
> -	 * @gem_free_object: deconstructor for drm_gem_objects
> -	 *
> -	 * This is deprecated and should not be used by new drivers. Use
> -	 * &drm_gem_object_funcs.free instead.
> -	 */
> -	void (*gem_free_object) (struct drm_gem_object *obj);
> -
>  	/**
>  	 * @gem_free_object_unlocked: deconstructor for drm_gem_objects
>  	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 0b375069cd48..ec2d24a60a76 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -272,8 +272,9 @@ struct drm_gem_object {
>  	 * attachment point for the device. This is invariant over the lifeti=
me
>  	 * of a gem object.
>  	 *
> -	 * The &drm_driver.gem_free_object callback is responsible for cleani=
ng
> -	 * up the dma_buf attachment and references acquired at import time.
> +	 * The &drm_driver.gem_free_object_unlocked callback is responsible f=
or
> +	 * cleaning up the dma_buf attachment and references acquired at impo=
rt
> +	 * time.
>  	 *
>  	 * Note that the drm gem/prime core does not depend upon drivers sett=
ing
>  	 * this field any more. So for drivers where this doesn't make sense
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--EUUyfgrQEC3TZ9tQoKgP3vCE8t9HOcJYn--

--9PmG90LdZvMdmgBMhKWp9Sy9kW1SZfZUm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl60Q1AACgkQaA3BHVML
eiP/yQgAggMYLzKiUsOsxgo/lw2JSnC6Iow+iIWRr77b0G4aFvQBlLsc7hRIr9pu
RtZAr5bMGY1borZYUAvB0gtygBxCq5FhJUa9UBKjhsTYr1VyKJOshG2tiLVmvHFS
3KOok4uSe/h7uwYqfvRjeABPFt5G87+gV9O4fHcXtDVX5bh+sabaPn8kQ9t4vqiv
sewHqlv5Oqdmcltfj70Pk4A4kKcvy/ytW4tGYd6N5kqklm7t6FoSSIAmOopOCLMP
4/0qGKaSaG5fA2I200fakCst81JzlKLR/tL8vKyWuKCeMlUCu5AWt1YGZH4GWlQW
S0znyevI5bi8nmhHLzNDqAXcM62FEw==
=9zf9
-----END PGP SIGNATURE-----

--9PmG90LdZvMdmgBMhKWp9Sy9kW1SZfZUm--

--===============2004714900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2004714900==--
