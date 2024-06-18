Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A20B90C516
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F00D10E251;
	Tue, 18 Jun 2024 08:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j0Vby+Hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893F010E251
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:59:46 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebd421a931so49151011fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718701185; x=1719305985; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv3e4JRhjiyKiq+/BCg7UVEko8aCXARCf3y5M1sULhc=;
 b=j0Vby+Hk+woWczADnIIneUGl/Path/+Ub4XznpP8yhTR09rnwDSDMMRpmFTnX4tujl
 5cTwDn7ySGj8/f6Ciuj6CdS9Kw0I6kY3wwKzxVF9rlc/kiqV0ouvXrBESoZzBPPXR3tM
 hl8bCI9Srhj5tgFjv5tD2cFI0bsB5cfkGyqdcLM00EX+yTkllIsMq/a7vsPY0FeEa7Bb
 GH8VqfUCycpjK139nD7Ucn2ejzRk/FHiOQvN6/E5AlPgBiUYlcBCXH8N6tUIlZCOADWt
 XVYTlIC2bU01ZG3QfW6LfplfuL9PkI/bInO0wX5TSXlcZbmTpweAUw1UP86fm0jlssrm
 jROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718701185; x=1719305985;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fv3e4JRhjiyKiq+/BCg7UVEko8aCXARCf3y5M1sULhc=;
 b=R4oQlqlyB7LsMRniHJbqs6p8vOo3eAlJ4CsEUqn05CFV9EdV0e1CYXv2kTDFNIJKql
 CpeEx4BV/yJpYyNZuOdiDAcPemA1KAwZG8npMc+1MVnVRzHu+CZJo5Gx4j2SR1vpROai
 DKaPZijdBK0Vtqxs03iSXbfQmFNLoQ+fVVnT954JZb/AQLGNIaah/Ofp9k5amteAxMkH
 JHlJHg7WKp31pyVql0p8Lkbc7Hni5XHybAcWprImkPz1wrUnxoGOOkDv0T1xQinbAM4x
 /jCvXaPaIFnszgp8LUHwzza/gbLvtQ8Ot3+PggPaOmPoqDW79p+H5ACxEqY2TP43QFvL
 cZjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDTCi3A0FaInYthmNRhofuDHuZUkeA8bs0OlF/tDgJPGAE0uU2w9D/BOk4GucLaoHZPTwoGNHsZJWo6h26YTl7Zclx3oyOha4rwfpTUW+D
X-Gm-Message-State: AOJu0YxXJAuhEq7+2BqZmqCwd+90g71Ezv1GNQo08OxuMnvwS7yOn90U
 cSHqXk7J1BcBm8AKFU8pBidLtyauYOe7RNjzh/bzlSAj3LT4iwG0TOoQpxx/31w=
X-Google-Smtp-Source: AGHT+IFBkkdBYmR6cGYeikqpydjZVFKiKCkvsC51A/80Pa0YSrMuQ5aysBlI+NciEeQ7Edaw/2jfaQ==
X-Received: by 2002:a2e:9b54:0:b0:2eb:dc13:2d6b with SMTP id
 38308e7fff4ca-2ec0e5c57a5mr73189251fa.13.1718701184574; 
 Tue, 18 Jun 2024 01:59:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c8a72bsm16142861fa.115.2024.06.18.01.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:59:44 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:59:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 mripard@kernel.org, linux-kernel@vger.kernel.org, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, spanda@codeaurora.org, a-bhatia1@ti.com, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Add atomic_check hook
 for the bridge
Message-ID: <r5szraxdqfs4v4hnvqgx6tbmc5e5ew5ljyf5xlaobywm55bohy@6kygxenn2tvd>
References: <20240618081418.250953-1-j-choudhary@ti.com>
 <20240618081418.250953-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618081418.250953-2-j-choudhary@ti.com>
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

