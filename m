Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F14D1D0F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B74F10E246;
	Tue,  8 Mar 2022 16:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F0110E246
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:22:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C20F55C0172;
 Tue,  8 Mar 2022 11:22:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 08 Mar 2022 11:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=z2d6jjHWNZh0U7QpepjKIApK1nSQIjyl5hIlqP
 PvDfY=; b=hPAh/pnA2wtYuCaJ0gaW19ICNNFWW8Eqlgh1JORVUdWaPtjl6m/ARZ
 N6YpiKYw8A6LYFaB4USvU+2s9oPKpZ8EGkB192Yv3/2S5c5Zzi3GW1xQzqo5Nxhy
 LKYTVXuVWfp7CtYFHmTpmN3FJO6EFTfc2FbMY6C/eYGNayJZNnw9Y1y6K9FahV+2
 w5ooJlOFyBAX6JtHVYcEXavrd7o/9gCGwzZ2RifPsK6LOetyOazIwBoU8zFnObj4
 SfVPmGfGFS3DUWENRxc6JLTMXHX1q0hJHj2rnjVMir5hgU2f4qgh5Jfaddofbl5B
 L0Up1LVlvtH1g/29Z7DbfG6+LToBHFCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=z2d6jjHWNZh0U7Qpe
 pjKIApK1nSQIjyl5hIlqPPvDfY=; b=Tx/GSc91dcKwW6H4Ffa0wrO6i2s3pYFqf
 RiR8md/HWXlz7Q79vvvS5IR+OW3KZp49DP5aji+u7tmYg7fFMAA0VmkuPUnAtQAS
 wQrY6cAJFtBo5x/66HmQmujok4y4ChGeMz+Cg6EnNyBAP8BwYD97f/IcSud/s1Iv
 5uRcAWHVqnpK7FtIECoDVpxT4gHpPWG4IrU6TPdDrbVKMqwhsdZRlpMYUt33eupe
 4sTbvHrLWPZq5bQ3DgDpDkFC05xfz26BI+X8rtrkmQ7cLyCGpsO/AbQGOJOsA9nF
 xj6DVX2oADMtvpSSJkiZIhkl8zHt6KREU+T1tjZWqLErhWS3tGBqg==
X-ME-Sender: <xms:qIInYuGzLv4pW62Ftrik1CYZUeGDOWT9GE0Z9lMH9LYHXINJWdK4HQ>
 <xme:qIInYvXY4GjhW2UxXQcYbRAkWRDrEf3lgz22ONlJ-W2-Eb3Bf_sfxQ7oCOif8TSrS
 vC5WuTKa3tCbbNa8BQ>
X-ME-Received: <xmr:qIInYoLW5BnfTNOJB9Bxqnaz4BOcCp0FOykt6075EP9XbpITjbfGug7eZMPt_uWDH7UTLmyRr5pC05PvG1BGxC1aTgr84qTRdcBkGzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfdtgfdvhfekffeitefhtdevteegvdehuddvudekgfelgefguefhteefleei
 jeelnecuffhomhgrihhnpegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdpkhgvrh
 hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qIInYoGN418ZYnvPmUXNJMRPHw_Dijh8rvGPsYRSbqxpMR_qYu-7Eg>
 <xmx:qIInYkXqNNKKKeIRcbLZr58knpVnIAj-_ocpgCC-vwfQUpEwtrXYBA>
 <xmx:qIInYrNZhFnBFpqLiBsL-xd7oiTKvoDIUeLXBK9CC2lORGcPWiOdUA>
 <xmx:qYInYiweiRcBe2SGZ4ucmVSEP4EMKSLz5RzBwbCmgy39TkYgGZwsgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 11:22:00 -0500 (EST)
Date: Tue, 8 Mar 2022 17:21:58 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220308162158.j5czx7krscaeqtsy@houat>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
 <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
 <8dfabfae-1722-4c88-1318-fd90630313f4@denx.de>
 <20220308125140.e7orpvocrerr5xdv@houat>
 <dd68f569-7fe3-dc00-b2f0-536b066ec37a@denx.de>
 <20220308134921.zebs533xeazq46ts@houat>
 <1ac9057e-fb6d-02f8-78df-c6518fb6e897@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="owkl3cyhwgepanbj"
Content-Disposition: inline
In-Reply-To: <1ac9057e-fb6d-02f8-78df-c6518fb6e897@denx.de>
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


--owkl3cyhwgepanbj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 03:47:22PM +0100, Marek Vasut wrote:
> On 3/8/22 14:49, Maxime Ripard wrote:
> > On Tue, Mar 08, 2022 at 02:27:40PM +0100, Marek Vasut wrote:
> > > On 3/8/22 13:51, Maxime Ripard wrote:
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
> > > > > > > > >      static int chipone_parse_dt(struct chipone *icn)
> > > > > > > > >      {
> > > > > > > > >             struct device *dev =3D icn->dev;
> > > > > > > > > +       struct device_node *endpoint;
> > > > > > > > >             struct drm_panel *panel;
> > > > > > > > > +       int dsi_lanes;
> > > > > > > > >             int ret;
> > > > > > > > >=20
> > > > > > > > >             icn->vdd1 =3D devm_regulator_get_optional(dev=
, "vdd1");
> > > > > > > > > @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct =
chipone *icn)
> > > > > > > > >                     return PTR_ERR(icn->enable_gpio);
> > > > > > > > >             }
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
> > > > >       required:
> > > > >         - port@0
> > > > >         - port@1
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
> > > That's out of scope of this series anyway, so Jagan can implement pat=
ches
> > > for that mode if needed.
> >=20
> > Not really? You can't count on the port@0 being there generally
> > speaking, so you can't count on data-lanes being there either, which
> > exactly what you're doing in this patch.
>=20
> I can because the upstream DT bindings currently say port@0 must be prese=
nt,
> see above. If that requirement should be relaxed, sure, but that's a
> separate series.

And another upstream DT bindings say that you don't need them at all.
Yes, there's a conflict. Yes, it's unfortunate. But the generic DSI
binding is far more relevant than a single bridge driver.

So figuring it out is very much a prerequisite to that series,
especially since those patches effectively make the OF-graph mandatory
in some situations, while it was purely aesthetics before.

Maxime

--owkl3cyhwgepanbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYieCpQAKCRDj7w1vZxhR
xTpzAP49SQzo6ZDuk0fOnC3frpI8kCDnZOSMBeiP6AAP5Hm0xQEAy2L0z4LgJdi1
AiYqMjENzHEB0P/9n1uT/2tol6jqBA0=
=ZxTn
-----END PGP SIGNATURE-----

--owkl3cyhwgepanbj--
