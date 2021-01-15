Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4AB2F7CB8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 14:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F4C6E408;
	Fri, 15 Jan 2021 13:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0796E408;
 Fri, 15 Jan 2021 13:34:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BA22AC8F;
 Fri, 15 Jan 2021 13:34:11 +0000 (UTC)
Subject: Re: [PATCH 01/10] drm/atomic: Pass the full state to planes async
 atomic check and update
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20210115125703.1315064-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <22d7f493-eb5f-22b3-a232-867b31a50559@suse.de>
Date: Fri, 15 Jan 2021 14:34:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115125703.1315064-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1917013177=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1917013177==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bxF4bx0Z4FsrJm9ZlyjCENABg7VfzCxqU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bxF4bx0Z4FsrJm9ZlyjCENABg7VfzCxqU
Content-Type: multipart/mixed; boundary="iMJyl0HU3uEFZbtC4DSVZw9PwcP85TNwO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Eric Anholt <eric@anholt.net>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Message-ID: <22d7f493-eb5f-22b3-a232-867b31a50559@suse.de>
Subject: Re: [PATCH 01/10] drm/atomic: Pass the full state to planes async
 atomic check and update
References: <20210115125703.1315064-1-maxime@cerno.tech>
In-Reply-To: <20210115125703.1315064-1-maxime@cerno.tech>

--iMJyl0HU3uEFZbtC4DSVZw9PwcP85TNwO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.01.21 um 13:56 schrieb Maxime Ripard:
> The current atomic helpers have either their object state being passed =
as
> an argument or the full atomic state.
>=20
> The former is the pattern that was done at first, before switching to t=
he
> latter for new hooks or when it was needed.
>=20
> Let's start convert all the remaining helpers to provide a consistent
> interface, starting with the planes atomic_async_check and
> atomic_async_update.
>=20
> The conversion was done using the coccinelle script below, built tested=
 on