On Tue, Jun 18, 2024 at 01:44:17PM GMT, Jayesh Choudhary wrote:
> Add the atomic_check hook to ensure that the parameters are within the
> valid range.
> As of now, dsi clock freqency is being calculated in bridge_enable but
> this needs to be checked in atomic_check which is called before
> bridge_enable so move this calculation to atomic_check and write the
> register value in bridge_enable as it is.
> 
> For now, add mode clock check for the max resolution supported by the
> bridge as mentioned in the SN65DSI86 datasheet[0] and dsi clock range
> check for SN_DSIA_CLK_FREQ_REG.
> According to the datasheet[0], the minimum value for that reg is 0x08
> and the maximum value is 0x96. So add check for that.
> 
> [0]: <https://www.ti.com/lit/gpn/sn65dsi86>
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 65 +++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 84698a0b27a8..d13b42d7c512 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -113,6 +113,20 @@
>  
>  #define MIN_DSI_CLK_FREQ_MHZ	40
>  
> +/*
> + * NOTE: DSI clock frequency range: [40MHz,755MHz)
> + * DSI clock frequency range is in 5-MHz increments
> + * So [40MHz,45MHz) translates to 0x08 (min value)
> + * And [750MHz,755MHz) translates to 0x96 (max value)
> + */
> +#define MIN_DSI_CLK_RANGE	0x8
> +#define MAX_DSI_CLK_RANGE	0x96
> +
> +/* Pixel clock to support max resolution (4K@60Hz) supported
> + * by the bridge.
> + */
> +#define SN65DSI86_MAX_PIXEL_CLOCK_KHZ 600000
> +
>  /* fudge factor required to account for 8b/10b encoding */
>  #define DP_CLK_FUDGE_NUM	10
>  #define DP_CLK_FUDGE_DEN	8
> @@ -191,6 +205,7 @@ struct ti_sn65dsi86 {
>  	u8				ln_polrs;
>  	bool				comms_enabled;
>  	struct mutex			comms_mutex;
> +	u32				dsi_clk_range;
>  
>  #if defined(CONFIG_OF_GPIO)
>  	struct gpio_chip		gchip;
> @@ -820,24 +835,6 @@ static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
>  	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
>  }
>  
> -static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
> -{
> -	unsigned int bit_rate_mhz, clk_freq_mhz;
> -	unsigned int val;
> -	struct drm_display_mode *mode =
> -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> -
> -	/* set DSIA clk frequency */
> -	bit_rate_mhz = (mode->clock / 1000) *
> -			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> -	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
> -
> -	/* for each increment in val, frequency increases by 5MHz */
> -	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
> -		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
> -	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> -}
> -
>  static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
>  {
>  	if (connector->display_info.bpc <= 6)
> @@ -1104,7 +1101,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
>  			   pdata->ln_polrs << LN_POLRS_OFFSET);
>  
>  	/* set dsi clk frequency value */
> -	ti_sn_bridge_set_dsi_rate(pdata);
> +	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, pdata->dsi_clk_range);
>  
>  	/*
>  	 * The SN65DSI86 only supports ASSR Display Authentication method and
> @@ -1215,6 +1212,35 @@ static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
>  	return drm_edid_read_ddc(connector, &pdata->aux.ddc);
>  }
>  
> +static int ti_sn_bridge_atomic_check(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state)
> +{
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +	struct drm_display_mode *mode = &crtc_state->mode;
> +	unsigned int bit_rate_mhz, clk_freq_mhz;
> +
> +	/* Pixel clock check */
> +	if (mode->clock > SN65DSI86_MAX_PIXEL_CLOCK_KHZ)
> +		return -EINVAL;
> +
> +	bit_rate_mhz = (mode->clock / 1000) *
> +			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
> +
> +	/* for each increment in dsi_clk_range, frequency increases by 5MHz */
> +	pdata->dsi_clk_range = (MIN_DSI_CLK_FREQ_MHZ / 5) +
> +		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);

atomic_check might be called several times, it might be called to test
the state. As such, it should not modify anything outside of the
state variables.

> +
> +	/* SN_DSIA_CLK_FREQ_REG check */
> +	if (pdata->dsi_clk_range > MAX_DSI_CLK_RANGE ||
> +	    pdata->dsi_clk_range < MIN_DSI_CLK_RANGE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.detach = ti_sn_bridge_detach,
> @@ -1228,6 +1254,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_check = ti_sn_bridge_atomic_check,
>  };
>  
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
