Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5869570A1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4575E10E2FD;
	Mon, 19 Aug 2024 16:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="h8igoBR1";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="sfVxY2RP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 453 seconds by postgrey-1.36 at gabe;
 Mon, 19 Aug 2024 16:44:16 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AF610E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1724085400; bh=+zCoPMFInjYt8AFHDAiTkEFqN8mhCEi3TMoPJYqV8jA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8igoBR1ivW1sGG4Dyq34sGQRhLVvDRTqLRNRW3XdKECxEtmkio5BHlLNpjb2ARhq
 NgNKMCqWVhWcCUby6hTQLG6hJMHXpbVP93I0OsSNTiaMVRqsoMGNRqFw6XWzw7dxsr
 oo5UG+YNeJWe7NAYlp+ZZZnSfBu1d2SYgPc7lw9SObo/lYciOpYhz5sN+k0aM8HfvO
 qSHV7PuzbiS7R33Rjf4wl6YvCVwvZbtSkVgy4mOA8moSjEmDi0D4QW54DjTP+sRAKF
 yZld1AVh8r2zzs3mGGfsppYKy0hHptZEIwlj/Vmrb3Zjdl/zXVVPOi3kD6JEt1McFE
 69Nh72sTxB8aQ==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 93D96FB03;
 Mon, 19 Aug 2024 18:36:40 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8fVIPD5aj6Z; Mon, 19 Aug 2024 18:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1724085398; bh=+zCoPMFInjYt8AFHDAiTkEFqN8mhCEi3TMoPJYqV8jA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfVxY2RPUHxopfUr3E6JSLwZDMt9kqCV+SR7rVtIXfYyhNiyKlqT0NijnlWYAvjyi
 1a+/OTB5IXKx+zqYVVdcjyXbdyD/Uwn5IFr77XCnZtiZhdZbg8VbNfPnuga4bIiitx
 d6lUePVNL+7RVtbBlgZDdmIlu7Cu3DsiqwKrVtTJGbtAnClxmnziM070ZJWHUGFIJO
 upcWYSdMiPAg8RRz5oknm1+RRTRNSd8rN/Kd8glHx3V0dUt46OqeJzyFQB4YVhgUpF
 5pCmPoO2n5JQoJf6yU/PvBTzJGU+jpkiEcfWoe0o6hRMVjfu9wDaA10nikBbaq7kff
 CXUPUS3B2FE+Q==
Date: Mon, 19 Aug 2024 18:36:36 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: kernel@puri.sm, neil.armstrong@linaro.org, dianders@chromium.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: mantix-mlaf057we51: transition to mipi_dsi
 wrapped functions
Message-ID: <ZsN0lImmU8PTxuLB@qwark.sigxcpu.org>
References: <20240818072356.870465-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240818072356.870465-1-tejasvipin76@gmail.com>
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

Hi,
On Sun, Aug 18, 2024 at 12:53:56PM +0530, Tejas Vipin wrote:
> Changes the mantix-mlaf057we51 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 79 +++++++------------
>  1 file changed, 27 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index ea4a6bf6d35b..4db852ffb0f6 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -23,7 +23,7 @@
>  
>  /* Manufacturer specific Commands send via DSI */
>  #define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
> -#define MANTIX_CMD_INT_CANCEL           0x4C
> +#define MANTIX_CMD_INT_CANCEL           0x4c
>  #define MANTIX_CMD_SPI_FINISH           0x90
>  
>  struct mantix {
> @@ -45,82 +45,57 @@ static inline struct mantix *panel_to_mantix(struct drm_panel *panel)
>  	return container_of(panel, struct mantix, panel);
>  }
>  
> -static int mantix_init_sequence(struct mantix *ctx)
> +static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>  {
> -	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	struct device *dev = ctx->dev;
> -
>  	/*
>  	 * Init sequence was supplied by the panel vendor.
>  	 */
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> -
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> -	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a);
>  
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> -	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> -	msleep(20);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x03);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xa9, 0x00);
>  
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> -	msleep(20);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x09);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> +	mipi_dsi_msleep(dsi_ctx, 20);
>  
> -	dev_dbg(dev, "Panel init sequence done\n");
> -	return 0;
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xa5);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2f);
> +	mipi_dsi_msleep(dsi_ctx, 20);
>  }
>  
>  static int mantix_enable(struct drm_panel *panel)
>  {
>  	struct mantix *ctx = panel_to_mantix(panel);
> -	struct device *dev = ctx->dev;
> -	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
> -	int ret;
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  
> -	ret = mantix_init_sequence(ctx);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
> -		return ret;
> -	}
> +	mantix_init_sequence(&dsi_ctx);
> +	if (!dsi_ctx.accum_err)
> +		dev_dbg(ctx->dev, "Panel init sequence done\n");
>  
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to exit sleep mode\n");
> -		return ret;
> -	}
> -	msleep(20);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>  
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret)
> -		return ret;
> -	usleep_range(10000, 12000);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 12000);
>  
> -	ret = mipi_dsi_turn_on_peripheral(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to turn on peripheral\n");
> -		return ret;
> -	}
> +	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
>  
> -	return 0;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static int mantix_disable(struct drm_panel *panel)
>  {
>  	struct mantix *ctx = panel_to_mantix(panel);
>  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	int ret;
> -
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "Failed to turn off the display: %d\n", ret);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>  
> -
> -	return 0;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static int mantix_unprepare(struct drm_panel *panel)

Reviewed-by: Guido Günther <agx@sigxcpu.org>

The split out of cleanups as suggested by Neil would be nice though)
Cheers,
 -- Guido

> -- 
> 2.46.0
> 
