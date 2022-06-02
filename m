Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D631353BE92
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 21:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B2710FEF7;
	Thu,  2 Jun 2022 19:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1740710F106;
 Thu,  2 Jun 2022 19:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654197651; x=1685733651;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DrQS+858xXoE8wF527YNH/p5k/bZpRmxcHl2RXfH/so=;
 b=IpHD9/5jYnUDFWfLKRMiRb3stWCRIhBiH/CZDZ6Lp1m2nsVYwN6yiZ93
 ndmaKI+a7DtWbe2UTrmwFFMH3CXQpMDwdq/JmsEM5jNOFzG9RC4iWsIPe
 3BXvrKu8dm3qXaPhqk7+LuEPvH4woxc5zlZrGh22bJOgVWP/ZjbdjhzKX Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Jun 2022 12:20:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 12:20:50 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 12:20:49 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 12:20:47 -0700
Message-ID: <f91d4f3b-e09f-ecd0-a674-827fce71e294@quicinc.com>
Date: Thu, 2 Jun 2022 12:20:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 4/7] drm/msm/dpu: change catalog->perf to be a const
 pointer
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
 <20220602133039.1739490-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602133039.1739490-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 6:30 AM, Dmitry Baryshkov wrote:
> Change dpu_mdss_cfg::perf to be a const pointer rather than embedding
> the dpu_perf_cfg struct into the struct dpu_mdss_cfg.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 20 +++++++++----------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 10 +++++-----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 16 +++++++--------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 18 ++++++++---------
>   5 files changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index a7492dd6ed65..31767d0f7353 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -53,7 +53,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>   		crtc_plane_bw += pstate->plane_fetch_bw;
>   	}
>   
> -	bw_factor = kms->catalog->perf.bw_inefficiency_factor;
> +	bw_factor = kms->catalog->perf->bw_inefficiency_factor;
>   	if (bw_factor) {
>   		crtc_plane_bw *= bw_factor;
>   		do_div(crtc_plane_bw, 100);
> @@ -90,7 +90,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
>   		crtc_clk = max(pstate->plane_clk, crtc_clk);
>   	}
>   
> -	clk_factor = kms->catalog->perf.clk_inefficiency_factor;
> +	clk_factor = kms->catalog->perf->clk_inefficiency_factor;
>   	if (clk_factor) {
>   		crtc_clk *= clk_factor;
>   		do_div(crtc_clk, 100);
> @@ -128,7 +128,7 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
>   		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
>   	} else {
>   		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> -		perf->max_per_pipe_ib = kms->catalog->perf.min_dram_ib;
> +		perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
>   		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
>   	}
>   
> @@ -189,7 +189,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>   		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
>   		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
>   
> -		threshold = kms->catalog->perf.max_bw_high;
> +		threshold = kms->catalog->perf->max_bw_high;
>   
>   		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
>   
> @@ -413,7 +413,7 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
>   		    const char __user *user_buf, size_t count, loff_t *ppos)
>   {
>   	struct dpu_core_perf *perf = file->private_data;
> -	struct dpu_perf_cfg *cfg = &perf->catalog->perf;
> +	const struct dpu_perf_cfg *cfg = perf->catalog->perf;
>   	u32 perf_mode = 0;
>   	int ret;
>   
> @@ -480,15 +480,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>   	debugfs_create_u32("enable_bw_release", 0600, entry,
>   			(u32 *)&perf->enable_bw_release);
>   	debugfs_create_u32("threshold_low", 0600, entry,
> -			(u32 *)&catalog->perf.max_bw_low);
> +			(u32 *)&catalog->perf->max_bw_low);
>   	debugfs_create_u32("threshold_high", 0600, entry,
> -			(u32 *)&catalog->perf.max_bw_high);
> +			(u32 *)&catalog->perf->max_bw_high);
>   	debugfs_create_u32("min_core_ib", 0600, entry,
> -			(u32 *)&catalog->perf.min_core_ib);
> +			(u32 *)&catalog->perf->min_core_ib);
>   	debugfs_create_u32("min_llcc_ib", 0600, entry,
> -			(u32 *)&catalog->perf.min_llcc_ib);
> +			(u32 *)&catalog->perf->min_llcc_ib);
>   	debugfs_create_u32("min_dram_ib", 0600, entry,
> -			(u32 *)&catalog->perf.min_dram_ib);
> +			(u32 *)&catalog->perf->min_dram_ib);
>   	debugfs_create_file("perf_mode", 0600, entry,
>   			(u32 *)perf, &dpu_core_perf_mode_fops);
>   	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 4829d1ce0cf8..1e4a4822fbf4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -104,7 +104,7 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
>   	struct dpu_hw_wb *hw_wb;
>   	struct dpu_hw_wb_qos_cfg qos_cfg;
>   	struct dpu_mdss_cfg *catalog;
> -	struct dpu_qos_lut_tbl *qos_lut_tb;
> +	const struct dpu_qos_lut_tbl *qos_lut_tb;
>   
>   	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
>   		DPU_ERROR("invalid parameter(s)\n");
> @@ -118,11 +118,11 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
>   	memset(&qos_cfg, 0, sizeof(struct dpu_hw_wb_qos_cfg));
>   	qos_cfg.danger_safe_en = true;
>   	qos_cfg.danger_lut =
> -		catalog->perf.danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
> +		catalog->perf->danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
>   
> -	qos_cfg.safe_lut = catalog->perf.safe_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
> +	qos_cfg.safe_lut = catalog->perf->safe_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
>   
> -	qos_lut_tb = &catalog->perf.qos_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
> +	qos_lut_tb = &catalog->perf->qos_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
>   	qos_cfg.creq_lut = _dpu_hw_get_qos_lut(qos_lut_tb, 0);
>   
>   	if (hw_wb->ops.setup_qos_lut)
> @@ -166,7 +166,7 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
>   	if (hw_wb->ops.setup_cdp) {
>   		memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
>   
> -		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf.cdp_cfg
> +		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf->cdp_cfg
>   				[DPU_PERF_CDP_USAGE_NRT].wr_enable;
>   		cdp_cfg.ubwc_meta_enable =
>   				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 367279371e8d..a7040ca5da72 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1750,7 +1750,7 @@ static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(msm8998_vbif),
>   		.vbif = msm8998_vbif,
>   		.reg_dma_count = 0,
> -		.perf = msm8998_perf_data,
> +		.perf = &msm8998_perf_data,
>   		.mdss_irqs = IRQ_SM8250_MASK,
>   	};
>   }
> @@ -1781,7 +1781,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
>   		.dma_cfg = sdm845_regdma,
> -		.perf = sdm845_perf_data,
> +		.perf = &sdm845_perf_data,
>   		.mdss_irqs = IRQ_SDM845_MASK,
>   	};
>   }
> @@ -1812,7 +1812,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
>   		.dma_cfg = sdm845_regdma,
> -		.perf = sc7180_perf_data,
> +		.perf = &sc7180_perf_data,
>   		.mdss_irqs = IRQ_SC7180_MASK,
>   	};
>   }
> @@ -1845,7 +1845,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
>   		.dma_cfg = sm8150_regdma,
> -		.perf = sm8150_perf_data,
> +		.perf = &sm8150_perf_data,
>   		.mdss_irqs = IRQ_SDM845_MASK,
>   	};
>   }
> @@ -1876,7 +1876,7 @@ static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
>   		.dma_cfg = sm8150_regdma,
> -		.perf = sc8180x_perf_data,
> +		.perf = &sc8180x_perf_data,
>   		.mdss_irqs = IRQ_SC8180X_MASK,
>   	};
>   }
> @@ -1911,7 +1911,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.wb = sm8250_wb,
>   		.reg_dma_count = 1,
>   		.dma_cfg = sm8250_regdma,
> -		.perf = sm8250_perf_data,
> +		.perf = &sm8250_perf_data,
>   		.mdss_irqs = IRQ_SM8250_MASK,
>   	};
>   }
> @@ -1934,7 +1934,7 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.intf = sc7280_intf,
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
> -		.perf = sc7280_perf_data,
> +		.perf = &sc7280_perf_data,
>   		.mdss_irqs = IRQ_SC7280_MASK,
>   	};
>   }
> @@ -1966,7 +1966,7 @@ static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
>   		.dma_cfg = sdm845_regdma,
> -		.perf = qcm2290_perf_data,
> +		.perf = &qcm2290_perf_data,
>   		.mdss_irqs = IRQ_SC7180_MASK,
>   	};
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4225f58d8f97..64ed96b2fa3d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -868,7 +868,7 @@ struct dpu_mdss_cfg {
>   
>   	/* Add additional block data structures here */
>   
> -	struct dpu_perf_cfg perf;
> +	const struct dpu_perf_cfg *perf;
>   	const struct dpu_format_extended *dma_formats;
>   	const struct dpu_format_extended *cursor_formats;
>   	const struct dpu_format_extended *vig_formats;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 9d2f0364d2c7..d8048b6862f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -160,7 +160,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>   	vbp = mode->vtotal - mode->vsync_end;
>   	vpw = mode->vsync_end - mode->vsync_start;
>   	vfp = mode->vsync_start - mode->vdisplay;
> -	hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
> +	hw_latency_lines =  dpu_kms->catalog->perf->min_prefill_lines;
>   	scale_factor = src_height > dst_height ?
>   		mult_frac(src_height, 1, dst_height) : 1;
>   
> @@ -309,7 +309,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   	}
>   
>   	qos_lut = _dpu_hw_get_qos_lut(
> -			&pdpu->catalog->perf.qos_lut_tbl[lut_usage], total_fl);
> +			&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
>   
>   	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
>   			(fmt) ? fmt->base.pixel_format : 0,
> @@ -336,9 +336,9 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>   	u32 danger_lut, safe_lut;
>   
>   	if (!pdpu->is_rt_pipe) {
> -		danger_lut = pdpu->catalog->perf.danger_lut_tbl
> +		danger_lut = pdpu->catalog->perf->danger_lut_tbl
>   				[DPU_QOS_LUT_USAGE_NRT];
> -		safe_lut = pdpu->catalog->perf.safe_lut_tbl
> +		safe_lut = pdpu->catalog->perf->safe_lut_tbl
>   				[DPU_QOS_LUT_USAGE_NRT];
>   	} else {
>   		fmt = dpu_get_dpu_format_ext(
> @@ -346,14 +346,14 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>   				fb->modifier);
>   
>   		if (fmt && DPU_FORMAT_IS_LINEAR(fmt)) {
> -			danger_lut = pdpu->catalog->perf.danger_lut_tbl
> +			danger_lut = pdpu->catalog->perf->danger_lut_tbl
>   					[DPU_QOS_LUT_USAGE_LINEAR];
> -			safe_lut = pdpu->catalog->perf.safe_lut_tbl
> +			safe_lut = pdpu->catalog->perf->safe_lut_tbl
>   					[DPU_QOS_LUT_USAGE_LINEAR];
>   		} else {
> -			danger_lut = pdpu->catalog->perf.danger_lut_tbl
> +			danger_lut = pdpu->catalog->perf->danger_lut_tbl
>   					[DPU_QOS_LUT_USAGE_MACROTILE];
> -			safe_lut = pdpu->catalog->perf.safe_lut_tbl
> +			safe_lut = pdpu->catalog->perf->safe_lut_tbl
>   					[DPU_QOS_LUT_USAGE_MACROTILE];
>   		}
>   	}
> @@ -1225,7 +1225,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   
>   			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
>   
> -			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
> +			cdp_cfg.enable = pdpu->catalog->perf->cdp_cfg
>   					[DPU_PERF_CDP_USAGE_RT].rd_enable;
>   			cdp_cfg.ubwc_meta_enable =
>   					DPU_FORMAT_IS_UBWC(fmt);
