Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFB36E88F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 12:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B06E6E1F6;
	Thu, 29 Apr 2021 10:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5503C6E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 10:19:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 80F445C012B;
 Thu, 29 Apr 2021 06:19:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 29 Apr 2021 06:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=nXro11ayf+BNu3eRVPh/mtFJDg0
 SwhTFiUye39eo91Y=; b=EUSxFfFPjI96/WFvaiVqAxuInFzT5/zoH78emHtdSpP
 0/dfx+ai6iY5S7S+jjt8Ss2Ksl1LVGjo/kVQpXhHGSOVEg9HPvug9c1ozTZQ1uFj
 sjR/kzsYnxqNW1cTF3AgJiVR92z5ceaP2vK5DR/7GAoj2uBVaLucvTPL+nKqv8Tx
 oZb25uq4Sbay9ht0dVgvSA7NF2B5b8BO2S/BP/L/2UsF8MfD34Mrvfe/pg1KHq7A
 VxkF49L6zhzPztz8D8V+MR547UMwWq2kMA/OtjaLUDBpXg3HP+P8WhJ/3j7ouxVA
 OFWW9iv5SgkCRtOVAgNZouINPkalIZ22ltMm8kNgRKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nXro11
 ayf+BNu3eRVPh/mtFJDg0SwhTFiUye39eo91Y=; b=ogaAAHr0FodKDEcJfVwtBc
 EtQLu099HMW/hZ14LfP9Ydpwfc4S8o3WGgOIkpGEs1wKpZ6ltXm0SLAJrv7nvOWJ
 jCHm05rHpzeWKakSDtyUiX5fyrBW3ZpZpf9aXPk/gYASDKg9P5ObMDvv7bAuBoE1
 SR2HPP05pC1aU/NKCsFfNjiNRp1+2KBFPSvBBc6NwOdNzXlEYk0bClPR08hrLZob
 59p+FRSpyvA6ctpwq4XsBAmCtsOOIYF+vKwFOyes8rO9ptQJXzcV0fcPuAHDZ8OL
 1qLA8ezt3VIpG5tRgD2HNME/g5TJhln1Gg4Cl4gpdd8B2vCl1dPP+95D3rpev0vA
 ==
X-ME-Sender: <xms:HIiKYF-NOFOTqNjX_J9pGbRjTsU_F3o94h8H371evJ4fXEyRoPHpmA>
 <xme:HIiKYJunoTuWQBILve0QrJArKCIwszom1d8CBPhPXGPH-cBNu1l6h5tITdyiGgGmu
 P-Ts1vIXFIimmAKjQM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HIiKYDD3rYTiWOV3Qc2_pIUGUU8yzv25oK1Jxh13ou797NJLd32mng>
 <xmx:HIiKYJfLSo-ny0-feJ-AYO8w7DES7Gs2rjGdC47DMoFdWMACuww26Q>
 <xmx:HIiKYKMdOhOv3q6ye6Al31qUddRoAoDX8UPQFBjcaOK0V7UxbTrJKg>
 <xmx:HYiKYHq_pShIF14kS5uYAPyvtm1DlXM7rWtcddVoN4bbpkm7wkneLQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 06:19:08 -0400 (EDT)
Date: Thu, 29 Apr 2021 12:19:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/vc4: fix argument ordering in vc4_crtc_get_margins()
Message-ID: <20210429101906.oyksmyvmhtxy7y55@gilmour>
References: <YH/720FD978TPhHp@mwanda>
MIME-Version: 1.0
In-Reply-To: <YH/720FD978TPhHp@mwanda>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.duckdns.org>
Content-Type: multipart/mixed; boundary="===============1138541987=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1138541987==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pmlppwclgrww3bhq"
Content-Disposition: inline


--pmlppwclgrww3bhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 01:18:03PM +0300, Dan Carpenter wrote:
> Cppcheck complains that the declaration doesn't match the function
> definition.  Obviously "left" should come before "right".  The caller
> and the function implementation are done this way, it's just the
> declaration which is wrong so this doesn't affect runtime.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--pmlppwclgrww3bhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIqIGgAKCRDj7w1vZxhR
xd+RAQDgI7bMDtw/4/Jy0xv7SHV5djFACyeFotLWNeyKedIw6AD+JP053Xz/3ar0
I9LeToENzjvNl9JKKKtd+aGVfi/FZQQ=
=8aDt
-----END PGP SIGNATURE-----

--pmlppwclgrww3bhq--

--===============1138541987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1138541987==--
