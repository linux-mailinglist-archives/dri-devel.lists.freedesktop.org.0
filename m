Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A74D1853
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 13:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5639410E5D2;
	Tue,  8 Mar 2022 12:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEFA10E5D9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 12:51:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 148835C0243;
 Tue,  8 Mar 2022 07:51:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 08 Mar 2022 07:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Gxtvj5VsRVmFKmiuxJf7F/4PHlqZqJyS+YUx8F
 +lsws=; b=TlqTYHMrYvFAUlpUaSE1e+eW71pYbRE/dN5HrbIoy+N0Uj0xl7aBQ3
 0FHd8oTxvWuqt17v3ky/5MiRDeXMz8H4pQfV7l/WQnqfTGQyGSWJ0Zh0IHxGdK65
 mHFQHyEsXFBhFXIdOakecZuCLvZU9er4pLtDrmnPsWsFAx3LIALvwJzN7by89bjU
 62usE/ixswL1CXBAcOgEtabbzgkIunAL4TAmVV0pHMpy4MA/dil4nWrC2xtwwgeF
 uy/EdoL3c26vKghlrc+hGEXo1IwKL6dJakaTm5vgNb8Yw4HSGyeK+haLjKdRQfSR
 27U0IkLQgJUQDwaQJJbPcgVkGswEqzhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Gxtvj5VsRVmFKmiux
 Jf7F/4PHlqZqJyS+YUx8F+lsws=; b=KKoiMj98Xt8G+CF5WpHBR9wzO6QhNWVIM
 /FHgNX949VoFcIrhPXHnF9xnFqsHe0Nw+vc7CrowXoOw6EWdjA7R9kMCwH5dQ7AV
 FtwgGWBFm1q3AyeHgYMIuHO0ZdHsqUz6t4DfS8X+46sXKu9II2VTs9+P0ED2LG7l
 6xQWZ7D7P4jnyTfQt1Y3yLLBC0qAEgC3CqZguZuDhrpEYOKQq8tDbirlVFGNGT+o
 g0my/bLsF1mrI7CaNfcOTZh2dspg6OoLhHmzLQEXNz3FQNw7R4ETGel/DylJ/C/B
 UqKy5jgCMRBCotsrvTb+t1wP2uBhXSwhP+8fJbCiOcec/Dica/mNg==
X-ME-Sender: <xms:XlEnYsAESWkJL_P4oMoHP8sAm-GD65MUfkD5vJUQV1EUDWl1XLQXHg>
 <xme:XlEnYuihUZd2YLQqmqi9xhIrUuhZGr58IfEg1Aw8wIxNtO0ON6HQY0iAQq6HppxZ_
 eI4e0gLkSbtxTYBTbE>
X-ME-Received: <xmr:XlEnYvm3eC6kBmydJ1Bcr2JegS_EU_xXgbcOm8-UmNdJnqEPwT8V9NMdHK3fZOzWOQy7Qm0Csa7plieaZaRR59XnRK6UolTjppPynbI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfdtgfdvhfekffeitefhtdevteegvdehuddvudekgfelgefguefhteefleei
 jeelnecuffhomhgrihhnpegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XlEnYix3HwuCioimYM2oAVgkRP7F8v36rLYRjRxXzMKu9zbpahobWQ>
 <xmx:XlEnYhQKS0JoE6S6YEHKvrp_KK8c71C9lRTNB4WuuEBQ41rYrl2FuA>
 <xmx:XlEnYtbeV8gI4LNZgRjNn0iakAEkAQ-49Wl5kYO7T4s4yhR23b8Y5g>
 <xmx:X1EnYvP1D4kY0PeJIBsoA2SVoAYiX3bKZViUW22Yolg99P6uaHmfOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 07:51:42 -0500 (EST)
Date: Tue, 8 Mar 2022 13:51:40 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220308125140.e7orpvocrerr5xdv@houat>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c2mpnnspiuevrjg5"
Content-Disposition: inline
In-Reply-To: <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
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


--c2mpnnspiuevrjg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 11:29:59AM +0100, Marek Vasut wrote:
> On 3/8/22 11:07, Jagan Teki wrote:
> > On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
> > >=20
> > > On 3/8/22 09:03, Jagan Teki wrote:
> > >=20
> > > Hi,
> > >=20
> > > [...]
> > >=20
> > > > > @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_=
bridge_funcs =3D {
> > > > >    static int chipone_parse_dt(struct chipone *icn)
> > > > >    {
> > > > >           struct device *dev =3D icn->dev;
> > > > > +       struct device_node *endpoint;
> > > > >           struct drm_panel *panel;
> > > > > +       int dsi_lanes;
> > > > >           int ret;
> > > > >=20
> > > > >           icn->vdd1 =3D devm_regulator_get_optional(dev, "vdd1");
> > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone =
*icn)
> > > > >                   return PTR_ERR(icn->enable_gpio);
> > > > >           }
> > > > >=20
> > > > > +       endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, =
0, 0);
> > > > > +       dsi_lanes =3D of_property_count_u32_elems(endpoint, "data=
-lanes");
> > > > > +       icn->host_node =3D of_graph_get_remote_port_parent(endpoi=
nt);
> > > > > +       of_node_put(endpoint);
> > > > > +
> > > > > +       if (!icn->host_node)
> > > > > +               return -ENODEV;
> > > >=20
> > > > The non-ports-based OF graph returns a -19 example on the Allwinner
> > > > Display pipeline in R16 [1].
> > > >=20
> > > > We need to have a helper to return host_node for non-ports as I have
> > > > done it for drm_of_find_bridge.
> > > >=20
> > > > [1] https://patchwork.amarulasolutions.com/patch/1805/
> > >=20
> > > The link points to a patch marked "DO NOT MERGE", maybe that patch is
> > > missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
> > > required, see:
> > >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
> > >=20
> > > What is "non-ports-based OF graph" ?
> > >=20
> > > I don't see drm_of_find_bridge() in linux-next , what is that ?
> >=20
> > port@0 is optional as some of the DSI host OF-graph represent the
> > bridge or panel as child nodes instead of ports. (i think dt-binding
> > has to fix it to make port@0 optional)
>=20
> The current upstream DT binding document says:
>=20
>     required:
>       - port@0
>       - port@1
>=20
> So port@0 is mandatory.

In the binding, sure, but fundamentally the DT excerpt Jagan provided is
correct. If the bridge supports DCS, there's no reason to use the OF
graph in the first place: the bridge node will be a child node of the
MIPI-DSI controller (and there's no obligation to use the OF-graph for a
MIPI-DSI controller).

I believe port@0 should be made optional (or downright removed if
MIPI-DCS in the only control bus).

Maxime

--c2mpnnspiuevrjg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYidRXAAKCRDj7w1vZxhR
xYWHAQDTBh58dY+spQdVC1O6tHdixwdjQfIRBm/7Z+x/Z3hMMAEAtGJNAzN92AvU
R/EMdkMj07GOVBLSCnttZeEPxqazjws=
=sXvb
-----END PGP SIGNATURE-----

--c2mpnnspiuevrjg5--
