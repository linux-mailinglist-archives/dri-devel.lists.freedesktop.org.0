Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2FD9D5FC4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 14:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A16510E136;
	Fri, 22 Nov 2024 13:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iYJwWj1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDED10E136
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 13:33:03 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53dd9e853ccso173424e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 05:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732282381; x=1732887181; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EEcG+dMcmJq0IOWJmVDF4UQJkEEbhvmR8PakfOlzKR0=;
 b=iYJwWj1/VzoqF2RJdp9q/+lV40FvV+peYqZydF1gwGYGBQk34WfdSUigdYiO79Ra7c
 S1R71BLiWAtx94HfcukGePdIKuurwEh6S2e0ascB1EkcOdJdPvMYo3v22KRyUPMIjTJd
 Y6j2hvlvM/ju9SG8HDQnXjKi378/xlpRYIlxey2SsmSeYn21qvyjlrE6hK/EfGtOk38C
 wMd6tXCStHJhs5k/aAfGzBHPleDxTzJqG8rJ/LrnUWbbbrPtgOq3wEpAOD9CZu0KlBav
 qRDGcg/RIZYlXLgg6SjCDtLL2uR2JxkLyLrnmUVDMnPIIfGavoHa4WQ0w9nvxqPaJImQ
 oYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732282381; x=1732887181;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEcG+dMcmJq0IOWJmVDF4UQJkEEbhvmR8PakfOlzKR0=;
 b=iVPG2RQS5lXrfqFR9mfX+3qIll37gxUIGGywsLKc9WqTrh5XjV8wXHR9wlvPlNchYl
 IzbJSf5a3J0UZeGiiGaN72d/ll6FyOL6ElrRvGCzqmR+3oeTOUm+ZPXBSkhOHMX5FV2c
 IU8IBkPw4kgLKcUIxrYyw4K/xvwVr7jFz83xziZqIZGU+qZR4nbC+n737AEx+X/bkXj4
 oEYQy6PBHUDfJcDUhSS4brWMMk5KIth73npUIk91Typ2iy4CnTGI/jj3yJp14kOTkxWl
 UbS6lGnhpXMXgu/2N+21jE10/kyuFOwrVAJMX384TY1ZIGd8dzBBI/LZff2MUaIQa6EC
 SxQA==
X-Gm-Message-State: AOJu0YwD/ZIC+FsqknGyFR8B424yqWzdPaGCY2eaElpgQHCBRng83Oef
 F0ogUf4Nxcpiar9pesKf5jeUygSCNZ/ECZRYyGyjkpd3y1xlQw0HkNFRKXijjak=
X-Gm-Gg: ASbGncvE/kih8EjiIWfdjwoz1JjJZhjBr4HTGik7UcNpCq3o23oxBcYJB95KjikyPGy
 AMbKaBr5Z7YimO0wbnOHz/6ako/guVCkkNSca8zV3UizEn1oeF8DL+ZTYmjU8HMpfqYRsThlWrb
 O5C2E6BmLePJlj5XyuOO6CBLUoiEEZc2AaL3NlJV14oxZhJfDejJVV3uKCwWD7pIfZaMrQj2GgM
 rD3DkTJEwj3+xTTVkUks8QrCvCcNya+Rw2ruJfMPoUKWBYdmkfoG5Ur3r9kRqnWzswMlCPhzCx+
 SGIP5XRQ8MwAxODPLEMhqUE2R8hqww==
X-Google-Smtp-Source: AGHT+IEmyblNqdO7uCDZebJn19X3oxSoSOelm1d4S/6EdmC4yX1jWtpI4kBpn0FiS8edjTWdu7LwGQ==
X-Received: by 2002:a05:6512:3a8e:b0:53d:abc8:b6dc with SMTP id
 2adb3069b0e04-53dd35a53f1mr1573333e87.6.1732282381397; 
 Fri, 22 Nov 2024 05:33:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd876bbbdsm130473e87.194.2024.11.22.05.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 05:33:00 -0800 (PST)
Date: Fri, 22 Nov 2024 15:32:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
Message-ID: <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112020737.335297-2-marex@denx.de>
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

On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
> The Pixel PLL is not very capable and may come up with wildly inaccurate
> clock. Since DPI panels are often tolerant to slightly higher pixel clock
> without being operated outside of specification, calculate two Pixel PLL
> from either mode clock or display_timing .pixelclock.max , whichever is
> higher. Since the Pixel PLL output clock frequency calculation always
> returns lower frequency than the requested clock frequency, passing in
> the higher clock frequency should result in output clock frequency which
> is closer to the expected pixel clock.
> 
> For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
> without this patch is 65 MHz which is out of the panel specification of
> 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
> the specification and far more accurate.

