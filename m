Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF666E3CA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E52210E587;
	Tue, 17 Jan 2023 16:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6805510E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:40:14 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v30so45883091edb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T1bbrLy++qcWOt6lSo1aW2xXQtthkN26YgghLI/c6PY=;
 b=YZWptJC2T2Lt68fnk5iaS35Tt5NiBfTpWDPvoZ6YNp63K3/OpJqlWyZT9j6KW7jL+Y
 R2u99ksNtXzgJJfcKEb8tk3Q8XTu5JPV0ZoB94hofer3jjhOTHZ0EQ7Y4zl+fVQBhgbf
 xoOe2dgoLRZqgJXMrHtynQZnr5g5DUqAbnBZ6C5nVp8CrRvqEB/uaaQ+Yy3Xiq+BPQ7p
 uzJvop6v4S2b68/OrliCjG4bx0NwzotqRxAXtx0gq5sUPvGmuj/JcowQw1cRn8O8Ohvl
 cnRY58wyvX5NuCJe9A8wnxrZ+nWebym9vLkLEHPjNihs+RJJJZtYNngEeNbuCcaNCHMt
 mjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T1bbrLy++qcWOt6lSo1aW2xXQtthkN26YgghLI/c6PY=;
 b=Bs76RsSaiTDcXvdoHoin9/t51NqixqqpnhJqhFtIBSFjWOWX5qoekJjxOX/g4BSt1j
 DMJtvj2D3ymHOfi2EmLgKsF2b741VuAh54Gr2SVsurvElPBSTlU1wDVKfNR0jTwZMlPc
 qqj8CedvodbhXYvuy75wAAnjOjkya4r3Bh6+KgsHVyWeRyikluq5VPZecKfT5OlfqEq9
 7mQEz5IRfDW8okE39gHHshnjjyhO3EoTEtTv6EFjPW+iHCl47qFIOEhm/Fs01swZhTDZ
 A+0TEm6tCEJ4vs53fm6MbWk/qZzMwwKPt1sbqEKk5jpV65u6lfwMG2gPKSvPu5amw4b0
 g7/A==
X-Gm-Message-State: AFqh2kqUJfoRItdbDKruV+dkFRha42QrdR0f+OkOqcBGfUbBfOuquS9C
 eIEk5V5Hd7i+rfHhU4lCPbsNYg==
X-Google-Smtp-Source: AMrXdXvx8GfSw4jqnYWyRNx+AEyQ5TPSGpqwX8eUMCgA3tmTmVxZPkFx+gDCWDdS4uOV+AcLTLvMPw==
X-Received: by 2002:a05:6402:2b92:b0:45a:7d2:9b35 with SMTP id
 fj18-20020a0564022b9200b0045a07d29b35mr3870633edb.0.1673973612880; 
 Tue, 17 Jan 2023 08:40:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 dk1-20020a0564021d8100b0049be07c9ff5sm5820820edb.4.2023.01.17.08.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:40:12 -0800 (PST)
Message-ID: <84849b99-93ab-bc10-39ff-ac46328ede47@linaro.org>
Date: Tue, 17 Jan 2023 18:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] drm/msm/disp/dpu1: allow reservation even if dspps
 are not available.
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-2-git-send-email-quic_kalyant@quicinc.com>
 <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
In-Reply-To: <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2023 18:35, Dmitry Baryshkov wrote:
> On 17/01/2023 18:21, Kalyan Thota wrote:
>> if any topology requests for dspps and catalogue doesn't have the
>> allocation, avoid failing the reservation.
>>
>> This can pave way to build logic allowing composer fallbacks
>> for all the color features that are handled in dspp.
>>
>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index 73b3442..c8899ae 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -343,7 +343,13 @@ static bool 
>> _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>>           return true;
>>       idx = lm_cfg->dspp - DSPP_0;
>> -    if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>> +
>> +    if (idx < 0) {
> 
> The change doesn't correspond to commit message.
> 
>> +        DPU_DEBUG("lm doesn't have dspp, ignoring the request %d\n", 
>> lm_cfg->dspp);
>> +        return true;
>> +    }
>> +
>> +    if (idx >= ARRAY_SIZE(rm->dspp_blks)) {
>>           DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>>           return false;
>>       }
> 
> If you'd like to remove duplicate for the (idx >= ARRAY_SIZE) check, I'd 
> suggest dropping the second one
> 

I've misread the patch. However I don't see, why would one request 
DSPP_NONE while specifying topology->num_dspp. I think that you are 
trying to put additional logic into a function that should just check 
for the available resources.

-- 
With best wishes
Dmitry

