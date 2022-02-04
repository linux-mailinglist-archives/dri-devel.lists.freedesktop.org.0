Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A214AA48F
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 00:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B397010EAE2;
	Fri,  4 Feb 2022 23:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B42810EAE2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 23:42:30 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k13so15499743lfg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 15:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9vy38E4JVnD68Bkm9KtEPkvBWxdhLuFhS9Sl7Qc8YiE=;
 b=jD7sDeKEWY7nW+EAB2tYPiLsM15u0ioStaIADx/jWncZHJzYQD2pouzfGM7/yh+lym
 2EgAwirkH690kdfzHIqKg3jvEQpaD76eSSaUOwDNeek8uhMixZPDl/zw3P9D6821MrMm
 NvCH6ZjbYPJTEvtI0RDkv/SIk8qEy8kRR0nqt7cDNZJwhWkbtv5mexqERSwOv4e2onNT
 HwKvXOE5OWfSoJ+7hvvCz1l8TFVLtgsQZbPXYvNE69qP24yVFWTWkKtcffSGtlm/Ff2D
 kHdgTSK4Nh7nqW9RWKhjN9aq9euw6GUYEMtRdrOBUDW8qSv/hpu+E26Vf98TQs3f7sb7
 Udbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9vy38E4JVnD68Bkm9KtEPkvBWxdhLuFhS9Sl7Qc8YiE=;
 b=8HhXBqHFsZShFFQsWWBfvDL/J+wEkOHUnotMonC7PRtv5DHyHPbPzaK0reWeIxadZ/
 KqrdIG9UEVWx/i9/nM+6PVEOw2Hp60knAF+h3n7o/ziMG30fo5Ck76KMlUOnFloESJQc
 SWKcrp1k5WeCy/F4reDcPZnEJ0T8RFbFCFxvQDe5djyYPzYlU/5pWy8Ye2PwryxES//x
 X+ssR/krn6a3bT4fE29RqF13oCZvnASJzJhmgDEH7/XgrJWloi3SYAkt2nFOybukI5P4
 feZ2982+kB0aP/l3/J+qOYQ4c5G3kiiT0OPF2nVAeKVc8EQt9vpzkF7SwH5PWf8H/5yG
 5lGA==
X-Gm-Message-State: AOAM5322P3jrUNhflWziuw4pe1SjDuqZ12mvnp+noEfuNIhS0kZ8iwgR
 buhhMM1aCG5r+wQRGRH/oLu+dw==
X-Google-Smtp-Source: ABdhPJwdZM7DMeGe39kXSqF6vI6V6ASyjinB2RGh4iB90UoTjkcMrYXnpWg88KVgt4S8Bs9tukKo/g==
X-Received: by 2002:a05:6512:22c9:: with SMTP id
 g9mr973676lfu.148.1644018148552; 
 Fri, 04 Feb 2022 15:42:28 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t27sm440574ljk.138.2022.02.04.15.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 15:42:28 -0800 (PST)
Message-ID: <940f739f-219f-3169-dcf0-c270dbe815e9@linaro.org>
Date: Sat, 5 Feb 2022 02:42:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/12] drm/msm/dpu: add encoder operations to
 prepare/cleanup wb job
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-8-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-8-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2022 00:17, Abhinav Kumar wrote:
> add dpu encoder APIs to prepare and cleanup writeback job
> for the writeback encoder. These shall be invoked from the
> prepare_wb_job/cleanup_wb_job hooks of the drm_writeback
> framework.

Having dpu-encoder-wide API for the single case of WB looks like an 
overkill. But I think we have no other choice here.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 34 ++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h      | 16 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  5 ++++
>   3 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 947069b..b51a677 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -958,6 +958,40 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   	return 0;
>   }
>   
> +void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
> +		struct drm_writeback_job *job)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	int i;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (phys->ops.prepare_wb_job)
> +			phys->ops.prepare_wb_job(phys, job);
> +
> +	}
> +}
> +
> +void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
> +		struct drm_writeback_job *job)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	int i;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (phys->ops.cleanup_wb_job)
> +			phys->ops.cleanup_wb_job(phys, job);
> +
> +	}
> +}
> +
>   static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   				      struct drm_display_mode *mode,
>   				      struct drm_display_mode *adj_mode)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index cc10436..da5b6d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -171,4 +171,20 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
>    */
>   int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>   
> +/**
> + * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * @job:        Pointer to the current drm writeback job
> + */
> +void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
> +		struct drm_writeback_job *job);
> +
> +/**
> + * dpu_encoder_cleanup_wb_job - cleanup writeback job for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * @job:        Pointer to the current drm writeback job
> + */
> +void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
> +		struct drm_writeback_job *job);
> +
>   #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 07c3525..7b3354d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -7,6 +7,7 @@
>   #ifndef __DPU_ENCODER_PHYS_H__
>   #define __DPU_ENCODER_PHYS_H__
>   
> +#include <drm/drm_writeback.h>
>   #include <linux/jiffies.h>
>   
>   #include "dpu_kms.h"
> @@ -146,6 +147,10 @@ struct dpu_encoder_phys_ops {
>   	void (*restore)(struct dpu_encoder_phys *phys);
>   	int (*get_line_count)(struct dpu_encoder_phys *phys);
>   	int (*get_frame_count)(struct dpu_encoder_phys *phys);
> +	void (*prepare_wb_job)(struct dpu_encoder_phys *phys_enc,
> +			struct drm_writeback_job *job);
> +	void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
> +			struct drm_writeback_job *job);
>   };
>   
>   /**


-- 
With best wishes
Dmitry