> all the drivers.
>=20
> @@
> identifier plane, plane_state;
> symbol state;
> @@
>=20
>   struct drm_plane_helper_funcs {
>   	...
> 	int (*atomic_async_check)(struct drm_plane *plane,
> -				  struct drm_plane_state *plane_state);
> +				  struct drm_atomic_state *state);
> 	...
>   }
>=20
> @@
> identifier plane, plane_state;
> symbol state;
> @@
>   struct drm_plane_helper_funcs {
>   	...
> 	void (*atomic_async_update)(struct drm_plane *plane,
> -				    struct drm_plane_state *plane_state);
> +				    struct drm_atomic_state *state);
> 	...
>   }
>=20
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
>=20
> (
>   static const struct drm_plane_helper_funcs helpers =3D {
> 	...,
>   	.atomic_async_check =3D func,
> 	...,
>   };
> |
>   static const struct drm_plane_helper_funcs helpers =3D {
>   	...,
>   	.atomic_async_update =3D func,
>   	...,
>   };
> )
>=20
> @@
> struct drm_plane_helper_funcs *FUNCS;
> identifier f;
> identifier dev;
> identifier plane, plane_state, state;
> @@
>=20
>   f(struct drm_device *dev, struct drm_atomic_state *state)
>   {
>   	<+...
> -	FUNCS->atomic_async_check(plane, plane_state)
> +	FUNCS->atomic_async_check(plane, state)
>   	...+>
>   }
>=20
> @@
> struct drm_plane_helper_funcs *FUNCS;
> identifier f;
> identifier dev;
> identifier plane, plane_state, state;
> @@
>=20
>   f(struct drm_device *dev, struct drm_atomic_state *state)
>   {
>   	<+...
> -	FUNCS->atomic_async_update(plane, plane_state)
> +	FUNCS->atomic_async_update(plane, state)
>   	...+>
>   }
>=20
> @@
> identifier mtk_plane_atomic_async_update;
> identifier plane;
> symbol new_state, state;
> expression e;
> @@
>=20
>    void mtk_plane_atomic_async_update(struct drm_plane *plane, struct d=
rm_plane_state *new_state)
> {
>    ...
> - struct mtk_plane_state *state =3D e;
> + struct mtk_plane_state *new_plane_state =3D e;
>    <+...
> -       state
> +       new_plane_state
>    ...+>
>    }
>=20
> @@
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
>=20
>   func(struct drm_plane *plane,
> -    struct drm_plane_state *state)
> +    struct drm_plane_state *new_plane_state)
>   {
> 	<...
> -	state
> +	new_plane_state
> 	...>
>   }
>=20
> @ ignores_new_state @
> identifier plane_atomic_func.func;
> identifier plane, new_plane_state;
> @@
>=20
>   func(struct drm_plane *plane, struct drm_plane_state *new_plane_state=
)
>   {
> 	... when !=3D new_plane_state
>   }
>=20
> @ adds_new_state depends on plane_atomic_func && !ignores_new_state @
> identifier plane_atomic_func.func;
> identifier plane, new_plane_state;
> @@
>=20
>   func(struct drm_plane *plane, struct drm_plane_state *new_plane_state=
)
>   {
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_=
state(state, plane);
>   	...
>   }
>=20
> @ depends on plane_atomic_func @
> identifier plane_atomic_func.func;
> identifier plane, plane_state;
> @@
>=20
>   func(struct drm_plane *plane,
> -     struct drm_plane_state *plane_state
> +     struct drm_atomic_state *state
>       )
>   { ... }
>=20
> @ include depends on adds_new_state @
> @@
>=20
>   #include <drm/drm_atomic.h>
>=20
> @ no_include depends on !include && adds_new_state @
> @@
>=20
> + #include <drm/drm_atomic.h>
>    #include <drm/...>
>=20
> @@
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier plane_state;
> @@
>=20
>   func(struct drm_plane *plane, struct drm_atomic_state *state) {
>          ...
>          struct drm_plane_state *plane_state =3D drm_atomic_get_new_pla=
ne_state(state, plane);
>          <+...
> -       plane_state->state
> +       state
>          ...+>
>   }
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++-
>   drivers/gpu/drm/drm_atomic_helper.c           |  4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c      | 26 +++++----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 33 ++++++-----
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 16 ++++--
>   drivers/gpu/drm/vc4/vc4_plane.c               | 56 ++++++++++--------=
-
>   include/drm/drm_modeset_helper_vtables.h      | 14 ++---
>   7 files changed, 87 insertions(+), 70 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5675c1f9368a..476bf2e6a4f4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6475,7 +6475,7 @@ static int dm_plane_atomic_check(struct drm_plane=
 *plane,
>   }
>  =20
>   static int dm_plane_atomic_async_check(struct drm_plane *plane,
> -				       struct drm_plane_state *new_plane_state)
> +				       struct drm_atomic_state *state)
>   {
>   	/* Only support async updates on cursor planes. */
>   	if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> @@ -6485,10 +6485,12 @@ static int dm_plane_atomic_async_check(struct d=
rm_plane *plane,
>   }
>  =20
>   static void dm_plane_atomic_async_update(struct drm_plane *plane,
> -					 struct drm_plane_state *new_state)
> +					 struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state,
> +									   plane);
>   	struct drm_plane_state *old_state =3D
> -		drm_atomic_get_old_plane_state(new_state->state, plane);
> +		drm_atomic_get_old_plane_state(state, plane);
>  =20
>   	trace_amdgpu_dm_atomic_update_cursor(new_state);
>  =20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> index a84dc427cf82..f9488fd25b1d 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1742,7 +1742,7 @@ int drm_atomic_helper_async_check(struct drm_devi=
ce *dev,
>   		return -EBUSY;
>   	}
>  =20
> -	return funcs->atomic_async_check(plane, new_plane_state);
> +	return funcs->atomic_async_check(plane, state);
>   }
>   EXPORT_SYMBOL(drm_atomic_helper_async_check);
>  =20
> @@ -1772,7 +1772,7 @@ void drm_atomic_helper_async_commit(struct drm_de=
vice *dev,
>   		struct drm_framebuffer *old_fb =3D plane->state->fb;
>  =20
>   		funcs =3D plane->helper_private;
> -		funcs->atomic_async_update(plane, plane_state);
> +		funcs->atomic_async_update(plane, state);
>  =20
>   		/*
>   		 * ->atomic_async_update() is supposed to update the
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm=
/mediatek/mtk_drm_plane.c
> index 92141a19681b..30ebcfd8832f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -77,12 +77,14 @@ static void mtk_drm_plane_destroy_state(struct drm_=
plane *plane,
>   }
>  =20
>   static int mtk_plane_atomic_async_check(struct drm_plane *plane,
> -					struct drm_plane_state *state)
> +					struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_=
state(state,
> +										 plane);
>   	struct drm_crtc_state *crtc_state;
>   	int ret;
>  =20
> -	if (plane !=3D state->crtc->cursor)
> +	if (plane !=3D new_plane_state->crtc->cursor)
>   		return -EINVAL;
>  =20
>   	if (!plane->state)
> @@ -91,16 +93,16 @@ static int mtk_plane_atomic_async_check(struct drm_=
plane *plane,
>   	if (!plane->state->fb)
>   		return -EINVAL;
>  =20
> -	ret =3D mtk_drm_crtc_plane_check(state->crtc, plane,
> -				       to_mtk_plane_state(state));
> +	ret =3D mtk_drm_crtc_plane_check(new_plane_state->crtc, plane,
> +				       to_mtk_plane_state(new_plane_state));
>   	if (ret)
>   		return ret;
>  =20
> -	if (state->state)
> -		crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> -								state->crtc);
> +	if (state)
> +		crtc_state =3D drm_atomic_get_existing_crtc_state(state,
> +								new_plane_state->crtc);
>   	else /* Special case for asynchronous cursor updates. */
> -		crtc_state =3D state->crtc->state;
> +		crtc_state =3D new_plane_state->crtc->state;
>  =20
>   	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,=

>   						   DRM_PLANE_HELPER_NO_SCALING,
> @@ -109,9 +111,11 @@ static int mtk_plane_atomic_async_check(struct drm=
_plane *plane,
>   }
>  =20
>   static void mtk_plane_atomic_async_update(struct drm_plane *plane,
> -					  struct drm_plane_state *new_state)
> +					  struct drm_atomic_state *state)
>   {
> -	struct mtk_plane_state *state =3D to_mtk_plane_state(plane->state);
> +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state,
> +									   plane);
> +	struct mtk_plane_state *new_plane_state =3D to_mtk_plane_state(plane-=
>state);
>  =20
>   	plane->state->crtc_x =3D new_state->crtc_x;
>   	plane->state->crtc_y =3D new_state->crtc_y;
> @@ -122,7 +126,7 @@ static void mtk_plane_atomic_async_update(struct dr=
m_plane *plane,
>   	plane->state->src_h =3D new_state->src_h;
>   	plane->state->src_w =3D new_state->src_w;
>   	swap(plane->state->fb, new_state->fb);
> -	state->pending.async_dirty =3D true;
> +	new_plane_state->pending.async_dirty =3D true;
>  =20
>   	mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/d=
rm/msm/disp/mdp5/mdp5_plane.c
> index 83423092de2f..05fa8255caeb 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -5,6 +5,7 @@
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
>  =20
> +#include <drm/drm_atomic.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_print.h>
> @@ -438,41 +439,43 @@ static void mdp5_plane_atomic_update(struct drm_p=
lane *plane,
>   }
>  =20
>   static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
> -					 struct drm_plane_state *state)
> +					 struct drm_atomic_state *state)
>   {
> -	struct mdp5_plane_state *mdp5_state =3D to_mdp5_plane_state(state);
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_=
state(state,
> +										 plane);
> +	struct mdp5_plane_state *mdp5_state =3D to_mdp5_plane_state(new_plane=
_state);
>   	struct drm_crtc_state *crtc_state;
>   	int min_scale, max_scale;
>   	int ret;
>  =20
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> -							state->crtc);
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
> +							new_plane_state->crtc);
>   	if (WARN_ON(!crtc_state))
>   		return -EINVAL;
>  =20
>   	if (!crtc_state->active)
>   		return -EINVAL;
>  =20
> -	mdp5_state =3D to_mdp5_plane_state(state);
> +	mdp5_state =3D to_mdp5_plane_state(new_plane_state);
>  =20
>   	/* don't use fast path if we don't have a hwpipe allocated yet */
>   	if (!mdp5_state->hwpipe)
>   		return -EINVAL;
>  =20
>   	/* only allow changing of position(crtc x/y or src x/y) in fast path=
 */
