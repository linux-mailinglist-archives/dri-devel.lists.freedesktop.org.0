Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF8D4EBE2F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 12:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191F110E055;
	Wed, 30 Mar 2022 10:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C2F10E055
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 10:00:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 4DE352B00523;
 Wed, 30 Mar 2022 06:00:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 30 Mar 2022 06:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=1KmhQgVl702bz7WKmxwLlTLMWnPicP+2nqjgwT
 gzZF4=; b=VW1Qzavcm01D3J6LtMbZdXaSqqyHdPblV2ZuaO87MhLElB/sapZrc6
 9byGkoLSsfUcfEhqC70JHJIhzAOg+gUcTRqCJ/+f5FVopcURKjeuJXj4+wsCevtm
 j78gbQ6Zd3EoOVbqsmPY8XSsWDzxGH4z4+88UGWZV0gRdtoHfwIWNvjN3hNfavI1
 sMc404t3FtzZ2+7QSi8u4v935U3vaUsMRpMDP1yoe3pH9/Q/9fGSEyAHRh+e5OF1
 qDcumxrHo5UhnzVs1iqpvGiTPWs0s/g+g/bmzXtwHnVzd2Hzy48WmzRbd6dQHow2
 sTLTc89jriQTcFMfHTOum5hGamgXS8iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1KmhQgVl702bz7WKm
 xwLlTLMWnPicP+2nqjgwTgzZF4=; b=VlV39ZzXrY4AySMwPhKTKpkJ9sElDYcIO
 qnRjiomcGJFsr+aYXdSyy6i0O0gHqgwSIYaVaNoKe+NXNUt8jxZD4zo4MgaVMtqQ
 fPy05FGjmpOcQrOFj4/ArwNMOCcQORd0zXE56ymmYdFIYIWPdCXzPFNPuR/2i73r
 aY5igMwGQE2HY3A3Omji+pBgr3KouMGktn+MhygHaGq1UUkwFprtasE7+gYhsGn8
 0pz0Iq5jI70bXqoXPP7FEuFTEogmAYGr1m6HYrTNRsqdT6FfjKbTpkg7eyzmiiv+
 DfnX5ZfN7UWzTQAZjJQJoHuTtHr3LLFHTBdNHtkF/Yxr8pSZjeYlQ==
X-ME-Sender: <xms:RipEYkQe9BF4ZtGJELmcQddgXgV11KyGfHivYIwyCddBvGMBq8NGMg>
 <xme:RipEYhwXyB6JVVv23NwiQZ3iwJiH8nl3usrIjAu5jM37jUTB_QE59rsvl4ISg9fGG
 NeEBsXgNrDlhI87XSA>
X-ME-Received: <xmr:RipEYh1XJW0r928OcVm3lrIk7brZHakagwYReVOnEJVjIc7-L0UF0bEqwqTEy5jrmsqWI_cw75WK7t8CAUVjBXL3B1W7enwBTYwRWEc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RipEYoCRyb5yo-qHNc42EYfiXNG2Rvcf4oIsI06Nlj8emYYzZ36UvQ>
 <xmx:RipEYti3z7KlO-1VPCMbndu7-e6zB2-lXuPsnKQdBhts8y0fTvbxiA>
 <xmx:RipEYkrzow3N7s5dbhFan0cre3YfZq55HXUURO8U0D4Nlt9H1iFyLg>
 <xmx:RipEYt6vi_wVw-tbbdGtK6C1a8F0zl7jvVjfXlIagCw1TnIl3nr4NcqeRhA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 06:00:37 -0400 (EDT)
Date: Wed, 30 Mar 2022 12:00:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Message-ID: <20220330100036.k6qinnh2ktukua7r@houat>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YjuFO45Gr1vmKxWG@pendragon.ideasonboard.com>
 <20220324081819.niz4pdqu3j7n2ivh@houat>
 <Yjx1jjB2hWqOPGsi@pendragon.ideasonboard.com>
 <20220324142324.monalktzzpypu74x@houat>
 <f30fe2d7-488a-d599-7631-a991042ecdea@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4ufozvpqqiapt37k"
Content-Disposition: inline
In-Reply-To: <f30fe2d7-488a-d599-7631-a991042ecdea@ideasonboard.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4ufozvpqqiapt37k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Fri, Mar 25, 2022 at 12:42:15PM +0200, Tomi Valkeinen wrote:
> On 24/03/2022 16:23, Maxime Ripard wrote:
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
>=20
> Have those devices had the need for OF graphs?

No, they don't. It's kind of my point actually :)

> For display and capture we have a clear need. I don't think we should
> sometimes use OF graphs and sometimes not, but rather use them
> consistently at least in any new driver.

There's a clear need when the data don't follow the obvious path, ie
when there's a direct FIFO between a CRTC and its connector. If it was
going through that obvious path, like an Ethernet PHY, then we wouldn't
need it.

A device being controlled through the DSI bus has that obvious path. If
it's taking its data through the DSI bus, but is being controlled by an
i2c bus, then it needs an OF-graph node...

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
> > >=20
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
> I feel like I don't quite understand the problem and the discussion.
>=20
> What's the problem this fixes? DT validation? Why not just fix the dts fi=
les
> which use these devices (although I didn't see any in mainline), by adding
> the port nodes?
>=20
> Or is the argument that we should also support "implicit ports" when the
> control and data busses are the same?

=2E.. But the discussion really is two-fold.

The problem this patch addresses is that there's two odd bridges that
have an inconsistent binding with how the rest of the similar devices
now. It was a mistake that slipped through review, we should address it.

Then, there's the larger discussion of whether or not we want to push
the OF-graph for everyone. But that will require some kind of consensus,
some work on the MIPI-DSI encoders that don't have that kind of support,
in a backward compatible manner, etc. It's not going to happen
over-night, especially since it seems like it's something that would be
nice to have, but no-one is really interested in actually making it
happen.

And we shouldn't wait for that to happen to fix the inconsistency
mentioned above.

Maxime

--4ufozvpqqiapt37k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkQqRAAKCRDj7w1vZxhR
xSFVAQCHCtSvm++O8wElexDC+AExYe9RkXj94lMBHWj0tFWTuwD/ScpaEM8Y8bOR
F8n2pU8YBk82qMDhNkKWU4fwqnk4kgQ=
=G6ys
-----END PGP SIGNATURE-----

--4ufozvpqqiapt37k--
