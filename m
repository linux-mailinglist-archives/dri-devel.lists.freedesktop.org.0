Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039334BD86A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6FF112611;
	Mon, 21 Feb 2022 09:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE761126F0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:05:31 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4ACBD5C0230;
 Mon, 21 Feb 2022 04:05:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 04:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=7xyoypuqqRg03OPI0Bu8KGab+bG2HsC1cotBN8
 O1/ZY=; b=vkpUGC9LkwQ5RIEJqkI9IOn6ZPk7qWbSfa7Y5OCDtWff1+dAEYZQ6A
 pcmzPRDEIOx/8pXfbc1ViqcfABgwX4UV8meoa2S42n67B+AeY6ua1jxonlzKb3yM
 bsiHfB8Ea3dhdHivYPjiVkq3o4aJ0o8Q9SvM3DdFi2Au1nBrStqO89YiGbusG+on
 Z7U5q1SkG0VS4oS1/c8pEF3yNYctk0vRUE2G7EmqxGyTVEma1tuRKhZersvow7Wv
 sOcVY5HCYGszI0b5N2JYNuiehgkih8E75lTEE7ykfSSwDGj3GeM0uIFPNiqlMU3p
 uQ6DSK10udc+ge36gznJ8jpyDqR6fWog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7xyoypuqqRg03OPI0
 Bu8KGab+bG2HsC1cotBN8O1/ZY=; b=gyyicsNxlT2kJ4Raikse+b1AGSh+Vgi+f
 2v3iw0MMoh99/8nutmxiFL61EwH8ZtcAfUvANhp/2utBb/ui0yN/EE+4zWWLNTGL
 MTcNIafi3iiGqnNgptD7GL5rLvil95i2UuaI85b6w5O7RT3NWfTRnrm5F/u6/9hT
 awZpyRsnXNGHMi1m2UnGCbtKgYKruAea8LfLMMQjP6T7bO268eEnrN6zxynpw7V9
 P7//KLKmI5fgXFd1HdUJIHH66dZk6gUGBifLgWPvb06QGGn7K01RraZVYkVh282U
 z93d1CIwl9Q05WSEF2NvHuCbAaQWxqyxCUMBNmHaSQUYc0SuhKjAw==
X-ME-Sender: <xms:2lUTYvn7UJps3dgRG1SLKWLiNcbIFApyWRYHGcnX9D6FXM3Hm8w9Hg>
 <xme:2lUTYi0bX_ZC-EMBgy-rSwFSgAF30fwcC6CdX8YxyMG140xznvYVRgR5iID-ciGrj
 jG_N085GDu455owKJw>
X-ME-Received: <xmr:2lUTYlpYxWMYX1ET8LKx9uWE3Hmdr24Pte8UlwYVurAZqhvJrKFDtVZTPVmGDhAe_d-SohZKV9uMwmbRGdmyunr2XwfJ2mYkL-8tHig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeehgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeuieelleeivedvhfdvjeetledvtefhleejjeeiueejjeeileevudeftddv
 ledtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:2lUTYnnmQoxuBo4Cru0x4SOUCDLBKdyblz5Mpqe7PaRXBVdO1EuSLA>
 <xmx:2lUTYt2bXHXG7jfm1Zk38ioxyJhpVUGU2MTdk_kzcxjBXvP8UceT5w>
 <xmx:2lUTYmuHGQPkA9N55tfD9SOMlz7uIJX3tpWlAdYjcik4bUbH60lrbA>
 <xmx:21UTYnpRyQj9wRBxJl8henkTEdBlbUcIv8yHiHps3iwzLI0ozaQ-ZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:05:30 -0500 (EST)
Date: Mon, 21 Feb 2022 10:05:29 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 3/3] drm/tiny: Add MIPI DBI compatible SPI driver
Message-ID: <20220221090529.s2bxjli4dsp43l4e@houat>
References: <20220218151110.11316-1-noralf@tronnes.org>
 <20220218151110.11316-4-noralf@tronnes.org>
 <YhFqxklH9hsLrI1X@ravnborg.org>
 <08d29bb6-8b44-8355-b9dc-a96b2e20cc20@tronnes.org>
 <YhKzaU2vz17y+j4s@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zmp4tyxe2eanrjli"
Content-Disposition: inline
In-Reply-To: <YhKzaU2vz17y+j4s@ravnborg.org>
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


