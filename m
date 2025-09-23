Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBD6B95445
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0571210E091;
	Tue, 23 Sep 2025 09:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ObE97Wtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B656B10E091
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:33:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DE68360203;
 Tue, 23 Sep 2025 09:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9BAC4CEF5;
 Tue, 23 Sep 2025 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758619992;
 bh=EWvxTbo7vKi266KfFZvyHwLR/d5yx4trxnrUlnNyNwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ObE97WtlSj/ZXle5qAaQvnjFddvcvPfzOkV18RSkebWHz2aqwzm4vbO9nMltqQCnb
 sFsFmV58LdkGCFn3PurFcb6vRQoAYMRqChq4/+JONjsDNq3LKezH4MqyfWYUe2nV2t
 DVW8VzAGkGD1wrFs+QVcoJ41teYCIw6Ea7k5MaBL4g3O1YMZnj+BWBOcoVC/wiyN0K
 4vGxSUoHvn/dbO9q1APgZlf1gntNX5JZBtDXv1vQ1mif6O62kpY16ZQSxC5hEkJ/oc
 RKfCTATJDeDGdMkE2ddBwmRxvHrY51TRKi47SJZVXLrvbeOmNVweB6CWgyuoABGXZG
 37KDynH5GHgEA==
Date: Tue, 23 Sep 2025 11:33:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/29] drm/atomic_state_helper: Fix bridge state
 initialization
Message-ID: <20250923-dynamic-bumblebee-of-luck-d31a19@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-5-14ad5315da3f@kernel.org>
 <9f17dfd9-a4d4-41e9-b988-bd8ca858e5e7@suse.de>
 <20250915-heavenly-athletic-lionfish-aa7b8b@penduick>
 <9520bcb5-df81-452c-902a-0c4c61156716@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="frbjwb35klyzeh7q"
Content-Disposition: inline
In-Reply-To: <9520bcb5-df81-452c-902a-0c4c61156716@suse.de>
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


--frbjwb35klyzeh7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/29] drm/atomic_state_helper: Fix bridge state
 initialization
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 03:12:11PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 15.09.25 um 13:27 schrieb Maxime Ripard:
> > On Tue, Sep 02, 2025 at 03:18:17PM +0200, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> > > > Bridges implement their state using a drm_private_obj and an
> > > > hand-crafted reset implementation.
> > > >=20
> > > > Since drm_private_obj doesn't have a set of reset helper like the o=
ther
> > > > states, __drm_atomic_helper_bridge_reset() was initializing both the
> > > > drm_private_state and the drm_bridge_state structures.
> > > >=20
> > > > This initialization however was missing the drm_private_state.obj
> > > > pointer to the drm_private_obj the state was allocated for, creatin=
g a
> > > > NULL pointer dereference when trying to access it.
> > > >=20
> > > > Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >    drivers/gpu/drm/drm_atomic_state_helper.c | 8 ++++++++
> > > >    1 file changed, 8 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gp=
u/drm/drm_atomic_state_helper.c
> > > > index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..b962c342b16aabf4e3b=
ea52a914e5deb1c2080ce 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > > @@ -707,10 +707,17 @@ void drm_atomic_helper_connector_destroy_stat=
e(struct drm_connector *connector,
> > > >    	__drm_atomic_helper_connector_destroy_state(state);
> > > >    	kfree(state);
> > > >    }
> > > >    EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
> > > > +static void __drm_atomic_helper_private_obj_reset(struct drm_priva=
te_obj *obj,
> > > > +						  struct drm_private_state *state)
> > > > +{
> > > > +	memset(state, 0, sizeof(*state));
> > > This argument is guaranteed to be zero'd, I think. No need for a mems=
et.
> > >=20
> > > > +	state->obj =3D obj;
> > > > +}
> > > > +
> > > >    /**
> > > >     * __drm_atomic_helper_private_obj_duplicate_state - copy atomic=
 private state
> > > >     * @obj: CRTC object
> > > >     * @state: new private object state
> > > >     *
> > > > @@ -796,10 +803,11 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_destro=
y_state);
> > > >     */
> > > >    void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> > > >    				      struct drm_bridge_state *state)
> > > >    {
> > > >    	memset(state, 0, sizeof(*state));
> > > Another unnecessary memset?
> > I guess the two can be seen as redundant, but I'd argue the one in
> > __drm_atomic_helper_private_obj_reset should still be there.
> >=20
> > What guarantees that the pointer points to a zero'd structure?
>=20
> We only call this helper after allocation AFAICT. And the DRM APIs already
> assume that allocation clears to zero.

Really? Do we have that documented anywhere?

And even then, there's nothing that requires that helper to be called
straight-away after allocation.

More importantly, do we really care about skipping them? Like, all the
other reset helpers are doing it, it's cheap, safe, why should we remove
it?

Maxime

--frbjwb35klyzeh7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNJpVQAKCRAnX84Zoj2+
duUvAX9Lzm4vCCIENysKhaUyq0wlGHpS5/QdST4wpfzZBpHGXCQaPi93H/c6SXgH
EWuubC0BdiKzSrYEsYgRODAmMRZT2pNx4kZRxI43Y7LGFk1GEwML7YLFiC/n/0RP
IqyeNqzk
=a0IJ
-----END PGP SIGNATURE-----

--frbjwb35klyzeh7q--
