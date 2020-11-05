Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912392A86CB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 20:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9776E15A;
	Thu,  5 Nov 2020 19:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7595A6E15A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:08:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B62CAF21;
 Thu,  5 Nov 2020 19:07:59 +0000 (UTC)
Subject: Re: [PATCH v2] drm: Use state helper instead of CRTC state pointer
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20201105164518.392891-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <15237bbb-24e8-f3b9-0d94-321bc2863fe8@suse.de>
Date: Thu, 5 Nov 2020 20:07:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201105164518.392891-1-maxime@cerno.tech>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: multipart/mixed; boundary="===============1321246215=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1321246215==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m6VFvrriBf0MRepzntphKadXmVFZctYgC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m6VFvrriBf0MRepzntphKadXmVFZctYgC
Content-Type: multipart/mixed; boundary="AjDZzvB3GweMZM23ekMF19gtkdifzZDec";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 "James (Qian) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, Russell King <linux@armlinux.org.uk>,
 Paul Cercueil <paul@crapouillou.net>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Message-ID: <15237bbb-24e8-f3b9-0d94-321bc2863fe8@suse.de>
Subject: Re: [PATCH v2] drm: Use state helper instead of CRTC state pointer
References: <20201105164518.392891-1-maxime@cerno.tech>
In-Reply-To: <20201105164518.392891-1-maxime@cerno.tech>

