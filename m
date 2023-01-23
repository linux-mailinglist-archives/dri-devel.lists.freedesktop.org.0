Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C766789D3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 22:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A904410E59A;
	Mon, 23 Jan 2023 21:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8E510E59A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 21:43:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w14so16275634edi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 13:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W3r6B64DZuMFwwix3N4n4XzbmENfbpW+Xzcs7S01Th4=;
 b=EWwdaEn4uzAm+RZhH/JN2bAoeEswIMXVe5x8cvWSi5FsYfKXuNkUWXim62A0NWvaK2
 1iR2uaagFG4D8GXvUdt1XBaMxT1FvVvNU8pC19vLCPyiZCgNK0rozotfALycjVUK41aP
 vVAWfHI37bPLo3YB+WYeyti0TmyNQZ0SuRR2wT65IS3RcAjZkKBs/3phMIhYVp18Vi20
 YQVMIdKij1oveSpbaDruXExrQGgMHlIBsZp5kjMhePMRKyZmLtFBuUDpG1vPIc6GbOnA
 BFaMUb9iKEVLLRGG4ywOvLS/gW8qx5FTN4tgczgcIh+neHVZz5ATktWdSFcdA4eKbwJI
 hseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W3r6B64DZuMFwwix3N4n4XzbmENfbpW+Xzcs7S01Th4=;
 b=LhaL6v/mZc0N4CsUlSuQKMMDfAzBp4hDioWGgvI3NkNFIt8gT3XpUK0kBa9hF1vGbC
 MbDByzY6nCelsLkijq1qyc3drZfkZAtW/F0rdvPG1i/gmJ5I0YPY68CgZxIaMZArx0WN
 OC0tDjiOXRH6vSTMMXFgCEAwemXMROzqT4MKWIzTgOSCtrEcNHlyksahoAMYcThsxMtY
 F4mNQ5oqBhNN3QVN44ysp8d5n8PniZp8TBDSvGs9yhWw4yUvr7oUamc8zHucknpr/iw0
 ETyrTe6Nnlq0GXi5TOjrC73E4Lkn1xivXSwzjNOhGaBeq5QaTHyTNwaww0uqMlRtKCNG
 7edQ==
X-Gm-Message-State: AFqh2kqnOYD9fxB13oaHP8KkQPD8ogdgxhYY2w/qRLd7bSdoc1DpD173
 MyWQhiSGKhzxxqShbxzrFznTEA==
X-Google-Smtp-Source: AMrXdXsoy0vnuRmmzM8s80srmTtOvZEQu9MroLlG3m2s1HTM6nQz1sHzw5EKlmcnKvE51i8rh+LpuA==
X-Received: by 2002:a05:6402:4305:b0:49c:7aa2:55de with SMTP id
 m5-20020a056402430500b0049c7aa255demr35515771edc.1.1674510212240; 
 Mon, 23 Jan 2023 13:43:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b0048789661fa2sm223597edw.66.2023.01.23.13.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 13:43:31 -0800 (PST)
