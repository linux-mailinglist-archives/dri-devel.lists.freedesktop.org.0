Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772C6D7156
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B7610E802;
	Wed,  5 Apr 2023 00:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255B710E7FF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 00:33:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id br6so44500026lfb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 17:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680654826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w63JRY8tbcBhqvTZv7o6qB1aZCRvTTAvd6xKqzxt8kc=;
 b=o+ucd5r9cGIEgqGw59Rpb7Ge4TrucQaen+CoIWrWoUAVVU95cCUtCssjP/jFKlXY6Y
 qkjTFzpyCCUwM+jfNmVlI5qd4YnGCTmI+f2r3rPfGDmDQwX7VApS5w/vVJC4QUflq+gz
 SK1759j4ZeQXrS2qYgkpSJ03JXqlKmACVT7+xvZH3THQDpV6r971+itS+ufKZ8c9lS3N
 +WmhtDwxipYpapRDXO0uz519nQueSJn9aNveF9mpjbo7hT+qxxLQixI6Dj3mU27mVoVH
 fL91cWqZ5TonUUtnkupCikNRueNoaPEIDbNhA07Oa16TrgO4h7gQLqfEc6tOSVp9cm7z
 mgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680654826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w63JRY8tbcBhqvTZv7o6qB1aZCRvTTAvd6xKqzxt8kc=;
 b=Q0c1fFn7nmmY1GXmbuS0ESLwO0ZGL1OciIocafy8WCR9KBkgLCCWmsGd9gfIyV6uEz
 Gy/plZCdX5tHMUSuDh2+R9YWytzKLhk7/Mhduvdw2aGoD+mexs5dGXjp8pkO6XTfN9ck
 iTDOPaRnuJk76r2RMv/GKbT4BWSsK4NqVILggxVX2z3OMRveLTvon5CI5LYfg/EhTm/t
 2R0leFToCrITCPtql3iPc2zyv607z+RdZ2WjQjGvaLG3PyFlZjb/mP5BAs+P26E8KdPi
 dNc3WsYFzQJMTC0q2jeWOidO90+H8p21fVyAyXfuJD6dXIZSD07cEaXoz38fyad5U72X
 KUSA==
X-Gm-Message-State: AAQBX9dTAp5+P13Z7fHyED+g/Wh2zXj+YOtGzZpFSDX4OexRrkWEByuf
 o64uo0H6M7zStL8fwM22CcegilCN7V5h7+N5wPJr5A==
X-Google-Smtp-Source: AKy350ZnKLDX5DKSAjAjahYtlmQeRhgeyCrOnVe0cRNLRQrNkzzQh+O2/0RySYfE+ZTT290uhkHgPQ==
X-Received: by 2002:ac2:494e:0:b0:4e9:85e5:23ff with SMTP id
 o14-20020ac2494e000000b004e985e523ffmr1105691lfi.40.1680654826246; 
 Tue, 04 Apr 2023 17:33:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004db3e445f1fsm2579191lfp.97.2023.04.04.17.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 17:33:45 -0700 (PDT)
Message-ID: <6948fe29-af08-9164-4cec-a6564dbb1e1a@linaro.org>
Date: Wed, 5 Apr 2023 03:33:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's
 ctl_0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
 <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
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

On 05/04/2023 01:12, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
>> so switch it to CTL_SC7280_MASK too.
>>
>> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
>> for SM8450") had all (relevant at that time) bit spelled individually.
>> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
>> despite being a mismerge, correctly changed all other CTL entries to use
>> CTL_SC7280_MASK, except CTL_0.
>>
> 
> I think having it spelled individually is better. If we start using one 
> chipset's mask for another, we are again going down the same path of 
> this becoming one confused file.
> 
> So, even though I agree that 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to 
> hw catalog") corrected the mask to re-use sc7280, with the individual 
> catalog file, its better to have it separate and spelled individually.
> 
> This change is not heading in the direction of the rest of the series.

I didn't create duplicates of all the defines. This is done well in the 
style of patch37. I'm not going to add all per-SoC feature masks.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 6840b22a4159..83f8f83e2b29 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>       {
>>       .name = "ctl_0", .id = CTL_0,
>>       .base = 0x15000, .len = 0x204,
>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) 
>> | BIT(DPU_CTL_FETCH_ACTIVE),
>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>       .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>       },
>>       {

-- 
With best wishes
Dmitry

