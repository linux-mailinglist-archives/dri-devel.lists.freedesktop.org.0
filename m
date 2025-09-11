Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF855B52932
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 08:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8651610E062;
	Thu, 11 Sep 2025 06:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HbQqtWUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D249110E062
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:44:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D1A4260141;
 Thu, 11 Sep 2025 06:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BF6C4CEF1;
 Thu, 11 Sep 2025 06:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757573077;
 bh=WUrx2xeTTuAgEJ9/q2ZdB8X0IE9mS2o9XUXxYeD3pN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HbQqtWUnjk3Mz2IQQuGIBwtU2It1GAel3Z1ifcraWfznYBkXsaDQtXmoBFe54yDA5
 6V2KBu0kqqpArMbaAF++Uq7RAGKBTtkBw3qGmRkDltX3lciSCyEUTOMq8nvXYSZlWz
 7ZDd/L8d0snRWR90oQJr3JZWvwNc45tUaAXesZdZ6b/zkXq7nBcK6UAMpWuSUUQYKY
 VX3un0L92NmrGoXdW0zAyUg+vQdFKqytQsYrbUsY9wLWmySPi4c3oCMEMsh//U7Mmp
 KCElozZ4se7wFwXakcmsvXPu+KbGe9MpVGyP3lmQ0hA7gPyHTTHGmZdglx/wcJZMoW
 raHGlLGy/w+rg==
Date: Thu, 11 Sep 2025 08:44:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
Message-ID: <20250911-adept-vengeful-jacamar-15f2a0@houat>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty> <20250908154901.64f1a639@booty>
 <20250910-amazing-camouflaged-barracuda-bb79cb@houat>
 <20250910183440.3fe50fac@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zssqy6tmj3ghiauc"
Content-Disposition: inline
In-Reply-To: <20250910183440.3fe50fac@booty>
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


--zssqy6tmj3ghiauc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
MIME-Version: 1.0

On Wed, Sep 10, 2025 at 06:34:40PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Wed, 10 Sep 2025 09:52:21 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Mon, Sep 08, 2025 at 03:49:01PM +0200, Luca Ceresoli wrote:
> > > Hello Maxime,
> > >=20
> > > On Wed, 20 Aug 2025 13:13:02 +0200
> > > Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > >  =20
> > > > > > +	/*
> > > > > > +	 * sn65dsi83_atomic_disable() should release some resources, =
but it
> > > > > > +	 * cannot if we call drm_bridge_unplug() before it can
> > > > > > +	 * drm_bridge_enter(). If that happens, let's release those
> > > > > > +	 * resources now.
> > > > > > +	 */
> > > > > > +	if (ctx->disable_resources_needed) {
> > > > > > +		if (!ctx->irq)
> > > > > > +			sn65dsi83_monitor_stop(ctx);
> > > > > > +
> > > > > > +		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> > > > > > +		usleep_range(10000, 11000);
> > > > > > +
> > > > > > +		regulator_disable(ctx->vcc);
> > > > > > +	}     =20
> > > > >=20
> > > > > I'm not sure you need this. Wouldn't registering a devm action do=
 the
> > > > > same thing?   =20
> > > >=20
> > > > Good idea, thanks. I'll give it a try. =20
> > >=20
> > > I'm catching up with this series after being busy a few weeks...
> > >=20
> > > I looked at this, but contrary my initial impression I think it would
> > > not be an improvement.
> > >=20
> > > The reason is at least one of these cleanup actions (namely the
> > > regulator_disable()) must be done only if there is a matching enable,
> > > which is in atomic_pre_enable. This is why I introduced a flag in the
> > > first place.
> > >=20
> > > I'm not sure which usage of devres you had in mind, but I see two
> > > options.
> > >=20
> > > Option 1: in probe, add a devres action to call a function like:
> > >=20
> > > sn65dsi83_cleanups()
> > > {
> > > 	if (ctx->disable_resources_needed) {
> > > 		/* the same cleanups */
> > > 	}   =20
> > > }
> > >=20
> > > But that is just a more indirect way of doing the same thing, and
> > > relies on the same flag.
> > >=20
> > > Option 2: have a function to unconditionally do the cleanups:
> > >=20
> > > sn65dsi83_cleanups()
> > > {
> > > 	/* the same cleanups (no if) */
> > > }
> > >=20
> > > And then:
> > >  * in atomic_pre_enable, instead of setting the flag
> > >    add a devres action to call sn65dsi83_cleanups()
> > >  * in atomic_disable, instead of clearing the flag
> > >    remove the devres action
> > >=20
> > > Even this option looks like more complicated and less readable code
> > > to do the same thing.
> > >=20
> > > Do you have in mind a better option that I haven't figured out? =20
> >=20
> > Would using devm_add_action in atomic_pre_enable, and
> > devm_release_action in atomic_post_disable work?
> >=20
> > That way, if you have a typical enable / disable cycle, the action will
> > get registered and executed properly, and if you only have an enable but
> > no matching disable, it will be collected after remove.
>=20
> So you're OK with option 2. I just implemented it, works well and the
> resulting code is a bit cleaner. Queued for v2.

Kind of, but you shouldn't remove but release it, and it doesn't have to
be a single action / function.

Maxime

--zssqy6tmj3ghiauc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMJvzQAKCRAnX84Zoj2+
duA0AX0WKbMX522W4iWT6aZovu3p5rI3tFX7gzGkDlNpq0Vb7naj9n18UQoN/kBk
HBraCFwBfijpq8dX6tNABdkG3a12JzYRVGqHZY9+3ppxfxAz1wdpnfGK66BIbdXl
dHciD8+TVQ==
=GI2R
-----END PGP SIGNATURE-----

--zssqy6tmj3ghiauc--
