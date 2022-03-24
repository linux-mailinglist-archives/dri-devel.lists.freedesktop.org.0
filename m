Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E044E6505
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BCC10E8CE;
	Thu, 24 Mar 2022 14:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795C810E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:23:33 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 800833200FA9;
 Thu, 24 Mar 2022 10:23:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 24 Mar 2022 10:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=BAtPvAjSsi0nB6PDOyaklBbscwTc5uTvowGLL4
 pcVqw=; b=BBPaR+Fvvl+JvOzRjkvSf+DONBCzVF15WuJfF3HjSyk90cFy/UXVO2
 xTHAP0aYWNGN/ptB/+fEfUG/bPBmDm3b6lDboJMMNHti6xhcKov31o5XcvkRLXxL
 ev4lMR9KeOGw71UyTHVNKpUpurwKnb5ptBxAmzrGvVImSmQIHyCI0mhFuq7ulcRP
 ErOpbAhJfLZK1+1R/6wLQNzgBkkcrKDx8Jz+EPWhtTIpT3FTzhiDNoVllzAHv5HH
 nA4ByWKLGunvJVb6lNIPuhdGERnYRd0w/afJEFPybNZA3gFrU0KodAJKa9gnvTCm
 zw0STCmKgIzfmB9/wP/lqGm8gXnzs6rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BAtPvAjSsi0nB6PDO
 yaklBbscwTc5uTvowGLL4pcVqw=; b=NJL83sDtHTj9BSo+P1EjWsc/3b10qaxn4
 P0M9dRPc5lT92dJQz0SwROKKIvTBmb8cSV2wB0uxpU0yfUp7pyUszQ5kU8JhVqGE
 1xlljLYoIVxx8TR2w3ddZ5FLh5C04VU3jd5NaS2R0pVb4I68wgyRAiGQLU1/51+k
 mwmwIGt+m3IZxY8Sn1xL5QaGJyq6kJrC4pnYBJrvBM0vI4Nqea7yTihIFrjXSfRV
 /FhHjADI+0aPVJTgJ2P14z0xrxGA03NgtHsQw83OIy9ii5MxTgmAP3xSgLH09rh5
 I4cPGhY51igCSqMhBYBPoBEbL8blrk4DVwIlwNI04EPmCF3GGrXSw==
X-ME-Sender: <xms:3n48YgNB_ksH9apvykhRB4m7dVUdH2tE26DPSrt38ndKOPrrPEZVAA>
 <xme:3n48Ym98ZJp_wxCL6n0xvadIRJuQzJuWF4IZwGBApTSiQ6NU8-sJ461uE_7K5b_nT
 rWSpLFd6u-339F_tG4>
X-ME-Received: <xmr:3n48YnQNSfQMMxrZrd7-DIBp1JqB6TMHcSyv7uAGXujOuALB9IJbVvUJcSohizubIi6vUXSGOjy0m43O_UUZtogLjQymsKsBGzbLJNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3n48YoteBOlXOBDsaqF1OimX7k5Py5Wy-nh7ngRwUNxQ2TW9HsV5gg>
 <xmx:3n48YofnNBLh9JlHSZNa-kaV55fZFwCZ-7OwElaUU1SodCwON1QnOQ>
 <xmx:3n48Ys165EsiuH9LOEnpFzmHFr8ctiNgH8bpMDFxwXQYHd8RwzT3SA>
 <xmx:4H48Yn-gmKPIcfhvTKVy9qVaGCyGOaQYLQdaNAjIY1F3Sd41fIm5ow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 10:23:26 -0400 (EDT)
Date: Thu, 24 Mar 2022 15:23:24 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <20220324142324.monalktzzpypu74x@houat>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YjuFO45Gr1vmKxWG@pendragon.ideasonboard.com>
 <20220324081819.niz4pdqu3j7n2ivh@houat>
 <Yjx1jjB2hWqOPGsi@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kq735fu2dw67hzsc"
