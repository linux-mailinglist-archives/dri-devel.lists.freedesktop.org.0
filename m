Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98975324C08
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 09:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3B26EC67;
	Thu, 25 Feb 2021 08:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0026E0CA;
 Thu, 25 Feb 2021 08:29:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E5C0D8EF;
 Thu, 25 Feb 2021 03:29:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Feb 2021 03:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=4UmPrJDlW6BfsrqqA0Yk9+mFrsr
 kSZQB6ETTHniwqmg=; b=UI19d2KBAxe7js0LwGbgDHIwarKsbHM8MzuOpH/zljJ
 J2VzI1N4ORsJ1eqEQZaqr8+T9NnMH4+ECMnouF/0VEwbghfmmgbBL9aBeyNYialh
 avXFLWnK2NcYQPHo1bIWyjz0dP2wjv0UUEWcl/44ukF0wSL+mXS4Krt4MWShDpDe
 K4WmNPnoLrDD6VMkCVdBDeGoVW7cXOVIxcoEfkQ2wgFolNLrLbGXhC4FveH/O1GW
 VlT3UGDaCpo/zFYDqeDzeVmSZsiS55YnEdIevrnsnx6lctj7RyeFNR4orJbBFYYW
 bUNPYcU9aLNQ7uMX5ovcEMe4ecyl3midcT9O5px2iVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4UmPrJ
 DlW6BfsrqqA0Yk9+mFrsrkSZQB6ETTHniwqmg=; b=Y4367hns17AfMOrsc7SVcc
 2zSU6G0KLrWf0J3XwDSJq7ECx+Xyt7QMIGVGCFA0nQvlIw4X2QNf2gX0dqXMkrzt
 vpgR0Kavq7IVmQXbBxp/foXT8T5oq2gc0YwdwfdZkA7Ugy4vHEgTseYGVkotLh0J
 GCX3bDhAkkNE1AafkXQ+i/oc6vnvdl+8Jda2WzCr5ukQN0Apt29W6Kumr2JwABBx
 Hho91+goN4628NdoUDGFxFJdcFoVu0EC9XG/ejlWYzC+qfLGwdR1LaPvSdNfNWtk
 zZWDzl1V1kAHvV3XlliYComImqF/bvyxJswQZqKa2q40DoSa115U4yPc3KxBOPKA
 ==
X-ME-Sender: <xms:1V83YPYbIZfJ20dz0Z8hn7mhItVL1YWAGhaGGt3DqxTAWFcoTfJrHw>
 <xme:1V83YOYH9noWAh9zNAUctBN5iQAn4F-fPQRGjTu_pPBIAIZjHmsJ52rRqxu4Wt4qL
 4JwMKvNHK6vg_hwObU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1V83YB9ZQhm336YYbljV8RGmufDmqIxsBBzFoG9_3kR2qlLryrYNKw>
 <xmx:1V83YFo4yaxyoAYTJAHsMY8DDxnMkvI0UL69WcQLpWSg-ZuNLyHOgA>
 <xmx:1V83YKqeiZUEQQeiAka2oEGJ7be_hKja6rdKo5WjWZSJpKxAAv-Nkg>
 <xmx:1l83YHBalI3fR4aaRLtTCW9smvlWOhBB5UBKc9vm5zhgiO7uD5q5gQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0461E24005D;
 Thu, 25 Feb 2021 03:29:08 -0500 (EST)
Date: Thu, 25 Feb 2021 09:29:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <20210225082907.ni7ajtpqvjecjba3@gilmour>
References: <YDYqJhsuNDKvD3V/@linux-uq9g>
 <CAPM=9tzu+Sa+1w4LCwdV0wsRCvqPnXSdrCxi-dTMxn+hN_Kz2A@mail.gmail.com>
 <9592f25d-b7fa-5b84-eccf-01af1019ef06@suse.de>
MIME-Version: 1.0
In-Reply-To: <9592f25d-b7fa-5b84-eccf-01af1019ef06@suse.de>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0370506583=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0370506583==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y6usttxbgs7trw4v"
Content-Disposition: inline


--y6usttxbgs7trw4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 25, 2021 at 08:53:42AM +0100, Thomas Zimmermann wrote:
> Am 25.02.21 um 02:55 schrieb Dave Airlie:
> > On Wed, 24 Feb 2021 at 20:27, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> > >=20
> > > Hi Dave and Daniel,
> > >=20
> > > here's this week's PR for drm-misc-fixes. One of the patches is a mem=
ory
> > > leak; the rest is for hardware issues.
> > >=20
> >=20
> > This is based on 5.11 and I'm not currently in the market for a
> > backmege now before rc1 so can you just top this up next week?
>=20
> I can, but I think Maxime will take over after -rc1.

I'm going to handle -next, Maarten will be in charge of -fixes

Maxime

--y6usttxbgs7trw4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDdf0gAKCRDj7w1vZxhR
xQw9AP4kTlNtEBxrfCXatbywhCMoPc0aWa4gaTFTBgCbd0RsogEA9ScDTeS3pQi5
CeRvJEOHpGzypEqejQeBp8KLhaJczww=
=nNCf
-----END PGP SIGNATURE-----

--y6usttxbgs7trw4v--

--===============0370506583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0370506583==--
