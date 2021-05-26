Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E039162E
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295036EC8F;
	Wed, 26 May 2021 11:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53F06EC91
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:32:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 43B465C01A7;
 Wed, 26 May 2021 07:32:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 26 May 2021 07:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=eYdOQWJvkGv5lYmwmsTB8/heePt
 nDEqHSneUmgS7RZw=; b=rSN+K2lYTICaRInRng38MnLI2qgzFowVSYCXda8MmML
 1Azwf3UgSC+ySqtx4flMSSXXiJz2AUO3Dv9UB5VukKZImQJxftLXtbQClI03b/5C
 aJkvommPpkoAWPVHClnp2/eBpPvBuEnuoCCfWplIGZzsRbhXK7WjIr0ualykbnE6
 I77lF7J41Lm96/808Xe4ZDiDwIhFQNDg1okzBkQst83JLHBHPkCOIXGlff3dvy7m
 2heMKc4IENWQJVELaLUiIt+exhva3YN9rUCHFAZWqKu6Tw1OuAv3Pg4m74S2WbD0
 lmBA2XMgltTC+D2Bj2ZmaOcUgSvGcxbHCVkxEgjEPhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eYdOQW
 JvkGv5lYmwmsTB8/heePtnDEqHSneUmgS7RZw=; b=IpD9YYR9tUdAcDA9MtqX3S
 Gv8J4sF/KLR56VK6L6i2gitfEFI55aMoiSwoJOorHRBLBgpfNidVJhRKlqevlGDo
 RNAqo3h5Iisl5UZrcQx1SiYCw55mQMcoDgf25p7zilnk2D7Dbd6yvuvZMRZ2LfBO
 ZEmZ427D/JDZFw+1jWUB6mpWEjn9el+6DERwcTVt9o67uVC/JEHGHE8tiLkJM4XZ
 dexDSmdalmCUA5ZXH94jAK3wAKB12DKTEBQ76ACiJMhxycaNAFkkokYYl+eJsVfB
 gmNvdNshkdATDB7s5BPUK/I6tAfxhKdK5v+UYTYuTDrmNlQ+kU40ehQ0Me4BPsoQ
 ==
X-ME-Sender: <xms:tzGuYFWD4oJai2YDYDaWFhg3-HnZMqk_mHd9i0q-8FQxrT-KO6w3Yg>
 <xme:tzGuYFllwkw9cFd86DVqKMPtVB4_U-gruxfiPq0gHXhMHRUINakjSxZBZdGp8L7Rr
 FUe1uz7edKZTjlkUGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekfedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tzGuYBZ1P-km1cMVOzWB4w7VdzNeGBsMe-ePQ_LJ4m2fm7TTJUJymA>
 <xmx:tzGuYIUKYpy3NZYRyf6EJNiuvGMnDfo2jWIZna_nDt8n7xs7bqHyFg>
 <xmx:tzGuYPm8EfAfRGP5Rpi-LKRX_iTI_1tGHPUpp_iY9Jv5uZv2OTg2jA>
 <xmx:uTGuYIC4GXmWyDP_NJZ2W95cueagyq_ToB4y536R5Tc-FhaQ5cSKMQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 26 May 2021 07:32:07 -0400 (EDT)
Date: Wed, 26 May 2021 13:32:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/kconfig: Remove unused select of DRM_KMS_FB_HELPER
Message-ID: <20210526113205.rx2xwcgjm6qb6s24@gilmour>
References: <20210526100825.29450-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qe3ihkvgr3teian5"
Content-Disposition: inline
In-Reply-To: <20210526100825.29450-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qe3ihkvgr3teian5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 12:08:25PM +0200, Thomas Zimmermann wrote:
> The option DRM_KMS_FB_HELPER has been removed. Also remove the last
> remaining select statement for it.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 91185d55b32e ("drm: Remove DRM_KMS_FB_HELPER Kconfig option")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--qe3ihkvgr3teian5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYK4xtQAKCRDj7w1vZxhR
xVQpAP436GSHWaw9MYGR7C/5P4VWebNti5Veb4HEpYRHFkU2DQD/RyMN1afXZ7lh
aNlTgJYH4SxSXS0BjglKvi+4PgRiBAU=
=uVSH
-----END PGP SIGNATURE-----

--qe3ihkvgr3teian5--
