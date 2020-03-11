Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66616181420
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F4C6E93B;
	Wed, 11 Mar 2020 09:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0326E93B;
 Wed, 11 Mar 2020 09:09:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18EA0AF0D;
 Wed, 11 Mar 2020 09:09:29 +0000 (UTC)
Subject: Re: [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
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
Message-ID: <502c24ca-0e74-1d35-ce76-0443b1699620@suse.de>
Date: Wed, 11 Mar 2020 10:09:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1940349594=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1940349594==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="I7mc1nMVrnvzrblldvn12rnw7m2IIvXQx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I7mc1nMVrnvzrblldvn12rnw7m2IIvXQx
Content-Type: multipart/mixed; boundary="0Y5JoFzlEExzmbAjM0VIwlYzNRzbUuQps";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, xen-devel@lists.xenproject.org,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <502c24ca-0e74-1d35-ce76-0443b1699620@suse.de>
Subject: Re: [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20200302222631.3861340-5-daniel.vetter@ffwll.ch>

--0Y5JoFzlEExzmbAjM0VIwlYzNRzbUuQps
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 02.03.20 um 23:25 schrieb Daniel Vetter:
> I also did a full review of all callers, and only the xen driver
> forgot to call drm_dev_put in the failure path. Fix that up too.
>=20
> v2: I noticed that xen has a drm_driver.release hook, and uses
> drm_dev_alloc(). We need to remove the kfree from
> xen_drm_drv_release().
>=20
> bochs also has a release hook, but leaked the drm_device ever since
>=20
> commit 0a6659bdc5e8221da99eebb176fd9591435e38de
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Dec 17 18:04:46 2013 +0100
>=20
>     drm/bochs: new driver
>=20
> This patch here fixes that leak.
>=20
> Same for virtio, started leaking with
>=20
> commit b1df3a2b24a917f8853d43fe9683c0e360d2c33a
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Feb 11 14:58:04 2020 +0100
>=20
>     drm/virtio: add drm_driver.release callback.
>=20
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
>=20
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>=

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/gpu/drm/drm_drv.c           | 3 +++
>  drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 153050fc926c..7b84ee8a5eb5 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_color_mgmt.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_print.h>
> =20
> @@ -819,6 +820,8 @@ struct drm_device *drm_dev_alloc(struct drm_driver =
*driver,
>  		return ERR_PTR(ret);
>  	}
> =20
> +	drmm_add_final_kfree(dev, dev);
> +
>  	return dev;
>  }
>  EXPORT_SYMBOL(drm_dev_alloc);
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/=
xen_drm_front.c
> index 4be49c1aef51..d22b5da38935 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -461,7 +461,6 @@ static void xen_drm_drv_release(struct drm_device *=
dev)
>  	drm_mode_config_cleanup(dev);
> =20
>  	drm_dev_fini(dev);
> -	kfree(dev);
> =20
>  	if (front_info->cfg.be_alloc)
>  		xenbus_switch_state(front_info->xb_dev,
> @@ -561,6 +560,7 @@ static int xen_drm_drv_init(struct xen_drm_front_in=
fo *front_info)
>  fail_modeset:
>  	drm_kms_helper_poll_fini(drm_dev);
>  	drm_mode_config_cleanup(drm_dev);
> +	drm_dev_put(drm_dev);
>  fail:
>  	kfree(drm_info);
>  	return ret;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0Y5JoFzlEExzmbAjM0VIwlYzNRzbUuQps--

--I7mc1nMVrnvzrblldvn12rnw7m2IIvXQx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5oqscACgkQaA3BHVML
eiPeNwf8CadliNr19pxLEwSAFhgmEGKRY8CuLbjG06E/hEKBRxvm75VwMlB7Wv8H
o44jBC25qwIe1oU3b3XC3T+BPNLsVuTia84wignwokaVk1iIMmpVdQGfn70d28KC
fnO27PnD1X99pE5QcDVVWWF7e8PTFQvX/fU7Q1lfxDtmATtficyYnE55vVVoHdyL
6C80uMlbUaPXlHVUKAbpgRgU2wQdyOJGOtVkrxosBiDrtTAEadK1WcXUHy4kYy7L
/TZbcQTmNnYOqeuFFKVix+mpa9Noe56/wWGyojahWPGT2s3fsnwSZEEk3nfEe8ku
/Qklgee+wZsJIfzcPLZ6tNRotM3ZjA==
=pMB8
-----END PGP SIGNATURE-----

--I7mc1nMVrnvzrblldvn12rnw7m2IIvXQx--

--===============1940349594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1940349594==--
