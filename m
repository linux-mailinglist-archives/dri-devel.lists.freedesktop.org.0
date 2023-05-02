Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A146F4BDA
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 23:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857CA10E091;
	Tue,  2 May 2023 21:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C07010E0C0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 21:04:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8a5f6771fso42622941fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 14:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683061464; x=1685653464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oBLFdaKmCg1pFOohSkXs6ozX+GQqHHNXM3HNYRTNy9E=;
 b=je7EZqDDDlFkI8s3uJHYp/bvQvOhY6F/EGOon90W6griJdYUIAbJgT+Eqx+KF9P0iG
 bMSbW8rrY+UYjX3FQvsOh8R0u6BdvBpGb+dGgm6scHjN3DHJ6i1TSBTVBgpLmMsJCdD2
 JclcXVMqnoOVn8D9Pmw37bB0OUK2RdO2EH6QJwFmOXxn7iBaSnQW9X2tUzYQJxqcsrIV
 2rzMGyX73m4Vpn4ZCzwaCNqAvhZvwOCc7rz1wRN05SzdmBPzL0QOrr6sRQpgTFMBcmv8
 X04JRNE8Z8LiZ6NUDOozFH8sd/iML/URqb+SzpcWYPJlp05q03dru7ZjE4s9mBcY8cLd
 apNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683061464; x=1685653464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBLFdaKmCg1pFOohSkXs6ozX+GQqHHNXM3HNYRTNy9E=;
 b=lHRlsv7FhyMNZu8WBRwQH8BwKIzNEKppn6V3cXDEEs7rhlZ0WPyozzL7H36sgs7Dlp
 dDku91261Pf1alYfJ/7rsedIzZ2argf+XXlxCmEmNzJQkc+1B3d9Mrg9m0yuO0en20Gk
 Lr5CGOEbfxCfyoV2y9Eo3xMRAtW89LQjdbFibhaM+b6WP427iZAlkq6sHNJBWtVZkniM
 KZzzKs8OT5hWOGNTrX00/YlidqWqpihyI1j3hRopQD6V7BXNXjenMcFbghnwdQeAiQLx
 l6awJmCY/+kJOJj0Ib1Lg4rY+U36oY+FjH/W6esjbXxDfMBoTt9lQQgoscsC6U0wuaq4
 HtpA==
X-Gm-Message-State: AC+VfDzHC6dGAX5DJPOez0xaJaQejfHvWNJfzrs8/F5cBgmT4/7wTTmv
 zl8nyxmvyNVhPH9FkZoOtnohAA==
X-Google-Smtp-Source: ACHHUZ64913t++7n8QCPzET9+k3buFpx5YLFz8jgRUwxrnycsuZbTjFm2im7jOnudne+k8pVoE55fw==
X-Received: by 2002:a2e:8501:0:b0:2a9:f8fd:49ff with SMTP id
 j1-20020a2e8501000000b002a9f8fd49ffmr5241630lji.17.1683061464171; 
 Tue, 02 May 2023 14:04:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a2e9c89000000b002a774fb7923sm5556950lji.45.2023.05.02.14.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 14:04:23 -0700 (PDT)
Message-ID: <6dd9e733-d5ce-279a-b060-b60740466037@linaro.org>
Date: Wed, 3 May 2023 00:04:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/7] drm/msm/dpu: drop dpu_encoder_early_unregister
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-3-dmitry.baryshkov@linaro.org>
 <81d97939-1369-9a2d-01bb-ad8c8a4b7e5c@quicinc.com>
 <CAA8EJprD6biRhcx5pAJvb4Jfz_L-88_=zeySReN2Y5Nrtq+_Lw@mail.gmail.com>
 <1953c899-b034-52d7-9ff0-914ca0bb5196@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1953c899-b034-52d7-9ff0-914ca0bb5196@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/05/2023 23:59, Abhinav Kumar wrote:
> 
> 
> On 5/2/2023 1:54 PM, Dmitry Baryshkov wrote:
>> On Tue, 2 May 2023 at 23:45, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>>>> There is no need to clean up debugfs manually, it will be done by the
>>>> DRM core on device deregistration.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>
>>> There are two reasons to have the debugfs removed in the 
>>> early_unregister:
>>>
>>> 1) Today, registration happens in late_register(), hence to balance the
>>> the call in _dpu_encoder_init_debugfs(), this one is present.
>>>
>>> 2) In drm_modeset_register_all(), if drm_connector_register_all() fails,
>>> it calls drm_encoder_unregister_all() first which calls 
>>> early_unregister().
>>>
>>> So to balance these out, dont we need to keep it?
>>
>> Please correct me if I'm wrong, drm_debugfs_cleanup() should take care 
>> of that.
>>
> 
> Not from what I am seeing, drm_debugfs_cleanup() is getting called from 
> the error handling path of drm_dev_register() and separately from 
> drm_dev_unregister() but not from the error handling path of 
> drm_modeset_register_all().
> 
> So that case will be unbalanced with this change.

But for the practical reasons the drm_modeset_register_all() can not 
fail. But I see your point. I'll check why drm_dev_register() doesn't 
respect an error return from drm_modeset_register_all(). Until that 
point we can drop this patch.

> 
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 --------
>>>>    1 file changed, 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 32785cb1b079..8c45c949ec39 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -2154,13 +2154,6 @@ static int dpu_encoder_late_register(struct 
>>>> drm_encoder *encoder)
>>>>        return _dpu_encoder_init_debugfs(encoder);
>>>>    }
>>>>
>>>> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
>>>> -{
>>>> -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>>>> -
>>>> -     debugfs_remove_recursive(dpu_enc->debugfs_root);
>>>> -}
>>>> -
>>>>    static int dpu_encoder_virt_add_phys_encs(
>>>>                struct msm_display_info *disp_info,
>>>>                struct dpu_encoder_virt *dpu_enc,
>>>> @@ -2374,7 +2367,6 @@ static const struct drm_encoder_helper_funcs 
>>>> dpu_encoder_helper_funcs = {
>>>>    static const struct drm_encoder_funcs dpu_encoder_funcs = {
>>>>                .destroy = dpu_encoder_destroy,
>>>>                .late_register = dpu_encoder_late_register,
>>>> -             .early_unregister = dpu_encoder_early_unregister,
>>>>    };
>>>>
>>>>    struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>

-- 
With best wishes
Dmitry

