Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6ED1B6739
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5336EA53;
	Thu, 23 Apr 2020 22:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9616E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 20:36:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4725158030B;
 Thu, 23 Apr 2020 16:36:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Apr 2020 16:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Iubs+KISuHQ9VGeGg+cCp2xJSoU
 PuYVrphsLXiw5SFg=; b=Fn2d1x+/36iC3PGOTy5Cp2hHxpxTsbZXqEhCoWSU6fC
 Bh2uGjm8NzjGSIGOhUdI6jIFnaNlWlK/KNK0SO5YgDVKAzn9T8T4ClUJFkXWcI/L
 SrSHQwn+ywvkFIfMqeLT0tGOBnOJCf3GhECZDwsJXcOOkFJEZ5PO3Hg2TEHxt0Ji
 XXCiuCgBhfrNpF+Q4qgbmo0zisCBtKA1VkhzWKnI3UD+PuwtHOjrTI/5OtSrja0W
 0xNGXCJ8ebZmLgh5iBcj0TUAG6xzsfP58vDHg4dtrP2Je050KddpO2V/+DEw4INi
 HTrBFJ8cS/EHw4cjf9yqCM3mqKMdTGT34HW7z+GoIEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Iubs+K
 ISuHQ9VGeGg+cCp2xJSoUPuYVrphsLXiw5SFg=; b=X5O3GV4KFSkNBZXwi0gXe/
 Az/rwjNsPXRiOZeR/DIobQrkLfux9vKSBPW2Q7Wch/uG7VG9fPmUEU8Kyi30iPJx
 6rZFq866Z4AieJ/VQuUcLR0mV0pZLLxlv3ciLBDB/NhY/AvDjNVAvMjJxXjdCS6K
 u41z1fKpjs0erRbydhTf6J8lDzfZB7FSCFB8idsmUzAcZtLjWHuo6bbN3Dpzw+lv
 Xc1y1zz0vGYrNGmVPq0/4/8tCV+p/V1vxI12KqIjNELt9KhmHqpZLjuh1WSuMbeZ
 mWk/VcSn4C4MRsWk0RVAApy8MoL8ZK52EhiDYG9eBvoyLIChI6lqSRyqMDdlQG7g
 ==
X-ME-Sender: <xms:XfyhXtOzOOFFqaB2EmGtuUz4AXihlYYhfPH3NPly7o2BbKivw_911Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeelgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XfyhXkMYXTgP_dAi3mHrR2OLJMQgltfV-ZrcUbSZbYi-eyL9XqlWvQ>
 <xmx:XfyhXnRz3tzFqWtdmt2KW_Iy-oRzKWX5FUFdLIFvNbNly0q4eowTmw>
 <xmx:XfyhXuBpYPyCR1QitUY5OuM1TQtkKBdD8mz-YseHbvORsD3x-nC7Qg>
 <xmx:YfyhXklTjVJsrJRboZpeYnKPAGn0Xr4Sox5XlaeG8MS2WPQdNjQpdg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD893328005E;
 Thu, 23 Apr 2020 16:36:44 -0400 (EDT)
Date: Thu, 23 Apr 2020 22:36:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200423203642.35ms4aarnv65tfp5@gilmour.lan>
References: <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
 <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
 <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com>
 <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
 <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com>
 <43688597-4b99-8f4d-9ad5-548ddff07f52@baylibre.com>
 <71F2F964-32C7-41E6-8F1A-A73161EA1BB3@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <71F2F964-32C7-41E6-8F1A-A73161EA1BB3@goldelico.com>
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, linux-samsung-soc@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Type: multipart/mixed; boundary="===============0196083609=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0196083609==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="goo77pyirkr5psgn"
Content-Disposition: inline


--goo77pyirkr5psgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 05:45:55PM +0200, H. Nikolaus Schaller wrote:
> > Am 23.04.2020 um 17:00 schrieb Neil Armstrong <narmstrong@baylibre.com>:
> >> One thing we can learn is that "core" seems to be a de facto standard=
=20
> >> for the core clock-name. An alternative "gpu" is used by nvidia,gk20a.=
txt.
> >=20
> > Usually IPs needs a few clocks:
> > - pclk or apb or reg: the clock clocking the "slave" bus to serve the r=
egisters
> > - axi or bus or ahb: the bus clocking the the "master" bus to get data =
=66rom system memory
> > - core: the actual clock feeding the GPU logic
>=20
> And the sgx544 seems to have two such clocks.
>=20
> > Sometimes you have a single clock for slave and master bus.
> >=20
> > But you can also have separate clocks for shader cores, .. this depends=
 on the IP and it's architecture.
> > The IP can also have memories with separate clocks, etc...
>=20
> Indeed.
>=20
> > But all these clocks can be source by an unique clock on a SoC, but dif=
ferent on another
> > SoC, this is why it's important to list them all, even optional.
> >=20
> > You'll certainly have at least a reset signal, and a power domain, thes=
e should exist and be optional.
>=20
> Well, they exist only as hints in block diagrams of some SoC data
> sheets (so we do not know if they represent the imagination
> definitions) and the current driver code doesn't make use of it. Still
> the gpu core works.
>=20
> So I do not see any urgent need to add a complete list to the bindings
> now.
>=20
> Unless some special SoC integration makes use of them. Then it is IMHO
> easier to extend the bindings by a follow-up patch than now thinking
> about all potential options and bloating the bindings with things we
> (the open source community) doesn't and can't know.
>=20
> My goal is to keep the bindings as minimalistic as possible. And reset
> lines and power domains are (at least for those we have in the works)
> not needed to make working systems.
>=20
> Therefore, for clocks I also would start with a minimalistic approach
> for a single optional GPU core clock and leave out reset and power
> completely.

Like I said above, the DT is considered an ABI and you'll have to
maintain backward compatibility (ie, newer kernel running with older
DT). Therefore, you won't be able to require a new clock, reset or
power-domain later on for example.

I guess the question I'm really asking is: since you don't really know
how the hardware is integrated at the moment, why should we have that
discussion *now*. It's really not suprising that you don't know yet, so
I'm not sure why we need to rush in the bindings.

Maxime

--goo77pyirkr5psgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqH8WgAKCRDj7w1vZxhR
xevnAQDosUT6nmUX0+zNQOj7IKsbVGpyycJhdLX1FoaJiEMTHgD/SWTr0aPp/w2C
TCfnfiPupaeG8u9JV8QMCk/a58o6Xw8=
=ygqv
-----END PGP SIGNATURE-----

--goo77pyirkr5psgn--

--===============0196083609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0196083609==--
