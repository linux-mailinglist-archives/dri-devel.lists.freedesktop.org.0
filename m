Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3FA06101
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E2910E16D;
	Wed,  8 Jan 2025 16:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BQLLMVxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EDF10E16D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:02:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D4AEA418E1;
 Wed,  8 Jan 2025 16:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF44C4CEDD;
 Wed,  8 Jan 2025 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736352127;
 bh=JxfaOeibKq8C2VBUcEh8/6VdPolNVu/fETe/T/Z6kqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BQLLMVxqTFpTpgAo6rCXLDrtrjcOssNGhRQN8C1lNku+MUfIyfsvZjolrXYvI5kze
 4guttmqpSYK36BxPPKK/DdU+zgUkuFuJt2SHfvB3ENOd8zjllqrZilEFQyFyJnWNmL
 S6okVcESn0jsM1DHxVpuDtvGAKCds2MASj8ncZReMZ5UIZsJRPLvZK972LxDJyP7FN
 L3ChyxRvA+6HX5caeAOFYzB41LyDLLL6WBOI0O598YEF71G/Cp+seZTVgpbVobNF0g
 ox66gFOhHD3gKBI1rJhk67VDW5Dh4x6D7hxzGagO9NNDPlJ8hn8CYLtE6+DcAt17Lo
 PIajy6mapIt9A==
Date: Wed, 8 Jan 2025 17:02:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250108162429.53316041@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="w5ldiznj6hwrkqyq"
Content-Disposition: inline
In-Reply-To: <20250108162429.53316041@booty>
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


--w5ldiznj6hwrkqyq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
MIME-Version: 1.0

On Wed, Jan 08, 2025 at 04:24:29PM +0100, Luca Ceresoli wrote:
> Hi Maxime, Dmitry,
>=20
> thanks both for the useful review!
>=20
> On Mon, 6 Jan 2025 14:24:00 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>=20
> > On Mon, 6 Jan 2025 at 12:39, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > Most of these comments affect your earlier patches, but let's work on
> > > the API-level view.
> > >
> > > On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote: =20
> > > > + * When using refcounted mode, the driver should allocate ``struct
> > > > + * my_bridge`` using regular allocation (as opposed to ``devm_`` or
> > > > + * ``drmm_`` allocation), call drm_bridge_init() immediately after=
wards to
> > > > + * transfer lifecycle management to the DRM bridge core, and imple=
ment a
> > > > + * ``.destroy`` function to deallocate the ``struct my_bridge``, a=
s in this
> > > > + * example::
> > > > + *
> > > > + *     static void my_bridge_destroy(struct drm_bridge *bridge)
> > > > + *     {
> > > > + *         kfree(container_of(bridge, struct my_bridge, bridge));
> > > > + *     }
> > > > + *
> > > > + *     static const struct drm_bridge_funcs my_bridge_funcs =3D {
> > > > + *         .destroy =3D my_bridge_destroy,
> > > > + *         ...
> > > > + *     };
> > > > + *
> > > > + *     static int my_bridge_probe(...)
> > > > + *     {
> > > > + *         struct my_bridge *mybr;
> > > > + *         int err;
> > > > + *
> > > > + *         mybr =3D kzalloc(sizeof(*mybr), GFP_KERNEL);
> > > > + *         if (!mybr)
> > > > + *             return -ENOMEM;
> > > > + *
> > > > + *         err =3D drm_bridge_init(dev, &mybr->bridge, &my_bridge_=
funcs);
> > > > + *         if (err)
> > > > + *             return err;
> > > > + *
> > > > + *         ...
> > > > + *         drm_bridge_add();
> > > > + *         ...
> > > > + *     }
> > > > + *
> > > > + *     static void my_bridge_remove()
> > > > + *     {
> > > > + *         struct my_bridge *mybr =3D ...;
> > > > + *         drm_bridge_remove(&mybr->bridge);
> > > > + *         // ... NO kfree here!
> > > > + *     } =20
> > >
> > > I'm a bit worried there, since that API is pretty difficult to get
> > > right, and we don't have anything to catch bad patterns.
> > >
> > > Let's take a step back. What we're trying to solve here is:
> > >
> > >   1) We want to avoid any dangling pointers to a bridge if the bridge
> > >      device is removed.
> > >
> > >   2) To do so, we need to switch to reference counted allocations and
> > >      pointers.
> > >
> > >   3) Most bridges structures are allocated through devm_kzalloc, and =
they
> > >      one that aren't are freed at remove time anyway, so the allocated
> > >      structure will be gone when the device is removed.
> > >
> > >   4) To properly track users, each user that will use a drm_bridge ne=
eds
> > >      to take a reference. =20
> >=20
> > 5) Handle the disappearing next_bridge problem: probe() function gets
> > a pointer to the next bridge, but then for some reasons (e.g. because
> > of the other device being removed or because of some probe deferral)
> > the next_bridge driver gets unbdound and the next_bridge becomes
> > unusable before a call to drm_bridge_attach().
> >=20
> > >
> > > AFAIU, the destroy introduction and the on-purpose omission of kfree =
in
> > > remove is to solve 3.
> > >
> > > Introducing a function that allocates the drm_bridge container struct
> > > (like drmm_encoder_alloc for example), take a reference, register a d=
evm
> > > kfree action, and return the pointer to the driver structure would so=
lve
> > > that too pretty nicely.
> > >
> > > So, something like:
> > >
> > >
> > > struct driver_priv {
> > >        struct drm_bridge bridge;
> > >
> > >        ...
> > > }
> > >
> > > static int driver_probe(...)
> > > {
> > >         struct driver_priv *priv;
> > >         struct drm_bridge *bridge;
> > >
> > >         ....
> > >
> > >         priv =3D devm_drm_bridge_alloc(dev, struct driver_priv, bridg=
e); =20
> >=20
> > Ah... And devm-cleanup will just drop a reference to that data,
> > freeing it when all refs are cleaned? Nice idea.
>=20
> I like the idea. It's basically a macro wrapping the calls to kzalloc()
> + drm_bridge_init() that I proposed in this series. I had thought about
> such an idea initially but I haven't seen such a macro in
> drm_connector.h I didn't follow the idea.
>=20
> I don't love the _alloc name though because it will be doing much more
> than allocating. What about devm_drm_bridge_new()?
>
> I understand _alloc is coherent with the drmm_encoder_alloc() and I
> could survive that... but what about renaming that one to
> drmm_encoder_new()?

alloc is used pretty much every where for allocation + init, see CRTC,
planes, connectors, etc.

It might be unfortunate, but I don't think we should change that
convention.

> Or maybe _create instead of _new, because _new is used for atomic
> states, in opposition to _old.
>=20
> > > And we'll also need some flag in drm_bridge to indicate that the devi=
ce
> > > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > > because now your bridge driver sticks around for much longer than your
> > > device so the expectation that your device managed resources (clocks,
> > > registers, etc.) are always going to be around. =20
>=20
> Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
> drm_bridge.c will need to be sprinkled with them I guess.

The users would be the drivers, most likely. There's not much we can do
at the framework level, unfortunately.

Maxime

--w5ldiznj6hwrkqyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ36heAAKCRAnX84Zoj2+
dtmFAX93h+VckE2TdWVw7Sm7OhLxAesPI47kYAZUEk+sTHP0u2dVpicK3Yf74mHP
fFXD/kUBf03azluSIoInV6rUeydmMhjN8v8IFK4nEUKaDQKhF7OJaamgcDW67Oog
iqCcCEHIKg==
=rWxh
-----END PGP SIGNATURE-----

--w5ldiznj6hwrkqyq--
