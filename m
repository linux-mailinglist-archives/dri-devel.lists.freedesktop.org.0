Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D54215314
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90456E30C;
	Mon,  6 Jul 2020 07:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8FB6E58B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 16:38:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DD0FA5C00B7;
 Fri,  3 Jul 2020 12:38:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 03 Jul 2020 12:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=XJkTvo56r2N6jmwScQNHOxenygn
 ZIfaYALQkD+578Uw=; b=oxLLV5JyO9vFKhIl2rHalY1P4sKS8uAk8uhYIw57HVa
 SkSk+0Qyq4i92QvAhTreh5VsEdtGpWWs/6pK2lvBGd12j6ZiDqk55NUXEEA+1i5o
 enEGHnMA8ciYxWVU6D2RaMkE1pJEe5UXewkCrBuBQJXUfTUgSp0CkcGR14qB+e/F
 Eh1d6dJD7vX9/HJdtlkwyqID8x5TlXPknGY6iPfEcBGorlnWcgtTwgyCkXnAIBm4
 fWueJ44fZwIpZFn9zKUsdCyCUG7tKUHrESQNRfk9nQbUSrfbuWqQfqyo9sXwovuP
 MhH14G7iKuaF4Fb10o561XmXlsnF12a3vZmBhdq189A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XJkTvo
 56r2N6jmwScQNHOxenygnZIfaYALQkD+578Uw=; b=b9tNi7dtpiGXXwEeiVXSk8
 sZvx9YycR1fOk1DbaDguLOGHHMhuST1QOUM/co6hwtOUPQ3utxO53CfYXMgkmIqC
 1RNgrqrLYAskROpSeMA7fbNaYjeLFWnt8/6/K/DGi65TRz4BdR2znaatM1wIKnEZ
 Nll3nlSdHDecsI4IAl3dI6KSfvVj39YWHCDDs02JS5YEOWkAmcs9Doz731iH7cXM
 DKQGFe/tyOlx6K/8LQ6SAO4Cvs0HUreimiQpMJauX8YZFiJix7f9FtYxLWroK66P
 OeDjyVsFYUbsHFButg4QJ12jD+v1mrB2AhxaEJ9hUdOF8dbm2qq3LWEAwI4XnOUA
 ==
X-ME-Sender: <xms:8F7_XpseovPSbkmNsz-0lY6ccepk4huDxuaikBIf_7Z5sD2BhU-lNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeigddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8F7_XidmYEyTReqPBWH_2AvI9jgK5JwcgadiXpJRJpcJ6zdTlvllQg>
 <xmx:8F7_XszgJhaUM3MFDc6or6iQde1m7G6mlTPzwP8A2bRXmHIsQccJCw>
 <xmx:8F7_XgNreMVy53BU58qH5OvTSVpfKGFFCxzuZc5brLPV3xphmQk-Qg>
 <xmx:8l7_XpxgEMoCiCzNT15FyqiJjLRdNW-dvpkFG7d9VS0q9Q07YlCTxA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B290328006B;
 Fri,  3 Jul 2020 12:38:08 -0400 (EDT)
Date: Fri, 3 Jul 2020 18:38:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: DSI probe/bind ordering in vc4
Message-ID: <20200703163806.ppi6ckmkk4jvlu72@gilmour.lan>
References: <CGME20200701071310eucas1p1881528cda359db40be582d71c02c3d81@eucas1p1.samsung.com>
 <20200630132711.ezywhvoiuv3swo57@gilmour.lan>
 <e20d7884-7a3c-4707-dc7a-742ccb753515@samsung.com>
MIME-Version: 1.0
In-Reply-To: <e20d7884-7a3c-4707-dc7a-742ccb753515@samsung.com>
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0513131538=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0513131538==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uch5g2w5qu4qo6yk"
Content-Disposition: inline


