Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA1A69493
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 17:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2F510E544;
	Wed, 19 Mar 2025 16:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Am+CbsLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1717A10E544
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 16:16:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5CDF55C541A;
 Wed, 19 Mar 2025 16:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861A1C4CEE4;
 Wed, 19 Mar 2025 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742401016;
 bh=xnDMEd3oDLdDyqilpxe7B268wCPcK5IAlUmeX80LEN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Am+CbsLWZVQEa12XMDxSuzyntXruJiE5MR3Cebx1u1THPmr/6TyF2BtIPaeBI9IXj
 3t30Df+b0rQp+UlY0FOwRk6CvkY0CwfQW2g6ku+RqJ505Iti8pAyKbGEc43dvkXaAO
 1cMoLK4kEzUSD/gB9IbAdLjv+nWTUJUo6Xcl1FvbxBH3usbwlFziLG7ff6yP+k7oqa
 6DsLot8nu46ZD5VcqEshL6C0nQNC3OVRuRMcIkEL9daIEQcjyxi4V2vBhNegC0znLa
 E0cQZyyqLQ2g5bGSBV9ysedz0dNqmm+1d84yNfYbtQUtxx304qOmNmTcB7J/Bdt/R4
 WDHPS3/vW8inQ==
Date: Wed, 19 Mar 2025 17:16:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with
 bridge refcount
Message-ID: <20250319-stylish-lime-mongoose-0a18ad@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-daft-woodoo-cheetah-e029c5@houat>
 <20250317155607.68cff522@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zuzyymlcqte4eo4x"
Content-Disposition: inline
In-Reply-To: <20250317155607.68cff522@booty>
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


--zuzyymlcqte4eo4x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with
 bridge refcount
MIME-Version: 1.0

On Mon, Mar 17, 2025 at 03:56:07PM +0100, Luca Ceresoli wrote:
> Hello Maxime,
>=20
> On Fri, 14 Mar 2025 19:21:01 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > Hi,
> >=20
> > On Fri, Mar 14, 2025 at 11:31:13AM +0100, Luca Ceresoli wrote:
> > > This series improves the way DRM bridges are allocated and
> > > initialized and makes them reference-counted. The goal of reference
> > > counting is to avoid use-after-free by drivers which got a pointer
> > > to a bridge and keep it stored and used even after the bridge has
> > > been deallocated.
> > >=20
> > > The overall goal is supporting Linux devices with a DRM pipeline
> > > whose final components can be hot-plugged and hot-unplugged,
> > > including one or more bridges. For more details see the big picture
> > > [0].
> > >=20
> > > DRM bridge drivers will have to be adapted to the new API, which is
> > > pretty simple for most cases. Refcounting will have to be adopted
> > > on the two sides: all functions returning a bridge pointer and all
> > > code obtaining such a pointer. This series has just an overview of
> > > some of those conversions, because for now the main goal is to
> > > agree on the API.
> > >=20
> > > Series layout:
> > >=20
> > >  1. Add the new API and refcounting:
> > >=20
> > >     drm/bridge: add devm_drm_bridge_alloc()
> > >     drm/bridge: add support for refcounting
> > >=20
> > >  2. get/put the reference in basic operations in the bridge core:
> > >=20
> > >     drm/bridge: get/put the bridge reference in
> > > drm_bridge_add/remove() drm/bridge: get/put the bridge reference in
> > > drm_bridge_attach/detach()
> > >=20
> > >  3. as an example of changes for bridge consumers, get a reference
> > > for the bridge returned by drm_bridge_chain_get_first_bridge(),
> > > have it put by all callers (all users will be covered later on
> > > separately):
> > >=20
> > >     drm/bridge: add a cleanup action for scope-based
> > > drm_bridge_put() invocation drm/bridge: get the bridge returned by
> > > drm_bridge_chain_get_first_bridge() drm/mxsfb: put the bridge
> > > returned by drm_bridge_chain_get_first_bridge() drm/atomic-helper:
> > > put the bridge returned by drm_bridge_chain_get_first_bridge()
> > > drm/probe-helper: put the bridge returned by
> > > drm_bridge_chain_get_first_bridge()
> > >=20
> > >  4. convert a few bridge drivers (bridge providers) to the new API:
> > >=20
> > >     drm/bridge: ti-sn65dsi83: use dynamic lifetime management
> > >     drm/bridge: samsung-dsim: use dynamic lifetime management
> > >=20
> > > This work was formerly a part of my v6 DRM bridge hotplug
> > > series[0], now split as a standalone series with many improvements,
> > > hence the "v7" version number. =20
> >=20
> > Except for one patch where I had comments, I think the series is in
> > excellent shape. We're still missing a couple of things to close this
> > topic though:
> >=20
> >   - Converting the other bridge iterators/accessors to take / put the
> > references
>=20
> I sent a couple in this series as you had asked, to show how conversion
> looks like. But I have a large part of this conversion partially done
> already, and it is the largest part of the refcounting work in terms of
> touched files due to the large number of drivers using the iterators
> and accessors. Here are the functions to convert:
>=20
>  A) drm_bridge_chain_get_first_bridge
>  B) drm_bridge_get_prev_bridge
>  C) drm_bridge_get_next_bridge
>  D) drm_for_each_bridge_in_chain
>  E) drm_bridge_connector_init
>  F) of_drm_find_bridge
>=20
> A) is present in this series as an example but I don't think it should
> be applied until all bridge drivers are converted to
> drm_bridge_alloc(). Otherwise for not-yet-converted bridge drivers we'd
> have drm_bridge_get/put() operating on an uninitialized kref, and
> __drm_bridge_free() called on non-refcounted bridges, so I think we'd
> see fireworks.
>=20
> In the previous iteration I used drm_bridge_is_refcounted() in
> drm_bridge_get/put() to allow a progressive migration, but if we want
> to convert everything in a single run we need to first convert all
> bridges to drm_bridge_alloc() and then convert all accessors.
>=20
> The same reasoning applies to patches 3-4 which add get/put to
> drm_bridge_add/remove() and _attach/detach().

