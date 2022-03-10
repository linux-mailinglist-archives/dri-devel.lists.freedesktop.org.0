Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F44D4525
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06B10EE31;
	Thu, 10 Mar 2022 10:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143C510EE3E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:53:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0FBD93200A3E;
 Thu, 10 Mar 2022 05:53:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Mar 2022 05:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=pv+9NCQwjYYpTTNZwgRsMWNGsnemqS5ihSAYbC
 wVPD8=; b=IaGBZP1TV73wlji93D8tGX68KPRWv901q8IBbs0uc5Js6pLxE0hnjQ
 vTn5/89eTIDV4Ub3U0jNzR/llEG+Qyev/4hJ4PHglxpfCe8yw5ep78P3HGFVraQh
 M5WjwlvZcdZcTwrtiua1wV8HJvMd+MC2soBN/jIcVvJdHj3kdYFoVPoyWPjLS1CD
 pzXHwnHir6gKAYnE6T7Ow1oGMIzyD7D9xNUlPznbNRs4JSekGH8KTwLE3awxI1GF
 eaLgTQ4flyH6gw2WB7hvcU7ne8LpV5yElWW3vcfPwLmfGCFm2EaBHghZPPldA/hT
 MqDm1uovoAr41ttxpe/Br7rU79/jC/Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pv+9NCQwjYYpTTNZw
 gRsMWNGsnemqS5ihSAYbCwVPD8=; b=ZYS9I+j3BbYKw5h1b3PbmHtJoNGyQ4Idq
 ePm5Cmdj5DmJK5hbIbmSLMebrWvfTRtHz+esaRvTDC4S0HSMlnFsXBCqb31LOo7c
 dEw+h4gVlfZP/EsfeJlxfNVYVeD/fhIx0q+3ovOVQmddHGqwKadPgCQmZiIgV/My
 92rlsNW/V+XZBzNx1OwBHtfy9/IwU2OLDWW4pihaQgBlZBGvAic58h2lgk7mfqgZ
 RgVk596XJDKZZiOD8oUH7A9j7soRAc4vbC775IgkwhZQft0JTn1XWc9td6TzATW/
 k2NqAyqx6j3McCjSImSrUCshpZzJKQuRzfk61bavayz169SpZz/YA==
X-ME-Sender: <xms:wtgpYrKZ1Chm6p4E-QO9rkOxd95j-Dc_iw7XMIeidnKHT-K9bsTIaQ>
 <xme:wtgpYvJ4qbiM7ZJ4SanVgRTr7gXp8DWkvHvLRxufg7WBs3-_VOkKLRCy5U7jP5lMg
 it3L-gufEntVUt5oTw>
X-ME-Received: <xmr:wtgpYjtDSjW_rQlpYD2E_rNCF5cpSczo5NLc1Cb9_YtqMBx-7O2Tz7NDwKSM6xz57Fl86VAicTB5OXXJoBFrVKPNnjfdGZ4Y-8ggvDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfdtgfdvhfekffeitefhtdevteegvdehuddvudekgfelgefguefhteefleei
 jeelnecuffhomhgrihhnpegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wtgpYkYOTdJAQ2gGgVJ_y3A2SVxmyxJEhD1P7FlIHZMJaA-9HldzcQ>
 <xmx:wtgpYia8bd6rwbrGn9zPj9vqEpl3QMWEx9iPfrl5gm423mmmKSE2RQ>
 <xmx:wtgpYoDcsTMmjR31Rku6hsNP2HJWxs2rkQn9v415ZTuMrfN6jemNig>
 <xmx:wtgpYpU9wf4sNFv11tkSR4yf5nSAYMqqybTWs0BoK0y8AyaoG-N4Tg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 05:53:53 -0500 (EST)
Date: Thu, 10 Mar 2022 11:53:52 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220310105352.v7jqjchshaaajsmd@houat>
References: <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
 <20220308134921.zebs533xeazq46ts@houat>
 <1ac9057e-fb6d-02f8-78df-c6518fb6e897@denx.de>
 <20220308162158.j5czx7krscaeqtsy@houat>
 <423c5f19-7b7c-dbc7-7482-34a0537bec21@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6thu7kkjfmoaoefo"
