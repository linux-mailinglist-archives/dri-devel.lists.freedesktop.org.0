Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8EAB5959D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA83B10E7B7;
	Tue, 16 Sep 2025 11:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q9cflKHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51A410E7B7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:56:00 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0A63C6F;
 Tue, 16 Sep 2025 13:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1758023681;
 bh=E70mRgsySmWMcNTWDpJAM0GT3t885KA187Y/u1PLE1c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q9cflKHigtXDz5CPYt9E+FQ2kyluKCs73hXPjOPEVab4wQJ3TB56yu7WNZClp71Mf
 i31j8f+KbdXXteWfBJ7oThe8wDX6hYSjCvloYj6Eor16dK6RzIOteKmjz2gNRvhKX3
 aPLaJSM2nP0+W52pKOg3MWL32orQwuaK11mQ+p+0=
Message-ID: <1ad79486-b756-4abf-94c7-ab68c2585a7d@ideasonboard.com>
Date: Tue, 16 Sep 2025 14:55:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/tidss: Remove max_pclk_khz from tidss display
 features:
To: Swamil Jain <s-jain1@ti.com>
Cc: h-shenoy@ti.com, devarsht@ti.com, vigneshr@ti.com, praneeth@ti.com,
 u-kumar1@ti.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jyri.sarha@iki.fi,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, aradhya.bhatia@linux.dev
References: <20250911110715.2873596-1-s-jain1@ti.com>
 <20250911110715.2873596-3-s-jain1@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250911110715.2873596-3-s-jain1@ti.com>
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

On 11/09/2025 14:07, Swamil Jain wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> TIDSS hardware, by itself, does not have variable max pixel clock for
> each VP. The maximum pixel clock is determined by the SoC's clocking
> architecture.
> 
> The limitation that has been modeled until now comes from the SoC's
> clocking architecture (PLL can only be programmed to a particular max
> value). Instead of putting it as a constant field in dispc_features,
> we can use clk_round_rate() to see if requested clock can be set or not.
> 
> Remove the constant "max_pclk_khz" from dispc_features. In mode_valid()
> call, check if a best frequency match for the mode clock can be found
> or not using clk_round_rate().
> 
> Since TIDSS display controller provides clock tolerance of 5%, we use
> this while checking if the requested pixel clock is supported. Also,
> move up dispc_pclk_diff() before it is called.
> 
> This will make the existing compatibles reusable if DSS features are
> the same across two SoCs with the only difference being the pixel clock.
> 
> Note:
> This uses clk_round_rate() to validate all modes and ensure that the
> driver enumerates only those whose clocking requirements are well
> within the tolerance range. However, this incurs a slight delay, as for
> each mode, clk_round_rate() is called, which takes ~100 us. So, for a
> monitor supporting 30 modes, it takes an extra 3.5 ms to do
> clk_round_rate() to enumerate all modes. If the user wants to bypass
> this validation logic, they can manually modify the driver to bypass
> these calls selectively. For example, they can just do a
> clk_round_rate() check for the highest resolution mode and bypass it
> for the rest of the modes, as done here [1].
> 
> [1]: https://lore.kernel.org/all/20250704094851.182131-3-j-choudhary@ti.com/
> 
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Tested-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 78 +++++++++++------------------
>  drivers/gpu/drm/tidss/tidss_dispc.h |  1 -
>  drivers/gpu/drm/tidss/tidss_drv.h   |  1 -
>  3 files changed, 30 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 7c8c15a5c39b..1cd83a6763ba 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -59,10 +59,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
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
> @@ -145,11 +141,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
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
> @@ -245,11 +236,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
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
> @@ -316,11 +302,6 @@ const struct dispc_features dispc_j721e_feats = {
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
> @@ -377,15 +358,6 @@ const struct dispc_features dispc_am625_feats = {
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
> @@ -442,10 +414,6 @@ const struct dispc_features dispc_am62a7_feats = {
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
> @@ -1331,25 +1299,50 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
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
> +	unsigned long round_clock;
> +
> +	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
> +		return 0;
> +	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
> +	/*
> +	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
> +	 * use the same 5% check here.
> +	 */
> +	if (dispc_pclk_diff(clock, round_clock) > 5)
> +		return -EINVAL;
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

Shouldn't we drop the min_pclk_khz too?

 Tomi


> -	if (mode->clock > max_pclk)
> +	if (check_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
>  		return MODE_CLOCK_HIGH;
>  
>  	if (mode->hdisplay > 4096)
> @@ -1421,17 +1414,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
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
> index e1c1f41d8b4b..f82e282e17a7 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -26,7 +26,6 @@ struct tidss_device {
>  	struct dispc_device *dispc;
>  	bool is_ext_vp_clk[TIDSS_MAX_PORTS];
>  
> -
>  	unsigned int num_crtcs;
>  	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
>  

