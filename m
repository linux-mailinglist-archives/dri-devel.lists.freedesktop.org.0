Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FAAFAB82
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44E6EA8E;
	Wed, 13 Nov 2019 07:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 510 seconds by postgrey-1.36 at gabe;
 Tue, 12 Nov 2019 09:31:17 UTC
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941546EAB1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:31:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 35DFF414;
 Tue, 12 Nov 2019 04:22:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 12 Nov 2019 04:22:44 -0500
X-ME-Sender: <xms:4XnKXf-L_tVLumiYBGIt8lhU9Mx7MYdj5VbeeYs0CjvUWj9QWvjW7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvledgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertdervdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrg
 hinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieen
 ucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenuc
 evlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:4XnKXX3k3lgs4sGfTwA3qMfNDhb_hFrO6hjuc5wu1wJBvZkHrEtJww>
 <xmx:4XnKXY3jtUmbeU0bhEqg435fSQc_rDi89TUs3xrzyhAW_UlApylHSA>
 <xmx:4XnKXUwsO2wQuyDDprjvUyHIXnhu_TooGph_1FRDkVTj0dmq7PQXQA>
 <xmx:43nKXdHU2-56xppFGST4_X5pZk226ivg8tRgqos2BqyVqGCJdib8zVIZzKg>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C38980059;
 Tue, 12 Nov 2019 04:22:41 -0500 (EST)
Date: Tue, 12 Nov 2019 10:22:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Torsten Duwe <duwe@suse.de>
Subject: Re: [drm-drm-misc:drm-misc-next 5/5] include/linux/kernel.h:994:32:
 error: dereferencing pointer to incomplete type 'struct drm_bridge'
Message-ID: <20191112092239.GT4345@gilmour.lan>
References: <201911112308.UOBDjIac%lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <201911112308.UOBDjIac%lkp@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zfwOgb7xmScN/NBXETq9aVJdBa5
 iWThCu+teOJrujPo=; b=K0HAno5YdO0kuKqqIkM+wn70U52mDA7fZEjS0a4RQsX
 87+hYK6QS6ILw7QZWgjG0oL/ulkEPDU4qpok5/mu3KUObIGHUB+RMP1pjlMdxy3T
 QuMnkfAR9ngTAuOnyDh9TmYtKaJEmlIF9utSygNcwN9mge/TQuue5zpoRP+DgqQV
 sqgES5PWRm95mGPdsRhkvCLc8n9j73v0UJisYS5He6cb7ozKGvV8mwGO3Wcu/1r8
 sxBtNrOSzwxp8TCHBF7ZKy0PCpCZ63GyLSAqM+B9sdEzvmF+R6ogKCHO83jQurC+
 kHznjkh6odACMe+q7J6nfoARMBQ4UpH1zKHBqy9opsw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zfwOgb
 7xmScN/NBXETq9aVJdBa5iWThCu+teOJrujPo=; b=NKflnhu4nm5qt61NLrh/jH
 BWq8OSNWpH6E85sHLuhT+ThSRs0PT3q4tqWHAp/DG56KSIB6kyplz15APh2cJMWI
 bnKmPD10UzHhphX6BK2v2WjXZERBAF+pXC7K1a2V2gQXhs9p1oWJLl/rYy3KJeLu
 8AQpc1pnY7TQVVHeOWyGof43/EZ5Ev0E1AU21mBhtQPk/8SolzW+WGsPNZsIpUKU
 9XCbGLf2hDucEOEmiQ703u+7CpbftgykQYHFStn0XH/hxRbyrwsnK9tQRUcM8dKb
 uOr7oblpyz144R2pp5B8UZGW6Vx8EgcfgAseiYT9YKiCW6feUmKHmcgM272wuT+g
 ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1619984093=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1619984093==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nSQp8DZZn7gZbDHt"
Content-Disposition: inline


--nSQp8DZZn7gZbDHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thorsten,

On Mon, Nov 11, 2019 at 11:53:20PM +0800, kbuild test robot wrote:
> tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> head:   6aa192698089b450b06d609355fc9c82c07856d2
> commit: 6aa192698089b450b06d609355fc9c82c07856d2 [5/5] drm/bridge: Add Analogix anx6345 support
> config: i386-randconfig-h004-201945 (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
> reproduce:
>         git checkout 6aa192698089b450b06d609355fc9c82c07856d2
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:48:20: error: field 'bridge' has incomplete type
>      struct drm_bridge bridge;
>                        ^~~~~~
>    drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:52:21: error: field 'link' has incomplete type
>      struct drm_dp_link link;
>                         ^~~~

It looks like you didn't compile your driver after rebasing.

The first error here is pretty trivial (missing drm_bridge.h include),
but the second one is there becaus the DP link helpers you rely on
have been removed.

Can you send a patch to fix this? Otherwise, we can just revert the
offending patch.

Maxime

--nSQp8DZZn7gZbDHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcp53wAKCRDj7w1vZxhR
xVeHAQDZGXwV9KvwlqT7Kf8C6rhNNTdNXzmSDawuFgpLQ3bxkgEAsMeQyH7Lfctc
iYeM/4f+G3BqRa29fPYOqH6gixp04Qo=
=qz52
-----END PGP SIGNATURE-----

--nSQp8DZZn7gZbDHt--

--===============1619984093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1619984093==--
