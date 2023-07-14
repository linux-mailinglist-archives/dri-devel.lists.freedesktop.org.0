Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B0753356
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0210E7FE;
	Fri, 14 Jul 2023 07:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D3A10E7FD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:41:21 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so2668477e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689320477; x=1689925277;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pn4f4WWjioxpxsKPkIHfYHyGXNCO5crTP2gQju8JeZA=;
 b=psfJW9lH+7Z1bioIicEm5NyRjfey2Knk4Y70FV1RS6HE+AeB/1XgQTcyt72Thq/sVJ
 J4P664NQwrFvcJRgy0skMjT+XPODzBqcxxleX4fZKh4dmgaMOTcJzDY794M5b1B/95Yj
 +WmiU1ApG3j7rDwTKOeJeHEUflNQ5D4TIBJNm6YOJUJzDlHIrc2tOY3w/3TZOZKjaP85
 m8RcmDS9XGjHFqOkNHZh9X8GalpJq3vK0Urw89G3ZRo0e92qE1WZHEn4u5ZKci6B1umK
 QpVSkWbNwZIWUGXqfnUBdtA4DKiGI1oiz538uW7N+7wVHlKo8qhTTaG+hDkBvOy2NjDI
 DtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689320477; x=1689925277;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pn4f4WWjioxpxsKPkIHfYHyGXNCO5crTP2gQju8JeZA=;
 b=G7kw8jrOO5MUSFWvZfrKrCMNwWyC3WCj9tqR5DqoHHsNNV5419rd3+fx1KjA+Ka04G
 68E5A9felV/2z9cZ/Em4uBR4S0aIlgzaNY1FC+Y3ApyBfhM0yBuBv4Xv6nEBkRekMEaq
 njUhCxTprwdC1Ge26qOpxvBRVMdrGKfDAYLsfR2iLxrGOPOzmyp2CwMbxPBb01Im2bTW
 pdoMF0qsMg4frU1saWOtu/nCkWVE3X6c2VvYs9sCkC21gFNYhWEO6GxhEWB6eGVjaWMD
 ZZPQTW58WJ52TY/7glVv362Lk20OxDb3OVRb+EOY9zEwufJB1ZNg6D+rrH8Yb9nmj9nC
 j2Sw==
X-Gm-Message-State: ABy/qLZciBBPb2RwqBMmHv14UqV9JQDOfB8R6jvY3dKLHQo79AGbFeUM
 wU5e95VWkd/k5x1/xhu9a7y+7w==
X-Google-Smtp-Source: APBJJlGC8Z/PdzO3B6R9XxF94cAF0ZkSGyVB3B0/4hww67f02If/g8VPY3Or12sj6R5ujxV2VcoYaQ==
X-Received: by 2002:a19:670a:0:b0:4f3:b61a:a94b with SMTP id
 b10-20020a19670a000000b004f3b61aa94bmr2545810lfc.53.1689320477215; 
 Fri, 14 Jul 2023 00:41:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z26-20020ac25dfa000000b004fb74cb9670sm1377548lfq.125.2023.07.14.00.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 00:41:16 -0700 (PDT)
Message-ID: <de0ec44d-c14e-334c-a5a6-76ac2c63b048@linaro.org>
Date: Fri, 14 Jul 2023 10:41:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230713-add-widebus-support-v2-1-ad0added17b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230713-add-widebus-support-v2-1-ad0added17b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/07/2023 03:21, Jessica Zhang wrote:
> DSI 6G v2.5.x+ and DPU 7.x+ support a data-bus widen mode that allows DSI

sm8250 has widebus support in DP and thus in DPU, according to the 
published DT. Thus the 'DPU 7.x+' is not fully correct.

