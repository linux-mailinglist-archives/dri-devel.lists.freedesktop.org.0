Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537E4D4963
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9919B10E3F3;
	Thu, 10 Mar 2022 14:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF37E10E3F3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:23:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B83363201F01;
 Thu, 10 Mar 2022 09:23:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Mar 2022 09:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=dUt5MPKcHrST5ROA6vJ+bx/tj0AeJnzE9rGRIi
 odEpQ=; b=NvPCzjt90ajTHTToG1QmC7lBBGSajpUlLB2nmm0lmnyRaPaW42L2bF
 zxfcWx1hZcwEvqXknnVfcUbhTiQdc2f5tySE5hQGRr5V4T2szQMoT8jyrRkJ3vH/
 Dj2tuGoRv9x0XGhnDftE5lEmGf7Wmk6g/9p2dCIk8W1csEI5UPRgAXJ1hpyIh6eX
 lGa7KBzxO966zBrc26TzmR4EjqUvMUYIk1YQ6SAnTZExYban9ZNeJE22nd3IaBZp
 kacdeWW1Auy69Qy5429fiklXEF8DWs0ptoYBbGLfQY44rEPVCpjcNDj7Pc2OhrcB
 oTi2nqdXGW84dHjZ499UwmfwHiXg4xnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dUt5MPKcHrST5ROA6
 vJ+bx/tj0AeJnzE9rGRIiodEpQ=; b=ZK/ZDsUoPPVbh2AbSX6jPIKBcByDzvXhl
 EsvuGANJJfmE7tlQ4rq+Ob2RyOy+G6w2uNy77XJIJcowlcGwZdVHue/ph10lY6lf
 KoQjPuhb8Su3R7dDNbnuIpLqEM0nrZUFMDBuddwD7+FIAipsxLGnIJkQTJFMu2x4
 TlVIm9hf7oQ5e8OAprua6P2AAxoxEpKId8DzMjohLezWAnpvu1XzSM7Q7vJ1yy9K
 C6A2GJuDtbjsO2e0AtCb67SaeREENkD242nupopdmHtRhLVTXd0icj/OVO0TxKya
 bmO7gZ3YNAZ0Xkh/A8miAbsCmN6BHO13ga8hIoZHZeuZ1TrZcnGxg==
X-ME-Sender: <xms:2gkqYhAs-htFTqHuBEkFHKFRvX14ecWf02r6ZPCUYyXmj-OuZNVUaQ>
 <xme:2gkqYvg-0XNzbaM1VTHPVCYRQy5I7xpMqn_ME6qZoM5wV9wddHYLkFTOIpHtLN8sr
 IPWaCKbrQHSVjTzhPE>
X-ME-Received: <xmr:2gkqYsn3qmKSUHT0mZ7mc1u5fCKFlTJA_E76a0AmRUST6NEpeEYbJStoxCwAS9dD3o-Ccfsp8tqp98meWKIBmDcZq1xsy6n1N0Ww1rY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfdtgfdvhfekffeitefhtdevteegvdehuddvudekgfelgefguefhteefleei
 jeelnecuffhomhgrihhnpegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2gkqYryCmZ37aisxN0cLxeE9TG2DoKgq0pUBafEMXkZ7VxYEpxvsOg>
 <xmx:2gkqYmRWZc81nwRnaeYAZIlT4NMyidXJJD6rG0EDYcSsezjOZomeBg>
 <xmx:2gkqYuY82jZPVdsOCrb0HMUSWDZBtLdHfeF5sOjxUTYUOIiLtj49Ag>
 <xmx:2wkqYjI3UpdCMcc7GZ5Yi8K6hd3YISowzGqMqEVEvEas-3rnxVqIMg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 09:23:22 -0500 (EST)
Date: Thu, 10 Mar 2022 15:23:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220310142321.oftynmxpyzw5jpd5@houat>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <YinWBFgdw22SlRKt@pendragon.ideasonboard.com>
 <20220310105738.uz7ul3ycmsbt43po@houat>
 <YineKfG63AiUxkqu@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ga5qegdt4rsyqezz"
