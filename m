Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294984B61F8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 05:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1DB10E1BB;
	Tue, 15 Feb 2022 04:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4A410E18B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 04:12:44 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 l7-20020a9d6a87000000b005aceba2aea1so7093otq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 20:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QHBlAe1imB9wB10ptbc1elqgvyeO+rwXBHar9R5XADk=;
 b=EonIx2iIoiubRkWH7QB1h3f8w8B4hkUF2P+mFr3NycUcTHfTF6QIILMgWOP7QugdbS
 StwdAChLQhnLdS+XyOhFJhfeYgacHmkqdaADo2AGMUfQyQImtpQdiAhrP9cyGUPsCk3r
 c0ClTYHlIewOoHg5WzKFY8K3qV/TSN7EOjR4jWePl0G+ydZLInzV+vw3YhxnziyCnCwS
 +WDq3Rp84SP6k9AOYciXSahesmnqehou65MIXhLCbh5wOQY0yxO+jStBheom1pFCy6WV
 S2hMNEo530EDTs28n5F4sGzA/T6nOjInxyGMETnQbGn7YlkX1hBeDWRO4j5r84gLosTK
 9lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QHBlAe1imB9wB10ptbc1elqgvyeO+rwXBHar9R5XADk=;
 b=g56BqmXpXXFn4V/K/8gN7Nhm+ldvDjOVYAH57ZCr9ZQE4ATYXRojN4mWD9Lv7Aj9Qj
 IjfZ4yb087UtoXs4FMrXEx9+gWoM+Fl0AbJPVO7WMHcnWFdis4ReZp1fYoFf05IDjnEm
 Gbz721Rp8EBLXPG521kZkSZVH7KPHwdqp81tlBfhkDBsTl6oDLfEWhCMgRyeK/4dN9H4
 Y5TRbiRc+CKjosjWByD6CS1vn0VJnREP3tKB26GIwOh5Prr4uxLBF6t3ogNn7BZlErqd
 UilFImTCXExaxh5kTE+yrfDLllKI3D2zd/OGWWySYPupi379o6u6/ynV8LJ2RL7WQYU1
 tCAg==
X-Gm-Message-State: AOAM532BY3oM4f8SMx6xtYjPArsCS0dNKMs4UTkR7ib0kX7nz13zw9d3
 eIQ2nm8HZxu1Smv8J7gH3MO03Q==
X-Google-Smtp-Source: ABdhPJzlNzV/ez8v3xTrbWZkPBvX158/9VDJYu18ragNQGlZ9CrYxrAF3y/k/r1DMPzf9GD6FAqwMQ==
X-Received: by 2002:a05:6830:2aa1:: with SMTP id
 s33mr746579otu.117.1644898363519; 
 Mon, 14 Feb 2022 20:12:43 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id ek4sm15333559oab.23.2022.02.14.20.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 20:12:42 -0800 (PST)
Date: Mon, 14 Feb 2022 22:12:40 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dp:  revise timing engine programming to
 support widebus feature
Message-ID: <YgsoOP3DegHz9zA8@yoga>
References: <1644878346-28511-1-git-send-email-quic_khsieh@quicinc.com>
 <1644878346-28511-2-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644878346-28511-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 14 Feb 16:39 CST 2022, Kuogee Hsieh wrote:

> Widebus feature will transmit two pixel data per pixel clock to interface.
> Timing engine provides driving force for this purpose. This patch base
> on HPG (Hardware Programming Guide) to revise timing engine register
> setting to accommodate both widebus and non widebus application. Also
> horizontal width parameters need to be reduced by half since two pixel
> data are clocked out per pixel clock when widebus feature enabled.
> 
> Widebus can be enabled individually at DP. However at DSI, widebus have
> to be enabled along with DSC enabled to achieve pixel clock rate be
> scaled down with same ratio as compression ratio when 10 bits per source
> component. Therefore this patch have both widebus and compression covered
> together so tat less efforts will be required when DSC enabled later.
> 
> Changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
> 
> Changes in v3:
> -- split patch into 3 patches
> 
> Changes in v4:
> -- rework timing engine to not interfere with dsi/hdmi
> -- cover both widebus and compression
> 

Even though the change relates to DP, I think it would be appropriate to
change the $subject prefix to "drm/msm/dpu".

