Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5C83CE56
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAD110E5FA;
	Thu, 25 Jan 2024 21:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2977F10E531
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:17:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5100cb238bcso4976908e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706217408; x=1706822208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z9viDYpLwnvLaN/jy8xMl/NBPq6tMcsa5M1h15mEwBs=;
 b=x6U/sRHLd5jXgO+3tpGn5TiLK4hYmdBylJKa4kzmU6dVNJDJlRAzaRKTXun+J9tfPo
 JK+QAXtTvkJwHdB0xSW+zzO9Q7+7JMX6xCb8BtvrO8NPB0uYXZsa/Os1BuAbxJHWEoaT
 Wi4CT5grTK6lcCFpKn/9YQ+5Tc66/c9U3wUEWTpjcKV3q4vZdmPvTbQOw0FfM1KNp+U/
 GFuOzgRQm5oacpOFYWcFUD6d4c4Ei1B3NLiVPpkadvkUsox+bJTp0wbcg85zC5KMkxS6
 DmfDOPmXr29ZSnKteLFf+M3e8Duj5NfDaH+pnvKALlqvENsESS/1cA5+uGdvrDgybvSX
 KD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706217408; x=1706822208;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z9viDYpLwnvLaN/jy8xMl/NBPq6tMcsa5M1h15mEwBs=;
 b=Nj6QWVhDKs4AYGPAvKxQklnXwIDCQGizLmr2bpb0J0RQe7zm7Vxh49/cWdTk+IOvQi
 KarRvw6IB8lzUaNry4ejdR/dTL/6gpHcnTE9TdJ1rRBJUea2Jy/7V9lmsKV/mjZCDPS0
 Gz6v1yS58YGP6p+K+CbBLtIXaimsbvn20ePp/fqSb3R/985WJkzsuPVB/EjIy5OzxHRa
 OroOTKkTaK5JhBBtuKiLg6R0bu8l0P9L01AC/41hqq6ERgi7LIXBuexJ556vCuZIvgCS
 Yo811sDKJAH7/wALgdcHXWzE38hSdSbNxzEuvUUSqHzNj37tQt+kKQFyAQrEOArS92EG
 hEqg==
X-Gm-Message-State: AOJu0Yx+7p2udDUgG1fU+QkY01CuVJ6hLT7RrP+aTHrKFKM41YUe8JR8
 Fw6y4AWVjd6AX59/udhpPL8DlRzkZ8ul2rhi0IMgt0SbJvM8qTp7eJG0J9GjqeU=
X-Google-Smtp-Source: AGHT+IE8iJTzvzHHwVKKh6b1k6IKHEa/eYfZWnA9MFd02jjypWVH5F4G2bNabmj0lwsfdqvUDFLnsw==
X-Received: by 2002:a05:6512:ba5:b0:510:135c:c060 with SMTP id
 b37-20020a0565120ba500b00510135cc060mr248723lfv.76.1706217408532; 
 Thu, 25 Jan 2024 13:16:48 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a19ac49000000b0051021c54018sm113397lfc.251.2024.01.25.13.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:16:48 -0800 (PST)
Message-ID: <53356805-21f4-4329-bff0-82d266ab9399@linaro.org>
Date: Thu, 25 Jan 2024 23:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm
 to dpu_encoder
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-3-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-3-quic_parellan@quicinc.com>
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
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> Move dpu_encoder_helper_phys_setup_cdm to dpu_encoder in preparation for
> implementing CDM compatibility for DP.

Nit: s/CDM compatibility/YUV support/. It might make sense to spell it 
out that YUV over DP requires CDM.

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 78 +++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  9 ++
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 84 -------------------
>   3 files changed, 87 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 83380bc92a00a..6cef98f046ea6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2114,6 +2114,84 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   	ctl->ops.clear_pending_flush(ctl);
>   }
>   
> +void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> +				       const struct dpu_format *dpu_fmt,
> +				       u32 output_type)

My email client suggests that the parameters are not idented properly 
anymore.

