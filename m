Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550CB6F21A4
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263E610EE1C;
	Sat, 29 Apr 2023 00:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3096B10EE1A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 00:31:32 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f87c5b4635so314168f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 17:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682728290; x=1685320290;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F2XR0z/V+qipW/Xk/AG/sbFXdxf2KNfIbpWmM5bO0cU=;
 b=Zbgq1BOOCN9HSBrZ8p7F3HAIrgpRiKzTK5yEX/tMtj4DlYZ0xva7V5OtlNzZhWzoJS
 u6c/2aXewDpEY7UDx5sTdgz1r5eLD++UIwAj8oaFnXFAgcb7+COW34CKf1jVli2xoeqY
 mHjrQvdBmXt/9XQTKT6wHBvMBgibNHq1neTKMltSpRVZFhujRDxuoIjFVZgSbCAaTTL1
 syOVQJXCmvMptd/jYBeLd47aH35g0mX+alyj2PszFkyyC10oFg9K2n9uwQTHNLm+dycH
 ufgM02+vZ33+J+UYohYYmJC5CpV+cCOtXnOGsaPAqUl6q6D5bwxKKfXcqBcbcX0gZmJ5
 wS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682728290; x=1685320290;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F2XR0z/V+qipW/Xk/AG/sbFXdxf2KNfIbpWmM5bO0cU=;
 b=if3ggsRb5w6LpZBDMIxkdk/4Y7IIT6WciAC+NF1dcmwBtU8huon+lwn0kcxmNDCsIV
 AygmymgVMlH6U2KUnrAvITAa1QQwxpr6bX9P2bBkSjrWvN1cq2k4G3YTiX0Ot1NfBvAG
 Nvobgkgx8pijX7hoP5PcDaZysYKqUr1lsz6wqG53mtzdHecp67HFHHH4kcv9QMJ4moYh
 CfTYQiR8R6fqAWCetjWqsAQpnJglE6hFBRiq1KkC5CIfxQ0aowFj4KT5/wDt0RxjZqxT
 YVw5xXNv7iTIaka+pI1zFIVeYjUyt714zCfVj3urfeX5FvAZ/CRw72rykRAJhp4W+Bys
 Oxww==
X-Gm-Message-State: AC+VfDwVcX0lHRB2dUD/iAEAABEFOPrxNkucRdGa6vy4i+V+lWwj5vNQ
 q+hvGXqLEQP4coElCesAfhEdwQ==
X-Google-Smtp-Source: ACHHUZ7DEZlp7AruW9jj/0SV4KdNW2fr6BGW3/PscdWqVmpcS5ZjrZ28TO2pWYWkVPgJV8/+vUL4ng==
X-Received: by 2002:a5d:460b:0:b0:2f0:bd17:2d2c with SMTP id
 t11-20020a5d460b000000b002f0bd172d2cmr5241974wrq.9.1682728289965; 
 Fri, 28 Apr 2023 17:31:29 -0700 (PDT)
Received: from [10.6.147.212] ([212.140.138.218])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm22373199wrc.6.2023.04.28.17.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 17:31:29 -0700 (PDT)
Message-ID: <f26bd3f2-21d1-44d0-221c-230a8b93eec0@linaro.org>
Date: Sat, 29 Apr 2023 03:31:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/7] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682725511-18185-3-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2023 02:45, Kuogee Hsieh wrote:
> Current DSC flush update is piggyback inside dpu_hw_ctl_intf_cfg_v1().
> This patch separate DSC flush away from dpu_hw_ctl_intf_cfg_v1() by

Nit: separates

> adding dpu_hw_ctl_update_pending_flush_dsc_v1() to handle both per
> DSC engine and DSC flush bits at same time to make it consistent with
> the location of flush programming of other dpu sub blocks.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 ++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 10 ++++++++++
>   3 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1dc5dbe..ecb87bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1823,12 +1823,18 @@ dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
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
>   		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines);
>   
> @@ -1843,6 +1849,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>   
>   	if (hw_pp->ops.enable_dsc)
>   		hw_pp->ops.enable_dsc(hw_pp);
> +
> +	if (ctl->ops.update_pending_flush_dsc)
> +		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>   }
>   
>   static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> @@ -1887,7 +1896,8 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> -		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
> +		dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
> +					dsc_common_mode, initial_lines);
>   }
>   
>   void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4f7cfa9..832a6a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -139,6 +139,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   				CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>   				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>   		}
> +
> +	if (ctx->pending_flush_mask & BIT(DSC_IDX))
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
> +				ctx->pending_dsc_flush_mask);
> +
>   	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>   }
>   
> @@ -285,6 +290,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
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
>   	enum dpu_dspp dspp, u32 dspp_sub_blk)
>   {
> @@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>   		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>   
> -	if (cfg->dsc)
> -		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> -
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>   		mode_sel |= BIT(17);
>   
> @@ -524,10 +533,8 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> -	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +	if (cfg->dsc)
>   		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> -	}
>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> @@ -630,6 +637,9 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
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
> index 6292002..5762752 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
>   		enum dpu_dspp blk, u32 dspp_sub_blk);
>   
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
> @@ -245,6 +254,7 @@ struct dpu_hw_ctl {
>   	u32 pending_wb_flush_mask;
>   	u32 pending_merge_3d_flush_mask;
>   	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
> +	u32 pending_dsc_flush_mask;
>   
>   	/* ops */
>   	struct dpu_hw_ctl_ops ops;

-- 
With best wishes
Dmitry

