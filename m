Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207226FFC5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 16:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C8E6ECE1;
	Fri, 18 Sep 2020 14:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013D26E182;
 Fri, 18 Sep 2020 14:26:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0D3DAB91;
 Fri, 18 Sep 2020 14:27:18 +0000 (UTC)
Subject: Re: [PATCH 4/4] drm/dev: Remove drm_dev_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
 <20200918132505.2316382-5-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ba829479-f405-d83d-a278-128c063fe751@suse.de>
Date: Fri, 18 Sep 2020 16:26:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918132505.2316382-5-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1502666672=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1502666672==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yn2lRPC6DbpN4bQH9sfk9hAdPLL5nfWRA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yn2lRPC6DbpN4bQH9sfk9hAdPLL5nfWRA
Content-Type: multipart/mixed; boundary="Bsw5zqA4FkROoHLvbOz7wdmqUUJqriWcT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
Message-ID: <ba829479-f405-d83d-a278-128c063fe751@suse.de>
Subject: Re: [PATCH 4/4] drm/dev: Remove drm_dev_init
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
 <20200918132505.2316382-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20200918132505.2316382-5-daniel.vetter@ffwll.ch>

--Bsw5zqA4FkROoHLvbOz7wdmqUUJqriWcT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 18.09.20 um 15:25 schrieb Daniel Vetter:
> We can now also delete drm_dev_init, now that vkms, vgem and i915
> selftests are resolved.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_drv.c      | 41 +++-------------------------------=

>  drivers/gpu/drm/drm_internal.h |  1 +
>  drivers/gpu/drm/drm_managed.c  | 13 -----------
>  include/drm/drm_drv.h          |  4 ----
>  4 files changed, 4 insertions(+), 55 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7c1689842ec0..457ac0f82be2 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -573,43 +573,9 @@ static void drm_dev_init_release(struct drm_device=
 *dev, void *res)
>  	drm_legacy_destroy_members(dev);
>  }
> =20
> -/**
> - * drm_dev_init - Initialise new DRM device
> - * @dev: DRM device
> - * @driver: DRM driver
> - * @parent: Parent device object
> - *
> - * Initialize a new DRM device. No device registration is done.
> - * Call drm_dev_register() to advertice the device to user space and r=
egister it
> - * with other core subsystems. This should be done last in the device
> - * initialization sequence to make sure userspace can't access an inco=
nsistent
> - * state.
> - *
> - * The initial ref-count of the object is 1. Use drm_dev_get() and
> - * drm_dev_put() to take and drop further ref-counts.
> - *
> - * It is recommended that drivers embed &struct drm_device into their =
own device
> - * structure.
> - *
> - * Drivers that do not want to allocate their own device struct
> - * embedding &struct drm_device can call drm_dev_alloc() instead. For =
drivers
> - * that do embed &struct drm_device it must be placed first in the ove=
rall
> - * structure, and the overall structure must be allocated using kmallo=
c(): The
> - * drm core's release function unconditionally calls kfree() on the @d=
ev pointer
> - * when the final reference is released. To override this behaviour, a=
nd so
> - * allow embedding of the drm_device inside the driver's device struct=
 at an
> - * arbitrary offset, you must supply a &drm_driver.release callback an=
d control
> - * the finalization explicitly.
> - *
> - * Note that drivers must call drmm_add_final_kfree() after this funct=
ion has
> - * completed successfully.
> - *
> - * RETURNS:
> - * 0 on success, or error code on failure.
> - */
> -int drm_dev_init(struct drm_device *dev,
> -		 struct drm_driver *driver,
> -		 struct device *parent)
> +static int drm_dev_init(struct drm_device *dev,
> +			struct drm_driver *driver,
> +			struct device *parent)
>  {
>  	int ret;
> =20
> @@ -689,7 +655,6 @@ int drm_dev_init(struct drm_device *dev,
> =20
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_dev_init);
> =20
>  static void devm_drm_dev_init_release(void *data)
>  {
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_inter=
nal.h
> index 8e01caaf95cc..b65865c630b0 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -95,6 +95,7 @@ void drm_minor_release(struct drm_minor *minor);
> =20
>  /* drm_managed.c */
>  void drm_managed_release(struct drm_device *dev);
> +void drmm_add_final_kfree(struct drm_device *dev, void *container);
> =20
>  /* drm_vblank.c */
>  static inline bool drm_vblank_passed(u64 seq, u64 ref)
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_manage=
d.c
> index c36e3d98fd71..37d7db6223be 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -125,18 +125,6 @@ static void add_dr(struct drm_device *dev, struct =
drmres *dr)
>  		       dr, dr->node.name, (unsigned long) dr->node.size);
>  }
> =20
> -/**
> - * drmm_add_final_kfree - add release action for the final kfree()
> - * @dev: DRM device
> - * @container: pointer to the kmalloc allocation containing @dev
> - *
> - * Since the allocation containing the struct &drm_device must be allo=
cated
> - * before it can be initialized with drm_dev_init() there's no way to =
allocate
> - * that memory with drmm_kmalloc(). To side-step this chicken-egg prob=
lem the
> - * pointer for this final kfree() must be specified by calling this fu=
nction. It
> - * will be released in the final drm_dev_put() for @dev, after all oth=
er release
> - * actions installed through drmm_add_action() have been processed.
> - */
>  void drmm_add_final_kfree(struct drm_device *dev, void *container)
>  {
>  	WARN_ON(dev->managed.final_kfree);
> @@ -144,7 +132,6 @@ void drmm_add_final_kfree(struct drm_device *dev, v=
oid *container)
>  	WARN_ON(dev + 1 > (struct drm_device *) (container + ksize(container)=
));
>  	dev->managed.final_kfree =3D container;
>  }
> -EXPORT_SYMBOL(drmm_add_final_kfree);
> =20
>  int __drmm_add_action(struct drm_device *dev,
>  		      drmres_release_t action,
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 533c6e1a5a95..b8ce9147c9a6 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -591,10 +591,6 @@ struct drm_driver {
>  	int dev_priv_size;
>  };
> =20
> -int drm_dev_init(struct drm_device *dev,
> -		 struct drm_driver *driver,
> -		 struct device *parent);
> -
>  void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *d=
river,
>  			   size_t size, size_t offset);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Bsw5zqA4FkROoHLvbOz7wdmqUUJqriWcT--

--yn2lRPC6DbpN4bQH9sfk9hAdPLL5nfWRA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9kw6MUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMkMgf/eEF3CfhbbF0jRka8uLy9aVIG08/O
PLahp5MHZZaHo9CoNBE5uPVUMmoifh340IBfJQQX04JoFjHNe0rrMYEti6PGagEp
p/TvUAeok1YhPshJkH24ibSa8uki4uglL4ZRG0W3tz9Y55tUix19Z3i7hIHF5S3z
UuweNcL10RCH+kD1O2FoiIYo9WxB6icWRUvpSrNJDI28vBEpPoRT3L6SITvJhxRd
RF1ldDET5auD12yrLBtawm8yga8THWjeTh62Ma9eYbdjHuTqvf2HShkXnknfNENB
15RtkrAwbxPezRKvj6K0pNXR0agQr+t9VVhJw2QqY/XON7VgoGcBU7aMVg==
=nqh+
-----END PGP SIGNATURE-----

--yn2lRPC6DbpN4bQH9sfk9hAdPLL5nfWRA--

--===============1502666672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1502666672==--
