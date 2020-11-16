Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3BC2B4564
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 15:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A7689CC9;
	Mon, 16 Nov 2020 14:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1C89C9A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 14:02:08 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id m9so17477956iox.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kfTo+s6Rfziyk28byc4y92qDcFzNCviKYnIcjhs+/0I=;
 b=GwhVHDU7Ggn4U1MZRMPEOIFwWKVi/fjuXVnE+Z0ttVk4CMnAUvNPxgWDyYsVRTzzrB
 IEDBFDWjikZ5b9XpbY2soqLweZIMkvaBTZVuL68aWSv2v+piaR5CrjZJwqb6u65I3C3x
 F2LTqJgmL3ESTY8XKW1xTrry+Jb9xGKOBkWRfJH+pv+CJv7yp9ugTbmY0RBDLjYdE9qE
 7o5DsKuVcpSmdY95qlVjK66YTlaHkhNO0Y3XA25ViOiz20tFNyilF72HIeNaEp8vT5sC
 eZformUlD/dCQYmXpWUtZ3S1tfpsWe7I7RX/290jzRaG9R4fdZA2OaTy12n942Hhp0Tf
 WYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kfTo+s6Rfziyk28byc4y92qDcFzNCviKYnIcjhs+/0I=;
 b=jgwy9yYPQ85FAyrVAw7h+UzBjWm9RQumbPKNjDghyF3xSaEJfEEUyXHlol1s6ff9WG
 TxLhfKfq3piYRK/52xqNaHfyutGaJAqqz5NyCTGdOGHUgZG7ciQ65WJ4EeN2kyMOajkR
 Vx90BMjNkttlmBvwhJt2Tfye7J4UTof3cCNONsiwjUFXba4bonVn94ZPEMHZqBQtVtrl
 pcG0H8zos5rO/thguBVJ5cl4Y4nanD66xeLtQsu/ZVQkcROMsMPX9VfKs07jfG0khCHE
 FKGZj2nqekZnQKE+of3N3MJdH4xYYJIoRF+lbLdz+Rb1DM5fT4pVuzKXefLONYnXO6YD
 GcuQ==
X-Gm-Message-State: AOAM533kXV+Fpug6nCuALWx6yJLJNqG8DQENHFaS3E+gIkFOfYeIGxaG
 W7emgkoat/WDlq/72RkXewM=
X-Google-Smtp-Source: ABdhPJzQXMIJJqNvSgT1PjOyketDIs7BVZ0i7N1jRL2oLuKxrYy0yhYwy6Lr+YgnxNn5QFg3aRO0Aw==
X-Received: by 2002:a05:6638:618:: with SMTP id
 g24mr11197277jar.53.1605535328250; 
 Mon, 16 Nov 2020 06:02:08 -0800 (PST)
Received: from smtp.gmail.com ([2607:fea8:56e0:6d60::c908])
 by smtp.gmail.com with ESMTPSA id p24sm11587224ill.59.2020.11.16.06.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 06:02:07 -0800 (PST)
Date: Mon, 16 Nov 2020 09:02:04 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm: Pass the full state to connectors atomic functions
Message-ID: <20201116140204.imo4t3judosqif2y@smtp.gmail.com>
References: <20201105173007.593960-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20201105173007.593960-1-maxime@cerno.tech>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 Leo Li <sunpeng.li@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1154936431=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1154936431==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n26kvx2fjtb5zkjb"
Content-Disposition: inline


--n26kvx2fjtb5zkjb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/05, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
>=20
> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
>=20
> Now that the CRTCs have been converted, let's move forward with the
> connectors to provide a consistent interface.
>=20
> The conversion was done using the coccinelle script below, and built test=
ed
> on all the drivers.