--uch5g2w5qu4qo6yk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jul 03, 2020 at 05:47:08PM +0200, Andrzej Hajda wrote:
> On 30.06.2020 15:27, Maxime Ripard wrote:
> > I've tried to bring-up the DSI controller on the RaspberryPi4, and I've
> > just encountered something that could make it troublesome to support.
> >=20
> > For context, the RaspberryPi has an official panel that uses a DSI->DPI
> > bridge, a DPI panel, a touchscreen and a small micro-controller. That
> > microcontroller controls the power management on the screen, so
> > communicating with it is very much needed, and it's done through an i2c
> > bus.
> >=20
> > To reflect that, the entire panel has been described in the Device Tree
> > as an I2C device (since that's how you would control it), together with
> > an OF-Graph endpoint linking that i2c device to the DSI controller[1].
> >=20
> > That deviates a bit from the generic DSI binding though[2], since it
> > requires that the panel should be a subnode of the DSI controller (which
> > also makes sense since DCS commands is usually how you would control
> > that device).
> >=20
> > This is where the trouble begins. Since the two devices are on entirely
> > different buses, there's basically no guarantee on the probe order. The
> > driver has tried to address this by using the OF-Graph and the component
> > framework. Indeed, the DSI driver (component-based) will register a
> > MIPI-DSI host in its probe, and call component_add[3]. If component_add
> > fails, it will remove the DSI host and return the error code. It makes
> > sense.
> >=20
> > The panel on the other hand will probe, and look for a DSI host through
> > the OF-Graph [4]. If it isn't there, it will return EPROBE_DEFER, hoping
> > that it will be available at some point. It also makes complete sense.
> >=20
> > Where the issue lies is that component_add has two very different
> > behaviours here that will create the bug that we see on the RPi4:
> >=20
> >    - If there's still components to probe, component_add will simply
> >      return 0 [5][6]
> >=20
> >    - And if we're the last component to probe, component_add will then
> >      run all the bind callbacks and return the result on error of the
> >      master bind callback[7]. That master bind will usually have
> >      component_bind_all that will return the result of the bind callback
> >      of each component.
> >=20
> > Now, on the RPi4, the last component to probe is the DSI controller
> > since it relies on a power-domain exposed by the firmware driver, so the
> > driver core will defer its probe function until the power-domain is
> > there [8]. We're thus pretty much guaranteed to fall in the second case
> > above and run through all the bind callbacks. The DSI bind callback
> > however will try to find and attach its panel, and return EPROBE_DEFER
> > if it doesn't find it[9]. That error will then be propagated to the
> > return code of component_bind_all, then to the master bind callback, and
> > finally will be the return code of component_add.
> >=20
> > And since component_add is failing, we remove the DSI host. Since the
> > DSI host isn't there, on the next occasion the i2c panel driver will not
> > probe either, and we enter a loop that cannot really be broken, since
> > one depends on the other.
> >=20
> > This was working on the RPi3 because the DSI is not the last driver to
> > probe: indeed the v3d is depending on the same power domain[10][11] and
> > is further down the list of components to add in the driver [12], so
> > we're always in the first component_add case for DSI above, the DSI host
> > sticks around, and the i2c driver can probe.
> >=20
> > I'm not entirely sure how we can fix that though. I guess the real flaw
> > here is the assumption that component_add will not fail if one of the
> > bind fails, which isn't true, but we can't really ignore those errors
> > either since it might be something else than DSI that returns that
> > error.
> >=20
> > One way to work around it is to make the mailbox, firmware and power
> > domain drivers probe earlier by tweaking the initcalls at which they
> > register, but it's not really fixing anything and compiling them as
> > module would make it broken again.
>=20
>=20
> Forgive me - I have not read whole post, but I hope you have a problem
> already solved.
>=20
> As I understand you have:
>=20
> 1. Componentized DSI-host.
>=20
> 2. Some sink laying on DSI bus.
>=20
>=20
> General rule I promote: "do not expose functionality, until you have all
> dependencies", in this case it would be "do not call component_add until =
you
> know sink(your dependency) is ready".
>=20
>=20
> Already tested solution (to be checked in drivers):
>=20
> 1. In DSI-host you register dsi bus in probe, but do not call component_a=
dd.
>=20
> 2. In DSI-host callback informing about DSI device registration you get t=
he
> sink and since you have all resources then you call component_add.

That's a great idea :)

I just tested and it works, so it ended up to much easier to fix than I ant=
icipated :)

Thanks!
Maxime

--uch5g2w5qu4qo6yk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXv9e7gAKCRDj7w1vZxhR
xUlOAQDtVwd0OfTy7P0sv3FWdpaJL9miporcaFA8nUOk1EEUtQD9HddmsdqTW9QG
3PAsQR+t9sR1tMVKruWHJFcfBEToYgI=
=l2aX
-----END PGP SIGNATURE-----

--uch5g2w5qu4qo6yk--

--===============0513131538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0513131538==--
