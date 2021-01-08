Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD32EEE5B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDDF6E7D3;
	Fri,  8 Jan 2021 08:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D55A6E7D3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 08:12:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 310C2ACC6;
 Fri,  8 Jan 2021 08:12:41 +0000 (UTC)
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
References: <1610092442-36168-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RFC] drm/connector: Set the default callback function for
 drm_connector_funcs
Message-ID: <d8e3cdca-79dd-2c41-27c1-b09a45670976@suse.de>
Date: Fri, 8 Jan 2021 09:12:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610092442-36168-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0509168649=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0509168649==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6VJbQPpcY8R02NQpPfdsz9s1a5A9w8mZU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6VJbQPpcY8R02NQpPfdsz9s1a5A9w8mZU
Content-Type: multipart/mixed; boundary="CRo5JMU5ICjFqaPtrGtmkIXLOHcL5C2Rq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
Message-ID: <d8e3cdca-79dd-2c41-27c1-b09a45670976@suse.de>
Subject: Re: [RFC] drm/connector: Set the default callback function for
 drm_connector_funcs
References: <1610092442-36168-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1610092442-36168-1-git-send-email-tiantao6@hisilicon.com>

--CRo5JMU5ICjFqaPtrGtmkIXLOHcL5C2Rq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.01.21 um 08:54 schrieb Tian Tao:
> The member functions of drm_connector_funcs are not specific to each
> manufacturer's driver, so drm_connector_funcs is allowed to use default=

> values, which prevents all drivers from setting the same member
> functions for drm_connector_funcs.

I don't think that's a good idea.

>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>   drivers/gpu/drm/drm_connector.c                  | 7 ++++++-
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 1 -
>   include/drm/drm_connector.h                      | 2 +-
>   3 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> index 98b6ec4..356d8a3 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -25,6 +25,7 @@
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_utils.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_sysfs.h>
> @@ -216,7 +217,7 @@ void drm_connector_free_work_fn(struct work_struct =
*work)
>    */
>   int drm_connector_init(struct drm_device *dev,
>   		       struct drm_connector *connector,
> -		       const struct drm_connector_funcs *funcs,
> +		       struct drm_connector_funcs *funcs,

Drivers cannot legally declare the funcs instance as static const.=20
Having static const allows for write protected pages.

>   		       int connector_type)
>   {
>   	struct drm_mode_config *config =3D &dev->mode_config;
> @@ -228,6 +229,10 @@ int drm_connector_init(struct drm_device *dev,
>   		(!funcs->atomic_destroy_state ||
>   		 !funcs->atomic_duplicate_state));
>  =20
> +	if (!funcs->fill_modes)
> +		funcs->fill_modes =3D &drm_helper_probe_single_connector_modes;

It's not clear that this is really the correct function for this driver.

Best regards
Thomas

> +
> +
>   	ret =3D __drm_mode_object_add(dev, &connector->base,
>   				    DRM_MODE_OBJECT_CONNECTOR,
>   				    false, drm_connector_free);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index c76f996..7d3b662 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -64,7 +64,6 @@ static const struct drm_connector_helper_funcs
>   };
>  =20
>   static const struct drm_connector_funcs hibmc_connector_funcs =3D {
> -	.fill_modes =3D drm_helper_probe_single_connector_modes,
>   	.destroy =3D hibmc_connector_destroy,
>   	.reset =3D drm_atomic_helper_connector_reset,
>   	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_st=
ate,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1922b27..4810583 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1561,7 +1561,7 @@ struct drm_connector {
>  =20
>   int drm_connector_init(struct drm_device *dev,
>   		       struct drm_connector *connector,
> -		       const struct drm_connector_funcs *funcs,
> +		       struct drm_connector_funcs *funcs,
>   		       int connector_type);
>   int drm_connector_init_with_ddc(struct drm_device *dev,
>   				struct drm_connector *connector,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CRo5JMU5ICjFqaPtrGtmkIXLOHcL5C2Rq--

--6VJbQPpcY8R02NQpPfdsz9s1a5A9w8mZU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/4E/cFAwAAAAAACgkQlh/E3EQov+AR
mRAAo9w/OzX21yhZgtv7T9UHWXXKfAg6hPu8YGq/H/VcesYvJYNa6oL+Z4zk46vTM90zTLWFCtRl
GNaQgaRMHKzi1O0xfI9ItmrwdHOUqmOejs7QtpaA51K4TPa1phyr0N/1WPinXTEzG1srFN7ZKljV
C2E3AZWGWiSbFuCZh6eOK1h9i8duptwSQ+fJFg3nzrNtu4wKNJgYAHcAsI0chZfJ5Rv6R8Yff7VV
oh2Fz1SjIJusXirTk46mAoZplpVGKjuUqOxFZAJlWY5AZi9ePL7ECUAzdkmMdtqWtxF12Cm3leuY
Og91hD3UXwWkvH4G+KVouOqHPrqB34wsvvBMcfE3YocW8iaD4rrFEdQOoeHUWo41zFqlGoFU5dxC
uKmESFbN7BC/djVspeLSW2LIJZJgOObC7BAbCSFWd0U3gCSHzMbytLIbNvfZ18iNFru2dFwCCAo8
lVJXhAOG958ksAY6JwZw55rdKSM3RoEN0BuCA6oXUpEZGIQXGwvo+pji6rQT+9od6V02Dtziin9X
CzSjZ+kpRCseUJcVYtcz8+CqUyTvPyAzQvOTFCXJJ3Xj9juDQu2m1FRBCkxhH7edH/n2FYgKqQNW
VTa+qzEcy1efqQYbKZl9x4FN52zdbhnxgv1N51ic+B4t4rSud5gpDCByaSQzUzVsYE0zL3soPPts
uYc=
=wKIf
-----END PGP SIGNATURE-----

--6VJbQPpcY8R02NQpPfdsz9s1a5A9w8mZU--

--===============0509168649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0509168649==--
