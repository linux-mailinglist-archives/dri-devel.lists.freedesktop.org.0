Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB65082F6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D5110F1C1;
	Wed, 20 Apr 2022 07:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE0510F1B8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:55:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b21so1382433lfb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T5KtR5lRhhPM3FKeYo+8y/vzpSYPxhvdp4ZbKNwZlEE=;
 b=MJjxxTHUOSB3GJcE9f4Q4cvOmxZK/qU4J1Stq6dxohJP2iVp4CheOTf7g9HTO1Glig
 lvI9PiN9qS4tRJKI9cLWd0UlnsNizhix5URalvu5jGuGKO+9XD+NEUK4imJ+L+t6PdGB
 5MNrrD+yxISe/p8IqgF+cYhbbXXGvKRd/XgYHQxvg7r3jtNN/S9E0r0/tHPjkzVO5pCE
 joO/CDQx5bMTHUNGz5YstY1lVUu/hEbwGEMM7Pf6tNvX4MmNh45nmwCo0EpJtbalvz3a
 SaGXnROy+ks1UBPL5YoUg5DNXgU3xSESEjkYYOQONzzazkJ/AKZ7CUrHviI7OzbeW+Fc
 RpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T5KtR5lRhhPM3FKeYo+8y/vzpSYPxhvdp4ZbKNwZlEE=;
 b=xIXZLHtzX7HLXcQFptfowWqrdploHMLmu+cTJa4ZKOwmWF/nqANyLhIqdrhnN6C56Q
 tp5zuHcGDN+8BpKA7mpGTWfDv1WmbTL8bMRo0yUXGxCzeY2wX1G20eyPfEcwKBFtVSqT
 MPO6pQCHP/rzwh1mEifD0Vnp0f2YbtyYg8vCAQzFlZub/ByJ7z1+KcZEaSz13+sCh6zc
 Us6o0s+n14puuSFV+wPThoWghHlebQwvfn0Mb4nafExID3Wa6LY3WZ+ubUHJ0IJ3WViR
 b4xlvx57bqlk4XL2DQC+hvTOjhDJcySlKvOtpuZzCcVs/NGuWGnk5ITfG64vH0cm68oX
 acXw==
X-Gm-Message-State: AOAM531x3Un1i4CqQYognlvfV2VzIYbwOv4qrMrkZgD0v3CO7hqiw1CG
 jDZNOIoErRR5dPBhAh3zaaTjvQ==
X-Google-Smtp-Source: ABdhPJwUtL2Bj1LnTN1Kaf81iarLQr53GEhtFPjtpmcrTizMEAEwWzs46ow9RcOcVgIzdeWttOp/EQ==
X-Received: by 2002:a05:6512:400a:b0:46b:8cd9:1af8 with SMTP id
 br10-20020a056512400a00b0046b8cd91af8mr14465289lfb.545.1650441312951; 
 Wed, 20 Apr 2022 00:55:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a2e83cc000000b0024ee0d96123sm10374ljh.122.2022.04.20.00.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:55:12 -0700 (PDT)
Message-ID: <8ad828bb-8614-561d-4e3d-fe901e665077@linaro.org>
Date: Wed, 20 Apr 2022 10:55:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 16/17] drm/msm/dpu: gracefully handle null fb commits
 for writeback
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-17-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-17-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2022 04:46, Abhinav Kumar wrote:
> kms_writeback test cases also verify with a null fb for the
> writeback connector job. In addition there are also other
> commit paths which can result in kickoffs without a valid
> framebuffer like while closing the fb which results in the
> callback to drm_atomic_helper_dirtyfb() which internally
> triggers a commit.
> 
> Add protection in the dpu driver to ensure that commits for
> writeback encoders without a valid fb are gracefully skipped.
> 
> changes in v2:
> 	- rename dpu_encoder_has_valid_fb to dpu_encoder_is_valid_for_commit
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c            |  9 +++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h         |  6 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 12 ++++++++++++
>   5 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7763558..d65e124 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -869,6 +869,13 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>   
>   	DPU_ATRACE_BEGIN("crtc_commit");
>   
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +			crtc->state->encoder_mask) {
> +		if (!dpu_encoder_is_valid_for_commit(encoder)) {
> +			DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
> +			goto end;
> +		}
> +	}
>   	/*
>   	 * Encoder will flush/start now, unless it has a tx pending. If so, it
>   	 * may delay and flush at an irq event (e.g. ppdone)
> @@ -891,6 +898,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>   		dpu_encoder_kickoff(encoder);
>   
>   	reinit_completion(&dpu_crtc->frame_done_comp);
> +
> +end:
>   	DPU_ATRACE_END("crtc_commit");
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b1475dd..d07e3ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1850,6 +1850,27 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>   		dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
>   }
>   
> +bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	unsigned int i;
> +	struct dpu_encoder_phys *phys;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
> +		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +			phys = dpu_enc->phys_encs[i];
> +			if (phys->ops.is_valid_for_commit && !phys->ops.is_valid_for_commit(phys)) {
> +				DPU_DEBUG("invalid FB not kicking off\n");
> +				return false;
> +			}
> +		}
> +	}
> +
> +	return true;
> +}
> +
>   void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 6ceec1d..781d41c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -196,4 +196,10 @@ void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
>   void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>   		struct drm_writeback_job *job);
>   
> +/**
> + * dpu_encoder_is_valid_for_commit - check if encode has valid parameters for commit.
> + * @drm_enc:    Pointer to drm encoder structure
> + */
> +bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
> +
>   #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 5452f98..04d037e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -142,6 +142,7 @@ struct dpu_encoder_phys_ops {
>   			struct drm_writeback_job *job);
>   	void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
>   			struct drm_writeback_job *job);
> +	bool (*is_valid_for_commit)(struct dpu_encoder_phys *phys_enc);
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 128317fe..9acbce0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -667,6 +667,16 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
>   	wb_enc->wb_conn = NULL;
>   }
>   
> +static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> +
> +	if (wb_enc->wb_job)
> +		return true;
> +	else
> +		return false;
> +}
> +
>   /**
>    * dpu_encoder_phys_wb_init_ops - initialize writeback operations
>    * @ops:	Pointer to encoder operation table
> @@ -687,6 +697,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
>   	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
>   	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
> +	ops->is_valid_for_commit = dpu_encoder_phys_wb_is_valid_for_commit;
> +
>   }
>   
>   /**


-- 
With best wishes
Dmitry
