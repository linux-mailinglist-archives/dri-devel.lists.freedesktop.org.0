Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB4CA20C44
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 15:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ED310E676;
	Tue, 28 Jan 2025 14:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FrB/nTrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9969C10E676
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 14:49:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6742A5C58A9;
 Tue, 28 Jan 2025 14:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63871C4CED3;
 Tue, 28 Jan 2025 14:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738075767;
 bh=+Ejniyab9jdWy8aG5N2vU/QcshCR48kbmtf/5OBPbRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FrB/nTrHi+K4b9TUWdn26CTKLM20TG/2lA7NvP5IbBxo/eht1Ruo30tfHwD0x405e
 g/oY8WfQbGRLbqcoOEbIhvsaEVRBeYi9Cim0aDnDPqpoxBHs7EN7F6xSdXBptNQ+Mb
 6MG7jUgZpomKN62UxwaqCTu/Lk/zUQuJCG8LYOP6hyYvh0lWNLjgO+IDraU1/viaE5
 H/S36AZMFoQI3tzLkwY7RwaV5JU1+XWwZtjPLB5UKWxIeMvSNVhms7szLIwuWz3ARm
 Mo+6H63smH1nv0GRJpZKeIMCkSUkhgE3JS/SAomWic2HFSuGtpi9jPiTFm0sUonfRL
 4SdPi7ZDtv5oQ==
Date: Tue, 28 Jan 2025 15:49:23 +0100
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
Message-ID: <jiwexbvzcrq7hywl5t25cojrgjnyv5q2wnb2kvgriucal6764w@hhrefcftcjza>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250108162429.53316041@booty>
 <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
 <20250122171230.30cf9b97@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="shqls32c37qtoxms"
Content-Disposition: inline
In-Reply-To: <20250122171230.30cf9b97@booty>
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


--shqls32c37qtoxms
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
MIME-Version: 1.0

Hi,

On Wed, Jan 22, 2025 at 05:12:30PM +0100, Luca Ceresoli wrote:
> On Wed, 8 Jan 2025 17:02:04 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> [...]
>=20
> > > > > And we'll also need some flag in drm_bridge to indicate that the =
device
> > > > > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > > > > because now your bridge driver sticks around for much longer than=
 your
> > > > > device so the expectation that your device managed resources (clo=
cks,
> > > > > registers, etc.) are always going to be around.   =20
> > >=20
> > > Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
> > > drm_bridge.c will need to be sprinkled with them I guess. =20
> >=20
> > The users would be the drivers, most likely. There's not much we can do
> > at the framework level, unfortunately.
>=20
> Back to the idea of a "gone" flag, or perhaps an "unplugged" flag to
> be consistent with the struct drm_device naming, and
> drm_bridge_enter()/drm_bridge_exit(), I did a few experiments and have
> a question.
>=20
> In case:
>=20
>   a) there is a notification callback to inform about bridges
>      being removed, and
>   b) all entities owning a struct drm_bridge pointer stop using
>      that pointer when notified
>=20
>=20
> With the above, there should be no need for
> drm_bridge_enter()/drm_bridge_exit(). Nobody will be using a pointer to
> a bridge that is being removed.
>=20
> Now, about a), patch 1 in this series implements such a mechanism to
> inform all bridges when a bridge is being removed. Note that the
> "unplugged" flag would be set immediately after the notifier callback
> is currently called: "unplugged =3D=3D true" will never happen before the
> callback, and after the callback there will be no pointer at all.
>=20
> Patch 1 however is only notifying bridges, so other entities (e.g.
> encoders) cannot be notified with this implementation. However a
> different notification mechanism can be implemented. E.g. until v3 this
> series was using a generic struct notifier_block for this goal [0], so
> any part of the kernel can be notified.
>=20
> About b), the notification appears simpler to implement in the various
> drivers as it needs to be added in one place per driver. Also adding
> drm_bridge_enter()/exit() can be trickier to get right for non-trivial
> functions.
>=20
> Do you see any drawback in using a notification mechanism instead of
> drm_bridge_enter()/exit() + unplugged flag?

Yeah, because we're not considering the same thing :)

The issue you're talking about is that you want to be notified that the
next bridge has been removed and you shouldn't use the drm_bridge
pointer anymore.

A notification mechanism sounds like a good solution there.

The other issue we have is that now, we will have the drm_bridge pointer
still allocated and valid after its device has been removed.

In which case, you need to be able to tell the bridge driver whose
device got removed that the devm resources aren't there anymore, and it
shouldn't try to access them.

That's what drm_bridge_enter()/exit is here for.

Maxime

--shqls32c37qtoxms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5jucwAKCRAnX84Zoj2+
dr3/AX9yyXr/DcwkCCWNCkD8BOPxtQlcN0Dqx5XTUvqvGVPG/04wKXx7kg4cSput
ssff96ABf0XkC8RsvcERjbdZTGaOxLS1MVQ/4U6WwYMKeIiXM4Wmxg+K+WLH3qEd
cr8ksUj8LA==
=f7xe
-----END PGP SIGNATURE-----

--shqls32c37qtoxms--
