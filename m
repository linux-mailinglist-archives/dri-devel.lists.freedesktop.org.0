Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFDF2A2BCF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A32A6EB7F;
	Mon,  2 Nov 2020 13:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06C76E4B6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:18:56 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3FB09E90;
 Mon,  2 Nov 2020 06:18:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 06:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=s6B+UwzRAj1D2o/TOJiBAjR3IeR
 EvXsGTY0p/5snJgo=; b=YkAcK+n2/RYFNLwiyk9vB9RDSCUhPjoSpOBIa6SRaif
 J/BXDkWWz88Qe52wqqNY5kyTEmMuDaEaN05ciKRhY7JMy8L+iTcJzk4CoWFHlUoc
 LgOXh18vOtF0jsY69PBRWLfDzFBNe7Em4n+8r4BafYtBdb9z7eDDxnOms/vop7Wu
 MrJH+2kviIrBxVBpWvX2HsQ55clg3sFk2lAdTT3vJWHdNHUhl5oKtZ1ALVWtjsBa
 MFnJrhuN3Q97YHsAwMTbJR0ycHkXi5r4x2SWqTjMPOoLN+7GeOKtQ1BBGNQkAGh4
 6R2CCnSeOWB5yGJnCJFkTD9b/K3khZ1PPAFWV2ohraA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=s6B+Uw
 zRAj1D2o/TOJiBAjR3IeREvXsGTY0p/5snJgo=; b=IjH6DGC4Xi3tepalLliye3
 B10QCXUM6N38PX75tJFK8FpqrhSaJMZDMmdwLnFh3mGzwO8d6YlNNbMg6ab3IxZY
 YT15AQDJI+KpAmDiqGeqnROOoqahKpd8lUKke662Y3LROCyOD7jTGjChUDxz1p+q
 6d4zXejQS66JBACzNjPNl5IPK0Q9mHpvNULMFsJTZn5/zwIgw0yJHg1rs/JTLj5U
 sgNgFJmvsrVVyZpCoL2tHsA5kjj9rYEEX1UE2jBkLVE1fQbPFfTTF/uSjb6NvkID
 HIVKTeZVZXS5onpKnRc24AVBIb1IcR8MLHxd6LRneeiUroENi667/zx1Lx4N3qjw
 ==
X-ME-Sender: <xms:HuufX_5fBKXNyP_Xx2vkKyY1H1VFI8_KbCE2hjv2JC9J56O18G209g>
 <xme:HuufX04vOTsYM-PaHQm8mZmA8dT6TvdbDkZxXvln1bek2sTMZlih2GYLhSbtOo5Vn
 CsPYhEjVN882S6ACEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeduvdfhkeekhfdtgeeihfeluddtvedthfektdelfeejgfeludfhteduveej
 hefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrke
 elrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HuufX2eQIc8l32QOVBpj1egzJjZ4X8de25ob8w0fxXvJEUA3c-3bVA>
 <xmx:HuufXwJy3g6wZkLUovGqAU_IX3w111pVH2BlvUEZWmZeM1cwIJ0k3A>
 <xmx:HuufXzIbQEFnGg4vSK4bxyXrb0p6xAU6UVYKSrYGKAnxBJDJSjR83w>
 <xmx:HuufXwHDSuEh821q6d89zSpHL_5kr7ec7YX6rZxq8OrLW2s5AkQqnw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6AA6F3064685;
 Mon,  2 Nov 2020 06:18:54 -0500 (EST)
Date: Mon, 2 Nov 2020 12:18:53 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm/nouveau/ttm: Add limits.h
Message-ID: <20201102111853.ltghqv3dh3th4v7e@gilmour.lan>
References: <20201102110806.429002-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20201102110806.429002-1-maxime@cerno.tech>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0281564912=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0281564912==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="owqmmkebr5saevlz"
Content-Disposition: inline


--owqmmkebr5saevlz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 12:08:06PM +0100, Maxime Ripard wrote:
> It seems that a recent commit broke the nouveau compilation when swiotlb =
is
> disabled (which is the case on our ARM defconfig for example).
>=20
> Daniel says
>=20
> """
> Since the proper fix is maybe stuck in the usual "drm abuses swiotlb
> internals" bikeshed, maybe best if we push a fix to including limits.h
> in nouveau and call it done?
> """
>=20
> So let's go down the simplest path to fix our build, and goes back to it
> later if needed.
>=20
> Link: https://patchwork.freedesktop.org/patch/397835/
> Fixes: 4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> Acked-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Note that I misunderstood what Daniel was saying on IRC and ended up
pushing that patch in drm-misc-next. We can revert it if needed.

Maxime

--owqmmkebr5saevlz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5/rHQAKCRDj7w1vZxhR
xYz9AP0dGycSdohxL6wgm8UAoWnpP9QuC0OnJSzdkR+YRbYW4wD/ajHTsUw6tZ7h
OKH1zHnU/LUZOD8l4T4LfCXxRSGTfwU=
=kiJx
-----END PGP SIGNATURE-----

--owqmmkebr5saevlz--

--===============0281564912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0281564912==--
