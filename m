Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A652528D5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFC36EA3C;
	Wed, 26 Aug 2020 08:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292DD6E42A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 13:35:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2CB90BDB;
 Tue, 25 Aug 2020 09:35:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=OB6C5rBdrsWYefSK+JPJv5u1Nkg
 G5sD9y7dak5b46mg=; b=EsPj6jpasoYSP0YKt7mLyaiMGUGgtLvGKfqEaGYBUmp
 6F8sYCCBPYEDXPhGBwdqATRn6G/s74WQmRxDZlfC2AtCmoTzDMZlkadxLNQcel1h
 hVn+ydQYlQ8DAhH4UgiZMGT+0dOXDOg++qArL7XGXUCIaufkYafOiKyJ/vYJYi5K
 n8Fi2+QciSv+fYUVTXT8eALX9oC2HI1a2vKhfbpRr9erniSKhxgOGFpyrqnTelX3
 L+toz7iBjRrFZarLGA/TfwttmrwYdNxAHqudpMGRxJqBZEZx+VjnpBU8vICMQtT6
 ieM03Pts2nTOU7pvtaNpycP/N0pqkSiWsd23XsUugwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OB6C5r
 BdrsWYefSK+JPJv5u1NkgG5sD9y7dak5b46mg=; b=jbMgxGY8XZUU3NoJVcHFeq
 3x9sPixGdxeuJBfUbpTiYbcG7z4m7sZOTNjI4RBi/fCHGzGUV5YUjQ7+nSBDThE+
 61SsJZ3irmvDzt7bv69kz6baYEVwyOoQVyxlXnlSdLzkmHYivRCgVhIaAxql8EpM
 B6mkmwYC7p8a6EFM4YwXe+Jx21cqPPyX8smGD7ifY+L258IwUIj8iPJiywQoFCXZ
 TPhRrGalxT2y3PbWkPVpw1hUk7WeclJWIczmX5BxRuNKVrBLu4ZBwk5d9eBWjEPi
 VBt3/ByFS8eTzO44AUFdJCKFEtHWnKO2uFUzNrFvKG95Ne87pvSOuDuLy+gZCCiQ
 ==
X-ME-Sender: <xms:nhNFX4NDcLveTBRdwVWoTEJZAxBQlCGZWOvkK46EMgAU_r2pnUyKNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nhNFX--MLspTHky8cfdWSXoscLxGcU7RJlqIvHUsZjGMLCahO_oJww>
 <xmx:nhNFX_QTJQ60vvWpQxCnSEURmFXFXtC7FkeZkzbd1gxzVdQmsl-6Dg>
 <xmx:nhNFXwsjipdACMGmSyrbzjaiMN8-D1xpIHKfkaZFCMFbM7G-4vgpkw>
 <xmx:nxNFX_6AsWog0CaOOUJVClBK0jcBKewTziwomVM9CpcA0radMDWdiw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA9CF30600A3;
 Tue, 25 Aug 2020 09:35:25 -0400 (EDT)
Date: Tue, 18 Aug 2020 10:49:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Constify static structs
Message-ID: <20200818084906.lhuzwqdoyqzapjsx@gilmour.lan>
References: <20200804215337.54594-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200804215337.54594-1-rikard.falkeborn@gmail.com>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1803721751=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1803721751==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7xomoy5wll6xmvne"
Content-Disposition: inline


--7xomoy5wll6xmvne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 04, 2020 at 11:53:37PM +0200, Rikard Falkeborn wrote:
> A number of static variables are not modified and can be made const to
> allow the compiler to put them in read-only memory.
>=20
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Applied, thanks!
Maxime

--7xomoy5wll6xmvne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXzuWAgAKCRDj7w1vZxhR
xeMiAP9ZL9rjwDAjy7IbU3HboVfFI4FAP7eQZPgomHMvsL0ToAD/Z2CtUjH4lak/
EVZ2tUz2sOcYWfa9U+uzNZ0Cj4EOIgg=
=uQCW
-----END PGP SIGNATURE-----

--7xomoy5wll6xmvne--

--===============1803721751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1803721751==--
