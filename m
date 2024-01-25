Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1383CEE5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA54710E3B5;
	Thu, 25 Jan 2024 21:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C377E10E708
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:50:37 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-50e9e5c97e1so219581e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706219376; x=1706824176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lT446C1cDJ2MeTjJ8AuDT4OnFUwaKY6MBXv7uZTSL6A=;
 b=mp5+0BgdfqH/N/Kv3syfY4y0AKebITSnvcUHcNlA5Qs8YEESDn8YsL2QajWYkrRQ7j
 s/uCbhpXSFHJVLdx8Ds9f0cD/GDFVRfUe8WzYBJJ0HKuFDgtIYHauJzO4gPWvfTT5ca6
 IuNBKtI4wrGpvy9EdwPqm4i8BuYGxQlhtyGdk51GZ1lwUDBbBJjqVLQk99dDsIAy+w/F
 +EgX25PlXpVMfsLEIXawSiTLt2wvM65z4jhq8Zn/l4rfya0ku/BbtNNCqqUxQ2If7QVh
 4r/B/nB8mFdMqNuFyGeBqtoP1Pvj/tt9JTTcAoXVCQmdNBFls2mlveI7h+n8HD27RNEK
 /Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706219376; x=1706824176;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lT446C1cDJ2MeTjJ8AuDT4OnFUwaKY6MBXv7uZTSL6A=;
 b=i9O2xUL0Lo5UKLE7A/pMEqM2pu3mL924t8XAmXXXJxC81PXVOOPpH6r4wIdTc/lI9z
 cLd89eqFMaR84WdTllcO/9ioggzcP0/dybV2McLWUmHfzdUX5cEi7fgl126tMKStJrhc
 Dqiabq9p/Jz2zVlLydKJAKnidADiEhF26waJplD00vFClpwgr4ZhN8+Gdw0hQfBbmSnR
 GjsTdqNCBNofcU6jRWy1B6AEmWMSALBeCntISarS3MbNqD01jI2VCnZk2zdCVY4bvoWT
 oUwcpegNuIcK3VbvKLSna+08q+cVkFmPrNDnJpuZdN1hSkFqUcWJWBBqsffSFC3X3Qg7
 os+g==
X-Gm-Message-State: AOJu0YyVpnQGBajVUXRqpzHUO7bo3XlbD7FeNxRoQBdEflmg5gMRUBMr
 6VVFBGvINgvs03UZvbzfTXiVCjEPZJcE3Ehwnu5x7c5eFsOwMMUzr0XUyz9FlZo=
X-Google-Smtp-Source: AGHT+IGp0Nb1IIX2TBKIKJrczEPn+M7kqIhQaZRIvBsCa1UBKExOdH9CwlGJ5kpcdDmnx1XyagO8Vg==
X-Received: by 2002:ac2:47e4:0:b0:510:d4a:d367 with SMTP id
 b4-20020ac247e4000000b005100d4ad367mr248636lfp.2.1706219376108; 
 Thu, 25 Jan 2024 13:49:36 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05651232cc00b0050f0dce126bsm2942118lfg.214.2024.01.25.13.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:49:35 -0800 (PST)
Message-ID: <96cf7370-b825-4ee9-ae17-8a6d72cb02d4@linaro.org>
Date: Thu, 25 Jan 2024 23:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm/dpu: add support of new peripheral flush
 mechanism
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-13-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-13-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> Introduce a peripheral flushing mechanism to decouple peripheral
> metadata flushing from timing engine related flush.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      | 17 +++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h      | 10 ++++++++++
>   3 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d0f56c5c4cce9..e284bf448bdda 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -437,6 +437,9 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>   	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
>   		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
>   
> +	if (ctl->ops.update_pending_flush_periph && phys_enc->hw_intf->cap->type == INTF_DP)
> +		ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
> +
>   skip_flush:
>   	DPU_DEBUG_VIDENC(phys_enc,
>   		"update pending flush ctl %d intf %d\n",
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index e76565c3e6a43..bf45afeb616d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -39,6 +39,7 @@
>   #define   CTL_WB_FLUSH                  0x108
>   #define   CTL_INTF_FLUSH                0x110
>   #define   CTL_CDM_FLUSH                0x114
> +#define   CTL_PERIPH_FLUSH              0x128
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>   
> @@ -49,6 +50,7 @@
>   #define  MERGE_3D_IDX   23
>   #define  DSC_IDX        22
>   #define CDM_IDX         26
> +#define  PERIPH_IDX     30
>   #define  INTF_IDX       31
>   #define WB_IDX          16
>   #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
> @@ -151,6 +153,10 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>   		}
>   
> +	if (ctx->pending_flush_mask & BIT(PERIPH_IDX))
> +		DPU_REG_WRITE(&ctx->hw, CTL_PERIPH_FLUSH,
> +			      ctx->pending_periph_flush_mask);
> +
>   	if (ctx->pending_flush_mask & BIT(DSC_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>   			      ctx->pending_dsc_flush_mask);
> @@ -311,6 +317,13 @@ static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
>   	ctx->pending_flush_mask |= BIT(INTF_IDX);
>   }
>   
> +static void dpu_hw_ctl_update_pending_flush_periph(struct dpu_hw_ctl *ctx,
> +		enum dpu_intf intf)

I assume this is _v1.
Also the argument is misaligned.

> +{
> +	ctx->pending_periph_flush_mask |= BIT(intf - INTF_0);
> +	ctx->pending_flush_mask |= BIT(PERIPH_IDX);
> +}
> +
>   static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>   		enum dpu_merge_3d merge_3d)
>   {
> @@ -680,6 +693,10 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
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

What about the pre-active platforms?

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index ff85b5ee0acf8..5d86c560b6d3f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -122,6 +122,15 @@ struct dpu_hw_ctl_ops {
>   	void (*update_pending_flush_intf)(struct dpu_hw_ctl *ctx,
>   		enum dpu_intf blk);
>   
> +	/**
> +	 * OR in the given flushbits to the cached pending_(periph_)flush_mask
> +	 * No effect on hardware
> +	 * @ctx       : ctl path ctx pointer
> +	 * @blk       : interface block index
> +	 */
> +	void (*update_pending_flush_periph)(struct dpu_hw_ctl *ctx,
> +		enum dpu_intf blk);
> +
>   	/**
>   	 * OR in the given flushbits to the cached pending_(merge_3d_)flush_mask
>   	 * No effect on hardware
> @@ -264,6 +273,7 @@ struct dpu_hw_ctl {
>   	u32 pending_flush_mask;
>   	u32 pending_intf_flush_mask;
>   	u32 pending_wb_flush_mask;
> +	u32 pending_periph_flush_mask;
>   	u32 pending_merge_3d_flush_mask;
>   	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>   	u32 pending_dsc_flush_mask;

-- 
With best wishes
Dmitry

