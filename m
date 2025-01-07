Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0689A043D0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFF210E71F;
	Tue,  7 Jan 2025 15:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oay86R2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0979E10E70D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 15:12:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D2F2CA41777;
 Tue,  7 Jan 2025 15:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1AAC4CEDF;
 Tue,  7 Jan 2025 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736262723;
 bh=qfBkqmFewjPaTp9kdNMYpZ8IrvGEkcE13TznXF912GI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oay86R2Wu9Oc1lRLuNJCwbr7KfxK4NCuuaumbI1SB2pe4LOlBWeq2QuULQvFpXenh
 f2goViBgvBnldsTzle9wT8eIj7tpJlAIThubQYaiWGRQddcI8BI2oXrOUeYbsK8d2i
 D2lRUT/SZV75+LmGtz9TLmDH+ebPC2S5EkA9wkv2QmxXLbPQtZ8abnqR1fTFXxuptw
 azQJ3MT3CR3qcf2k71iRvitNKRtVBShpBDt4V2cC6niqdHvdm+dqbYLz0/n2sUwUiP
 aKOSTXqs930E8jwAaDR3EKKosZl4QT9HAwWm/1qKHEU1ccWvKLtMdu8Lkmo8xaqDlU
 S+mFsmDVAyzbA==
Date: Tue, 7 Jan 2025 16:12:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
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
Message-ID: <20250107-roaring-lush-civet-b0ba47@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250106-quick-exuberant-jellyfish-cddde2@houat>
 <2ay7s3nokg2yyks2t7df6niee7z3a2jhgqw7elumk3lirdvjbk@qqrnkbwcfqly>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="og4qzwsc4fu5qy3a"
Content-Disposition: inline
In-Reply-To: <2ay7s3nokg2yyks2t7df6niee7z3a2jhgqw7elumk3lirdvjbk@qqrnkbwcfqly>
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


--og4qzwsc4fu5qy3a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 12:35:15PM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 06, 2025 at 03:49:48PM +0100, Maxime Ripard wrote:
> > On Mon, Jan 06, 2025 at 02:24:00PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, 6 Jan 2025 at 12:39, Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Most of these comments affect your earlier patches, but let's work =
on
> > > > the API-level view.
> > > >
> > > > On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote:
>=20
> > > >         if (IS_ERR(priv))
> > > >            return ERR_PTR(priv);
> > > >         bridge =3D &priv->bridge;
> > > >
> > > >         ...
> > > >
> > > >         drm_bridge_add(bridge);
> > > > }
> > > >
> > > > Would work just as well.
> > > >
> > > > I also don't think we need explicit (at least for the common case)
> > > > drm_bridge_get and drm_bridge_put calls for bridge users.
> > > > drm_bridge_attach and drm_bridge_detach can get/put the reference
> > > > directly.
> > >=20
> > > As I wrote previously, I think drm_bridge_attach() might be too late =
for that.
> > > It sounds like drm_of_get_panel_or_bridge() and of_drm_find_bridge
> > > should increment the refcount, possibly adding a devres action to put
> > > the reference.
> >=20
> > We probably need both. drm_bridge_attach adds the bridge pointer to the
> > encoder bridge_chain list, so if we had something like
> >=20
> > bridge =3D drm_of_find_bridge();
> > drm_bridge_attach(encoder, bridge);
> > drm_bridge_put(bridge);
> >=20
> > We could have a dangling pointer.
>=20
> Yes... So, both drm_bridge_attach and drm_of_find_bridge() should take
> the refcount.
>=20
> Just as an idea, it might be nice to add refcounting to bridges_show(),
> so that we can easily verify that refcounting works correctly.

Yep, it looks like a good idea indeed.

Maxime

--og4qzwsc4fu5qy3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ31EPAAKCRAnX84Zoj2+
dvKaAX9scrKvT+P3jsMa/70lg8Z6hMRxq+8R6ArIwOc73kipAE2O9JjxYjg11yBq
buXM6EwBfjZaM43Ac/XZ389I/NtI5QADGBhHFP5zxXnsOfzHe3rcvB7/TBkxL7GM
w7iCXT03nA==
=DOt0
-----END PGP SIGNATURE-----

--og4qzwsc4fu5qy3a--
