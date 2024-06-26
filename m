Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951309181C4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF96710E03D;
	Wed, 26 Jun 2024 13:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mZo0cwiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A26410E06B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 13:07:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0FD36619BF;
 Wed, 26 Jun 2024 13:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404FCC32786;
 Wed, 26 Jun 2024 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719407275;
 bh=CR/nuzzaq8rbJhJkOw2IbAD3ShbDjO/1VG2so/cJFFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZo0cwiPajn8p75hKTzVY7jgXowSZN5KncxQLT8/Qj4pLRzbRwoc/O7qoHRjOrPYi
 hxgAjpQoLBvF6g3me3io7hk+ClhCfMQQitUCSFPOJxD00+DIa8a29Q71rbpfCdta6s
 XzAjXnbgjKQOaefSEKOXTFDONAWcp8R73mwYQ6hCTUPpJjsGIfxZa6hXvCamPSk6yC
 eJhEn0LU5+huSYDlDeUjfGdtFLMx/pEoi5rZ7RVH265g/khYqhEshp5DNT5vwScaeU
 eyPoFhQRfa7liSvwFPcQ0kS+N4E7Cj5fFpyibnOSnvlJ8xbBIXhQ5tngO8L4NQv4S8
 0ulRPIaWYIMnA==
Date: Wed, 26 Jun 2024 15:07:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v4 10/11] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <20240626-tremendous-fantastic-rhino-ab73fc@houat>
References: <20240622110929.3115714-1-a-bhatia1@ti.com>
 <20240622110929.3115714-11-a-bhatia1@ti.com>
 <e7dde09d-ceb0-4fb0-a23e-6aaba8f1beb3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4t3r6z362poaxhce"
Content-Disposition: inline
In-Reply-To: <e7dde09d-ceb0-4fb0-a23e-6aaba8f1beb3@ideasonboard.com>
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


--4t3r6z362poaxhce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 02:28:57PM GMT, Tomi Valkeinen wrote:
> On 22/06/2024 14:09, Aradhya Bhatia wrote:
> > Move the bridge pre_enable call before crtc enable, and the bridge
> > post_disable call after the crtc disable.
> >=20
> > The sequence of enable after this patch will look like:
> >=20
> > 	bridge[n]_pre_enable
> > 	...
> > 	bridge[1]_pre_enable
> >=20
> > 	crtc_enable
> > 	encoder_enable
> >=20
> > 	bridge[1]_enable
> > 	...
> > 	bridge[n]__enable
> >=20
> > and vice-versa for the bridge chain disable sequence.
> >=20
> > The definition of bridge pre_enable hook says that,
> > "The display pipe (i.e. clocks and timing signals) feeding this bridge
> > will not yet be running when this callback is called".
> >=20
> > Since CRTC is also a source feeding the bridge, it should not be enabled
> > before the bridges in the pipeline are pre_enabled. Fix that by
> > re-ordering the sequence of bridge pre_enable and bridge post_disable.
> >=20
> > Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> > ---
> >   drivers/gpu/drm/drm_atomic_helper.c | 165 ++++++++++++++++++----------
> >   include/drm/drm_atomic_helper.h     |   7 ++
> >   2 files changed, 114 insertions(+), 58 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index fb97b51b38f1..e8ad08634f58 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -74,6 +74,7 @@
> >    * also shares the &struct drm_plane_helper_funcs function table with=
 the plane
