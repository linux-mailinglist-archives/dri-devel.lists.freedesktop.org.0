Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D676F4DF8
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE24310E174;
	Tue,  2 May 2023 23:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2780D10E171
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 23:59:32 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4efe9a98736so5138999e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 16:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683071971; x=1685663971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vrzm20KVvWkxv1M0pGs1v67Yn/sf7zTbzt4N4hbrnik=;
 b=J+Mzp+sJUyrk1MWCpFGUsEfhawOtWFB2MK/WYz4ZbwrOonVtj+6biksOfu2n/SS9c6
 Kg6c5+FD2uypjrSP31uP6nMwK+bE2r/G8iPGlbvItP1GumCWelkXL40O/7MhI12BxDYm
 EvqhwR2kR+0dRHHTWRNlgUihltGl1YQUc7yl+uZ0/dH9V/tyBjhy0sYm3oYCKcvDcRoU
 6tLiTLVwDl89b8HpXk+1vb4KJru3ISCw7Wk+aPFpiii7M225Og0zLMteSZZdGa3Gs6m5
 KbDdmePVbeID7VGIJldmW2yOEevK5JBiI+MU00x1DgYouxvRIvtmuIdSRkH4K7QZY6Uv
 dTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683071971; x=1685663971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vrzm20KVvWkxv1M0pGs1v67Yn/sf7zTbzt4N4hbrnik=;
 b=fcOU+nFadOF+mNUSNE21LmIe8KhirGY20tocB/DQqqhfELigCDxEO48tnb+xnczuQp
 QXV46eoZ3wx682rcslqpDUSbUu4RjwVTr5fimYJt2H808VpA635QtQnxX5ZBpOYMKEvF
 44JxNO5Jm8ogOOJjX7zr75ZqZGYkPMl0lXPZY7Jz9OkBbtdegZ7Xw5dfOX0zohPy2iY9
 d/aYA2JtCxzu+FYzZ7u/aW4I3z9js8HKuUDYXxvtgG3rxvxfvT2WzEjSoDPIKWqE4Mhu
 cOAlaiZ2CxD27nIvgiZODMuTJApCfB53ATm6+s5Fyrq4SWlXmWC5UoQq1GD+1CcTpsqT
 7xdg==
X-Gm-Message-State: AC+VfDxavNJRv7H7gj2wREDqVs5Okyb63hT/IE0rDHVE4/OVVAJnnu4N
 RO6JB30x5SPnBQ8izgz8KB/XPQ==
X-Google-Smtp-Source: ACHHUZ6WCTLdZ0zveC63gn2RwIgBXoxDWUQSXyxCMG8eCrFiydyY5Mkjdx3/GOyNhq58Jm8JWXlGJg==
X-Received: by 2002:ac2:421a:0:b0:4ec:a19c:32b0 with SMTP id
 y26-20020ac2421a000000b004eca19c32b0mr379343lfh.5.1683071971677; 
 Tue, 02 May 2023 16:59:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d24-20020ac24c98000000b004e88a166eb6sm5587218lfl.46.2023.05.02.16.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 16:59:31 -0700 (PDT)
Message-ID: <f1a0ce7e-309d-28c1-7ba0-cbebf4e3fa4d@linaro.org>
Date: Wed, 3 May 2023 02:59:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/7] drm/msm/dpu: inline dpu_encoder_get_wb()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-6-dmitry.baryshkov@linaro.org>
 <6ad0c581-1955-3013-0ef3-6340240d0c1b@quicinc.com>
 <9f977692-d74d-9f49-e626-399aeeef7f18@linaro.org>
 <7f88318c-c7f9-efdd-7bc8-aa121d8430c5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7f88318c-c7f9-efdd-7bc8-aa121d8430c5@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 02:58, Abhinav Kumar wrote:
> 
> 
> On 5/2/2023 4:54 PM, Dmitry Baryshkov wrote:
>> On 03/05/2023 02:51, Abhinav Kumar wrote:
>>>
>>>
>>> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>>>> The function dpu_encoder_get_wb() returns controller_id if the
>>>> corresponding WB is present in the catalog. We can inline this function
>>>> and rely on dpu_rm_get_wb() returning NULL for indices for which the
>>>> WB is not present on the device.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 
>>>> ++-------------------
>>>>   1 file changed, 2 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 4c85cbb030e4..507ff3f88c67 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -1277,22 +1277,6 @@ static enum dpu_intf 
>>>> dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>>>>       return INTF_MAX;
>>>>   }
>>>> -static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg 
>>>> *catalog,
>>>> -        enum dpu_intf_type type, u32 controller_id)
>>>> -{
>>>> -    int i = 0;
>>>> -
>>>> -    if (type != INTF_WB)
>>>> -        return WB_MAX;
>>>> -
>>>> -    for (i = 0; i < catalog->wb_count; i++) {
>>>> -        if (catalog->wb[i].id == controller_id)
>>>> -            return catalog->wb[i].id;
>>>> -    }
>>>> -
>>>> -    return WB_MAX;
>>>> -}
>>>> -
>>>>   void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>>>>           struct dpu_encoder_phys *phy_enc)
>>>>   {
>>>> @@ -2261,7 +2245,6 @@ static int dpu_encoder_setup_display(struct 
>>>> dpu_encoder_virt *dpu_enc,
>>>>            */
>>>>           u32 controller_id = disp_info->h_tile_instance[i];
>>>>           enum dpu_intf intf_idx;
>>>> -        enum dpu_wb wb_idx;
>>>>           if (disp_info->num_of_h_tiles > 1) {
>>>>               if (i == 0)
>>>> @@ -2279,14 +2262,11 @@ static int dpu_encoder_setup_display(struct 
>>>> dpu_encoder_virt *dpu_enc,
>>>>                                   disp_info->intf_type,
>>>>                                   controller_id);
>>>> -        wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
>>>> -                disp_info->intf_type, controller_id);
>>>> -
>>>>           if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
>>>>               phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>>> intf_idx);
>>>> -        if (wb_idx >= WB_0 && wb_idx < WB_MAX)
>>>> -            phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, wb_idx);
>>>> +        if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>>>> +            phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, 
>>>> controller_id);
>>>
>>>
>>>  From what I see, with 
>>> https://patchwork.freedesktop.org/patch/534776/?series=117146&rev=1 
>>> we are dropping those checks from the RM too, so we are going to rely 
>>> totally on entering the values correctly in catalog from now on?
>>
>> Yes. I see no reason to mistrust the kernel data itself.
> 
> Alright, if thats the overall plan, this change itself is fine.

Yes, I think this is what we discussed some time ago for UBWC and QSEED 
programming.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>>
>>>>           if (!phys_params.hw_intf && !phys_params.hw_wb) {
>>>>               DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned 
>>>> at idx: %d\n", i);
>>

-- 
With best wishes
Dmitry

