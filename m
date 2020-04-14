Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D3A1A93F8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB646E84C;
	Wed, 15 Apr 2020 07:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73DC6E479
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 07:27:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 53153D5D;
 Tue, 14 Apr 2020 03:26:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 14 Apr 2020 03:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=z5MESemy4at/XiMeE9culKqPajy
 dX3epVv5bu8NCS5w=; b=PXG4m4efaHFOdBKDqGRkoY2NYHF2ZZYCSBMozPP5yrd
 nnkZAXOdrI7nGrf5+VAo/62LK2HK9ZW9wDsN575yJcSUBWn4xRvTxXBXkeNVPFes
 du6tju/KHaxU5dAcJ1PBcqOjYsuarlTS+42JExPvkjv3aUUj1J3mDGOpgTnsltS0
 FMdZDF0hJ7TMWq6el7FyAseVd5XTfqR3ZkDDftKudGzNYh7Rg2vAKaqcOUPUeD6I
 /XRFIUq61uu+BdxQ81B5nqYNOamVQk/G6nSp2XjhtqBbid5/+2mvvuwKk8YKF9xT
 SYTS11RzebGWUAC1IdM9AzZ4GEoh4EFvs5p+CR5YvEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=z5MESe
 my4at/XiMeE9culKqPajydX3epVv5bu8NCS5w=; b=3pGPxyk4nmhLT2XV141JuX
 x2T8ZazVfOyohOVn0CIKFQyoY4b6Om3gMbnppgBRtp204W4UQDe8eM98AAtHNbot
 Uy9/KP9dfxDVkL760mbxzrVuh+w1E3iKTQPxziukmm238VgmNrZwbITQNoKJWSNt
 bEL0uJdMuklClnxU+qKCpSdQVovD1gsAER5LlQpeFZ+i5ckbbVDUMMW7hwblHVzA
 FZ2AiOddZQZQ5JgYTGVOp2wYNaF/i0c7NDnvLM+XvsCckwQ4IZsQax9f4LWLX56i
 RLEqS/XMEshBwCdO5ZWv/8K5pstBaTixJdWVnmx3fQ1sHJTyb/85C64u30TDj+pw
 ==
X-ME-Sender: <xms:wGWVXjaMgOfD0xad5bMbf6M25CsI48g4oQh7HcdxthdHjFvJC6DtzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfedtgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wGWVXmosoca5IhQD4qQOWu1xdUoFNPGEyHW8sYuDSINnKQhOfupgMw>
 <xmx:wGWVXg8S6v-WWIYvAaRCWVx7H6CEidQ6W9pDJdAW3mW3LltU3x2qag>
 <xmx:wGWVXt8ztvlroAi1N_2A33jFe05gAxvbdMKUJdFYYwHRcAnysWS0_w>
 <xmx:wGWVXljUWYsWAlO-k7eSnaW4xx1k7xiMHBwrHOUzNYWP44J_F7bYcg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C2C0328006A;
 Tue, 14 Apr 2020 03:26:56 -0400 (EDT)
Date: Tue, 14 Apr 2020 09:26:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: point to display schemas in DRM DRIVERS FOR
 ALLWINNER A10
Message-ID: <20200414072653.x2mvytbsvnjiqiij@gilmour.lan>
References: <20200413075329.10717-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200413075329.10717-1-lukas.bulwahn@gmail.com>
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Joe Perches <joe@perches.com>
Content-Type: multipart/mixed; boundary="===============0703165294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0703165294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kdkzdphvlzzoj572"
Content-Disposition: inline


--kdkzdphvlzzoj572
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 13, 2020 at 09:53:29AM +0200, Lukas Bulwahn wrote:
> Commit f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display
> pipeline to schemas") replaced sunxi/sun4i-drm.txt with
> allwinner,sun*.yaml files in Documentation/devicetree/bindings/display/,
> but did not adjust DRM DRIVERS FOR ALLWINNER A10.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches \
>   F: Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>
> Point to allwinner display schemas in DRM DRIVERS FOR ALLWINNER A10.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--kdkzdphvlzzoj572
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpVlvQAKCRDj7w1vZxhR
xVrnAPwPo+G3ObIsBJnK9D9AJ9dsl+LIKPP4Qz+TT7i4cgMDMAEAvnuVM7N5ZdVk
yXUCRUxY6YQ5gMDbTD43X/MsWZqHmQ8=
=gv8H
-----END PGP SIGNATURE-----

--kdkzdphvlzzoj572--

--===============0703165294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0703165294==--