Message-ID: <e79fd723-a522-5ad2-12c9-14085fe30b8a@linaro.org>
Date: Mon, 23 Jan 2023 23:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 11/14] drm/msm/disp/dpu1: add supports of new flush
 mechanism
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-12-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-12-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> A new flushing mechanism is introduced to decouple peripheral metadata
> flushing from timing engine related flush. This patch add peripheral
> flushing functions.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 24 ++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  2 +
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  7 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 43 ++++++++++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 21 +++++++++++
>   5 files changed, 91 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 901e317..d2625b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1472,6 +1472,12 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>   	if (extra_flush_bits && ctl->ops.update_pending_flush)
>   		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
>   
> +	if (phys->hw_intf->cap->type == INTF_DP &&
> +		phys->comp_type == MSM_DISPLAY_COMPRESSION_DSC &&
> +						phys->comp_ratio) {

Do you really need to know comp_ratio here? And the comp_type?

> +		ctl->ops.update_pending_flush_periph(ctl, phys->hw_intf->idx);
> +	}
> +
>   	ctl->ops.trigger_flush(ctl);
>   
>   	if (ctl->ops.get_pending_flush)
> @@ -1814,12 +1820,18 @@ dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
>   	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
>   }
>   
> -static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_encoder_virt *dpu_enc,
> +				     struct dpu_hw_dsc *hw_dsc,
>   				     struct dpu_hw_pingpong *hw_pp,
>   				     struct drm_dsc_config *dsc,
>   				     u32 common_mode,
>   				     u32 initial_lines)
>   {
> +	struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
> +	struct dpu_hw_ctl *ctl;
> +
> +	ctl = cur_master->hw_ctl;
> +
>   	if (hw_dsc->ops.dsc_config)
>   		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines, false);
>   
> @@ -1834,6 +1846,10 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>   
>   	if (hw_pp->ops.enable_dsc)
>   		hw_pp->ops.enable_dsc(hw_pp);
> +
> +	if (ctl->ops.update_pending_flush_dsc)
> +		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
> +
>   }
>   
>   static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> @@ -1877,8 +1893,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	enc_ip_w = intf_ip_w / 2;
>   	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>   
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> -		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +		dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
> +					dsc_common_mode, initial_lines);
> +	}
>   }
>   
>   void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 1d434b2..0569b36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -200,6 +200,8 @@ struct dpu_encoder_phys {
>   	atomic_t pending_kickoff_cnt;
>   	wait_queue_head_t pending_kickoff_wq;
>   	int irq[INTR_IDX_MAX];
> +	enum msm_display_compression_type comp_type;
> +	u32 comp_ratio;
>   };
>   
>   static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 48c4810..2d864f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /* Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -427,6 +428,12 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>   	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
>   		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
>   
> +	if (phys_enc->hw_intf->cap->type == INTF_DP &&
> +		phys_enc->comp_type == MSM_DISPLAY_COMPRESSION_DSC &&
> +					phys_enc->comp_ratio) {
> +		ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
> +	}
> +
>   skip_flush:
>   	DPU_DEBUG_VIDENC(phys_enc,
>   		"update pending flush ctl %d intf %d\n",
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index b88a2f3..1891c57 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -33,6 +33,7 @@
>   #define   CTL_DSC_FLUSH                0x104
>   #define   CTL_WB_FLUSH                  0x108
>   #define   CTL_INTF_FLUSH                0x110
> +#define   CTL_PERIPH_FLUSH              0x128
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>   
> @@ -42,11 +43,13 @@
>   #define DPU_REG_RESET_TIMEOUT_US        2000
>   #define  MERGE_3D_IDX   23
>   #define  DSC_IDX        22
> +#define  PERIPH_IDX     30
>   #define  INTF_IDX       31
>   #define WB_IDX          16
>   #define CTL_INVALID_BIT                 0xffff
>   #define CTL_DEFAULT_GROUP_ID		0xf
>   
> +

No extra empty lines please.

>   static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
>   	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
>   	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
> @@ -123,6 +126,7 @@ static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
>   	trace_dpu_hw_ctl_update_pending_flush(flushbits,
>   					      ctx->pending_flush_mask);
>   	ctx->pending_flush_mask |= flushbits;
> +
>   }
>   
>   static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
> @@ -142,6 +146,15 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>   				ctx->pending_wb_flush_mask);
>   
> +	if (ctx->pending_flush_mask & BIT(PERIPH_IDX))
> +		DPU_REG_WRITE(&ctx->hw, CTL_PERIPH_FLUSH,
> +				ctx->pending_periph_flush_mask);
> +
> +	if (ctx->pending_flush_mask & BIT(DSC_IDX)) {
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
> +				ctx->pending_dsc_flush_mask);
> +	}
> +
>   	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>   }
>   
> @@ -281,6 +294,13 @@ static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
>   	ctx->pending_flush_mask |= BIT(INTF_IDX);
>   }
>   
> +static void dpu_hw_ctl_update_pending_flush_periph(struct dpu_hw_ctl *ctx,
> +		enum dpu_intf intf)
> +{
> +	ctx->pending_periph_flush_mask |= BIT(intf - INTF_0);
> +	ctx->pending_flush_mask |= BIT(PERIPH_IDX);
> +}
> +
>   static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>   		enum dpu_merge_3d merge_3d)
>   {
> @@ -288,6 +308,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>   	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>   }
>   
> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
> +		enum dpu_dsc dsc_num)
> +{
> +	ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
> +	ctx->pending_flush_mask |= BIT(DSC_IDX);
> +}
> +
>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>   	enum dpu_dspp dspp)
>   {
> @@ -472,6 +499,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	u32 intf_active = 0;
>   	u32 wb_active = 0;
>   	u32 mode_sel = 0;
> +	u32 dsc_active = 0;
>   
>   	/* CTL_TOP[31:28] carries group_id to collate CTL paths
>   	 * per VM. Explicitly disable it until VM support is
> @@ -502,9 +530,11 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> -	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> -		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> +
> +	if (cfg->dsc_num) {
> +		dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
> +		dsc_active |= BIT(cfg->dsc_num - DSC_0);
> +		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);

This deserves a separate patch with Fixed tag.

>   	}
>   }
>   
> @@ -605,9 +635,16 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>   		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
>   		ops->update_pending_flush_intf =
>   			dpu_hw_ctl_update_pending_flush_intf_v1;
> +
> +		ops->update_pending_flush_periph =
> +			dpu_hw_ctl_update_pending_flush_periph;
> +
>   		ops->update_pending_flush_merge_3d =
>   			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>   		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
> +
> +		ops->update_pending_flush_dsc =
> +			dpu_hw_ctl_update_pending_flush_dsc_v1;
>   	} else {
>   		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>   		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 96c012e..d3faa0b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -48,6 +48,7 @@ struct dpu_hw_intf_cfg {
>   	enum dpu_3d_blend_mode mode_3d;
>   	enum dpu_merge_3d merge_3d;
>   	enum dpu_ctl_mode_sel intf_mode_sel;
> +	enum dpu_dsc dsc_num;
>   	int stream_sel;
>   	unsigned int dsc;
>   };
> @@ -121,6 +122,15 @@ struct dpu_hw_ctl_ops {
>   		enum dpu_intf blk);
>   
>   	/**
> +	 * OR in the given flushbits to the cached pending_(periph_)flush_mask
> +	 * No effect on hardware
> +	 * @ctx       : ctl path ctx pointer
> +	 * @blk       : interface block index
> +	 */
> +	void (*update_pending_flush_periph)(struct dpu_hw_ctl *ctx,
> +		enum dpu_intf blk);
> +
> +	/**
>   	 * OR in the given flushbits to the cached pending_(merge_3d_)flush_mask
>   	 * No effect on hardware
>   	 * @ctx       : ctl path ctx pointer
> @@ -156,6 +166,15 @@ struct dpu_hw_ctl_ops {
>   	void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
>   		enum dpu_dspp blk);
>   	/**
> +	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
> +	 * No effect on hardware
> +	 * @ctx       : ctl path ctx pointer
> +	 * @blk       : interface block index
> +	 */
> +	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
> +		enum dpu_dsc blk);
> +
> +	/**
>   	 * Write the value of the pending_flush_mask to hardware
>   	 * @ctx       : ctl path ctx pointer
>   	 */
> @@ -241,7 +260,9 @@ struct dpu_hw_ctl {
>   	u32 pending_flush_mask;
>   	u32 pending_intf_flush_mask;
>   	u32 pending_wb_flush_mask;
> +	u32 pending_periph_flush_mask;
>   	u32 pending_merge_3d_flush_mask;
> +	u32 pending_dsc_flush_mask;
>   
>   	/* ops */
>   	struct dpu_hw_ctl_ops ops;

-- 
With best wishes
Dmitry

