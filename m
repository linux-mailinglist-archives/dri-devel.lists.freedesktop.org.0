Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DA167BB9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC096F40B;
	Fri, 21 Feb 2020 11:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9716EE10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 17:22:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8147D21DC4;
 Thu, 20 Feb 2020 12:22:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 20 Feb 2020 12:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Y/LbR6Gks9hLwTyOoP+fgUalI9X
 hENSr9+HkBd7I4X0=; b=rsy8BLO9wTPt5VT1koKQ++7YX/JqNw2f4K45TBjw61K
 NtrqK/J1EBgQYnqC7YFDQPkqZud22SIAPgJcoWT1ILayHtkQybaoMehemsVvBOBi
 7i4cjcDq32I/E6S7ES4KB9TOOHVCGcgp/fyVvtwoQCfFifhSp5kciq5ibEkWYDe1
 vBeJnDgdYC4kOTn0TAxST6lK9Q06nJmiz3J9CNHN5WTPfhIOA/RYaKUvmMSP7adg
 6V/I3RyaRAUirYnz7zoHoz/3c16LsVMd7iYu8/WazO0hySSg26lrRksqXVPUTR0A
 mrA0PIKjrsYYowLE9VSNMolVdQtSiK7ArAhC/FN9x9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y/LbR6
 Gks9hLwTyOoP+fgUalI9XhENSr9+HkBd7I4X0=; b=R6+adF2rysmiZatF269DgT
 q08nniKYJWkj3UoyZ3iJ+fY3LO725EKt5QN4tZKZDzjX6/k7+2GW7Spq18637cD7
 U4AQd2t8kfp8TD5J/wEARU4iKSzOEpVC2/0PLbenrhZL82ERj3vWnSIATeOoEwpL
 iwUGrGk2vslNFmYqiMW68Y97o29byM5cAEAeVBPpIYYTEmJaFy8+zz9/oo02k9Yp
 FK+jow0+EK7+VqaIExL5nUyzcCtsXsyWzSH6x9gamO0KCyCJmEKXbX4adHxHPpLX
 ixd0C4lGZKHLmllIMh8GwRnX3gVCU4Q70qnrgdbLG6s8AepecQpqApSTbkNjGJ4g
 ==
X-ME-Sender: <xms:UcBOXsPtVx0Kka06Pp2MdvillpDUXARbRezhJYZRxRyd50uUz3e8fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UcBOXsBjQCEDGuAQPtHvcaGoQYDBDoTV055YxBXU0LEHR3T7Flnw0A>
 <xmx:UcBOXsVVdXtbCRvybu_vV20qG23UUQWSRJ_Qd1v8pAfqkFgtpAX1uw>
 <xmx:UcBOXgcCgwQTIL6hBrah-yD2DId9vI6gCTT-bv9kTSOCkSnuzrcR5Q>
 <xmx:UcBOXsQNGzQYx5UzJP61oxMDyeIbxa33Yk2aL31PWJoqbHgwtnGR8Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 331E03060BE4;
 Thu, 20 Feb 2020 12:22:25 -0500 (EST)
Date: Thu, 20 Feb 2020 18:22:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH 2/5] drm/sun4i: tcon: Separate quirks for tcon0 and tcon1
 on A20
Message-ID: <20200220172223.xoy6e3njmsb2vcon@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
 <20200219180858.4806-3-andrey.lebedev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200219180858.4806-3-andrey.lebedev@gmail.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrey Lebedev <andrey@lebedev.lt>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1523170163=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1523170163==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bi7wpjn7s3dhfi3c"
Content-Disposition: inline


--bi7wpjn7s3dhfi3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 08:08:55PM +0200, Andrey Lebedev wrote:
> From: Andrey Lebedev <andrey@lebedev.lt>
>
> Timing controllers on A20 are not equivalent: tcon0 on A20 supports
> LVDS output and tcon1 does not. Separate the capabilities by
> introducing independent set of quirks for each of the tcons.
>
> Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index cc6b05ca2c69..b7234eef3c7b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1508,6 +1508,8 @@ const struct of_device_id sun4i_tcon_of_table[] = {
>  	{ .compatible = "allwinner,sun5i-a13-tcon", .data = &sun5i_a13_quirks },
>  	{ .compatible = "allwinner,sun6i-a31-tcon", .data = &sun6i_a31_quirks },
>  	{ .compatible = "allwinner,sun6i-a31s-tcon", .data = &sun6i_a31s_quirks },
> +	{ .compatible = "allwinner,sun7i-a20-tcon0", .data = &sun7i_a20_quirks },
> +	{ .compatible = "allwinner,sun7i-a20-tcon1", .data = &sun7i_a20_quirks },

It wasn't ordered alphabetically, I've fixed it up while applying.

Maxime

--bi7wpjn7s3dhfi3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7ATwAKCRDj7w1vZxhR
xaxkAQC4slxXfrNAlNDduUqdbx09RyWm5i9BjI+oi87n++Sj7wEA+3wqikR7D1eY
1FTAfdjEbPqk07Awe1jmsHs2OYbK2gQ=
=Um74
-----END PGP SIGNATURE-----

--bi7wpjn7s3dhfi3c--

--===============1523170163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1523170163==--
