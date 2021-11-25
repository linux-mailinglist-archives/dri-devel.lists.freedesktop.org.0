Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B345DC21
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 15:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65596E4E3;
	Thu, 25 Nov 2021 14:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341F56E4E3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 14:15:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B0E1F3201A17;
 Thu, 25 Nov 2021 09:15:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 25 Nov 2021 09:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=1bqkC8/u8upZp5cpgt6rGNqrfgj
 od8S+Z8qXsVjJBGQ=; b=W+ErM4l65qzbNC1EHEKSytGo7ze0yBfFB7Kro0MRIA2
 4cJEVceI4ZA4M4Sc2kuDAdHseY0Wfmig5csG4ZMftstoun6zV4VgwU9TJHY3rcok
 AiPNSqVkejpGpjvP3hpt9ZU4f/JB5fcfBwmPUZ5wkP94FcMWyxrIVY+Sv6cJRLQ8
 RJKjea/Sg1N+lQhvaOEI1vEwAbPyHA+9zJ1mdWkSpqlAZV/mc9KM6gjqPpDx0bE4
 I/O/sdqFxj5cTXJGFLbuwaPXE1L3yQNW8vJ2i4/k0XfBBRxJz3Uj8mlMOS9DVVSB
 BrV836g7+th9wtyNAYOzbPkROPe8iAGQ3LPSJV4JOuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1bqkC8
 /u8upZp5cpgt6rGNqrfgjod8S+Z8qXsVjJBGQ=; b=DM7cp/WEfBhSVhH55cYNnw
 TixX0tDF50qhL7qQxHn6OXggxseLkQsU0QoTHWiIdsjXPkzPMeGclwOwUb7Kv89W
 eHKsaDgThQImYqp+1M5sNCscixso9h3OFnwqcj4VBH7NpGvhsBiMhgW1wekPWA+V
 yPm0WZNVmFVlG/4nl8X4wDadyQYBX2tCSmmQexgOd+trGbbc9y18/8VxYY5Ajg0w
 jN/yMpfplhoX8k0qHKlTzEKWvKUnV+l1T687IrxFhBvn55AeTEw0ScVh6p/BN6xc
 mMGxtiWdXVtYK7LschXP4RCI8p8NKkaokjBwK6OghQJ6ncx/XzbENKHxpGVbG/+w
 ==
X-ME-Sender: <xms:d5qfYbv4grS7ENxXc8LSRgL5ENglcoN_Y54uqCnvp57Ziug0Pc2s5g>
 <xme:d5qfYccFlkXJ6ldLTAhIQ9khiareG-i-OQfZgQ3Jnpiu2E6UTfvSpUO2yTA8EMe1c
 _FDTPuDpQ4YdMAWsS8>
X-ME-Received: <xmr:d5qfYeyX5UaWJxRr0yRSNsuLxy-OyYz96vurbmzSrgDAD8hII8L3J_zTV0yYlsLba0kSA-urCZzSOItOn4FnPqstrUZoSiBnMGk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedtgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:d5qfYaMjs3AqfYx4lvuE7XbqcHmj3a0pGwJUQoOoP2OrB7i4cEv36Q>
 <xmx:d5qfYb9i0l5Ij4jKsa1fs3e2QLrQmTLtMfwi_pvmDNXtMoo8fevFsA>
 <xmx:d5qfYaVBRo-uVSuevzP1GjJXMc5d2MorPXlJZmHyQgdYyTOyetNqFQ>
 <xmx:eZqfYXRTGlrosFOUSTSp2yueXypAx2faGgiVpwzDq2QvZoFBLnyQCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 09:15:18 -0500 (EST)
Date: Thu, 25 Nov 2021 15:15:16 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
Message-ID: <20211125141516.oymscgs3xcjqmgce@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
 <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
 <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
 <CAMty3ZBizr0uw6VrKBQ9AEYe48_QJKb0QC=pGEcA3OGK_CfQkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6smyeew6pbusr3fy"
Content-Disposition: inline
In-Reply-To: <CAMty3ZBizr0uw6VrKBQ9AEYe48_QJKb0QC=pGEcA3OGK_CfQkw@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6smyeew6pbusr3fy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 12:02:47AM +0530, Jagan Teki wrote:
> > > > > > +     dsi->panel =3D of_drm_find_panel(remote);
> > > > > > +     if (IS_ERR(dsi->panel)) {
> > > > > > +             dsi->panel =3D NULL;
> > > > > > +
> > > > > > +             dsi->next_bridge =3D of_drm_find_bridge(remote);
> > > > > > +             if (IS_ERR(dsi->next_bridge)) {
> > > > > > +                     dev_err(dsi->dev, "failed to find bridge\=
n");
> > > > > > +                     return PTR_ERR(dsi->next_bridge);
> > > > > > +             }
> > > > > > +     } else {
> > > > > > +             dsi->next_bridge =3D NULL;
> > > > > > +     }
> > > > > > +
> > > > > > +     of_node_put(remote);
> > > > >
> > > > > Using devm_drm_of_get_bridge would greatly simplify the driver
> > > >
> > > > I'm aware of this and this would break the existing sunxi dsi bindi=
ng,
> > > > we are not using ports based pipeline in dsi node. Of-course you ha=
ve
> > > > pointed the same before, please check below
> > > > https://patchwork.kernel.org/project/dri-devel/patch/20210322140152=
=2E101709-2-jagan@amarulasolutions.com/
> > >
> > > Then drm_of_find_panel_or_bridge needs to be adjusted to handle the D=
SI
> > > bindings and look for a panel or bridge not only through the OF graph,
> > > but also on the child nodes
> >
> > Okay. I need to check this.
>=20
> devm_drm_of_get_bridge is not working with legacy binding like the one
> used in sun6i dsi

There's nothing legacy about it.

> https://patchwork.kernel.org/project/dri-devel/patch/20211122065223.88059=
-6-jagan@amarulasolutions.com/
>=20
> dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, =
0, 0);
> if (IS_ERR(dsi->next_bridge))
>            return PTR_ERR(dsi->next_bridge);
>=20
> It is only working if we have ports on the pipeline, something like this
> https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.12614=
6-8-jagan@amarulasolutions.com/
>=20
> Please have a look and let me know if I miss anything?

Yes, you're missing the answer you quoted earlier:

> > > Then drm_of_find_panel_or_bridge needs to be adjusted to handle the D=
SI
> > > bindings and look for a panel or bridge not only through the OF graph,
> > > but also on the child nodes

Maxime

--6smyeew6pbusr3fy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZ+adAAKCRDj7w1vZxhR
xexJAQCJm5Ec5ViUoV/nSK/egM4QxFA+5f25aDtP8QywVffgZwD/Vdan4K7IFhYc
SwA3NE7AuNs+SkYQ/JI/OVRHL8kaIQY=
=lNtS
-----END PGP SIGNATURE-----

--6smyeew6pbusr3fy--
