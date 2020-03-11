Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9699F181445
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B84A6E949;
	Wed, 11 Mar 2020 09:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71576E944;
 Wed, 11 Mar 2020 09:14:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D4BFAE87;
 Wed, 11 Mar 2020 09:14:04 +0000 (UTC)
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
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
Message-ID: <3afd6c45-1f32-160e-2546-a502b8f1d743@suse.de>
Date: Wed, 11 Mar 2020 10:14:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1429397456=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1429397456==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BJfQx35lj7X3YfA7Qo2lEGPG4aD2VUvVP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BJfQx35lj7X3YfA7Qo2lEGPG4aD2VUvVP
Content-Type: multipart/mixed; boundary="GuGPiMsVYn8tK3rEOE25NSeqrooYmK5Al";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <3afd6c45-1f32-160e-2546-a502b8f1d743@suse.de>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20200302222631.3861340-4-daniel.vetter@ffwll.ch>

--GuGPiMsVYn8tK3rEOE25NSeqrooYmK5Al
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 02.03.20 um 23:25 schrieb Daniel Vetter:
<...>
> +
> +int __drmm_add_action(struct drm_device *dev,
> +		      drmres_release_t action,
> +		      void *data, const char *name)
> +{
> +	struct drmres *dr;
> +	void **void_ptr;
> +
> +	dr =3D alloc_dr(action, data ? sizeof(void*) : 0,
> +		      GFP_KERNEL | __GFP_ZERO,
> +		      dev_to_node(dev->dev));
> +	if (!dr) {
> +		drm_dbg_drmres(dev, "failed to add action %s for %p\n",
> +			       name, data);
> +		return -ENOMEM;
> +	}
> +
> +	dr->node.name =3D name;

Maybe do a kstrdup_const() on name and later a kfree_const() during
release. Just in case someone decides to allocate 'name' dynamically.

> +	if (data) {
> +		void_ptr =3D (void **)&dr->data;
> +		*void_ptr =3D data;
> +	}
> +
> +	add_dr(dev, dr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(__drmm_add_action);
> +
> +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> +{
> +	struct drmres *dr;
> +
> +	dr =3D alloc_dr(NULL, size, gfp, dev_to_node(dev->dev));
> +	if (!dr) {
> +		drm_dbg_drmres(dev, "failed to allocate %zu bytes, %u flags\n",
> +			       size, gfp);
> +		return NULL;
> +	}
> +	dr->node.name =3D "kmalloc";
> +
> +	add_dr(dev, dr);
> +
> +	return dr->data;
> +}
> +EXPORT_SYMBOL(drmm_kmalloc);
> +
> +void drmm_kfree(struct drm_device *dev, void *data)
> +{
> +	struct drmres *dr_match =3D NULL, *dr;
> +	unsigned long flags;
> +
> +	if (!data)
> +		return;
> +
> +	spin_lock_irqsave(&dev->managed.lock, flags);
> +	list_for_each_entry(dr, &dev->managed.resources, node.entry) {
> +		if (dr->data =3D=3D data) {
> +			dr_match =3D dr;
> +			del_dr(dev, dr_match);
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> +
> +	if (WARN_ON(!dr_match))
> +		return;
> +
> +	kfree(dr_match);
> +}
> +EXPORT_SYMBOL(drmm_kfree);
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index bb60a949f416..d39132b477dd 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -67,6 +67,21 @@ struct drm_device {
>  	/** @dev: Device structure of bus-device */
>  	struct device *dev;
> =20
> +	/**
> +	 * @managed:
> +	 *
> +	 * Managed resources linked to the lifetime of this &drm_device as
> +	 * tracked by @ref.
> +	 */
> +	struct {
> +		/** @managed.resources: managed resources list */
> +		struct list_head resources;
> +		/** @managed.final_kfree: pointer for final kfree() call */
> +		void *final_kfree;
> +		/** @managed.lock: protects @managed.resources */
> +		spinlock_t lock;
> +	} managed;
> +
>  	/** @driver: DRM driver managing the device */
>  	struct drm_driver *driver;
> =20
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> new file mode 100644
> index 000000000000..7b5df7d09b19
> --- /dev/null
> +++ b/include/drm/drm_managed.h
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#ifndef _DRM_MANAGED_H_
> +#define _DRM_MANAGED_H_
> +
> +#include <linux/gfp.h>
> +#include <linux/types.h>
> +
> +struct drm_device;
> +
> +typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
> +
> +#define drmm_add_action(dev, action, data) \
> +	__drmm_add_action(dev, action, data, #action)
> +
> +int __must_check __drmm_add_action(struct drm_device *dev,
> +				   drmres_release_t action,
> +				   void *data, const char *name);
> +
> +void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> +
> +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __m=
alloc;
> +static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, =
gfp_t gfp)
> +{
> +	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
> +}
> +
> +void drmm_kfree(struct drm_device *dev, void *data);
> +
> +#endif
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index ca7cee8e728a..1c9417430d08 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -313,6 +313,10 @@ enum drm_debug_category {
>  	 * @DRM_UT_DP: Used in the DP code.
>  	 */
>  	DRM_UT_DP		=3D 0x100,
> +	/**
> +	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
> +	 */
> +	DRM_UT_DRMRES		=3D 0x200,
>  };
> =20
>  static inline bool drm_debug_enabled(enum drm_debug_category category)=

> @@ -442,6 +446,8 @@ void drm_dev_dbg(const struct device *dev, enum drm=
_debug_category category,
>  	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_dp(drm, fmt, ...)					\
>  	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +#define drm_dbg_drmres(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> =20
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


--GuGPiMsVYn8tK3rEOE25NSeqrooYmK5Al--

--BJfQx35lj7X3YfA7Qo2lEGPG4aD2VUvVP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5oq9sACgkQaA3BHVML
eiO1cgf/dpjQmkrWM8U7zk2u2kD2j/zm21+7a1aDO+d7W4/xiOvzDOTjUl7oc9LF
uBL5yQskbYkCAU4+tHFqZ6O6TD8tmQGQobtZMG+iukejkSzrvf7rMwgwGJZFp30e
ua3qQdU2YEpfSB+AgXOcG1C52AG4z8wjlC+EdAMWn5AC9ZCjjaaC4olx3Xe9zarK
OchmQDSAUdBFuIn9DW6Y2Ojht9YuLoYgIAwrc3dzYNm7vV7RrpGMFWtQwk9PYQ7d
n2SMBHRGj+fCEVj9eWSKAg73qmXlI58fyxZt4kkPX7cJTXYEzQmfXNRdCO9VO2Ku
8cPtuPsBfsigbgQgJsQbLna6J8cHuQ==
=KWnS
-----END PGP SIGNATURE-----

--BJfQx35lj7X3YfA7Qo2lEGPG4aD2VUvVP--

--===============1429397456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1429397456==--
