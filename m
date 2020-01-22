Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC1145985
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 17:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF826F5C6;
	Wed, 22 Jan 2020 16:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854E86F5C6;
 Wed, 22 Jan 2020 16:11:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3D36CAD7F;
 Wed, 22 Jan 2020 16:11:14 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] drm: add drm_core_check_all_features() to check
 for a mask of features
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20200122155030.29304-1-jani.nikula@intel.com>
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
Message-ID: <27b42818-44a2-402f-1ed8-6811e2ec1200@suse.de>
Date: Wed, 22 Jan 2020 17:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122155030.29304-1-jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0485110676=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0485110676==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KfbhdbKKSS2RwGWEhypMSwFcZPcF0UioB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KfbhdbKKSS2RwGWEhypMSwFcZPcF0UioB
Content-Type: multipart/mixed; boundary="6ENqw8kr60HqnjiiPJzyi0rJ5FppAQ2mO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Message-ID: <27b42818-44a2-402f-1ed8-6811e2ec1200@suse.de>
Subject: Re: [PATCH v3 1/2] drm: add drm_core_check_all_features() to check
 for a mask of features
References: <20200122155030.29304-1-jani.nikula@intel.com>
In-Reply-To: <20200122155030.29304-1-jani.nikula@intel.com>

--6ENqw8kr60HqnjiiPJzyi0rJ5FppAQ2mO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.01.20 um 16:50 schrieb Jani Nikula:
> Add new drm_core_check_all_features() function to check for a mask of
> features. All features in the mask are required.
>=20
> Redefine existing drm_core_check_feature() in terms of this function,
> using the drm_driver_feature enum for the parameter.
>=20
> v3:
> - add drm_core_check_all_features() (Thomas)

Oh! Thank you.

>=20
> v2:
> - fix kernel-doc (Ville)
> - add an extra variable for clarity (Ville)
>=20
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  include/drm/drm_drv.h | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index cf13470810a5..23b636691fb4 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -823,6 +823,25 @@ static inline bool drm_dev_is_unplugged(struct drm=
_device *dev)
>  	return true;
>  }
> =20
> +/**
> + * drm_core_check_all_features - check driver feature flags mask
> + * @dev: DRM device to check
> + * @features: feature flag(s) mask
> + *
> + * This checks @dev for driver features, see &drm_driver.driver_featur=
es,
> + * &drm_device.driver_features, and the various &enum drm_driver_featu=
re flags.
> + *
> + * Returns true if all features in the @features mask are supported, f=
alse
> + * otherwise.
> + */
> +static inline bool drm_core_check_all_features(const struct drm_device=
 *dev,
> +					       u32 features)
> +{
> +	u32 supported =3D dev->driver->driver_features & dev->driver_features=
;
> +
> +	return features && (supported & features) =3D=3D features;
> +}
> +
>  /**
>   * drm_core_check_feature - check driver feature flags
>   * @dev: DRM device to check
> @@ -833,9 +852,10 @@ static inline bool drm_dev_is_unplugged(struct drm=
_device *dev)
>   *
>   * Returns true if the @feature is supported, false otherwise.
>   */
> -static inline bool drm_core_check_feature(const struct drm_device *dev=
, u32 feature)
> +static inline bool drm_core_check_feature(const struct drm_device *dev=
,
> +					  enum drm_driver_feature feature)
>  {
> -	return dev->driver->driver_features & dev->driver_features & feature;=

> +	return drm_core_check_all_features(dev, feature);
>  }
> =20
>  /**
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6ENqw8kr60HqnjiiPJzyi0rJ5FppAQ2mO--

--KfbhdbKKSS2RwGWEhypMSwFcZPcF0UioB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4odB4ACgkQaA3BHVML
eiM7YQgAveRlDIgdcfliuvRyEZgA6wpwnIjfCZE44WBfNQ8JwqwHUH7V5iPpL5UF
YWgZV8UhqoagmA5gAgM/RafvKgfeoOfnIT/eTz2tdXzRHucUdImMIZiktH3VTA/7
+LUqnRsbbkWjVSND0mm4QkVp6WQQMBlNPXlocD2pUidr/4TKrEvLbW9zd6kfxLcE
ppLtXJwOaa7Pr/D/MN7IWII/sezD7UI9IpKL9WXx7rSSJnmt9K1pjHqBhqLwaB49
d17zFePfxqDT47HvOXDtINBOHyVYVMjCAUKS+yS6hasCO8JyOJbMyIfYbHhjOtEk
mkooF0UEcCLXGdFXdKvsmPP8IIW51A==
=f1CP
-----END PGP SIGNATURE-----

--KfbhdbKKSS2RwGWEhypMSwFcZPcF0UioB--

--===============0485110676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0485110676==--
