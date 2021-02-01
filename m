Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECEF30AA05
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A9B6E7D3;
	Mon,  1 Feb 2021 14:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841BD6E7D3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:41:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B829AC45;
 Mon,  1 Feb 2021 14:41:20 +0000 (UTC)
Subject: Re: [PATCH 4/6] drm/gma500: Unify crtc helpers
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-4-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <36f5e5c7-1eaa-ddf2-470f-f263e251ac6f@suse.de>
Date: Mon, 1 Feb 2021 15:41:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201132617.1233-4-patrik.r.jakobsson@gmail.com>
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
Cc: airlied@linux.ie
Content-Type: multipart/mixed; boundary="===============0589335328=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0589335328==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z4gbLPM2FYVjHUR3ElcvrBAWChaLKiVRn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z4gbLPM2FYVjHUR3ElcvrBAWChaLKiVRn
Content-Type: multipart/mixed; boundary="ou0ZkJEAE60d53A18uHSAttXG1vx1oOs7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie
Message-ID: <36f5e5c7-1eaa-ddf2-470f-f263e251ac6f@suse.de>
Subject: Re: [PATCH 4/6] drm/gma500: Unify crtc helpers
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-4-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20210201132617.1233-4-patrik.r.jakobsson@gmail.com>

--ou0ZkJEAE60d53A18uHSAttXG1vx1oOs7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 01.02.21 um 14:26 schrieb Patrik Jakobsson:
> CDV crtc helpers are identical to other chips so use gma_ prefix for th=
e
> crtc helper struct and remove the CDV copy.
>=20
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/gma500/cdv_device.c        |  2 +-
>   drivers/gpu/drm/gma500/cdv_device.h        |  1 -
>   drivers/gpu/drm/gma500/cdv_intel_display.c | 12 ------------
>   drivers/gpu/drm/gma500/oaktrail_device.c   |  2 +-
>   drivers/gpu/drm/gma500/psb_device.c        |  2 +-
>   drivers/gpu/drm/gma500/psb_drv.h           |  2 +-
>   drivers/gpu/drm/gma500/psb_intel_display.c |  2 +-
>   7 files changed, 5 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma5=
00/cdv_device.c
> index 19e055dbd4c2..1342e7fb382f 100644
> --- a/drivers/gpu/drm/gma500/cdv_device.c
> +++ b/drivers/gpu/drm/gma500/cdv_device.c
> @@ -603,7 +603,7 @@ const struct psb_ops cdv_chip_ops =3D {
>   	.errata =3D cdv_errata,
>  =20
>   	.crtc_helper =3D &cdv_intel_helper_funcs,
> -	.crtc_funcs =3D &cdv_intel_crtc_funcs,
> +	.crtc_funcs =3D &gma_intel_crtc_funcs,
>   	.clock_funcs =3D &cdv_clock_funcs,
>  =20
>   	.output_init =3D cdv_output_init,
> diff --git a/drivers/gpu/drm/gma500/cdv_device.h b/drivers/gpu/drm/gma5=
00/cdv_device.h
> index 37e4bdc84c03..504d717385cd 100644
> --- a/drivers/gpu/drm/gma500/cdv_device.h
> +++ b/drivers/gpu/drm/gma500/cdv_device.h
> @@ -8,7 +8,6 @@ struct drm_device;
>   struct psb_intel_mode_device;
>  =20
>   extern const struct drm_crtc_helper_funcs cdv_intel_helper_funcs;
> -extern const struct drm_crtc_funcs cdv_intel_crtc_funcs;
>   extern const struct gma_clock_funcs cdv_clock_funcs;
>   extern void cdv_intel_crt_init(struct drm_device *dev,
>   			struct psb_intel_mode_device *mode_dev);
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/d=
rm/gma500/cdv_intel_display.c
> index aac776fab36d..c3a9f6b3c848 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_display.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
> @@ -961,18 +961,6 @@ const struct drm_crtc_helper_funcs cdv_intel_helpe=
r_funcs =3D {
>   	.disable =3D gma_crtc_disable,
>   };
>  =20
> -const struct drm_crtc_funcs cdv_intel_crtc_funcs =3D {
> -	.cursor_set =3D gma_crtc_cursor_set,
> -	.cursor_move =3D gma_crtc_cursor_move,
> -	.gamma_set =3D gma_crtc_gamma_set,
> -	.set_config =3D gma_crtc_set_config,
> -	.destroy =3D gma_crtc_destroy,
> -	.page_flip =3D gma_crtc_page_flip,
> -	.enable_vblank =3D psb_enable_vblank,
> -	.disable_vblank =3D psb_disable_vblank,
> -	.get_vblank_counter =3D psb_get_vblank_counter,
> -};
> -
>   const struct gma_clock_funcs cdv_clock_funcs =3D {
>   	.clock =3D cdv_intel_clock,
>   	.limit =3D cdv_intel_limit,
> diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm=
/gma500/oaktrail_device.c
> index 08cd5f73c868..9650588c7223 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_device.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_device.c
> @@ -548,7 +548,7 @@ const struct psb_ops oaktrail_chip_ops =3D {
>   	.chip_setup =3D oaktrail_chip_setup,
>   	.chip_teardown =3D oaktrail_teardown,
>   	.crtc_helper =3D &oaktrail_helper_funcs,
> -	.crtc_funcs =3D &psb_intel_crtc_funcs,
> +	.crtc_funcs =3D &gma_intel_crtc_funcs,
>  =20
>   	.output_init =3D oaktrail_output_init,
>  =20
> diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma5=
00/psb_device.c
> index 2d21f8ec595f..951725a0f7a3 100644
> --- a/drivers/gpu/drm/gma500/psb_device.c
> +++ b/drivers/gpu/drm/gma500/psb_device.c
> @@ -329,7 +329,7 @@ const struct psb_ops psb_chip_ops =3D {
>   	.chip_teardown =3D psb_chip_teardown,
>  =20
>   	.crtc_helper =3D &psb_intel_helper_funcs,
> -	.crtc_funcs =3D &psb_intel_crtc_funcs,
> +	.crtc_funcs =3D &gma_intel_crtc_funcs,
>   	.clock_funcs =3D &psb_clock_funcs,
>  =20
>   	.output_init =3D psb_output_init,
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/=
psb_drv.h
> index d4f14a5d509b..697f64e0f2f4 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -672,7 +672,7 @@ extern void oaktrail_lvds_init(struct drm_device *d=
ev,
>  =20
>   /* psb_intel_display.c */
>   extern const struct drm_crtc_helper_funcs psb_intel_helper_funcs;
> -extern const struct drm_crtc_funcs psb_intel_crtc_funcs;
> +extern const struct drm_crtc_funcs gma_intel_crtc_funcs;
>  =20
>   /* psb_intel_lvds.c */
>   extern const struct drm_connector_helper_funcs
> diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/d=
rm/gma500/psb_intel_display.c
> index 9c3cb1b80bbd..359606429316 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> @@ -426,7 +426,7 @@ const struct drm_crtc_helper_funcs psb_intel_helper=
_funcs =3D {
>   	.disable =3D gma_crtc_disable,
>   };
>  =20
> -const struct drm_crtc_funcs psb_intel_crtc_funcs =3D {
> +const struct drm_crtc_funcs gma_intel_crtc_funcs =3D {
>   	.cursor_set =3D gma_crtc_cursor_set,
>   	.cursor_move =3D gma_crtc_cursor_move,
>   	.gamma_set =3D gma_crtc_gamma_set,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ou0ZkJEAE60d53A18uHSAttXG1vx1oOs7--

--z4gbLPM2FYVjHUR3ElcvrBAWChaLKiVRn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAYEw8FAwAAAAAACgkQlh/E3EQov+Ab
ew/+JBRwEF6pNDdKNxq6AZBpt5pEmD6Wim9A0ihIYNySaBqET14dVB76SLYEYZEahFUYrlW++Tm2
aXJRgI5JWUXpbLAu4KJEyT6zfxZ+5lvbrl4kcKawI82GkprNAfypKxbZz9LSEs9hcqNGYA13O7LC
wR3WBBIUwB7IjYD8h2aAGfvt+lA5HsF6tFhy8tXIS7ZOTnoyxzEZBih/NBkl032jHdWKAt1pcGpM
3NEmbKFM8VbU5g8JLSRnL6r9mR10gcxF8ognB0ZVXxN9edHMKQTCqjpdPB3phQKStmRYfPraQ3ys
husf4ooxRM9j1YaEPPpzGDFF2+7L4oG9tb/rk8uWp1L1KOA4DxfOIIi48VdvdO4Uuffa3FDoDKzw
ZqMeh7/xn5hIXiYI/l5OTYutug9iOPdwd5a+euvES0FwGxPnVQkt4tbutQxAdOfjLMr79pc0dPvU
d0iMYMNGM5nQHd67Fifi9AUY+rMETh5QTDTpsuDXCBFKBogIDgB1PR7+Pkfp57/h1aSqXG9V/mDO
KLeACTu/0skZ3syV1WrHKWKRF94sXNgGP3gT8+xPdTTZiEqzrSnVybzjvAfuBA2DqyVFjEKXgoAY
AstsP2RbBoa81AQQmXrotXqz3iisHqXUKT0dnOMdETNHIxIBgxiaj2zI4IwoR9pD+0kSnTj3vOPK
x/0=
=JIXy
-----END PGP SIGNATURE-----

--z4gbLPM2FYVjHUR3ElcvrBAWChaLKiVRn--

--===============0589335328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0589335328==--
