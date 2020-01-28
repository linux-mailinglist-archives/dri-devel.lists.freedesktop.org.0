Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD36F14B53C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 14:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8AD6EE36;
	Tue, 28 Jan 2020 13:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EBB6E079;
 Tue, 28 Jan 2020 13:41:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9388AACF2;
 Tue, 28 Jan 2020 13:41:11 +0000 (UTC)
Subject: Re: [PATCH 1/4] drm: Complain if drivers still use the ->load callback
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
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
Message-ID: <8ccf8e5f-426e-5433-ace0-dc351e610b83@suse.de>
Date: Tue, 28 Jan 2020 14:41:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0492082160=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0492082160==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="c2CK0M5Q9HD9k6cB0Gg6gKbQQDtD0tLOi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c2CK0M5Q9HD9k6cB0Gg6gKbQQDtD0tLOi
Content-Type: multipart/mixed; boundary="1iK7lX7bEYjdLY9e2gRn84MNmrvSN0kPB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <8ccf8e5f-426e-5433-ace0-dc351e610b83@suse.de>
Subject: Re: [PATCH 1/4] drm: Complain if drivers still use the ->load
 callback
References: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>

--1iK7lX7bEYjdLY9e2gRn84MNmrvSN0kPB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.01.20 um 11:45 schrieb Daniel Vetter:
> Kinda time to get this sorted. The locking around this really is not
> nice.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>  include/drm/drm_drv.h     | 3 +++
>  2 files changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7c18a980cd4b..8deff75b484c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -948,6 +948,12 @@ int drm_dev_register(struct drm_device *dev, unsig=
ned long flags)
> =20
>  	mutex_lock(&drm_global_mutex);
> =20
> +	if (dev->driver->load) {
> +		if (!drm_core_check_feature(dev, DRIVER_LEGACY))
> +			DRM_INFO("drm driver %s is using deprecated ->load callback\n",
> +				 dev->driver->name);
> +	}
> +
>  	ret =3D drm_minor_register(dev, DRM_MINOR_RENDER);
>  	if (ret)
>  		goto err_minors;
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 77685ed7aa65..77bc63de0a91 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -173,6 +173,9 @@ struct drm_driver {
>  	 *
>  	 * This is deprecated, do not use!
>  	 *
> +	 * FIXME: A few non-DRIVER_LEGACY drivers still use this, and should =
be
> +	 * converted.
> +	 *

I recently converted several of them. The status here is that only
radeon and amdgpu still use load. I've only not been able to convert
them because they do some debugfs registering that relies on the device
being registered early. I've not had time to convert the code.

On the patch:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>


>  	 * Returns:
>  	 *
>  	 * Zero on success, non-zero value on failure.
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1iK7lX7bEYjdLY9e2gRn84MNmrvSN0kPB--

--c2CK0M5Q9HD9k6cB0Gg6gKbQQDtD0tLOi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4wOfYACgkQaA3BHVML
eiOW0AgAmObBqpw2MYV3qf2bn89lxcKquZL7pUvBRzbMP5k2T8EliFc3kG8QHPz9
KdhKmWmJn3XNug45JsTH9WXMzXQVRz73eeKSXlj16Xxv7kOYj7OB8G30hiS+OKKl
XhBuVv/44ReYRu2Q2lFGi/1dmFZKcY761byfxKT+ZXF3hepDAkc6om0I59TWFmhv
swVgCWMO+n/a8MvjpuF8jsO5RHZKvwtpS4PVkkaza12ghw2nWjflnjcsSgoxC/0J
Ob0byay9DfoKHlioYtJn+WNTt4tDw0i45Wv2/iyc1dgPqduSEavbrgHKa/RQbdVq
Lehq869RIjbEA0Id2d+NWy89bSkfyQ==
=PeFa
-----END PGP SIGNATURE-----

--c2CK0M5Q9HD9k6cB0Gg6gKbQQDtD0tLOi--

--===============0492082160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0492082160==--
