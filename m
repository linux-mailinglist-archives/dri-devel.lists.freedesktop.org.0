Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6CD54DC26
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70D10F017;
	Thu, 16 Jun 2022 07:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F94410F017
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:51:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 890245C04A4;
 Thu, 16 Jun 2022 03:51:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Jun 2022 03:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655365863; x=1655452263; bh=avkRFOQri+
 DCIUeMYAcXgoXa03VDvIj7+Mqpc1dZorE=; b=tPTiDQZgOpOTBNkWPIEeZ1cVHU
 rEBZIs9kB54QbLOHfdkbmXpHgb5tCHVKkq+L0SFsg6Rv0yKI0y+3PAbC0Vb/fPMJ
 F/RuZ/sx27XTAS3vhno2ZjGMC62OUcI3JRIzE/vAQILFsE4W/3bGiGet0nOdpZ1F
 inyflp5AjmQ5LyaxJ0vIXsxJ3qE0OrAx8GwdkIoGopzpxRzu+4Uk4D4uTMjPPqeG
 EpvB6fMFevTJu+RFOUaRsqwvvd58R/4W9xhVgvOGHln0e6PkQskebfXxGsMrG4S1
 h8aRbJztk/H++1oq607cQTeJegMgPt3a72uA/tTj4uIj1+nPkuuzfYGz9fAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655365863; x=1655452263; bh=avkRFOQri+DCIUeMYAcXgoXa03VD
 vIj7+Mqpc1dZorE=; b=psRljeytIRyTl+ScjZLU8kIJ9pQfdTmnCb5I1dHxqdMu
 NeiD9HWw0xK3XCyYtXufIATqua3uZXwAhhQ3FLzn1iioUsoFk+P+ZgJ7J7A1PiyN
 nTW60PU/Fs2xvMERANtD+bbcdZexftiAoR9i1jj9M5dAcSZvTmtQQ5/ufLLnuHs6
 PZqn3nL08qP4cFzFmaL4yRDslLWbXwIG0rxN7PXyKLVPJtfqvQHaqaKAAoo60WnP
 i4FWoKByAuqz8u2b7w2QmN5qmVGkT3tayPMzkq106FmGpa16e8Zpux7tLmig4fYw
 2kny5qdSOYehInMKxAYpqtWLVFwh+Gff5ZrultoDXQ==
X-ME-Sender: <xms:5-CqYp084miTQPbYre40GQf43Dgit3mkgcdvqJs-Oy7pCwTI3aeETA>
 <xme:5-CqYgH5ejk39-bafGZ_5dizsV_-qUNTUC_TzzIsMKxus3DTlSABzV3n4YL0CICe_
 hzoPufIIR5GGPTpYBg>
X-ME-Received: <xmr:5-CqYp5DX1d7rHEyzJPiDebzTmf6zAwEvbOVUYO-on_lofDLGVMO0GjpwJGIlnBmOb7h0PN5lPZC5diUd3INrI3ZQOGUj3T7GD1zW4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5-CqYm0q22hXCfmH1D1ozvFYoK3sDjcdoPPL1x68Z9BsDbvZsFuoCQ>
 <xmx:5-CqYsHCLmwctCX_QA8ztpyM8r6Qez7ER2y1q5z6igEBry5oDOeJnA>
 <xmx:5-CqYn_utHs01A6ysdyg3vDtVzXa7Zfb_9pAw18CAIOScJQknRvN_Q>
 <xmx:5-CqYqZP_gjVDOPGyZYYJdCIQSO8V1Qde33cLWNz72W7amZlkoNLjQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 03:51:02 -0400 (EDT)
Date: Thu, 16 Jun 2022 09:51:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: Fix crash during suspend after component bind
 failure
Message-ID: <20220616075101.gjm4dctnyjxcmjur@houat>
References: <20220615054254.16352-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qbgetibzjtgdqpsj"
Content-Disposition: inline
In-Reply-To: <20220615054254.16352-1-samuel@sholland.org>
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
Cc: Ondrej Jirman <megous@megous.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qbgetibzjtgdqpsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 15, 2022 at 12:42:53AM -0500, Samuel Holland wrote:
> If the component driver fails to bind, or is unbound, the driver data
> for the top-level platform device points to a freed drm_device. If the
> system is then suspended, the driver passes this dangling pointer to
> drm_mode_config_helper_suspend(), which crashes.
>=20
> Fix this by only setting the driver data while the platform driver holds
> a reference to the drm_device.
>=20
> Fixes: 624b4b48d9d8 ("drm: sun4i: Add support for suspending the display =
driver")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Yeah, it's far from the only issue regarding structure lifetimes in the
driver.

We should convert as much as possible to the DRM-managed functions to
fix those.

Maxime

--qbgetibzjtgdqpsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqrg5QAKCRDj7w1vZxhR
xVj+AP9Lpx3pI6RrBywPXKcmxvCkRZ4QHOy5xsKfXkKI6tLETgEAkGiZ3sBXGsYY
KLIz4RgXLbFTU7/u7uLaZcvDfMWHigU=
=4NA8
-----END PGP SIGNATURE-----

--qbgetibzjtgdqpsj--
