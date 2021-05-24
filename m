Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3DF38E6E9
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 14:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD57189B18;
	Mon, 24 May 2021 12:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D973892A8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 12:48:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 548F64325;
 Mon, 24 May 2021 08:48:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 24 May 2021 08:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Zhabnp0Atjp47VD9T0LRqk1Zy/z
 s00zil61rTDyPJR8=; b=FT9hbmq8gbEzT4OkklXO1rElEc5ELJlcfpEsV7YU4WZ
 Lj0yyXKdaApfhPHYKeA9heqeSVegL1kTukkdVzEQSoCPfrVn8uf1HWYPp8mEtVlD
 MFY+/LnYjr7nCTswTfl95PU/aD5gNUdwerdYOP3yUJSfnQK3MBksIftJ9NPA5z5q
 FY6wOvm1e6kG/Ng+eJxULQYfS7YoExr2hK7z2spABQkO8jcFZtO6EmFkkrKWr5xG
 Vs5rMA8xZ5k0bxRvbLyW73FlERHjaRDfym3ClrSjOfCDfcwh0oBhmtFljZcwQcd9
 m/x1pB3q8f+M/kdN48bVZ/E1ejYLV+iZ474V4e8qM1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Zhabnp
 0Atjp47VD9T0LRqk1Zy/zs00zil61rTDyPJR8=; b=Z5eaM2WNbZ5hpcmp817ZPt
 XXfhNkayDUzL29zLPZuCC1x6hBGIscA0MBdtZXs8QaLBsFGQrjkYEpmmCulcvNgY
 2YWnfMy0lDWojbztYindj2G071z2zVALbKiExeAe0198CESrkjvMfZbWDD9EPx92
 P+DueEeROV/djPFgzb9Pe6XnVFQkYFn45PgT/w/j4WfgkOHs5dm1NAg9WbLrSa3c
 7SsGxxb8HboQQT88GtcEk0qrOBUgmuTuFw5/lMBC7LzlwVQ6kcmkgzaDOEV6U0i4
 ydFA0IF5FW4cYwvxvoMRa2SgdEsHFivgKy+DNHj/9/5j0cU8qJi4Sffvo2UybqCQ
 ==
X-ME-Sender: <xms:jaCrYFtF4JDSGBBKA4cG-3x1MmHAEemYkH_rgg7BO7JfMriEa0J1ig>
 <xme:jaCrYOdlp0-dKrD7Lh6nZsKzZSjg-QxcJRqBeyz2rjWSz3KK5uOxnoKVZgEo5gZgC
 e5QD-2lOmMlifi1lCY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jqCrYIxFKIp2HdjVDCKyUWJd0ILiBzXkJopqRbncDM0WviI5wp-Bag>
 <xmx:jqCrYMPQlMvZ_A2KhrnIXz_o6MlgdJ3rgG8C6qQZbFvww4YiPZ-xwg>
 <xmx:jqCrYF_Z8ytZps9byNoiJywYnUYij6BZE6pZGudtJJnmmdLWGUla2A>
 <xmx:j6CrYDfc5YVwxJ9Ca5_4aabGjfk3r-mYYA3NkLFRMVddjpP0kCEjYmSDhYk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 08:48:13 -0400 (EDT)
Date: Mon, 24 May 2021 14:48:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] clk: Implement a clock request API
Message-ID: <20210524124811.74g75n672wrpzqqi@gilmour>
References: <20210413101320.321584-1-maxime@cerno.tech>
 <161981637939.1363782.4943687720432536625@swboyd.mtv.corp.google.com>
 <20210503083221.qsdurp2f3bkwfa6d@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cpltpodfwo6nlz4l"
Content-Disposition: inline
In-Reply-To: <20210503083221.qsdurp2f3bkwfa6d@gilmour>
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
Cc: linux-clk@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cpltpodfwo6nlz4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen, Mike,

On Mon, May 03, 2021 at 10:32:21AM +0200, Maxime Ripard wrote:
> Hi Stephen,
>=20
> On Fri, Apr 30, 2021 at 01:59:39PM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2021-04-13 03:13:18)
> > > Hi,
> > >=20
> > > This is a follow-up of the discussion here:
> > > https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gil=
mour/
> > >=20
> > > This implements a mechanism to raise and lower clock rates based on c=
onsumer
> > > workloads, with an example of such an implementation for the Raspberr=
yPi4 HDMI
> > > controller.
> > >=20
> > > There's a couple of things worth discussing:
> > >=20
> > >   - The name is in conflict with clk_request_rate, and even though it=
 feels
> > >     like the right name to me, we should probably avoid any confusion
> > >=20
> > >   - The code so far implements a policy of always going for the lowes=
t rate
> > >     possible. While we don't have an use-case for something else, thi=
s should
> > >     maybe be made more flexible?
> >=20
> > I'm definitely confused how it is different from the
> > clk_set_rate_exclusive() API and associated
> > clk_rate_exclusive_get()/clk_rate_exclusive_put(). Can you explain
> > further the differences in the cover letter here?
>=20
> The exclusive API is meant to prevent the clock rate from changing,
> allowing a single user to make sure that no other user will be able to
> change it.
>=20
> What we want here is instead to allow multiple users to be able to
> express a set of minimum rates and then let the CCF figure out a rate
> for that clock that matches those constraints (so basically what
> clk_set_min_rate does), but then does allow for the clock to go back to
> its initial rate once that constraint is not needed anymore.
>=20
> So I guess it's more akin to clk_set_min_rate with rollback than the
> exclusive API?

Is that rationale good enough, or did you expect something else?

Maxime

--cpltpodfwo6nlz4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKugiwAKCRDj7w1vZxhR
xfYRAQDtffPhF2gxVCSqs9qlsbYhMeB+mxY9DPPqNO5CWL1J7wD9EnCQq5BwT/3m
HLrSMGMCFo8qkNFISkn29LFniki7bwA=
=urn9
-----END PGP SIGNATURE-----

--cpltpodfwo6nlz4l--
