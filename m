Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A26F4687
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D07D10E381;
	Tue,  2 May 2023 14:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA91710E381
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 14:59:27 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8db10a5d4so39226911fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039563; x=1685631563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vYIPK0RyXV420ws+bFuhXON4Dwa7YsOqBbgK0Ucm394=;
 b=wqg09eyhhyGAtq2A6lcOW6KVIsz4uc+pQp+byl28tDjqTfhjLDEzD2DvcohSmnUUlF
 iDF9iZFqw2ToV6I0t9isJ28wKjAlORuF29IRkJ8EMJCyyYy7TGR6uRLR2CT8Jlpxgw39
 ZKLVWUtiKKC8uOOTs1C8s736+vzZRhq5z01cwo2FsFGiPaNRdcIS52yLeNK2NDFzzGrA
 WyjYuQj1zVqd8SAd5Mp15P1qoPuJrTJ03d9q/ZyhpvYzqhvI7jdVE805B8wAGSjH+RqX
 7FPDpvBAdhweonDwFuuLTyryGucuW1v8ByH/RDzA6juDfGAFh1b9Mq3urd3iHoamGTpr
 5oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039563; x=1685631563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vYIPK0RyXV420ws+bFuhXON4Dwa7YsOqBbgK0Ucm394=;
 b=APN8JBbqjHXXUPDK3MFMUD3Fy4cB8oP7/Eq3nvwWBa0C1vpd8hEyXH4tBHarmheewF
 TWdpZJQHqD7tiZMXt7coSvNRz3JNzHSQynR724yS6TiZ06KPUh98JfQcA6WpJH+5fflo
 sMNBS6mN5Gx5e76T3KrYW/Jbr1pZyDJqLqnSZ4m/OyP/XfJ4d6oL4FNm1Z9xSDa4BwS9
 fJOdH28U9xPre5ueGpRZt/j3LXjvuUsorlolW/Qd+Oekg6oWp/WFmraxpZEsXLiBtEQA
 ZTJhb2iQ2rO4eTPeBLM31m5BhjZ7MtglRgA/vryTStK5wq0fNvEQe+1ACC38f2FWFgiL
 0Qxg==
X-Gm-Message-State: AC+VfDzvTfR+NYumhlh7j5dt37Hhd1KJT6SWEFXePKs5ZgteMGSlNsAm
 hauK2+WIhNSYKHmWOVOnJGN+7Q==
X-Google-Smtp-Source: ACHHUZ6FOPEkhUy45YwRLKoQ4LYu/pNPWGvvuBDo0//1zzEqJWAqBykvX45Pe3drLSHYQRCf20yteg==
X-Received: by 2002:a05:6512:3750:b0:4ed:bf01:3ff3 with SMTP id
 a16-20020a056512375000b004edbf013ff3mr64497lfs.43.1683039563585; 
 Tue, 02 May 2023 07:59:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a19ae14000000b004d85316f2d6sm5412416lfc.118.2023.05.02.07.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 07:59:23 -0700 (PDT)
Message-ID: <a8c21d66-15dd-8049-7a31-e0604d17782b@linaro.org>
Date: Tue, 2 May 2023 17:59:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH 3/9] drm/msm/dpu: fix the condition for (not)
 applying QoS to CURSOR SSPP
Content-Language: en-GB
To: Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
 <20230430205710.3188230-4-dmitry.baryshkov@linaro.org>
 <f108e588-6671-ad4e-35b3-7771efab97ce@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f108e588-6671-ad4e-35b3-7771efab97ce@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/05/2023 03:56, Jeykumar Sankaran wrote:
> 
> 
> On 4/30/2023 1:57 PM, Dmitry Baryshkov wrote:
>> The function dpu_plane_sspp_update_pipe() contains code to skip enabling
>> the QoS and OT limitis for CURSOR pipes. However all DPU since sdm845
>> repurpose DMA SSPP for the cursor planes because they lack the real
>> CURSOR SSPP. Fix the condition to actually check that the plane is
>> CURSOR or not.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 43d9fbc0c687..36f6eb71fef8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -1124,7 +1124,8 @@ static void dpu_plane_sspp_update_pipe(struct 
>> drm_plane *plane,
>>       _dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
>>       _dpu_plane_set_danger_lut(plane, pipe, fmt);
>> -    if (plane->type != DRM_PLANE_TYPE_CURSOR) {
>> +    if (pipe->sspp->idx == SSPP_CURSOR0 ||
>> +        pipe->sspp->idx == SSPP_CURSOR1) {
> Isn't this differ from the current sequence: The existing sequence 
> programs QOS for all the non-cursor SSPP's. This patch programs QOS only 
> for CURSOR SSPP's.

Thanks for the catch! I was thinking about inverting the condition and 
ended up overengineering it.

> 
> If DMA SSPP's are used for cursor planes, we should ideally remove this 
> check.

Unfortunately, we also support 8998 (and patches to use CURSOR SSPP were 
posted to the mailing list). The plan is to also support some of 1.x 
MDP5/DPU units (e.g. 8996), which would also make use of origin CURSOR 
planes. So we can not drop this. I'll post v2 fixing the issue.

> 
> Jeykumar S.
>>           _dpu_plane_set_qos_ctrl(plane, pipe, true, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>>           _dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
>>       }

-- 
With best wishes
Dmitry

