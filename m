Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDD44D6659
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 17:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3C710E9EB;
	Fri, 11 Mar 2022 16:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2D710E9EB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 16:30:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 76BB45C02AE;
 Fri, 11 Mar 2022 11:30:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 11 Mar 2022 11:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=VUbopz+dZrhimWMmUFNuSlRGGQ+NG8fV4vsqzz
 bL21g=; b=rpsX/LV37ops2VtxEzSvU56PBqiSXtap/+Q1XCZRXOI1MvLZmXmzG2
 rOwetnyQiK2TcWhxs1FMJ0bUaxlksIC4chjQOWhUXEYvQMBoyxoSH+hELstY22Nx
 VcGR5crqbBSTfbruydFyDcy2wnLWM1ngGaUbfVm6oykZMe36ZhpOwSQyVZn1QCdk
 HoOXd6tMy+qPC0kJ8nXfVAV7AOnbroRnBasHsAhtcjRsnju7LPAagK3AoMVmzP8p
 Z/V8hr9mYFKeSq4LKa3IWrpns32nCc8k6hKm69JmPWCGtizUwPAGemHFxL1U9Fob
 sVRJUusVU3LfiwGmZFqpkj/h3U3j9sdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VUbopz+dZrhimWMmU
 FNuSlRGGQ+NG8fV4vsqzzbL21g=; b=CexNilJrImyPoL6AjzrZzwBW7d7dNodA/
 2pJymayO1g0F81KxrMpGGUp6OylthmoXyceaXvMjDqCxDF1yKjl03pFJIr0ByKrW
 5CQAIU31l6/HxfZS1CgJ7amjmlil6mm6eBCu6erj0X1wEGaMo+oOv30ZE9KzH8Pf
 FKBSpauqCLuyNEzhopNF4bH6ZuGG83SwpUv01lvkN84drhVZgcXVV8mnJxjo718h
 ulpstZnLv91VPu/fvNU5Amye3Usz7fcituhZujZl4nEryQEkqi7xxNrtBDVQYFFE
 App5HG0wlWWB3BMDj3cd9SP+hPRzmHhSXH+sj9sZO5ZTSTazp49dA==
X-ME-Sender: <xms:B3krYj9i7NXeI6z1RC3nc5b0y47maKC2zMLOa_2VDb_ZQK_hMZsF0w>
 <xme:B3krYvuK9PFhRDhBZEnOrECC2TZckfZQtP8kA30vitbCT0XKePhvm9-R4IZ5b35j3
 HAyQ1yPdqKQGk8LbE4>
X-ME-Received: <xmr:B3krYhAHwXrj0tRnXN8epRgI5wL6smBm9e_9naTm2LeoLq1pT9HvVvJh_kKozSjV-Rxz2ihkBjXUOrPYcQsHaOGWODJmowljFpVIt-U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvvddgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfdtgfdvhfekffeitefhtdevteegvdehuddvudekgfelgefguefhteefleei
 jeelnecuffhomhgrihhnpegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:B3krYvfNK1iYANCB2t8j1_U7tGGIDo4unOj0U_Jw6XoKbYe6_vxmlg>
 <xmx:B3krYoNgqjPVYe7tGhfy0cYhTuO3c3Hfqz7ISSQw_crn1XbKdVTN-w>
 <xmx:B3krYhlm6yVTVK-A8Ve8MBACi6I5B_3MVbmQUB3ByFzrFrrQk6S8wA>
 <xmx:CHkrYn2NWocWgJ1GcDIOISY2zhoIC4BoEm4LFgsFXCkDK_ttHw4-Jw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Mar 2022 11:29:59 -0500 (EST)
Date: Fri, 11 Mar 2022 17:29:56 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220311162956.vm7qsrzauw7asosv@houat>
References: <20220308125140.e7orpvocrerr5xdv@houat>
 <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
 <20220308134921.zebs533xeazq46ts@houat>
 <1ac9057e-fb6d-02f8-78df-c6518fb6e897@denx.de>
 <20220308162158.j5czx7krscaeqtsy@houat>
 <423c5f19-7b7c-dbc7-7482-34a0537bec21@denx.de>
 <20220310105352.v7jqjchshaaajsmd@houat>
 <c60112b4-5095-11ad-0da4-c84bb30bf77f@denx.de>
 <20220310141807.5yqho4gloz4lrdjt@houat>
 <17281de1-1299-19ee-ece3-767ef7e8a32b@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mrug6s5lbubei7dp"
Content-Disposition: inline
In-Reply-To: <17281de1-1299-19ee-ece3-767ef7e8a32b@denx.de>
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


