Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE75B99BD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 13:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0127410E1AC;
	Thu, 15 Sep 2022 11:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8040E10E1AC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 11:38:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C53BC320093A;
 Thu, 15 Sep 2022 07:38:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 15 Sep 2022 07:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663241883; x=1663328283; bh=8vGl18zUEz
 /iIgj+M69ANQDlvR4SWi2QgpZ/g//S4YU=; b=ITqNmb5WtI6yg1dqxM3kcqS0YA
 /T7Vs+LjCviej2KhTws2y6EFNvCWBsM/UAZRboUh63Jj9xq/vBy26zu/dwWhHz63
 k99DG7HGYjSFY2UBVphgOAYTsLrt1fZLcJYgzkekKJ3nom4I2frCVsr32wzobtRQ
 441QXRkyaCx2kogarxH7vW9foqDEm20Dir33qujn2DnOyygicNqQsLjhna/yJiwV
 U54s/lyKEuUysIpXC0m5CLBq3GSX1I+D/VlV39EzelZWJS2jYSIn3MpJtOs+F6rr
 AthqPrXrbW48pcIqy9wsUNybuNjTio4MQOe5nTbZV/Mj3HO/wKn7y/Zodh8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663241883; x=1663328283; bh=8vGl18zUEz/iIgj+M69ANQDlvR4S
 Wi2QgpZ/g//S4YU=; b=OxZDnry1n6jlK5gZmTYmCYmLKCOIuiBn3PxuQyx22ZJr
 HqTLRCK6V6qnR2Y8qF7rx8bcM/pQE/4YNIPKwcdkP+ZogxCtvDVs8Aj5PjX5id1g
 r84IFh3AQi4NP7DogMobQzZKExhs6Q2QRUVyVsgOf6y8ldf3c7b7XcfHQo9PmaL/
 KVL6NEHlEWmksAHrThcAEd2PKjGnX4w9auQPnimJ+6JjfrNYGT7ML3D1nm8NjGBj
 V9lc5x6aiWiZpXq/EzInIiOUauReHVt5AYa9FYKg7nwlgti3RiMM9+OX3CoTbntG
 9HW7eHY3EX+MaD/REkl0dA1AW0dGrKJu6RV/Jg06Iw==
X-ME-Sender: <xms:mg4jY8GLIKkPXBbt717vBai-y2TJ64hDKv1zx4_jjhhzoUUUzNxnLg>
 <xme:mg4jY1UDTbxoGT4SruTcMl17rkftnNJPCymibiPRCm9b_QlFLz8ku7JOyYiW93pLv
 9RIUVeCMaUjUjWUa4w>
X-ME-Received: <xmr:mg4jY2IhhR1Tayl8xZz32ZeTzIEKp8gyY9AR8QsEIWjWaM1jxt6MAHgaEnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:mg4jY-Gu6DTkXzqpDDElETSN02LYKKV-PqbPaxgdJa70qmjAAVeGUQ>
 <xmx:mg4jYyVg4CU92QNzyKzS3h0MrRUIHiu1oqogOYCbmncukvQHZKxotw>
 <xmx:mg4jYxPK7O9ryE5_AvLvT-9AbFP9PkWDPFj2ri1sylvxFid8AhK_CQ>
 <xmx:mw4jYzux676vScOaTbyNTEtqYHyZ-hNcg6cjInQXmgUGY8YnbdSNow>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 07:38:02 -0400 (EDT)
Date: Thu, 15 Sep 2022 12:38:01 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the
 maximum
Message-ID: <20220915113801.hexlaer3sp725co5@penduick>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
 <20220914155035.88E45C433C1@smtp.kernel.org>
 <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
 <20220914180508.0EDD9C433D6@smtp.kernel.org>
 <c221873f-f230-0cce-e120-7e3cc732cf00@i2se.com>
 <20220914181458.C6FCCC433C1@smtp.kernel.org>
 <ecfe17be-5d81-3456-9a86-77acc848f95f@i2se.com>
 <20220915075459.d2snlbwkingwnbh3@penduick>
 <ebb86dfa-2f89-dddc-0864-42fc4d2e9386@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xs5treb6qglpqv3x"
