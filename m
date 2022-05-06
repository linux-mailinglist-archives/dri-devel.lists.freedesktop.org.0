Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865D651E1BD
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 01:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9944B10E17F;
	Fri,  6 May 2022 23:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7BE10E468
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 23:34:32 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 16so10903878lju.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 16:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qj0OGIAM8O4bpr43jntO9Q52sAfqToP4iOj+8IyVDwY=;
 b=VMOtZT1Cn3fYEBx4HLYEIu+Rz6cdBqk7e3etnbAvy+jiIWFYQLfSUGOj80KymvrgQz
 yQJSz/Jy9NYrbcEqgFaldMs20jeuK927xGq0CRTcmlbJw2t2EQGqnib+1B8kWOesntpC
 y4He71rz9W0+l0Z9Pqw2NjhF9ATnpmgnDaB0CtPQ5o69Aq3z5N39Jp+5LGqGGayNNJ3C
 J2KGcWmE1mOX6YlaHOB9DulDiQWQwX3lY/mTcH4HlXPIDbTOjM4aVKcz4hQ2PTNbvcZZ
 eNCZjeNCufxu2te90sDrK+CT9wismM3QSnVqYvXr5kpSa+cvj8paj1ZQZ+bMtZh+UgW4
 N52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qj0OGIAM8O4bpr43jntO9Q52sAfqToP4iOj+8IyVDwY=;
 b=KItf2wmXsz5JKW+YurYz47M29Ad1CDnXb6/AI0MAwtXlDyOW4+RspcgajyeM/wmK+S
 2bnhrcZga+zyIAGg+PPWsy+7p0VfcSoY5Nyursl28BXLV6ZjppQhHYL5ARRvnCuZKBrP
 1qVbNqZiJB5KnS8FD2R6gJyNWIuW9p/LIBqrNMWxxS+rjZd4INseOGneHhq1M+SW9ftk
 zAlGT44PZgDVW7rLE8NqM9VODYHrHAwritd9Xhski2sq4ejSCXdt7Gj2MgYb8w88U7lo
 Mzmr1etdPIG9dbenO6/NHihCk63jdTompza4zxalPjTitb+BYlXcPjRXrnFZo1+OpSLB
 mhIw==
X-Gm-Message-State: AOAM530WU+DC/hU1y9Oh9/AnFHw8MjDuabcGbquHjyPoI3X7XyuultxL
 d3LpY2STXHqJFBKPX2lx9fVfDg==
X-Google-Smtp-Source: ABdhPJyS5T2QC6LxpWPGiGnSrufYJLuIsy4vwod/OpLOLWo5odo4MPJfR0ndQKAOehHZjbJC0tPGQg==
X-Received: by 2002:a05:651c:1145:b0:24f:22fe:360c with SMTP id
 h5-20020a05651c114500b0024f22fe360cmr3534611ljo.54.1651880070678; 
 Fri, 06 May 2022 16:34:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a056512344400b0047255d211e1sm858003lfr.272.2022.05.06.16.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 16:34:30 -0700 (PDT)
Message-ID: <72aad0dc-a591-e333-aef7-59d51594bfd3@linaro.org>
Date: Sat, 7 May 2022 02:34:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 12/25] drm/msm/dpu: inline _dpu_plane_set_scanout
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-13-dmitry.baryshkov@linaro.org>
 <888eb1c7-67fa-dbb4-a589-da629d175486@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <888eb1c7-67fa-dbb4-a589-da629d175486@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05/2022 02:33, Abhinav Kumar wrote:
> 
> 
> On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
>> In preparation to reworking dpu_plane_sspp_atomic_update() inline the
>> _dpu_plane_set_scanout() function.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 ++++++++++-------------
>>   1 file changed, 18 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index d029ce806039..3ce7dcc285e2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -490,28 +490,6 @@ static void _dpu_plane_set_qos_remap(struct 
>> drm_plane *plane)
>>       dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
>>   }
>> -static void _dpu_plane_set_scanout(struct drm_plane *plane,
>> -        struct dpu_plane_state *pstate,
>> -        struct dpu_hw_pipe_cfg *pipe_cfg,
>> -        struct drm_framebuffer *fb)
>> -{
>> -    struct dpu_plane *pdpu = to_dpu_plane(plane);
>> -    struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>> -    struct msm_gem_address_space *aspace = kms->base.aspace;
>> -    int ret;
>> -
>> -    ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
>> -    if (ret == -EAGAIN)
>> -        DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
>> -    else if (ret)
>> -        DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>> -    else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
>> -        trace_dpu_plane_set_scanout(&pstate->pipe,
>> -                        &pipe_cfg->layout);
>> -        pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, 
>> pipe_cfg);
>> -    }
>> -}
>> -
>>   static void _dpu_plane_setup_scaler3(struct dpu_hw_pipe *pipe_hw,
>>           uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>>           struct dpu_hw_scaler3_cfg *scale_cfg,
>> @@ -1074,10 +1052,27 @@ static void 
>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>       const struct dpu_format *fmt =
>>           to_dpu_format(msm_framebuffer_format(fb));
>>       struct dpu_hw_pipe_cfg pipe_cfg;
>> +    struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>> +    struct msm_gem_address_space *aspace = kms->base.aspace;
>> +    bool update_src_addr = true;
>> +    int ret;
>>       memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>> -    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
>> +    ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
>> +    if (ret == -EAGAIN) {
>> +        DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
>> +        update_src_addr = false;
>> +    } else if (ret) {
>> +        DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>> +        update_src_addr = false;
>> +    }
>> +
> Do we need update_src_addr?
> 
> It seems we can just do
> 
> if (!ret &&  pipe->sspp->ops.setup_sourceaddress) {
>      .....
>      .....
> }

Ack, let's do it this way

> 
>> +    if (update_src_addr &&
>> +        pipe->sspp->ops.setup_sourceaddress) {
>> +        trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
>> +        pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
>> +    }
>>       pstate->pending = true;


-- 
With best wishes
Dmitry