--mrug6s5lbubei7dp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2022 at 11:36:58AM +0100, Marek Vasut wrote:
> On 3/10/22 15:18, Maxime Ripard wrote:
> > On Thu, Mar 10, 2022 at 01:47:13PM +0100, Marek Vasut wrote:
> > > On 3/10/22 11:53, Maxime Ripard wrote:
> > > > On Tue, Mar 08, 2022 at 10:41:05PM +0100, Marek Vasut wrote:
> > > > > On 3/8/22 17:21, Maxime Ripard wrote:
> > > > > > On Tue, Mar 08, 2022 at 03:47:22PM +0100, Marek Vasut wrote:
> > > > > > > On 3/8/22 14:49, Maxime Ripard wrote:
> > > > > > > > On Tue, Mar 08, 2022 at 02:27:40PM +0100, Marek Vasut wrote:
> > > > > > > > > On 3/8/22 13:51, Maxime Ripard wrote:
> > > > > > > > > > On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut w=
rote:
> > > > > > > > > > > On 3/8/22 11:07, Jagan Teki wrote:
> > > > > > > > > > > > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@d=
enx.de> wrote:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > On 3/8/22 09:03, Jagan Teki wrote:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Hi,
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > [...]
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > @@ -314,7 +321,9 @@ static const struct drm_b=
ridge_funcs chipone_bridge_funcs =3D {
> > > > > > > > > > > > > > >         static int chipone_parse_dt(struct ch=
ipone *icn)
> > > > > > > > > > > > > > >         {
> > > > > > > > > > > > > > >                struct device *dev =3D icn->de=
v;
> > > > > > > > > > > > > > > +       struct device_node *endpoint;
> > > > > > > > > > > > > > >                struct drm_panel *panel;
> > > > > > > > > > > > > > > +       int dsi_lanes;
> > > > > > > > > > > > > > >                int ret;
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > >                icn->vdd1 =3D devm_regulator_g=
et_optional(dev, "vdd1");
> > > > > > > > > > > > > > > @@ -350,15 +359,42 @@ static int chipone_pars=
e_dt(struct chipone *icn)
> > > > > > > > > > > > > > >                        return PTR_ERR(icn->en=
able_gpio);
> > > > > > > > > > > > > > >                }
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > +       endpoint =3D of_graph_get_endpoint_by=
_regs(dev->of_node, 0, 0);
> > > > > > > > > > > > > > > +       dsi_lanes =3D of_property_count_u32_e=
lems(endpoint, "data-lanes");
> > > > > > > > > > > > > > > +       icn->host_node =3D of_graph_get_remot=
e_port_parent(endpoint);
> > > > > > > > > > > > > > > +       of_node_put(endpoint);
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +       if (!icn->host_node)
> > > > > > > > > > > > > > > +               return -ENODEV;
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > The non-ports-based OF graph returns a -19 exam=
ple on the Allwinner
> > > > > > > > > > > > > > Display pipeline in R16 [1].
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > We need to have a helper to return host_node fo=
r non-ports as I have
> > > > > > > > > > > > > > done it for drm_of_find_bridge.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > [1] https://patchwork.amarulasolutions.com/patc=
h/1805/
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > The link points to a patch marked "DO NOT MERGE",=
 maybe that patch is
> > > > > > > > > > > > > missing the DSI host port@0 OF graph link ? Both =
port@0 and port@1 are
> > > > > > > > > > > > > required, see:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/t=
orvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chi=
pone,icn6211.yaml#n53
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > What is "non-ports-based OF graph" ?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > I don't see drm_of_find_bridge() in linux-next , =
what is that ?
> > > > > > > > > > > >=20
> > > > > > > > > > > > port@0 is optional as some of the DSI host OF-graph=
 represent the
> > > > > > > > > > > > bridge or panel as child nodes instead of ports. (i=
 think dt-binding
> > > > > > > > > > > > has to fix it to make port@0 optional)
> > > > > > > > > > >=20
> > > > > > > > > > > The current upstream DT binding document says:
> > > > > > > > > > >=20
> > > > > > > > > > >          required:
> > > > > > > > > > >            - port@0
> > > > > > > > > > >            - port@1
> > > > > > > > > > >=20
> > > > > > > > > > > So port@0 is mandatory.
> > > > > > > > > >=20
> > > > > > > > > > In the binding, sure, but fundamentally the DT excerpt =
Jagan provided is
> > > > > > > > > > correct. If the bridge supports DCS, there's no reason =
to use the OF
> > > > > > > > > > graph in the first place: the bridge node will be a chi=
ld node of the
> > > > > > > > > > MIPI-DSI controller (and there's no obligation to use t=
he OF-graph for a
> > > > > > > > > > MIPI-DSI controller).
> > > > > > > > > >=20
> > > > > > > > > > I believe port@0 should be made optional (or downright =
removed if
> > > > > > > > > > MIPI-DCS in the only control bus).
> > > > > > > > >=20
> > > > > > > > > That's out of scope of this series anyway, so Jagan can i=
mplement patches
> > > > > > > > > for that mode if needed.
> > > > > > > >=20
> > > > > > > > Not really? You can't count on the port@0 being there gener=
ally
> > > > > > > > speaking, so you can't count on data-lanes being there eith=
er, which
> > > > > > > > exactly what you're doing in this patch.
> > > > > > >=20
> > > > > > > I can because the upstream DT bindings currently say port@0 m=
ust be present,
> > > > > > > see above. If that requirement should be relaxed, sure, but t=
hat's a
> > > > > > > separate series.
> > > > > >=20
> > > > > > And another upstream DT bindings say that you don't need them a=
t all.
> > > > >=20
> > > > > Which "another upstream DT bindings" do you refer to ?
> > > >=20
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> > > >=20
> > > > > > Yes, there's a conflict. Yes, it's unfortunate. But the generic=
 DSI
> > > > > > binding is far more relevant than a single bridge driver.
> > > > >=20
> > > > > That seems to be the wrong way around, how can generic subsystem-=
wide
> > > > > binding take precedence over specific driver binding ?
> > > >=20
> > > > This is the binding of the bus. You're part of that bus. You're a c=
hild
> > > > node of that bus, but nothing ever mandates that your parent node u=
ses
> > > > the same convention. And some don't. And since your bridge can be
> > > > connected to pretty much any DSI controller, you have to use the lo=
west
> > > > common denominator, not make up some new constraints that not all
> > > > controller will be able to comply with.
> > >=20
> > > It seems to me the ICN6211 DT bindings currently further constraint t=
he
> > > generic DSI bus bindings, and that seems OK to me.
> > >=20
> > > Let me reiterate this again -- if someone wants to relax the requirem=
ents
> > > currently imposed by the ICN6211 DT bindings, fine, but that can be d=
one in
> > > a separate patchset AND that needs DT bindings update. Furthermore, t=
here
> > > are no users of this ICN6211 bridge in upstream DTs, so there is curr=
ently
> > > no bridge which would operate without OF graph using this driver.
> >=20
> > And let me reiterate this again: something that used to work for a user
> > doesn't anymore when your series is applied. This is a textbook
> > regression. I suggested a way forward, that you don't like for some
> > reason, fine. But pushing through a regression is just not acceptable.
>=20
> How can this be a regression if this mode of operation could not have ever
> been supported with valid upstream DT bindings in the first place ?
>=20
> Should we now require that kernel drivers somehow magically support all
> kinds of random broken DT bindings in addition to ones which pass YAML DT
> validation ?

The thing is, as I told you multiple times already, it was broken from
the bridge standpoint, but not from the controller's. If it had been
correct for the bridge, it wouldn't have been for the controller. So,
same story.

The only difference is that it wouldn't affect you, but I don't see how
it's relevant.

> > > > > > So figuring it out is very much a prerequisite to that series,
> > > > > > especially since those patches effectively make the OF-graph ma=
ndatory
> > > > > > in some situations, while it was purely aesthetics before.
> > > > >=20
> > > > > The OF-graph is mandatory per the DT bindings of this driver. If =
you
> > > > > implement invalid DT which does not contain port@0, it will fail =
DT
> > > > > validation.
> > > > >=20
> > > > > If this requirement should be relaxed, sure, it can and I don't t=
hink it
> > > > > would be hard to do, but I don't see why that should be part of t=
his series,
> > > > > which follows the upstream DT binding document for this driver.
> > > > >=20
> > > > > If I cannot trust the driver DT bindings to indicate what is and =
is not
> > > > > mandatory, what other document can I trust then ...
> > > >=20
> > > > Oh, come on. Doing that, you also require OF-Graph support for the =
DSI
> > > > controller you attach to, and you can't require that. This is very
> > > > different from just requiring a property that doesn't have any impa=
ct on
> > > > any other device, and you know that very well.
> > >=20
> > > Currently the ICN6211 DT bindings DO require that kind of bridge.
> >=20
> > And while this wasn't enforced before, you make it a hard requirement
> > with this series. This is what changed, and what caused this whole
> > discussion.
>=20
> The current DT bindings already make it a hard requirement, so no, nothing
> changed here.
>=20
> Unless what you are trying to ask for is support for broken DT bindings
> which do not pass YAML DT validation by this driver, but that is very
> dangerous, because then the question is, how far should we support such
> broken bindings. What kind of broken is still OK and what kind of broken =
is
> no longer OK ?

If it ever worked in a mainline release, it must always work. See:
https://www.kernel.org/doc/html/latest/devicetree/bindings/ABI.html

As far as I'm concerned, it's the sole criteria. So to answer your
question, if it was broken but worked at some point, yes, we need to
keep supporting it. If it never worked, no, we don't.

Honestly, I don't get the push-back. To fix this properly would require:
  - to remove port@0 being mandatory
  - to move the data-lanes property to the bridge node itself.

That's it. It takes 5 minutes, 30 minutes with the test and the commit
log. We've spent more time arguing about it already.

So if you want to continue debating on whether it's a regression or not,
or whether DT ABI stability is a good thing or not, go ahead. But as far
as I'm concerned, this isn't really up for debate.

Maxime

--mrug6s5lbubei7dp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYit5BAAKCRDj7w1vZxhR
xRpxAQDhc3Dl4LSegA5MxksMokbrwMPFf4w8ERhZbDFlUSIHnwD/WapoD8pVNqUI
OiIAXfe3jTQFLV3H8luODl376bJ/nQ4=
=gAM3
-----END PGP SIGNATURE-----

--mrug6s5lbubei7dp--
