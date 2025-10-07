Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A61BC1DED
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED9F10E6D0;
	Tue,  7 Oct 2025 15:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RVrh9jHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C53910E6D0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 466BA43A17;
 Tue,  7 Oct 2025 15:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC617C4CEF1;
 Tue,  7 Oct 2025 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759849790;
 bh=avOyeg1m+eplsvWMyciACAxlCd32fi+x94S5/Z9UVN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RVrh9jHFPfdLBsiPJQ0DVbGFd0bFhl0kL25RjT4KVUiC/mwwwZGAJ3e9REDz2yoFb
 q4ZsiqzbzGTecaS8xG0nlBuXMjZQnWa9zLKmtgLZcZAv7EQfkodz4LW3No5iwGjyCi
 vGDqzJ2oNF6hRWdOgxRVRRB21NClGHVTmBFqY4pjVyADf3ly1TKBEl7ZdCMqB0w6Zi
 HBlrF/8Mpv0R0l+sphmFOKii+9/58bktSpNKh5ZSWbv/LwXpn3EyMJwjlXtevlZQ+z
 3dBdZFKJbr/2WL08a2VUCL2xcm+G3rIS83eoHeHAL/uGjx1CO+b99T9KWfuVHcQusN
 lroJ6WZtCScdA==
Date: Tue, 7 Oct 2025 17:09:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
Message-ID: <20251007-charming-successful-foxhound-1ca192@penduick>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
 <20250827-charming-arcane-stingray-cfb8b6@houat>
 <20250908154906.16693078@booty>
 <20250910-glittering-serval-of-piety-b32844@houat>
 <20250910184752.6c42f004@booty>
 <20250915-benign-rare-marmot-9fbb96@penduick>
 <20250915165156.35378299@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="s65hntyyqmm23soq"
Content-Disposition: inline
In-Reply-To: <20250915165156.35378299@booty>
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


--s65hntyyqmm23soq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 04:51:56PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> thanks for the feedback, this discussion is getting very interesting!
>=20
> On Mon, 15 Sep 2025 14:03:17 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > > > I'm still confused why it's so important than in your example
> > > > xyz_disable must be called after drm_bridge_unplug. =20
> > >=20
> > > Let me clarify with an example.
> > >=20
> > > As I wrote in another reply, I have moved from a flag
> > > (disable_resources_needed) to a devres action as you had suggested, b=
ut
> > > the example here is based on the old flag because it is more explicit,
> > > code would be executed in the same order anyway, and, well, because I
> > > had written the example before the devres action conversion.
> > >=20
> > > Take these two functions (stripped versions of the actual ones):
> > >=20
> > > /* Same as proposed, but with _unplug moved at the end */
> > > static void sn65dsi83_remove()
> > > {
> > > 	struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
> > >=20
> > > 	drm_bridge_remove(&ctx->bridge);
> > > =09
> > > 	/*=20
> > > 	 * I moved the following code to a devm action, but keeping it
> > > 	 * explicit here for the discussion
> > > 	 */
> > > 	if (ctx->disable_resources_needed) {
> > > 		sn65dsi83_monitor_stop(ctx);
> > > 		regulator_disable(ctx->vcc);
> > > 	}
> > > =09
> > > 	drm_bridge_unplug(&ctx->bridge);     // At the end!
> > > } =20
> >=20
> > First off, why do we need to have drm_bridge_unplug and
> > drm_bridge_remove separate?
> >=20
> > If we were to mirror drm_dev_enter and drm_dev_unplug, drm_dev_unplug
> > calls drm_dev_unregister itself, and I can't find a reason where we
> > might want to split the two.
>=20
> I think it could make sense and I'm definitely open to it.
>=20
> After a quick analysis I have mostly one concern. Calls
> to drm_bridge_add() and drm_bridge_remove() are balanced in current
> code and that's very intuitive. If drm_bridge_unplug() were to call
> drm_bridge_remove(), that symmetry would disappear. Some drivers would
> still need to call drm_bridge_remove() directly (e.g. the DSI host
> drivers which _add/remove() in the DSI attach/detach callbacks), while
> other wouldn't because drm_bridge_unplug() would do that.
>=20
> What do you think about this?

Which DSI host do you have in mind there? Because it's really not what
we document.

> Another concern I initially had is about drivers whose usage of
> drm_bridge is more complex than the average. Most simple drivers just
> call drm_bridge_remove() in their .remove callback and that's
> straightforward. I was suspicious about drivers such as
> imx8qxp-pixel-combiner which instantiate multiple bridges, and whether
> they need do all the drm_bridge_unplug()s before all the
> drm_bridge_remove()s. However I don't think that's a real need because,
> except for probe and removal, operations on bridges happen on a
> per-bridge basis, so each bridge is independent from others, at least
> for the driver I mentioned.

In this particular case, they would be unplugged all at the same time,
right? In which case, we would disable all the bridges starting from the
one in the chain that just got removed, and then we just have to remove
all of them.

