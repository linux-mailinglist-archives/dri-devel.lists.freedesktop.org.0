Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81D4D452F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994E110EC69;
	Thu, 10 Mar 2022 10:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E110EC6B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:57:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7D46D3201D7C;
 Thu, 10 Mar 2022 05:57:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Mar 2022 05:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=J/PltNZzNcw3+q9QZFnCMD2jliHxsh6Ps6G7yx
 ddgSw=; b=eHrp718uVwpmddbmb3zJFxA+v3CCJrNzIMUPkcTAPumUeRfI/pe3sV
 GugGwrhWsz7hwM92ns4tLAibGkPrf5Ix9mErmQHX+u4snzlj2JMsHw1h/GKmYiVe
 64VEmrDskwlwrom7RgKI6vcdFSitHYYnVePK4zaKoTtFF5MBpxLmjZc8v1m11aG6
 abrMJcd9Qy8kv3yWK/bk3QOjObtEpd/FmCBf3fpeqbxf135U8Rg0SBoLyEz3jMTm
 vVOwn/FPupCI6pu2D4tMWxSzjzlfNDUYJ5lKRtg94RTQgfaiXUkTbNWsOQ6JeeHw
 deDJ3+5cEVg3RQ2ijl86HZgdGFO4FKEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=J/PltNZzNcw3+q9QZ
 FnCMD2jliHxsh6Ps6G7yxddgSw=; b=bJETutIvydDtgp60WKAKnyvqsJv0TJHYe
 g9j7vHzoDrXRDDh6+ZCZVOgQ3Edq8kygA/GWYZHFaOLqTCd6sgSXiD2G6cwE3LRx
 ArneoRwjs8mejvGb88+JDGu9KXOnfDQXgtlW8bkQ9mjEiSF/i1K2TCXV28g4WO2Z
 vpSjMdi7v0bZXmzF1hE1QpCM2NFE1RVNl8Wm0WAvc0/lQxpdZRMjFuMTk/pCMRAJ
 c8ypJ4WB/GqvL3gkZHNIIiXnIfqyBFs7cvgAvaoZ/HV82iQubrTRsk63FgRCtga6
 tvhAfqYwc+PIDcgpymW4FNG54wlWvu3CNJI3dWjNpZvHh8IGvOGWA==
X-ME-Sender: <xms:pNkpYvJNgBnzKBa5yBCAI5DqwyUvjQBAWcbtDOSiQrHOzWU85GfxnA>
 <xme:pNkpYjK4tiBGwUk7EG_sQHeZdSmuX2qVmpS1TJEf3blCuYfjZ7T9kn2188vHP_bmV
 vS8uwVgIhf_2Bk4zuo>
X-ME-Received: <xmr:pNkpYnuxwTgTAEx3i1zSZTCbgMzS2tJai8E9IRC5Bi8cBRlcbVJnWGVGRJVoSULjRNDrjB3GhOrjO_rtrFsft3EoQARhPZAsTqMdM6U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfdtgfdvhfekffeitefhtdevteegvdehuddvudekgfelgefguefhteefleei
 jeelnecuffhomhgrihhnpegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pNkpYoZ_NLwS4kPILfGmWEAaRn-f9mrwAlg34a8jN_db-sTx0P3llQ>
 <xmx:pNkpYmZ0uEzrolN-QMec-JSyS-LCc8ZBxJy3cZ80ULaUyBW3kJpYDQ>
 <xmx:pNkpYsDPC6Y57chn2STRSXj4xA3wCOTB0YLHa6n8aP1tsBirrTSLqQ>
 <xmx:pdkpYty5kNxLX5aC5V5Dgae50326qMM0QBVH5sgGqf9lef-nEyV1BQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 05:57:40 -0500 (EST)
Date: Thu, 10 Mar 2022 11:57:38 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220310105738.uz7ul3ycmsbt43po@houat>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <YinWBFgdw22SlRKt@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nfowsmx6fzs2wbal"
Content-Disposition: inline
In-Reply-To: <YinWBFgdw22SlRKt@pendragon.ideasonboard.com>
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


