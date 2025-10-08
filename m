Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20042BC57C6
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5C310E838;
	Wed,  8 Oct 2025 14:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LUFLzjIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F1410E838
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:53:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61E6B44D1D;
 Wed,  8 Oct 2025 14:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0115C4CEE7;
 Wed,  8 Oct 2025 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759935203;
 bh=ZlVGcDKi/u4HoZdkwiAN4GRpkYOVUoVXmrfnPCUEuLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LUFLzjILwvFPrjNL/38Y+9LlebVZigESLOQceubpRBtrz+bXoQ7wx0tquXcjIlKkz
 3Gx3o3k7mpf2WUhAaeAIr2Om+EUUONNkZJdNXXXrw72osuia28VjAPtlV7Y8un0ffX
 gWBaHz+8aNn0PfRlAPUgTEREgqDfm3QlNW/JhacsgHtpQPOm12RN8ULuKrU5XtwT1s
 KJlwRdCUbA6yWak9pgzptrUDw9hWuiH8qeoOAx29CdwAy1uERwKEYEoQ3iiJ1gqe4I
 EUl9uQ4NRZM+SvywAJ7xjE4wucdQu0cmXsLR0n3PZaEz1MG6uMNsownXmySNLPo+AE
 YKWm9/BlqTgXQ==
Date: Wed, 8 Oct 2025 16:53:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
Message-ID: <20251008-phenomenal-industrious-elk-eaa232@houat>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
 <aOZv88NgbjmT49N1@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="t7vafwztc4q25a7s"
Content-Disposition: inline
In-Reply-To: <aOZv88NgbjmT49N1@intel.com>
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


--t7vafwztc4q25a7s
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
MIME-Version: 1.0

On Wed, Oct 08, 2025 at 05:06:43PM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, Oct 08, 2025 at 02:04:03PM +0200, Maxime Ripard wrote:
> > The DP MST implementation relies on a drm_private_obj, that is
> > initialized by allocating and initializing a state, and then passing it
> > to drm_private_obj_init.
> >=20
> > Since we're gradually moving away from that pattern to the more
> > established one relying on a reset implementation, let's migrate this
> > instance to the new pattern.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++++++++++-=
--------
> >  1 file changed, 26 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gp=
u/drm/display/drm_dp_mst_topology.c
> > index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d15439=
e3da1dc02be472a20 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct drm=
_private_obj *obj,
> > =20
> >  	kfree(mst_state->commit_deps);
> >  	kfree(mst_state);
> >  }
> > =20
> > +static void drm_dp_mst_reset(struct drm_private_obj *obj)
> > +{
> > +	struct drm_dp_mst_topology_mgr *mgr =3D
> > +		to_dp_mst_topology_mgr(obj);
> > +	struct drm_dp_mst_topology_state *mst_state;
> > +
> > +	if (obj->state) {
> > +		drm_dp_mst_destroy_state(obj, obj->state);
> > +		obj->state =3D NULL;
>=20
> I'm not a big fan of this "free+reallocate without any way to handle
> failures" pattern.
>=20
> Currently i915 does not do any of this, and so there are no unhandled
> points of failure. But the mst and tunneling changes here force it on
> i915 as well.

A very theoretical point of failure. If I'm counting right,
drm_dp_mst_topology_state takes 72 bytes. Any GFP_KERNEL allocation
of less than 8 pages cannot fail.

So, sure, it's less satisfying to look at, but that's about it. It's
just as safe and reliable.

> I think for the common things it would be nicer to just implement
> the reset as just that "a reset of the current state", and leave
> the "let's play fast and loose with kmalloc() failures" to the
> drivers that want it.

I'm sorry, but I have no idea what you mean by that. It's using the
exact same pattern we've been using since forever for every driver
(except, apparently, i915).

What would you like to change to that pattern to accomodate i915
requirements?

Maxime

--t7vafwztc4q25a7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaOZ63AAKCRAnX84Zoj2+
djydAX9CYRBeu0UuJSwDFPfPIqC78jXdDouOvPfnpa7l9rAP7h8q6XA/dwe6wx2/
w1msNbsBfiwn0L5cezsTCAtnBXuzP7HsSRUee6oMXxvZ+b/aNoDjS29XpZxS6T4l
8aZ65f2MQA==
=djIX
-----END PGP SIGNATURE-----

--t7vafwztc4q25a7s--
