Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D1C51647
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFDB10E6DD;
	Wed, 12 Nov 2025 09:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zx/X6FB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C02A10E6DD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:40:17 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9FDE82E;
 Wed, 12 Nov 2025 10:38:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762940296;
 bh=9LemPI6dEBdIsuc+KqTiCA+ZnJqK+WHO49VQMdC44Ik=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zx/X6FB/r2e6LOIW+RoFnufxJAesn1qsZEDLHxmzUE55uzbVJNwJrHbs5p3bKY0w+
 wijsLRhCuw30J/m+4oUCTN1vBfAEmixEgy7EVYVxDp40al6aLIegpKjYkp07dsDVY0
 +OTOBBkzCAijTRHPLVZI0/SEuV3PMh4XIlu2KXXE=
Message-ID: <5fc8eb00-9ecc-494b-8bf3-6239d2a7e1ab@ideasonboard.com>
Date: Wed, 12 Nov 2025 11:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] drm/tidss: Remove max_pclk_khz and min_pclk_khz
 from tidss display features
To: Swamil Jain <s-jain1@ti.com>, aradhya.bhatia@linux.dev, devarsht@ti.com,
 mripard@kernel.org, jyri.sarha@iki.fi, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, h-shenoy@ti.com
Cc: praneeth@ti.com, u-kumar1@ti.com, vigneshr@ti.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251104151422.307162-1-s-jain1@ti.com>
 <20251104151422.307162-2-s-jain1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251104151422.307162-2-s-jain1@ti.com>
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

On 04/11/2025 17:14, Swamil Jain wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> The TIDSS hardware does not have independent maximum or minimum pixel
> clock limits for each video port. Instead, these limits are determined
> by the SoC's clock architecture. Previously, this constraint was
> modeled using the 'max_pclk_khz' and 'min_pclk_khz' fields in
> 'dispc_features', but this approach is static and does not account for
> the dynamic behavior of PLLs.
> 
> This patch removes the 'max_pclk_khz' and 'min_pclk_khz' fields from
> 'dispc_features'. The correct way to check if a requested mode's pixel
> clock is supported is by using 'clk_round_rate()' in the 'mode_valid()'
> hook. If the best frequency match for the mode clock falls within the
> supported tolerance, it is approved. TIDSS supports a 5% pixel clock
> tolerance, which is now reflected in the validation logic.
> 
> This change allows existing DSS-compatible drivers to be reused across
> SoCs that only differ in their pixel clock characteristics. The
> validation uses 'clk_round_rate()' for each mode, which may introduce
> additional delay (about 3.5 ms for 30 modes), but this is generally
> negligible. Users desiring faster validation may bypass these calls
> selectively, for example, checking only the highest resolution mode,
> as shown here[1].
> 
> [1]: https://lore.kernel.org/all/20250704094851.182131-3-j-choudhary@ti.com/
> 
> Tested-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 86 +++++++++++------------------
>  drivers/gpu/drm/tidss/tidss_dispc.h |  3 -
>  2 files changed, 31 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index d0b191c470ca..b11880178cba 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -57,12 +57,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>  };
>  
>  const struct dispc_features dispc_k2g_feats = {
> -	.min_pclk_khz = 4375,
> -
> -	.max_pclk_khz = {
> -		[DISPC_VP_DPI] = 150000,
> -	},
> -
>  	/*
>  	 * XXX According TRM the RGB input buffer width up to 2560 should
>  	 *     work on 3 taps, but in practice it only works up to 1280.
> @@ -145,11 +139,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
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
> @@ -245,11 +234,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
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
> @@ -316,11 +300,6 @@ const struct dispc_features dispc_j721e_feats = {
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
> @@ -377,15 +356,6 @@ const struct dispc_features dispc_am625_feats = {
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
> @@ -442,10 +412,6 @@ const struct dispc_features dispc_am62a7_feats = {
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
> @@ -1333,33 +1299,54 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
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
> +static inline int check_pixel_clock(struct dispc_device *dispc,
> +			     u32 hw_videoport, unsigned long clock)
> +{

Ah... Sorry, I was quite unclear in my comment to v7. I did not mean
mark it as inline. I meant "move it inline", i.e. move this code into
the dispc_vp_mode_valid function. This is just a few lines, and having
it in a separate function makes it a bit more difficult to understand
what are all the checks done in dispc_vp_mode_valid().

I can do that change when applying the patches, if that's ok for you.

 Tomi

> +	unsigned long round_clock;
> +
> +	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
> +	/*
> +	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
> +	 * use the same 5% check here.
> +	 */
> +	if (dispc_pclk_diff(clock, round_clock) > 5)
> +		return -EINVAL;
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
> -	if (mode->clock < dispc->feat->min_pclk_khz)
> -		return MODE_CLOCK_LOW;
> -
> -	if (mode->clock > max_pclk)
> -		return MODE_CLOCK_HIGH;
> -
>  	if (mode->hdisplay > 4096)
>  		return MODE_BAD;
>  
>  	if (mode->vdisplay > 4096)
>  		return MODE_BAD;
>  
> +	if (check_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
> +		return MODE_CLOCK_RANGE;
> +
>  	/* TODO: add interlace support */
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		return MODE_NO_INTERLACE;
> @@ -1423,17 +1410,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
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
> index 60c1b400eb89..42279312dcc1 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -77,9 +77,6 @@ enum dispc_dss_subrevision {
>  };
>  
>  struct dispc_features {
> -	int min_pclk_khz;
> -	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
> -
>  	struct dispc_features_scaling scaling;
>  
>  	enum dispc_dss_subrevision subrev;

