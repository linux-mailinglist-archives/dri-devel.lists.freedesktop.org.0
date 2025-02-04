Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA7A2758B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEFF10E159;
	Tue,  4 Feb 2025 15:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jrp2BY3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A31E10E159
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:17:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D7618A42892;
 Tue,  4 Feb 2025 15:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A249C4CEE4;
 Tue,  4 Feb 2025 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738682232;
 bh=8dxSqhdGv1jObMZqZKWAH4y86KPxvtCDFwx+3u4Cv+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jrp2BY3TKgFArcO5hLjXV0PcmsjE9bxD2UUFM45laY+uE2rE7AB0+DNR2Za2xVlZ3
 rwcuyuQvAGH9/jqGIVG/DuX5D0zLkQriSGV8A7sC0/VkIOBggBayWx/QoDGzqYplqL
 Vb+Xs9cBgwp0PX00nCz9+sgWQGOAS7Eu/GTbsmVdywEprqfRneN52q/D2aCuUY3RbV
 umYP+rU1XfrqAyvLA18q7LKsarzv0axEkrT40J0xInoBcyHzTVVYDDSDXXXZ8pDwfS
 L6reO5OTbdSip/WHYi8UObJZ/n1ChaK+1QGTDvDBJVUt5I+Gq476a8LJppwt13rYwo
 F0y/v94HTmQWQ==
Date: Tue, 4 Feb 2025 16:17:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20250204-chocolate-lionfish-of-luck-10ebb8@houat>
References: <20250108101907.410456-1-herve.codina@bootlin.com>
 <20250108101907.410456-4-herve.codina@bootlin.com>
 <20250114-juicy-authentic-mushroom-cfcdfb@houat>
 <20250114135456.5366eb2a@bootlin.com>
 <20250116-archetypal-bulldog-of-expression-fcc937@houat>
 <20250117091213.647bf0e6@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5dgjstsqjg35osul"
Content-Disposition: inline
In-Reply-To: <20250117091213.647bf0e6@bootlin.com>
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


--5dgjstsqjg35osul
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
MIME-Version: 1.0

Hi,

