Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE26622B77
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6713310E5BD;
	Wed,  9 Nov 2022 12:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAC310E5B5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 12:23:37 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id d20so25468970ljc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 04:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LBaghFCNLCn53Zo0ESykylrMeqC7VBs3SaG0Oah8iBU=;
 b=K4f2Tkz0IdNrCtCn+w15VBUcN0WUOBldpK7GtWpm9EJ3B6hz/HMTwR5xgLmvc1hFlb
 aqthXrfpzJahaCPc+JdQshbKg7YS+NdzLIoVejxPlg/RVwAEcXlIvy8gyYZqAvZ1rbys
 9zuSlthowI2MXjF8NTVx54Yl+m2rFOR299V04GeD1WGOJRnJcMrcacQ9GzfeLa+bN0Fk
 Zu0+f6ovEGQZEouwd9F2DQL0VqhJJFKZTXxc4CMc7IzqtM8rV5t3g08HmDqLwjzwAhSc
 vCwQxsygv/XO0GQi5nj9cW4ndHsxDpkxjsNbccxvwSV4C7CLPHQJkiMo2jH1HeSo9UAf
 gRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LBaghFCNLCn53Zo0ESykylrMeqC7VBs3SaG0Oah8iBU=;
 b=m+MGEFoYNXJX5kxYdGg1/8fsk2Kcr5hY//6+/ZNODduDoad9ESsOdFGCWkk4tUvDcH
 BM97oSQsFz7lme/lI9ev5KXaBbo0s7pqKvxmS0juiMp1XAZxtPV5pNGExd/+ni8EODNe
 HL1vyHgczvK8Bte8HzQj3ORcbCq7SwvP3qsTtoPXnGpl1NDNcecvU1LB45CLOPA2M8vo
 +wN7hI87uKhlDqYXujyPglTJzANFlARnEfYzqT4GspXY4VX21bvyenuHJ7BTxYrRzXyM
 710Z80AbH5J33+UxAqMtk8ALrZlfXRiyJcH4QX4bzTzt6Vd2cRAyol5JWdx183c/gklU
 1InA==
X-Gm-Message-State: ACrzQf2MAhinkS1KMnpSqr2wbEtoi1DkDleQFmhrgus74rgnfJumgL/8
 YnFZhgzIgjRFeRzOE8v1sDsODg==
X-Google-Smtp-Source: AMsMyM5Tb4oJvE2LEWjw2h4YUxtu3A8jk9pEJTwt1NJBdxpLQRsCwMnfYNsGyhbK0CJ1a0UvbBQsPg==
X-Received: by 2002:a05:651c:2009:b0:277:5992:b532 with SMTP id
 s9-20020a05651c200900b002775992b532mr16484963ljo.506.1667996615402; 
 Wed, 09 Nov 2022 04:23:35 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a2eb63a000000b0026dcf238c50sm2135233ljn.127.2022.11.09.04.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:23:35 -0800 (PST)
Message-ID: <3f054ff6-3868-d0c0-a8ad-66b87489714f@linaro.org>
Date: Wed, 9 Nov 2022 15:23:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 3/4] drm/msm/disp/dpu1: helper function to determine if
 encoder is virtual
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
 <1667996206-4153-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667996206-4153-3-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2022 15:16, Kalyan Thota wrote:
> Add a helper function to determine if an encoder is of type
> virtual.

Please use commit messages to describe why you are doing something, not 
what you are doing. In this case I can predict, why do you need this API 
without going to patch 4.

> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5d6ad1f..4c56a16 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2469,6 +2469,17 @@ bool dpu_encoder_is_external(struct drm_encoder *drm_enc)
>   	return dpu_enc->disp_info.is_external;
>   }
>   
> +bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	if (!drm_enc)
> +		return false;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	return (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_VIRTUAL);
> +}
> +
>   struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   		int drm_enc_mode)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 43f0d8b..6ae3c62 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -136,6 +136,12 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
>   bool dpu_encoder_is_external(struct drm_encoder *drm_enc);
>   
>   /**
> + * dpu_encoder_is_virtual - find if the encoder is of type virtual.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc);
> +
> +/**
>    * dpu_encoder_init - initialize virtual encoder object
>    * @dev:        Pointer to drm device structure
>    * @disp_info:  Pointer to display information structure

-- 
With best wishes
Dmitry