--zmp4tyxe2eanrjli
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 20, 2022 at 10:32:25PM +0100, Sam Ravnborg wrote:
> Hi Noralf,
>=20
> On Sun, Feb 20, 2022 at 04:59:34PM +0100, Noralf Tr=F8nnes wrote:
> >=20
> >=20
> > Den 19.02.2022 23.10, skrev Sam Ravnborg:
> > > Hi Noralf,
> > > On Fri, Feb 18, 2022 at 04:11:10PM +0100, Noralf Tr=F8nnes wrote:
> > >> Add a driver that will work with most MIPI DBI compatible SPI panels.
> > >> This avoids adding a driver for every new MIPI DBI compatible contro=
ller
> > >> that is to be used by Linux. The 'compatible' Device Tree property w=
ith
> > >> a '.bin' suffix will be used to load a firmware file that contains t=
he
> > >> controller configuration.
> > > A solution where we have the command sequences as part of the DT-over=
lay
> > > is IMO a much better way to solve this:
> > > - The users needs to deal only with a single file, so there is less t=
hat
> > >   goes wrong
> > > - The user need not reading special instructions how to handle a .bin
> > >   file, if the overlay is present everything is fine
> > > - The file that contains the command sequences can be properly annota=
ted
> > >   with comments
> > > - The people that creates the command sequences has no need for a spe=
cial
> > >   script to create the file for a display - this is all readable asci=
i.
> > > - Using a DT-overlay the parsing of the DT-overlay can be done by
> > >   well-tested functions, no need to invent something new to parse the
> > >   file
> > >=20
> > >=20
> > > The idea with a common mipi DBI SPI driver is super, it is the detail
> > > with the .bin file that I am against.
> > >=20
> >=20
> > The fbtft drivers has an init=3D DT property that contains the command
> > sequence. Example for the MZ61581 display:
> >=20
> > 				init =3D <0x10000b0 00
> > 					0x1000011
> > 					0x20000ff
> > 					0x10000b3 0x02 0x00 0x00 0x00
> > 					0x10000c0 0x13 0x3b 0x00 0x02 0x00 0x01 0x00 0x43
> > 					0x10000c1 0x08 0x16 0x08 0x08
> > 					0x10000c4 0x11 0x07 0x03 0x03
> > 					0x10000c6 0x00
> > 					0x10000c8 0x03 0x03 0x13 0x5c 0x03 0x07 0x14 0x08 0x00 0x21 0x08
> > 0x14 0x07 0x53 0x0c 0x13 0x03 0x03 0x21 0x00
> > 					0x1000035 0x00
> > 					0x1000036 0xa0
> > 					0x100003a 0x55
> > 					0x1000044 0x00 0x01
> > 					0x10000d0 0x07 0x07 0x1d 0x03
> > 					0x10000d1 0x03 0x30 0x10
> > 					0x10000d2 0x03 0x14 0x04
> > 					0x1000029
> > 					0x100002c>;
> >=20
> > Parsed here:
> > https://elixir.bootlin.com/linux/latest/C/ident/fbtft_init_display_from=
_property
> >=20
> > Before fbdev was closed for new drivers I looked at fixing up fbtft for
> > proper inclusion and asked on the Device Tree mailinglist about the init
> > property and how to handle the controller configuration generically.
> > I was politely told that this should be done in the driver, so when I
> > made my first DRM driver I made a driver specifically for a panel
> > (mi0283qt.c).
> >=20
> > Later I found another post that in clear words stated that setting
> > random registers from DT was not acceptable.
>
> Understood and thanks for the explanation.
> It is a shame that the users loose here :-(

=46rom a user point-of-view, nothing prevents the overlays and the
firmware to be in the same package, provided by whatever distro or
build-system they would use.

The only case where it's a bit less efficient is for a panel that isn't
supported already, but it's just a documentation and tooling issue, and
Noralf has an awesome track record for both.

And the DT syntax throw so much people off that I'm not sure it's such a
benefit :)

Maxime

--zmp4tyxe2eanrjli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhNV2QAKCRDj7w1vZxhR
xU6KAQC//hdezKafTZL2B1JdH8/R+dGme8guAu3EmMvNuKJ7gAD/Rvi9EL+5cBtN
czxrmAUMXSfj5k4zrcrUL6QtqCJW5gE=
=oFW2
-----END PGP SIGNATURE-----

--zmp4tyxe2eanrjli--