On Fri, Jan 17, 2025 at 09:12:13AM +0100, Herve Codina wrote:
> Hi Maxime,
>=20
> On Thu, 16 Jan 2025 09:38:45 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Tue, Jan 14, 2025 at 01:54:56PM +0100, Herve Codina wrote:
> > > Hi Maxime,
> > >=20
> > > On Tue, 14 Jan 2025 08:40:51 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >=20
> > > ...
> > >  =20
> > > > > =20
> > > > > +static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
> > > > > +{
> > > > > +	struct drm_atomic_state *state =3D ERR_PTR(-EINVAL);
> > > > > +	struct drm_device *dev =3D sn65dsi83->bridge.dev;
> > > > > +	struct drm_connector_state *connector_state;
> > > > > +	struct drm_modeset_acquire_ctx ctx;
> > > > > +	struct drm_connector *connector;
> > > > > +	int err;
> > > > > +
> > > > > +	/*
> > > > > +	 * Reset active outputs of the related CRTC.
> > > > > +	 *
> > > > > +	 * This way, drm core will reconfigure each components in the C=
RTC
> > > > > +	 * outputs path. In our case, this will force the previous comp=
onent to
> > > > > +	 * go back in LP11 mode and so allow the reconfiguration of SN6=
4DSI83
> > > > > +	 * bridge.
> > > > > +	 *
> > > > > +	 * Keep the lock during the whole operation to be atomic.
> > > > > +	 */
> > > > > +
> > > > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > > > +
> > > > > +	state =3D drm_atomic_helper_duplicate_state(dev, &ctx);
> > > > > +	if (IS_ERR(state)) {
> > > > > +		err =3D PTR_ERR(state);
> > > > > +		goto unlock;
> > > > > +	}   =20
> > > >=20
> > > > No, you must not allocate a new state for this, you need to reuse t=
he
> > > > existing state. You'll find it in bridge->base.state->state. =20
> > >=20
> > > Thanks for pointing that. I didn't know about bridge->base.state->sta=
te.
> > >=20
> > > I will use that if using the state is still relevant (see next commen=
t).
> > >  =20
> > > >  =20
> > > > > +	state->acquire_ctx =3D &ctx;
> > > > > +
> > > > > +	connector =3D drm_atomic_get_old_connector_for_encoder(state,
> > > > > +							     sn65dsi83->bridge.encoder);
> > > > > +	if (!connector) {
> > > > > +		err =3D -EINVAL;
> > > > > +		goto unlock;
> > > > > +	}
> > > > > +
> > > > > +	connector_state =3D drm_atomic_get_connector_state(state, conne=
ctor);
> > > > > +	if (IS_ERR(connector_state)) {
> > > > > +		err =3D PTR_ERR(connector_state);
> > > > > +		goto unlock;
> > > > > +	}
> > > > > +
> > > > > +	err =3D drm_atomic_helper_reset_pipe(connector_state->crtc, &ct=
x);
> > > > > +	if (err < 0)
> > > > > +		goto unlock;   =20
> > > >=20
> > > > And you'll find the crtc in bridge->encoder->crtc. =20
> > >=20
> > > I am a bit confused. I looked at the drm_encoder structure [1] and th=
e crtc
> > > field available in this structure should not be used by atomic driver=
s. They
> > > should rely on &drm_connector_state.crtc. =20
> >=20
> > You're right, it's deprecated but used by most bridges anyway.
> >=20
> > I made a series of changes after reviewing your series to address some
> > issues with the current bridge API, most notably
> >=20
> > https://lore.kernel.org/dri-devel/20250115-bridge-connector-v1-25-9a2fe=
cd886a6@kernel.org/
>=20
> Thanks for pointing that, indeed, it clarify many things!
>=20
> >=20
> > > In my case, I have the feeling that I should get the ctrc from the cu=
rrent
> > > state (i.e. bridge->base.state->state) using the sequence provided in=
 this
> > > current patch:
> > >   Retrieve the connector with drm_atomic_get_old_connector_for_encode=
r() =20
> >=20
> > Retrieving the old connector makes no sense though. It's the connector
> > that was formerly associated with your encoder. It might work, it might
> > not, it's not what you're looking for.
> >=20
> > >   Retrieve the connector state with drm_atomic_get_connector_state() =
=20
> >=20
> > drm_atomic_get_connector_state will allocate and pull the connector
> > state into the drm_atomic_state, even if it wasn't part of it before, so
> > it's not great. And you don't need it in the first place, you only need
> > the current active CRTC.
>=20
> Yes, I agree with that, I only need the active CRTC.
>=20
> I tried to get the current atomic_state from:
>   1) bridge->base.state->state
>   2) drm_bridge_state->base.state
>=20
> In both cases, it is NULL. Looking at Sima's reply in your series
> explained that:
>   https://lore.kernel.org/dri-devel/Z4juJy7kKPbI2BDb@phenom.ffwll.local/
>=20
> If I understood correctly those pointers are explicitly cleared.
>=20
> So, with all of that, either:
>   a) I wait for your series to be applied in order to use your the crtc f=
ield from
>      drm_bridge_state added by:
>        https://lore.kernel.org/dri-devel/20250115-bridge-connector-v1-25-=
9a2fecd886a6@kernel.org/#t
>   b) I use the old school bridge->encoder->crtc for the moment
>=20
> Do you mind if I use the bridge->encoder->crtc way for the next iteration=
 of
> my series?

Yeah, it makes sense.

Still, it would be great if you could test my series on your setup and see =
if it helps :)

Maxime

--5dgjstsqjg35osul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6IvdQAKCRAnX84Zoj2+
dhSnAX49ruA8shYuYtyWizI8d6OWPbGVqN7EVpywtSHT76p7DCa5TJI8oaIOEcz7
DNxOQPgBf1X+4gfZabxbdrPYmgIM/B74ee9rJtAd55RdX1jITrfwyFpUk5ca88vr
wK9f74O2kw==
=bmdb
-----END PGP SIGNATURE-----

--5dgjstsqjg35osul--
