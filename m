Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E5B99422
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4239A10E6D5;
	Wed, 24 Sep 2025 09:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BHUnwm+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20F510E6D5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:56:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5295F429C5;
 Wed, 24 Sep 2025 09:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D6CC113CF;
 Wed, 24 Sep 2025 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758707781;
 bh=ClDSNsxEPhNF0ekN1XGQiiFq78GuZoy43QGu+X9ArfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BHUnwm+fbgsWeruPRRBkohrMPxiFAa2Y1mByEeOvW5abAxIwe5C5KILW1oR7GxrPJ
 ZTlGvOex40V7flGhwLtAu3pjOxT5faA8eCvAcPGGwu6rTQDm7KDfrSldpEDcnGKaDp
 yW/Fpv5m423C/h7ojVg2KgDBP5NkIY7hiYh3sGPvnY04H8PhjZdAX6YxyIOIvNSlp6
 n8xMVNwZhIhnzcVkVrDscJKKU1fNzOC3N3fpdPikz+1DLOYA8wKXVrAz+CDRoIm1hQ
 0LEFSyaeIN/OmOCiUn2EPxKgZoe3056nThOciruBx3YNgp+AWDnFks9HTGEcQCJk6R
 NWfP86VRN6Yyg==
Date: Wed, 24 Sep 2025 11:56:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <20250924-rational-dalmatian-of-luxury-f8594f@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <03240fae-544f-4753-96c5-a116b4b5a318@suse.de>
 <20250915-active-placid-bustard-6e1faa@penduick>
 <2ry3txigq3jyivtyz7i4c76g74vdgvlozsjkeswxalhu2vs5yx@jqswyjle632h>
 <20250923-debonair-earwig-of-abracadabra-940fa8@penduick>
 <osdt4teotc6qvja734dyo7be35nzy5lo4sw4dcniaqicqb3o5l@gabq5adeliha>
 <20250923103223.GA15509@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="l34x2ubugpihgtc4"
Content-Disposition: inline
In-Reply-To: <20250923103223.GA15509@pendragon.ideasonboard.com>
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


--l34x2ubugpihgtc4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
MIME-Version: 1.0

