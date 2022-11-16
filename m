Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998362B4E8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 09:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292F010E430;
	Wed, 16 Nov 2022 08:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCCF10E430
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:19:14 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id t10so20862897ljj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 00:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s3hmYFJCkTtn3TM6dsGaEPzkn+DVUmQOcvxVNta5NVs=;
 b=zMdllhrGlGLzNtwjILPgItD3ZBxIAkcTMw7pPs/bw7bvKWrAtrWp6hiduO7xoSROqK
 ijZD6Lf32PjqTtHwXUolAWJ74/zG3m24/+56zP70itbyj7sFyCMTuNz4qVIryI/xecjW
 aVmky5mrlC28MzF1rXcT/bkQySdSuGZft4VlvRQ92SuO9rURGJsvMslWtJSYxB89Cgrj
 H+sJUCf7OJRnCCc1awaGCLpRx2xISkmrEWA+HbxdsZl0I4o9ejpL/31Qz/uS8CRa0eU4
 jGs9w7Vpblnph8dhPlEfNtohebPYzRsGjU8KU5PQS+WuYUlFBt3zja0dpvalVpNj5nhe
 uhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s3hmYFJCkTtn3TM6dsGaEPzkn+DVUmQOcvxVNta5NVs=;
 b=5NxDGp1ugmN9TDjUbtM5iJeMG+daD4i5GcFuuKbhafAWTSflRMvo8DhfRrOdnBh14U
 s+HLb+SWIY3HLPU+GRxXtfcQLw90ArqHmc7U8QF1pfpC/R5Zf8mOrSIhnUo3m8mkQ87r
 BIpEwVk5MvRweFCv/izf9esV41IDq27dOO2TobpW1itLqMU56Mp9hWixAH2KtYi3swcV
 NI8ANEdgf5uz+ch2VcOD9erroy/vnRddyqvHM54G5ZcGrLZHUXQlQ61Sq/BXl7twqr0L
 1bpWxEaeuvPOoyhhDMbv6YYi4H/xfOT6uTCh8DIeYrmjfXF7yU4ksSoUgcoN2gPOq7he
 GXWw==
X-Gm-Message-State: ANoB5pn1/3c0ZWBDZMj7S9YjDmfm4lxR6CW2aUNNCm6qFwubeZIQneDm
 6CZc518kZu8I2YunUjyAfu9v4w==
X-Google-Smtp-Source: AA0mqf7xhOCjW3QufeE804S/cxln/uZai7wNh/XLBauOT9JBywuiFQolclvFiIZKXUz31tEmZWpHYg==
X-Received: by 2002:a2e:9b84:0:b0:277:a3d:6fb6 with SMTP id
 z4-20020a2e9b84000000b002770a3d6fb6mr7621591lji.514.1668586752273; 
 Wed, 16 Nov 2022 00:19:12 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 w26-20020ac254ba000000b0049c29389b98sm2487698lfk.151.2022.11.16.00.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 00:19:11 -0800 (PST)
Message-ID: <e53520b4-65da-d183-c3bf-65dc16c59358@linaro.org>
Date: Wed, 16 Nov 2022 11:19:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
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
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2022 10:50, Abhinav Kumar wrote:
> 
> 
> On 11/4/2022 6:03 AM, Dmitry Baryshkov wrote:
>> On sm8450 a register block was removed from MDP TOP. Accessing it during
>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>> these registers during snapshot.
>>
>> Tested-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I am confused with both the ordering and the split of this patch.
> 
> You have defined DPU_MDP_PERIPH_0_REMOVED in the catalog header file in 
> this patch but used it in the next.
> 
> But you also have code in this patch which relies on setting of this bit.
> 
> So if this patch is taken without the next, it will still crash.

It will not crash if this patch is taken without the next one. Without 
the next patch the DPU driver will not match and bind against the 
qcom,sm8450-dpu device.

So, the ordering is quite logical from my point of view:
- add support for all the features required for the device
- add the device compat string & catalog entry

> 
> Rather, you should combine the define part of this patch to the next 
> patch in the series 
> https://patchwork.freedesktop.org/patch/510114/?series=108883&rev=3 , 
> then move that one in front of this patch.

No. This way we'll have a state (after adding the next patch) when the 
sm8450 support is enabled, but the top-hole is not handled, leading to a 
crash.

> 
> So that its much more coherent that you defined DPU_MDP_PERIPH_0_REMOVED 
> both in the catalog header and used it in the catalog.c file and the in 
> the next change you used the caps to avoid touching that register.

I'd say it's rather strange way. When I see a define/feature addition, 
I'd prefer to seethe implementation too.

> Regarding the TOP hole itself, I need one day to investigate this. I am 
> waiting for permissions to the documentation.
> 
> If i cannot get access by the time you have re-ordered this, I will ack 
> this once the reorder is done within a day.


For the reference: [1]

[1] 
https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/commit/f9ff8af5b640147f3651c23551c60f81f62874b1

> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 38aa38ab1568..4730f8268f2a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -92,6 +92,7 @@ enum {
>>       DPU_MDP_UBWC_1_0,
>>       DPU_MDP_UBWC_1_5,
>>       DPU_MDP_AUDIO_SELECT,
>> +    DPU_MDP_PERIPH_0_REMOVED,
>>       DPU_MDP_MAX
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index f3660cd14f4f..95d8765c1c53 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>> msm_disp_state *disp_state, struct msm_k
>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    if (dpu_kms->hw_mdp->caps->features & 
>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
>> +    } else {
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    }
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }

-- 
With best wishes
Dmitry