> -	if (plane->state->crtc !=3D state->crtc ||
> -	    plane->state->src_w !=3D state->src_w ||
> -	    plane->state->src_h !=3D state->src_h ||
> -	    plane->state->crtc_w !=3D state->crtc_w ||
> -	    plane->state->crtc_h !=3D state->crtc_h ||
> +	if (plane->state->crtc !=3D new_plane_state->crtc ||
> +	    plane->state->src_w !=3D new_plane_state->src_w ||
> +	    plane->state->src_h !=3D new_plane_state->src_h ||
> +	    plane->state->crtc_w !=3D new_plane_state->crtc_w ||
> +	    plane->state->crtc_h !=3D new_plane_state->crtc_h ||
>   	    !plane->state->fb ||
> -	    plane->state->fb !=3D state->fb)
> +	    plane->state->fb !=3D new_plane_state->fb)
>   		return -EINVAL;
>  =20
>   	min_scale =3D FRAC_16_16(1, 8);
>   	max_scale =3D FRAC_16_16(8, 1);
>  =20
> -	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_sta=
te,
>   						  min_scale, max_scale,
>   						  true, true);
>   	if (ret)
> @@ -485,15 +488,17 @@ static int mdp5_plane_atomic_async_check(struct d=
rm_plane *plane,
>   	 * also assign/unassign the hwpipe(s) tied to the plane. We avoid
>   	 * taking the fast path for both these reasons.
>   	 */
> -	if (state->visible !=3D plane->state->visible)
> +	if (new_plane_state->visible !=3D plane->state->visible)
>   		return -EINVAL;
>  =20
>   	return 0;
>   }
>  =20
>   static void mdp5_plane_atomic_async_update(struct drm_plane *plane,
> -					   struct drm_plane_state *new_state)
> +					   struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state,
> +									   plane);
>   	struct drm_framebuffer *old_fb =3D plane->state->fb;
>  =20
>   	plane->state->src_x =3D new_state->src_x;
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_vop.c
> index 8d15cabdcb02..fefeab73ca27 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1021,8 +1021,10 @@ static void vop_plane_atomic_update(struct drm_p=
lane *plane,
>   }
>  =20
>   static int vop_plane_atomic_async_check(struct drm_plane *plane,
> -					struct drm_plane_state *state)
> +					struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_=
state(state,
> +										 plane);
>   	struct vop_win *vop_win =3D to_vop_win(plane);
>   	const struct vop_win_data *win =3D vop_win->data;
>   	int min_scale =3D win->phy->scl ? FRAC_16_16(1, 8) :
> @@ -1031,7 +1033,7 @@ static int vop_plane_atomic_async_check(struct dr=
m_plane *plane,
>   					DRM_PLANE_HELPER_NO_SCALING;
>   	struct drm_crtc_state *crtc_state;
>  =20
> -	if (plane !=3D state->crtc->cursor)
> +	if (plane !=3D new_plane_state->crtc->cursor)
>   		return -EINVAL;
>  =20
>   	if (!plane->state)
> @@ -1040,9 +1042,9 @@ static int vop_plane_atomic_async_check(struct dr=
m_plane *plane,
>   	if (!plane->state->fb)
>   		return -EINVAL;
>  =20
> -	if (state->state)
> -		crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> -								state->crtc);
> +	if (state)
> +		crtc_state =3D drm_atomic_get_existing_crtc_state(state,
> +								new_plane_state->crtc);
>   	else /* Special case for asynchronous cursor updates. */
>   		crtc_state =3D plane->crtc->state;
>  =20
> @@ -1052,8 +1054,10 @@ static int vop_plane_atomic_async_check(struct d=
rm_plane *plane,
>   }
>  =20
>   static void vop_plane_atomic_async_update(struct drm_plane *plane,
> -					  struct drm_plane_state *new_state)
> +					  struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(=
state,
> +									   plane);
>   	struct vop *vop =3D to_vop(plane->state->crtc);
>   	struct drm_framebuffer *old_fb =3D plane->state->fb;
>  =20
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_=
plane.c
> index 6b39cc2ca18d..48fdffebb45f 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1118,32 +1118,34 @@ void vc4_plane_async_set_fb(struct drm_plane *p=
lane, struct drm_framebuffer *fb)
>   }
>  =20
>   static void vc4_plane_atomic_async_update(struct drm_plane *plane,
> -					  struct drm_plane_state *state)
> +					  struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_=
state(state,
> +										 plane);
>   	struct vc4_plane_state *vc4_state, *new_vc4_state;
>  =20
> -	swap(plane->state->fb, state->fb);
> -	plane->state->crtc_x =3D state->crtc_x;
> -	plane->state->crtc_y =3D state->crtc_y;
> -	plane->state->crtc_w =3D state->crtc_w;
> -	plane->state->crtc_h =3D state->crtc_h;
> -	plane->state->src_x =3D state->src_x;
> -	plane->state->src_y =3D state->src_y;
> -	plane->state->src_w =3D state->src_w;
> -	plane->state->src_h =3D state->src_h;
> -	plane->state->src_h =3D state->src_h;
> -	plane->state->alpha =3D state->alpha;
> -	plane->state->pixel_blend_mode =3D state->pixel_blend_mode;
> -	plane->state->rotation =3D state->rotation;
> -	plane->state->zpos =3D state->zpos;
> -	plane->state->normalized_zpos =3D state->normalized_zpos;
> -	plane->state->color_encoding =3D state->color_encoding;
> -	plane->state->color_range =3D state->color_range;
> -	plane->state->src =3D state->src;
> -	plane->state->dst =3D state->dst;
> -	plane->state->visible =3D state->visible;
> +	swap(plane->state->fb, new_plane_state->fb);
> +	plane->state->crtc_x =3D new_plane_state->crtc_x;
> +	plane->state->crtc_y =3D new_plane_state->crtc_y;
> +	plane->state->crtc_w =3D new_plane_state->crtc_w;
> +	plane->state->crtc_h =3D new_plane_state->crtc_h;
> +	plane->state->src_x =3D new_plane_state->src_x;
> +	plane->state->src_y =3D new_plane_state->src_y;
> +	plane->state->src_w =3D new_plane_state->src_w;
> +	plane->state->src_h =3D new_plane_state->src_h;
> +	plane->state->src_h =3D new_plane_state->src_h;
> +	plane->state->alpha =3D new_plane_state->alpha;
> +	plane->state->pixel_blend_mode =3D new_plane_state->pixel_blend_mode;=

