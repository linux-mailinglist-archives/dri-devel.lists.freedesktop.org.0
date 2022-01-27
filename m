Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2B49DE28
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA71D10E61B;
	Thu, 27 Jan 2022 09:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBE710E61B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 09:36:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BFCE15C0135;
 Thu, 27 Jan 2022 04:36:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Jan 2022 04:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=WA1psq6av3hb8CPQl+q6JR0R81+NLrXh6/dARD
 GQBMI=; b=owi4N6M20BirIVtp0UbfhSC75hSNeZj7CZ5dKBmyciE3+kFlsIN3ij
 LM9i1OFq+wrwIaP+jJqLgTaluZhjBDViaFHN536jfbN97ovmiEovSKi4iwjPhi5e
 68UBSnb+cC1+5YN6IQGezYqmR2koVKzlYDiYsj0bbKAU8lB0vEd4PB7tsWkwLKgN
 fhuyRUvpopOTsO3BB5wouZdlTz+gr+2vxdvvkRI+XRHi3DYoI4O/+evIEkYPe93P
 HQ4jnnDEEUCMzseu+YGvB3tRWRNxgSn++XjPh5hZaI11ck+M1v9+feNVbwmzyLzz
 LfDPZ+52qq8tjLLrMMF+yNUtJJybb24w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WA1psq6av3hb8CPQl
 +q6JR0R81+NLrXh6/dARDGQBMI=; b=LCBoMUXhBCT4xL1aYFnrGHHoYEMAlEee0
 vkvZsJWSOLgFuIpm6EBq1+CGXEN1LpcnEB9cu6aWCzGQu/Y+ceGesYVTOSGhgHsr
 5F93rGO1lMUlItni+TOzA3G1Gd0k/pc/yV31gWTb07tfz6VCO4FApRZ+M02Il4j/
 KYrH86H5pOztPDpXbO0Is4wfz5b9zdoYgMPNxe5imwDMocYO8Gm54CbE5GxFpR6p
 Cs70awsUUxK97vRGzrtPKVSPBvpLlLmpeb2Fql12Mk8uYgEJZ/DmrAP8qIJK8NY+
 Bvxebf8jXBE3rx4EGIHxNHJRAXBA1BhMdeCvkMYrBSQigMNMR981Q==
X-ME-Sender: <xms:mmfyYfHr67546aldKWcd0D8lxVJmu7jwoF0yWAbywABQMfLp6sukTw>
 <xme:mmfyYcUXkAgi0WF_Z-wo1IxzX8kUbnHJ-uecPpXxags8d8Uurtae0QOt7W1qGzrwR
 78RSMf95aSqSpkeBwo>
X-ME-Received: <xmr:mmfyYRJ1sdHJzh5b5HF3UZ9CQaUgcWugV0ZWV4EzikbhnbV3jShHK9RgyZ2Z_LE2RpGnp1ct61_j_ZzVKyuM-n_iVQMzAPKicpMyWE4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejkeekffdtfffhhfevvddutefgtdeljeevffevvddvteegledtgfeghfehvdei
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mmfyYdFwOIWwt49Im8GCzOtTEsMudGYDIqOizR9BywmuTh9ak2rxXQ>
 <xmx:mmfyYVWTU-kPWDtt3j-AEv7m_WWpXaTw-Cnv4a1T3HJY9eP2savUIA>
 <xmx:mmfyYYO1NniYXG14fvkj5ug2hCLKnjB3sI6K_10fDXWYWP2Rksx6HA>
 <xmx:mmfyYXIvYEYZnboitBP_Z6hkbH5Z4_eb73qlCSOSJeXsGya9R3bcAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 04:36:26 -0500 (EST)
Date: Thu, 27 Jan 2022 10:36:24 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Message-ID: <20220127093624.6gozbr6gl4ft66fz@houat>
References: <20220123172520.48741-1-noralf@tronnes.org>
 <20220123172520.48741-2-noralf@tronnes.org>
 <CAL_JsqJU_WFeJDt5jqLN9BQN2j_TCf3+0hKvbNSYwmg-2DSF=Q@mail.gmail.com>
 <931fab73-3a91-fda0-4af3-b48a1ad3c742@tronnes.org>
 <CAL_JsqLiw42zfaRPmszs2bmGbAcL5STSTVUtP0PyWnm=CaG8ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g3d2usy72o624st2"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLiw42zfaRPmszs2bmGbAcL5STSTVUtP0PyWnm=CaG8ug@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--g3d2usy72o624st2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Jan 24, 2022 at 10:42:37AM -0600, Rob Herring wrote:
> On Mon, Jan 24, 2022 at 10:28 AM Noralf Tr=F8nnes <noralf@tronnes.org> wr=
ote:
> >
> >
> >
> > Den 24.01.2022 17.08, skrev Rob Herring:
> > > On Sun, Jan 23, 2022 at 11:25 AM Noralf Tr=F8nnes <noralf@tronnes.org=
> wrote:
> > >>
> > >> Add binding for MIPI DBI compatible SPI panels.
> > >
> > > I'm sure we already have MIPI DBI panels. What's this for?
> > >
> >
> > It aims to use one driver to cover all MIPI DBI panels where the
> > controller setup is loaded from userspace in a firmware file.
>=20
> What's the solution when the user wants a splash screen in the
> bootloader and also wants multiple panels supported?
>=20
> Also, 1 driver doesn't dictate 1 compatible. A one to many
> relationship is fine and makes the decision entirely the OS's.
>=20
> > The cover
> > letter points to the discussion where Maxime proposed this:
> >
> > https://lore.kernel.org/dri-devel/20211129093946.xhp22mvdut3m67sc@houat/
>=20
> The proposal there is:
>=20
> > compatible =3D "panel-spi";
> > model =3D "panel-from-random-place-42";
>=20
> The same thing can be accomplished with this:
>=20
> compatible =3D "panel-from-random-place-42", "panel-spi";
>=20
> What's the advantage of hijacking 'model'?

So, the main issue is that a panel is essentially two things: a
controller and the actual panel.

The controller has an initialization sequence of its own, and part of it
is parameters to match the panel.

So you can have identical controllers that won't have the same
initialization sequence because they don't have the same panel.

I was assuming that a compatible would be more about the controller, so
we needed something else, thus "model"

Maxime

--g3d2usy72o624st2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfJnmAAKCRDj7w1vZxhR
xcsTAP9/qENaW6RTVPJRf9nDXmouAAgilNGFGvNurPNgkK2Z5gEA3T1Wy4CPOm+V
Y3A3EtaJ75EIrXoMlF4PFQRNg9UMHAw=
=J/lt
-----END PGP SIGNATURE-----

--g3d2usy72o624st2--