Content-Disposition: inline
In-Reply-To: <423c5f19-7b7c-dbc7-7482-34a0537bec21@denx.de>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6thu7kkjfmoaoefo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 10:41:05PM +0100, Marek Vasut wrote:
> On 3/8/22 17:21, Maxime Ripard wrote:
> > On Tue, Mar 08, 2022 at 03:47:22PM +0100, Marek Vasut wrote:
> > > On 3/8/22 14:49, Maxime Ripard wrote:
> > > > On Tue, Mar 08, 2022 at 02:27:40PM +0100, Marek Vasut wrote:
> > > > > On 3/8/22 13:51, Maxime Ripard wrote:
> > > > > > On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
> > > > > > > On 3/8/22 11:07, Jagan Teki wrote:
> > > > > > > > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> =
wrote:
> > > > > > > > >=20
> > > > > > > > > On 3/8/22 09:03, Jagan Teki wrote:
> > > > > > > > >=20
> > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > [...]
> > > > > > > > >=20
> > > > > > > > > > > @@ -314,7 +321,9 @@ static const struct drm_bridge_fu=
ncs chipone_bridge_funcs =3D {
> > > > > > > > > > >       static int chipone_parse_dt(struct chipone *icn)
> > > > > > > > > > >       {
> > > > > > > > > > >              struct device *dev =3D icn->dev;
> > > > > > > > > > > +       struct device_node *endpoint;
> > > > > > > > > > >              struct drm_panel *panel;
> > > > > > > > > > > +       int dsi_lanes;
> > > > > > > > > > >              int ret;
> > > > > > > > > > >=20
> > > > > > > > > > >              icn->vdd1 =3D devm_regulator_get_optiona=
l(dev, "vdd1");
> > > > > > > > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt(str=
uct chipone *icn)
> > > > > > > > > > >                      return PTR_ERR(icn->enable_gpio);
> > > > > > > > > > >              }
> > > > > > > > > > >=20
> > > > > > > > > > > +       endpoint =3D of_graph_get_endpoint_by_regs(de=
v->of_node, 0, 0);
> > > > > > > > > > > +       dsi_lanes =3D of_property_count_u32_elems(end=
point, "data-lanes");
> > > > > > > > > > > +       icn->host_node =3D of_graph_get_remote_port_p=
arent(endpoint);
> > > > > > > > > > > +       of_node_put(endpoint);
> > > > > > > > > > > +
> > > > > > > > > > > +       if (!icn->host_node)
> > > > > > > > > > > +               return -ENODEV;
> > > > > > > > > >=20
> > > > > > > > > > The non-ports-based OF graph returns a -19 example on t=
he Allwinner
> > > > > > > > > > Display pipeline in R16 [1].
> > > > > > > > > >=20
> > > > > > > > > > We need to have a helper to return host_node for non-po=
rts as I have
> > > > > > > > > > done it for drm_of_find_bridge.
> > > > > > > > > >=20
> > > > > > > > > > [1] https://patchwork.amarulasolutions.com/patch/1805/
> > > > > > > > >=20
> > > > > > > > > The link points to a patch marked "DO NOT MERGE", maybe t=
hat patch is
> > > > > > > > > missing the DSI host port@0 OF graph link ? Both port@0 a=
nd port@1 are
> > > > > > > > > required, see:
> > > > > > > > >=20
> > > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn=
6211.yaml#n53
> > > > > > > > >=20
> > > > > > > > > What is "non-ports-based OF graph" ?
> > > > > > > > >=20
> > > > > > > > > I don't see drm_of_find_bridge() in linux-next , what is =
that ?
> > > > > > > >=20
> > > > > > > > port@0 is optional as some of the DSI host OF-graph represe=
nt the
> > > > > > > > bridge or panel as child nodes instead of ports. (i think d=
t-binding
> > > > > > > > has to fix it to make port@0 optional)
> > > > > > >=20
> > > > > > > The current upstream DT binding document says:
> > > > > > >=20
> > > > > > >        required:
> > > > > > >          - port@0
> > > > > > >          - port@1
> > > > > > >=20
> > > > > > > So port@0 is mandatory.
> > > > > >=20
> > > > > > In the binding, sure, but fundamentally the DT excerpt Jagan pr=
ovided is
> > > > > > correct. If the bridge supports DCS, there's no reason to use t=
he OF
> > > > > > graph in the first place: the bridge node will be a child node =
of the
> > > > > > MIPI-DSI controller (and there's no obligation to use the OF-gr=
aph for a
> > > > > > MIPI-DSI controller).
> > > > > >=20
> > > > > > I believe port@0 should be made optional (or downright removed =
if
> > > > > > MIPI-DCS in the only control bus).
> > > > >=20
> > > > > That's out of scope of this series anyway, so Jagan can implement=
 patches
> > > > > for that mode if needed.
> > > >=20
> > > > Not really? You can't count on the port@0 being there generally
> > > > speaking, so you can't count on data-lanes being there either, which
> > > > exactly what you're doing in this patch.
> > >=20
> > > I can because the upstream DT bindings currently say port@0 must be p=
resent,
> > > see above. If that requirement should be relaxed, sure, but that's a
> > > separate series.
> >=20
> > And another upstream DT bindings say that you don't need them at all.
>=20
> Which "another upstream DT bindings" do you refer to ?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/display/mipi-dsi-bus.txt

> > Yes, there's a conflict. Yes, it's unfortunate. But the generic DSI
> > binding is far more relevant than a single bridge driver.
>=20
> That seems to be the wrong way around, how can generic subsystem-wide
> binding take precedence over specific driver binding ?

This is the binding of the bus. You're part of that bus. You're a child
node of that bus, but nothing ever mandates that your parent node uses
the same convention. And some don't. And since your bridge can be
connected to pretty much any DSI controller, you have to use the lowest
common denominator, not make up some new constraints that not all
controller will be able to comply with.

> > So figuring it out is very much a prerequisite to that series,
> > especially since those patches effectively make the OF-graph mandatory
> > in some situations, while it was purely aesthetics before.
>=20
> The OF-graph is mandatory per the DT bindings of this driver. If you
> implement invalid DT which does not contain port@0, it will fail DT
> validation.
>
> If this requirement should be relaxed, sure, it can and I don't think it
> would be hard to do, but I don't see why that should be part of this seri=
es,
> which follows the upstream DT binding document for this driver.
>=20
> If I cannot trust the driver DT bindings to indicate what is and is not
> mandatory, what other document can I trust then ...

Oh, come on. Doing that, you also require OF-Graph support for the DSI
controller you attach to, and you can't require that. This is very
different from just requiring a property that doesn't have any impact on
any other device, and you know that very well.

Anyway, you wanted my review. You have it. Do what you want with it.

Maxime

--6thu7kkjfmoaoefo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYinYvwAKCRDj7w1vZxhR
xXsDAQDmeKWvYkoO29C0xL0A0vDe+dBi0xhqD3gz9osPmnuwFwD+LMq3BTPmTXdK
pHKpk3GsFMoeTjakbzClZtashOqzbgw=
=hRrF
-----END PGP SIGNATURE-----

--6thu7kkjfmoaoefo--