Content-Disposition: inline
In-Reply-To: <ebb86dfa-2f89-dddc-0864-42fc4d2e9386@i2se.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Emma Anholt <emma@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xs5treb6qglpqv3x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Thu, Sep 15, 2022 at 01:30:02PM +0200, Stefan Wahren wrote:
> Am 15.09.22 um 09:54 schrieb Maxime Ripard:
> > On Wed, Sep 14, 2022 at 08:26:55PM +0200, Stefan Wahren wrote:
> > > Am 14.09.22 um 20:14 schrieb Stephen Boyd:
> > > > Quoting Stefan Wahren (2022-09-14 11:09:04)
> > > > > Am 14.09.22 um 20:05 schrieb Stephen Boyd:
> > > > > > Quoting Stefan Wahren (2022-09-14 10:45:48)
> > > > > > > Am 14.09.22 um 17:50 schrieb Stephen Boyd:
> > > > > > > > Furthermore, I wonder if even that part needs to be impleme=
nted.  Why
> > > > > > > > not make a direct call to rpi_firmware_property() and get t=
he max rate?
> > > > > > > > All of that can live in the drm driver. Making it a generic=
 API that
> > > > > > > > takes a 'struct clk' means that it looks like any clk can b=
e passed,
> > > > > > > > when that isn't true. It would be better to restrict it to =
the one use
> > > > > > > > case so that the scope of the problem doesn't grow. I under=
stand that it
> > > > > > > > duplicates a few lines of code, but that looks like a fair =
tradeoff vs.
> > > > > > > > exposing an API that can be used for other clks in the futu=
re.
> > > > > > > it would be nice to keep all the Rpi specific stuff out of th=
e DRM
> > > > > > > driver, since there more users of it.
> > > > > > Instead of 'all' did you mean 'any'?
> > > > > yes
> > > > Why?
> > > This firmware is written specific for the Raspberry Pi and not stable=
 from
> > > interface point of view. So i'm afraid that the DRM driver is only us=
able
> > > for the Raspberry Pi at the end with all these board specific depende=
ncies.
> > I'm open for suggestions there, but is there any other bcm2711 device
> > that we support upstream?
>
> I meant the driver as a whole. According to the vc4 binding there are thr=
ee
> compatibles bcm2835-vc4, cygnus-vc4 and bcm2711-vc5. Unfortunately i don't
> have access to any of these Cygnus boards, so i cannot do any regression
> tests or provide more information to your question.

I don't have access to these boards either, and none of them are
upstream, so I'm not sure what we can do to improve their support by then.

> > If not, I'm not sure what the big deal is at this point. Chances are the
> > DRM driver won't work as is on a different board.
> >=20
> > Plus, such a board wouldn't be using config.txt at all, so this whole
> > dance to find what was enabled or not wouldn't be used at all.
>
> My concern is that we reach some point that we need to say this kernel
> version requires this firmware version. In the Raspberry Pi OS world this=
 is
> not a problem, but not all distributions has this specific knowledge.

The recent mess with the Intel GPU firmware
(https://lore.kernel.org/dri-devel/CAPM=3D9txdca1VnRpp-oNLXpBc2UWq3=3Dceeim=
5+Gw4N9tAriRY6A@mail.gmail.com/)
makes it fairly clear that such a situation should be considered a
regression and fixed. So it might be a situation that the downstream
tree will end up in, but it's not something we will allow to happen
upstream.

> > > Emma invested a lot of time to make this open source and now it looks=
 that
> > > like that more and more functionality moves back to firmware.
> > What functionality has been moved back to firmware?
>
> This wasn't a offense against your great work. Just a slight warning that
> some functions of clock or power management moved back into firmware. We
> should watch out, but maybe i emote here.

Yeah, I guess we'll want to consider it on a case per case basis but
it's not like we merged fkms either :)

Maxime

--xs5treb6qglpqv3x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTXEe0+DlZaRlgM8LOIQ8rmN6G3ywUCYyMOmQAKCRCIQ8rmN6G3
yzvJAPwKk8+UrDedXR/g/u2ZIO5AIjut1nI9dgfrrrWkK0RQlgEArw3quF8AQM7i
9sixZ2c+3u47BA4XoYYV+m3tgqLRKPk=
=3a4F
-----END PGP SIGNATURE-----

--xs5treb6qglpqv3x--