> +{
> +	struct dpu_hw_cdm *hw_cdm;
> +	struct dpu_hw_cdm_cfg *cdm_cfg;
> +	struct dpu_hw_pingpong *hw_pp;
> +	int ret;
> +
> +	if (!phys_enc)
> +		return;
> +
> +	cdm_cfg = &phys_enc->cdm_cfg;
> +	hw_pp = phys_enc->hw_pp;
> +	hw_cdm = phys_enc->hw_cdm;
> +
> +	if (!hw_cdm)
> +		return;
> +
> +	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
> +		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
> +			  dpu_fmt->base.pixel_format);
> +		if (hw_cdm->ops.bind_pingpong_blk)
> +			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
> +
> +		return;
> +	}
> +
> +	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> +
> +	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
> +	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
> +	cdm_cfg->output_fmt = dpu_fmt;
> +	cdm_cfg->output_type = output_type;
> +	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
> +			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
> +	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
> +
> +	/* enable 10 bit logic */
> +	switch (cdm_cfg->output_fmt->chroma_sample) {
> +	case DPU_CHROMA_RGB:
> +		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> +		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +		break;
> +	case DPU_CHROMA_H2V1:
> +		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> +		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +		break;
> +	case DPU_CHROMA_420:
> +		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> +		cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
> +		break;
> +	case DPU_CHROMA_H1V2:
> +	default:
> +		DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
> +			  DRMID(phys_enc->parent));
> +		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> +		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> +		break;
> +	}
> +
> +	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
> +		  DRMID(phys_enc->parent), cdm_cfg->output_width,
> +		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
> +		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
> +		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
> +
> +	if (hw_cdm->ops.enable) {
> +		cdm_cfg->pp_id = hw_pp->idx;
> +		ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
> +		if (ret < 0) {
> +			DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
> +				  DRMID(phys_enc->parent), ret);
> +			return;
> +		}
> +	}
> +}
> +
>   #ifdef CONFIG_DEBUG_FS
>   static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 37ac385727c3b..310944303a056 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -381,6 +381,15 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>    */
>   void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
>   
> +/**
> + * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
> + * @phys_enc: Pointer to physical encoder
> + * @output_type: HDMI/WB
> + */
> +void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> +				       const struct dpu_format *dpu_fmt,
> +				       u32 output_type);

Again, indentation.

> +
>   /**
>    * dpu_encoder_vblank_callback - Notify virtual encoder of vblank IRQ reception
>    * @drm_enc:    Pointer to drm encoder structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 072fc6950e496..400580847bde7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -264,89 +264,6 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>   	}
>   }
>   
> -/**
> - * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
> - *                                     This API does not handle DPU_CHROMA_H1V2.
> - * @phys_enc:Pointer to physical encoder
> - */
> -static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> -					      const struct dpu_format *dpu_fmt,
> -					      u32 output_type)
> -{
> -	struct dpu_hw_cdm *hw_cdm;
> -	struct dpu_hw_cdm_cfg *cdm_cfg;
> -	struct dpu_hw_pingpong *hw_pp;
> -	int ret;
> -
> -	if (!phys_enc)
> -		return;
> -
> -	cdm_cfg = &phys_enc->cdm_cfg;
> -	hw_pp = phys_enc->hw_pp;
> -	hw_cdm = phys_enc->hw_cdm;
> -
> -	if (!hw_cdm)
> -		return;
> -
> -	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
> -		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
> -			  dpu_fmt->base.pixel_format);
> -		if (hw_cdm->ops.bind_pingpong_blk)
> -			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
> -
> -		return;
> -	}
> -
> -	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> -
> -	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
> -	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
> -	cdm_cfg->output_fmt = dpu_fmt;
> -	cdm_cfg->output_type = output_type;
> -	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
> -			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
> -	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
> -
> -	/* enable 10 bit logic */
> -	switch (cdm_cfg->output_fmt->chroma_sample) {
> -	case DPU_CHROMA_RGB:
> -		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> -		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> -		break;
> -	case DPU_CHROMA_H2V1:
> -		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> -		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> -		break;
> -	case DPU_CHROMA_420:
> -		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
> -		cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
> -		break;
> -	case DPU_CHROMA_H1V2:
> -	default:
> -		DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
> -			  DRMID(phys_enc->parent));
> -		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
> -		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
> -		break;
> -	}
> -
> -	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
> -		  DRMID(phys_enc->parent), cdm_cfg->output_width,
> -		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
> -		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
> -		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
> -
> -	if (hw_cdm->ops.enable) {
> -		cdm_cfg->pp_id = hw_pp->idx;
> -		ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
> -		if (ret < 0) {
> -			DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
> -				  DRMID(phys_enc->parent), ret);
> -			return;
> -		}
> -	}
> -}
> -
>   /**
>    * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
>    * @phys_enc:	Pointer to physical encoder
> @@ -399,7 +316,6 @@ static int dpu_encoder_phys_wb_atomic_check(
>   	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
>   }
>   
> -

irrelevant, please drop.

>   /**
>    * _dpu_encoder_phys_wb_update_flush - flush hardware update
>    * @phys_enc:	Pointer to physical encoder

-- 
With best wishes
Dmitry

