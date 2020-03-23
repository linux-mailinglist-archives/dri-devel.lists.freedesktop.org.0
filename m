Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032F19071A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF586E446;
	Tue, 24 Mar 2020 08:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2946389E23
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 15:13:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 783A9580118;
 Mon, 23 Mar 2020 11:13:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Mar 2020 11:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GAe9evQKgPl6kCh0zfTEzT/CM76
 CMhkxj8qnRU/5u+0=; b=Gl69dg/KL0fB2QP1vl5cZ85/lT7aRrLjbJKGwt/RdTL
 /7jB+HgApPvKUMRoyb2Qt1EGvMIqDp/QjW+rSokBqQTEkyTuV3JUq/j7ZKA/Hrnp
 WlcEJzNWRJUmAwK6ntpcVTDG+Yz3lrG8AffcoAKC4GnpQM/TNe94/ZaZerhaN7RL
 oD6NmOGsQNPiiIhsunX/G3w/SNo4xJo+hpS73o9OIBXbuKZZ2KJWRMqfpzTUgGFN
 +k17QeS4Jt9vVw1hQ/4NL6mAC7YtiwHoKYTvz9MvfMS0IFxW0F/FMSB7KE8MACOf
 FnQb+9TNuNyLmR/GIFY5ihN7vA9o1sYXrSRbsr0rtWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GAe9ev
 QKgPl6kCh0zfTEzT/CM76CMhkxj8qnRU/5u+0=; b=HN2Ugj01J2KGTv3SX8ynQn
 KNFCNrha666DIO28e6EycqxyieMUf9tx9eylhLd5vjqq/QEkNHUzspqXL2C6IkV8
 5SSiplNdrZ27rxu2kHw5R3tMD5KJjLWNaYPkg7SunLBjtYjwV3wefeCofWXliLfK
 onST2HlEBdMuB0HpRudemyOfssvewDt6XG6FH4Fa6yDxwAU2ZPlgSWNv6L+9WqTg
 MirRl1b64x1WKbxCel0c5MrB8oIR4XUPlSzb5tcxF2hGsXqzN+141nw7U3UjLsjn
 nguxZuWYQtUjeO0r/GUzgZy9uhxiejE29TNx5zYf4SikxOirwNncxLW64L4BfJ9A
 ==
X-ME-Sender: <xms:ANJ4XtJNo40pA1nqiNL8_aKRSu00TlMjV_QZsv9m3yClraBzeEdI5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegkedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ANJ4XgQAKlM8v0yTpNI5NFWm2IWzuF4DJ4QXOyL9VEnAN8bGknTD6A>
 <xmx:ANJ4XoEWcJDSOi546MJKkxfd3cdhgtd7uLKFtnvVUd-PeSfx0CC3fQ>
 <xmx:ANJ4XoFlPY5gSl3QM-_rjLR-tGIMoXFQ9ve6UUiiivHQXYGRSDiFDw>
 <xmx:AtJ4Xg3kdjwW1dkBLRNuaXG9Rrbo83yojgh7ddnJzZaUJam9ajIH8w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7EF3328005A;
 Mon, 23 Mar 2020 11:13:03 -0400 (EDT)
Date: Mon, 23 Mar 2020 16:13:02 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 07/89] clk: bcm: rpi: Allow the driver to be probed by DT
Message-ID: <20200323151302.ckpvc4a7eiinnfbq@gilmour.lan>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <c358081207dcf4f320a6b7e2932f0d5365bf3242.1582533919.git-series.maxime@cerno.tech>
 <d793e358-32db-5fea-aac9-d06062918718@i2se.com>
MIME-Version: 1.0
In-Reply-To: <d793e358-32db-5fea-aac9-d06062918718@i2se.com>
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1997270335=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1997270335==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v5m5awxasxzcip5g"
Content-Disposition: inline


--v5m5awxasxzcip5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

On Sun, Mar 01, 2020 at 01:16:28PM +0100, Stefan Wahren wrote:
> Hi Maxime,
>
> Am 24.02.20 um 10:06 schrieb Maxime Ripard:
> > The current firmware clock driver for the RaspberryPi can only be probed by
> > manually registering an associated platform_device.
> >
> > While this works fine for cpufreq where the device gets attached a clkdev
> > lookup, it would be tedious to maintain a table of all the devices using
> > one of the clocks exposed by the firmware.
> >
> > Since the DT on the other hand is the perfect place to store those
> > associations, make the firmware clocks driver probe-able through the device
> > tree so that we can represent it as a node.
> >
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> FWIW i want to mention that starting with this commit, X doesn't start
> on my Raspberry Pi 3A (applied on top of linux-next using
> multi_v7_defconfig).

Was this the same issue you reported with the HSM clock rate, or truly
an issue with my series?

Maxime

--v5m5awxasxzcip5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnjR/gAKCRDj7w1vZxhR
xWCaAQCLY6mdJ+pXqjn7wvV8WOobxLaPy0P6y1ZPPf/arV8g9AEAnOxapP+tmnzB
zJdBac5cosAeX20cT1zCpqqzz1jHQQE=
=7v4z
-----END PGP SIGNATURE-----

--v5m5awxasxzcip5g--

--===============1997270335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1997270335==--
