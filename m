Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475644EBDF8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C0810F67C;
	Wed, 30 Mar 2022 09:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC48210F5F6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:45:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 115F43200E60;
 Wed, 30 Mar 2022 05:45:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 30 Mar 2022 05:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=XN4twieLDAl95EMDDf/3D+kn7IgZ/srR1teHOI
 4BQrM=; b=xwLT+VAsXD6tHx8Sh4QH41nyXX1XzhkcIPcu1BesY4Ndv+WataAZGN
 xey75FTUohTP4Gzur3yR6MquBf4DNpq8OTyRQ8jTdLgqPp5/vIoYkEMVJ/i/QhiR
 9kskVVu7xlFrkGxIazsQSP0iV6Ioj5CK1KH84oMTogXDcCvm+qGMxj/b2ZR1okO6
 zAT4Nd9F+ZLGEtdq+23ZVF8ghqw13v+Y+1vyMTfkgFjv/2Kv4Rwqmkd4ibR6qBwI
 m6AvIs8Tl/IVlN5nrX45dXpHyKrEoZqAaIUxEcytjEURV+ZHdZvF3TAXG53Bh5sN
 +Lcl78xX9h8naLpqHi8zdI24PEd9Sktw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XN4twieLDAl95EMDD
 f/3D+kn7IgZ/srR1teHOI4BQrM=; b=UshhcguXE276u6Sz6bLbETsVLHofE8FFH
 DMxlc7ugD+4QUjelBMBAo2qlZlRvDOpfqT3puiMUu+kSa2vQ8RbuTJhEZADENIje
 cRMdgryiQ7LopUIJaDT3JhOyEpg4HYA+6kh4f0wOGf/cf36R4Wi8q70NIUrQxb2Q
 aDHJOikHKdqMHcoc+zI08LgGjlzMSeBcBuD07sUVeo2FaVhOChy29VL2/77VVMao
 4RvsD263Q4GLipb7/ixVwXOFn4Kh2NyWSdvciFXpOs5dcpTs+dTNn9R4QyXi1wZc
 BtAx5/Avjsp5Y6h9c0pGJAcR/OzHcucrHx/lTUdQKt27p1APni0lg==
X-ME-Sender: <xms:1CZEYmZmcLbKnbW7hLQC37OfYwO2oN8rSKm6m0SUzEO-NF6Z-2lxTg>
 <xme:1CZEYpZZ2cuWi3oTRxUCG-EnaTatU7wcFhBqVoPiosNdAUSsgzgFvfxeWqmjAFhz6
 soX3u0Vk8t18Jj5ZbA>
X-ME-Received: <xmr:1CZEYg9BsLMaITW9anPMo4ZgMaqCL3ubS_NBgnMUGwTzv0_-kSUpeaqrwhNhmFAyhmlTdE3o1UpJD2r1PL2yo-r_qAAi52RNCVrbOto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1CZEYoqZNh0WOil7KixYG4J2CHZNNHa9ouCfi0TKrsNzdABD0WaXqQ>
 <xmx:1CZEYhogrfFW93sN-uQYP_JdbH0b4JlrqVN85JxeiSzLuTeHs8D_fA>
 <xmx:1CZEYmSjbBYF-RCt-8P2Np0UtEl2KPD3hENmU1XWASOSuAfgUlwoxg>
 <xmx:1CZEYi4GrpSi9LQoEHpz-JGOjPgVk0tR1WYYMI4TOAVvAMvQuhey6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 05:45:55 -0400 (EDT)
Date: Wed, 30 Mar 2022 11:45:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <20220330094553.a3caxxy4ynd7onsj@houat>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YjuFO45Gr1vmKxWG@pendragon.ideasonboard.com>
 <20220324081819.niz4pdqu3j7n2ivh@houat>
 <Yjx1jjB2hWqOPGsi@pendragon.ideasonboard.com>
 <20220324142324.monalktzzpypu74x@houat>
 <YjyFHGQw6SiL6UHA@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ye4ehemn5uv24rq2"
Content-Disposition: inline
In-Reply-To: <YjyFHGQw6SiL6UHA@pendragon.ideasonboard.com>
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