> +	plane->state->rotation =3D new_plane_state->rotation;
> +	plane->state->zpos =3D new_plane_state->zpos;
> +	plane->state->normalized_zpos =3D new_plane_state->normalized_zpos;
> +	plane->state->color_encoding =3D new_plane_state->color_encoding;
> +	plane->state->color_range =3D new_plane_state->color_range;
> +	plane->state->src =3D new_plane_state->src;
> +	plane->state->dst =3D new_plane_state->dst;
> +	plane->state->visible =3D new_plane_state->visible;
>  =20
> -	new_vc4_state =3D to_vc4_plane_state(state);
> +	new_vc4_state =3D to_vc4_plane_state(new_plane_state);
>   	vc4_state =3D to_vc4_plane_state(plane->state);
>  =20
>   	vc4_state->crtc_x =3D new_vc4_state->crtc_x;
> @@ -1187,23 +1189,25 @@ static void vc4_plane_atomic_async_update(struc=
t drm_plane *plane,
>   }
>  =20
>   static int vc4_plane_atomic_async_check(struct drm_plane *plane,
> -					struct drm_plane_state *state)
> +					struct drm_atomic_state *state)
>   {
> +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_=
state(state,
> +										 plane);
>   	struct vc4_plane_state *old_vc4_state, *new_vc4_state;
>   	int ret;
>   	u32 i;
>  =20
> -	ret =3D vc4_plane_mode_set(plane, state);
> +	ret =3D vc4_plane_mode_set(plane, new_plane_state);
>   	if (ret)
>   		return ret;
>  =20
>   	old_vc4_state =3D to_vc4_plane_state(plane->state);
> -	new_vc4_state =3D to_vc4_plane_state(state);
> +	new_vc4_state =3D to_vc4_plane_state(new_plane_state);
>   	if (old_vc4_state->dlist_count !=3D new_vc4_state->dlist_count ||
>   	    old_vc4_state->pos0_offset !=3D new_vc4_state->pos0_offset ||
>   	    old_vc4_state->pos2_offset !=3D new_vc4_state->pos2_offset ||
>   	    old_vc4_state->ptr0_offset !=3D new_vc4_state->ptr0_offset ||
> -	    vc4_lbm_size(plane->state) !=3D vc4_lbm_size(state))
> +	    vc4_lbm_size(plane->state) !=3D vc4_lbm_size(new_plane_state))
>   		return -EINVAL;
>  =20
>   	/* Only pos0, pos2 and ptr0 DWORDS can be updated in an async update=

> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm=
_modeset_helper_vtables.h
> index cbe613858a93..a7141e6e05c5 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1286,7 +1286,7 @@ struct drm_plane_helper_funcs {
>   	/**
>   	 * @atomic_async_check:
>   	 *
> -	 * Drivers should set this function pointer to check if the plane sta=
te
> +	 * Drivers should set this function pointer to check if the atomic st=
ate

Using 'atomic state' sounds like all of it. I'd keep 'plane state' or=20
use 'plane's atomic state' to be more precise.

In any case:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>   	 * can be updated in a async fashion. Here async means "not vblank
>   	 * synchronized".
>   	 *
> @@ -1300,7 +1300,7 @@ struct drm_plane_helper_funcs {
>   	 * can not be applied in asynchronous manner.
>   	 */
>   	int (*atomic_async_check)(struct drm_plane *plane,
> -				  struct drm_plane_state *state);
> +				  struct drm_atomic_state *state);
>  =20
>   	/**
>   	 * @atomic_async_update:
> @@ -1316,11 +1316,9 @@ struct drm_plane_helper_funcs {
>   	 * update won't happen if there is an outstanding commit modifying
>   	 * the same plane.
>   	 *
> -	 * Note that unlike &drm_plane_helper_funcs.atomic_update this hook
> -	 * takes the new &drm_plane_state as parameter. When doing async_upda=
te
> -	 * drivers shouldn't replace the &drm_plane_state but update the
> -	 * current one with the new plane configurations in the new
> -	 * plane_state.
> +	 * When doing async_update drivers shouldn't replace the
> +	 * &drm_plane_state but update the current one with the new plane
> +	 * configurations in the new plane_state.
>   	 *
>   	 * Drivers should also swap the framebuffers between current plane
>   	 * state (&drm_plane.state) and new_state.
> @@ -1339,7 +1337,7 @@ struct drm_plane_helper_funcs {
>   	 *    for deferring if needed, until a common solution is created.
>   	 */
>   	void (*atomic_async_update)(struct drm_plane *plane,
> -				    struct drm_plane_state *new_state);
> +				    struct drm_atomic_state *state);
>   };
>  =20
>   /**
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--iMJyl0HU3uEFZbtC4DSVZw9PwcP85TNwO--

--bxF4bx0Z4FsrJm9ZlyjCENABg7VfzCxqU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmABmdAFAwAAAAAACgkQlh/E3EQov+A2
cw//Sch12E2t8C0cknT7Vx9nNPJGXhOJ9vDUGBOQ7cycO96Bnhi+KYW2e3iH1JhmLcnYZ4drUNV0
sr+9/yOS3QH1ONwwzJBUCDyHKrloKGo2kFJHufEn//i/+OV4o/ssC63YwHkF6UKIk6nu3dE+jAnD
Wql7zRkVZc1Iwu3hm8itLm0j0+VEB59XwBLM9r/0fEaIdcuZ0/p68iITZuzcCCVB9Ly2fvPJ6FWl
9m5cEVG3j8KfnftDctiZywlbyofHLB8rFDjngwYJ58ppG1f6EEuXkrcmh+gsBNyhAV4NP8hyXk+n
RrkSauYh4l5lZoG2YU36hTVb4Ra0IBqgFdF2opPVjs5i8BjOmsD8TG5tI68aRzu3VKDk7bz0nkF+
8gp6hImbc1vGMaGJVAPm/Tyr11RTHXBbwYSBMRQcWv5VFbJFI2ZoMlxR599Y/iOTXXy29DBIfb5A
dUtryjK9k94Iz6rAKJfLc57ooVR8izpCeybfBw/7FlG1dCu1HpyepeYf4oJf9a9+buq9khUmhXzC
2vNvrKTC/Nv5vY29InS2+CiFL9+tPdqos9nPTz2R/8Jzia4aSFDUr/AHPwXR+8vaPzf7b0Xpv42v
pHKKAJhs22EbccctHzWW31bwWOtRgZ+Es6X75roP2FBxxswA4kIryHQHA358G+hBiCnTWbNOE3e5
S0o=
=lMDt
-----END PGP SIGNATURE-----

--bxF4bx0Z4FsrJm9ZlyjCENABg7VfzCxqU--

--===============1917013177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1917013177==--
