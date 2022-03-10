Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981114D4959
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF1210E7C6;
	Thu, 10 Mar 2022 14:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59910E7DE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:18:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 60141320112B;
 Thu, 10 Mar 2022 09:18:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Mar 2022 09:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=dzdqQEJg6xyLpIjnfmc/LmJDMVT7U0HKl34zkJ
 FZBXM=; b=rWNWroSRuA+pywlQrUmVge5nHQQlO2aei5PZutkbZ29cB48Jx0ZUWk
 jhpJ7OQ1nDW/cqJfL0ZZUzci94bs812zLN9FgtWZxdBt8tqFsjBfLunkejYKMREj
 +VaGYLX8qGUln19IVVYmNp3k4EPAdJJJYu4M5CDCINcfdUnz3LN1JW4o6iyuyfwk
 3nQm61kcTr36z+ukONf6u95a8Ez7ZKvVFoBCqYuoVf/GGCF+FNoUCS/IwY1+xKqf
 jaBay3wI//ZBN7Ukeu+h9IxokOTIg5ftgGvgfT+It1TUBc9D7uEmtUlE+6W5SjfD
 xtlFjWWa0bIq/YNq766+YePViFozGONQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dzdqQEJg6xyLpIjnf
 mc/LmJDMVT7U0HKl34zkJFZBXM=; b=Hyzur/l1Lv5z1iXmf6K75gDYdv52cp1vK
 E4pwpklSNWkkmUi8UN9CGrm8pnwXuk7TDLBtwODRauezSB1UJOm6uvf75ow+kaCM
 SAW19c9lZ02H381q+JI9GAQh87/EkneVKS+bJOkHKZ5oSVwzRjE2ki1+2kan19xO
 WhDRu3uDG2qsdAEtjG/+ye90S/L3kOoOgXQqso/Gi7wRGksaAMRyn0bULH9deo2w
 wD5XcWggDs8Ze6zX9g29vDOHNhI8WR2tD2kuUyIy8aU/8ly1Ep4ZFI+207qErN2H
 STKFpv35jrdflim3QeC0MGeU1INHN2SNxgM8gt9OJIaDwxZayMdjw==
X-ME-Sender: <xms:oQgqYnAhvoTMftGZ_ig6pMTJq0t2c9lESW76AiD-IQjbGnKUZPJT7w>
 <xme:oQgqYtj4NJJgwDV25rWrDnFsMv4yNFAVbx-5bUsJ51Mclt5xWardANqTfj9Kn0_lW
 kNQxqluaYO1SNQtHmg>
X-ME-Received: <xmr:oQgqYilcoIasfDpL9MTMVsEOrpfQlLS7vjnmYtjNGYrWqc4TdZtuInLfn5cK4ZRe2J5MGNG0W2Pihiyiss1BTOvKAI1q4EPjmKNkdNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfdtgfdvhfekffeitefhtdevteegvdehuddvudekgfelgefguefhteefleei
 jeelnecuffhomhgrihhnpegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oQgqYpx_wy3qTEW9KSlBavgC3rJVnlwuiaHcdPbhAZhI6b8DqwTx2A>
 <xmx:oQgqYsRB90gMqX5kyvm-olysdUf92xJpbSxd41WUwJxnigAeWdc33A>
 <xmx:oQgqYsa080-P3-omMU_MUY3jGrkZmgDCIBhmEggRc-WLRUxqDXeL1A>
 <xmx:oggqYhKe0Z2g_4XKXgrqwvWzxSkQLoqBJJZXJiI7jpycPX_Zn0OGaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 09:18:09 -0500 (EST)
Date: Thu, 10 Mar 2022 15:18:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220310141807.5yqho4gloz4lrdjt@houat>
References: <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
 <20220308134921.zebs533xeazq46ts@houat>
 <1ac9057e-fb6d-02f8-78df-c6518fb6e897@denx.de>
 <20220308162158.j5czx7krscaeqtsy@houat>
 <423c5f19-7b7c-dbc7-7482-34a0537bec21@denx.de>
 <20220310105352.v7jqjchshaaajsmd@houat>
 <c60112b4-5095-11ad-0da4-c84bb30bf77f@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iqnx3pc3kh2brnmq"
