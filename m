Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE6B5720F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 09:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502610E2BF;
	Mon, 15 Sep 2025 07:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iuX7y5CG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550F810E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 07:57:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E2157445DA;
 Mon, 15 Sep 2025 07:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E55C4CEF1;
 Mon, 15 Sep 2025 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757923040;
 bh=q/0U/158AZ4ADjs4BrXmACq7kZLr07vkwdPfqFBcMzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iuX7y5CGUnEbwMbYWFJXOA4GdJRIdIbN75rGnSyYcpoosTOrP8OdtFQUV9eNkwTy+
 sEmLRzbTQSdtRaLTZPORboynAS0OtUkYHaP1b2fJxaRdHBJl37Ys87+eAOjVbWoVb9
 X0PPlEBMK5faNzB0w6seT9mJnAmnpSbYOnesXHivJr1V9ynxTsiWxr+PEJWzGSBC7Q
 9bq9umeEyyetWJa7CoiAszF0K0xkNDfVKexnWcf+SL+hqqwQquTTtzkY8KeJUZr9EI
 tLxM3unljELz6LQ29GQN08plyGPYQkDitNldsIO1UVZf8daIHtcv+nDB2NcpTmCnGK
 vm5gO5qEBvSrg==
Date: Mon, 15 Sep 2025 09:57:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 
 aradhya.bhatia@linux.dev, h-shenoy@ti.com, devarsht@ti.com, vigneshr@ti.com, 
 praneeth@ti.com, u-kumar1@ti.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] drm/tidss: oldi: Add atomic_check hook for oldi
 bridge
Message-ID: <20250915-benevolent-military-penguin-d64871@penduick>
References: <20250911110715.2873596-1-s-jain1@ti.com>
 <20250911110715.2873596-4-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="el2eopg2lseizadf"
Content-Disposition: inline
In-Reply-To: <20250911110715.2873596-4-s-jain1@ti.com>
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


--el2eopg2lseizadf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 3/3] drm/tidss: oldi: Add atomic_check hook for oldi
 bridge
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 04:37:15PM +0530, Swamil Jain wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
>=20
> Since OLDI consumes DSS VP clock directly as serial clock, mode_valid()
> check cannot be performed in tidss driver which should be checked
> in OLDI driver.
>=20
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Tested-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_oldi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/t=
idss_oldi.c
> index 7ecbb2c3d0a2..ada691839ef3 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -309,6 +309,26 @@ static u32 *tidss_oldi_atomic_get_input_bus_fmts(str=
uct drm_bridge *bridge,
>  	return input_fmts;
>  }
> =20
> +static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *bridge_state,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	struct tidss_oldi *oldi =3D drm_bridge_to_tidss_oldi(bridge);
> +	struct drm_display_mode *adjusted_mode;
> +	unsigned long round_clock;
> +
> +	adjusted_mode =3D &crtc_state->adjusted_mode;
> +	round_clock =3D clk_round_rate(oldi->serial, adjusted_mode->clock * 7 *=
 1000);
> +	/*
> +	 * To keep the check consistent with dispc_vp_set_clk_rate(),
> +	 * we use the same 5% check here.
> +	 */
> +	if (dispc_pclk_diff(adjusted_mode->clock * 7 * 1000, round_clock) > 5)
> +		return -EINVAL;
> +	return 0;
> +}
> +

If you're introducing that check to tidss, please use .5% like everyone
else. I understand that you don't want to change tilcdc to avoid any
regression, but that's not the case here

Maxime

--el2eopg2lseizadf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMfG3QAKCRAnX84Zoj2+
dldJAYCiEHV1ceEiTFu359foivjBu67853uO4czf5z0Te8gaOhblPP4a6Cemo1rV
qsP942MBfRlns+YcsJXk61kQgM7IhxPRgQoyJQwMIx0DT5eAg1Rs0dwbLSkJmj5T
4SHdn+i6bw==
=R9ZU
-----END PGP SIGNATURE-----

--el2eopg2lseizadf--
