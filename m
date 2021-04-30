Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374036F759
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 10:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022756E0D0;
	Fri, 30 Apr 2021 08:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A866E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:48:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 474F258097D;
 Fri, 30 Apr 2021 04:48:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 30 Apr 2021 04:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oUiXz1OlQ54S4d1LeQRnI53gSCx
 TXESTKHtOkdxho+A=; b=hoCQdFtxDSK6UbfCGFYvv4TufwxJgDZL4/9hZpTmt3G
 IDyRQW6DeUtd3QE8zRgKO1tTCnqZ1qI2WUsnXYFQUJGf2IYSAvPiMBY18vAS/I/9
 xz4NsAEZqwL+JWXVYYq6sinO5hc5NbLREH3sW5oJDQW9EeNk6odbXD4nqOUvG4Ls
 xjw9yFS12w+/F60Ysq95IatfYDFZAvz5UmDqMtU+AW2D+NNHUUfZPRnlPV+bbX5c
 MdoHHNq0dWanAT4CNqQwjH0ssse5Mq2o2qL6HQywLqEA2tQeuFGHYXpO8+g8rkB6
 ESylDPQz7LHNdntBdNqYw5iU/N0Du5/Y0b3huDggSfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oUiXz1
 OlQ54S4d1LeQRnI53gSCxTXESTKHtOkdxho+A=; b=KsarDeBnF2RCHx6yUzdD+Z
 Kt4Th+wOYTKmjc6DGrVr1aMJFrYKSfS7IBBh6BWQPIEOqn8x279iLr2hja+A+FuG
 P5JkTxAdjfJHv4k5TCmlNWdB+59cPrwQSgnDxDsG8LCwsA2qTwUk13HWIpphZeYZ
 aRJUIbC7V0mWVziFOnofqdQ6sTZyTqAHYY2gV7R0cCqP1AzT9c8w54zT5PSAxsec
 DjVGdAA6gLEGXH8VACvJeyJhKbba61RK0juLx+S8QrhS4cBUXCacWcUu4CTwu5W0
 DTbZ2APp50nnR7Dys9jxS2jO0kDaq+Wp9qvVzignIl2Y0j0Hlmm8G6imSlOih1qA
 ==
X-ME-Sender: <xms:asSLYGFkuaoda_aUdWnWjDa4fXG4YFA1lHvHY4X-T5yO_gnGge7nPg>
 <xme:asSLYHX_gDBnCAg15Saed0wEQ4NRiKlqEJUYAX3QRJyylkT_pMyEtn2uuR8rJN4az
 IknHLMavSNtKptfG9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:asSLYAI7rHlydogoT6wgI4x4S5i6HNCIkZh3EKqIyOMtsmhj0jwKuA>
 <xmx:asSLYAFYFPIl788caQs-jmqj9ybujWnoKXDydLJbgdl-w14nIRyy8A>
 <xmx:asSLYMUi6pSeFPncrAJAUWYFrC9n4lGs6fMo4DurcrwHI7YjSHvJzQ>
 <xmx:bMSLYNVcx537Xg1x5xiBD_bP8UltEDfoKFcpB1iuFu9Ww8_eeDip8w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 04:48:42 -0400 (EDT)
Date: Fri, 30 Apr 2021 10:48:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/2] clk: Implement a clock request API
Message-ID: <20210430084839.dwjey7qobtc7vi5q@gilmour>
References: <20210413101320.321584-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20210413101320.321584-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1186720713=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1186720713==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lsyads3gv67wbw5p"
Content-Disposition: inline


--lsyads3gv67wbw5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

On Tue, Apr 13, 2021 at 12:13:18PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
>=20
> This implements a mechanism to raise and lower clock rates based on consu=
mer
> workloads, with an example of such an implementation for the RaspberryPi4=
 HDMI
> controller.
>=20
> There's a couple of things worth discussing:
>=20
>   - The name is in conflict with clk_request_rate, and even though it fee=
ls
>     like the right name to me, we should probably avoid any confusion
>=20
>   - The code so far implements a policy of always going for the lowest ra=
te
>     possible. While we don't have an use-case for something else, this sh=
ould
>     maybe be made more flexible?

Ping?

Maxime

--lsyads3gv67wbw5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIvEWgAKCRDj7w1vZxhR
xagEAP9KnN1cSuEGzs5QoVF1FGdo8VaW24bbM0i/ttjNxkFH+AD/TWU3q0YuBFlL
6g93rwgyrmu9GDsqBS06BEr+FVlJgQk=
=oTRU
-----END PGP SIGNATURE-----

--lsyads3gv67wbw5p--

--===============1186720713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1186720713==--
