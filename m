Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD406876017
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87F310F906;
	Fri,  8 Mar 2024 08:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tGnGolWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F188210F906;
 Fri,  8 Mar 2024 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709887705;
 bh=G6td0EPi8UgAVaeTT6Ojk1zJx40muoYfVNOyEwAeKXM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tGnGolWHLeWRm7+hxvNhrepHed1oryZONOGMTVldx+j5Qi4ex33Ma44YpwT5mk7Ie
 mSUUni+OYZ8Wk1rx5kcQXo1GpAxgNg+VxMaY5y9zBRwEKkac5zdPYWZ+vjNWUQTSuk
 f1Ecee0UBxaZQeqIPv7KrwQyA9mNcFborSkcWUT0NzlNdaM7qjwuvhJp9nMFRak6Fs
 ZnaFEooaH/drwIjs81fLSeT72xMIx5PsB1VxnlbYnmdVjVgSB7rfsytosXlv7V/dV5
 8EeU0TFXrkjWNZ1XFBj5oFh3I9TGba5/1htDPzcPqJP+sbP/l5HiQHi8iHaQjaqm0Z
 qoeuz5KKotTrw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B118B37813CA;
 Fri,  8 Mar 2024 08:48:24 +0000 (UTC)
Date: Fri, 8 Mar 2024 10:48:16 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm: Introduce sharpness mode property
Message-ID: <20240308104816.4cc72e02.pekka.paalanen@collabora.com>
In-Reply-To: <20240307083237.576177-2-nemesa.garg@intel.com>
References: <20240307083237.576177-1-nemesa.garg@intel.com>
 <20240307083237.576177-2-nemesa.garg@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vjiBFcUhZgAqEddVD/mXzMG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vjiBFcUhZgAqEddVD/mXzMG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu,  7 Mar 2024 14:02:33 +0530
Nemesa Garg <nemesa.garg@intel.com> wrote:

> This allows the user to set the intensity
> so as to get the sharpness effect.
>=20
> It is useful in scenario when the output is blurry
> and user want to sharpen the pixels.
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>  drivers/gpu/drm/drm_crtc.c        | 17 +++++++++++++++++
>  include/drm/drm_crtc.h            | 17 +++++++++++++++++
>  3 files changed, 38 insertions(+)

Hi,

the UAPI documentation is completely missing. This cannot be discussed
until the UAPI contract is drafted. It needs to end up in the
appropriate "Properties" section under
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#kms-properties
when documentation is built.

I also do not see any of the previous review comments being addressed
that I recall.

The typo "sharpeness" is very common in these patches, and it is even
in the UAPI as the property name. Also doc comments use different
spelling than actual code. And sometimes you use even "sharpening"
instead of "sharpness". Which one is it?


Thanks,
pq

>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 29d4940188d4..773873726b87 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -417,6 +417,8 @@ static int drm_atomic_crtc_set_property(struct drm_cr=
tc *crtc,
>  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>  	} else if (property =3D=3D crtc->scaling_filter_property) {
>  		state->scaling_filter =3D val;
> +	} else if (property =3D=3D crtc->sharpening_strength_prop) {
> +		state->sharpeness_strength =3D val;
>  	} else if (crtc->funcs->atomic_set_property) {
>  		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>  	} else {
> @@ -454,6 +456,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val =3D 0;
>  	else if (property =3D=3D crtc->scaling_filter_property)
>  		*val =3D state->scaling_filter;
> +	else if (property =3D=3D crtc->sharpening_strength_prop)
> +		*val =3D state->sharpeness_strength;
>  	else if (crtc->funcs->atomic_get_property)
>  		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>  	else {
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index cb90e70d85e8..d01ab76a719f 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -955,3 +955,20 @@ int drm_crtc_create_scaling_filter_property(struct d=
rm_crtc *crtc,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
> +
> +int drm_crtc_create_sharpening_strength_property(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +
> +	struct drm_property *prop =3D
> +		drm_property_create_range(dev, 0, "SHARPENESS_STRENGTH", 0, 255);
> +
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	crtc->sharpening_strength_prop =3D prop;
> +	drm_object_attach_property(&crtc->base, prop, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_create_sharpening_strength_property);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8b48a1974da3..241514fc3eea 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -317,6 +317,16 @@ struct drm_crtc_state {
>  	 */
>  	enum drm_scaling_filter scaling_filter;
> =20
> +	/**
> +	 * @sharpness_strength
> +	 *
> +	 * Used by the user to set the sharpness intensity.
> +	 * The value ranges from 0-255.
> +	 * Any value greater than 0 means enabling the featuring
> +	 * along with setting the value for sharpness.
> +	 */
> +	u8 sharpeness_strength;
> +
>  	/**
>  	 * @event:
>  	 *
> @@ -1088,6 +1098,12 @@ struct drm_crtc {
>  	 */
>  	struct drm_property *scaling_filter_property;
> =20
> +	/**
> +	 * @sharpening_strength_prop: property to apply
> +	 * the intensity of the sharpness requested.
> +	 */
> +	struct drm_property *sharpening_strength_prop;
> +
>  	/**
>  	 * @state:
>  	 *
> @@ -1324,4 +1340,5 @@ static inline struct drm_crtc *drm_crtc_find(struct=
 drm_device *dev,
>  int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  					    unsigned int supported_filters);
> =20
> +int drm_crtc_create_sharpening_strength_property(struct drm_crtc *crtc);
>  #endif /* __DRM_CRTC_H__ */


--Sig_/vjiBFcUhZgAqEddVD/mXzMG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXq0NAACgkQI1/ltBGq
qqds/BAAo+eVRPcIAIaUm3uSXgahI9XYqvEPZk9scaq35f5JO0hF06mHHLp5QZm4
02Lh8BjFyr4V1V2xUS9vfnhpAKKyb9AMQ1QhUpMjCPQHSAsEiEQIV+NZjmZI5M03
+M2x8R85HIdkfQKEDL6Hys7yQlNmyh0FEej+KrTVxbK8tBfcih+7WN98T9Ejkm7f
pkKPEuCyVAe7Pg72wsGAMzo0BNWNLS214010TmT+Qntm7gZMHBRd43DOm1xsmqtc
zN1JTozYM5zmFvqrC8q0VpvqzvKN2nXZPHEKmrir9qbL6TFBdLNCRli5Rdith0tO
xJN0nuL/HFdi9y/DCn0lT2KgyNrMEOimCZXDSdxmyNXGWRIEcpmx11D8llYD+XK9
e93M9XRQBKgq52M0i2neOf8nbXdSkDvpEWP4FNafSPqTk9ymW2qh1IGiAUR4HSJJ
OUQy70Bjp4S/whj3C33bgeP9TDADKVl2mU8rHM6hKUn8ScuRQk3kuad1NXDy+2vQ
QxTKw8KFkGXElVvEbcLNNbr78ZbCgintsrnMESKdxWIdeRpEjH3lcgmSpDECpSTY
ae0R5BOGlzdSvBlXBuP16HRD2StzwoSsmV55HjaE21hwpQx8MbL9QPSKZ7IepcL9
Riw5NNJAyQXVFdxgQJ0YvCTzp5nBuwT1rbCficJTwu8cf/mzhFQ=
=tsA+
-----END PGP SIGNATURE-----

--Sig_/vjiBFcUhZgAqEddVD/mXzMG--
