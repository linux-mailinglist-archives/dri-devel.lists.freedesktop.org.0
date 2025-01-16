Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B146A1358B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E914B10E8FE;
	Thu, 16 Jan 2025 08:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NuC6wbCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EE410E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:38:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C13CDA41211;
 Thu, 16 Jan 2025 08:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FB3C4CEDF;
 Thu, 16 Jan 2025 08:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737016728;
 bh=1BPT9f+lHZ0y0qnRrOLKHUEKCM0mtfelK2dM9lB4Isg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NuC6wbCJueZiFs27OlsG7T4SLfZwK3Jo/SkmeMVR8/AJTMshTXtWx3fcw5HR7ZSu1
 Lmi9crqFXpP5qeXnjjscXX9+QnYUsP4gMKp6zFeDfCrP0LKhyqqumZ4GXbkWArvwuk
 TRNlW9Pynj7HoW+NPe6gk2tJt0nh/dUfs/bBj2Mt1dQKJub/9QIyZ08/u8JwUCQhZQ
 Ma8lL3S+AQTFTyt7qQcYkMTyg5szKm2KCVRB71UrgeZX3L1M8J8y658cxmO6TxUdF+
 YrOEn70Lv22WTWhGKOPoYVwXYzEBZHPiB4k2NfdRdOU5IDYJ5yfuVadNfdPD3Jjj7w
 laH0LXoESKPxQ==
Date: Thu, 16 Jan 2025 09:38:45 +0100
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
Message-ID: <20250116-archetypal-bulldog-of-expression-fcc937@houat>
References: <20250108101907.410456-1-herve.codina@bootlin.com>
 <20250108101907.410456-4-herve.codina@bootlin.com>
 <20250114-juicy-authentic-mushroom-cfcdfb@houat>
 <20250114135456.5366eb2a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="suovhgdrswmkdr5r"
Content-Disposition: inline
In-Reply-To: <20250114135456.5366eb2a@bootlin.com>
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


--suovhgdrswmkdr5r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
MIME-Version: 1.0

On Tue, Jan 14, 2025 at 01:54:56PM +0100, Herve Codina wrote:
> Hi Maxime,
>=20
> On Tue, 14 Jan 2025 08:40:51 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> ...
>=20
> > > =20
> > > +static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
> > > +{
> > > +	struct drm_atomic_state *state =3D ERR_PTR(-EINVAL);
> > > +	struct drm_device *dev =3D sn65dsi83->bridge.dev;
> > > +	struct drm_connector_state *connector_state;
> > > +	struct drm_modeset_acquire_ctx ctx;
> > > +	struct drm_connector *connector;
> > > +	int err;
> > > +
> > > +	/*
> > > +	 * Reset active outputs of the related CRTC.
> > > +	 *
> > > +	 * This way, drm core will reconfigure each components in the CRTC
> > > +	 * outputs path. In our case, this will force the previous componen=
t to
> > > +	 * go back in LP11 mode and so allow the reconfiguration of SN64DSI=
83
> > > +	 * bridge.
> > > +	 *
> > > +	 * Keep the lock during the whole operation to be atomic.
> > > +	 */
> > > +
> > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > +
> > > +	state =3D drm_atomic_helper_duplicate_state(dev, &ctx);
> > > +	if (IS_ERR(state)) {
> > > +		err =3D PTR_ERR(state);
> > > +		goto unlock;
> > > +	} =20
> >=20
> > No, you must not allocate a new state for this, you need to reuse the
> > existing state. You'll find it in bridge->base.state->state.
>=20
> Thanks for pointing that. I didn't know about bridge->base.state->state.
>=20
> I will use that if using the state is still relevant (see next comment).
>=20
> >=20
> > > +	state->acquire_ctx =3D &ctx;
> > > +
> > > +	connector =3D drm_atomic_get_old_connector_for_encoder(state,
> > > +							     sn65dsi83->bridge.encoder);
> > > +	if (!connector) {
> > > +		err =3D -EINVAL;
> > > +		goto unlock;
> > > +	}
> > > +
> > > +	connector_state =3D drm_atomic_get_connector_state(state, connector=
);
> > > +	if (IS_ERR(connector_state)) {
> > > +		err =3D PTR_ERR(connector_state);
> > > +		goto unlock;
> > > +	}
> > > +
> > > +	err =3D drm_atomic_helper_reset_pipe(connector_state->crtc, &ctx);
> > > +	if (err < 0)
> > > +		goto unlock; =20
> >=20
> > And you'll find the crtc in bridge->encoder->crtc.
>=20
> I am a bit confused. I looked at the drm_encoder structure [1] and the cr=
tc
> field available in this structure should not be used by atomic drivers. T=
hey
> should rely on &drm_connector_state.crtc.

You're right, it's deprecated but used by most bridges anyway.

I made a series of changes after reviewing your series to address some
issues with the current bridge API, most notably

https://lore.kernel.org/dri-devel/20250115-bridge-connector-v1-25-9a2fecd88=
6a6@kernel.org/

> In my case, I have the feeling that I should get the ctrc from the current
> state (i.e. bridge->base.state->state) using the sequence provided in this
> current patch:
>   Retrieve the connector with drm_atomic_get_old_connector_for_encoder()

Retrieving the old connector makes no sense though. It's the connector
that was formerly associated with your encoder. It might work, it might
not, it's not what you're looking for.

>   Retrieve the connector state with drm_atomic_get_connector_state()

drm_atomic_get_connector_state will allocate and pull the connector
state into the drm_atomic_state, even if it wasn't part of it before, so
it's not great. And you don't need it in the first place, you only need
the current active CRTC.

> but you pointed out the bridge->encoder->crtc field.
>
> Should I use this field or use the &drm_connector_state.crtc with the drm
> connector state retrieved from bridge->base.state->state using the propos=
ed
> sequence?

Having access to the connector isn't really easy either. Hopefully that
patch above should help there.

Maxime

--suovhgdrswmkdr5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4jFlQAKCRAnX84Zoj2+
dh+FAX9hbjNlbBSgS+VtZs4BfPZE4ye7VgdH95pfSb6gLEriHG3ZDbvVKltuE8fb
2OeAxYABgIF5aRoqURKqKSvqdh1w6EuGgHjJLbtSnK+8FJnL5ohV55MDiivKz+BT
wAceAYXIdw==
=ELH7
-----END PGP SIGNATURE-----

--suovhgdrswmkdr5r--