--ye4ehemn5uv24rq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 04:50:04PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> On Thu, Mar 24, 2022 at 03:23:24PM +0100, Maxime Ripard wrote:
> > On Thu, Mar 24, 2022 at 03:43:42PM +0200, Laurent Pinchart wrote:
> > > On Thu, Mar 24, 2022 at 09:18:19AM +0100, Maxime Ripard wrote:
> > > > On Wed, Mar 23, 2022 at 10:38:19PM +0200, Laurent Pinchart wrote:
> > > > > Hi Maxime,
> > > > >=20
> > > > > (CC'ing Sakari)
> > > > >=20
> > > > > Thank you for the patch.
> > > > >=20
> > > > > On Wed, Mar 23, 2022 at 04:48:23PM +0100, Maxime Ripard wrote:
> > > > > > MIPI-DSI devices, if they are controlled through the bus itself=
, have to
> > > > > > be described as a child node of the controller they are attache=
d to.
> > > > > >=20
> > > > > > Thus, there's no requirement on the controller having an OF-Gra=
ph output
> > > > > > port to model the data stream: it's assumed that it would go fr=
om the
> > > > > > parent to the child.
> > > > > >=20
> > > > > > However, some bridges controlled through the DSI bus still requ=
ire an
> > > > > > input OF-Graph port, thus requiring a controller with an OF-Gra=
ph output
> > > > > > port. This prevents those bridges from being used with the cont=
rollers
> > > > > > that do not have one without any particular reason to.
> > > > > >=20
> > > > > > Let's drop that requirement.
> > > > >=20
> > > > > I'm sure this won't come as a surprise, I'm very much opposed to =
this
> > > > > change, for two reasons.
> > > > >=20
> > > > > First, ports are part of the hardware, even if they're not connec=
ted. It
> > > > > thus simplifies handling in drivers if they're always present.
> > > > >=20
> > > > > Then, and that's the most important reason, I think it's a mistak=
e not
> > > > > to model the DSI data connection using OF graph unconditionally, =
even
> > > > > when the DSI sink device is also controlled through the DSI bus (=
using
> > > > > DCS) and is in that case a child of the DSI source device in the =
DT
> > > > > hierarchy.
> > > >=20
> > > > That's the way we do for any other device though. You never address=
ed
> > > > that comment, but it's very much the same that occurs for i2c or spi
> > > > controllers and their device. They all get their data from the pare=
nt
> > > > bus. I don't see you advocate for using OF-Graph for those devices.
> > >=20
> > > Those are different, there's no data stream independent of the control
> > > communications.
> >=20
> > Fine, then you have Ethernet PHYs, or any MMIO device that does DMA.
> >=20
> > > > > The device tree describes a control hierarchy between devices. OF=
 graph
> > > > > overlays on top of that a data transfer graph. The two are differ=
ent
> > > > > concepts, and the fact that DSI can sometimes be used as a contro=
l bus
> > > > > doesn't change the concept. Using OF graph unconditionally to des=
cribe
> > > > > the data connections for DSI leads to less variation in the devic=
e tree
> > > > > structure, and thus less complexity in the implementation. We're
> > > > > suffering from the fact we haven't made it a requirement in the f=
irst
> > > > > place, which can't be fixed due to ABI breakage constraints, but =
let's
> > > > > not acknowledge it as a good idea.
> > > >=20
> > > > Honestly, it doesn't matter one bit.
> > > >=20
> > > > We have a huge discrepancy here today, and only a couple of bridges=
 have
> > > > that arbitrary restriction. The situation you don't want to acknowl=
edge
> > > > is the de-facto standard, by the generic binding and by what all the
> > > > bridges and panels are implementing. Even panel-simple-dsi is doing=
 it.
> > > > So it's very much there already.
> > >=20
> > > It's here, and I think we should move away from it for new DSI sinks.
> > > I'd like OF graph to be used consistently for new drivers. We can't
> > > change existing DT bindings and drivers to drop support for the
> > > non-OF-graph description due to ABI stability, but we can avoid
> > > repeating the mistake going forward.
> > >
> > > > What I'm trying to address here is that some controllers that do
> > > > everything right can't be used because that restriction is complete=
ly
> > > > arbitrary and in opposition to the consensus. And they can't be used
> > > > *today*.
> > > >=20
> > > > If we want to change that consensus, fine, but we should still have=
 one.
> > > > Having some bridges enforcing custom rules for no reason is very mu=
ch
> > > > unacceptable.
> > > >=20
> > > > And changing that consensus won't happen overtime, we'll have to ta=
ke
> > > > care of the backward compatibility, etc. So it won't fix the issue =
that
> > > > we can't use any bridge with any controller any time soon.
> > >=20
> > > I don't think that's the issue at hand here. You can still use a
> > > non-OF-graph DT event if the nodes for the two bridges affected by th=
is
> > > patch define a port@0. It can just be left unconnected.
> > >=20
> > > I do agree it will cause some DT bindings for DCS-based DSI sinks to
> > > have ports will others won't. If your concern is that all DT bindings
> > > should be coherent, would you be OK with a patch that makes the sink
> > > port mandatory in all DT bindings for DSI bridges and panels (and fix=
es
> > > the mainline DT sources accordingly to make sure they validate) ? The
> > > port would not be connected of course (at least when used with DSI
> > > source drivers that don't use OF graph today). That would make DT
> > > bindings coherent, and would be a first step towards using OF graph
> > > everywhere.
> >=20
> > I'm trying to fix a (recent) mistake/cargo-cult in new bindings. That
> > discussion is not going to be fairly controversial and I don't see how
> > that can be solved quickly. So, as a second step, why not. But this one
> > needs to come first.
>=20
> I don't think we need to flip the switch in one go, even on the DT
> binding side, we could agree on a direction for new bindings and then
> migrate the existing ones. The migration time should be minimized
> though, I agree about your cargo cult comment though, it's painful. And
> it shouldn't be difficult to convert all DT bindings in one go if we
> decide to do so. Changing drivers would be more complex, but that
> doesn't need to be tied to the bindings.
>=20
> tl;dr: I'm fine dropping the required port@0 here short term to avoid
> divergence in bindings, as long as it won't be used as an argument
> against me in the future to make port@0 mandatory again :-)

That's what I had in mind all along, so it's fine by me :)

And I plan on staying far away from that discussion

Maxime

--ye4ehemn5uv24rq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkQm0QAKCRDj7w1vZxhR
xSb8AQDXzvDLZHq3hdJXbPCT8ebzilgKqqNbWvQpFkxA7+MwMwEAqxc3fJ1MUQ8V
Viu9KIB2GzDRh3TE/CeGoxMuyVUw9Qc=
=z58P
-----END PGP SIGNATURE-----

--ye4ehemn5uv24rq2--