When booting sc8180x the bootloader leaves widebus enabled in the eDP
controller, and the two patches takes care of this problem for me. I
also checked the DP still works.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  2 +
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 99 ++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  6 ++
>  5 files changed, 115 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0d315b4..0c22839 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -208,6 +208,8 @@ struct dpu_encoder_virt {
>  
>  	u32 idle_timeout;
>  
> +	bool wide_bus_en;
> +
>  	struct msm_dp *dp;
>  };
>  
> @@ -217,6 +219,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>  	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>  };
>  
> +
> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	return dpu_enc->wide_bus_en;
> +}
> +
>  static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>  {
>  	struct dpu_hw_dither_cfg dither_cfg = { 0 };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 99a5d73..893d74d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -168,4 +168,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
>   */
>  int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
>  
> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc);
> +
>  #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 185379b..2af2bb7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -110,6 +110,20 @@ static void drm_mode_to_intf_timing_params(
>  		timing->v_back_porch += timing->v_front_porch;
>  		timing->v_front_porch = 0;
>  	}
> +
> +	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> +
> +	/*
> +	 * for DP, divide the horizonal parameters by 2 when
> +	 * widebus is enabled
> +	 */
> +	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
> +		timing->width = timing->width >> 1;
> +		timing->xres = timing->xres >> 1;
> +		timing->h_back_porch = timing->h_back_porch >> 1;
> +		timing->h_front_porch = timing->h_front_porch >> 1;
> +		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
> +	}
>  }
>  
>  static u32 get_horizontal_total(const struct intf_timing_params *timing)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 116e2b5..3b9273e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -33,6 +33,7 @@
>  #define INTF_TP_COLOR1                  0x05C
>  #define INTF_CONFIG2                    0x060
>  #define INTF_DISPLAY_DATA_HCTL          0x064
> +#define INTF_ACTIVE_DATA_HCTL           0x068
>  #define INTF_FRAME_LINE_COUNT_EN        0x0A8
>  #define INTF_FRAME_COUNT                0x0AC
>  #define   INTF_LINE_COUNT               0x0B0
> @@ -60,6 +61,14 @@
>  
>  #define   INTF_MUX                      0x25C
>  
> +#define BIT_INTF_CFG_ACTIVE_H_EN	BIT(29)
> +#define BIT_INTF_CFG_ACTIVE_V_EN	BIT(30)
> +
> +#define BIT_INTF_CFG2_DATABUS_WIDEN	BIT(0)
> +#define BIT_INTF_CFG2_DATA_HCTL_EN	BIT(4)
> +#define BIT_INTF_CFG2_DCE_DATA_COMPRESS	BIT(12)
> +
> +
>  static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>  		const struct dpu_mdss_cfg *m,
>  		void __iomem *addr,
> @@ -90,15 +99,23 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  	u32 hsync_period, vsync_period;
>  	u32 display_v_start, display_v_end;
>  	u32 hsync_start_x, hsync_end_x;
> +	u32 hsync_data_start_x, hsync_data_end_x;
>  	u32 active_h_start, active_h_end;
>  	u32 active_v_start, active_v_end;
>  	u32 active_hctl, display_hctl, hsync_ctl;
>  	u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
>  	u32 panel_format;
> -	u32 intf_cfg, intf_cfg2 = 0, display_data_hctl = 0;
> +	u32 intf_cfg, intf_cfg2 = 0;
> +	u32 display_data_hctl = 0, active_data_hctl = 0;
> +	u32 data_width;
> +	bool dp_intf = false;
>  
>  	/* read interface_cfg */
>  	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
> +
> +	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)
> +		dp_intf = true;
> +
>  	hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
>  	p->h_front_porch;
>  	vsync_period = p->vsync_pulse_width + p->v_back_porch + p->height +
> @@ -112,7 +129,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  	hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
>  	hsync_end_x = hsync_period - p->h_front_porch - 1;
>  
> -	if (p->width != p->xres) {
> +	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
> +	display_hctl = (hsync_end_x << 16) | hsync_start_x;
> +
> +	if (p->width != p->xres) { /* border fill added */
>  		active_h_start = hsync_start_x;
>  		active_h_end = active_h_start + p->xres - 1;
>  	} else {
> @@ -130,27 +150,78 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  
>  	if (active_h_end) {
>  		active_hctl = (active_h_end << 16) | active_h_start;
> -		intf_cfg |= BIT(29);	/* ACTIVE_H_ENABLE */
> +		intf_cfg |= BIT_INTF_CFG_ACTIVE_H_EN;
>  	} else {
>  		active_hctl = 0;
>  	}
>  
>  	if (active_v_end)
> -		intf_cfg |= BIT(30); /* ACTIVE_V_ENABLE */
> +		intf_cfg |= BIT_INTF_CFG_ACTIVE_V_EN;
>  
> -	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
> -	display_hctl = (hsync_end_x << 16) | hsync_start_x;
> +	/*
> +	 * DATA_HCTL_EN controls data timing which can be different from
> +	 * video timing. It is recommended to enable it for all cases, except
> +	 * if compression is enabled in 1 pixel per clock mode
> +	 */
> +	if (!p->compression_en || p->wide_bus_en)
> +		intf_cfg2 |= BIT_INTF_CFG2_DATA_HCTL_EN;
> +
> +	if (p->wide_bus_en)
> +		intf_cfg2 |=  BIT_INTF_CFG2_DATABUS_WIDEN;
> +
> +	/*
> +	 * If widebus is disabled:
> +	 * For uncompressed stream, the data is valid for the entire active
> +	 * window period.
> +	 * For compressed stream, data is valid for a shorter time period
> +	 * inside the active window depending on the compression ratio.
> +	 *
> +	 * If widebus is enabled:
> +	 * For uncompressed stream, data is valid for only half the active
> +	 * window, since the data rate is doubled in this mode.
> +	 * p->width holds the adjusted width for DP but unadjusted width for DSI
> +	 * For compressed stream, data validity window needs to be adjusted for
> +	 * compression ratio and then further halved.
> +	 */
> +	data_width = p->width;
> +
> +	if (p->compression_en) {
> +		data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
> +
> +		if (p->wide_bus_en)
> +			data_width >>= 1;
> +	} else if (!dp_intf && p->wide_bus_en) {
> +		data_width = p->width >> 1;
> +	}
> +
> +	hsync_data_start_x = hsync_start_x;
> +	hsync_data_end_x =  hsync_start_x + data_width - 1;
> +
> +	display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
> +
> +	if (dp_intf) {
> +		/* DP timing adjustment */
> +		display_v_start += p->hsync_pulse_width + p->h_back_porch;
> +		display_v_end   -= p->h_front_porch;
>  
> -	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
>  		active_h_start = hsync_start_x;
>  		active_h_end = active_h_start + p->xres - 1;
>  		active_v_start = display_v_start;
>  		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>  
> -		display_v_start += p->hsync_pulse_width + p->h_back_porch;
> -
>  		active_hctl = (active_h_end << 16) | active_h_start;
>  		display_hctl = active_hctl;
> +
> +		intf_cfg |= BIT_INTF_CFG_ACTIVE_H_EN;
> +		intf_cfg |= BIT_INTF_CFG_ACTIVE_V_EN;
> +
> +		if (p->compression_en) {
> +			active_data_hctl = (hsync_start_x +
> +					p->extra_dto_cycles) << 16;
> +			active_data_hctl += hsync_start_x;
> +
> +			display_data_hctl = active_data_hctl;
> +		}
>  	}
>  
>  	den_polarity = 0;
> @@ -180,13 +251,6 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  				(COLOR_8BIT << 4) |
>  				(0x21 << 8));
>  
> -	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> -		intf_cfg2 |= BIT(4);
> -		display_data_hctl = display_hctl;
> -		DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
> -		DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
> -	}
> -
>  	DPU_REG_WRITE(c, INTF_HSYNC_CTL, hsync_ctl);
>  	DPU_REG_WRITE(c, INTF_VSYNC_PERIOD_F0, vsync_period * hsync_period);
>  	DPU_REG_WRITE(c, INTF_VSYNC_PULSE_WIDTH_F0,
> @@ -204,6 +268,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>  	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>  	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> +	DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
> +	DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
> +	DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
>  }
>  
>  static void dpu_hw_intf_enable_timing_engine(
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 3568be8..299c9c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -30,6 +30,12 @@ struct intf_timing_params {
>  	u32 border_clr;
>  	u32 underflow_clr;
>  	u32 hsync_skew;
> +
> +	bool wide_bus_en;
> +	bool compression_en;
> +	u32 extra_dto_cycles;   /* for DP only */
> +	bool dsc_4hs_merge;     /* DSC 4HS merge */
> +	u32 dce_bytes_per_line;
>  };
>  
>  struct intf_prog_fetch {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
