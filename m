Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE15098F0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD5F10F5B1;
	Thu, 21 Apr 2022 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C4110F5B1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:26:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A02043202173;
 Thu, 21 Apr 2022 03:26:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 21 Apr 2022 03:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650526000; x=1650612400; bh=XN7nPNDRwZ
 pRpH4w6jKrnUSF1J+uA9Aomn0Tyyg+sgg=; b=reh1PxaAX6TeqgdkIGuHUAtZDy
 ylYNTyQH+tGD/NXkZr7bMx5FomhO0I0TZQEnUulYcrCy7iG35394o9TKK5dXo4DV
 Q90LDyWk0RnH4Q8uO1QpaSQF56s+uAo/nfbF38nBH9MgsV5o/k3ecnEXUbxT+W/N
 pwrcGM5Knvd7WDG5s6QkoXDvJiTZd8pcsOfuOCmjYzl0+SmlEh4OHQewBW+GvTE5
 D4vtn0ATGLCQGPnD+PD+qUL/IhifdZr0tuHh/DDXNd/d7r23k4zvewnu1olWdtqM
 R8smnIMR5HdMo8aggiWiWZnKQrToeL1HRnTqTG+GQMlrOQkmp1bKwOU5NOCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650526000; x=
 1650612400; bh=XN7nPNDRwZpRpH4w6jKrnUSF1J+uA9Aomn0Tyyg+sgg=; b=a
 7CGty1wmV/MXik40pwxSjYCzTwA+9YgBevWcbaqmWOMVnoCXs3qE5skGHUJwsUPr
 STjQqeFHNcGGwdyN19tk03tyaCPHg65Ei2wkMQJR3Ht9UqTNIVRc5c4K2CYoZErz
 TH0UwJYW6wjliLSNXkDHF0N7MAwu+OkUVg8a4FjOnH2tBUzdkUISfVDh4Nj9PO74
 9PPxC1hyxVb68w/p9o0yeP1K63SECeTT7zpA1aTLb3SbupCPTteClbbr3ij+iTHa
 jHW6xdgYotEAmL1hVWSUlODfVh4zSqBmBFqMm4Gi+3NaI33skaqgBxOLI7W22tcD
 1yEKWWENCh26BksEovSjw==
X-ME-Sender: <xms:LwdhYqGp3NgeUAN9qN6KPHzWI2vvm9-PzrORtSSvgSKu7FxK4eStgA>
 <xme:LwdhYrX7vNxNTJSlmGaEZKr1Pw_xUt7vePkHPLRgaKo2I2FhcjnG_OHzAN2EvHVA2
 wQDrjx_iKIQ5jT3lkg>
X-ME-Received: <xmr:LwdhYkIi2L4B6h3MkWpo5me1PBSSCxWwmjm92gmciDCHzYjrylatM3kJz1lNFPJYUT6J4mxLniWhRDXqKMRh2nN6P6aSaIPBQaG_Xks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LwdhYkFOiYYC8OexqhhoxsTkvSkzYUhBIAsBSJ-ZeJyGsEQZG-1ikQ>
 <xmx:LwdhYgV89GLbczwEqLvXax0UQ9pHQde1kUk5i5NpNijYGeuBacC-vQ>
 <xmx:LwdhYnPoB_XCd1CVaDs7DYWKW8v1fNCBNDdjitjdL42pzlO7Cqs9KA>
 <xmx:MAdhYpMZtqvQQ4qoRoQlaW1dAOHEn2Mlb9TZqjFTZ9lGjWs7wprjBg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 03:26:39 -0400 (EDT)
Date: Thu, 21 Apr 2022 09:26:38 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 1/2] Revert "drm: of: Properly try all possible cases for
 bridge/panel detection"
Message-ID: <20220421072638.fw3prcfzdfheb7h3@houat>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <YmCU7YLx/+ILPptK@ripper> <YmED/vYsrjoc4OjC@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tssx5pyv3fy2b3q6"
Content-Disposition: inline
In-Reply-To: <YmED/vYsrjoc4OjC@aptenodytes>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tssx5pyv3fy2b3q6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 09:13:02AM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> On Wed 20 Apr 22, 16:19, Bjorn Andersson wrote:
> > On Wed 20 Apr 16:12 PDT 2022, Bjorn Andersson wrote:
> >=20
> > Sorry, I missed Jagan and Linus, author and reviewer of the reverted
> > patch 2, among the recipients.
>=20
> I'd be curious to have Jagan's feedback on why the change was needed in t=
he
> first place and whether an accepted dt binding relies on it.
>=20
> We might be able to just keep the whole thing reverted (forever).

I was the one that asked for it because I thought this would be more
convenient for everyone.

Turns out I was very wrong :)

Maxime

--tssx5pyv3fy2b3q6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmEHLgAKCRDj7w1vZxhR
xczrAQDV9i+KB0hYDuwOgB+KrBXr7bAIE6E5q9UbnHH9a8FUBQD+LVR2pJn3N93J
JETcy3KZHN/S71vX9V7/97OyYrsaYQ8=
=EoVn
-----END PGP SIGNATURE-----

--tssx5pyv3fy2b3q6--
