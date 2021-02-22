Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725163212D6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 10:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF476E91D;
	Mon, 22 Feb 2021 09:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4E76E91C;
 Mon, 22 Feb 2021 09:12:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0DFEAD6B;
 Mon, 22 Feb 2021 09:12:55 +0000 (UTC)
Subject: Re: [PATCH v3 06/11] drm: Use state helper instead of plane state
 pointer in atomic_check
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-6-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e6e8191d-08d9-7144-bb1a-ddaa6c21eccb@suse.de>
Date: Mon, 22 Feb 2021 10:12:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219120032.260676-6-maxime@cerno.tech>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 linux-mips@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2080325438=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2080325438==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bA4SvHs6ElR5ovhly3dcssOpYX97W9uHZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bA4SvHs6ElR5ovhly3dcssOpYX97W9uHZ
Content-Type: multipart/mixed; boundary="T21ZT6yBrcVRcvT4wXPsDlU1t0XHXxb84";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Message-ID: <e6e8191d-08d9-7144-bb1a-ddaa6c21eccb@suse.de>
Subject: Re: [PATCH v3 06/11] drm: Use state helper instead of plane state
 pointer in atomic_check
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-6-maxime@cerno.tech>
In-Reply-To: <20210219120032.260676-6-maxime@cerno.tech>

--T21ZT6yBrcVRcvT4wXPsDlU1t0XHXxb84
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 19.02.21 um 13:00 schrieb Maxime Ripard:
> Many drivers reference the plane->state pointer in order to get the
> current plane state in their atomic_check hook, which would be the old
> plane state in the global atomic state since _swap_state hasn't happene=
d
> when atomic_check is run.
>=20
> Use the drm_atomic_get_old_plane_state helper to get that state to make=

> it more obvious.
>=20
> This was made using the coccinelle script below:
>=20
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
>=20
> static struct drm_plane_helper_funcs helpers =3D {
> 	...,
> 	.atomic_check =3D func,
> 	...,
> };
>=20
> @ replaces_old_state @
> identifier plane_atomic_func.func;
> identifier plane, state, plane_state;
> @@
>=20
>   func(struct drm_plane *plane, struct drm_atomic_state *state) {
>   	...
> -	struct drm_plane_state *plane_state =3D plane->state;
> +	struct drm_plane_state *plane_state =3D drm_atomic_get_old_plane_stat=
e(state, plane);
>   	...
>   }
>=20
> @@
> identifier plane_atomic_func.func;
> identifier plane, state, plane_state;
> @@
>=20
>   func(struct drm_plane *plane, struct drm_atomic_state *state) {
>   	struct drm_plane_state *plane_state =3D drm_atomic_get_old_plane_sta=
te(state, plane);
>   	<...
> -	plane->state
> +	plane_state
>   	...>
>   }
>=20
> @ adds_old_state @
> identifier plane_atomic_func.func;
> identifier plane, state;
> @@
>=20
>   func(struct drm_plane *plane, struct drm_atomic_state *state) {
> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_=
state(state, plane);
>   	<...
> -	plane->state
> +	old_plane_state
>   	...>
>   }
>=20
> @ include depends on adds_old_state || replaces_old_state @
> @@
>=20
>   #include <drm/drm_atomic.h>
>=20
> @ no_include depends on !include && (adds_old_state || replaces_old_sta=
te) @
> @@
>=20
> + #include <drm/drm_atomic.h>
>    #include <drm/...>
>=20
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

However, I find 'old plane state' somewhat confusing in this context,=20
because it's actually the current plane state. Would it make sense to=20
use drm_atomic_get_existing_plane_state() instead?

Best regards
Thomas

