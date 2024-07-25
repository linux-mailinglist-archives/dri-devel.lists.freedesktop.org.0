Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B493C0CC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 13:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A6B10E75D;
	Thu, 25 Jul 2024 11:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OR49yhDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB43110E75D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 11:28:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0051161198;
 Thu, 25 Jul 2024 11:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597CEC116B1;
 Thu, 25 Jul 2024 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721906896;
 bh=yzzgqIedm7UkGND44lmofMFbTVRfp7XzhjzlsCBN9Ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OR49yhDVldxII3eVP9V3yu+Xh+kFzPs2Y9QCYmKJ1arm5m5lHb4w70wNVLGdQ92xd
 0cssA76/Qbyhp6tlxGVImajJe+htAsfQidalG3RQEXUOnCpEAIRp6Cec77FLY77Ygh
 I6WrpO3i6sMTSppp72HwZApXkMSfcx7eaGvepGTq3QAEBLZXjeIiSIkO/jmsajwPw5
 T/WCsrvpe3TBWdPSpqefwTQg7g+q36wKkz/6V9luKeLopAfBeY7mtZTL0HN/UuH5/w
 ljJnH5ghgIy7OUgQWGn3aNffZ5wRngkASEuA+2nQ8FjIqA2Da98rb4IRm+K+I1OfaG
 Ua2K+6Y5W2fiA==
Date: Thu, 25 Jul 2024 13:28:14 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
Message-ID: <20240725-natural-giga-crane-d54067@houat>
References: <20240619-dsi-devres-fix-v1-1-a5c59310a52e@ideasonboard.com>
 <20240626-gabby-ladybug-of-freedom-08e6eb@houat>
 <66ab4206-d1c8-4aad-99a7-c4c316e343a9@ideasonboard.com>
 <20240626-warping-nondescript-mustang-bfce27@houat>
 <b7cf71b8-76fd-4638-a7b6-cc8dbae635bf@ideasonboard.com>
 <20240702-bold-exotic-mamba-fdbba4@houat>
 <7293448e-e8cc-4522-b39c-5ad133e5f732@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="o4vwwra3conych5x"
Content-Disposition: inline
In-Reply-To: <7293448e-e8cc-4522-b39c-5ad133e5f732@ideasonboard.com>
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


--o4vwwra3conych5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 11:32:34AM GMT, Tomi Valkeinen wrote:
> On 02/07/2024 14:43, Maxime Ripard wrote:
> > Hi Tomi,
> >=20
> > On Wed, Jun 26, 2024 at 06:53:40PM GMT, Tomi Valkeinen wrote:
> > > On 26/06/2024 18:07, Maxime Ripard wrote:
> > > > On Wed, Jun 26, 2024 at 12:55:39PM GMT, Tomi Valkeinen wrote:
> > > > > On 26/06/2024 11:49, Maxime Ripard wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeinen wrote:
> > > > > > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > > > >=20
> > > > > > > When a bridge driver uses devm_mipi_dsi_device_register_full(=
) or
> > > > > > > devm_mipi_dsi_attach(), the resource management is moved to d=
evres,
> > > > > > > which releases the resource automatically when the bridge dri=
ver is
> > > > > > > unbound.
> > > > > > >=20
> > > > > > > However, if the DSI host goes away first, the host unregistra=
tion code
> > > > > > > will automatically detach and unregister any DSI peripherals,=
 without
> > > > > > > notifying the devres about it. So when the bridge driver late=
r is
> > > > > > > unbound, the resources are released a second time, leading to=
 crash.
> > > > > >=20
> > > > > > That's super surprising. mipi_dsi_device_unregister calls
> > > > > > device_unregister, which calls device_del, which in turn calls
> > > > > > devres_release_all.
> > > > >=20
> > > > > Hmm, right.
> > > > >=20
> > > > > > If that doesn't work like that, then it's what needs to be fixe=
d, and
> > > > > > not worked around in the MIPI-DSI bus.
> > > > >=20
> > > > > Well, something causes a crash for both the device register/unreg=
ister case
> > > > > and the attach/detach case, and the call stacks and debug prints =
showed a
> > > > > double unregister/detach...
> > > > >=20
> > > > > I need to dig up the board and check again why the devres_release=
_all() in
> > > > > device_del() doesn't solve this. But I can probably only get back=
 to this in
