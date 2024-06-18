Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E9590C523
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F61310E5DA;
	Tue, 18 Jun 2024 09:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sr83rjq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF2A10E5DA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:03:19 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so48671861fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718701397; x=1719306197; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8Ffhid/tBrPdxJ9K4GUEBHG+XV/ic/YFob6ya2KAGl4=;
 b=Sr83rjq7fLPNniH5EzFFOhZVJ+Nxa7FaO1Bab1gkuhodgtOgjrL0Z29s+trzZGyO6K
 DNHBB3ljH/C6jiMNj4RKr2LoBhZUnyFwLN3WIyUG8EJFHt4xwihX6HKb6f7pdyWk1XeC
 b2+FCiPKGZ7PS4b4x0dXabDftBKKtuhYRJBNJvYtNBjnRlrVD/qqy0L5OGsc9j28NJXD
 Bxf3MqTul55x/88QVULipI5XpkkOQYwOmH8GQFIPRlSoslt2XL0mWmikqC/KTP4ZcjVS
 r5cWl+mwF0pTiOO+bM0fpPMIHuhc4OY2Xa/QlrnVyf/4vxHfgAL814xDK/ZlcAZeJbzA
 eUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718701397; x=1719306197;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Ffhid/tBrPdxJ9K4GUEBHG+XV/ic/YFob6ya2KAGl4=;
 b=CEPt5NOu1JFVxw+RzarGT+elBE+uXMn9tI7pu4Aa6wM8GhAlzeyIQowKhJ6Oq/2Dyl
 UbbBqnDBVKt2Qo8fFtLw1R77NE3Ma/Qp7DQ3bWAXea8JkbhxmAsqfpUtjsL0y1FxFZsG
 tbuqjP18TD01uZOKqTY7Mx80uXdpsiGYXHcPxcIxYcn6d5e2WySLrZoOk9Ap9Yo8U1Cj
 5PGHHkbpDK2y3n2E1zuCdw+QlSWr5LUZ3mLicFy2VeYGe2numc24bMOhOBJs7SKbna3e
 buHixFGMDJ4yr7Ur4pN9phK8oy2hXGT/m9ldvE5OezXE5EAPYMeQnfx/YuRRhr1Dm8or
 7w8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/JdBJNyg/sqUz7CqaJATBkBeo8Flcc/UZl682OepB2J9BUfuMm5wrJZD9KUhEtIPO+VlbgoPgiolZqLqej3mWl/lafZlr9xFNHANd0yTp
X-Gm-Message-State: AOJu0YwH2GwHsEQ/ocTChWM9NQbFKDaX0/VobaxAfnH1TOKANayAAhas
 91/lTm0qOeArW5SntFBhzgtrOaq5r3E8ZQ3mygoEAyKI0xBNym+7RDhQqRQYKkE=
X-Google-Smtp-Source: AGHT+IEhCUvJr+a6y/HVPFNPVtdpiW5Ti409wW012CK56IkXpp4YYWVu+RHIYQY0ldZdVNtWnsp98g==
X-Received: by 2002:a2e:b0d4:0:b0:2eb:fdc3:c2ea with SMTP id
 38308e7fff4ca-2ec0e5d1421mr70585891fa.30.1718701396947; 
 Tue, 18 Jun 2024 02:03:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec079379casm15908771fa.124.2024.06.18.02.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:03:16 -0700 (PDT)
Date: Tue, 18 Jun 2024 12:03:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 mripard@kernel.org, linux-kernel@vger.kernel.org, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, spanda@codeaurora.org, a-bhatia1@ti.com, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Fix
 ti_sn_bridge_set_dsi_rate function
Message-ID: <k4t7zcvweap6e3fqrcixu7szqtvykn3nnqryyd3hdybhhufcgk@snimim34rrwh>
References: <20240618081418.250953-1-j-choudhary@ti.com>
 <20240618081418.250953-3-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618081418.250953-3-j-choudhary@ti.com>
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

On Tue, Jun 18, 2024 at 01:44:18PM GMT, Jayesh Choudhary wrote:
> During code inspection, it was found that due to integer calculations,
> the rounding off can cause errors in the final value propagated in the
> registers.
> Considering the example of 1080p (very common resolution), the mode->clock
> is 148500, dsi->lanes = 4, and bpp = 24, with the previous logic, the DSI
> clock frequency would come as 444 when we are expecting the value 445.5
> which would reflect in SN_DSIA_CLK_FREQ_REG.
> So move the division to be the last operation where rounding off will not
> impact the register value.

Should this division use DIV_ROUND_UP instead? DIV_ROUND_CLOSEST?

> 
> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Fixes should go before feature patches. Please change the order of you
patches for the next submission.

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index d13b42d7c512..5bf12af6b657 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -111,8 +111,6 @@
>  #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
>  #define  AUX_IRQ_STATUS_NAT_I2C_FAIL		BIT(6)
>  
> -#define MIN_DSI_CLK_FREQ_MHZ	40
> -
>  /*
>   * NOTE: DSI clock frequency range: [40MHz,755MHz)
>   * DSI clock frequency range is in 5-MHz increments
> @@ -1219,19 +1217,21 @@ static int ti_sn_bridge_atomic_check(struct drm_bridge *bridge,
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	struct drm_display_mode *mode = &crtc_state->mode;
> -	unsigned int bit_rate_mhz, clk_freq_mhz;
> +	unsigned int bit_rate_khz;
>  
>  	/* Pixel clock check */
>  	if (mode->clock > SN65DSI86_MAX_PIXEL_CLOCK_KHZ)
>  		return -EINVAL;
>  
> -	bit_rate_mhz = (mode->clock / 1000) *
> +	bit_rate_khz = mode->clock *
>  			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> -	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
>  
> -	/* for each increment in dsi_clk_range, frequency increases by 5MHz */
> -	pdata->dsi_clk_range = (MIN_DSI_CLK_FREQ_MHZ / 5) +
> -		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
> +	/*
> +	 * For each increment in dsi_clk_range, frequency increases by 5MHz
> +	 * and the factor of 1000 comes from kHz to MHz conversion
> +	 */
> +	pdata->dsi_clk_range = (bit_rate_khz /
> +				(pdata->dsi->lanes * 2 * 1000 * 5)) & 0xFF;
>  
>  	/* SN_DSIA_CLK_FREQ_REG check */
>  	if (pdata->dsi_clk_range > MAX_DSI_CLK_RANGE ||
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
