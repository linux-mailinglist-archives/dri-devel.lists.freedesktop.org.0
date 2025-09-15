Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93ADB579C1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9DA10E462;
	Mon, 15 Sep 2025 12:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="quetT4Fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144F210E462
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:03:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CCFD24183B;
 Mon, 15 Sep 2025 12:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB76C4CEF5;
 Mon, 15 Sep 2025 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757937800;
 bh=WuLW6lAPFE5PyqhbMcw8TeyxN6BUetFjGeRBiFQpsCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=quetT4FiIQ47f59x0E04GM/MPIVuEcIkcxc4B2sTCca+v01WcVV1oJYHao1WWkWzI
 lMF+1djqUbDZFqQtitwaIBE+6XmtZFotolOBYTRz4D3P0weBcJUY9bgxhPFwfcS6qD
 h1ga0kUpnsDFEqNKRMNIdKW5A9XD/YaWRQxx54UcUPPn97jBJBf0wko/f+eySNSKWv
 byvwukGiV7juqk8NnPY5PantKxKq5NJREf6Lgc6m8gY3asRszbX73TnELgp/vdpq0N
 +IlrUUrzAf0x8Fv7uHqIp2MxxO12huUVIr+oZaUDcUMrsO9Uf+Itg86ACFaIAp0Cif
 3kqQ+qrzNt02Q==
Date: Mon, 15 Sep 2025 14:03:17 +0200
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
Message-ID: <20250915-benign-rare-marmot-9fbb96@penduick>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
 <20250827-charming-arcane-stingray-cfb8b6@houat>
 <20250908154906.16693078@booty>
 <20250910-glittering-serval-of-piety-b32844@houat>
 <20250910184752.6c42f004@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="orln5b4aahbx7uil"
Content-Disposition: inline
In-Reply-To: <20250910184752.6c42f004@booty>
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


--orln5b4aahbx7uil
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
MIME-Version: 1.0

