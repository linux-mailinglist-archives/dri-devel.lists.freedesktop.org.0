Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A59989B77
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A400C10E3A7;
	Mon, 30 Sep 2024 07:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JBg+Dviw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F6110E10C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:31:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EAF01A4138D;
 Mon, 30 Sep 2024 07:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E221C4CEC7;
 Mon, 30 Sep 2024 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727681493;
 bh=YhK9MVnb7j5WhBPB70Arr1HFN2nVENw6PFRu6sWoH+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JBg+DviwW4KZcSt4aw3rXm+Xi4JK474zqH69w6oxMsVCLNjm42/r14WKQFe3Ke6wB
 swzRJhCvBNrVANQiXr+l3Z/ovAc6I+DzHdNH4hzkNgxFNXLpa1GatKAMQhuiUZal2c
 NTiapZ5l49utnCZgdGVENzTSGbH8uDm/PRdmLy+85atr+e/5H1913ZtBrjeI6rUGNq
 HIHSEWP0D7W6xEF+bKZmoM8ZaFR09FxjczqCybTzvLkd3+mG5YrWRR20UQbfcDE8lT
 ZabrgWaFOLYs5SVbovTxbBRnvPAjA7FfXx2putvJMP2mtjMPoKPFP/3Jo08nmi/tsy
 20iFthhHwkTRw==
Date: Mon, 30 Sep 2024 09:31:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de, 
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de
Subject: Re: [PATCH 4/8] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
Message-ID: <2on4bu5jsxvaxckqz3wouwrf2z6nwbtv34ek4xda2dvobqhbsf@g7z7kxq5xrxi>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rtzanz6gpbkemxsz"
Content-Disposition: inline
In-Reply-To: <20240930052903.168881-5-victor.liu@nxp.com>
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


--rtzanz6gpbkemxsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 01:28:59PM GMT, Liu Ying wrote:
> Multiple display modes could be read from a display device's EDID.
> Use clk_round_rate() to validate the "ldb" clock rate for each mode
> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>=20
> Also, if the "ldb" clock and the pixel clock are sibling in clock
> tree, use clk_round_rate() to validate the pixel clock rate against
> the "ldb" clock.  This is not done in display controller driver
> because drm_crtc_helper_funcs::mode_valid() may not decide to do
> the validation or not if multiple encoders are connected to the CRTC,
> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
> parallel display output simultaneously.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index b559f3e0bef6..ee8471c86617 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/units.h>
> =20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
>  	u32 lvds_ctrl;
>  	bool lvds_en_bit;
>  	bool single_ctrl_reg;
> +	bool ldb_clk_pixel_clk_sibling;
>  };
> =20
>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] =3D {
> @@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[]=
 =3D {
>  	[IMX8MP_LDB] =3D {
>  		.ldb_ctrl =3D 0x5c,
>  		.lvds_ctrl =3D 0x128,
> +		.ldb_clk_pixel_clk_sibling =3D true,
>  	},
>  	[IMX93_LDB] =3D {
>  		.ldb_ctrl =3D 0x20,
>  		.lvds_ctrl =3D 0x24,
>  		.lvds_en_bit =3D true,
> +		.ldb_clk_pixel_clk_sibling =3D true,
>  	},
>  };
> =20
> @@ -269,11 +273,29 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>  		   const struct drm_display_info *info,
>  		   const struct drm_display_mode *mode)
>  {
> +	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
>  	struct fsl_ldb *fsl_ldb =3D to_fsl_ldb(bridge);
> =20
>  	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
>  		return MODE_CLOCK_HIGH;
> =20
> +	/* Validate "ldb" clock rate. */
> +	link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->clock);
> +	if (link_freq !=3D clk_round_rate(fsl_ldb->clk, link_freq))
> +		return MODE_NOCLOCK;
> +
> +	/*
> +	 * Use "ldb" clock to validate pixel clock rate,
> +	 * if the two clocks are sibling.
> +	 */
> +	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
> +		pclk_rate =3D mode->clock * HZ_PER_KHZ;
> +
> +		rounded_pclk_rate =3D clk_round_rate(fsl_ldb->clk, pclk_rate);
> +		if (rounded_pclk_rate !=3D pclk_rate)
> +			return MODE_NOCLOCK;
> +	}
> +

I guess this is to workaround the fact that the parent rate would be
changed, and thus the sibling rate as well? This should be documented in
a comment if so.

Maxime

--rtzanz6gpbkemxsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvpT0gAKCRAnX84Zoj2+
dk4PAX9RKdbNYUzaKe3hmulCJ0qwP1+vLwkjQr20vGEfXsXUQeRrnNzmkVHGe4H9
omV9KkYBgIQacO4mH9ISmfZ+XEpZN1H2pkJIWcQR9cCfeift9Lumau2cxnoRTW6V
VOwv91h/Wg==
=xndf
-----END PGP SIGNATURE-----

--rtzanz6gpbkemxsz--
