Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920C56450A3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 01:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A7E10E049;
	Wed,  7 Dec 2022 00:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096D10E010
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 00:51:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id c1so26315374lfi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 16:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uyCiEehhg3AvK47XRuRV3OgUlLAe89kYvEl1PGK0zH8=;
 b=j1Fp1sQbLBxakIyAwAB+au8WHjL5ln0feTRryZHp8L6MFO5WbZWl/DJyXUZ8GVxpW2
 WCMBuxUpVkUK1bHouifp0oC8MaE99MEYwEKatpsiNNCCfyGigPzKnZhz8DXw0L5amgEI
 Br0Dxgg9jkviQ/vutEq3tdkpNaL2vjC3Mx30tLCr51fnwU4h6CkWfMICIgmThi87AhUz
 pmtgcOzMKYBBolUsW1UGeHvVx8dhccL2XKm3zPQ4io4B+Fw/5i4HdfsMnyFWOZSIXc58
 f20bjBISkPfKiU53ofXOG3XgfXBAhBUu5u1/92XPMDAENqU+ITdulEdosZOaI8w8ITNu
 cUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uyCiEehhg3AvK47XRuRV3OgUlLAe89kYvEl1PGK0zH8=;
 b=xumQi56kbQtqUhubpUNasjTgX7H8BaEojoiL4sxVHqrlWnU+VHOwInZ/cioYfvy7Bi
 lLU8PyPoxb2T9f+rAslpQ9PTMHd752DXvYItgm0A8pV1pPH+qu6MIlrmvM5HTTp/1XPy
 2X0dLdi6BBk6pBDai9d0YTsHB2i9d0raU5m6LqCl+bvFp1FMyPKL18RQIuPVigE/HEjz
 E16JL+e7SWNIAo24sUPRGr4evK8auI3b50W6woFr9rY9RVPgGNDptWXjeFn5LdVeNnuQ
 efyH2aizaw1ciJuzHLUhiX5QLpcFgdMdK/udYWHl/22jJ7djlij0y18dw8ZGo3qknFMw
 iLcw==
X-Gm-Message-State: ANoB5pl41nR0qYJAeUhhzeOQuuOMXoOuYvcdaHCixrLoiDSKusVHsAwa
 gqWC+tKHoW3Vk/9Ub6K/uoDqeQ==
X-Google-Smtp-Source: AA0mqf70FwA/7pUTk06J/iRiWlaxYX9OW/dUZSt0KyKZ59fVoWgXvLLspoXRehLOXBDC59c5Ta9cmw==
X-Received: by 2002:a19:7b0f:0:b0:4a2:3bed:2008 with SMTP id
 w15-20020a197b0f000000b004a23bed2008mr31770961lfc.88.1670374272930; 
 Tue, 06 Dec 2022 16:51:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a056512040b00b004a2386b8cf5sm2645240lfk.215.2022.12.06.16.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 16:51:12 -0800 (PST)
Message-ID: <be1521b6-101d-5909-6436-f042806eb642@linaro.org>
Date: Wed, 7 Dec 2022 02:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 08/10] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
 <20221123210403.3593366-9-dmitry.baryshkov@linaro.org>
 <5eab17ea-0688-f63d-ab73-fe4c15db7092@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5eab17ea-0688-f63d-ab73-fe4c15db7092@quicinc.com>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 08:01, Abhinav Kumar wrote:
> 
> 
> On 11/23/2022 1:04 PM, Dmitry Baryshkov wrote:
>> On sm8450 a register block was removed from MDP TOP. Accessing it during
>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>> these registers during snapshot.
>>
>> Tested-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>   2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 38aa38ab1568..8da4c5ba6dc3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -82,6 +82,8 @@ enum {
>>    * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
>>    *                         compression initial revision
>>    * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
>> + * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 
>> block results
>> + *               in a failure
> shouldnt this be that "indicates that the top register block is not 
> contiguous and the two sub-blocks are separated by an offset"

Not so sure. Your suggestion is closer to the dynamic case, where all 
the sizes are dynamic in catalog. Since the patch uses fixed offsets, 
I'd mention periph0 instead (like the downstream does).

>>    * @DPU_MDP_MAX            Maximum value
>>    */
>> @@ -92,6 +94,7 @@ enum {
>>       DPU_MDP_UBWC_1_0,
>>       DPU_MDP_UBWC_1_5,
>>       DPU_MDP_AUDIO_SELECT,
>> +    DPU_MDP_PERIPH_0_REMOVED,
>>       DPU_MDP_MAX
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index f3660cd14f4f..4ac14de55139 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>> msm_disp_state *disp_state, struct msm_k
>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
> 
> I recall one of the comments from konrad that this should come from the 
> catalog rather than a hard-coded offset which you wanted to keep it for 
> a later time. I am fine with that.
> 
> But instead of a hard-coded offset, do you want to have a macro so that 
> atleast we know what the value means and can fix it in the future? 
> Otherwise it would end up being one of those numbers which someone later 
> on wouldnt understand where it comes from and what it means.

Yes, I macro makes sense to me. I'll fix in v6.

> 
>> +    } else {
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    }
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }

-- 
With best wishes
Dmitry

