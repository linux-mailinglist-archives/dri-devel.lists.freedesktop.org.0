Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DAF966800
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1EB10EAB8;
	Fri, 30 Aug 2024 17:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WOg0swgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909C910EAB6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:31:59 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-533488ffaf7so2899222e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725039118; x=1725643918; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oVSYJZ8Ei4cvPl9DgIsE5I78GhgQxtf/dQWxZMnQ4Ag=;
 b=WOg0swgXjPlflk8FEvMpgO7Jmbdeub0KQNSJHSO/xico0ZNIgEcMTXJKpeZivJfaRn
 M7fjevfAGOWuK50DuWmBD7DXsfUY9bdSzteVJmRIMWbhXJmXB4QvvMVHJ+m54n9ABhVC
 dV2bzyoQbxDQIrztqKZT3I82w6k/p3IefN9iaje5T8VCSD6bjOE8sUr53bumjOMNtwmS
 ezopcOo3BP0bb6Ztm0kW2RISfxMozAuwvwnGLGem3S13Le7EABTqDn0ntbuwtW9q/nVR
 ukPI5HQDVK0fgybFj7BZwrxwVtq9WQde3p/lGsItva92azZJRlIpQH70SFySDi7597Wu
 El5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725039118; x=1725643918;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVSYJZ8Ei4cvPl9DgIsE5I78GhgQxtf/dQWxZMnQ4Ag=;
 b=jKpc/h6TS/7Ou6XWVJMscYWvqP9ROkeI0GX7mnTLaMJydaX/B4LFtw27MJpigu27gf
 itNYZpvHbypqfyv09GFZ2Ge7UWoJDmaIjMPiP+FGP2gozxmuq0/8r0fnWnr2hT7c3QH3
 V/eerK0/arLLo/q0YVGQ/Nh//dIfQQOl1y8g9JwQEtYBOJtJBBbhbrr+lGxOOwnLocDl
 tV3Kl/J62NdHQcOv/+8bbYDXMm5S6w8fiZ78vabRsahelj4vxBAD3+A5BFPYGL6rPlQP
 JGmh+vN4qsDkKu01nOULsyxI/cex73u4g1HuFLTcYJUoZiJ8vC215ClJ2/NBfwy40Csh
 5cpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1bKGppjfbr0NW1kXTPKpN0L8cq+2uHJGKKdzP37CGyciJMCqje5e/2w5nUEchkzyk63qp23O/5EQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/dw1/kIQwZO4AH1IYvveD31zNUnNKZrqCuyxJrP5x2b7TTJlo
 g9tT038e0SEZ4uCBbfjPsqpvr0OkXzVoqNyMSx+O2Z36B3VdqCAIMGcCU7iEPjUEISmpjdxe3AL
 z
X-Google-Smtp-Source: AGHT+IFh4H/WWx4Qa+vKO6krpjLgwhrJdZoe1PK4esC7igv3wvWH3VSPKe4yX8cIQPl6dqk5jTsx7Q==
X-Received: by 2002:a05:6512:1251:b0:52b:9c8a:734f with SMTP id
 2adb3069b0e04-53546bb2b1fmr2135489e87.50.1725039117000; 
 Fri, 30 Aug 2024 10:31:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079b8f9sm701354e87.46.2024.08.30.10.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:31:56 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:31:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 18/21] drm/msm/dpu: Start frame done timer after encoder
 kickoff
Message-ID: <nj5stynavntbe4neop7b7pul5qm2dns5tfnucxhpvubmbs3dsf@3orpp3swrkey>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-18-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-18-502b16ae2ebb@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 29, 2024 at 01:48:39PM GMT, Jessica Zhang wrote:
> Create a separate API for starting the encoder frame done timer and call
> it after the encoder kickoff is finished
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 ++++++++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 +
>  3 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c8ef59af444c..daf5f751f584 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -970,8 +970,10 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  
>  	dpu_vbif_clear_errors(dpu_kms);
>  
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> +	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
>  		dpu_encoder_kickoff(encoder);
> +		dpu_encoder_start_frame_done_timer(encoder);
> +	}
>  
>  	reinit_completion(&dpu_crtc->frame_done_comp);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index bde385318018..9d495a186eb8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1945,18 +1945,12 @@ bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
>  	return true;
>  }
>  
> -void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
> +void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc)

Docs please. With this fixed and with the reason for the change being
added to the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  {
>  	struct dpu_encoder_virt *dpu_enc;
> -	struct dpu_encoder_phys *phys;
>  	unsigned long timeout_ms;
> -	unsigned int i;
>  
> -	DPU_ATRACE_BEGIN("encoder_kickoff");
>  	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -
> -	trace_dpu_enc_kickoff(DRMID(drm_enc));
> -
>  	timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
>  			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
>  

-- 
With best wishes
Dmitry