All in all, I think it's ok to somewhat break things here: all this was
broken before. If we want to bring some consistency, we will have to
reduce what bridges are allowed to do. Let's figure out something that
works for all reasonable cases (straightforward, component framework,
DSI device, DSI host, and DSI device on another bus), and the hacky
drivers will move eventually.

That's pretty easy to solve with a documentation update :)

We can just further restrict the order in which

> > > static void sn65dsi83_atomic_disable()
> > > {
> > > 	if (!drm_bridge_enter(bridge, &idx))
> > > 		return;
> > >=20
> > > 	/* These 3 lines will be replaced by devm_release_action() */
> > > 	ctx->disable_resources_needed =3D false;
> > > 	sn65dsi83_monitor_stop(ctx);
> > > 	regulator_disable(ctx->vcc);
> > >=20
> > > 	drm_bridge_exit(idx);
> > > }
> > >=20
> > > Here the xyz_disable() in my pseudocode is the sn65dsi83_monitor_stop=
()
> > > + regulator_disable().
> > >=20
> > > If sn65dsi83_remove() and sn65dsi83_atomic_disable() were to happen
> > > concurrently, this sequence of events could happen:
> > >=20
> > > 1. atomic_disable:  drm_bridge_enter() -> OK, can go
> > > 2. remove:          drm_bridge_remove()
> > > 3. remove:          sn65dsi83_monitor_stop()
> > > 4. remove:          regulator_disable()
> > > 5. remove:          drm_bridge_unplug() -- too late to stop atomic_di=
sable =20
> >=20
> > drm_dev_unplug would also get delayed until drm_dev_exit is called,
> > mitigating your issue here.
>=20
> I don't think I got what you mean. With the above code the regulator
> would still be subject to an en/disable imbalance.

My point was that drm_bridge_remove wouldn't be allowed to execute until
after atomic_disable has called drm_bridge_exit. So we wouldn't have the
sequence of events you described. atomic_disable would disable the
bridge, and then drm_bridge_remove wouln't have anything to disable
anymore by the time it runs.

> However I realized the problem does not exist when using devres,
> because devres itself takes care of executing each release function only
> once, by means of a spinlock.
>=20
> I think using devres actually solves my concerns about removal during
> atomic[_post]_disable, but also for the atomic[_pre]_enable and other
> call paths. Also, I think it makes the question of which goes first
> (drm_bridge_unplug() or _remove()) way less relevant.
>=20
> The concern is probably still valid for drivers which don't use devres.
> However the concern is irrelevant until there is a need for a bridge to
> become hot-pluggable. At that point a driver needs to either move to
> devres or take other actions to avoid incurring in the same issue.

I disagree with that statement. We never considered !devres as outdated,
and thus we need to support both. Especially if it's about races we know
about in a code path we might never run.

> I'm going to send soon a v2 with my devres changes so we can continue
> this discussion on actual code.
>=20
> > > 6. atomic_disable:  ctx->disable_resources_needed =3D false -- too la=
te to stop .remove
> > > 7. atomic_disable:  sn65dsi83_monitor_stop() -- twice, maybe no probl=
em
> > > 8. atomic_disable:  regulator_disable() -- Twice, en/disable imbalanc=
e!
> > >=20
> > > So there is an excess regulator disable, which is an error. I don't s=
ee
> > > how this can be avoided if the drm_bridge_unplug() is called after the
> > > regulator_disable().
> > >=20
> > > Let me know whether this clarifies the need to _unplug at the beginni=
ng
> > > of the .remove function. =20
> >=20
> > Another thing that just crossed my mind is why we don't call
> > atomic_disable when we're tearing down the bridge too. We're doing it
> > for the main DRM devices, it would make sense to me to disable the
> > encoder -> bridge -> connector (and possibly CRTC) chain if we remove a
> > bridge automatically.
>=20
> Uh, interesting idea.
>=20
> Do you mean something like:
>=20
> void drm_bridge_unplug(struct drm_bridge *bridge)
> {
>     bridge->unplugged =3D true;
>     synchronize_srcu(&drm_bridge_unplug_srcu);
>=20
>     drm_bridge_remove(bridge); // as per discussion above
>=20
>     drm_atomic_helper_shutdown(bridge->dev);
> }
>=20
> ?
>=20
> I'm not sure which is the right call to tear down the pipeline though.

No, the shutdown needs to happen before marking the bridge unplugged,
otherwise you'll never run the disable callbacks.

And we probably shouldn't disable the whole device, just everything from
the CRTC that feeds the bridge.

Maxime

--s65hntyyqmm23soq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaOUtNgAKCRAnX84Zoj2+
dh1oAX983qrqMiiWRa9MAkz8E/6TsqVVBWd5TC7XBazrUxZ7ACLJurGc7eSK+pTD
/COsRzUBf3jo9cN4xwZzPMQuhuM5dbWy8dI1RF4xyOnNtCLzrEkzZPsODVW9wIBK
QMJvqTNupQ==
=96M8
-----END PGP SIGNATURE-----

--s65hntyyqmm23soq--
