Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F043A4A8734
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF58E10F069;
	Thu,  3 Feb 2022 15:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8E510EFD9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:06:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8802C5C008D;
 Thu,  3 Feb 2022 10:06:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 03 Feb 2022 10:06:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=5SuxOLrh5Yh31ff3obX6GQuiivYHKZ7RtF53G9
 v5M9Q=; b=hxFypttjFgjTVlSW/Z/RCeHExQ50XDu5Pn09v+egFB/mKUsqdxNKu1
 2nKQvRsPJP3C8F7h0rzZSImrsjUfH6ln6L/BpaqpfVxlpf4WLoopyKQQHDshDpl5
 ElsDtA6W+JVVPf14DYFEU/l2t2ME+pb6cHDIZJRk1dX373z2jLe4lBleTVdRVfhr
 po23LDRyhnqOe1DFQwToHibvTPf32g3lFTX3Q+H3NuukBVvEpwqGJsCOU/PxKiGS
 1uTSHcYBkcdhMyidAR6yf+Jl0SbbcFCKxou66dqh/GM+UTZwJNoME5wE0BaM0M28
 +R+bMQkBfwUXdOL21CE8/Ha4F8QNr4Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5SuxOLrh5Yh31ff3o
 bX6GQuiivYHKZ7RtF53G9v5M9Q=; b=DfTV/AIvZjPrkOqO578ea6XEnXDEeZXV5
 WB6kBm/huxuIS1NELS1d5NwaFBzBo3rpCScvWTA9rMd7AlkTeNObMd+uoCBNgPAP
 6NHckRNweR6d7aNKHRpISi1A4mwNoVBz9qoCcDD3WmC1vZiZJ5MRFQ9zeFM1W+NG
 41u4lNkHbVIl0T3Dc8JJG5gvJW9VNR/oYXYsHl3IAu5GHyBHojQJIzv4+CQ3RDLx
 ABY3U6VncmkKIZvc+80pHdWfV9zjPgKcvEC2DJEfDug9C0cfFCZGl69+7a8OsuCZ
 FNk4/YEUioRVEped6ESJRrXqP6+s7qEicdtkgLxvoheeoeN1ib1DQ==
X-ME-Sender: <xms:X-_7YVHSPsEurdWXs-Yiv95srrKF1BUq4_c6PIa5CKikJeXcTgeJrw>
 <xme:X-_7YaVuViE5MHg_7w5-bJWyUJJ-_BcXX8Kg3NJbn_oFB0Ksg7xzWjZGKJD0S1qu8
 FSosyKsOv0kn28nChM>
X-ME-Received: <xmr:X-_7YXKyseZPLsqoBHGjBHnzOYuVOUB6mGRpaK9Jt-zpAqwMSI99a2fMsoqH5AOBLbNYnKYhLpiUNtad1HTJwFC3xLJNfWCEzM9GBRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:X-_7YbHS9oHyb3-3pioGAovy26sSVap33YRzZNWNtNXiQagM1idJkQ>
 <xmx:X-_7YbV_0gwW5oFVj7KMnUoSusByiLkQz0vhPUDVrhH0HwfX3a93EQ>
 <xmx:X-_7YWOaH8ZVgyGMxsMMC4ae9NOdQ7WANBw0GtBklp7j4GGPSlPcuQ>
 <xmx:YO_7YdJtueb1n5xLLB7FHS2HYX0meShoA_SlkRXujOZAIp6auR-FdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 10:06:07 -0500 (EST)
Date: Thu, 3 Feb 2022 16:06:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
Message-ID: <20220203150605.pkdckq64hyoengqv@houat>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org>
 <20220127100452.bmxcgf6ye3nxrgtq@houat>
 <fff71d01-e1c9-2b0f-e4b2-9abb107f7770@tronnes.org>
 <20220202100953.pymb6blsqlaw7jv6@houat>
 <261c76d6-6bb9-1fe1-6560-58af5ba240dd@tronnes.org>
 <Yfq76Mx6O8x9sxZW@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bzedj5zql4sxamuh"
Content-Disposition: inline
In-Reply-To: <Yfq76Mx6O8x9sxZW@ravnborg.org>
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
 dave.stevenson@raspberrypi.com, robh+dt@kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bzedj5zql4sxamuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Wed, Feb 02, 2022 at 06:14:16PM +0100, Sam Ravnborg wrote:
> Hi Noralf,
>=20
> > >=20
> > > Parts of it is ergonomics I guess. We're used to having all those
> > > properties either in the DT or the driver, but here we introduce a new
> > > way that isn't done anywhere else.
> > >=20
> > > And I don't see any real downside to putting it in the DT? It's going=
 to
> > > be in an overlay, under the user's control anyway, right?
> > >=20
> >=20
> > Ok, I'll spin a new version using DT properties.
>=20
> I like this better than anything else as we then have everything in
> a single place when we add a new panel and more.
> I just recall some resistance to add such HW specific setup - but the
> usecase here is kinda special.

The main issue was to put the initialisation sequence in the device
tree. We solved that with by using a firmware instead. Given that the
timings, size and so on are already used by multiple, widely used,
panels, it should work just fine

Maxime

--bzedj5zql4sxamuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfvvXQAKCRDj7w1vZxhR
xTVoAQDD+O0ygdw9cNlnXjQL0eehtKz+EGtx8QpbIh/efgwmZwEAvDZypyNmcpMA
peqcvav82p5WxIBlAs21bR/oM4OyaAA=
=G0xz
-----END PGP SIGNATURE-----

--bzedj5zql4sxamuh--
