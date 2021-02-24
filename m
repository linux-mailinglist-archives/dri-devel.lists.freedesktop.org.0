Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A118D323B51
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 12:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219D56E8C5;
	Wed, 24 Feb 2021 11:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CD76E027;
 Wed, 24 Feb 2021 11:33:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B158DADE5;
 Wed, 24 Feb 2021 11:33:47 +0000 (UTC)
Subject: Re: [PATCH v3 01/11] drm/atomic: Pass the full state to planes async
 atomic check and update
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20210219120032.260676-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cead3a20-08cf-78a4-88a9-c6b6697bd8b8@suse.de>
Date: Wed, 24 Feb 2021 12:33:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219120032.260676-1-maxime@cerno.tech>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0979740372=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0979740372==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lCAEdGC7QfE0IYgcAz5gwTuSi1ZNxEr6d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lCAEdGC7QfE0IYgcAz5gwTuSi1ZNxEr6d
Content-Type: multipart/mixed; boundary="lNrdpw1gQPFCstc4KRt3YhDetJdJsZ42A";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cead3a20-08cf-78a4-88a9-c6b6697bd8b8@suse.de>
Subject: Re: [PATCH v3 01/11] drm/atomic: Pass the full state to planes async
 atomic check and update
References: <20210219120032.260676-1-maxime@cerno.tech>
In-Reply-To: <20210219120032.260676-1-maxime@cerno.tech>

--lNrdpw1gQPFCstc4KRt3YhDetJdJsZ42A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

for the whole series:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 19.02.21 um 13:00 schrieb Maxime Ripard:
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
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> ---
>=20
> Changes from v1:
>    - Updated the comment according to Thomas suggestions
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++-
>   drivers/gpu/drm/drm_atomic_helper.c           |  4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c      | 26 +++++----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 33 ++++++-----
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 16 ++++--
>   drivers/gpu/drm/vc4/vc4_plane.c               | 56 ++++++++++--------=
-
>   include/drm/drm_modeset_helper_vtables.h      | 18 +++---
>   7 files changed, 89 insertions(+), 72 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 6ed96633425f..63f839679a0a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6468,7 +6468,7 @@ static int dm_plane_atomic_check(struct drm_plane=
 *plane,
>   }
>  =20
>   static int dm_plane_atomic_async_check(struct drm_plane *plane,
> -				       struct drm_plane_state *new_plane_state)
> +				       struct drm_atomic_state *state)
>   {
>   	/* Only support async updates on cursor planes. */
>   	if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> @@ -6478,10 +6478,12 @@ static int dm_plane_atomic_async_check(struct d=
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
> index 9fa3f97223a1..bd0bb74437c7 100644
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
> index 6bd8260aa9f2..ff485e58d271 100644
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
> index eb706342861d..2b4d085da450 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1292,9 +1292,9 @@ struct drm_plane_helper_funcs {
>   	/**
>   	 * @atomic_async_check:
>   	 *
> -	 * Drivers should set this function pointer to check if the plane sta=
te
> -	 * can be updated in a async fashion. Here async means "not vblank
> -	 * synchronized".
> +	 * Drivers should set this function pointer to check if the plane's
> +	 * atomic state can be updated in a async fashion. Here async means
> +	 * "not vblank synchronized".
>   	 *
>   	 * This hook is called by drm_atomic_async_check() to establish if a=

>   	 * given update can be committed asynchronously, that is, if it can
> @@ -1306,7 +1306,7 @@ struct drm_plane_helper_funcs {
>   	 * can not be applied in asynchronous manner.
>   	 */
>   	int (*atomic_async_check)(struct drm_plane *plane,
> -				  struct drm_plane_state *state);
> +				  struct drm_atomic_state *state);
>  =20
>   	/**
>   	 * @atomic_async_update:
> @@ -1322,11 +1322,9 @@ struct drm_plane_helper_funcs {
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
> @@ -1345,7 +1343,7 @@ struct drm_plane_helper_funcs {
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


--lNrdpw1gQPFCstc4KRt3YhDetJdJsZ42A--

--lCAEdGC7QfE0IYgcAz5gwTuSi1ZNxEr6d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA2OZkFAwAAAAAACgkQlh/E3EQov+AD
3A//Z1xOfG65Q8IvlGSHx85E17xZXmr5GLJ0UeMXhy/GR4IuaGab4AGd6n/cbz6pBosEWzMRRAZd
Klatjvlse1LXWSFaTqzaBRGtpe828gHX+tueNmk/3z1lKlJY2UnXkYeTCUH0n3F9mKs4hgH4gtPo
4a/76kbXjF/NhRwU8gXdvEWYnzX7KNOxyxfKFle2WawuCX1/KuVrNJImIZ5yYAVR7UjsXN0Bpd3t
XKPqEc4edVZx5/HJAOBCdU/1H+60clkQCL6rM2bWjAU0rjCmJZMtUvqI706gAR18hTY7J7Fq+jBz
lAhaDNsKEyTcRreXyQNfvWr7wj/Js28y386ljOaqZ+mRIBGKtlVGTn0KuAwFEnjHx9V/DLjtyacA
VmJyn/5/MZoXTtSPAFMnsv3M5WOxay1kxmPABdj9SRp3cQiMWbuIyX7xwEe/Ajk9CfDWO3SX20rW
er2lkuTcGnE6NLNYKHdQR+jfUONu3NKaS9LKZLbN+512Lik4ifQLQHyyTwUKMdDSXBNlBFWd6sFI
I2zrT3AGL08s9MQa4Oz/mPYulDIPLN09/1b/pu3yYxPOWZU5NxG0gu1Eq2fz7lyo3l1sALt558Tl
h6DXWBhaIaPKZzhaBeFV1tSXOC8IyET8g3IgJ9ryTh5Yh9rFFMyKvcyzAG/Wco0AFnjCywF0r4zk
sII=
=+3EL
-----END PGP SIGNATURE-----

--lCAEdGC7QfE0IYgcAz5gwTuSi1ZNxEr6d--

--===============0979740372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0979740372==--