--nfowsmx6fzs2wbal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 12:42:12PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> On Tue, Mar 08, 2022 at 01:51:40PM +0100, Maxime Ripard wrote:
> > On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
> > > On 3/8/22 11:07, Jagan Teki wrote:
> > > > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
> > > > >=20
> > > > > On 3/8/22 09:03, Jagan Teki wrote:
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > [...]
> > > > >=20
> > > > > > > @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chip=
one_bridge_funcs =3D {
> > > > > > >    static int chipone_parse_dt(struct chipone *icn)
> > > > > > >    {
> > > > > > >           struct device *dev =3D icn->dev;
> > > > > > > +       struct device_node *endpoint;
> > > > > > >           struct drm_panel *panel;
> > > > > > > +       int dsi_lanes;
> > > > > > >           int ret;
> > > > > > >=20
> > > > > > >           icn->vdd1 =3D devm_regulator_get_optional(dev, "vdd=
1");
> > > > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chip=
one *icn)
> > > > > > >                   return PTR_ERR(icn->enable_gpio);
> > > > > > >           }
> > > > > > >=20
> > > > > > > +       endpoint =3D of_graph_get_endpoint_by_regs(dev->of_no=
de, 0, 0);
> > > > > > > +       dsi_lanes =3D of_property_count_u32_elems(endpoint, "=
data-lanes");
> > > > > > > +       icn->host_node =3D of_graph_get_remote_port_parent(en=
dpoint);
> > > > > > > +       of_node_put(endpoint);
> > > > > > > +
> > > > > > > +       if (!icn->host_node)
> > > > > > > +               return -ENODEV;
> > > > > >=20
> > > > > > The non-ports-based OF graph returns a -19 example on the Allwi=
nner
> > > > > > Display pipeline in R16 [1].
> > > > > >=20
> > > > > > We need to have a helper to return host_node for non-ports as I=
 have
> > > > > > done it for drm_of_find_bridge.
> > > > > >=20
> > > > > > [1] https://patchwork.amarulasolutions.com/patch/1805/
> > > > >=20
> > > > > The link points to a patch marked "DO NOT MERGE", maybe that patc=
h is
> > > > > missing the DSI host port@0 OF graph link ? Both port@0 and port@=
1 are
> > > > > required, see:
> > > > >=20
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yam=
l#n53
> > > > >=20
> > > > > What is "non-ports-based OF graph" ?
> > > > >=20
> > > > > I don't see drm_of_find_bridge() in linux-next , what is that ?
> > > >=20
> > > > port@0 is optional as some of the DSI host OF-graph represent the
> > > > bridge or panel as child nodes instead of ports. (i think dt-binding
> > > > has to fix it to make port@0 optional)
> > >=20
> > > The current upstream DT binding document says:
> > >=20
> > >     required:
> > >       - port@0
> > >       - port@1
> > >=20
> > > So port@0 is mandatory.
> >=20
> > In the binding, sure, but fundamentally the DT excerpt Jagan provided is
> > correct. If the bridge supports DCS, there's no reason to use the OF
> > graph in the first place: the bridge node will be a child node of the
> > MIPI-DSI controller (and there's no obligation to use the OF-graph for a
> > MIPI-DSI controller).
> >=20
> > I believe port@0 should be made optional (or downright removed if
> > MIPI-DCS in the only control bus).
>=20
> I think we should make ports mandatory in all cases actually.
>=20
> The DT parent-child hierarchy is meant to model control relations
> between devices, so a DSI device controlled through DCS should be a
> child of the DSI controller. No disagreement there.
>=20
> The OF graph is meant to model data connections. While a DSI device
> controlled through DCS will use the same DSI link for data transfer, the
> two concepts are different. We have taken shortcuts and decided to not
> use OF graph for some DSI devices (not necessarily as a well thought
> decision, it was sometimes just not considered).

I disagree. Unless the data path is explicitly stated using the OF-graph
or some other binding, it's inferred. We never asked ourselves where the
data from an i2c chip, an ethernet controller or an v4l2 output device
was coming from. It comes from the parent bus, because it's what makes
sense. Making a requirement on the OF-Graph to model this would create a
big inconsistency.

> This has led to different issues that we're having to deal with today,
> making it more difficult to develop generic code. Going forward, I
> think new bindings should always use OF graph to model the data
> connection.

Either way, that discussion is irrelevant. Not all DSI controllers use
OF-Graph, a bridge can be attached to any of them, so we can't require
OF-Graph support in any bridge.

Maxime

--nfowsmx6fzs2wbal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYinZogAKCRDj7w1vZxhR
xVm9AP0ax2fz72egmW5BtOsCaqovOj479/GReh6a4g6EbFpNcQEAsfk3cQcHvyiK
uYlUrUYpAP/lIMLJpNNIJQ8W5/6tTw4=
=iWYw
-----END PGP SIGNATURE-----

--nfowsmx6fzs2wbal--
