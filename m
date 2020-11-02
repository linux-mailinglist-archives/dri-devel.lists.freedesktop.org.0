Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A812C2A2BD4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB4E6EB8F;
	Mon,  2 Nov 2020 13:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713286E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:39:55 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B93BBFAE;
 Mon,  2 Nov 2020 06:39:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 06:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6mugPM0MovcIMXWLXjtn4Idukki
 4LAlCmcUKO4Rn3Zo=; b=WkbFYkR+chE0jiJLGx864JIUq8aFP/ZGCk3M/CLoKav
 Czlf5sS37VHIsJaSFFomd+Hr+/hjwpnp0f/RBFcHKS2HTZ3suYzpVyLNlRCOBHPo
 edlCHhwQz/KrwwKH0x1hdo2+eYdcmUoi+WiCkvD6atgfJT5s9unzPDGJQT7aBQeu
 vSXk1T2ZLnBTZ97RNDpedyDh+/q96NjOH2BrjQJTj472PoojDqVKMpJivW3k3eSI
 PGzbaxU0orGyrXfIghyVF776SEwOcr3bj3YTwoP+yiKJ+5UB5Bz3xyKfYuc742CS
 xnIQ/qvGTqblnPFt8vIbQ7saqaoX6UysWDsp4gi760w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6mugPM
 0MovcIMXWLXjtn4Idukki4LAlCmcUKO4Rn3Zo=; b=WY37I4O8wv8y8ukPrmVYim
 i5NTKKm3LCpjETuy6ZPGZ7R0yYZowZ/JjtwePirwajIJ/umoeKox1HfSnCRF8PYx
 MKFi10j0S5Wg6MzfQ30HsBEgvp14S5ezqiAd8Fd0P8QXPpfcdVDw3Vo1RSOZz3pV
 IjB5KTnNW3/HjJM7UIXTxCD8wHhcBTvblciYlYgcTcop1pCun2I9/nay8yFkj3JU
 yzNj2/T49gzcBoDThM+BJccQ3BT/PEC47G4qOLC//2poSjSFlSt5261fo0kQR7Ll
 6SA3vHGm+azKSIgTvnnRsRLWtTFqQlWe6lY+K6rPJxa3xPykVqhQEJVd7HhuV7+Q
 ==
X-ME-Sender: <xms:CfCfX9LAqgEZxzGKgaCPoyEq-yisHqrkPb2YnN95mlBy6uUkVOMsHg>
 <xme:CfCfX5LhfkTisGMhiuX4FbsZzb9BcEit0GPnc225YAuwOif5SH_THN87vTqWAajj6
 pnwHaArRnqU13VaYjI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CfCfX1uPp66SDhiij1v7z8XtTlf4K-JSgTqP2lr5CntUtWwAtx0Scg>
 <xmx:CfCfX-Y36z7-mSueV0YSu6cPQtYzKRQqWg65PWSZn_3obhwL6CN7DA>
 <xmx:CfCfX0Y1q1Yb8ChAR-oVeZC_pSuAbYCFd9DBIVGBmz16GTRBGJyt-g>
 <xmx:CvCfXzllEWy7RomGGRgQuWwuLuVNCtg3prLZuY-EkM63CVyqX0e5_w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D33C328005E;
 Mon,  2 Nov 2020 06:39:53 -0500 (EST)
Date: Mon, 2 Nov 2020 12:39:51 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/atomic: Pass the full state to CRTC atomic_check
Message-ID: <20201102113951.6o4nv4rifwkchipd@gilmour.lan>
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <7b292ba6-c16f-efd8-d71a-5ae4d07a6b7a@suse.de>
MIME-Version: 1.0
In-Reply-To: <7b292ba6-c16f-efd8-d71a-5ae4d07a6b7a@suse.de>
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0972848357=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0972848357==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tfedfgrejdf6wf3y"
Content-Disposition: inline


--tfedfgrejdf6wf3y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Nov 02, 2020 at 09:09:44AM +0100, Thomas Zimmermann wrote:
> I read through the patch and it looks correct to me. The naming is a bit
> off at times. For example, ast_state should now probably be called
> ast_crtc_state. But that's not a blocker IMHO.

Yeah, a few places have odd names, but to be fair I didn't change them :)

The ast_crtc_state struct you're mentioning used to be called ast_state
before the patch as well.

Maxime

--tfedfgrejdf6wf3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5/wBwAKCRDj7w1vZxhR
xY02AP9eoje8DfZYNWysC8Kboe5TkHybDHxYzNp5iZ5aQkeQwQD/WKiUanoAbV4M
dewmIiIgwgpKW1JZL4wU0j1Vq11jpg0=
=n3Nf
-----END PGP SIGNATURE-----

--tfedfgrejdf6wf3y--

--===============0972848357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0972848357==--