Content-Disposition: inline
In-Reply-To: <c60112b4-5095-11ad-0da4-c84bb30bf77f@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iqnx3pc3kh2brnmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 01:47:13PM +0100, Marek Vasut wrote:
> On 3/10/22 11:53, Maxime Ripard wrote:
> > On Tue, Mar 08, 2022 at 10:41:05PM +0100, Marek Vasut wrote:
> > > On 3/8/22 17:21, Maxime Ripard wrote:
> > > > On Tue, Mar 08, 2022 at 03:47:22PM +0100, Marek Vasut wrote:
> > > > > On 3/8/22 14:49, Maxime Ripard wrote:
> > > > > > On Tue, Mar 08, 2022 at 02:27:40PM +0100, Marek Vasut wrote:
> > > > > > > On 3/8/22 13:51, Maxime Ripard wrote:
> > > > > > > > On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
> > > > > > > > > On 3/8/22 11:07, Jagan Teki wrote:
> > > > > > > > > > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.=
de> wrote:
> > > > > > > > > > >=20
> > > > > > > > > > > On 3/8/22 09:03, Jagan Teki wrote:
> > > > > > > > > > >=20
> > > > > > > > > > > Hi,
> > > > > > > > > > >=20
> > > > > > > > > > > [...]
> > > > > > > > > > >=20
> > > > > > > > > > > > > @@ -314,7 +321,9 @@ static const struct drm_bridg=
e_funcs chipone_bridge_funcs =3D {
> > > > > > > > > > > > >        static int chipone_parse_dt(struct chipone=
 *icn)
> > > > > > > > > > > > >        {
> > > > > > > > > > > > >               struct device *dev =3D icn->dev;
> > > > > > > > > > > > > +       struct device_node *endpoint;
> > > > > > > > > > > > >               struct drm_panel *panel;
> > > > > > > > > > > > > +       int dsi_lanes;
> > > > > > > > > > > > >               int ret;
> > > > > > > > > > > > >=20
> > > > > > > > > > > > >               icn->vdd1 =3D devm_regulator_get_op=
tional(dev, "vdd1");
> > > > > > > > > > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt=
(struct chipone *icn)
> > > > > > > > > > > > >                       return PTR_ERR(icn->enable_=
gpio);
> > > > > > > > > > > > >               }
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > +       endpoint =3D of_graph_get_endpoint_by_reg=
s(dev->of_node, 0, 0);
> > > > > > > > > > > > > +       dsi_lanes =3D of_property_count_u32_elems=
(endpoint, "data-lanes");
> > > > > > > > > > > > > +       icn->host_node =3D of_graph_get_remote_po=
rt_parent(endpoint);
> > > > > > > > > > > > > +       of_node_put(endpoint);
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +       if (!icn->host_node)
> > > > > > > > > > > > > +               return -ENODEV;
> > > > > > > > > > > >=20
> > > > > > > > > > > > The non-ports-based OF graph returns a -19 example =
on the Allwinner
> > > > > > > > > > > > Display pipeline in R16 [1].
> > > > > > > > > > > >=20
> > > > > > > > > > > > We need to have a helper to return host_node for no=
n-ports as I have
> > > > > > > > > > > > done it for drm_of_find_bridge.
> > > > > > > > > > > >=20
> > > > > > > > > > > > [1] https://patchwork.amarulasolutions.com/patch/18=
05/
> > > > > > > > > > >=20
> > > > > > > > > > > The link points to a patch marked "DO NOT MERGE", may=
be that patch is
> > > > > > > > > > > missing the DSI host port@0 OF graph link ? Both port=
@0 and port@1 are
> > > > > > > > > > > required, see:
> > > > > > > > > > >=20
> > > > > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torva=
lds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone=
,icn6211.yaml#n53
> > > > > > > > > > >=20
> > > > > > > > > > > What is "non-ports-based OF graph" ?
> > > > > > > > > > >=20
> > > > > > > > > > > I don't see drm_of_find_bridge() in linux-next , what=
 is that ?
> > > > > > > > > >=20
> > > > > > > > > > port@0 is optional as some of the DSI host OF-graph rep=
resent the
> > > > > > > > > > bridge or panel as child nodes instead of ports. (i thi=
nk dt-binding
> > > > > > > > > > has to fix it to make port@0 optional)
> > > > > > > > >=20
> > > > > > > > > The current upstream DT binding document says:
> > > > > > > > >=20
> > > > > > > > >         required:
> > > > > > > > >           - port@0
> > > > > > > > >           - port@1
> > > > > > > > >=20
> > > > > > > > > So port@0 is mandatory.
> > > > > > > >=20
> > > > > > > > In the binding, sure, but fundamentally the DT excerpt Jaga=
n provided is
> > > > > > > > correct. If the bridge supports DCS, there's no reason to u=
se the OF
> > > > > > > > graph in the first place: the bridge node will be a child n=
ode of the
> > > > > > > > MIPI-DSI controller (and there's no obligation to use the O=
F-graph for a
> > > > > > > > MIPI-DSI controller).
> > > > > > > >=20
> > > > > > > > I believe port@0 should be made optional (or downright remo=
ved if
> > > > > > > > MIPI-DCS in the only control bus).
> > > > > > >=20
> > > > > > > That's out of scope of this series anyway, so Jagan can imple=
ment patches
> > > > > > > for that mode if needed.
> > > > > >=20
> > > > > > Not really? You can't count on the port@0 being there generally
> > > > > > speaking, so you can't count on data-lanes being there either, =
which
> > > > > > exactly what you're doing in this patch.
> > > > >=20
> > > > > I can because the upstream DT bindings currently say port@0 must =
be present,
> > > > > see above. If that requirement should be relaxed, sure, but that'=
s a
> > > > > separate series.
> > > >=20
> > > > And another upstream DT bindings say that you don't need them at al=
l.
> > >=20
> > > Which "another upstream DT bindings" do you refer to ?
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> >=20
> > > > Yes, there's a conflict. Yes, it's unfortunate. But the generic DSI
> > > > binding is far more relevant than a single bridge driver.
> > >=20
> > > That seems to be the wrong way around, how can generic subsystem-wide
> > > binding take precedence over specific driver binding ?
> >=20
> > This is the binding of the bus. You're part of that bus. You're a child
> > node of that bus, but nothing ever mandates that your parent node uses
> > the same convention. And some don't. And since your bridge can be
> > connected to pretty much any DSI controller, you have to use the lowest
> > common denominator, not make up some new constraints that not all
> > controller will be able to comply with.
>=20
> It seems to me the ICN6211 DT bindings currently further constraint the
> generic DSI bus bindings, and that seems OK to me.
>=20
> Let me reiterate this again -- if someone wants to relax the requirements
> currently imposed by the ICN6211 DT bindings, fine, but that can be done =
in
> a separate patchset AND that needs DT bindings update. Furthermore, there
> are no users of this ICN6211 bridge in upstream DTs, so there is currently
> no bridge which would operate without OF graph using this driver.

And let me reiterate this again: something that used to work for a user
doesn't anymore when your series is applied. This is a textbook
regression. I suggested a way forward, that you don't like for some
reason, fine. But pushing through a regression is just not acceptable.

> > > > So figuring it out is very much a prerequisite to that series,
> > > > especially since those patches effectively make the OF-graph mandat=
ory
> > > > in some situations, while it was purely aesthetics before.
> > >=20
> > > The OF-graph is mandatory per the DT bindings of this driver. If you
> > > implement invalid DT which does not contain port@0, it will fail DT
> > > validation.
> > >=20
> > > If this requirement should be relaxed, sure, it can and I don't think=
 it
> > > would be hard to do, but I don't see why that should be part of this =
series,
> > > which follows the upstream DT binding document for this driver.
> > >=20
> > > If I cannot trust the driver DT bindings to indicate what is and is n=
ot
> > > mandatory, what other document can I trust then ...
> >=20
> > Oh, come on. Doing that, you also require OF-Graph support for the DSI
> > controller you attach to, and you can't require that. This is very
> > different from just requiring a property that doesn't have any impact on
> > any other device, and you know that very well.
>=20
> Currently the ICN6211 DT bindings DO require that kind of bridge.

And while this wasn't enforced before, you make it a hard requirement
with this series. This is what changed, and what caused this whole
discussion.

Maxime

--iqnx3pc3kh2brnmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYioInwAKCRDj7w1vZxhR
xbAwAP48lggqmmmtRfFRrF2Iol9VwVj05Mtmjl7IP6zVRUcoUgEAibqU5+pkTqUB
zR6ZG7SCXl0y8nBClWhcopu2H3vdWwc=
=D22X
-----END PGP SIGNATURE-----

--iqnx3pc3kh2brnmq--
