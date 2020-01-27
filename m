Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F314A34F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 12:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA356EB29;
	Mon, 27 Jan 2020 11:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29C96EB29;
 Mon, 27 Jan 2020 11:55:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CEE54AB7F;
 Mon, 27 Jan 2020 11:55:34 +0000 (UTC)
Subject: Re: [PATCH] drm/auth: Drop master_create/destroy hooks
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200127100203.1299322-1-daniel.vetter@ffwll.ch>
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
Message-ID: <e3245912-46ee-d830-39eb-f9d5a32e6bdb@suse.de>
Date: Mon, 27 Jan 2020 12:55:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127100203.1299322-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Content-Type: multipart/mixed; boundary="===============1056718466=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1056718466==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8i6LwF4w3WrWUNM2Wc0Ei8fROvFZDmKZN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8i6LwF4w3WrWUNM2Wc0Ei8fROvFZDmKZN
Content-Type: multipart/mixed; boundary="kB8oQTRYX6Isph9yBXjLb9HIMarAfkTqf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <e3245912-46ee-d830-39eb-f9d5a32e6bdb@suse.de>
Subject: Re: [PATCH] drm/auth: Drop master_create/destroy hooks
References: <20200127100203.1299322-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200127100203.1299322-1-daniel.vetter@ffwll.ch>

--kB8oQTRYX6Isph9yBXjLb9HIMarAfkTqf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 27.01.20 um 11:02 schrieb Daniel Vetter:
> vmwgfx stopped using them.
>=20
> With the drm device model that we've slowly evolved over the past few
> years master status essentially controls access to display resources,
> and nothing else. Since that's a pure access permission check drivers
> should have no need at all to track additional state on a per file
> basis.
>=20
> Aside: For cleanup and restoring kernel-internal clients the grand
> plan is to move everyone over to drm_client and
> drm_master_internal_acquire/release, like the generic fbdev code
> already does. That should get rid of most ->lastclose implementations,
> and I think also subsumes any processing vmwgfx does in
> master_set/drop.
>=20
> Cc: "Thomas Hellstr=C3=B6m (VMware)" <thomas_os@shipmail.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_auth.c |  8 --------
>  include/drm/drm_drv.h      | 14 --------------
>  2 files changed, 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index cc9acd986c68..531b876d0ed8 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -153,11 +153,6 @@ static int drm_new_set_master(struct drm_device *d=
ev, struct drm_file *fpriv)
>  		return -ENOMEM;
>  	}
> =20
> -	if (dev->driver->master_create) {
> -		ret =3D dev->driver->master_create(dev, fpriv->master);
> -		if (ret)
> -			goto out_err;
> -	}
>  	fpriv->is_master =3D 1;
>  	fpriv->authenticated =3D 1;
> =20
> @@ -332,9 +327,6 @@ static void drm_master_destroy(struct kref *kref)
>  	if (drm_core_check_feature(dev, DRIVER_MODESET))
>  		drm_lease_destroy(master);
> =20
> -	if (dev->driver->master_destroy)
> -		dev->driver->master_destroy(dev, master);
> -
>  	drm_legacy_master_rmmaps(dev, master);
> =20
>  	idr_destroy(&master->magic_map);
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index f3f3e10873af..77bc63de0a91 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -460,20 +460,6 @@ struct drm_driver {
>  	 */
>  	void (*irq_uninstall) (struct drm_device *dev);
> =20
> -	/**
> -	 * @master_create:
> -	 *
> -	 * Called whenever a new master is created. Only used by vmwgfx.
> -	 */
> -	int (*master_create)(struct drm_device *dev, struct drm_master *maste=
r);
> -
> -	/**
> -	 * @master_destroy:
> -	 *
> -	 * Called whenever a master is destroyed. Only used by vmwgfx.
> -	 */
> -	void (*master_destroy)(struct drm_device *dev, struct drm_master *mas=
ter);
> -
>  	/**
>  	 * @master_set:
>  	 *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kB8oQTRYX6Isph9yBXjLb9HIMarAfkTqf--

--8i6LwF4w3WrWUNM2Wc0Ei8fROvFZDmKZN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4uz7IACgkQaA3BHVML
eiMwawf+NZ7ANSXF+2lM9FyoM8i/PHCFC/V5Xh/myzQ8glVSGZY2soIgi5CgMXy+
Pv+pZiFJ5cwH4tCmhpQQnQ1AL1F23cLTAMQu50/1hD67b9PWCuPE6FXK9NantWcM
Zsqf/LJ2EMoh/eek73gIx1yneFqxP5dkWhT+C0PvIzLsKT5flG/MQvYBA4HYiFX2
7+3uRMDlYvLm7g1KYYMGnpdCsNr2dotJxx0DMXTPfHX9aEQbw9rc2gQ0yi5B9lHq
4o36InnKMAWu70U+tX2j8dckBdyV0z6fOEAvnhjTJj1PUw9yHt83sNv6NyEC+Hfy
t3EpkIudMjy6HH2jTgGDr8ZzkGJIJQ==
=ewc+
-----END PGP SIGNATURE-----

--8i6LwF4w3WrWUNM2Wc0Ei8fROvFZDmKZN--

--===============1056718466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1056718466==--