>=20
> ---
>=20
> Changes from v2:
>    - s/.../<.../ in the coccinelle script as suggested by Ville
> ---
>   drivers/gpu/drm/imx/ipuv3-plane.c          |  3 ++-
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c  | 16 +++++++++-------
>   drivers/gpu/drm/ingenic/ingenic-ipu.c      |  8 +++++---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c |  4 +++-
>   drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  3 ++-
>   5 files changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> index b5f6123850bb..6484592e3f86 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -341,7 +341,8 @@ static int ipu_plane_atomic_check(struct drm_plane =
*plane,
>   {
>   	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state=
(state,
>   									   plane);
> -	struct drm_plane_state *old_state =3D plane->state;
> +	struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_state(=
state,
> +									   plane);
>   	struct drm_crtc_state *crtc_state;
>   	struct device *dev =3D plane->dev->dev;
>   	struct drm_framebuffer *fb =3D new_state->fb;
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> index e6d7d0a04ddb..c022d9f1e737 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -361,11 +361,13 @@ static void ingenic_drm_crtc_atomic_flush(struct =
drm_crtc *crtc,
>   static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>   					  struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_=
state(state,
> +										 plane);
>   	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane=
_state(state,
>   										 plane);
>   	struct ingenic_drm *priv =3D drm_device_get_priv(plane->dev);
>   	struct drm_crtc_state *crtc_state;
> -	struct drm_crtc *crtc =3D new_plane_state->crtc ?: plane->state->crtc=
;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc ?: old_plane_state->c=
rtc;
>   	int ret;
>  =20
>   	if (!crtc)
> @@ -399,12 +401,12 @@ static int ingenic_drm_plane_atomic_check(struct =
drm_plane *plane,
>   	 * its position, size or depth.
>   	 */
>   	if (priv->soc_info->has_osd &&
> -	    (!plane->state->fb || !new_plane_state->fb ||
> -	     plane->state->crtc_x !=3D new_plane_state->crtc_x ||
> -	     plane->state->crtc_y !=3D new_plane_state->crtc_y ||
> -	     plane->state->crtc_w !=3D new_plane_state->crtc_w ||
> -	     plane->state->crtc_h !=3D new_plane_state->crtc_h ||
> -	     plane->state->fb->format->format !=3D new_plane_state->fb->forma=
t->format))
> +	    (!old_plane_state->fb || !new_plane_state->fb ||
> +	     old_plane_state->crtc_x !=3D new_plane_state->crtc_x ||
> +	     old_plane_state->crtc_y !=3D new_plane_state->crtc_y ||
> +	     old_plane_state->crtc_w !=3D new_plane_state->crtc_w ||
> +	     old_plane_state->crtc_h !=3D new_plane_state->crtc_h ||
> +	     old_plane_state->fb->format->format !=3D new_plane_state->fb->fo=
rmat->format))
>   		crtc_state->mode_changed =3D true;
>  =20
>   	return 0;
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/in=
genic/ingenic-ipu.c
> index 1e1b0fe095bd..3d072b25e1c4 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -516,11 +516,13 @@ static void ingenic_ipu_plane_atomic_update(struc=
t drm_plane *plane,
>   static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>   					  struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_=
state(state,
> +										 plane);
>   	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane=
_state(state,
>   										 plane);
>   	unsigned int num_w, denom_w, num_h, denom_h, xres, yres, max_w, max_=
h;
>   	struct ingenic_ipu *ipu =3D plane_to_ingenic_ipu(plane);
> -	struct drm_crtc *crtc =3D new_plane_state->crtc ?: plane->state->crtc=
;
> +	struct drm_crtc *crtc =3D new_plane_state->crtc ?: old_plane_state->c=
rtc;
>   	struct drm_crtc_state *crtc_state;
>  =20
>   	if (!crtc)
> @@ -531,7 +533,7 @@ static int ingenic_ipu_plane_atomic_check(struct dr=
m_plane *plane,
>   		return -EINVAL;
>  =20
>   	/* Request a full modeset if we are enabling or disabling the IPU. *=
/
> -	if (!plane->state->crtc ^ !new_plane_state->crtc)
> +	if (!old_plane_state->crtc ^ !new_plane_state->crtc)
>   		crtc_state->mode_changed =3D true;
>  =20
>   	if (!new_plane_state->crtc ||
> @@ -552,7 +554,7 @@ static int ingenic_ipu_plane_atomic_check(struct dr=
m_plane *plane,
>   	if (((new_plane_state->src_w >> 16) & 1) || (new_plane_state->crtc_w=
 & 1))
>   		return -EINVAL;
>  =20
> -	if (!osd_changed(new_plane_state, plane->state))
> +	if (!osd_changed(new_plane_state, old_plane_state))
>   		return 0;
>  =20
>   	crtc_state->mode_changed =3D true;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/d=
rm/msm/disp/mdp5/mdp5_plane.c
> index 4aac6217a5ad..6ce6ce09fecc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -406,12 +406,14 @@ static int mdp5_plane_atomic_check_with_state(str=
uct drm_crtc_state *crtc_state,
>   static int mdp5_plane_atomic_check(struct drm_plane *plane,
>   				   struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_=
state(state,
> +										 plane);
>   	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane=
_state(state,
>   										 plane);
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *crtc_state;
>  =20
> -	crtc =3D new_plane_state->crtc ? new_plane_state->crtc : plane->state=
->crtc;
> +	crtc =3D new_plane_state->crtc ? new_plane_state->crtc : old_plane_st=
ate->crtc;
>   	if (!crtc)
>   		return 0;
>  =20
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_plane.c
> index ebdd42dcaf82..c86258132432 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> @@ -26,7 +26,8 @@ static int tilcdc_plane_atomic_check(struct drm_plane=
 *plane,
>   	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state=
(state,
>   									   plane);
>   	struct drm_crtc_state *crtc_state;
> -	struct drm_plane_state *old_state =3D plane->state;
> +	struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_state(=
state,
> +									   plane);
>   	unsigned int pitch;
>  =20
>   	if (!new_state->crtc)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--T21ZT6yBrcVRcvT4wXPsDlU1t0XHXxb84--

--bA4SvHs6ElR5ovhly3dcssOpYX97W9uHZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAzdZIFAwAAAAAACgkQlh/E3EQov+Bt
3RAAuzu2QHRjNFDr4YQycCsXHtjg+DRC0mXzgKji6uZ2SI9+V0lohPR7dPKiHnxNa31Ubl64UItO
BiLZzhjWa7VDJ51FEs7AdLjK0cKoG9LxtpNwxE4JwZzaX0GvTHN3R50nZCvSMFbNRfB3iVIwHJOA
x9+SprTyBISsO8xTQVho2WMrDs7Nt0dTZBnrOIqBOnvhKcCx85T0VPgxzhIt7fB0O0xp8Bzb9wwT
56HOPcrsL8ef40bEtnvr5+VrY4dkUV57kshq28scPAimL2hZF+JyncOxlmi9viuM4z63iB5lCJRA
8RqttH1sQUxtzL5UhqTPkvQPcCpsl2czblAdyPlHYm5Sns3oL+n9mnG3l0GwEFlW/QYHFKhEXM+t
rgleR1VspJon8k7mipoD4/b/me5AFhgpPEYHk8/iO5h+i45ChBaTbUk7BL+wSuSFRUMayAZvG+tx
9d22LMMPIhiKK1WhDaVFetLvyIPzrh4sAa6WBAIoMFqo24jqHNxGddojGxGwN+BfYufOfyvF3kv7
cRtjTOgmDSqSqsHvD114bf+t96jBjkmF2SghKNb0Yc/bkdqkLANhO6H2BLEp6QNzBhtfEzyLKvAb
ZwuxN+q4I0CNUhmha5inPZ514kJoovXIzXfvxlOY7p+RgF/ETY6waru/KKzgQ3bgHqiV4hyZskXl
8TQ=
=wrum
-----END PGP SIGNATURE-----

--bA4SvHs6ElR5ovhly3dcssOpYX97W9uHZ--

--===============2080325438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2080325438==--
