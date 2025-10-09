Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7BBC9929
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 16:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8BD10EA76;
	Thu,  9 Oct 2025 14:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mz5EUmdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B55310EA76
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 14:42:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 70A1D62306;
 Thu,  9 Oct 2025 14:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A54C4CEE7;
 Thu,  9 Oct 2025 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760020938;
 bh=+OhiWOXWcTaK7ktw5TBWpPkMrQDFlOxxj3NogjDwMU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mz5EUmdBaM8ijqxL98UMSpyC165r/Vfvy/UNWRBwPgETArKV88JXgvJGVNYGzinbZ
 CIMX0zihhVWtHgHxushbldpIWznupi0y9Bh9mM7KzCQoanaxY/Iowb7SNZGiz7KCdK
 IY5LK5ziHZ3iA6ZtltK8kVVfgLwPCI8GcUkTodQhaErLuVzGLgfEpF1AZ6vwyYxXnB
 g6pTaCdq0eVoHXGPz2/tdJSbMKwZ18KK1kEpOAPGEepewZqTPT4LkInsFqVcmA5ZZH
 67oRht2on7YZwaFzVwxIDRQ5W9vmgnVXflwpegF71KpwylsnNJjAmcUEt9lM24mTny
 P7PMTyDrLsCyA==
Date: Thu, 9 Oct 2025 16:42:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
Message-ID: <20251009-rigorous-nonchalant-cobra-f8bfa9@houat>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
 <aOZv88NgbjmT49N1@intel.com>
 <20251008-phenomenal-industrious-elk-eaa232@houat>
 <aOaNbCo8a-DDlDAc@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="w32iiu5fsjxymo64"
Content-Disposition: inline
In-Reply-To: <aOaNbCo8a-DDlDAc@intel.com>
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


--w32iiu5fsjxymo64
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
MIME-Version: 1.0

On Wed, Oct 08, 2025 at 07:12:28PM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, Oct 08, 2025 at 04:53:20PM +0200, Maxime Ripard wrote:
> > On Wed, Oct 08, 2025 at 05:06:43PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Wed, Oct 08, 2025 at 02:04:03PM +0200, Maxime Ripard wrote:
> > > > The DP MST implementation relies on a drm_private_obj, that is
> > > > initialized by allocating and initializing a state, and then passin=
g it
> > > > to drm_private_obj_init.
> > > >=20
> > > > Since we're gradually moving away from that pattern to the more
> > > > established one relying on a reset implementation, let's migrate th=
is
> > > > instance to the new pattern.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 +++++++++++++++=
+++---------
> > > >  1 file changed, 26 insertions(+), 13 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/driver=
s/gpu/drm/display/drm_dp_mst_topology.c
> > > > index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d1=
5439e3da1dc02be472a20 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > @@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct=
 drm_private_obj *obj,
> > > > =20
> > > >  	kfree(mst_state->commit_deps);
> > > >  	kfree(mst_state);
> > > >  }
> > > > =20
> > > > +static void drm_dp_mst_reset(struct drm_private_obj *obj)
> > > > +{
> > > > +	struct drm_dp_mst_topology_mgr *mgr =3D
> > > > +		to_dp_mst_topology_mgr(obj);
> > > > +	struct drm_dp_mst_topology_state *mst_state;
> > > > +
> > > > +	if (obj->state) {
> > > > +		drm_dp_mst_destroy_state(obj, obj->state);
> > > > +		obj->state =3D NULL;
> > >=20
> > > I'm not a big fan of this "free+reallocate without any way to handle
> > > failures" pattern.
> > >=20
> > > Currently i915 does not do any of this, and so there are no unhandled
> > > points of failure. But the mst and tunneling changes here force it on
> > > i915 as well.
> >=20
> > A very theoretical point of failure. If I'm counting right,
> > drm_dp_mst_topology_state takes 72 bytes. Any GFP_KERNEL allocation
> > of less than 8 pages cannot fail.
>=20
> Until you start to inject failures, or you blow up the size of the
> state. You wouldn't think to check for potential NULL pointer
> dereferences before doing that, nor should you have to.
>=20
> I'd rather not leave potential footguns lying around intentionally.

I'm not sure it's reasonable to expect a structure to grow by three
orders of magnitude, but we can add static build checks on the size of
the structure if it makes you more comfortable.

> > So, sure, it's less satisfying to look at, but that's about it. It's
> > just as safe and reliable.
> >=20
> > > I think for the common things it would be nicer to just implement
> > > the reset as just that "a reset of the current state", and leave
> > > the "let's play fast and loose with kmalloc() failures" to the
> > > drivers that want it.
> >=20
> > I'm sorry, but I have no idea what you mean by that. It's using the
> > exact same pattern we've been using since forever for every driver
> > (except, apparently, i915).
>=20
> The reset() stuff was added specifically to deal with drivers
> that didn't have readout. i915 has always had full readout and
> never needed it.
>=20
> > What would you like to change to that pattern to accomodate i915
> > requirements?
>=20
> I think the reset should be ideally done without reallocation,
> or perhaps just don't implement reset for the things that don't
> need it (mst and tunneling in this case).

I'll be leaving aside i915 because it's quite far from actually using
all that infrastructure. From what I understand, your main concern is
that the drm_private_obj would be reset during a suspend, and the DP
objs should actually persist.

Thomas has been floating the idea recently to create a new helper to
supersede reset which would only reset the state itself, and not the
hardware. If we're doing that split, I guess it would mean that we would
need a new callback to allocate the initial state, since reset does both.

Would you feel better about creating an atomic_create_state hook or
something?

Maxime

--w32iiu5fsjxymo64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaOfJwwAKCRAnX84Zoj2+
dtnuAYCLmNpLZvVYH2DSjw6b+LxpTjSOZ3tX+PgItTT43f1fL3ZSX3Px3bZI40v8
zNMOB8EBgJRBmFsxlPOqhW4mFWmm3IAvBHNgLhv47h5HQm9AayYLweE9ObFb72s5
NbJzj/Z1yw==
=po6O
-----END PGP SIGNATURE-----

--w32iiu5fsjxymo64--