Agreed.

> B) to E) are ready in my work branch, about 20 patches in total.
> Indeed item E) is a special case but it is handled there too.
>=20
> Item F) is the beast, because of the reverse call graph of
> of_drm_find_bridge() which includes drm_of_find_panel_or_bridge() and
> then *_of_get_bridge(), each having a few dozen callers, and leading
> to the panel_bridge topic. I have converted maybe half of the users of
> accessors in F), it's 35 patches but it's the easy half and I still need
> to tackle to hardest ones.

One thing to keep in mind is that, while it's not correct, if the bridge
has been allocated with devm_drm_bridge_alloc, it's not worse either. If
you're not getting a reference to your pointer, the point is buggy,
sure, but it's just as buggy as before, and in the same situations.

So we can make that gradually if it's more convenient.

One way to solve it would be that, for example, of_drm_find_bridge is
oddly named according to our convention and it would make more sense to
be called drm_of_find_bridge().

So maybe we can just create drm_of_find_bridge() that takes a reference,
make of_drm_find_bridge() deprecated in favour of drm_of_find_bridge(),
add a TODO, and call it a day. People will gradually switch to the new
API over time.

> >   - Mass converting the drivers to devm_drm_bridge_alloc
>=20
> Again I sent a couple in this series as you had asked, to show how
> conversion looks like for the typical bridge driver. There are ~70
> drivers to convert in total and I think most will be easy as the two
> examples presented here.
>=20
> I think this should be merged entirely before merging any accessor
> changes, as explained above.

Agreed.

> >   - Documenting somewhere (possibly in drm_bridge_init?) that it
> > really shouldn't be used anymore
>=20
> I'm afraid there is no drm_bridge_init(), bridge drivers just do
> [devm_]kzalloc and set fields explicitly. So I don't think there is a
> place to document this.

Oh, right.

Then, drm_bridge_add() would be a good candidate too to mention that
bridges must be allocated using devm_drm_bridge_alloc().

> However I used to have a documentation patch until v6 [0], and I think
> it should be revived and resent at some point, after removing the
> "legacy mode" as we are converting all drivers at once. BTW I also have
> a kunittest patch that should be revived. Do you still prefer me to
> resend these two patches as a separate series, waiting after the API in
> this series is applied?

Both options work for me.

> Overall, I think this could be the path forward, let me know if
> youthink it should be done differently:
>=20
>  A. have patches 1 and 2 of this series applied
>     (why not, even patches 10-11)

I had some comments on patch 2, but it's ok for me on principle.

>  B. after (A), send series to convert all bridge drivers to new API
>     (includes patches 10-11 of this series if not applied already)
>  C. after (A), send documentation and kunittest patches
>  D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
>     (patches 3-4 in this series)
>  E. after (B), send series to convert accessors (including patches 5-9
>     in this series which convert drm_bridge_chain_get_first_bridge()
>     and its users)

Sounds like a plan.

Maxime

--zuzyymlcqte4eo4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9rt8QAKCRAnX84Zoj2+
dpRkAYDyfJjZ9ehu+S5iLIu/iYFb5O41BAyd4X0ZxJYo+tvcvfATmXEOhoTLNTb8
n3EjAwABf0KaSbw1P0Md0k9OqZLM6C1VpOctYVm+foj/msMaoLN2L5tDCWvYWRh5
+tfPevPTjA==
=Dl6X
-----END PGP SIGNATURE-----

--zuzyymlcqte4eo4x--
