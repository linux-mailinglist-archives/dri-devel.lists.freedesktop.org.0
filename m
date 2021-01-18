Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369F2FB43A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E76E847;
	Tue, 19 Jan 2021 08:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3216E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 14:06:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AC60DFA7;
 Mon, 18 Jan 2021 09:06:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 09:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dmerQ1XL+PK3020LTOPQ7yLj01y
 lK/W1h3zK1oST0oY=; b=U6fcskdzlF7weauyVxuY/n7cR6vF9C6OsABy+Gt5EUe
 lu04Bct6gByuaCYJaM+e9hUQv2PyguhsOhMRt7VELgJ2busUVaKBrBFOCnZySJfl
 QzOq0yJjtdRsTBLj+QYPUJQYu9WIiBmbBztbETWQIJPx91juFM2GuyqVIlHJCWPm
 r/4cczD21Cgfv6A8qH5PA5aTo9jqzJKQ4SQj1ng2b16h0O9y6aHvJsB2+uQdqkLT
 evtYHIR4eqpb5pt5JSgHf7UKTCRoVR4kmHUEFi7SNZnn8u64qPLnDTguZghWJBaT
 vr/UiK6rqNV87xGLrb+CNO0qQsddq5MAQYfeoUrMwyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dmerQ1
 XL+PK3020LTOPQ7yLj01ylK/W1h3zK1oST0oY=; b=pZCkjYqOv5ciTasjDKhUQG
 RHHN8e6/hDHaTSzMXms42RJ5frz/V7C9WVDewxsQ98GqdeEiAyEi9WPuqJnOMoxZ
 zz98yY4UJVVHCFFjL+3P/Igc+MkXrY5zxJzjyVFoidYB4sGXNjVvROOfiryVhh/C
 ugjRO+6FFs9WTzxbjdilkoisk3V5/ru6FUgfgTEs6PBsHVjTFhz7aQk4dy3z6aIr
 BBebRtmwTUnZ8g7F4Jjp++Wxpz7RdJqqAbyD5a8XdLSojdPsKEfu7TcuMkUCGqtH
 ihQMpq1SlJy4UexcNREqJraDwvS5e2sTxm3qA+yz6KgSgXv/8bdy15TOuLraoNsg
 ==
X-ME-Sender: <xms:45UFYGeMo3OdrW1mVTCdJA7BJXG9jJCCtj7W-X1KutPBwSS1ye3Y1A>
 <xme:45UFYANusTU9IhZfPPua_LnP_I8EdRks4o40y96YIrgGtS001RNcw0yPp4heAiQnb
 OV4K4dGBNsh0ZeIOcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduhedugeelgeegieetheekteegudfffeeuudfhuefhudeihfelheelheefhfeh
 leenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukf
 hppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:45UFYHjhhkHBEIqgvXIgq_Zz9InEwbzkrMCFQNlkzLD8M4GLwNV76Q>
 <xmx:45UFYD88g0SPNdSU-oUBZboyfSPjRVyEv4pQN4Wyx2zV4hIsZoWHZA>
 <xmx:45UFYCsFWXxWhR1LQ-Iu_2Si_m1auZtC_ZFlARrdHCCgNam2WDaxGQ>
 <xmx:5JUFYEUpca2uv-nCQ0bFv944sOCknYLl1ZUhl1JqCvsUr7HIeoNssA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2E010108005B;
 Mon, 18 Jan 2021 09:06:27 -0500 (EST)
Date: Mon, 18 Jan 2021 15:06:25 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Avoid ASoC error messages on startup
Message-ID: <20210118140625.khz76y5r7jt2dthb@gilmour>
References: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
 <ab03444f-feb2-fbab-97fc-a070ccbe06b4@i2se.com>
 <20210113091957.odclfwmeykrkyq7v@gilmour>
 <20210113114223.GB4641@sirena.org.uk>
 <20210115181437.uqlkrbapv6ydswuy@gilmour>
 <20210115183949.GH4384@sirena.org.uk>
 <03dc115b-2271-c7b2-289b-4710c97efb9a@i2se.com>
 <750e397a995502fe15aabe8d9ba1b944bfce1cb8.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <750e397a995502fe15aabe8d9ba1b944bfce1cb8.camel@suse.de>
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, David Airlie <airlied@linux.ie>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>
Content-Type: multipart/mixed; boundary="===============1291895436=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1291895436==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d4giul6a4vefefkl"
Content-Disposition: inline


--d4giul6a4vefefkl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 01:10:40PM +0100, Nicolas Saenz Julienne wrote:
> Hi Stefan, Maxime,
>=20
> On Mon, 2021-01-18 at 12:28 +0100, Stefan Wahren wrote:
> > Hi,
> >=20
> > Am 15.01.21 um 19:39 schrieb Mark Brown:
> > > On Fri, Jan 15, 2021 at 07:14:37PM +0100, Maxime Ripard wrote:
> > > > On Wed, Jan 13, 2021 at 11:42:23AM +0000, Mark Brown wrote:
> > > > > On Wed, Jan 13, 2021 at 10:19:57AM +0100, Maxime Ripard wrote:
> > > > > > I'd like to get Mark's opinion before merging though
> > > > > I'm not sure what the question is here?  I get CCed on a bunch of=
 not
> > > > > obviously relevant DRM patches so there's a good chance I've just
> > > > > deleted some relevnat discussion.
> > > > The patch is question is here:
> > > > https://lore.kernel.org/dri-devel/1609256210-19863-1-git-send-email=
-stefan.wahren@i2se.com/
> > > > In particular, I'm not so sure whether it's fine to return -EPROBE_=
DEFER
> > > > in the startup hook.
> > > I wouldn't expect that to do anything useful and IIRC that error code
> > > will end up in userspace which isn't good.  If the driver wants to de=
fer
> > > probe it should defer it from the probe() routine, after the driver h=
as
> > > been instantiated I'm not sure what the expectation would be.  In
> > > general a driver should acquire all resources it needs when probing.
> >=20
> > understand. Unfortunately, currently i don't have the time to
> > investigate how we can achieve this with this drm driver.
> >=20
> > Maybe some else can take over?
>=20
> My two cents: IIUC it's a tricky one since components don't have a way to
> express dependencies.

There's a way though :)

Components are bound in the order they've been added to the component
list, so as long as the component we have a dependency on is added
first, it's fine.

The issue here is that the HDMI devices are added first:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vc4/vc4_drv.=
c#L334

We could just move the HDMI driver after the CRTC one and we would solve
it. I'm not sure if it has any other side effects though.

> Somewhat similar to what happened with the DSI bus/display race.

DSI is a bit different, especially on vc4 since the panel driver doesn't
sit on the DSI bus in DT and as such isn't added by the bus code when
the controller is added.

Maxime

--d4giul6a4vefefkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAWV4QAKCRDj7w1vZxhR
xerJAQDhkyk6SZWBR3QZ7aT+G44rVdLuD9Ah07w3yJOcPoG+RQEAj01xSHND4Jzs
HZNTjmYvQVwGwbSOQGteKrm5N5vL+gs=
=Pe1I
-----END PGP SIGNATURE-----

--d4giul6a4vefefkl--

--===============1291895436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1291895436==--
