Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4858A31A23
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 01:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83D910E778;
	Wed, 12 Feb 2025 00:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iOEzFF/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2689810E778
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:07:29 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5450b91da41so2618422e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739318847; x=1739923647; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rSvVq0Q4byuw3K4FZfEe4v2n2HhjFTVAI/WWeumGLwM=;
 b=iOEzFF/mJB4BwkngYlkUsvi8dfdYbZsr8TLjB3o5u0PKK0KL0Q/rBjFT4cdbUIAmlY
 yWQEUCuSNOsmfVXkkAaDjbCTUd35XF/L8zoHU6DoGMmegX3bQLdkW11k0May9yc+y8TJ
 r/Yt6EXVJtge/0rOZ1V2ajP5u9R7k8p9SBoEbcAHakdJt9eZRRowdbVshY+Yrhb+0xzU
 YoHLBoWIyd/yAzxa3pgHmvrwktm57qnF9p5/m/iAoA3nMgToO8YwOP8gUbzvnLm+ZCz9
 F69IhS/3dIx0lybuOndnvnDii3If5fG+iczQhnNqtyPz1G5qoGuuhwzdQVT/HhMiGPE8
 hCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739318847; x=1739923647;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rSvVq0Q4byuw3K4FZfEe4v2n2HhjFTVAI/WWeumGLwM=;
 b=ne7NMDxdfH4+lRyla6uZoIi36gjnvDMJFI2fPIMehYstoYpSJKSk7JTaWf0Ds6CVK8
 qkhHaXnB2d5LumgeXr6dx3wE5X8a/sNDJwMFz0F277Oz3SwZy2wN9oYdi/qyeGE8F6yc
 48KpSNg2k367WjBw5sUsI1EcuN0GSvn3Z5/bFMStGs6ApSRrDjB3PU8jhUej5hO/tk+W
 oF9LbJCSCGGnmkk3XzEQRUlJDD3LG8s41p+jxQOlQvP3HqtX3mQ4RjlZvc5zvjTmc2gw
 ODTICd5AaS9QMsYbGayRMIP3yLj0ab1mf45Ww7Rb2UaZK72Qf8hLQThLmkGRlwvmQvHZ
 Jvuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOcaHTtSCa4713GJcKYPJOwc0yH/DZ6RuBUpPFvEAcAFRWx/hJfg6KbWmjgA4DwjfZOUmhrcdOtYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvnn4Qp+LOsKrQB/GnQn+sgP0JR2f3zISe7opN7OtCpnjorfpo
 hQl/U3x4RxdfragZMX4icPGY/JHp/8hwFEgbWDMzZ4+kzdEoL3JdwQjOdl4qTGE=
X-Gm-Gg: ASbGncsU+Vkhd5bENhxCgdksP6f9GIzF33T63sYIPLlztrbqGwj85RCq3VF9Kly0MP0
 b0GrOANQ2bLYoBdfCYfGfAiRCx2WJmzY4YqWa1NoNu+0x+Wf25CG/I4rBabgJkm+/GxsfLm14UY
 DFVKlnSk14dRVls3YpU6clzFtVRCPXrzTJSTpOGEf/4kWDzcKZ89JtOL2whFdaYj5EA83KGchx/
 8DNZgQRwzpVGQ+PY/6D84Wef5y4SupQF6CK2yqSA+WCwEHHpLMs3LfMFvkdupP47mipdHMMdBhf
 fQpXRqNXLiKTz6mvQLOkjRzy8fO+ZTGksYmZc3E3dTKOjt/rDsGxNhCWkOl/OR9Rab4jaeg=
X-Google-Smtp-Source: AGHT+IEYSYjM6e26W3BebaqVj9AEp0qCBuSkwbasndm6u40vD94b8fZ5bLT2RmF5vB9zoS1z8G6pdw==
X-Received: by 2002:a05:6512:745:b0:545:c08:e193 with SMTP id
 2adb3069b0e04-5451810fe44mr196032e87.27.1739318847359; 
 Tue, 11 Feb 2025 16:07:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450bb646a5sm808177e87.146.2025.02.11.16.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:07:26 -0800 (PST)
Date: Wed, 12 Feb 2025 02:07:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Allocate the number of LMs based on
 max_mixer_width to support 4 streams MST case
Message-ID: <zri44j6baegrcxmnac3o7ujtrlm2ybhon4hq3ondvdbcqfhpa2@zjxcprel7zv7>
References: <20250211-dp_lm-v1-1-deeca9ac9bd9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-dp_lm-v1-1-deeca9ac9bd9@quicinc.com>
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

On Tue, Feb 11, 2025 at 06:37:43PM +0800, Yongxing Mou wrote:
> In 2x2 mst case, each 2k monitor will use 2 lms, but dpu_8_4 only have
> 6 lms, so let 2k only use one lm to support such case.

DisplayPort MST is not supported. Please work with Abhinav to get it
into his patch. Also it's LM and LMs.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>

This list of SoBs doesn't make sense.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..e8846bf8edc5f9b2b3b7f093e4d5aad75de53da1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -677,7 +677,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  	else if (!dpu_kms->catalog->caps->has_3d_merge)
>  		topology.num_lm = 1;
>  	else
> -		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> +		topology.num_lm = (mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width) ?
> +				   2 : 1;

Please extend commit message to describe how your change affects other
platforms.

>  
>  	if (crtc_state->ctm)
>  		topology.num_dspp = topology.num_lm;
> 
> ---
> base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
> change-id: 20250211-dp_lm-8f8ef15f5955
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry
