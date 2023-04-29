Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281506F21C3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A162F10E126;
	Sat, 29 Apr 2023 00:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF21710E126
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 00:56:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so1766415e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 17:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682729797; x=1685321797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=321lwNICJElX/vTBOCXvsvigu8PI/jfoCt5tMZAwHqE=;
 b=pIub9jNybPkX3mF03qU12uB1+XIpzmkgBIoTlDHh0pshQ6vcp/JgpL9xhzx0/HvO5d
 LvBzLGU9ZnkAnPkzAPIKlIxpC5yn4FlYDWCqDb7YK+gRsCbNO7pUDGjkqTCfIF7U9WqH
 zbVIg+2hcFAPpqcH6TF/1odgwVF9OYr4ThC8kV81cagIJzRLdM/FF74S0f/av4C6+v8X
 17AU2wO+74HztTt/HNtdhXq5nazQJG9WVAQWlUs3/4ewDuIefcneuLq3MZM//m3Gp1EK
 0xyY3VeNEAykzOtXX/TzHE+gryERVgzki0cJECJoo+bbEZ4y+B6JY+ajBlHu4A6S1zRz
 teJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682729797; x=1685321797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=321lwNICJElX/vTBOCXvsvigu8PI/jfoCt5tMZAwHqE=;
 b=hH9VcMzJ9ByC7S1JbZ4f6LoGhNMdEa/pJYEVYry9fIXfYl2FvIEOVjmzUh7WnQDIB5
 w2pb/I6TtRZlNDjxp6v0wjT1ELxC/ZTyUcxBUUhzJ45ROx1B12EFxKi90Vh83r+3vcbx
 E2v/yrh5pbZo/7jvWFknOsAC9G3M6IHLfqAnrLmBQSs4ls1L4QLcCvhWtSFByBPg9Nr6
 Nn91CrDs+4q6piZI0X6qqQPUMWS4R/m5zBIUQA5I0VTGflo6PazTXfAJHU3V2Q3i4+Jc
 JG3xWXCpSlstl6OBPlpHXllNg+7XOoQmpEtUzMUJ7vPao0aZG9seiXmJ2O0+rGbTi8NN
 e2Xg==
X-Gm-Message-State: AC+VfDzPFllHnksnpOiwGonZLxJ6WXPy4XNw/npGq0T2RRjoqfTCbDWY
 jNAEZUTURrTAmsD9k9i4e6WL6A==
X-Google-Smtp-Source: ACHHUZ57bL2MXFm0lrKnZoHfQR0p3AAbCS3Fp+6GYZjU40ieEDBeKWmJWyDp7jzVQ3Q6QWF2yfpbRQ==
X-Received: by 2002:a1c:f019:0:b0:3f1:78a7:6bd2 with SMTP id
 a25-20020a1cf019000000b003f178a76bd2mr5409795wmb.27.1682729797539; 
 Fri, 28 Apr 2023 17:56:37 -0700 (PDT)
Received: from [10.5.118.67] ([81.145.206.52])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c16d400b003f19bca8f03sm19015670wmn.43.2023.04.28.17.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 17:56:37 -0700 (PDT)
Message-ID: <37b12f18-bf76-33c1-f5cc-e679bd215cf6@linaro.org>
Date: Sat, 29 Apr 2023 03:56:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 6/7] drm/msm/dpu: save dpu topology configuration
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-7-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682725511-18185-7-git-send-email-quic_khsieh@quicinc.com>
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
> At current implementation, topology configuration is thrown away after
> dpu_rm_reserve(). This patch save the topology so that it can be used
> for DSC related calculation later.

Even if we delay the virtual wide planes patchset, please don't save the 
topology in the encoder. If we get cloned encoders support (e.g. for 
CWB), the end topology will contain both WB and INTF entries and as such 
it will not be useable by a single encoder. Thus this change is not 
future-proof.

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 ++++++++++++++---------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ecb87bc..2fdacf1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -542,13 +542,13 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   	return (num_dsc > 0) && (num_dsc > intf_count);
>   }
>   
> -static struct msm_display_topology dpu_encoder_get_topology(
> +static void dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
>   			struct drm_display_mode *mode,
> -			struct drm_crtc_state *crtc_state)
> +			struct drm_crtc_state *crtc_state,
> +			struct msm_display_topology *topology)
>   {
> -	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
>   
>   	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> @@ -567,16 +567,16 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	 * Add dspps to the reservation requirements if ctm is requested
>   	 */
>   	if (intf_count == 2)
> -		topology.num_lm = 2;
> +		topology->num_lm = 2;
>   	else if (!dpu_kms->catalog->caps->has_3d_merge)
> -		topology.num_lm = 1;
> +		topology->num_lm = 1;
>   	else
> -		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> +		topology->num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
>   	if (crtc_state->ctm)
> -		topology.num_dspp = topology.num_lm;
> +		topology->num_dspp = topology->num_lm;
>   
> -	topology.num_intf = intf_count;
> +	topology->num_intf = intf_count;
>   
>   	if (dpu_enc->dsc) {
>   		/*
> @@ -585,12 +585,10 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   		 * this is power optimal and can drive up to (including) 4k
>   		 * screens
>   		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> -		topology.num_intf = 1;
> +		topology->num_dsc = 2;
> +		topology->num_lm = 2;
> +		topology->num_intf = 1;
>   	}
> -
> -	return topology;
>   }
>   
>   static int dpu_encoder_virt_atomic_check(
> @@ -602,7 +600,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct msm_drm_private *priv;
>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode *adj_mode;
> -	struct msm_display_topology topology;
> +	struct msm_display_topology *topology;
>   	struct dpu_global_state *global_state;
>   	int i = 0;
>   	int ret = 0;
> @@ -639,7 +637,9 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
> +	topology = &dpu_enc->topology;
> +	memset(topology, 0, sizeof (*topology));
> +	dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, topology);
>   
>   	/*
>   	 * Release and Allocate resources on every modeset
> @@ -650,7 +650,7 @@ static int dpu_encoder_virt_atomic_check(
>   
>   		if (!crtc_state->active_changed || crtc_state->enable)
>   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -					drm_enc, crtc_state, topology);
> +					drm_enc, crtc_state, *topology);
>   	}
>   
>   	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);

-- 
With best wishes
Dmitry

