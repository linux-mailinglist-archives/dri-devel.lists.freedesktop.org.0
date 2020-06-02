Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577C31ECA24
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FF16E4D4;
	Wed,  3 Jun 2020 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D386E145
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 12:52:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 333E85C0060;
 Tue,  2 Jun 2020 08:52:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Jun 2020 08:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=WDq+umCpTeMy9k3W0/Wp/zsjIGB
 wGG2fZVoUDuvc/6I=; b=f45OZi6d+1yiR3+fuUjVx/OffyBQzXpKlPQbYfJ2G3K
 JbM0gya4DR68naiFqT2uxODNVG5DStLzdE0iZ0Hnzxalrq2wgoa/aOXT4CymRy1o
 wmlS4dGmwPT3KP/RICQd1ql2qMZepWk1XPNZ3QnD7p3P5wzq618XIg9N+hZsTfNA
 /Pr3d6A/XzFKIFLxaADMbIIVVCjUC1SV0wuzNUvMN40DDoDN1UIfl07lvtYIpqbC
 m9WK5McK+v9DLGrh7eQaiL4t8K0EVgAUPABhuctzK69htNR4z3RvbvlyQrKNenkX
 sshBlFSNkun213PiCHeWnXf9bfPEEPiexjX5dOiOeng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WDq+um
 CpTeMy9k3W0/Wp/zsjIGBwGG2fZVoUDuvc/6I=; b=BV685FeEEZTDO3F+XTXwxI
 2oE5GEcg0f7mM0Xy3W9x6iJ4YgMAPeOCwXEhZ/oAKIBLr7G5KoT9O8zlYS/+IX/C
 njwsrJSZ1aofL9UDyXcM7T69/UBQRoRRoHvgqDD/ZX4m1YMiYQZl8J+97TvvNgXE
 Wcb5s8xAA3VM25x17aAKG6VCjAKSefFKXAFpdSYYRjFJ7pR8CHGDlz/wlIij4kVP
 q0nF2WqzdaUFSgDw6+li7l1wnI4tsCwQ34Z3bZ8eCI7d7VaumCmJWJvVZqB5TY0I
 y31iE0eqEk6RLDbCFQucAqdpR0agta7mzml3QMtrfToY9xQ7uoR8rS9yzzl/YSRA
 ==
X-ME-Sender: <xms:jUvWXlA1A9BMkxHHPwcc4ETwV_7JdBoR9eKiZ9o_AMY6HEPeZ-Rh-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jUvWXjiv-UD_m6bSp3Zfr5gqBGrPqSSjyQ89beHJzdhD2j5TIEm8qA>
 <xmx:jUvWXglDvAwYaWpwOw29Sv3u9zzRIvPIAewbDVQzL1JdcawX4c04PQ>
 <xmx:jUvWXvwMkm_EFZZphIf5wSyET12pg7TUa6yfCaKQsK8SWPpaq4NAXw>
 <xmx:jkvWXpGO6Kobml1_RcWM6NdXzzn1A0uJKD9e7b3bY8-0559rrtABfA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 027DA3060FE7;
 Tue,  2 Jun 2020 08:52:29 -0400 (EDT)
Date: Tue, 2 Jun 2020 14:52:27 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 015/105] drm/vc4: hvs: Boost the core clock during
 modeset
Message-ID: <20200602125227.fe3mt5jnqd6u4pft@gilmour>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <1aaadf9a5176591c891622cb00b0c50f42e569dc.1590594512.git-series.maxime@cerno.tech>
 <CADaigPWQdeTd2CGCK-yxq+TAU6xKMVsdZfhSVptn4RSENxpdxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPWQdeTd2CGCK-yxq+TAU6xKMVsdZfhSVptn4RSENxpdxg@mail.gmail.com>
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0005774741=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0005774741==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ne6yctwhuf4mmo4i"
Content-Disposition: inline


--ne6yctwhuf4mmo4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Wed, May 27, 2020 at 09:33:44AM -0700, Eric Anholt wrote:
> On Wed, May 27, 2020 at 8:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > In order to prevent timeouts and stalls in the pipeline, the core clock
> > needs to be maxed at 500MHz during a modeset on the BCM2711.
>=20
> Like, the whole system's core clock?

Yep, unfortunately...

> How is it reasonable for some device driver to crank the system's core
> clock up and back down to some fixed-in-the-driver frequency? Sounds
> like you need some sort of opp thing here.

That frequency is the minimum rate of that clock. However, since other
devices have similar requirements (unicam in particular) with different
minimum requirements, we will switch to setting a minimum rate instead
of enforcing a particular rate, so that patch would be essentially
s/clk_set_rate/clk_set_min_rate/.

Would that work for you?

>=20
> Patch 13,14 r-b.

Thanks!
Maxime

--ne6yctwhuf4mmo4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXtZLiwAKCRDj7w1vZxhR
xVPmAP45n0n/bXaKZ1yE75klsmfyLSQrkPVnggB8TOLcoVWvXgEAoQBVPj7GmkAB
XoSEMSgX4zgK/n0fW6bptMqt4QaM1gc=
=P3EF
-----END PGP SIGNATURE-----

--ne6yctwhuf4mmo4i--

--===============0005774741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0005774741==--
