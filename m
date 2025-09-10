Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B78B50FFE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B391010E295;
	Wed, 10 Sep 2025 07:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LamIGD1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADD910E295
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:52:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C52E60248;
 Wed, 10 Sep 2025 07:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5A6C4CEF0;
 Wed, 10 Sep 2025 07:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757490745;
 bh=KT11CFgDF51QdJwu+rJCwNinPOsU6PNjp4Iyulbjie0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LamIGD1qr4S96Y5A6Ic5A4xhpLGmLFZwjKKjMZaPgkUbMNx+N3T3xHpH8laPCApBY
 cSokzYof+HScaMolR+F7QEW7fb/BKnlN3WWR11smj8plV1yKp3qSlLbOU5YiujZXQ5
 jWCSejGI7odwMnjKTJE35ZHFQ4ExRgejgw6ce7DiW37ClMA+y5QUsDiCDjPVsSOWDp
 Gt9IcgN9Hh6r4CAua5QDT18oZUnBjnE78dX2xLsgCE3VT/fy5Na9i0Lp1dssZ9QpRm
 NGLwF/9QNa8/sWNSCZHPfR0H4j1WMMfqDRmEXJTKHq0ZSAzyiERMvvO2BqmYzhodvM
 4z4sv6mFtL7jg==
Date: Wed, 10 Sep 2025 09:52:21 +0200
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
Message-ID: <20250910-amazing-camouflaged-barracuda-bb79cb@houat>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty> <20250908154901.64f1a639@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="r7rztooyq4gxwyol"
Content-Disposition: inline
In-Reply-To: <20250908154901.64f1a639@booty>
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


--r7rztooyq4gxwyol
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
MIME-Version: 1.0

On Mon, Sep 08, 2025 at 03:49:01PM +0200, Luca Ceresoli wrote:
> Hello Maxime,
>=20
> On Wed, 20 Aug 2025 13:13:02 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>=20
> > > > +	/*
> > > > +	 * sn65dsi83_atomic_disable() should release some resources, but =
it
> > > > +	 * cannot if we call drm_bridge_unplug() before it can
> > > > +	 * drm_bridge_enter(). If that happens, let's release those
> > > > +	 * resources now.
> > > > +	 */
> > > > +	if (ctx->disable_resources_needed) {
> > > > +		if (!ctx->irq)
> > > > +			sn65dsi83_monitor_stop(ctx);
> > > > +
> > > > +		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> > > > +		usleep_range(10000, 11000);
> > > > +
> > > > +		regulator_disable(ctx->vcc);
> > > > +	}   =20
> > >=20
> > > I'm not sure you need this. Wouldn't registering a devm action do the
> > > same thing? =20
> >=20
> > Good idea, thanks. I'll give it a try.
>=20
> I'm catching up with this series after being busy a few weeks...
>=20
> I looked at this, but contrary my initial impression I think it would
> not be an improvement.
>=20
> The reason is at least one of these cleanup actions (namely the
> regulator_disable()) must be done only if there is a matching enable,
> which is in atomic_pre_enable. This is why I introduced a flag in the
> first place.
>=20
> I'm not sure which usage of devres you had in mind, but I see two
> options.
>=20
> Option 1: in probe, add a devres action to call a function like:
>=20
> sn65dsi83_cleanups()
> {
> 	if (ctx->disable_resources_needed) {
> 		/* the same cleanups */
> 	}   =20
> }
>=20
> But that is just a more indirect way of doing the same thing, and
> relies on the same flag.
>=20
> Option 2: have a function to unconditionally do the cleanups:
>=20
> sn65dsi83_cleanups()
> {
> 	/* the same cleanups (no if) */
> }
>=20
> And then:
>  * in atomic_pre_enable, instead of setting the flag
>    add a devres action to call sn65dsi83_cleanups()
>  * in atomic_disable, instead of clearing the flag
>    remove the devres action
>=20
> Even this option looks like more complicated and less readable code
> to do the same thing.
>=20
> Do you have in mind a better option that I haven't figured out?

Would using devm_add_action in atomic_pre_enable, and
devm_release_action in atomic_post_disable work?

That way, if you have a typical enable / disable cycle, the action will
get registered and executed properly, and if you only have an enable but
no matching disable, it will be collected after remove.

Maxime

--r7rztooyq4gxwyol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMEuNQAKCRAnX84Zoj2+
dtLOAX9rfDRVVP+/z7dJDPxsVAJx0Q3CbcUFefT8oLdQq+ir/1ZSRE1K/ac7ytHJ
cEOJhy4Bf0PYd6HQyy2bD/x4/X5jf+w8apfzLbg+ydQa+kAMAwStBVAOjMZEGylM
F9sYa3xEFA==
=Bjkz
-----END PGP SIGNATURE-----

--r7rztooyq4gxwyol--