--AjDZzvB3GweMZM23ekMF19gtkdifzZDec
Content-Type: multipart/mixed;
 boundary="------------E414A06ADAC7C8ECB6FC5142"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E414A06ADAC7C8ECB6FC5142
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.11.20 um 17:45 schrieb Maxime Ripard:
> Many drivers reference the crtc->pointer in order to get the current CR=
TC
> state in their atomic_begin or atomic_flush hooks, which would be the n=
ew
> CRTC state in the global atomic state since _swap_state happened when t=
hose
> hooks are run.
>=20
> Use the drm_atomic_get_new_crtc_state helper to get that state to make =
it
> more obvious.
>=20
> This was made using the coccinelle script below:
>=20
> @ crtc_atomic_func @
> identifier helpers;
> identifier func;
> @@
>=20
> (
> static struct drm_crtc_helper_funcs helpers =3D {
> 	...,
> 	.atomic_begin =3D func,
> 	...,
> };
> |
> static struct drm_crtc_helper_funcs helpers =3D {
> 	...,
> 	.atomic_flush =3D func,
> 	...,
> };
> )
>=20
> @@
> identifier crtc_atomic_func.func;
> identifier crtc, state;
> symbol crtc_state;
> expression e;
> @@
>=20
>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   ...
> - struct tegra_dc_state *crtc_state =3D e;
> + struct tegra_dc_state *dc_state =3D e;
>   <+...
> -       crtc_state
> +	dc_state
>   ...+>
>   }
>=20
> @@
> identifier crtc_atomic_func.func;
> identifier crtc, state;
> symbol crtc_state;
> expression e;
> @@
>=20
>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   ...
> - struct mtk_crtc_state *crtc_state =3D e;
> + struct mtk_crtc_state *mtk_crtc_state =3D e;
>   <+...
> -       crtc_state
> +	mtk_crtc_state
>   ...+>
>   }
>=20
> @ replaces_new_state @
> identifier crtc_atomic_func.func;
> identifier crtc, state, crtc_state;
> @@
>=20
>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   ...
> - struct drm_crtc_state *crtc_state =3D crtc->state;
> + struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate, crtc);
>   ...
>  }
>=20
> @@
> identifier crtc_atomic_func.func;
> identifier crtc, state, crtc_state;
> @@
>=20
>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate, crtc);
>   ...
> - crtc->state
> + crtc_state
>   ...
>  }
>=20
> @ adds_new_state @
> identifier crtc_atomic_func.func;
> identifier crtc, state;
> @@
>=20
>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> + struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate, crtc);
>   ...
> - crtc->state
> + crtc_state
>   ...
>  }
>=20
> @ include depends on adds_new_state || replaces_new_state @
> @@
>=20
>  #include <drm/drm_atomic.h>
>=20
> @ no_include depends on !include && (adds_new_state || replaces_new_sta=
te) @
> @@
>=20
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
>=20
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
> ---
>=20
> Changes from v1:
>   - Fixed checkpatch warnings
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c |  4 +++-
>  drivers/gpu/drm/armada/armada_crtc.c             |  8 ++++++--
>  drivers/gpu/drm/ast/ast_mode.c                   |  4 +++-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c        |  7 +++++--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c          | 15 +++++++++------
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c      |  6 ++++--
>  drivers/gpu/drm/tegra/dc.c                       |  8 +++++---
>  drivers/gpu/drm/virtio/virtgpu_display.c         |  4 +++-
>  8 files changed, 38 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers=
/gpu/drm/arm/display/komeda/komeda_crtc.c
> index df0b9eeb8933..4b485eb512e2 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -387,10 +387,12 @@ static void
>  komeda_crtc_atomic_flush(struct drm_crtc *crtc,
>  			 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct drm_crtc_state *old =3D drm_atomic_get_old_crtc_state(state,
>  								   crtc);
>  	/* commit with modeset will be handled in enable/disable */
> -	if (drm_atomic_crtc_needs_modeset(crtc->state))
> +	if (drm_atomic_crtc_needs_modeset(crtc_state))
>  		return;
> =20
>  	komeda_crtc_do_flush(crtc, old);
> diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/arm=
ada/armada_crtc.c
> index ca643f4e2064..3ebcf5a52c8b 100644
> --- a/drivers/gpu/drm/armada/armada_crtc.c
> +++ b/drivers/gpu/drm/armada/armada_crtc.c
> @@ -431,11 +431,13 @@ static int armada_drm_crtc_atomic_check(struct dr=
m_crtc *crtc,
>  static void armada_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct armada_crtc *dcrtc =3D drm_to_armada_crtc(crtc);
> =20
>  	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
> =20
> -	if (crtc->state->color_mgmt_changed)
> +	if (crtc_state->color_mgmt_changed)
>  		armada_drm_update_gamma(crtc);
> =20
>  	dcrtc->regs_idx =3D 0;
> @@ -445,6 +447,8 @@ static void armada_drm_crtc_atomic_begin(struct drm=
_crtc *crtc,
>  static void armada_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct armada_crtc *dcrtc =3D drm_to_armada_crtc(crtc);
> =20
>  	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
> @@ -455,7 +459,7 @@ static void armada_drm_crtc_atomic_flush(struct drm=
_crtc *crtc,
>  	 * If we aren't doing a full modeset, then we need to queue
>  	 * the event here.
>  	 */
> -	if (!drm_atomic_crtc_needs_modeset(crtc->state)) {
> +	if (!drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		dcrtc->update_pending =3D true;
>  		armada_drm_crtc_queue_state_event(crtc);
>  		spin_lock_irq(&dcrtc->irq_lock);
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index 22f0e65fbe9a..9db371f4054f 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -782,10 +782,12 @@ static void
>  ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>  			     struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
>  									      crtc);
>  	struct ast_private *ast =3D to_ast_private(crtc->dev);
> -	struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc->sta=
te);
> +	struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc_stat=
e);
>  	struct ast_crtc_state *old_ast_crtc_state =3D to_ast_crtc_state(old_c=
rtc_state);
> =20
>  	/*
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> index b9c156e13156..7603f86dd0d1 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -305,11 +305,13 @@ ingenic_drm_crtc_mode_valid(struct drm_crtc *crtc=
, const struct drm_display_mode
>  static void ingenic_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>  					  struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>  	u32 ctrl =3D 0;
> =20
>  	if (priv->soc_info->has_osd &&
> -	    drm_atomic_crtc_needs_modeset(crtc->state)) {
> +	    drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		/*
>  		 * If IPU plane is enabled, enable IPU as source for the F1
>  		 * plane; otherwise use regular DMA.
> @@ -326,7 +328,8 @@ static void ingenic_drm_crtc_atomic_flush(struct dr=
m_crtc *crtc,
>  					  struct drm_atomic_state *state)
>  {
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> -	struct drm_crtc_state *crtc_state =3D crtc->state;
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct drm_pending_vblank_event *event =3D crtc_state->event;
> =20
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> index 23f5c10b0c67..193848fd7515 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -11,6 +11,7 @@
>  #include <asm/barrier.h>
>  #include <soc/mediatek/smi.h>
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -577,17 +578,19 @@ static void mtk_drm_crtc_atomic_disable(struct dr=
m_crtc *crtc,
>  static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>  				      struct drm_atomic_state *state)
>  {
> -	struct mtk_crtc_state *crtc_state =3D to_mtk_crtc_state(crtc->state);=

> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	struct mtk_crtc_state *mtk_crtc_state =3D to_mtk_crtc_state(crtc_stat=
e);
>  	struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> =20
> -	if (mtk_crtc->event && crtc_state->base.event)
> +	if (mtk_crtc->event && mtk_crtc_state->base.event)
>  		DRM_ERROR("new event while there is still a pending event\n");
> =20
> -	if (crtc_state->base.event) {
> -		crtc_state->base.event->pipe =3D drm_crtc_index(crtc);
> +	if (mtk_crtc_state->base.event) {
> +		mtk_crtc_state->base.event->pipe =3D drm_crtc_index(crtc);
>  		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> -		mtk_crtc->event =3D crtc_state->base.event;
> -		crtc_state->base.event =3D NULL;
> +		mtk_crtc->event =3D mtk_crtc_state->base.event;
> +		mtk_crtc_state->base.event =3D NULL;
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_vop.c
> index 8cd39fca81a3..d1e05482641b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1248,6 +1248,8 @@ static void vop_crtc_gamma_set(struct vop *vop, s=
truct drm_crtc *crtc,
>  static void vop_crtc_atomic_begin(struct drm_crtc *crtc,
>  				  struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
>  									      crtc);
>  	struct vop *vop =3D to_vop(crtc);
> @@ -1256,8 +1258,8 @@ static void vop_crtc_atomic_begin(struct drm_crtc=
 *crtc,
>  	 * Only update GAMMA if the 'active' flag is not changed,
>  	 * otherwise it's updated by .atomic_enable.
>  	 */
> -	if (crtc->state->color_mgmt_changed &&
> -	    !crtc->state->active_changed)
> +	if (crtc_state->color_mgmt_changed &&
> +	    !crtc_state->active_changed)
>  		vop_crtc_gamma_set(vop, crtc, old_crtc_state);
>  }
> =20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 2d86627b0d4e..85dd7131553a 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1939,15 +1939,17 @@ static void tegra_crtc_atomic_begin(struct drm_=
crtc *crtc,
>  static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
>  				    struct drm_atomic_state *state)
>  {
> -	struct tegra_dc_state *crtc_state =3D to_dc_state(crtc->state);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	struct tegra_dc_state *dc_state =3D to_dc_state(crtc_state);
>  	struct tegra_dc *dc =3D to_tegra_dc(crtc);
>  	u32 value;
> =20
> -	value =3D crtc_state->planes << 8 | GENERAL_UPDATE;
> +	value =3D dc_state->planes << 8 | GENERAL_UPDATE;
>  	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
> =20
> -	value =3D crtc_state->planes | GENERAL_ACT_REQ;
> +	value =3D dc_state->planes | GENERAL_ACT_REQ;
>  	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
>  }
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm=
/virtio/virtgpu_display.c
> index 4bf74836bd53..a6caebd4a0dd 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -119,6 +119,8 @@ static int virtio_gpu_crtc_atomic_check(struct drm_=
crtc *crtc,
>  static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct virtio_gpu_output *output =3D drm_crtc_to_virtio_gpu_output(cr=
tc);
> =20
>  	/*
> @@ -127,7 +129,7 @@ static void virtio_gpu_crtc_atomic_flush(struct drm=
_crtc *crtc,
>  	 * in the plane update callback, and here we just check
>  	 * whenever we must force the modeset.
>  	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc->state)) {
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		output->needs_modeset =3D true;
>  	}
>  }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------E414A06ADAC7C8ECB6FC5142
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
c0n
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+wsCOBBMBCAA4AhsDBQsJC=
AcC
BhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl78SF4ACgkQaA3BH=
VML
eiOpGAgAih6C1OnWms/N8eBMC4Q93y/nyywe5vCL22Dr1rwgn6Iw2jOGziJSi7zhY4sEk2NKJ=
5cd
lFrx8mP//b+xO4AGffwBD0Vwpf38Hj2Gt0KjpzRYccqqU+tJPO5c0pjI52ZIV3+kOEFvYGfkN=
PHE
flE+b81T8L2dSXCLtj4WAGUM1rmHn3bCYl+/RwkB+8XnoL5AvrmMcU4Uhb3FJpM4DHExccYkd=
eSL
ojBppOCztBCUpBx3le+8QPVvAvJDuur4wRmjk3sjKClAwzeqoYyUKcN3JDdb3mt3QcJal9rSh=
VEI
7B25IvfmEbs42oGm8GPzPkaNJu3gcska+l5PSTfurNETGsJdBBARAgAdFiEEJ+jjpp87z/+5L=
Y5q
LnehMBH108IFAls6HVcACgkQLnehMBH108LTkACgjLQdDYMENi6BDjY/gd/LF9lMi8oAnR+o0=
FwE
Vb1K1tEMQ/1x+k1U6/xgwsBzBBABCAAdFiEEHl2YIZkIo5VO2MxYqlA7ya4PR6cFAls58bMAC=
gkQ
qlA7ya4PR6cvTAgAzY1N5QMKh8ECRtYcZNmilyV59uHTEY9hAR+203JqWnSGfUKtU7s6xfl5O=
NGq
DI5rULk4Cw2CEIzg9Sat+/lxn36w2f1tEznS5Vb0gVGWrzDAFjj7tB6MnmCzsNb/S1kgxnqJM=
Yor
RYQ7uB3Yr2Fdp08FJxN0ipd5YfzaZ6KoSWcRAv4r1R4ZQGuS77URAg7HDOIrBMOVO+HIn7GYQ=
qPS
5ZFw5yXbvEtL1c5Y8Zdw1AG2VmEXx78TWQVG3kI8/lQF1QI3yrJ1Rp2x5eK9I0OJihv13IlIW=
3sb
QGrj9pxF63kA20ZFaynzFglBGiyxExYvTD0/xKIhzYhj8mtCunPb2cLAcwQQAQgAHRYhBLsjb=
bex
nu/GyEcdaKfzfBmMOTGBBQJbOjLAAAoJEKfzfBmMOTGBBoMIALIW4EtBY28tPwZMOpN/+ARPO=
a2g
Qzpivw7iNtiDTnGIXMCoxly1CybfMdqTHYmuKbEO9AlFAlDOnkgInsn8E65IvgUTVI95Ah+Ob=
iPI
FkYc/9a+AexPl7f5kI9489k77eKtqtMpWFpo/vROmRroSw4JnM7ovwPq1QOSHExfTKbLunzD1=
i3V
4PShSZ6bGsp1LW6Wk0lRMHDuAk3xsyjBWfJwSbrCe3E6OsLG7BuQqEUt2fR6NxdDRSR9tQUp9=
Tri
AYG5LndmUzxeU6FAQjD8Wt1ezOFH5ODcCDXfRyYmE6uCGA4EvO8l9R3o68NPlUjPRAZsCbxJa=
UAg
iazX1nyQGwvOwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHU=
E9e
osYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+q=
bU6
3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWG=
KdD
egUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXod=
NFM
AgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAf=
AQY
AQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojp=
fcI
AInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0r=
FDj
55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcD=
hBE
jKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU=
2y3
ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/t=
sZv
yEX6zN8CtirPdPWu/VXNRYAl/lat7lSI3H26qrE=3D
=3DmxFq
-----END PGP PUBLIC KEY BLOCK-----

--------------E414A06ADAC7C8ECB6FC5142--

--AjDZzvB3GweMZM23ekMF19gtkdifzZDec--

--m6VFvrriBf0MRepzntphKadXmVFZctYgC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+kTY0FAwAAAAAACgkQaA3BHVMLeiMD
Awf9EMX+XqIh5ol4YjdthVKuKGtrteVZAVmXKZVn7a8zXfms3OZPKaaCIj5uORsvyxDG1SedD3ZX
GB5Hv76iF/3+17PVl/eG19uLm7xGsWs4sdQ+O/rck7DS5PoEzrMKGDLP9XnhifZR7d60x6wSv3be
noS75RB9QdscJOScz8uZtFD+ke3qD03ZPpJBi0IpmTWS1DCXRKDfX59ksWkAXwzjB2/Jto6Z5IYg
sr2+V4bxsj8Lww7yuQS1FvEEtk2l68eOOEtXuGv5qzy/PO2BPHUvWEo6U8WRSwv0916700n64ly8
4dS6cgMiVOm+hW2zx/agoXyIL1x1BWBYtslDRgXlRg==
=3R7U
-----END PGP SIGNATURE-----

--m6VFvrriBf0MRepzntphKadXmVFZctYgC--

--===============1321246215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1321246215==--
