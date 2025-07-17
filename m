Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42184B0916B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D60E10E84F;
	Thu, 17 Jul 2025 16:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PIAOeFY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E20610E859
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:10:42 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DA961E74;
 Thu, 17 Jul 2025 18:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1752768607;
 bh=/BmbmWut1ae4ZJBbXEEUyjvF2qnjpnN1fAlZtLxpPxE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PIAOeFY309NfsGDRw7BCbRKS8KZKTGWjCsmR93+TYIxnFMvW5+4WeFKiRd00TJSWl
 em6KG0CjssgtCdxryIZhJeOQGNszZwU9XOFXxiu5AHlIZYZYVCUxYlI/JkZh4nKJZ9
 h8Cjfr8ZBgnSqGIzG7SJ4kZcr0o/a2xXlWbvjakI=
Message-ID: <8cd9d1c4-2e9f-4766-b224-21925c4f991d@ideasonboard.com>
Date: Thu, 17 Jul 2025 19:10:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/tidss: Remove max_pclk_khz from tidss display
 features
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org,
 jyri.sarha@iki.fi, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, devarsht@ti.com,
 mwalle@kernel.org
References: <20250704094851.182131-1-j-choudhary@ti.com>
 <20250704094851.182131-3-j-choudhary@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250704094851.182131-3-j-choudhary@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 04/07/2025 12:48, Jayesh Choudhary wrote:
> TIDSS hardware by itself does not have variable max_pclk for each VP.
> The maximum pixel clock is determined by the limiting factor between
> the functional clock and the PLL (parent to the VP/pixel clock).

I'm sorry, what does that mean? "limiting factor between the func clock
and the PLL"?.

> The limitation that has been modeled till now comes from the clock
> (PLL can only be programmed to a particular max value). Instead of
> putting it as a constant field in dispc_features, we can query the
> DM to see if requested clock can be set or not and use it in

DM? Yes, I know what you mean with it, but I feel it's just extra
obfuscation here. You use clk_round_rate() to see if the requested rate
can be used.

> "mode_valid()".

Why quotes?

> Replace constant "max_pclk_khz" in dispc_features with "curr_max_pclk"

Here it's "curr", below "cur". In the patch it looks to be
curr_max_pclk. Just use "current_max_pclk".

However, I would perhaps do a few changes here: We can as well store the
highest rate we have called clk_round_rate() with. So, maybe fields
named: max_successful_rate[vp] and max_attempted_rate[vp]. In
check_pixel_clock() you can first check the max_successful_rate. If
requested rate is lower, return 0. Then check max_attempted_rate, and if
requested rate is lower, fail. Otherwise call clk_round_rate().

> in tidss_device structure which would be modified in runtime.
> In mode_valid() call, check if a best frequency match for mode clock
> can be found or not using "clk_round_rate()". Based on that, propagate
> "cur_max_pclk" and query DM again only if the requested mode clock

Here, also, no need to mention DM.

> is greater than cur_max_pclk. (As the preferred display mode is usually
> the max resolution, driver ends up checking the highest clock the first
> time itself which is used in subsequent checks)
> 
> Since TIDSS display controller provides clock tolerance of 5%, we use
> this while checking the curr_max_pclk. Also, move up "dispc_pclk_diff()"
> before it is called.

I'm not sure if that's a good thing to do. Although the function is
called check_pixel_clock(), we're checking if the rate is too high (the
error returned is MODE_CLOCK_HIGH, so maybe the function is misnamed).
So, e.g., if the requested rate is 100MHz, and clk_round_rate() returns
150MHz, the behavior is not correct: we can support higher clocks than
100 MHz, it's just that the requested rate can't be presented exactly
enough.

Perhaps the check_pixel_clock() could just be inline in
dispc_vp_mode_valid().

At the moment we do check for the 5% tolerance in
dispc_vp_set_clk_rate(), but we just print a warning there, and don't
fail. If we do want to fail, I think the correct error code is
MODE_CLOCK_RANGE. However, failing here would be a change of behavior.
In the minimum I would add that check as a separate step, not in this patch.

> This will make the existing compatibles reusable if DSS features are
> same across two SoCs with the only difference being the pixel clock.

That's true, but afaik we don't need that. The reason we need this is
that if a SoC has two DSS instances (of the same DSS IP), but different
PLLs are used, with the current method we'd need separate compatible
strings for the two DSS instances. As the PLL's max rate is external,
not related to the DSS, we need to remove any hardcoded maximums from
the DSS driver and instead as the clock framework for the max.

 Tomi

> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 77 +++++++++++------------------
>  drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
>  drivers/gpu/drm/tidss/tidss_drv.h   |  5 ++
>  3 files changed, 34 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 3f6cff2ab1b2..fb59a6a0f86a 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -58,10 +58,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>  const struct dispc_features dispc_k2g_feats = {
>  	.min_pclk_khz = 4375,
>  
> -	.max_pclk_khz = {
> -		[DISPC_VP_DPI] = 150000,
> -	},
> -
>  	/*
>  	 * XXX According TRM the RGB input buffer width up to 2560 should
>  	 *     work on 3 taps, but in practice it only works up to 1280.
> @@ -144,11 +140,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>  };
>  
>  const struct dispc_features dispc_am65x_feats = {
> -	.max_pclk_khz = {
> -		[DISPC_VP_DPI] = 165000,
> -		[DISPC_VP_OLDI_AM65X] = 165000,
> -	},
> -
>  	.scaling = {
>  		.in_width_max_5tap_rgb = 1280,
>  		.in_width_max_3tap_rgb = 2560,
> @@ -244,11 +235,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>  };
>  
>  const struct dispc_features dispc_j721e_feats = {
> -	.max_pclk_khz = {
> -		[DISPC_VP_DPI] = 170000,
> -		[DISPC_VP_INTERNAL] = 600000,
> -	},
> -
>  	.scaling = {
>  		.in_width_max_5tap_rgb = 2048,
>  		.in_width_max_3tap_rgb = 4096,
> @@ -315,11 +301,6 @@ const struct dispc_features dispc_j721e_feats = {
>  };
>  
>  const struct dispc_features dispc_am625_feats = {
> -	.max_pclk_khz = {
> -		[DISPC_VP_DPI] = 165000,
> -		[DISPC_VP_INTERNAL] = 170000,
> -	},
> -
>  	.scaling = {
>  		.in_width_max_5tap_rgb = 1280,
>  		.in_width_max_3tap_rgb = 2560,
> @@ -376,15 +357,6 @@ const struct dispc_features dispc_am625_feats = {
>  };
>  
>  const struct dispc_features dispc_am62a7_feats = {
> -	/*
> -	 * if the code reaches dispc_mode_valid with VP1,
> -	 * it should return MODE_BAD.
> -	 */
> -	.max_pclk_khz = {
> -		[DISPC_VP_TIED_OFF] = 0,
> -		[DISPC_VP_DPI] = 165000,
> -	},
> -
>  	.scaling = {
>  		.in_width_max_5tap_rgb = 1280,
>  		.in_width_max_3tap_rgb = 2560,
> @@ -441,10 +413,6 @@ const struct dispc_features dispc_am62a7_feats = {
>  };
>  
>  const struct dispc_features dispc_am62l_feats = {
> -	.max_pclk_khz = {
> -		[DISPC_VP_DPI] = 165000,
> -	},
> -
>  	.subrev = DISPC_AM62L,
>  
>  	.common = "common",
> @@ -1347,25 +1315,49 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
>  			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
>  }
>  
> +/*
> + * Calculate the percentage difference between the requested pixel clock rate
> + * and the effective rate resulting from calculating the clock divider value.
> + */
> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
> +{
> +	int r = rate / 100, rr = real_rate / 100;
> +
> +	return (unsigned int)(abs(((rr - r) * 100) / r));
> +}
> +
> +static int check_pixel_clock(struct dispc_device *dispc,
> +			     u32 hw_videoport, unsigned long clock)
> +{
> +	if (clock > dispc->tidss->curr_max_pclk[hw_videoport] &&
> +	    !dispc->tidss->is_oldi_vp[hw_videoport]) {
> +		unsigned long round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
> +
> +		if (dispc_pclk_diff(clock, round_clock) > 5)
> +			return -EINVAL;
> +
> +		dispc->tidss->curr_max_pclk[hw_videoport] = round_clock;
> +	}
> +
> +	return 0;
> +}
> +
>  enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>  					 u32 hw_videoport,
>  					 const struct drm_display_mode *mode)
>  {
>  	u32 hsw, hfp, hbp, vsw, vfp, vbp;
>  	enum dispc_vp_bus_type bus_type;
> -	int max_pclk;
>  
>  	bus_type = dispc->feat->vp_bus_type[hw_videoport];
>  
> -	max_pclk = dispc->feat->max_pclk_khz[bus_type];
> -
> -	if (WARN_ON(max_pclk == 0))
> +	if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
>  		return MODE_BAD;
>  
>  	if (mode->clock < dispc->feat->min_pclk_khz)
>  		return MODE_CLOCK_LOW;
>  
> -	if (mode->clock > max_pclk)
> +	if (check_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
>  		return MODE_CLOCK_HIGH;
>  
>  	if (mode->hdisplay > 4096)
> @@ -1437,17 +1429,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
>  	clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
>  }
>  
> -/*
> - * Calculate the percentage difference between the requested pixel clock rate
> - * and the effective rate resulting from calculating the clock divider value.
> - */
> -unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
> -{
> -	int r = rate / 100, rr = real_rate / 100;
> -
> -	return (unsigned int)(abs(((rr - r) * 100) / r));
> -}
> -
>  int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
>  			  unsigned long rate)
>  {
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 60c1b400eb89..fbfe6e304ac8 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -78,7 +78,6 @@ enum dispc_dss_subrevision {
>  
>  struct dispc_features {
>  	int min_pclk_khz;
> -	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
>  
>  	struct dispc_features_scaling scaling;
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index 82beaaceadb3..5cf21d5f56f2 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -25,6 +25,11 @@ struct tidss_device {
>  	const struct dispc_features *feat;
>  	struct dispc_device *dispc;
>  	bool is_oldi_vp[TIDSS_MAX_PORTS];
> +	/*
> +	 * stores highest pixel clock value found to be valid while checking
> +	 * supported modes for connected display
> +	 */
> +	unsigned long curr_max_pclk[TIDSS_MAX_PORTS];
>  
>  
>  	unsigned int num_crtcs;