> to send 48 bits of compressed data per pclk instead of 24.
> 
> For all chipsets that support this mode, enable it whenever DSC is
> enabled as recommended by the hardware programming guide.
> 
> Only enable this for command mode as we are currently unable to validate
> it for video mode.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Note: The dsi.xml.h changes were generated using the headergen2 script in
> envytools [2], but the changes to the copyright and rules-ng-ng source file
> paths were dropped.
> 
> [1] https://patchwork.freedesktop.org/series/120580/
> [2] https://github.com/freedreno/envytools/
> 
> --
> Changes in v2:
> - Rebased on top of "drm/msm/dpu: Re-introduce dpu core revision"
> - Squashed all commits to avoid breaking feature if the series is only partially applied
> - Moved DATABUS_WIDEN bit setting to dsi_ctr_enable() (Marijn)
> - Have DPU check if wide bus is requested by output driver (Dmitry)
> - Introduced bytes_per_pclk variable for dsi_timing_setup() hdisplay adjustment (Marijn)
> - Link to v1: https://lore.kernel.org/r/20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 ++++++----
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  4 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
>   drivers/gpu/drm/msm/dsi/dsi.c                      |  5 +++++
>   drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
>   drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 | 23 +++++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_drv.h                      |  6 ++++++
>   9 files changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f0a2a1dca741..6aed63c06c1d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2411,6 +2411,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>   	struct drm_encoder *drm_enc = NULL;
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> +	int index = disp_info->h_tile_instance[0];
>   	int ret = 0;
>   
>   	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
> @@ -2439,13 +2440,14 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   	timer_setup(&dpu_enc->frame_done_timer,
>   			dpu_encoder_frame_done_timeout, 0);
>   
> -	if (disp_info->intf_type == INTF_DSI)
> +	if (disp_info->intf_type == INTF_DSI) {
>   		timer_setup(&dpu_enc->vsync_event_timer,
>   				dpu_encoder_vsync_event_handler,
>   				0);
> -	else if (disp_info->intf_type == INTF_DP)
> -		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> -				priv->dp[disp_info->h_tile_instance[0]]);
> +		dpu_enc->wide_bus_en = msm_dsi_is_widebus_enabled(priv->dsi[index]);
> +	} else if (disp_info->intf_type == INTF_DP) {
> +		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
> +	}
>   
>   	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>   			dpu_encoder_off_work);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index df88358e7037..dace6168be2d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -69,8 +69,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   				phys_enc->hw_intf,
>   				phys_enc->hw_pp->idx);
>   
> -	if (intf_cfg.dsc != 0)
> +	if (intf_cfg.dsc != 0) {
>   		cmd_mode_cfg.data_compress = true;
> +		cmd_mode_cfg.wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> +	}
>   
>   	if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
>   		phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf, &cmd_mode_cfg);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 8ec6505d9e78..dc6f3febb574 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -521,6 +521,9 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>   	if (cmd_mode_cfg->data_compress)
>   		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>   
> +	if (cmd_mode_cfg->wide_bus_en)
> +		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
> +
>   	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 77f80531782b..c539025c418b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -50,6 +50,7 @@ struct dpu_hw_intf_status {
>   
>   struct dpu_hw_intf_cmd_mode_cfg {
>   	u8 data_compress;	/* enable data compress between dpu and dsi */
> +	u8 wide_bus_en;		/* enable databus widen mode */
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index baab79ab6e74..e3cc06c94397 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -17,6 +17,11 @@ struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>   	return msm_dsi_host_get_dsc_config(msm_dsi->host);
>   }
>   
> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
> +{
> +	return msm_dsi_host_is_widebus_supported(msm_dsi->host);
> +}
> +
>   static int dsi_get_phy(struct msm_dsi *msm_dsi)
>   {
>   	struct platform_device *pdev = msm_dsi->pdev;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index bd3763a5d723..219a9f756759 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>   struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host);
>   
>   /* dsi phy */
>   struct msm_dsi_phy;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index a4a154601114..2a7d980e12c3 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
>   	return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
>   }
>   #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE			0x00010000
> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN			0x00100000
>   
>   #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL			0x000001b8
>   #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK		0x0000003f
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 645927214871..6ea3476acf0d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -710,6 +710,14 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>   	dsi_write(msm_host, REG_DSI_CTRL, 0);
>   }
>   
> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host)
> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +	return msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> +			msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0;
> +}
> +
>   static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>   			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
>   {
> @@ -757,6 +765,11 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>   		    msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {
>   			data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
>   			data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
> +
> +			/* TODO: Allow for video-mode support once tested/fixed */
> +			if (msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0 && msm_host->dsc)
> +				data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
> +
>   			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
>   		}
>   	}
> @@ -894,6 +907,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   	u32 hdisplay = mode->hdisplay;
>   	u32 wc;
>   	int ret;
> +	bool widebus_supported = msm_dsi_host_is_widebus_supported(&msm_host->base);
>   
>   	DBG("");
>   
> @@ -914,6 +928,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	if (msm_host->dsc) {
>   		struct drm_dsc_config *dsc = msm_host->dsc;
> +		u32 bytes_per_pclk;
>   
>   		/* update dsc params with timing params */
>   		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
> @@ -937,7 +952,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		 * pulse width same
>   		 */
>   		h_total -= hdisplay;
> -		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> +		if (widebus_supported && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
> +			bytes_per_pclk = 6;
> +		else
> +			bytes_per_pclk = 3;
> +
> +		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
> +
>   		h_total += hdisplay;
>   		ha_end = ha_start + hdisplay;
>   	}
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 9d9d5e009163..7ff56d09014c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -344,6 +344,7 @@ void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi
>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
>   bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>   bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi);
>   struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
>   #else
>   static inline void __init msm_dsi_register(void)
> @@ -374,6 +375,11 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
>   	return false;
>   }
>   
> +static inline bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
> +{
> +	return false;
> +}
> +
>   static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>   {
>   	return NULL;
> 
> ---
> base-commit: 9445fc2942a890e84c74e170ebd7dfb9566e3357
> change-id: 20230525-add-widebus-support-f785546ee751
> 
> Best regards,

-- 
With best wishes
Dmitry