Content-Disposition: inline
In-Reply-To: <YineKfG63AiUxkqu@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ga5qegdt4rsyqezz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 01:16:57PM +0200, Laurent Pinchart wrote:
> On Thu, Mar 10, 2022 at 11:57:38AM +0100, Maxime Ripard wrote:
> > On Thu, Mar 10, 2022 at 12:42:12PM +0200, Laurent Pinchart wrote:
> > > On Tue, Mar 08, 2022 at 01:51:40PM +0100, Maxime Ripard wrote:
> > > > On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
> > > > > On 3/8/22 11:07, Jagan Teki wrote:
> > > > > > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrot=
e:
> > > > > > >=20
> > > > > > > On 3/8/22 09:03, Jagan Teki wrote:
> > > > > > >=20
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > [...]
> > > > > > >=20
> > > > > > > > > @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs =
chipone_bridge_funcs =3D {
> > > > > > > > >    static int chipone_parse_dt(struct chipone *icn)
> > > > > > > > >    {
> > > > > > > > >           struct device *dev =3D icn->dev;
> > > > > > > > > +       struct device_node *endpoint;
> > > > > > > > >           struct drm_panel *panel;
> > > > > > > > > +       int dsi_lanes;
> > > > > > > > >           int ret;
> > > > > > > > >=20
> > > > > > > > >           icn->vdd1 =3D devm_regulator_get_optional(dev, =
"vdd1");
> > > > > > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct =
chipone *icn)
> > > > > > > > >                   return PTR_ERR(icn->enable_gpio);
> > > > > > > > >           }
> > > > > > > > >=20
> > > > > > > > > +       endpoint =3D of_graph_get_endpoint_by_regs(dev->o=
f_node, 0, 0);
> > > > > > > > > +       dsi_lanes =3D of_property_count_u32_elems(endpoin=
t, "data-lanes");
> > > > > > > > > +       icn->host_node =3D of_graph_get_remote_port_paren=
t(endpoint);
> > > > > > > > > +       of_node_put(endpoint);
> > > > > > > > > +
> > > > > > > > > +       if (!icn->host_node)
> > > > > > > > > +               return -ENODEV;
> > > > > > > >=20
> > > > > > > > The non-ports-based OF graph returns a -19 example on the A=
llwinner
> > > > > > > > Display pipeline in R16 [1].
> > > > > > > >=20
> > > > > > > > We need to have a helper to return host_node for non-ports =
as I have
> > > > > > > > done it for drm_of_find_bridge.
> > > > > > > >=20
> > > > > > > > [1] https://patchwork.amarulasolutions.com/patch/1805/
> > > > > > >=20
> > > > > > > The link points to a patch marked "DO NOT MERGE", maybe that =
patch is
> > > > > > > missing the DSI host port@0 OF graph link ? Both port@0 and p=
ort@1 are
> > > > > > > required, see:
> > > > > > >=20
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211=
=2Eyaml#n53
> > > > > > >=20
> > > > > > > What is "non-ports-based OF graph" ?
> > > > > > >=20
> > > > > > > I don't see drm_of_find_bridge() in linux-next , what is that=
 ?
> > > > > >=20
> > > > > > port@0 is optional as some of the DSI host OF-graph represent t=
he
> > > > > > bridge or panel as child nodes instead of ports. (i think dt-bi=
nding
> > > > > > has to fix it to make port@0 optional)
> > > > >=20
> > > > > The current upstream DT binding document says:
> > > > >=20
> > > > >     required:
> > > > >       - port@0
> > > > >       - port@1
> > > > >=20
> > > > > So port@0 is mandatory.
> > > >=20
> > > > In the binding, sure, but fundamentally the DT excerpt Jagan provid=
ed is
> > > > correct. If the bridge supports DCS, there's no reason to use the OF
> > > > graph in the first place: the bridge node will be a child node of t=
he
> > > > MIPI-DSI controller (and there's no obligation to use the OF-graph =
for a
> > > > MIPI-DSI controller).
> > > >=20
> > > > I believe port@0 should be made optional (or downright removed if
> > > > MIPI-DCS in the only control bus).
> > >=20
> > > I think we should make ports mandatory in all cases actually.
> > >=20
> > > The DT parent-child hierarchy is meant to model control relations
> > > between devices, so a DSI device controlled through DCS should be a
> > > child of the DSI controller. No disagreement there.
> > >=20
> > > The OF graph is meant to model data connections. While a DSI device
> > > controlled through DCS will use the same DSI link for data transfer, =
the
> > > two concepts are different. We have taken shortcuts and decided to not
> > > use OF graph for some DSI devices (not necessarily as a well thought
> > > decision, it was sometimes just not considered).
> >=20
> > I disagree. Unless the data path is explicitly stated using the OF-graph
> > or some other binding, it's inferred.
>=20
> It is today, and for video data, I think it's showing to be a problem
> :-)
>=20
> > We never asked ourselves where the
> > data from an i2c chip, an ethernet controller or an v4l2 output device
> > was coming from. It comes from the parent bus, because it's what makes
> > sense. Making a requirement on the OF-Graph to model this would create a
> > big inconsistency.
>=20
> I'm afraid I disagree, especially when it comes to data transfers from
> device to device. The device tree has never tried to model those until
> OF graph.

Except the data transfer isn't happening between "siblings" devices like
a CRTC and an HDMI controller that the OF-Graph describes perfectly
fine. Here the transfer happens between a parent device and its child.
So it's a bus to device transfer, just like any DMA transfer, or MDIO
transfer, or SPI transfer, etc.

> > > This has led to different issues that we're having to deal with today,
> > > making it more difficult to develop generic code. Going forward, I
> > > think new bindings should always use OF graph to model the data
> > > connection.
> >=20
> > Either way, that discussion is irrelevant. Not all DSI controllers use
> > OF-Graph, a bridge can be attached to any of them, so we can't require
> > OF-Graph support in any bridge.
>=20
> Not in any bridge, but we could in new ones, and we could also require
> it in new DT for existing bridge to support new features.

Above disagreement aside, since not all controllers are using it, it
would effectively prevent those new bridges from being used with
!OF-Graph controllers. I don't see how that can be an option.

Maxime

--ga5qegdt4rsyqezz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYioJ2QAKCRDj7w1vZxhR
xX4pAPwKChrF5lUQNNUdbd1mY8KB7ME0ha5I12KeWUjp6xHvrQEAkKaemYDsdxEK
Ga3E0/KWChRt1c+9i42Isb4cCZGGOQE=
=Zy25
-----END PGP SIGNATURE-----

--ga5qegdt4rsyqezz--
