Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB252E9487
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 13:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF16589E98;
	Mon,  4 Jan 2021 12:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7170D89E98
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 12:06:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05641AD1E;
 Mon,  4 Jan 2021 12:06:27 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Use simple encoder
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1609140936-57002-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b17c2bfc-44b1-991c-9d85-0d4b76e44409@suse.de>
Date: Mon, 4 Jan 2021 13:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1609140936-57002-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1371688817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1371688817==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RcKsmR2MQPtOUTxZ5J5DRotL5LML8QcO4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RcKsmR2MQPtOUTxZ5J5DRotL5LML8QcO4
Content-Type: multipart/mixed; boundary="ZU0tHU16DKjjR6xEEjtT14n4ZpFECqYz0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <b17c2bfc-44b1-991c-9d85-0d4b76e44409@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Use simple encoder
References: <1609140936-57002-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1609140936-57002-1-git-send-email-tiantao6@hisilicon.com>

--ZU0tHU16DKjjR6xEEjtT14n4ZpFECqYz0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.12.20 um 08:35 schrieb Tian Tao:
> The hibmc driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the patch.

> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index d35548d..c76f996 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -14,6 +14,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
>  =20
>   #include "hibmc_drm_drv.h"
>   #include "hibmc_drm_regs.h"
> @@ -90,10 +91,6 @@ static const struct drm_encoder_helper_funcs hibmc_e=
ncoder_helper_funcs =3D {
>   	.mode_set =3D hibmc_encoder_mode_set,
>   };
>  =20
> -static const struct drm_encoder_funcs hibmc_encoder_funcs =3D {
> -	.destroy =3D drm_encoder_cleanup,
> -};
> -
>   int hibmc_vdac_init(struct hibmc_drm_private *priv)
>   {
>   	struct drm_device *dev =3D &priv->dev;
> @@ -109,8 +106,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)=

>   	}
>  =20
>   	encoder->possible_crtcs =3D 0x1;
> -	ret =3D drm_encoder_init(dev, encoder, &hibmc_encoder_funcs,
> -			       DRM_MODE_ENCODER_DAC, NULL);
> +	ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
>   	if (ret) {
>   		drm_err(dev, "failed to init encoder: %d\n", ret);
>   		return ret;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZU0tHU16DKjjR6xEEjtT14n4ZpFECqYz0--

--RcKsmR2MQPtOUTxZ5J5DRotL5LML8QcO4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/zBMEFAwAAAAAACgkQlh/E3EQov+BM
8Q//cEaWhEx6bGrzmsVKIYruBlRbIrGdvVXOQtREZ085r7ayn8EOL0pqiMMKAopGuEpv0jnYYoFG
PKqq2z3acJ1+fC/ws21CpS4mz79r7g/LVW58cK4uoZ30uSTTXGHSz5MNI00aqBcO442DeiqFa4SE
wJ40qJ/q6s//ZsNq0VnsT9qMHGJoUeUhRwH4HzjfoPn138U5lJWSO9CO31JxcDpNk5dUEKFq3Gsy
3VoGo2AphKfVNp5ZRF0NDhmMzpsJ4AYnDUdUDLaL/KLUnmycrjLcBQcYF8AbI16Vr2y4GA5E7FzO
++aHDsi0Sam0FxSKdrTPTMbQ4f4CcBM04R+FZ1iZXO4gt5I/Tf7D0lqgFAsvMvZsbjgdESt1GnnH
bE7Gx6KgsmHcJge8JICzBXV9okUvUDh8soWYrMjBxFWSaquMoTlQs4/4BTV+9Ixx+Fo/SUXG5WmJ
A+uliMKNtFh0misYsPqJd2eVAECNN2KOxZ3WmJzmbxN0IZU/z5lXOhyBT7zdezyWh2Wqd4ZsRsdm
AOgt6zfTkiEgUDLKlayCiiEIvXRELRPDyotwS70+FEGGT0/V80J71hIF2MgsWux7t7kT2eCUAbch
mfbTXHYROGRGSZhpnaKMOvzb0OIIurosvYOXA1IClOyqIttbP0VyDLRpLtfpOlLbLzTzZ81JMFLO
iZA=
=v8Wn
-----END PGP SIGNATURE-----

--RcKsmR2MQPtOUTxZ5J5DRotL5LML8QcO4--

--===============1371688817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1371688817==--