On Wed, Sep 10, 2025 at 06:47:52PM +0200, Luca Ceresoli wrote:
> On Wed, 10 Sep 2025 12:59:12 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Mon, Sep 08, 2025 at 03:49:06PM +0200, Luca Ceresoli wrote:
> > > Hi Maxime,
> > >=20
> > > On Wed, 27 Aug 2025 09:46:03 +0200
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > On Wed, Aug 20, 2025 at 01:13:02PM +0200, Luca Ceresoli wrote: =20
> > > > > Hello Maxime,
> > > > >=20
> > > > > On Tue, 19 Aug 2025 14:29:32 +0200
> > > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > >    =20
> > > > > > > @@ -1005,7 +1041,24 @@ static void sn65dsi83_remove(struct i2=
c_client *client)
> > > > > > >  {
> > > > > > >  	struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
> > > > > > > =20
> > > > > > > +	drm_bridge_unplug(&ctx->bridge);
> > > > > > >  	drm_bridge_remove(&ctx->bridge);     =20
> > > > > >=20
> > > > > > Shouldn't we merge drm_bridge_unplug with the release part of
> > > > > > devm_drm_bridge_alloc?   =20
> > > > >=20
> > > > > I'm not sure I got what you are suggesting here, sorry.
> > > > >=20
> > > > > Do you mean that __devm_drm_bridge_alloc() should add a devres ac=
tion
> > > > > to call drm_bridge_unplug(), so the unplug is called implicitly a=
nd
> > > > > does not need to be called explicitly by all drivers?   =20
> > > >=20
> > > > Yes
> > > >  =20
> > > > > If that's what you mean, I don't think that would work. Unless I'm
> > > > > missing something, devres actions are always invoked just after t=
he
> > > > > driver .remove callback.   =20
> > > >=20
> > > > Yes, they are called in reverse order of registration, after remove.
> > > >  =20
> > > > > But we need to call drm_bridge_unplug() at the beginning (or just
> > > > > before) .remove, at least for drivers that need to do something in
> > > > > .remove that cannot be done by devm.
> > > > >=20
> > > > > In pseudocode:
> > > > >=20
> > > > > mybridge_remove()
> > > > > {
> > > > >   drm_bridge_unplug(); <-- explicit call as in my patch
> > > > >   xyz_disable();
> > > > >   drm_bridge_unplug(); <-- implicitly done by devres
> > > > > }
> > > > >=20
> > > > > We want xyz_disable() to be done after drm_bridge_unplug(), so ot=
her
> > > > > code paths using drm_bridge_enter/exit() won't mess with xyz.   =
=20
> > > >=20
> > > > It's not clear to me why doing it before xyz_disable() is important
> > > > here? If anything, it would prevent from disabling the hardware for
> > > > example, even though you still have your memory mapping, clocks, po=
wer
> > > > domains, regulators, etc. to properly disable it.
> > > >=20
> > > > You're still correct that it's a bad idea though because we want to=
 do
> > > > it before we start freeing all those, so it needs to execute as the
> > > > before the devm actions ...
> > > >  =20
> > > > > devres actions cannot be added to be executed _before_ .remove, A=
FAIK.   =20
> > > >=20
> > > > ... and we can't do that either. =20
> > >=20
> > > I understand your words as "the drm_bridge_unplug() is OK where it is,
> > > your patch is OK in this respect". Correct?
> > >=20
> > > So if this is correct, and my reply on the devres cleanups is also
> > > correct (other reply in this thread), that means the whole patch is O=
K. =20
> >=20
> > I'm still confused why it's so important than in your example
> > xyz_disable must be called after drm_bridge_unplug.
>=20
> Let me clarify with an example.
>=20
> As I wrote in another reply, I have moved from a flag
> (disable_resources_needed) to a devres action as you had suggested, but
> the example here is based on the old flag because it is more explicit,
> code would be executed in the same order anyway, and, well, because I
> had written the example before the devres action conversion.
>=20
> Take these two functions (stripped versions of the actual ones):
>=20
> /* Same as proposed, but with _unplug moved at the end */
> static void sn65dsi83_remove()
> {
> 	struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
>=20
> 	drm_bridge_remove(&ctx->bridge);
> =09
> 	/*=20
> 	 * I moved the following code to a devm action, but keeping it
> 	 * explicit here for the discussion
> 	 */
> 	if (ctx->disable_resources_needed) {
> 		sn65dsi83_monitor_stop(ctx);
> 		regulator_disable(ctx->vcc);
> 	}
> =09
> 	drm_bridge_unplug(&ctx->bridge);     // At the end!
> }

First off, why do we need to have drm_bridge_unplug and
drm_bridge_remove separate?

If we were to mirror drm_dev_enter and drm_dev_unplug, drm_dev_unplug
calls drm_dev_unregister itself, and I can't find a reason where we
might want to split the two.

> static void sn65dsi83_atomic_disable()
> {
> 	if (!drm_bridge_enter(bridge, &idx))
> 		return;
>=20
> 	/* These 3 lines will be replaced by devm_release_action() */
> 	ctx->disable_resources_needed =3D false;
> 	sn65dsi83_monitor_stop(ctx);
> 	regulator_disable(ctx->vcc);
>=20
> 	drm_bridge_exit(idx);
> }
>=20
> Here the xyz_disable() in my pseudocode is the sn65dsi83_monitor_stop()
> + regulator_disable().
>=20
> If sn65dsi83_remove() and sn65dsi83_atomic_disable() were to happen
> concurrently, this sequence of events could happen:
>=20
> 1. atomic_disable:  drm_bridge_enter() -> OK, can go
> 2. remove:          drm_bridge_remove()
> 3. remove:          sn65dsi83_monitor_stop()
> 4. remove:          regulator_disable()
> 5. remove:          drm_bridge_unplug() -- too late to stop atomic_disable

drm_dev_unplug would also get delayed until drm_dev_exit is called,
mitigating your issue here.

> 6. atomic_disable:  ctx->disable_resources_needed =3D false -- too late t=
o stop .remove
> 7. atomic_disable:  sn65dsi83_monitor_stop() -- twice, maybe no problem
> 8. atomic_disable:  regulator_disable() -- Twice, en/disable imbalance!
>=20
> So there is an excess regulator disable, which is an error. I don't see
> how this can be avoided if the drm_bridge_unplug() is called after the
> regulator_disable().
>=20
> Let me know whether this clarifies the need to _unplug at the beginning
> of the .remove function.

Another thing that just crossed my mind is why we don't call
atomic_disable when we're tearing down the bridge too. We're doing it
for the main DRM devices, it would make sense to me to disable the
encoder -> bridge -> connector (and possibly CRTC) chain if we remove a
bridge automatically.

Maxime

--orln5b4aahbx7uil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMgAhQAKCRAnX84Zoj2+
diuSAX0bYflXNYWeq+Kg3B/9hb1awVO2kPt2/xPRe2UzASnAxIPzr+HwpCkyfRlb
ALCl5H4BgNJFrSJ8Lh/qlbOUO1ZOZt3PRaIVzWsaW8eURebzQd4zYZZ7Y2oeXuVw
tvofKkipNg==
=wrQe
-----END PGP SIGNATURE-----

--orln5b4aahbx7uil--
