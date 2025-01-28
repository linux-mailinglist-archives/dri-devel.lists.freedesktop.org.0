Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF66A20DA5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 16:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04F610E12E;
	Tue, 28 Jan 2025 15:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CcXlOXIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B084D10E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:52:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAD4D5C010A;
 Tue, 28 Jan 2025 15:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9432C4CED3;
 Tue, 28 Jan 2025 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738079542;
 bh=+ZMv34W7IZyQt09/UhRkguTm7FtkDfuQFyxRcOrXnIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CcXlOXIpnLyZgqiMzwDrTGNDlVDm8ZYX7jzG7v5j1ufPatgfA9k8x9Wjot9syEzhD
 Xie+j5rt44l47oz43QfQVEJNKSrpFvdsyXm0PIuo/zrHrtt9sQ9wb9taQHxMGUuw0c
 gDNoW+kviirYNueRaKU6CeohbbrX6XF7etGDkOaOFBrcbYhgkCxZKHIWi8B6xQcY0i
 +vNG9eIXEnzfSnMFvPEwhDFH6XGAleP5J5+ULWuP2wjUv889U5aM+Pb1cgFLE1uQEg
 xTE9UjtlFlLNIy5BmkJMWF1CK8ycgHUppzHmCgxs/vX37bI9+jygg9J6XvFwdNANpL
 ziPRKYdG69UJQ==
Date: Tue, 28 Jan 2025 16:52:18 +0100
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
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <zave5l4djfl6i2qyxcpfn2dn3pip2sjaqefrkct47qzdd653jf@z4zhcpptbt4x>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
 <emuj2innmp6zmzd7pyakqzjqpdzhly6qfhakya3ydwmd63pl26@5jwxaidpikjw>
 <20250121122718.48502262@booty>
 <lwqv5nukfchusbi2vep2cx3vu6oxj4r5jd7oe3wo4nxtpxadh2@wjyt2c2r46kn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xgzb5xxdgehkfjxi"
Content-Disposition: inline
In-Reply-To: <lwqv5nukfchusbi2vep2cx3vu6oxj4r5jd7oe3wo4nxtpxadh2@wjyt2c2r46kn>
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


--xgzb5xxdgehkfjxi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
MIME-Version: 1.0

On Tue, Jan 21, 2025 at 01:57:47PM +0200, Dmitry Baryshkov wrote:
> On Tue, Jan 21, 2025 at 12:27:18PM +0100, Luca Ceresoli wrote:
> > Hi Dmitry,
> >=20
> > On Thu, 16 Jan 2025 12:56:25 +0200
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >=20
> > [...]
> >=20
> > > > Idea 3:=20
> > > >=20
> > > > The idea is that if the panel driver framework always creates a pan=
el
> > > > bridge, it will never need to be created on the fly automagically by
> > > > its consumers, so the whole problem would disappear. It also would =
be
> > > > better modeling the hardware: still wrapping a panel with a drm_bri=
dge
> > > > that does not exist in the hardware, but at least having it created=
 by
> > > > the provider driver and not by the consumer driver which happens to
> > > > look for it. =20
> > >=20
> > > I think this is the best option up to now.
> >=20
> > Thanks for sharing your opinion. However a few points are not clear to
> > me, see below.
> >=20
> > > > This looks like a promising and simple idea, so I tried a quick
> > > > implementation:
> > > >=20
> > > >  void drm_panel_init(struct drm_panel *panel, struct device *dev,
> > > >                     const struct drm_panel_funcs *funcs, int connec=
tor_type)
> > > >  {
> > > > +       struct drm_bridge *bridge;
> > > > +
> > > >         INIT_LIST_HEAD(&panel->list);
> > > >         INIT_LIST_HEAD(&panel->followers);
> > > >         mutex_init(&panel->follower_lock);
> > > >         panel->dev =3D dev;
> > > >         panel->funcs =3D funcs;
> > > >         panel->connector_type =3D connector_type;
> > > > +
> > > > +       bridge =3D devm_drm_panel_bridge_add(panel->dev, panel);
> > > > +       WARN_ON(!bridge);
> > > >  }
> > > >=20
> > > > This is somewhat working but it requires more work because:
> > > >=20
> > > >  * as it is, it creates a circular dependency between drm_panel and=
 the
> > > >    panel bridge, and modular builds will fail:
> > > >=20
> > > >      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> > > >=20
> > > >  * The panel bridge implementation should be made private to the pa=
nel
> > > >    driver only (possibly helping to solve the previous issue?) =20
> > >=20
> > > Or merge drm_panel.c into bridge/panel.c.
> >=20
> > Not sure here you mean exactly what you wrote, or the other way around.
> > It looks more correct to me that the panel core (drm_panel.c) starts
> > exposing a bridge now, and not that the panel bridge which is just one
> > of many bridge drivers starts handling all the panel-related stuff.
>=20
> No, I actually meant what I wrote: merge drm_panel.c into
> bridge/panel.c. Indeed we have some drivers that use panel directly.
> However drm_bridge is a more generic interface. So, yes, I propose to
> have a bridge driver which incorporates panel support.

It's a legitimate subject to discuss, but I'm not sure it's worth
focusing on this at this point though.

We should probably split it out into smaller chunks. Figuring out the
drivers lifetime, and reference counting API is hard enough as it is,
throwing panels into the mix at this point just adds more complexity.

Maxime

--xgzb5xxdgehkfjxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5j9LQAKCRAnX84Zoj2+
dr+9AYD3ejhJkBU6GuhBCf1V416YoKd8WTFeAyOCAx6vOMYG5g/AB64hT0jgLj8f
VsKw5esBf21gmTYvT0Skk2DDP0XMtC0YYHdZpitvjdK9Vveu29dHs7Yrsw0wOXDG
ZtjM4Zx0sg==
=0eQL
-----END PGP SIGNATURE-----

--xgzb5xxdgehkfjxi--
