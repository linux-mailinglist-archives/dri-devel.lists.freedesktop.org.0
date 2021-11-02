Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C082443146
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BF572BE0;
	Tue,  2 Nov 2021 15:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DEC72BE0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:09:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A20B15C0125;
 Tue,  2 Nov 2021 11:09:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 02 Nov 2021 11:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ls42lHAs9gBZOIsdVGXqxUQvy1f
 6gbOB9gv3uDCyIBg=; b=DqBTK8LDvrSWaKHLtbnlXkzD22eb9kEK4TX0t6VaWXE
 l17d1eUdXIpm0v2scb/R3Ij8kLRiBMd73STIQHbKsJo47fowhx+cj9WPHuKBeKDd
 liIql3R9fkzeSxfgMzdQC2Z1hKZIhAfQ2s+ZIJkwgvnYl+I+bkoE57RujbzMYtQ8
 teL8JwqlNm5eKkXtAu81UaHUTSLoCczpNRPAKEZlGGoI1Ykj8MuAQVtKOb8lR/zO
 k9S9xdj0jqHLHuJXA3mUe6lMTk59pByrsAPNqzWJ6qqjvCRfohj1n6ucrt5J7jt4
 mJlDU0EipQIASRwr+j482Z6qjn6yO4KGZ6NXkPgEdvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ls42lH
 As9gBZOIsdVGXqxUQvy1f6gbOB9gv3uDCyIBg=; b=JWtHx13aD8KrmXsrmAa3/Q
 jN+20FvmhkWkxVd4AEez/QgHtAMZJ1O5vrv7Of5UxQkjNw7N3jzVvhxgw2/XhxH6
 MKvYFTb6ijKLypbX8HRDdvWN+4KeTZc+sha51QxSPg1UTW1r8iS8Da908QAwbQNV
 gHGl7Mf3n7v5YJCtIHfp1qkVzc5ao2LQNJtQgjElwT4vtQL5dDcey3r7C+jxfLJ4
 tTLjnzGjR9WM9WdoZnfrw8+SlZbsbawx/HpuGTSguznvTOx1w0bZrHwjSFVrqnn5
 fYYzI0epC/85HcDZM/1uQk15M77kpP6lMuJRv6N444pVM/++TiBb4+t30TNzHY6A
 ==
X-ME-Sender: <xms:ulSBYbo0JB6YkWezlQORanMiLgQksc-Z-hfGS1JV3bPxb83RzD7Q9g>
 <xme:ulSBYVqrN4zLxx2hcnzSaAq58UqJEVxHSDe0-cdJJI-cgMT4cZItW0ImMmGVynLwQ
 QcIUVRznB6vK15oko4>
X-ME-Received: <xmr:ulSBYYMp_7GW2DTw-rRwj97zwQWZINXpor-sY4xjzzwg7GO74H3beAjOyDv6dONAIR-0ky9x2egrItD3tswr5p4NAsO9Z5lYgPpkFJq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ulSBYe7Klywsj3H8rO0BZ6qyJe4QPnnnPtlvWTibi8ORNcU09NTLQQ>
 <xmx:ulSBYa7_nhARWMM8vK69Rd2GDFXrhyVAIW1WVhPIR6sZZ1p-udHtmw>
 <xmx:ulSBYWjNtwZk7DVlnsGrCqT46_P4G0f97XpALyu3ryINuihiyCinNg>
 <xmx:ulSBYct4J1emakOHen1h8kSCy0Sxqrw00yvXQhQYFM6k94b_hVa68w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:09:46 -0400 (EDT)
Date: Tue, 2 Nov 2021 16:09:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] drm/sun4i: fix unmet dependency on RESET_CONTROLLER for
 PHY_SUN6I_MIPI_DPHY
Message-ID: <20211102150944.h7ycdzlm4s5kvk4j@gilmour>
References: <20211028221327.17984-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sdgbi7nuhb2tf3wq"
Content-Disposition: inline
In-Reply-To: <20211028221327.17984-1-julianbraha@gmail.com>
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
Cc: airlied@linux.ie, fazilyildiran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, jernej.skrabec@gmail.com,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sdgbi7nuhb2tf3wq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 28, 2021 at 06:13:27PM -0400, Julian Braha wrote:
> When PHY_SUN6I_MIPI_DPHY is selected, and RESET_CONTROLLER
> is not selected, Kbuild gives the following warning:
>=20
> WARNING: unmet direct dependencies detected for PHY_SUN6I_MIPI_DPHY
>   Depends on [n]: (ARCH_SUNXI [=3Dn] || COMPILE_TEST [=3Dy]) && HAS_IOMEM=
 [=3Dy] && COMMON_CLK [=3Dy] && RESET_CONTROLLER [=3Dn]
>   Selected by [y]:
>   - DRM_SUN6I_DSI [=3Dy] && HAS_IOMEM [=3Dy] && DRM_SUN4I [=3Dy]
>=20
> This is because DRM_SUN6I_DSI selects PHY_SUN6I_MIPI_DPHY
> without selecting or depending on RESET_CONTROLLER, despite
> PHY_SUN6I_MIPI_DPHY depending on RESET_CONTROLLER.
>=20
> These unmet dependency bugs were detected by Kismet,
> a static analysis tool for Kconfig. Please advise if this
> is not the appropriate solution.
>=20
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index 5755f0432e77..3f70a14a3c94 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -46,6 +46,7 @@ config DRM_SUN6I_DSI
>  	default MACH_SUN8I
>  	select CRC_CCITT
>  	select DRM_MIPI_DSI
> +  select RESET_CONTROLLER

The indentation is off, can you fix it and resend it?

Maxime

--sdgbi7nuhb2tf3wq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYFUuAAKCRDj7w1vZxhR
xdQVAQCEOb8We3hYtT3mqkzFKDO4114iJbKGuP+0OpjI3IatWwD/dQ/ShFBmVkCN
VR9uV82ZNKb6qsodk3xIjJPhbE8+Pw4=
=2Lra
-----END PGP SIGNATURE-----

--sdgbi7nuhb2tf3wq--
