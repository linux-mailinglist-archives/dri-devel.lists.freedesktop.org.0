Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5237701E5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DEC10E704;
	Fri,  4 Aug 2023 13:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC67010E704
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:35:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A10F61FFE;
 Fri,  4 Aug 2023 13:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B48C433C9;
 Fri,  4 Aug 2023 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691156115;
 bh=55GKLfQUDd7jd/htYCG3E6Mbp9SgTzcWlvaJcSZqRy4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fYv5dwwduUmp20l4s/RiGDtReNDfaU0i2nKybfHSOEShyjHIZO5UiwcWGoo5NBaiw
 PnBKGVfC8lZYoXBZP8twEI+49N0QPMrEQp7lRfu9yvFuVqmbmACU2HpLuz3+wXL3ZZ
 BbB4G0Ewf0xTPeHTJIilW9g9L9iFhEZXtBa7MYKp+i7oMGtyJSnh5qhDcfch2lvhCy
 z7dUXnMFIJYzxUGeYMm12pA3Pn/qxu+N3xJ2+AOWTK4I4kJD72JoVKASRi/pCmJLgd
 7yZ20Ep3ZXZv7GQy7KxwlUAC/GpMFX6wCQ+7CJXsTtfjgv/2NDSXLq1s60R4iNugbI
 2nrtSSP2AQmHQ==
Date: Fri, 4 Aug 2023 15:35:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v2 3/4] drm/panel: sitronix-st7789v: add support for
 partial mode
Message-ID: <s3fybvufmrmu4mkksbmbxec25nfkwxp5ts5hfk7pgult2aaoyc@724uq3ei3ch7>
References: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
 <20230718-feature-lcd-panel-v2-3-2485ca07b49d@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="narolssei6psadaw"
Content-Disposition: inline
In-Reply-To: <20230718-feature-lcd-panel-v2-3-2485ca07b49d@wolfvision.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--narolssei6psadaw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 03:02:34PM +0200, Michael Riesch wrote:
> The ST7789V controller features support for the partial mode. Here,
> the area to be displayed can be restricted in one direction (by default,
> in vertical direction). This is useful for panels that are partially
> occluded by design. Add support for the partial mode.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 43 ++++++++++++++++++++=
++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu=
/drm/panel/panel-sitronix-st7789v.c
> index 0ded72ed2fcd..ebc9a3bd6db3 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -118,6 +118,9 @@ struct st7789_panel_info {
>  	u32 bus_format;
>  	u32 bus_flags;
>  	bool invert_mode;
> +	bool partial_mode;
> +	u16 partial_start;
> +	u16 partial_end;
>  };
> =20
>  struct st7789v {
> @@ -345,9 +348,14 @@ static enum drm_panel_orientation st7789v_get_orient=
ation(struct drm_panel *p)
>  static int st7789v_prepare(struct drm_panel *panel)
>  {
>  	struct st7789v *ctx =3D panel_to_st7789v(panel);
> -	u8 pixel_fmt, polarity;
> +	u8 mode, pixel_fmt, polarity;
>  	int ret;
> =20
> +	if (!ctx->info->partial_mode)
> +		mode =3D ST7789V_RGBCTRL_WO;
> +	else
> +		mode =3D 0;
> +
>  	switch (ctx->info->bus_format) {
>  	case MEDIA_BUS_FMT_RGB666_1X18:
>  		pixel_fmt =3D MIPI_DCS_PIXEL_FMT_18BIT;
> @@ -487,6 +495,37 @@ static int st7789v_prepare(struct drm_panel *panel)
>  						MIPI_DCS_EXIT_INVERT_MODE));
>  	}
> =20
> +	if (ctx->info->partial_mode) {
> +		u8 area_data[4] =3D {
> +			(ctx->info->partial_start >> 8) & 0xff,
> +			(ctx->info->partial_start >> 0) & 0xff,
> +			((ctx->info->partial_end - 1) >> 8) & 0xff,
> +			((ctx->info->partial_end - 1) >> 0) & 0xff,
> +		};
> +
> +		/* Caution: if userspace ever pushes a mode different from the
> +		 * expected one (i.e., the one advertised by get_modes), we'll
> +		 * add margins.
> +		 */

The comment format is incorrect. Since Neil applied the patches already,
please send a patch to fix it.

Looks good to me otherwise, thanks for sticking up with this :)

Maxime

--narolssei6psadaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMz+iwAKCRDj7w1vZxhR
xXakAPkBwCoM6Xdg4Yxk/nzhw+E46uELeruCkDx9+pXmw0lYbQEAmyRaw6DpdZQR
ymcJ0NxItol7pxU8jgaXkHxCk3J6HAU=
=Lie8
-----END PGP SIGNATURE-----

--narolssei6psadaw--
