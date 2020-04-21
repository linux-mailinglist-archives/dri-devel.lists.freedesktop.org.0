Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7061B3824
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA3B6E97A;
	Wed, 22 Apr 2020 06:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF91A6E917
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 11:21:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BAF3D58033F;
 Tue, 21 Apr 2020 07:21:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 21 Apr 2020 07:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2qvNJ91IEb/AUiTXH8N0o6OegdF
 zI2xnwcLyFKBhmMg=; b=DNBSndQeBovAjuo60LXetRogX5AaJdhObX1sjwe4xcf
 CMMKX9QJTfF3+rlM36/XMBdZdLJXp1icf6pZtviVuNalueXOigbtH1QTRtnfsPtZ
 TVanzwcq2ykxH3BuowaZjElynooJjih7PGmbX1G9kYfeYGWuzIgsbBIHIYNi1+Y0
 qCjUhMSoau/3xr1yvYpU/Z3L+8mmxso/ek/ZXyer0tJEUcLEfZgonb2zrTShaDHs
 PhgJ9HkBexWIwEEfTZZ7g4BphUuRegIWwuSoCTIR8nTwkQAo/09Jg9+73e9ykzm0
 Qke4n693CDezgFuysXUZueqrhHDh2GQWkqp/d3k9GZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2qvNJ9
 1IEb/AUiTXH8N0o6OegdFzI2xnwcLyFKBhmMg=; b=IJl+L5/geetMjN0XJzV3I6
 UmgXvOceReTexMcUdkNPZUUBWhzKBS0xqgmTKNzYFV3pD7V2bA+mZ6jggj+yubnE
 OPexT32D4Ok+h2o3gryATORbu2W667LHIzIK+TkxYZxngRmnL8SOMVgNdWxei0pm
 ICzB6Cm855XL/C4a+Hg8S2GrgtuPyqwG5b84k/fCS2ulC1U3Vm6nEJ0r/9gqt8r7
 Ave1Zuu5XyKUaX/4y2mQmePO54LN9NEp8RBRclCmvuzWFMAiEkxl9DFYpE/cqKRW
 yZaOK/zOseCiM/zs7u7U9pOztzOVoIzVpVsrwjsDcbZat7fL88C1oYrN6GEykR/Q
 ==
X-ME-Sender: <xms:PNeeXnX3SmQG_u6OQi__5pBgi3j-koafOIeW1WBPVRoeu6KFqHqblg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeehgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PNeeXuEChcO2S-tZ7fJK0z9aQAzoj90uEOW7EOuqdXysmOZ60Ko7HQ>
 <xmx:PNeeXu6ewiM2DHh0QSD66uXdfHCHIQZfx3bLwEuShb8Ny4Dl5-0Dqg>
 <xmx:PNeeXscSi97OlRj2s-EX6uC6eUYe1bPw7EVnrbNk7R-Of5rCmeQ6GQ>
 <xmx:P9eeXuB6eG0fsJ1kExaStSp_hhHi7Bo7rTJCux1YR72gUeDHVqxesw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC25B328005D;
 Tue, 21 Apr 2020 07:21:31 -0400 (EDT)
Date: Tue, 21 Apr 2020 13:21:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Philipp Rossak <embed3d@gmail.com>
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, James Hogan <jhogan@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: multipart/mixed; boundary="===============0475543182=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0475543182==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bsmwn6lsujflbhcr"
Content-Disposition: inline


--bsmwn6lsujflbhcr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 21, 2020 at 11:57:33AM +0200, Philipp Rossak wrote:
> On 20.04.20 09:38, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Apr 17, 2020 at 02:09:06PM +0200, Philipp Rossak wrote:
> > > > > I'm a bit skeptical on that one since it doesn't even list the
> > > > > interrupts connected to the GPU that the binding mandates.
> > > >=20
> > > > I think he left it out for a future update.
> > > > But best he comments himself.
> > >=20
> > > I'm currently working on those bindings. They are now 90% done, but t=
hey are
> > > not finished till now. Currently there is some mainline support missi=
ng to
> > > add the full binding. The A83T and also the A31/A31s have a GPU Power=
 Off
> > > Gating Register in the R_PRCM module, that is not supported right now=
 in
> > > Mainline. The Register need to be written when the GPU is powered on =
and
> > > off.
> > >=20
> > > @Maxime: I totally agree on your point that a demo needs to be provid=
ed
> > > before the related DTS patches should be provided. That's the reason =
why I
> > > added the gpu placeholder patches.
> > > Do you have an idea how a driver for the R_PRCM stuff can look like? =
I'm not
> > > that experienced with the clock driver framework.
> >=20
> > It looks like a power-domain to me, so you'd rather plug that into the =
genpd
> > framework.
>=20
> I had a look on genpd and I'm not really sure if that fits.
>=20
> It is basically some bit that verify that the clocks should be enabled or
> disabled.

No, it can do much more than that. It's a framework to control the SoCs pow=
er
domains, so clocks might be a part of it, but most of the time it's going t=
o be
about powering up a particular device.

> I think this is better placed somewhere in the clocking framework.
> I see there more similarities to the gating stuff.
> Do you think it is suitable to implement it like the clock gating?

I'm really not sure what makes you think that this should be modelled as a
clock?

> > > The big question is right now how to proceed with the A83T and A31s p=
atches.
> > > I see there three options, which one do you prefer?:
> > >=20
> > > 1. Provide now placeholder patches and send new patches, if everythin=
g is
> > > clear and other things are mainlined
> > > 2. Provide now patches as complete as possible and provide later patc=
hes to
> > > complete them when the R_PRCM things are mainlined
> > > 3. Leave them out, till the related work is mainlined and the binding=
s are
> > > final.
> >=20
> > Like I said, the DT *has* to be backward-compatible, so for any DT patc=
h that
> > you are asking to be merged, you should be prepared to support it indef=
initely
> > and be able to run from it, and you won't be able to change the binding=
s later
> > on.
>=20
> I agree on your points. But is this also suitable to drivers that are
> currently off tree and might be merged in one or two years?

This is what we done for the Mali. The devicetree binding was first done fo=
r the
out-of-tree driver, and then lima/panfrost reused it.

The key thing here is to have enough confidence about how the hardware work=
s so
that you can accurately describe it.

Maxime

--bsmwn6lsujflbhcr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXp7XOQAKCRDj7w1vZxhR
xY2FAP98NEADiujPOYdZcBw58gJhiTHRG5M+7cY4QmY6LLWi6wEAmaVzzE9csrhP
gszgPuCUwSKxGaUpbu0VHqeb3LVqwQs=
=LITU
-----END PGP SIGNATURE-----

--bsmwn6lsujflbhcr--

--===============0475543182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0475543182==--
