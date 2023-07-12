Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82874FC4A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 02:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F7810E46F;
	Wed, 12 Jul 2023 00:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9484810E46E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 00:42:49 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b6f52e1c5cso100958681fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 17:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689122567; x=1691714567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1rGc1tm7GtQ9oseOAmnScr9Dmh0EaIn4ENjW72qzptE=;
 b=y90DZR/OYavpJ7AB3SkumVvJlwJb9hEwYEA1Nq1lYP5Atfc2POukJYrs/EqaC2czKk
 ujMk1cEhcmQhP/ddcDSFN1e0nePB7wRK2UlCyJMfBEUYtqT/4f9eCvEwUjFrejSnYLNd
 dh3MwhsYrK+A1Ag1srNbMeWLdF3J0YsLxBzIEdXoLmWjMIS1001UbyN/qKSIeIfDoYM1
 NXxmqYUl8wVfYmRcIrJUqB0FWhKZv/n3dMlrR/ee+A5uUHIkiuo+lciwMp/1MEaIB2wX
 f5vd8teQhlaCbdNxbtd/XeuVMdm11KhY1vtMBl9Uf4Gdqcb3upKRlrPtp/Dd2tuquSNP
 C4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689122567; x=1691714567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1rGc1tm7GtQ9oseOAmnScr9Dmh0EaIn4ENjW72qzptE=;
 b=cf3cEf+U8kK4yq9+cACHyMtK/ddzc3o14wGAqNH2dIQH1qO8K16Sadjzun0hXFD59H
 hKVnwGtNBlEvArAz9gEiGqLsqS2oZgvwLDki8gA+Q9oOI/wjpZlE2BvX/Os0ZROUa5z0
 3lgD0EBb1xqVstYm+k/nTXwaAKiVEzm3jbRWxA3R2UymOpbFx4KLIjuFuUXM30zF2GM4
 wsSWe8ieGwA2Bj4XrSXDsZGf1E+81JX4svy4/pp5tLBTkgrdv2VcYKF3PxNiy0TOCJJs
 xNkdOD03F3O3L5VeDcATDBUEFDpc4RqkavvuLUVxZkFs1Gy5OzA58ySyF8YGIDX5CEba
 SJXg==
X-Gm-Message-State: ABy/qLZKSdGDg08N9qfeRDxkEB+kNL0B6nsEA+xBMyjHGDfl9qUV2EN6
 weyj0bcoMRiy17zNBqtQQZKr6A==
X-Google-Smtp-Source: APBJJlGsKz9klozJT9LbRFQsti8avzmEUmUVowzw9G+BQT1Ec+22gyxCh5g6h/EZzI200AJJIC68Ng==
X-Received: by 2002:a2e:9188:0:b0:2b6:cdfb:fe36 with SMTP id
 f8-20020a2e9188000000b002b6cdfbfe36mr16334928ljg.39.1689122567186; 
 Tue, 11 Jul 2023 17:42:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a2e8747000000b002b6ea4ed1f0sm678818ljj.14.2023.07.11.17.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 17:42:46 -0700 (PDT)
Message-ID: <b834fc46-80c8-b75d-d7e9-e525ac27077e@linaro.org>
Date: Wed, 12 Jul 2023 03:42:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/4] drm/msm/dpu: rename enable_compression() to
 program_intf_cmd_cfg()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230712003310.31961-1-quic_abhinavk@quicinc.com>
 <20230712003310.31961-4-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712003310.31961-4-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 03:33, Abhinav Kumar wrote:
> Rename the intf's enable_compression() op to program_intf_cmd_cfg()
> and allow it to accept a struct intf_cmd_mode_cfg to program
> all the bits at once. This can be re-used by widebus later on as
> well as it touches the same register.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  8 ++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          |  8 +++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 11 +++++++++--
>   3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b856c6286c85..052824eac9f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -50,6 +50,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   			to_dpu_encoder_phys_cmd(phys_enc);
>   	struct dpu_hw_ctl *ctl;
>   	struct dpu_hw_intf_cfg intf_cfg = { 0 };
> +	struct intf_cmd_mode_cfg cmd_mode_cfg = {};
>   
>   	ctl = phys_enc->hw_ctl;
>   	if (!ctl->ops.setup_intf_cfg)
> @@ -68,8 +69,11 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   				phys_enc->hw_intf,
>   				phys_enc->hw_pp->idx);
>   
> -	if (intf_cfg.dsc != 0 && phys_enc->hw_intf->ops.enable_compression)
> -		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
> +	if (intf_cfg.dsc != 0)
> +		cmd_mode_cfg.data_compress = true;
> +
> +	if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
> +		phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf, &cmd_mode_cfg);
>   }
>   
>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index d766791438e7..7323c713dad1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -513,11 +513,13 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>   
>   }
>   
> -static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
> +static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
> +					     struct intf_cmd_mode_cfg *cmd_mode_cfg)
>   {
>   	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
>   
> -	intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +	if (cmd_mode_cfg->data_compress)
> +		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>   
>   	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>   }
> @@ -544,7 +546,7 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>   	}
>   
>   	if (mdss_rev->core_major_ver >= 7)
> -		ops->enable_compression = dpu_hw_intf_enable_compression;
> +		ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
>   }
>   
>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 3b5f18dbcb4b..c15f4973de5e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -48,6 +48,11 @@ struct intf_status {
>   	u32 line_count;		/* current line count including blanking */
>   };
>   
> +struct intf_cmd_mode_cfg {

My first reaction was that usually all DPU structure names start with 
dpu_. Then I discovered that dpu_hw_intf.h diverges from this useful 
custom. Could you please: fix existing structure struct intf_* names to 
bear the dpu_ prefix. Then this structure can also be named as struct 
dpu_intf_cmd_mode_cfg.

> +	u8 data_compress;	/* enable data compress between dpu and dsi */
> +	/* can be expanded for other programmable bits */

Please drop this comment.

> +};
> +
>   /**
>    * struct dpu_hw_intf_ops : Interface to the interface Hw driver functions
>    *  Assumption is these functions will be called after clocks are enabled
> @@ -70,7 +75,7 @@ struct intf_status {
>    * @get_autorefresh:            Retrieve autorefresh config from hardware
>    *                              Return: 0 on success, -ETIMEDOUT on timeout
>    * @vsync_sel:                  Select vsync signal for tear-effect configuration
> - * @enable_compression:         Enable data compression
> + * @program_intf_cmd_cfg:       Program the DPU to interface datapath for command mode
>    */
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -108,7 +113,9 @@ struct dpu_hw_intf_ops {
>   	 */
>   	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
>   
> -	void (*enable_compression)(struct dpu_hw_intf *intf);
> +	// Program the datapath between DPU and intf for command mode

We have been using c99 comments in the code, Moreover, there is already 
description for this field in the comment above, so it can be dropped too.

> +	void (*program_intf_cmd_cfg)(struct dpu_hw_intf *intf,
> +				     struct intf_cmd_mode_cfg *cmd_mode_cfg);
>   };
>   
>   struct dpu_hw_intf {

-- 
With best wishes
Dmitry

