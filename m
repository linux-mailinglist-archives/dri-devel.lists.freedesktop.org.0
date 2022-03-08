Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384A4D1997
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1B110E304;
	Tue,  8 Mar 2022 13:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D30A10E304
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:49:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CA9BE5C0229;
 Tue,  8 Mar 2022 08:49:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 08 Mar 2022 08:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Aim1tDHtHJjEYilJesYsjdn54u5ceIzeJnsHzT
 GwDR8=; b=KaPsGHAbvdPNcwXW4Q6NGXFt8A4/6YDDcgJOsUn6CcNZLm4K7xxoDX
 bu5W3qd3Kmah62I9HJYLXnc9LxcBd+66CnTqkx9ZsX+RcRB8s172NMs+vdbbKjxV
 8hMH/h+mTAc+nI95swRESqVpfl37VJlx+Yf+QM7wCgNZSsNK1hXQ3ut7vne0Kg6+
 s2vdpUrDYH2dhSKs7LTKCZNM2ex0BMv6Xtv0vrclj9j21n05uUz8bgcVT2imHHj/
 gdRoRtNuk/ljm/UlPzwXN7gDCJwm+b/e6aOCLDBpUJo73TuzX4VfKQrqWUHfxmqy
 tXDYF2aVRteVOnh+sjxqx0uognyAYocw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Aim1tDHtHJjEYilJe
 sYsjdn54u5ceIzeJnsHzTGwDR8=; b=bFQvpenq88Hub1+q9kyu3xMekmPd6FYJm
 wHhkcGSmqtTTSppMTuK5H0DXjsncn6bRMq5DjYSzAd/mr2+4ZGI5Q6/dpcMroedo
 Qia68DMlNB/IIsCwFyzMjAlmmYsqs8h850jpzicUh0lBiHLu7B8uznbtrP5sR/jP
 CtBJMIKGEPz9wydFxQKO/2x0XCRcvaB0j2w8waUbAYtwdorWy4+E7kLv+4NooJwG
 eVsLTQT/1E0zkHJVMxqeoM1wOnTGhZ4HCuxryUK3rBEIZyBLYAvz69YQepH57OU/
 vZAvwh7N/QUVhOL0fmAslcHstwRlN0oKREBo3BJajvSnN6OFf1DfQ==
X-ME-Sender: <xms:414nYsvjlrtA9lQpINsutCYniBiHKbj1_OreUKRf3gs2rX4NhnIPHQ>
 <xme:414nYpd7AcGv3N3Fjnx73yIllhf8jPlpg1bBhTgw8uuIIk7k1eG8_pEts6A000xwZ
 oQ4j3-4gJfg4QaEhEY>
X-ME-Received: <xmr:414nYnyhP1vFHQ7ADx4aNSUq69ukJnLnIXqtkPhJkeOYdxzENGZ-cg1H3RUumxd3MbM8hfP5QS4tOluwNNKEYnIIyVlu3Y1Z5wG9_ec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfdtgfdvhfekffeitefhtdevteegvdehuddvudekgfelgefguefhteefleei
 jeelnecuffhomhgrihhnpegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:414nYvOVYLBRUgc-WhtpJrispaLGk6NW2mUh93XTtSEn6rU_GkaTzg>
 <xmx:414nYs_uHxIC-n1jSCWl4rOmtO_EZJos-NcYMFAwVXpkZAItqWleBQ>
 <xmx:414nYnVE4ZEQW_ESbJhIPmGn23puFL8qbI-YBd_JZXnVEAzCdHgnDQ>
 <xmx:5F4nYgYYhXUvphRvQpuQZR9HVGMyqhTbhBovjJ1yARdd1q_SHsDqQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 08:49:23 -0500 (EST)
Date: Tue, 8 Mar 2022 14:49:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220308134921.zebs533xeazq46ts@houat>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bp6eitix2fl3uetu"
Content-Disposition: inline
In-Reply-To: <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
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


--bp6eitix2fl3uetu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 02:27:40PM +0100, Marek Vasut wrote:
> On 3/8/22 13:51, Maxime Ripard wrote:
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
> > > > > > >     static int chipone_parse_dt(struct chipone *icn)
> > > > > > >     {
> > > > > > >            struct device *dev =3D icn->dev;
> > > > > > > +       struct device_node *endpoint;
> > > > > > >            struct drm_panel *panel;
> > > > > > > +       int dsi_lanes;
> > > > > > >            int ret;
> > > > > > >=20
> > > > > > >            icn->vdd1 =3D devm_regulator_get_optional(dev, "vd=
d1");
> > > > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chip=
one *icn)
> > > > > > >                    return PTR_ERR(icn->enable_gpio);
> > > > > > >            }
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
> > >      required:
> > >        - port@0
> > >        - port@1
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
> That's out of scope of this series anyway, so Jagan can implement patches
> for that mode if needed.

Not really? You can't count on the port@0 being there generally
speaking, so you can't count on data-lanes being there either, which
exactly what you're doing in this patch.

Maxime

--bp6eitix2fl3uetu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYide4QAKCRDj7w1vZxhR
xSbOAQDVSuMW8zbqD1cGWFkjQNqKVGOAuLKAxmOvn1GyizBQ5QEA4Zj0a2G8/8py
e8XaFUdSffGLlgbuTed+E9L8y+pp+w8=
=wSqD
-----END PGP SIGNATURE-----

--bp6eitix2fl3uetu--