For the VKMS change:
Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c |  5 ++++-
>  drivers/gpu/drm/drm_atomic_helper.c                 |  8 ++++----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c         |  7 +++++--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c             |  5 ++++-
>  drivers/gpu/drm/vc4/vc4_txp.c                       |  4 +++-
>  drivers/gpu/drm/vkms/vkms_writeback.c               |  7 +++++--
>  include/drm/drm_modeset_helper_vtables.h            | 13 ++++++-------
>  7 files changed, 31 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index eee19edeeee5..f346cc74387f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -24,6 +24,7 @@
>   */
> =20
>  #include <linux/version.h>
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_dp_mst_helper.h>
>  #include <drm/drm_dp_helper.h>
> @@ -252,8 +253,10 @@ static int dm_dp_mst_get_modes(struct drm_connector =
*connector)
> =20
>  static struct drm_encoder *
>  dm_mst_atomic_best_encoder(struct drm_connector *connector,
> -			   struct drm_connector_state *connector_state)
> +			   struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
> +											 connector);
>  	struct drm_device *dev =3D connector->dev;
>  	struct amdgpu_device *adev =3D drm_to_adev(dev);
>  	struct amdgpu_crtc *acrtc =3D to_amdgpu_crtc(connector_state->crtc);
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index ddd0e3239150..ba1507036f26 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -122,7 +122,8 @@ static int handle_conflicting_encoders(struct drm_ato=
mic_state *state,
>  			continue;
> =20
>  		if (funcs->atomic_best_encoder)
> -			new_encoder =3D funcs->atomic_best_encoder(connector, new_conn_state);
> +			new_encoder =3D funcs->atomic_best_encoder(connector,
> +								 state);
>  		else if (funcs->best_encoder)
>  			new_encoder =3D funcs->best_encoder(connector);
>  		else
> @@ -345,8 +346,7 @@ update_connector_routing(struct drm_atomic_state *sta=
te,
>  	funcs =3D connector->helper_private;
> =20
>  	if (funcs->atomic_best_encoder)
> -		new_encoder =3D funcs->atomic_best_encoder(connector,
> -							 new_connector_state);
> +		new_encoder =3D funcs->atomic_best_encoder(connector, state);
>  	else if (funcs->best_encoder)
>  		new_encoder =3D funcs->best_encoder(connector);
>  	else
> @@ -1313,7 +1313,7 @@ static void drm_atomic_helper_commit_writebacks(str=
uct drm_device *dev,
> =20
>  		if (new_conn_state->writeback_job && new_conn_state->writeback_job->fb=
) {
>  			WARN_ON(connector->connector_type !=3D DRM_MODE_CONNECTOR_WRITEBACK);
> -			funcs->atomic_commit(connector, new_conn_state);
> +			funcs->atomic_commit(connector, old_state);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 64d885539e94..b879a0622ada 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -23,6 +23,7 @@
>   *
>   */
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
> @@ -706,11 +707,13 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *c=
onnector,
>  }
> =20
>  static struct drm_encoder *intel_mst_atomic_best_encoder(struct drm_conn=
ector *connector,
> -							 struct drm_connector_state *state)
> +							 struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
> +											 connector);
>  	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
>  	struct intel_dp *intel_dp =3D intel_connector->mst_port;
> -	struct intel_crtc *crtc =3D to_intel_crtc(state->crtc);
> +	struct intel_crtc *crtc =3D to_intel_crtc(connector_state->crtc);
> =20
>  	return &intel_dp->mst_encoders[crtc->pipe]->base.base;
>  }
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index b111fe24a06b..911c2cbe6aa3 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -32,6 +32,7 @@
>  #include <linux/hdmi.h>
>  #include <linux/component.h>
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
> @@ -1161,8 +1162,10 @@ nv50_msto_new(struct drm_device *dev, struct nv50_=
head *head, int id)
> =20
>  static struct drm_encoder *
>  nv50_mstc_atomic_best_encoder(struct drm_connector *connector,
> -			      struct drm_connector_state *connector_state)
> +			      struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
> +											 connector);
>  	struct nv50_mstc *mstc =3D nv50_mstc(connector);
>  	struct drm_crtc *crtc =3D connector_state->crtc;
> =20
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 34612edcabbd..8aa5220885f4 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -273,8 +273,10 @@ static int vc4_txp_connector_atomic_check(struct drm=
_connector *conn,
>  }
> =20
>  static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
> -					struct drm_connector_state *conn_state)
> +					struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *conn_state =3D drm_atomic_get_new_connector=
_state(state,
> +										    conn);
>  	struct vc4_txp *txp =3D connector_to_vc4_txp(conn);
>  	struct drm_gem_cma_object *gem;
>  	struct drm_display_mode *mode;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index 26b903926872..cafdc8463541 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
> =20
>  #include "vkms_drv.h"
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_writeback.h>
>  #include <drm/drm_probe_helper.h>
> @@ -99,8 +100,10 @@ static void vkms_wb_cleanup_job(struct drm_writeback_=
connector *connector,
>  }
> =20
>  static void vkms_wb_atomic_commit(struct drm_connector *conn,
> -				  struct drm_connector_state *state)
> +				  struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
> +											 conn);
>  	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(conn->dev);
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_writeback_connector *wb_conn =3D &output->wb_connector;
> @@ -116,7 +119,7 @@ static void vkms_wb_atomic_commit(struct drm_connecto=
r *conn,
>  	crtc_state->active_writeback =3D conn_state->writeback_job->priv;
>  	crtc_state->wb_pending =3D true;
>  	spin_unlock_irq(&output->composer_lock);
> -	drm_writeback_queue_job(wb_conn, state);
> +	drm_writeback_queue_job(wb_conn, connector_state);
>  }
> =20
>  static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs=
 =3D {
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_m=
odeset_helper_vtables.h
> index f2de050085be..16ff3fa148f5 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1044,9 +1044,8 @@ struct drm_connector_helper_funcs {
>  	 * NOTE:
>  	 *
>  	 * This function is called in the check phase of an atomic update. The
> -	 * driver is not allowed to change anything outside of the free-standing
> -	 * state objects passed-in or assembled in the overall &drm_atomic_state
> -	 * update tracking structure.
> +	 * driver is not allowed to change anything outside of the
> +	 * &drm_atomic_state update tracking structure passed in.
>  	 *
>  	 * RETURNS:
>  	 *
> @@ -1056,7 +1055,7 @@ struct drm_connector_helper_funcs {
>  	 * for this.
>  	 */
>  	struct drm_encoder *(*atomic_best_encoder)(struct drm_connector *connec=
tor,
> -						   struct drm_connector_state *connector_state);
> +						   struct drm_atomic_state *state);
> =20
>  	/**
>  	 * @atomic_check:
> @@ -1097,15 +1096,15 @@ struct drm_connector_helper_funcs {
>  	 *
>  	 * This hook is to be used by drivers implementing writeback connectors
>  	 * that need a point when to commit the writeback job to the hardware.
> -	 * The writeback_job to commit is available in
> -	 * &drm_connector_state.writeback_job.
> +	 * The writeback_job to commit is available in the new connector state,
> +	 * in &drm_connector_state.writeback_job.
>  	 *
>  	 * This hook is optional.
>  	 *
>  	 * This callback is used by the atomic modeset helpers.
>  	 */
>  	void (*atomic_commit)(struct drm_connector *connector,
> -			      struct drm_connector_state *state);
> +			      struct drm_atomic_state *state);
> =20
>  	/**
>  	 * @prepare_writeback_job:
> --=20
> 2.28.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--n26kvx2fjtb5zkjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl+yhlgACgkQWJzP/com
vP+CHRAAmbi1YpB1DfSPqVwRTmCeH8ztCXOkDaRvCKMFbiagfbQiWBaW1g3uwkO6
W/tY5tlbGIJepUKGHMaK2B863FahYuzSeK913+2mHYTCZEpUoNntkCIqFNBKqp2L
pPwoLQUWWXeCIoEYibYpbL2LPqkNTuHlFgJMGtbrybOzXcF1lylIuzK3XgfApjRT
/BUoHPXReWYBr4nydVK5apTTBlIvdxdTytC8IQ86vcbzNs3xprEOxrJ5nCRBhC6e
cPcotg8IM6Op6iLyxcmppUgkH75vhZPBDcndruf9RcyjSIbw5DwHZYFfsli/Rz6J
eeYXw6B8TK/ewGosRgpXmUkv6D8G1f7nx4bfz9f5qLdAjtDDeANjkTY8V62405x0
AYgTGstYWjwxIudBPQ8Io06lsbOO7OQskk50XfsskDl17NzKGgGqRCBHG4+Q6gDM
BK3LzZ6gY5uX7mhxZhNvDEQ58/g4IrgI4I+cwgBLIp7GpCT/BgHKPiEfPl8XOrhk
IcgzvTdABhlg1CPzggddMWVc5dsTsvqHEZsuE/hRLHhcgdzWTeG3IpBJMMBzJERW
gDOXStL00s6Hc9aw+HFA9o2PjnoYReotRQjlqhWB6ki2yo1K0Amhci7yzY7AODow
/ccOhWhBUeMEaiFMQtbXqrzX+ugo+y7Q1TqIW2J4tQkhv0SPJAA=
=iDgm
-----END PGP SIGNATURE-----

--n26kvx2fjtb5zkjb--

--===============1154936431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1154936431==--
