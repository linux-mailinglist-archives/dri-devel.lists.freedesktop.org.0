Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C640CADA08
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 16:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6553210E050;
	Mon,  8 Dec 2025 15:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DB6tzQVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D56A10E050;
 Mon,  8 Dec 2025 15:43:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2DEA240706;
 Mon,  8 Dec 2025 15:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD6CC4CEF1;
 Mon,  8 Dec 2025 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765208597;
 bh=nSKyTwyc6gtVXjKiksXBSB5Lqzmb0N8xQmXUhdtjILg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DB6tzQVow1mIGcQAHjPHTv7SmbtoopZ55mw6gMkW8RGl9CzJzV12z6RbWUuaOIMCR
 U4irgZsk84vlIwUMLvdTnFqF7Tpwsve5l+dFFDsbbQNlTC/o43D9nc9Qr2f3zD4255
 jldBWat2Y1yHgNIgz6qWMCWKLrLCIM0zuKUByNOrN1StoDlknvKgEaNiNhFRcMF3ov
 U5yKafhRY1WmXRVccNCWjynyrlrckoXK0pmA6G46Hx3/OeNJ3K/fzOXFXUcOPuT7rM
 lHvim/AdiKuoTetGnWlgwY90cbK8GsvS0Dk1s+56cTZjb+qW7INbr1GfCJsihIs1+9
 bpLjeab/8ezDQ==
Date: Mon, 8 Dec 2025 16:43:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/16] drm/bridge: Switch private_obj initialization
 to atomic_create_state
Message-ID: <20251208-impossible-successful-ibex-5bceac@houat>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-5-6dd60e985e9d@kernel.org>
 <DDNUOE1ZNUKS.GD10B3113L1T@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="np463kq723pzn3cv"
Content-Disposition: inline
In-Reply-To: <DDNUOE1ZNUKS.GD10B3113L1T@bootlin.com>
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


--np463kq723pzn3cv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 05/16] drm/bridge: Switch private_obj initialization
 to atomic_create_state
MIME-Version: 1.0

On Tue, Oct 21, 2025 at 10:17:13AM +0200, Luca Ceresoli wrote:
> Hello Maxime,
>=20
> On Tue Oct 14, 2025 at 11:31 AM CEST, Maxime Ripard wrote:
> > The bridge implementation relies on a drm_private_obj, that is
> > initialized by allocating and initializing a state, and then passing it
> > to drm_private_obj_init.
> >
> > Since we're gradually moving away from that pattern to the more
> > established one relying on a atomic_create_state implementation, let's
> > migrate this instance to the new pattern.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Robert Foss <rfoss@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 33 ++++++++++++++++++---------------
> >  1 file changed, 18 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 630b5e6594e0affad9ba48791207c7b403da5db8..f0db891863428ee65625a6a=
3ed38f63ec802595e 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -394,11 +394,27 @@ drm_bridge_atomic_destroy_priv_state(struct drm_p=
rivate_obj *obj,
> >  	struct drm_bridge *bridge =3D drm_priv_to_bridge(obj);
> >
> >  	bridge->funcs->atomic_destroy_state(bridge, state);
> >  }
> >
> > +static struct drm_private_state *
> > +drm_bridge_atomic_create_priv_state(struct drm_private_obj *obj)
> > +{
> > +	struct drm_bridge *bridge =3D drm_priv_to_bridge(obj);
> > +	struct drm_bridge_state *state;
> > +
> > +	state =3D bridge->funcs->atomic_reset(bridge);
> > +	if (IS_ERR(state))
> > +		return ERR_PTR(-ENOMEM);
>=20
> This is slightly changing the behaviour, assuming that every error is
> -ENOMEM, while in the current implementation any error code is just
> propagated. I searched all .atomic_reset callbacks and apparently none can
> return any other error, so this would not introduce a bug with current
> drivers. However the atomic_reset docs say any ERR_PTR can be returned,
> thus a future driver would be allowed to return another error value, even
> thoug it's unlikely. The drm_bridge.c core having no control over what
> other drivers do, I wonder whether we should just return ERR_PTR(state)
> here, and keep the check on the drm_atomic_private_obj_init() return value
> below.
>=20
> I have no strong position about which direction is best however. Maybe
> changing the docs to say "Return: only -ENOMEM", and add here a
> WARN_ON(IS_ERR(state) && ERR_PTR(state) !=3D -ENOMEM)?

No, it's a good catch, we should totally return state and not ignore it.

Thanks!
Maxime

--np463kq723pzn3cv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTbyEQAKCRAnX84Zoj2+
dteFAX9ZL4Pq31U2P9HBQ8ChuZhD5ZSRdu8XOp09Jazz52V9CRwv5rkVFs6Mn8ON
fxkfPwQBfjMU7bwOcFqy9TxCTRgpDtRB+NtwrLZxND5+Pn49YnGbZFJuEO5rOTi4
O/61/BAfGA==
=93j9
-----END PGP SIGNATURE-----

--np463kq723pzn3cv--