Content-Disposition: inline
In-Reply-To: <Yjx1jjB2hWqOPGsi@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kq735fu2dw67hzsc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 03:43:42PM +0200, Laurent Pinchart wrote:
> On Thu, Mar 24, 2022 at 09:18:19AM +0100, Maxime Ripard wrote:
> > On Wed, Mar 23, 2022 at 10:38:19PM +0200, Laurent Pinchart wrote:
> > > Hi Maxime,
> > >=20
> > > (CC'ing Sakari)
> > >=20
> > > Thank you for the patch.
> > >=20
> > > On Wed, Mar 23, 2022 at 04:48:23PM +0100, Maxime Ripard wrote:
> > > > MIPI-DSI devices, if they are controlled through the bus itself, ha=
ve to
> > > > be described as a child node of the controller they are attached to.
> > > >=20
> > > > Thus, there's no requirement on the controller having an OF-Graph o=
utput
> > > > port to model the data stream: it's assumed that it would go from t=
he
> > > > parent to the child.
> > > >=20
> > > > However, some bridges controlled through the DSI bus still require =
an
> > > > input OF-Graph port, thus requiring a controller with an OF-Graph o=
utput
> > > > port. This prevents those bridges from being used with the controll=
ers
> > > > that do not have one without any particular reason to.
> > > >=20
> > > > Let's drop that requirement.
> > >=20
> > > I'm sure this won't come as a surprise, I'm very much opposed to this
> > > change, for two reasons.
> > >=20
> > > First, ports are part of the hardware, even if they're not connected.=
 It
> > > thus simplifies handling in drivers if they're always present.
> > >=20
> > > Then, and that's the most important reason, I think it's a mistake not
> > > to model the DSI data connection using OF graph unconditionally, even
> > > when the DSI sink device is also controlled through the DSI bus (using
> > > DCS) and is in that case a child of the DSI source device in the DT
> > > hierarchy.
> >=20
> > That's the way we do for any other device though. You never addressed
> > that comment, but it's very much the same that occurs for i2c or spi
> > controllers and their device. They all get their data from the parent
> > bus. I don't see you advocate for using OF-Graph for those devices.
>=20
> Those are different, there's no data stream independent of the control
> communications.

Fine, then you have Ethernet PHYs, or any MMIO device that does DMA.

> > > The device tree describes a control hierarchy between devices. OF gra=
ph
> > > overlays on top of that a data transfer graph. The two are different
> > > concepts, and the fact that DSI can sometimes be used as a control bus
> > > doesn't change the concept. Using OF graph unconditionally to describe
> > > the data connections for DSI leads to less variation in the device tr=
ee
> > > structure, and thus less complexity in the implementation. We're
> > > suffering from the fact we haven't made it a requirement in the first
> > > place, which can't be fixed due to ABI breakage constraints, but let's
> > > not acknowledge it as a good idea.
> >=20
> > Honestly, it doesn't matter one bit.
> >=20
> > We have a huge discrepancy here today, and only a couple of bridges have
> > that arbitrary restriction. The situation you don't want to acknowledge
> > is the de-facto standard, by the generic binding and by what all the
> > bridges and panels are implementing. Even panel-simple-dsi is doing it.
> > So it's very much there already.
>=20
> It's here, and I think we should move away from it for new DSI sinks.
> I'd like OF graph to be used consistently for new drivers. We can't
> change existing DT bindings and drivers to drop support for the
> non-OF-graph description due to ABI stability, but we can avoid
> repeating the mistake going forward.
>
> > What I'm trying to address here is that some controllers that do
> > everything right can't be used because that restriction is completely
> > arbitrary and in opposition to the consensus. And they can't be used
> > *today*.
> >=20
> > If we want to change that consensus, fine, but we should still have one.
> > Having some bridges enforcing custom rules for no reason is very much
> > unacceptable.
> >=20
> > And changing that consensus won't happen overtime, we'll have to take
> > care of the backward compatibility, etc. So it won't fix the issue that
> > we can't use any bridge with any controller any time soon.
>=20
> I don't think that's the issue at hand here. You can still use a
> non-OF-graph DT event if the nodes for the two bridges affected by this
> patch define a port@0. It can just be left unconnected.
>=20
> I do agree it will cause some DT bindings for DCS-based DSI sinks to
> have ports will others won't. If your concern is that all DT bindings
> should be coherent, would you be OK with a patch that makes the sink
> port mandatory in all DT bindings for DSI bridges and panels (and fixes
> the mainline DT sources accordingly to make sure they validate) ? The
> port would not be connected of course (at least when used with DSI
> source drivers that don't use OF graph today). That would make DT
> bindings coherent, and would be a first step towards using OF graph
> everywhere.

I'm trying to fix a (recent) mistake/cargo-cult in new bindings. That
discussion is not going to be fairly controversial and I don't see how
that can be solved quickly. So, as a second step, why not. But this one
needs to come first.

Maxime

--kq735fu2dw67hzsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjx+3AAKCRDj7w1vZxhR
xRLoAQCTIpIMWpib5N/OdprcjAAx1ppjIy53NN2C7tfT3MMDHgEA2nt3GKD2CVrB
mj/pjIsjnm83gSZpQyfBwM99I9RCJAM=
=SFux
-----END PGP SIGNATURE-----

--kq735fu2dw67hzsc--
