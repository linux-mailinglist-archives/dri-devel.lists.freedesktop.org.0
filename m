Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E3265CC6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CD66E04E;
	Fri, 11 Sep 2020 09:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B37B6E908
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 11:09:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EAD415C01AF;
 Thu, 10 Sep 2020 07:09:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 10 Sep 2020 07:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=vzZHi8Yhpl770vw3uaxiREazDoJ
 LAZZb5Valsfgma+M=; b=N2kxe4HUgYcH+yXXxUSh95XQzV7hp3ieuCou6PPLH6W
 Bod5x/NRe6H8eVmjxC5NhAOWT8Zq5OA+ddJ5aC77FhnHTaXeUiftCrslzLLAH58X
 932zwaIl9BhQ3M8fnxWiAkMavK5MRzHDmg59Xs6MB2Lt6vVBk3iC3pa7QEpiR47r
 6HsZYbeV4cx7zSIbVIju2FLsryBj+IcZXIkmqW0h4tuwH+DdlrPvohuaKu88vYz2
 I3XaARE1lBmGopoECmlT7cK4Xi7Ozj4WeQIlAjkAZ5xlfm4iDVb7S0svHCPxGrM+
 iTPLsRPmanfTljCrFz3mQ/krXRlJBR9TP8sVN2kO2ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vzZHi8
 Yhpl770vw3uaxiREazDoJLAZZb5Valsfgma+M=; b=e9FzldYcXd6Yb0cd4gMpFQ
 +6osmCiBYMO0AgPxfdD56nvQfvpvPQe6bgBE+rT/U61mZhyX4rZyZ4+UkxhGJaHM
 CPTooifhka6Sb9RrTEYVulN9cTCmVHmT2rR0taUkX5u+1BdBahGGkbrZqq3lDxWx
 /NzWTRP+UGFoeNA5oCmRTuKjG13gsxjA7A0pwtYZeQmOnQDG5BHyQKOfekD2tZS8
 HOKvtXaBc+ayLzfqsR1t8WDaTPfXl8wflbdWr5+iP53Y9CifQZt3RSVDpAPFy4+g
 T/bYDQzDXSsRTe/2nNPda22M2MTXRMA1t5pqpMX2EUOB3HQYT9zMfIGtVM98gwPw
 ==
X-ME-Sender: <xms:aAlaX8jrKNYJjjqY_z0WeKdsGkgvt7iS0ZWn68Gkur3A4oRSYrs9yQ>
 <xme:aAlaX1AwmAe2xld7dxznaSlY_47qo5e2YPdqQPLFL29gmWzEMISjQjH-4oNNMLWmw
 WppuXUyEFlZoOXPC2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aAlaX0HKVNhWJi8BP39rGOb04OvfLtHKLyAvQxVRNnN6Us40Q8H56Q>
 <xmx:aAlaX9Tvn2CTR6RTDdF4UEX4HUG2BUvDO-EiVrLFA2mdFth4teZn7w>
 <xmx:aAlaX5xZRQHmAcJ7dV20bA6z-j0Go28B6EabEOdWRMSVPe4zz7f-sw>
 <xmx:aQlaX8qYcEGjOTNCZfIv1pe4TmbUKjjR1qu2v88z4hZKTUCTmD_kZQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 940753280066;
 Thu, 10 Sep 2020 07:09:28 -0400 (EDT)
Date: Thu, 10 Sep 2020 13:09:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Martin Cerveny <m.cerveny@computer.org>
Subject: Re: [PATCH 0/2] drm/sun4i: sun8i-csc: Secondary CSC register
 correction
Message-ID: <20200910110926.bhoytmn6fhonlaxt@gilmour.lan>
References: <20200906162140.5584-1-m.cerveny@computer.org>
MIME-Version: 1.0
In-Reply-To: <20200906162140.5584-1-m.cerveny@computer.org>
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1786743998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1786743998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gd632ad2gwerkoq7"
Content-Disposition: inline


--gd632ad2gwerkoq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2020 at 06:21:38PM +0200, Martin Cerveny wrote:
> The secondary video layer (VI) on "Allwinner V3s" displays
> decoded video (YUV) in wrong colors. The secondary
> CSC should be programmed.=20
> Let's correct CSC register offset and extend regmap size.

Applied both, thanks

Maxime

--gd632ad2gwerkoq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1oJZgAKCRDj7w1vZxhR
xWRDAP9yQx9ZDPAzz2RNzaVJ18yDPmCkCQLqhvrS2ht7GUQZIgD+N42Dub03IPkI
BCMbhyB3VzWyqGUmIZW6ZDurm4VnfQo=
=sU2K
-----END PGP SIGNATURE-----

--gd632ad2gwerkoq7--

--===============1786743998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1786743998==--
