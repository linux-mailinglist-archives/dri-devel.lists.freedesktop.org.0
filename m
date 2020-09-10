Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC0265CEF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045BA6E9B6;
	Fri, 11 Sep 2020 09:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510A26E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:20:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 89FF35C1160;
 Thu, 10 Sep 2020 06:20:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Sep 2020 06:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=h9dKsfZElOLIOTm7Da/tNPTY10k
 5L5HmDLJR9oS3z6c=; b=ZJMp5JBxpxJwTnBBVenMqoIcLK3N4YPQRG2YS17VNWg
 iAM2clGBb6HVgzgu2hLskjDTam45Bk1Ycgb/FBYe/jnV9qn7cKLpJfJ0z4hGiJTb
 p7phTPHDH2LmFRrA7R8bK//SA5y09hPUxNHH+5B6CEhIhGRkV+8sRDqjTkVwzoa7
 f2hmyoWp3RCP+mSdbn80nx/HACHp9ejIEGHy20inte2VhCUUt7W+qQkIRU922cbZ
 63DN80T2ANrPFnFhtOGXC1miAaP5s6/NpNKHpnVlLn3MRSI5ua6NZG7+fDf/rF5T
 Km7xvpOwhlWQ7frb6LT6mFyfxxxegq6LyopPZ3JtvyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=h9dKsf
 ZElOLIOTm7Da/tNPTY10k5L5HmDLJR9oS3z6c=; b=gxTI79L8o18xkzl7EU0Zq7
 2cak5khnE3AsY7Kgm1pA4DoXQ4S7vNYL3Lr12e/koqEf5T8yqzTuKpv70Nf0YGsl
 6VTIGTKZTBT+u/Dc+x6q0pzGLZWqQ0spqmh1XEvjLUvD5uthQ8xQt1L1kggtw0Ou
 uSPcTvL7Q1tZxNnsuvHvmg2VGs7l7sNQEjF9qcA08rH+Pi4S2VzRodlCeKpaFRdF
 plKeRk0P3CMZ/402U2QNbZobkmvOJ9rsO+jmeH+8eay6Nzyl5mhnPKwzVXcqc79r
 0bta+8ZBGCZQOHpuylfQn7qB7CziAjv3aVTgZht9pTG+c3esld/lkVxC+4fKbGtA
 ==
X-ME-Sender: <xms:1_1ZX_soTByC1OGZAVEtl7KN0PNxF-hH4pLKJnLRiuPDGKsMRqzoFw>
 <xme:1_1ZXwcRmTKYvGyvQSrox5qVifVacFnGpNqoOQfvrE4PTrqDbKPmdY1VIrGYC_eNr
 heKR3d5Q533zOysLTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1_1ZXyziTMw7j1jHySLH75LAQVjjh6dtBvE4dj4GIIKM_BsLvT0Caw>
 <xmx:1_1ZX-NAY_1rujcr_5_YRPfIHEDX_iWGBxhIO9utFAQMi3LLuKOOaw>
 <xmx:1_1ZX_9WFvdE_OaEnKNMrCfqltY0j-RgK_QXgW68wNo5Vsx9J0r83w>
 <xmx:1_1ZX7Z5HYRM_U4aTDt6S1-r9e8VpqaRMdGa7MQVnfZEPJsZ4yrpOw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2AD423064688;
 Thu, 10 Sep 2020 06:20:07 -0400 (EDT)
Date: Thu, 10 Sep 2020 12:20:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Fix NULL vs IS_ERR() checks in
 vc5_hdmi_init_resources()
Message-ID: <20200910102005.puj7gscpnfczdrll@gilmour.lan>
References: <20200910100825.GC79916@mwanda>
MIME-Version: 1.0
In-Reply-To: <20200910100825.GC79916@mwanda>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.duckdns.org>
Content-Type: multipart/mixed; boundary="===============1473592341=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1473592341==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ry3egkt6pariiyt3"
Content-Disposition: inline


--ry3egkt6pariiyt3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 01:08:25PM +0300, Dan Carpenter wrote:
> The devm_ioremap() function never returns error pointers, it returns
> NULL.
>=20
> Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--ry3egkt6pariiyt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1n91QAKCRDj7w1vZxhR
xVV4AQD88CcY9D0XYtm4MoYKOItUhKdUW84yZ2VzgqVPja0a8AEA6EoiURAIXd0L
ZlJXZg8kdHtpbegQw4NfyW8cwZ0oywk=
=lspq
-----END PGP SIGNATURE-----

--ry3egkt6pariiyt3--

--===============1473592341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1473592341==--
