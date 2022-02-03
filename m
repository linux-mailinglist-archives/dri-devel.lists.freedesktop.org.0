Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F14A83C4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 13:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B4810E872;
	Thu,  3 Feb 2022 12:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13B210E872
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 12:24:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A89F5C0243;
 Thu,  3 Feb 2022 07:24:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 03 Feb 2022 07:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=oQyYzuxfRo1lv3aZziCYCKmjnEZTyFbwm+bQ26
 UfYtU=; b=LLfL9y2buVmXgx2XXH+Yz9EiosRWdsOr21JtzlBTngiTHrCK8il/mx
 rduycpSuElYt/8h+VbRFOuAnHzKugnJXZPwCWDNTvNTVClvkb2eos6mlWBEXK95Q
 QOJhLTHZu2xXcFRKPTbrxsxBiIU6KtPwDpsXEgJNNdQSVQP2uHk/FvSSIU5dhOZs
 0j5pBsU8FY3yJzPWZkn3T1zvZmkG2nBU39jtMV6E+99FQK+VUe3s/gxWg4llcIKe
 6bMN0f+gKvGcLNjsOIlyl0KrqACcjaJitwAb7k5CYrz27biEJ5gaxTTiyPIhnDs/
 eRoi3YXAa4biAlGiPHlo3NozH7NTXziQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oQyYzuxfRo1lv3aZz
 iCYCKmjnEZTyFbwm+bQ26UfYtU=; b=cxxWAuNfLbOG8+X/VOw6i+m6sCU/20TLO
 UxTPd0M738bZ2Y8arVS3x4uV/LJWziwphbr5kps3gEOaHftrK7ynaTbcCYqK/3m/
 XZpFzmCPSQnz/bKUU/MH9twk6FFN7rKNQrPF5IeJ7qsF0EXRPedP1iRSkOiHcv4B
 B3NmgJ0hRySbOsUetcjPQbmi5cDC4VfKylIN4dfAtud3ONC245yGwHJmdsXeIi0a
 JAXWenEr57Mnr+QR0xPZC4MZ+XVdhnsx8wXWGKr8IlVp32klOOE0l4w1A1TeQMn6
 sUfDnc8Ti1DMdlkftGDHiz4FjJu5fcUfRyrvJJ5tgQY1hFf5VreuQ==
X-ME-Sender: <xms:Ycn7YcRFW_fmww8_XNIRnBSLSiXDi0e8zvKzCBiXvGfmREvwdjbnzA>
 <xme:Ycn7YZzoMOMPPSDVhOAEbCQpARSQOVL7HsZq8a-eicvdFyW7s9cGraDfyLviIUf4R
 iBQgI4cEcjEslKxkZk>
X-ME-Received: <xmr:Ycn7YZ2K_1sQHNFxq_FiEQZ28B618gkfH77CzsB9qq6CFZoO-ds_5pXu-NI-QiRNwGRurTZWkfhxIke_-bIcP_vAa0JlmSbWcGJNLCU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ycn7YQB_9vVks4eaZtNBJb1gz0Fec2rBdvPwZkNUQhTonWUyLJe7lg>
 <xmx:Ycn7YVjXUYAmwpoCzdL2cHVws2jhm1NrhvR-sK5YhBWuXG7Zv74QAw>
 <xmx:Ycn7YcpcWIA7LM9UwDVRMVlcuIc5wnrYqZPesi9zMq6Y2zdDqmnnKQ>
 <xmx:Y8n7YWVUykFkYdX9DedhGurqZPmj4hk2QXyXP-P6QxPhvzuK4bU4ug>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 07:24:01 -0500 (EST)
Date: Thu, 3 Feb 2022 13:23:59 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tc358867: Document DPI
 output support
Message-ID: <20220203122359.g3rvyzxcz5szkis2@houat>
References: <20211127032405.283435-1-marex@denx.de>
 <Ya+PRMvq3cjJ46s/@pendragon.ideasonboard.com>
 <1a7967f0-ed4b-9cd2-28c8-eb9d181448ae@denx.de>
 <Ya+T7zPigqtBzdR+@pendragon.ideasonboard.com>
 <df2e18b3-d35a-2079-5f7b-b2574cbb46fd@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xwemckzdmww4pmcb"
Content-Disposition: inline
In-Reply-To: <df2e18b3-d35a-2079-5f7b-b2574cbb46fd@denx.de>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xwemckzdmww4pmcb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 06:32:38PM +0100, Marek Vasut wrote:
> On 12/7/21 18:03, Laurent Pinchart wrote:
> > On Tue, Dec 07, 2021 at 05:47:29PM +0100, Marek Vasut wrote:
> > > On 12/7/21 17:43, Laurent Pinchart wrote:
> > >=20
> > > [...]
> > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/tos=
hiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshi=
ba,tc358767.yaml
> > > > > index f1541cc05297..5cfda6f2ba69 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc=
358767.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc=
358767.yaml
> > > > > @@ -61,8 +61,8 @@ properties:
> > > > >          port@1:
> > > > >            $ref: /schemas/graph.yaml#/properties/port
> > > > >            description: |
> > > > > -            DPI input port. The remote endpoint phandle should b=
e a
> > > > > -            reference to a valid DPI output endpoint node
> > > > > +            DPI input/output port. The remote endpoint phandle s=
hould be a
> > > > > +            reference to a valid DPI output or input endpoint no=
de.
> > > >=20
> > > > I assume the mode of operation (input or output) will be fixed for a
> > > > given hardware design. Isn't this something that should be recorded=
 in
> > > > DT ? It would simplify configuration of the device in the driver.
> > >=20
> > > Currently the configuration (DSI-to-DPI / DPI-to-eDP) is inferred from
> > > the presence of DPI panel. If DPI panel present, DSI-to-DPI, else,
> > > DPI-to-eDP.
> >=20
> > I've had a look at the driver side, and it seems to complicate things
> > quite a bit. It seems that specifying the mode of operation explicitly
> > in DT could make software implementations quite a bit simpler.
>=20
> Do you have any specific suggestion ? I explored multiple options while
> writing that DSI-to-DPI driver code, this one was the simplest and least
> redundant one.

Can we leverage the bus-type property of endpoints?

Maxime

--xwemckzdmww4pmcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfvJXwAKCRDj7w1vZxhR
xR0xAP9cvS1rL5CYslvpYO/TPI9PxFzkq+8yxBU310IlpwF4kgD8D5zRy7IBsyeW
Yhdlq+QNhzdxaKgLYC6KBJ62ucEaBgw=
=HxOl
-----END PGP SIGNATURE-----

--xwemckzdmww4pmcb--
