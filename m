Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8266CC0F6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 15:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7161F10E2EF;
	Tue, 28 Mar 2023 13:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42E910E097
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 13:32:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y15so15839385lfa.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010347;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g02I1W6mgzmeB+62dRygpCTPnE6RlAEOPRopZrV7ckA=;
 b=sf1yYrLlvBSGwzL1Un+i29aDzjasFLnSZhFW526cxcgMFgnfqOTSddOEBHgTScrpIa
 J+p0RpULbpctLyQKOO2qE0K6zcnhLMZCk74vvtTei5jaksAwAP2UA1j7rObotVXIxEq5
 e7BPkSVXwNz7wgvaSR8TdOTjzJ4kId9OPXn8NL2MBqhpN1rFTL2h15NjIPxwx674jFLB
 LkX5JDGsLIbvFmMCe1lnj3DxsAy6IamOSOXD/oA2a2hUQR6DtTDLrsXdaJIV/PKZcita
 UMCe0CgszasSZlrevI10jSWaiBYGJRatIKtDUoSdVBD7nPO/1HTUKEGnlrEvbFlDBdFH
 Xb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010347;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g02I1W6mgzmeB+62dRygpCTPnE6RlAEOPRopZrV7ckA=;
 b=1eXNBtZPfPksLeiVEZ5OO1BybqDYFXUN/24tCGACEMIGAPEMpHqf82uVDt02jObiTE
 DTFp98YlehkF3gp3ZdqLN9XjONboDuxfkTqV7IJf2RtYNKmy0RIgJaf7z0uX0r2kIN7U
 jWrJjUgKq651ESnJAoTRFp5USzbwWFA0ZMayyXKDwHLxW7u+k7B3/UIR/BureqivdeYO
 3zY0wti7yFDSRIhuRiZegAIfhQkqb8prio350rXCCAd6pvuanBtzvh7XM1Vg6cNEg6hy
 MHyPbRGpZNPkFgomJtSko2BPxHzZx7XdbQW15UEf168wDTrFShxho3bw6O60BNOkR0ga
 yWMQ==
X-Gm-Message-State: AAQBX9fZ73CbQaFl5IlBb6UZLRtEmt7IcKSy93votclcYvHHk3Ztalto
 8bzAPOs9O97oUtdclhE9IBTwzg==
X-Google-Smtp-Source: AKy350YA6+0RXq22Tp/f/x252Y9jHRcmh25+pxyJTdeF2GZpGC2jRnFljCQzR5U24g0I1wztOHrRRA==
X-Received: by 2002:ac2:5dee:0:b0:4ea:f74f:c077 with SMTP id
 z14-20020ac25dee000000b004eaf74fc077mr4982273lfq.12.1680010347125; 
 Tue, 28 Mar 2023 06:32:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a056512048300b004cc5f44747dsm5103824lfq.220.2023.03.28.06.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:32:26 -0700 (PDT)
Message-ID: <9c498192-f82d-cea9-17cb-80cb81b67714@linaro.org>
Date: Tue, 28 Mar 2023 16:32:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 31/32] drm/msm/dpu: log the multirect_index in
 _dpu_crtc_blend_setup_pipe
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
 <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/03/2023 18:16, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Lets print the multirect_index as well in _dpu_crtc_blend_setup_pipe()
> as it will give the complete information of the sw_pipe as well.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

For the sake of completeness:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 90b406e409d3..508e5b950e52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -426,12 +426,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   				   format->base.pixel_format,
>   				   modifier);
>   
> -	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
> +	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
>   			 crtc->base.id,
>   			 stage,
>   			 plane->base.id,
>   			 sspp_idx - SSPP_NONE,
> -			 state->fb ? state->fb->base.id : -1);
> +			 state->fb ? state->fb->base.id : -1,
> +			 pipe->multirect_index);
>   
>   	stage_cfg->stage[stage][stage_idx] = sspp_idx;
>   	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;

-- 
With best wishes
Dmitry

