Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2D99873C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475D910E8EE;
	Thu, 10 Oct 2024 13:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vDvg9xQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D02B10E8ED
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 13:10:48 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5398e58ceebso846859e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728565846; x=1729170646; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/pNpS+njt9cPkWZ6/CJqsL3zGajZBdNwsZNIu0dSvWo=;
 b=vDvg9xQK5zYFv/1rlXifvAgrq2bkOz2wvI/kx1ijV+0oXJMtwbcqg92c29etL8mnt6
 yZBiQzgAVBMZq5rf0DA0czVJEkpvLGVKIy1Rrx4r2Ks8egrqGvuDDGv85cZTW9MMeYxE
 TkoZ0HKXxylePi9kcn77IZPqw+RqGRX3iHH3YDgW4fMvWny8C3YN2oHhcyirqQLdpwNk
 Tx3KRmNYQ5MDpBihn0CT4F0Q+9tHwJDD56JeRUV9w9Y8cUIFGn9vOaL7Y85dVKvvDuL1
 Q/ztRwo8EKgcWZKgFcS7yVuBZFIrqnwkLumzZB80hE/glXRHWPqgv6OlPffRNYJeVJDI
 hCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728565846; x=1729170646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pNpS+njt9cPkWZ6/CJqsL3zGajZBdNwsZNIu0dSvWo=;
 b=QcyjH15nHLWt4fxz1LgpMoFGAUBIc7OHbhhOeqMrbzE6DKGUBSPXJalPg+TVudAl8f
 9Z1+8XSCj0/5/pFWmtdJOYoi5IenxEMdsEujY+rfgBGeX6dmED58r2Kvw4/8TosgfXp2
 4P+WolaXv8BTt1NqWFuhbMOJDTLvp/6SRmtyhREsJLNh2eHeuOEyeUpoi3fKP3Vf6eg+
 sDxwRxccvk2ZnEFnWiPVQVWpqHqKin7g60dHEFpNG39yxaL5E3uTYhA7+67tVBouS4HY
 iNR1zokYoRvjA+WkCutyaAzg7vTb/f1KiLD5jfUU2Dg/XjQ3A+lgQERD+pLmAgupwE0L
 AB5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/xC+ig5hgSqIDtAHRQhMP4yvpMX8UMvjRZL82/v0voyPm7Jva7qtzn5uW8CPCVaggMy55dniJiL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1qMLHiI7V9LQQAaOtIe6g98yYU9oUPWxCbyidPL3lctKCAqqE
 muMpOuUxDIcjpUXnB8kcmFaFvb+Yzq5BJ7GsLqyMell2UVEtOUm21qjmlnOYPWs=
X-Google-Smtp-Source: AGHT+IFhrlaouxAJK8Q5oz79aOgKS1/HVBFwAarBhM3XTq5eethNmfRnt5mwLzZOc/yNhCF/pyuHOQ==
X-Received: by 2002:a05:6512:6409:b0:537:a82c:42ec with SMTP id
 2adb3069b0e04-539c98689f5mr1180968e87.4.1728565846042; 
 Thu, 10 Oct 2024 06:10:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb905aabsm247052e87.295.2024.10.10.06.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 06:10:45 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:10:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/14] drm/msm/dpu: bind correct pingpong for quad pipe
Message-ID: <brvjrwnwzkbobk47xb6i6ulzxabigsujomx4yhaa7oy5vrwvle@tn2ni4wcvdee>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-7-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-7-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:20PM GMT, Jun Nie wrote:
> There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
> interface to 3rd PP instead of the 2nd PP.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index bd2509985c4d0..dfe282c607933 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1100,7 +1100,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_lm, num_ctl, num_pp, num_dsc;
> +	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1171,9 +1171,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  
>  	cstate->num_dscs = num_dsc;
>  	cstate->num_mixers = num_lm;
> -

Nit: unrelated

>  	dpu_enc->connector = conn_state->connector;
>  
> +	/*
> +	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
> +	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
> +	 */
> +	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
> +
>  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>  		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
> @@ -1195,7 +1200,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  			return;
>  		}
>  
> -		phys->hw_pp = dpu_enc->hw_pp[i];
> +		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
>  
>  		phys->cached_mode = crtc_state->adjusted_mode;
>  		if (phys->ops.atomic_mode_set)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