> > > > > August, so it's perhaps best to ignore this patch for now.
> > > > >=20
> > > > > However, the attach/detach case is still valid? I see no devres c=
alls in the
> > > > > detach paths.
> > > >=20
> > > > I'm not sure what you mean by the attach/detach case. Do you expect
> > > > device resources allocated in attach to be freed when detach run?
> > >=20
> > > Ah, never mind, the devres_release_all() would of course deal with th=
at too.
> > >=20
> > > However, I just realized/remembered why it crashes.
> > >=20
> > > devm_mipi_dsi_device_register_full() and devm_mipi_dsi_attach() are g=
iven a
> > > device which is used for the devres. This device is probably always t=
he
> > > bridge device. So when the bridge device goes away, so do those resou=
rces.
> > >=20
> > > The mipi_dsi_device_unregister() call deals with a DSI device, which =
was
> > > created in devm_mipi_dsi_device_register_full(). Unregistering that D=
SI
> > > device, which does happen when the DSI host is removed, does not affe=
ct the
> > > devres of the bridge.
> > >=20
> > > So, unloading the DSI host driver causes mipi_dsi_device_unregister()=
 and
> > > mipi_dsi_detach() to be called (as part of mipi_dsi_host_unregister()=
), and
> > > unloading the bridge driver causes them to be called again via devres.
> >=20
> > Sorry, that's one of the things I don't quite get. Both functions are
> > exclusively(?) called from I2C bridges, so the device passed there
> > should be a i2c_client instance, and thus the MIPI-DSI host going away
> > will not remove those i2c devices, only the MIPI-DSI ones, right?
>=20
> Yes.
>=20
> > So if we remove the host, the MIPI-DSI device will be detached and
> > removed through the path you were explaing with the i2c client lingering
> > around. And if we remove the I2C device, then devm will kick in and will
> > detach and remove the MIPI-DSI device.
>=20
> Right.
>=20
> > Or is it the other way around? That if you remove the host, the device
> > is properly detached and removed, but there's still the devm actions
> > lingering around in the i2c device with pointers to the mipi_dsi_device
> > that was first created, but since destroyed?
> >=20
> > And thus, if the i2c device ever goes away, we get a use-after-free?
>=20
> Hmm, I'm not sure I understand what you mean here... Aren't you describing
> the same thing in both of these cases?
>=20
> In any case, to expand the description a bit, module unloading is quite
> fragile. I do get a crash if I first unload the i2c bridge module, and on=
ly
> then go and unload the other ones in the DRM pipeline. But I think module
> unloading will very easily crash, whatever the DRM drivers being used are,
> so it's not related to this particular issue.
>=20
> In my view, the unload sequence that should be supported (for development
> purposes, not for production) is to start the unload from the display
> controller module, which tears down the DRM pipeline, and going from there
> towards the panels/connectors.
>=20
> Of course, it would be very nice if the module unloading worked perfectly,
> but afaics fixing all that's related to module unloading would be a
> multi-year project... So, I just want to keep the sequence I described ab=
ove
> working, which allows using modules while doing driver development.

FTR, I'm all for supporting module unloading. The discussion above was
about what is broken exactly, so we can come up with a good solution.

Maxime

--o4vwwra3conych5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqI2zQAKCRAnX84Zoj2+
dkcZAYCI4jX4gYx75gqO9IlGoZVtAv7kY8qaJU9BxrUkiIF5zwmz3KiSas4D9gHU
ycVDavQBgIw7M4gj5p4ZVZnLCUbsCEz0589h46yY++zcJADl/AIKjP2WjDNwDATN
LmB0uP1NJA==
=dtpx
-----END PGP SIGNATURE-----

--o4vwwra3conych5x--
