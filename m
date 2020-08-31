Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE0258937
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4CC6E7F5;
	Tue,  1 Sep 2020 07:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7106E249
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:41:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9B93E9DD;
 Mon, 31 Aug 2020 08:41:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 31 Aug 2020 08:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=a2/0cAti7fRZnNrhavvYmYZV37C
 YMMnRg+cCcgtHRKo=; b=UzzPsvAT1iDQgLb9X6ty/scoPpsWFx5NmAsg96KHB8c
 ABeck/QX3R1yJFsTgOumTOZ3OXxtXJQKbeezPJ3RPeZQqfBW1bArFMzXbJ7l96+e
 5seLnWY5GDhq/4jaZLUrrvEGy5vShIGjIDtvaCboEzOg/jL3pk43aVrhF+/5PSt0
 DnaJ6UhyfhLqZjg8eRfe9VTB7bs75n9Yi6f4Bxnf4fAjiXB8v0aeZgzhywRJUS86
 Pr/UP8C6YEyaaGfM5Wha3UBS+a8xtgmH+yi8p8dXtNcPVcsqCA1SR8YpL/btRthF
 waBcA+I+y1GxWoerUnId7qkJ5MnaWcjHe6GgyGIfyRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=a2/0cA
 ti7fRZnNrhavvYmYZV37CYMMnRg+cCcgtHRKo=; b=LS/LxoeTl7Yf3gMl3fRRYN
 3onXdkKkCMkwRmpei65DGbbbpcRkAU/uQ+kMJ0PnDVgwGoGNrnJPHJL0KnxASbK+
 mYTJzKvcKvtVU5HpFDCEdziBBIQMFGlEWa4gvf5p72No/ONC1UgOdEKuC6mpOquA
 0ATDSF8MjgcRUQdi13J9kBx/OGgD0vOChaxBINmLZaAO5602yyk5vjZVxuV/yHEe
 H9lDc7axjghIGsBBl86mWtIBzwrZPurunvGmKNwJqsyIW142xPSHMWdGdIqreLVu
 6lspccLgldyRfOiHaeA2veCtsZxL2yK0vkDltgeZAAvP7Na/nR+DggX3Y+zJ0prQ
 ==
X-ME-Sender: <xms:DvBMXyy_aZOvBpo58GOnYw9fU1KcPYPVKSvGfwDx8DnAsd15Uzy-KQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DvBMX-QJTnIhN6pDUF3Z5yBrFQHAmfbOjZRWsZw1bMtlDZtra2YN6Q>
 <xmx:DvBMX0VmrZUn6Acg1u9kk78coKfgSyAufC-NDRdDQvWw1xdOOMuR0g>
 <xmx:DvBMX4j1Nef_d-cdd0YKSdeQDo7nj6gF_fWqWh22MZ7JYGo9mI3aUA>
 <xmx:EfBMXz7wKYi1yJHY1rljH6-cxmCmYauk9Ux76vt_HRjC7qZJ1YpUDA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B0D53280060;
 Mon, 31 Aug 2020 08:41:50 -0400 (EDT)
Date: Mon, 31 Aug 2020 14:41:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v2] drm/sun4i: Fix dsi dcs long write function
Message-ID: <20200831124148.wxklchu3bygnumt4@gilmour.lan>
References: <20200828125032.937148-1-megous@megous.com>
MIME-Version: 1.0
In-Reply-To: <20200828125032.937148-1-megous@megous.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
 Chen-Yu Tsai <wens@csie.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0191933306=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0191933306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bo4es2ituvyk4gfz"
Content-Disposition: inline


--bo4es2ituvyk4gfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2020 at 02:50:32PM +0200, Ondrej Jirman wrote:
> It's writing too much data. regmap_bulk_write expects number of
> register sized chunks to write, not a byte sized length of the
> bounce buffer. Bounce buffer needs to be padded too, so that
> regmap_bulk_write will not read past the end of the buffer.
>=20
> Fixes: 133add5b5ad4 ("drm/sun4i: Add Allwinner A31 MIPI-DSI controller su=
pport")
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied, thanks
Maxime

--bo4es2ituvyk4gfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0zwDAAKCRDj7w1vZxhR
xUvxAQCi4X8KG2ve/vqvH7ccu9eiejZWW3SS62xXNT3V5YX9AQEAwlCIsdLKx6kC
h9cF4hcGyros+fqCR/D32gijLZl4BAM=
=A4sy
-----END PGP SIGNATURE-----

--bo4es2ituvyk4gfz--

--===============0191933306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0191933306==--