> >    * helpers.
> >    */
> > +
>=20
> Extra change.
>=20
> >   static void
> >   drm_atomic_helper_plane_changed(struct drm_atomic_state *state,
> >   				struct drm_plane_state *old_plane_state,
> > @@ -1122,11 +1123,11 @@ crtc_needs_disable(struct drm_crtc_state *old_s=
tate,
> >   }
> >   static void
> > -disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_s=
tate)
> > +disable_encoder_brige_chain(struct drm_device *dev, struct drm_atomic_=
state *old_state,
> > +			    enum bridge_chain_operation_type op_type)
> >   {
> >   	struct drm_connector *connector;
> >   	struct drm_connector_state *old_conn_state, *new_conn_state;
> > -	struct drm_crtc *crtc;
> >   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> >   	int i;
> > @@ -1163,32 +1164,55 @@ disable_outputs(struct drm_device *dev, struct =
drm_atomic_state *old_state)
> >   		if (WARN_ON(!encoder))
> >   			continue;
> > -		funcs =3D encoder->helper_private;
> > -
> > -		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> > -			       encoder->base.id, encoder->name);
> > -
> >   		/*
> >   		 * Each encoder has at most one connector (since we always steal
> >   		 * it away), so we won't call disable hooks twice.
> >   		 */
> >   		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
> > -		drm_atomic_bridge_chain_disable(bridge, old_state);
> > -		/* Right function depends upon target state. */
> > -		if (funcs) {
> > -			if (funcs->atomic_disable)
> > -				funcs->atomic_disable(encoder, old_state);
> > -			else if (new_conn_state->crtc && funcs->prepare)
> > -				funcs->prepare(encoder);
> > -			else if (funcs->disable)
> > -				funcs->disable(encoder);
> > -			else if (funcs->dpms)
> > -				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> > -		}
> > +		switch (op_type) {
> > +		case DRM_ENCODER_BRIDGE_DISABLE:
> > +			funcs =3D encoder->helper_private;
> > +
> > +			drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> > +				       encoder->base.id, encoder->name);
> > +
> > +			drm_atomic_bridge_chain_disable(bridge, old_state);
> > +
> > +			/* Right function depends upon target state. */
> > +			if (funcs) {
> > +				if (funcs->atomic_disable)
> > +					funcs->atomic_disable(encoder, old_state);
> > +				else if (new_conn_state->crtc && funcs->prepare)
> > +					funcs->prepare(encoder);
> > +				else if (funcs->disable)
> > +					funcs->disable(encoder);
> > +				else if (funcs->dpms)
> > +					funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> > +			}
> > +
> > +			break;
> > +
> > +		case DRM_BRIDGE_POST_DISABLE:
> > +			drm_atomic_bridge_chain_post_disable(bridge, old_state);
> > -		drm_atomic_bridge_chain_post_disable(bridge, old_state);
> > +			break;
> > +
> > +		default:
> > +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_ty=
pe);
> > +			break;
> > +		}
> >   	}
> > +}
> > +
> > +static void
> > +disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_s=
tate)
> > +{
> > +	struct drm_crtc *crtc;
> > +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> > +	int i;
> > +
> > +	disable_encoder_brige_chain(dev, old_state, DRM_ENCODER_BRIDGE_DISABL=
E);
> >   	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_c=
rtc_state, i) {
> >   		const struct drm_crtc_helper_funcs *funcs;
> > @@ -1234,6 +1258,8 @@ disable_outputs(struct drm_device *dev, struct dr=
m_atomic_state *old_state)
> >   		if (ret =3D=3D 0)
> >   			drm_crtc_vblank_put(crtc);
> >   	}
> > +
> > +	disable_encoder_brige_chain(dev, old_state, DRM_BRIDGE_POST_DISABLE);
> >   }
> >   /**
> > @@ -1445,6 +1471,64 @@ static void drm_atomic_helper_commit_writebacks(=
struct drm_device *dev,
> >   	}
> >   }
> > +static void
> > +enable_encoder_brige_chain(struct drm_device *dev, struct drm_atomic_s=
tate *old_state,
> > +			   enum bridge_chain_operation_type op_type)
> > +{
> > +	struct drm_connector *connector;
> > +	struct drm_connector_state *new_conn_state;
> > +	int i;
> > +
> > +	for_each_new_connector_in_state(old_state, connector, new_conn_state,=
 i) {
> > +		const struct drm_encoder_helper_funcs *funcs;
> > +		struct drm_encoder *encoder;
> > +		struct drm_bridge *bridge;
> > +
> > +		if (!new_conn_state->best_encoder)
> > +			continue;
> > +
> > +		if (!new_conn_state->crtc->state->active ||
> > +		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> > +			continue;
> > +
> > +		encoder =3D new_conn_state->best_encoder;
> > +
> > +		/*
> > +		 * Each encoder has at most one connector (since we always steal
> > +		 * it away), so we won't call enable hooks twice.
> > +		 */
> > +		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
> > +
> > +		switch (op_type) {
> > +		case DRM_BRIDGE_PRE_ENABLE:
> > +			drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> > +			break;
> > +
> > +		case DRM_ENCODER_BRIDGE_ENABLE:
> > +			funcs =3D encoder->helper_private;
> > +
> > +			drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> > +				       encoder->base.id, encoder->name);
> > +
> > +			if (funcs) {
> > +				if (funcs->atomic_enable)
> > +					funcs->atomic_enable(encoder, old_state);
> > +				else if (funcs->enable)
> > +					funcs->enable(encoder);
> > +				else if (funcs->commit)
> > +					funcs->commit(encoder);
> > +			}
> > +
> > +			drm_atomic_bridge_chain_enable(bridge, old_state);
> > +			break;
> > +
> > +		default:
> > +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_ty=
pe);
> > +			break;
> > +		}
> > +	}
> > +}
> > +
> >   /**
> >    * drm_atomic_helper_commit_modeset_enables - modeset commit to enabl=
e outputs
> >    * @dev: DRM device
> > @@ -1465,10 +1549,10 @@ void drm_atomic_helper_commit_modeset_enables(s=
truct drm_device *dev,
> >   	struct drm_crtc *crtc;
> >   	struct drm_crtc_state *old_crtc_state;
> >   	struct drm_crtc_state *new_crtc_state;
> > -	struct drm_connector *connector;
> > -	struct drm_connector_state *new_conn_state;
> >   	int i;
> > +	enable_encoder_brige_chain(dev, old_state, DRM_BRIDGE_PRE_ENABLE);
> > +
> >   	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_c=
rtc_state, i) {
> >   		const struct drm_crtc_helper_funcs *funcs;
> > @@ -1491,42 +1575,7 @@ void drm_atomic_helper_commit_modeset_enables(st=
ruct drm_device *dev,
> >   		}
> >   	}
> > -	for_each_new_connector_in_state(old_state, connector, new_conn_state,=
 i) {
> > -		const struct drm_encoder_helper_funcs *funcs;
> > -		struct drm_encoder *encoder;
> > -		struct drm_bridge *bridge;
> > -
> > -		if (!new_conn_state->best_encoder)
> > -			continue;
> > -
> > -		if (!new_conn_state->crtc->state->active ||
> > -		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> > -			continue;
> > -
> > -		encoder =3D new_conn_state->best_encoder;
> > -		funcs =3D encoder->helper_private;
> > -
> > -		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> > -			       encoder->base.id, encoder->name);
> > -
> > -		/*
> > -		 * Each encoder has at most one connector (since we always steal
> > -		 * it away), so we won't call enable hooks twice.
> > -		 */
> > -		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
> > -		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> > -
> > -		if (funcs) {
> > -			if (funcs->atomic_enable)
> > -				funcs->atomic_enable(encoder, old_state);
> > -			else if (funcs->enable)
> > -				funcs->enable(encoder);
> > -			else if (funcs->commit)
> > -				funcs->commit(encoder);
> > -		}
> > -
> > -		drm_atomic_bridge_chain_enable(bridge, old_state);
> > -	}
> > +	enable_encoder_brige_chain(dev, old_state, DRM_ENCODER_BRIDGE_ENABLE);
> >   	drm_atomic_helper_commit_writebacks(dev, old_state);
> >   }
> > diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_h=
elper.h
> > index 9aa0a05aa072..b45a175a9f8a 100644
> > --- a/include/drm/drm_atomic_helper.h
> > +++ b/include/drm/drm_atomic_helper.h
> > @@ -43,6 +43,13 @@
> >    */
> >   #define DRM_PLANE_NO_SCALING (1<<16)
> > +enum bridge_chain_operation_type {
> > +	DRM_BRIDGE_PRE_ENABLE,
> > +	DRM_BRIDGE_POST_DISABLE,
> > +	DRM_ENCODER_BRIDGE_ENABLE,
> > +	DRM_ENCODER_BRIDGE_DISABLE,
> > +};
>=20
> Why are the last two "DRM_ENCODER"?
>=20
> I don't like the enum... Having "enum bridge_chain_operation_type" as a
> parameter to a function looks like one can pass any of the enum's values,
> which is not the case.
>=20
> How about an enum with just two values:
>=20
> DRM_BRIDGE_PRE_ENABLE_POST_DISABLE
> DRM_BRIDGE_ENABLE_DISABLE

I think I'd go a step further and ask why do we need that rework in the
first place. We had a discussion about changing the time the CRTC is
enabled compared to bridges, but it's not clear, nor explained, why we
need to do that rework in the first place.

It should even be two patches imo.

Maxime

--4t3r6z362poaxhce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnwSqAAKCRDj7w1vZxhR
xd4RAP93iBQzZ3HToXyl6ivtKebMLjS0pnsOHcLe9iVoiv309QD/fVKA/el399Eb
UJra2zlfOxZR6MwK75UpN8EjCbBuIQI=
=CxiF
-----END PGP SIGNATURE-----

--4t3r6z362poaxhce--