On Tue, Sep 23, 2025 at 01:32:23PM +0300, Laurent Pinchart wrote:
> On Tue, Sep 23, 2025 at 01:28:57PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 23, 2025 at 11:38:17AM +0200, Maxime Ripard wrote:
> > > On Mon, Sep 15, 2025 at 09:38:44PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 15, 2025 at 10:42:22AM +0200, Maxime Ripard wrote:
> > > > > On Tue, Sep 02, 2025 at 03:44:54PM +0200, Thomas Zimmermann wrote:
> > > > > > > +/**
> > > > > > > + * drm_atomic_build_readout_state - Creates an initial state=
 from the hardware
> > > > > > > + * @dev: DRM device to build the state for
> > > > > > > + *
> > > > > > > + * This function allocates a &struct drm_atomic_state, calls=
 the
> > > > > > > + * atomic_readout_state callbacks, and fills the global stat=
e old states
> > > > > > > + * by what the callbacks returned.
> > > > > > > + *
> > > > > > > + * Returns:
> > > > > > > + *
> > > > > > > + * A partially initialized &struct drm_atomic_state on succe=
ss, an error
> > > > > > > + * pointer otherwise.
> > > > > > > + */
> > > > > > > +static struct drm_atomic_state *
> > > > > > > +drm_atomic_build_readout_state(struct drm_device *dev)
> > > > > > > +{
> > > > > > > +	struct drm_connector_list_iter conn_iter;
> > > > > > > +	struct drm_atomic_state *state;
> > > > > > > +	struct drm_mode_config *config =3D
> > > > > > > +		&dev->mode_config;
> > > > > > > +	struct drm_connector *connector;
> > > > > > > +	struct drm_printer p =3D
> > > > > > > +		drm_info_printer(dev->dev);
> > > > > > > +	struct drm_encoder *encoder;
> > > > > > > +	struct drm_plane *plane;
> > > > > > > +	struct drm_crtc *crtc;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	drm_dbg_kms(dev, "Starting to build atomic state from hardw=
are state.\n");
> > > > > > > +
> > > > > > > +	state =3D drm_atomic_state_alloc(dev);
> > > > > > > +	if (WARN_ON(!state))
> > > > > > > +		return ERR_PTR(-ENOMEM);
> > > > > > > +
> > > > > > > +	state->connectors =3D kcalloc(config->num_connector, sizeof=
(*state->connectors), GFP_KERNEL);
> > > > > > > +	if (WARN_ON(!state->connectors)) {
> > > > > > > +		ret =3D -ENOMEM;
> > > > > > > +		goto err_state_put;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	state->private_objs =3D kcalloc(count_private_obj(dev), siz=
eof(*state->private_objs), GFP_KERNEL);
> > > > > > > +	if (WARN_ON(!state->private_objs)) {
> > > > > > > +		ret =3D -ENOMEM;
> > > > > > > +		goto err_state_put;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	drm_for_each_crtc(crtc, dev) {
> > > > > > > +		const struct drm_crtc_funcs *crtc_funcs =3D
> > > > > > > +			crtc->funcs;
> > > > > > > +		struct drm_crtc_state *crtc_state;
> > > > > > > +
> > > > > > > +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->na=
me);
> > > > > > > +
> > > > > > > +		if (crtc_funcs->atomic_readout_state) {
> > > > > > > +			crtc_state =3D crtc_funcs->atomic_readout_state(crtc);
> > > > > > > +		} else if (crtc_funcs->reset) {
> > > > > > > +			crtc_funcs->reset(crtc);
> > > > > > > +
> > > > > > > +			/*
> > > > > > > +			 * We don't want to set crtc->state field yet. Let's save=
 and clear it up.
> > > > > > > +			 */
> > > > > > > +			crtc_state =3D crtc->state;
> > > > > > > +			crtc->state =3D NULL;
> > > > > >=20
> > > > > > Chancing the crtc->state pointer behind the back of the reset c=
allback seems
> > > > > > fragile. We never how if some other piece of the driver refers =
to it
> > > > > > (although illegally).
> > > > >=20
> > > > > I agree that it's clunky. I'm not sure who would use it at this p=
oint
> > > > > though: we're in the middle of the drm_mode_config_reset(), so the
> > > > > drivers' involvement is pretty minimal.
> > > > >=20
> > > > > I did wonder if changing reset to return the object instead of se=
tting
> > > > > $OBJECT->state would be a better interface?
> > > > >=20
> > > > > > For now, wouldn't it be better to require a read-out helper for=
 all elements
> > > > > > of the driver's mode-setting pipeline?=A0 The trivial implement=
ation would
> > > > > > copy the existing reset function and keep crtc->state to NULL.
> > > > >=20
> > > > > I also considered that, but I'm not sure we can expect bridges to=
 have
> > > > > readout hooks filled for every configuration in the wild.
> > > > >=20
> > > > > But maybe we can look during drm_mode_config_reset() at whether a=
ll the
> > > > > objects have their hook filled, and if not fall back on reset for
> > > > > everything.
> > > > >=20
> > > > > It would make the implementation easier, but missing bridges
> > > > > implementations would trigger a mode change when it might actuall=
y work
> > > > > just fine since bridge state is pretty minimal.
> > > >=20
> > > > DP bridge drivers have a pretty big state (DPCD and all the feature=
s).
> > >=20
> > > I meant drm_bridge_state. Subclasses would have their own implementat=
ion
> > > anyway.
> > >=20
> > > > Other bridge drivers randomly leak state to the non-state structs.
> > >=20
> > > I'm not sure what you mean by that though. Can you expand?
> >=20
> > I think I've seen bridge drivers which stored subclassed drm_bridge
> > instead of drm_bridge_state or stored the data in the long-living data
> > structures. YEs, that's a bug, which should be fixed on its own.
>=20
> There's one exception to the "all state in state structure" rules if I
> understand things correctly (and I'm mentioning it here partly to be
> corrected if my understanding is wrong). Active state data that needs to
> be accessed from a non-sleepable context need to be copied to the
> device-specific structure when the state is applied, as we can't take
> the mutex protecting state access there. I'd expect that to be uncommon
> for bridges.

It's not really about non-sleepable, it's more about everything that is
outside of DRM's locking scheme. So interrupt handlers are one of those
indeed, but CEC, ALSA, debugfs, etc. also are.

Maxime

--l34x2ubugpihgtc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNPAQQAKCRAnX84Zoj2+
drS5AYCbACSflp9Szn1uMHdWcNsZyepCh0EHnTJlkgZlttxxcQSgHbHyoJH4tjRK
MTUqf+kBf2qd7ZxVEze61Lzugcyt+rUnFRWCRrOWHflQFmsgouGP93CYF/gE4/4M
SMpizdLYSw==
=5Yrb
-----END PGP SIGNATURE-----

--l34x2ubugpihgtc4--
