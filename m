Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE2D7F2B03
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 11:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D91410E2AD;
	Tue, 21 Nov 2023 10:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB6710E2AD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 10:53:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1A46BCE172A;
 Tue, 21 Nov 2023 10:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2865C433C7;
 Tue, 21 Nov 2023 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700564022;
 bh=dren9rtZs9LoxdyXhjp4Yyp5NRZDlU/F6eRzv4F54hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k63wyvGgRqnzOXqid2+ftKU7DiGmT8uiPkGtucMbve/LxjKauljxQaRJm4wvJsvnn
 tutRm8pjX4++vubxjXub9NwK0JD7TPdrAhJtvwNRhkORceablc64xTOzoJTQVPZwHo
 VKDcQ4AHXU9WuYYQomdVBI/3M3UIHWzz42pEnCgAXgcxS1ZVuW6CG8T3rO6U/DFzd4
 P1Sf7Hcejk9dMU1lI7P56PzuceLazAhZvhRvT37PH+wXRFSHux8vc0TGAtY6hZrhq0
 na+Jl0+pEGi075Dtkbg27trOZDOWHHTwBesO9goMqdfuEGJHaLK/zjreZNY7JNIb/z
 LyCVGWAtyYhNg==
Date: Tue, 21 Nov 2023 11:53:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm/bridge: imx93-mipi-dsi: Fix a couple of building
 warnings
Message-ID: <impubwywuxcqvgs45klgycxahkzryxg7l5efyqhuvmhlf3t4ah@7hn7ganoy5tb>
References: <20231121085644.499520-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vg7wmxfcfxtenah6"
Content-Disposition: inline
In-Reply-To: <20231121085644.499520-1-victor.liu@nxp.com>
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vg7wmxfcfxtenah6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 04:56:44PM +0800, Liu Ying wrote:
> Fix a couple of building warnings on used uninitialized 'best_m' and
> 'best_n' local variables by initializing them to zero.  This makes compil=
er
> happy only.  No functional change.
>=20
> Fixes: ce62f8ea7e3f ("drm/bridge: imx: Add i.MX93 MIPI DSI support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311151746.f7u7dzbZ-lkp@i=
ntel.com/
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/imx/imx93-mipi-dsi.c
> index 3ff30ce80c5b..7b3b4f985098 100644
> --- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> @@ -226,8 +226,8 @@ dphy_pll_get_configure_from_opts(struct imx93_dsi *ds=
i,
>  	unsigned long fout;
>  	unsigned long best_fout =3D 0;
>  	unsigned int fvco_div;
> -	unsigned int min_n, max_n, n, best_n;
> -	unsigned long m, best_m;
> +	unsigned int min_n, max_n, n, best_n =3D 0;
> +	unsigned long m, best_m =3D 0;
>  	unsigned long min_delta =3D ULONG_MAX;
>  	unsigned long delta;
>  	u64 tmp;

N is a divider, so it would probably be better to initialize it to
UINT_MAX to avoid any divide-by-0 error.

Maxime

--vg7wmxfcfxtenah6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVyMMwAKCRDj7w1vZxhR
xTzNAP0aunK++Ez852vyYy+z6DvU89U7tbf+ixw9snVecp4TkwEA7zsiF1h1VoK7
CqzPhnqzP9snBdZ1jC/P01nwLUG19Qg=
=Yh6I
-----END PGP SIGNATURE-----

--vg7wmxfcfxtenah6--
