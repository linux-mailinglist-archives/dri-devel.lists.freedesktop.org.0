Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734B9B3245
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E19310E4BA;
	Mon, 28 Oct 2024 13:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sHKjct2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5D610E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:55:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0EFE8A41974;
 Mon, 28 Oct 2024 13:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4093AC4CEC3;
 Mon, 28 Oct 2024 13:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730123749;
 bh=ws0ch/aVQ2m8745VJ1qhu9kTjtB6i6llA5z8WD6MiQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sHKjct2V/FbVoK0w3QLYm9vd3oCorDji52M/OE3dWW56YLD5jekLv3VUCOZzqXh+k
 toEJLhPxYJPGBbfaJL+fEHNp6slJKoRd45wTYahSzCRNyRxgdwcJsg33nMeTaNqDal
 D9QCzOt+aAoHFiBfCL756RfTJB7gWfg3AYhxMg+BfYFDN2jVQdhbSFJSMvLEtIg0rv
 h1vgd8AjAgeZ61mFUeLkOpt3Tiu80nXB6grAPun6Y3QW3F5LfAyZN7DPJzo6PxDwlP
 r6EkVBzbliWqYiy5TXO2XMxO6Fcbntu5hDnPsj8I7mjb5N2bBE77+OnQCOj6i8NPTf
 6ThBM2kq2XVgQ==
Date: Mon, 28 Oct 2024 14:55:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241028-great-charming-flounder-23fc9b@houat>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <20241027162350.GA15853@pendragon.ideasonboard.com>
 <20241028091331.6f67e29e@bootlin.com>
 <20241028112857.GF24052@pendragon.ideasonboard.com>
 <20241028-nebulous-yellow-dragon-2cfb5f@houat>
 <20241028132858.GE6081@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3q7z7ih7ubuoc7hh"
Content-Disposition: inline
In-Reply-To: <20241028132858.GE6081@pendragon.ideasonboard.com>
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


--3q7z7ih7ubuoc7hh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
MIME-Version: 1.0

On Mon, Oct 28, 2024 at 03:28:58PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 28, 2024 at 01:21:45PM +0100, Maxime Ripard wrote:
> > On Mon, Oct 28, 2024 at 01:28:57PM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 28, 2024 at 09:13:31AM +0100, Herve Codina wrote:
> > > > On Sun, 27 Oct 2024 18:23:50 +0200 Laurent Pinchart wrote:
> > > >=20
> > > > [...]
> > > > > > +static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi8=
3)
> > > > > > +{
> > > > > > +	struct drm_device *dev =3D sn65dsi83->bridge.dev;
> > > > > > +	struct drm_modeset_acquire_ctx ctx;
> > > > > > +	struct drm_atomic_state *state;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	/* Use operation done in drm_atomic_helper_suspend() followed=
 by
> > > > > > +	 * operation done in drm_atomic_helper_resume() but without r=
eleasing
> > > > > > +	 * the lock between suspend()/resume()
> > > > > > +	 */
> > > > > > +
> > > > > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > > > > +
> > > > > > +	state =3D drm_atomic_helper_duplicate_state(dev, &ctx);
> > > > > > +	if (IS_ERR(state)) {
> > > > > > +		err =3D PTR_ERR(state);
> > > > > > +		goto unlock;
> > > > > > +	}
> > > > > > +
> > > > > > +	err =3D drm_atomic_helper_disable_all(dev, &ctx);
> > > > > > +	if (err < 0)
> > > > > > +		goto unlock;
> > > > > > +
> > > > > > +	drm_mode_config_reset(dev);
> > > > > > +
> > > > > > +	err =3D drm_atomic_helper_commit_duplicated_state(state, &ctx=
); =20
> > > > >=20
> > > > > Committing a full atomic state from a bridge driver in an asynchr=
onous
> > > > > way seems quite uncharted territory, and it worries me. It's also=
 a very
> > > > > heavyweight, you disable all outputs here, instead of focussing o=
n the
> > > > > output connected to the bridge. Can you either implement somethin=
g more
> > > > > local, resetting the bridge only, or create a core helper to hand=
le this
> > > > > kind of situation, on a per-output basis ?
> > > >=20
> > > > A full restart of the bridge (power off/on) is needed and so we nee=
d to
> > > > redo the initialization sequence. This initialization sequence has =
to be
> > > > done with the DSI data lanes (bridge inputs) driven in LP11 state a=
nd so
> > > > without any video stream. Only focussing on bridge outputs will not=
 be
> > > > sufficient. That's why I brought the pipeline down and restarted it.
> > >=20
> > > Fair point.
> > >=20
> > > > Of course, I can copy/paste sn65dsi83_reset_pipeline() to a core he=
lper
> > > > function. Is drm_atomic_helper_reset_all() could be a good candidat=
e?
> > >=20
> > > The helper should operate on a single output, unrelated outputs should
> > > not be affected.
> >=20
> > Also, you don't want to reset anything, you just want the last commit to
> > be replayed.
>=20
> I'm not sure about that. If the last commit is just a page flip, that
> won't help, will it ?

The alternative would be that you start anew with a blank state, which
effectively drops every configuration that has been done by userspace.
This is terrible.

And a page flip wouldn't have affected the connector and
connector->state would still be to the last state that affected it, so
it would work.

Maxime

--3q7z7ih7ubuoc7hh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZx+X4gAKCRAnX84Zoj2+
dsDeAX9YIG774OLVGZ8Z23tBo5E5WJIQ1azv+gDEZA6GN2TEg6lRxTX2xDndpcJq
8Rp7AOgBgPDL3sYnUpQl5A8B46fL1FltgxWf4ap5zhCRs6vda347Gxl6lIqz7ayb
M1dDBB+UKw==
=WuPZ
-----END PGP SIGNATURE-----

--3q7z7ih7ubuoc7hh--