Granted that most of the panel drivers do not implement get_timings()
and granted that there are no current users of that interface, I think
we should move away from it (and maybe even drop it completely from
drm_panel).

What about achieving the same via slightly different approach: register
a non-preferred mode with the clock equal to the max clock allowed. The
bridge driver can then use the default and the "max" mode to select PLL
clock.

I understand that this suggestion doesn't follow the DPI panel
specifics, which are closer to the continuous timings rather than fixed
set of modes, however I really don't think that it's worth keeping the
interface for the sake of a single driver. Original commit 2938931f3732
("drm/panel: Add display timing support") from 2014 mentions using those
timings for .mode_fixup(), but I couldn't find a trace of the
corresponding implementation.

Another possible option might be to impletent adjusting modes in
.atomic_check() / .mode_fixup().

> 
> Keep the change isolated to DPI output.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
> V2: - Isolate the change to DPI only, split tc_bridge_mode_set()
>     - Look up display_timings and use .pixelclock.max as input
>       into the PLL calculation if available. That should yield
>       more accurate results for DPI panels.
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 47 +++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 0d523322fdd8e..fe9ab06d82d91 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -39,6 +39,8 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  
> +#include <video/display_timing.h>
> +
>  /* Registers */
>  
>  /* DSI D-PHY Layer registers */
> @@ -1681,13 +1683,33 @@ static int tc_dpi_atomic_check(struct drm_bridge *bridge,
>  			       struct drm_crtc_state *crtc_state,
>  			       struct drm_connector_state *conn_state)
>  {
> +	u32 mode_clock = crtc_state->mode.clock * 1000;
>  	struct tc_data *tc = bridge_to_tc(bridge);
> -	int adjusted_clock = 0;
> +	struct drm_bridge *nb = bridge;
> +	struct display_timing timings;
> +	struct drm_panel *panel;
> +	int adjusted_clock;
>  	int ret;
>  
> +	do {
> +		if (!drm_bridge_is_panel(nb))
> +			continue;
> +
> +		panel = drm_bridge_get_panel(nb);
> +		if (!panel || !panel->funcs || !panel->funcs->get_timings)
> +			continue;
> +
> +		ret = panel->funcs->get_timings(panel, 1, &timings);
> +		if (ret <= 0)
> +			break;
> +
> +		if (timings.pixelclock.max > mode_clock)
> +			mode_clock = timings.pixelclock.max;
> +		break;
> +	} while ((nb = drm_bridge_get_next_bridge(nb)));
> +
>  	ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
> -			      crtc_state->mode.clock * 1000,
> -			      &adjusted_clock, NULL);
> +			      mode_clock, &adjusted_clock, NULL);
>  	if (ret)
>  		return ret;
>  
> @@ -1758,9 +1780,18 @@ tc_edp_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static void tc_bridge_mode_set(struct drm_bridge *bridge,
> -			       const struct drm_display_mode *mode,
> -			       const struct drm_display_mode *adj)
> +static void tc_dpi_bridge_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adj)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +
> +	drm_mode_copy(&tc->mode, adj);
> +}
> +
> +static void tc_edp_bridge_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adj)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  
> @@ -1977,7 +2008,7 @@ tc_edp_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
>  	.attach = tc_dpi_bridge_attach,
>  	.mode_valid = tc_dpi_mode_valid,
> -	.mode_set = tc_bridge_mode_set,
> +	.mode_set = tc_dpi_bridge_mode_set,
>  	.atomic_check = tc_dpi_atomic_check,
>  	.atomic_enable = tc_dpi_bridge_atomic_enable,
>  	.atomic_disable = tc_dpi_bridge_atomic_disable,
> @@ -1991,7 +2022,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>  	.attach = tc_edp_bridge_attach,
>  	.detach = tc_edp_bridge_detach,
>  	.mode_valid = tc_edp_mode_valid,
> -	.mode_set = tc_bridge_mode_set,
> +	.mode_set = tc_edp_bridge_mode_set,
>  	.atomic_check = tc_edp_atomic_check,
>  	.atomic_enable = tc_edp_bridge_atomic_enable,
>  	.atomic_disable = tc_edp_bridge_atomic_disable,
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
