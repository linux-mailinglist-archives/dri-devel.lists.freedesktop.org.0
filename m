Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50548B030A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 09:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0454D1129A7;
	Wed, 24 Apr 2024 07:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gKTHYL64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9631129A7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 07:21:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98DF061890;
 Wed, 24 Apr 2024 07:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B32EC113CE;
 Wed, 24 Apr 2024 07:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713943280;
 bh=gejzVuWBbs/WERJ9LaTFGpunGqbTm4721u2pjEmC5BU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKTHYL64JeM+ohgmxJAKPd2RuwHo3HmQplRv1+DpcgSWHMoiUiOsftam/VHAIIIkJ
 G38mdmJFVDjIIdXL3mtsrFLetGYqsFcbCWSTJS3mEI20HJRlGkDIc9WKcTk2gmcOyW
 zks617G6u9CE/v6dwUq6DSTMfkb782ZgDhcVZPgR00b5yOMCs4Dbry0C5zLwjGVl+A
 odlPGnfynIi93X34NgtJNYd8OYF1FGQ13zG/o8LuFVSh3mDdVHmRh8nPqYMrOSdaXK
 n/cpKRz9K+39tqwO1nq8t+3QYMxNlA2jcy32rRfjllGuWp7J8n6LLrsckq7y/iQxmG
 f38oAyu+xW1qg==
Date: Wed, 24 Apr 2024 09:21:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robert Foss <rfoss@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, 
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/stm: dsi: relax mode_valid clock tolerance
Message-ID: <20240424-famous-fascinating-hyena-8fb3a7@houat>
References: <20240322104732.2327060-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="v3qz7kftr5irttdu"
Content-Disposition: inline
In-Reply-To: <20240322104732.2327060-1-sean@geanix.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v3qz7kftr5irttdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry, my previous review didn't go through.

On Fri, Mar 22, 2024 at 11:47:31AM +0100, Sean Nyekjaer wrote:
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> to reguire the requested and the actual px clock to be within
> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
>=20
> In case for HDMI .5% tolerance is required.
>=20
> Fixes: e01356d18273 ("drm/stm: dsi: provide the implementation of mode_va=
lid()")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/=
dw_mipi_dsi-stm.c
> index d5f8c923d7bc..97936b0ef702 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -322,8 +322,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned =
int lane_mbps,
>  	return 0;
>  }
> =20
> -#define CLK_TOLERANCE_HZ 50
> -
>  static enum drm_mode_status
>  dw_mipi_dsi_stm_mode_valid(void *priv_data,
>  			   const struct drm_display_mode *mode,
> @@ -375,9 +373,10 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
>  		/*
>  		 * Filter modes according to the clock value, particularly useful for
>  		 * hdmi modes that require precise pixel clocks.
> +		 * Check that px_clock is within .5% tolerance.
>  		 */
> -		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
> -		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
> +		if (px_clock_hz < mult_frac(target_px_clock_hz, 995, 1000) ||
> +		    px_clock_hz > mult_frac(target_px_clock_hz, 1005, 1000))
>  			return MODE_CLOCK_RANGE;

I wonder if it's not something that should be made into a helper. We
have a couple of drivers doing it already, so it might be worth creating
a function that checks for a given struct clk pointer and pixel clock if
it's within parameters.

Maxime

--v3qz7kftr5irttdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiiy6AAKCRAnX84Zoj2+
dhSPAX4unsLgg7n5/O2rJ1Xlrd/571ia5c4LJJUra+mfWA8IhYeQMu4sWwT4uRjd
Dgb0KZUBgLBnBIhAxuWQ3eNhMQrD/r7T0Mjb7b77bERge1rc14SEDTgD9BpPn8mG
jmgHEANigw==
=h0FU
-----END PGP SIGNATURE-----

--v3qz7kftr5irttdu--
