Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EEF76831E
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42210E23C;
	Sun, 30 Jul 2023 01:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9013310E23C
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:15:24 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99bf8e5ab39so187749966b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679723; x=1691284523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T4uLHq7oBLW/MQRaVUUH4sM0Zy1hO0JLW8gqiUkRGm8=;
 b=iVvbFArrkyTS5zbHNmsARLMw6WdxDNTni/h/4T3CjlJYHPVxoY+wSM1sAMqysS6TNH
 +en7pzZetVmxsPzXKIQWkSQAiNhONWtwXExUX79pkz/UI2vTokPk776EV2Z333KBQiuZ
 XTTsnys0P+fK9WN45NAIPVpGvN8XU1n8PDlgf+Bl6TM5lrep3PWKK4Pbk/XCJSjya7v1
 4OH7oIeDRpKjYoLC8i4gmemngua1yJwhzX8wZ8hFsLAuJspccO3WQo314jtYWQUZzfUQ
 RzFLFcg9mdGAqunTX3AROPr/Qx5IFTUbdOHMmkp48ze9WYySLeQx1HIRzZi+pr8awBq3
 82gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679723; x=1691284523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T4uLHq7oBLW/MQRaVUUH4sM0Zy1hO0JLW8gqiUkRGm8=;
 b=cJqrsL6kiHab4+FXqejj2IO1BaM3H/q7p3JJKWUhSOSwCpIMVUhdl3PjnOSL+3bTSs
 rmrWckZ8HU9hZw+t2Q8lkFuHEDI0gpFqCNyFfAfFVWjZ89S9eW7/pAH9aFjxn40JwWDn
 r3cD7B8zh4AWZkyjYhgYemah1dg0YqqgZzZFz70mC0ZrvIi8h4qEeTxb3n2VxWEFpsFw
 8VyK8Xkj7nPehKV4vwCFq1K7tBUUcCxeJgxNCumGM91OoWON0DBwj12Bb3v/pAh6k4pf
 j2oolHEUnVGz7oUiebFAYB7qle9KRibK8QiOPnYoFxNoab0lkWTHAaJBSOTrZO2aqJzK
 2J8Q==
X-Gm-Message-State: ABy/qLaWc35CLDTNJbXsoxhTnCoTfAx+xUuEgSodbU3J3GsYh5SEw2Tt
 yE0GapmhwrMuFJElgxIJ4lgybA==
X-Google-Smtp-Source: APBJJlFbNRrLqE1vQ8C97UOOljegmlKhduY047vByQpKyZiAU84H8EWlbTvsuqV/kGunChaD/RsgNg==
X-Received: by 2002:a17:906:cc0b:b0:994:56d3:8a42 with SMTP id
 ml11-20020a170906cc0b00b0099456d38a42mr3410852ejb.27.1690679722845; 
 Sat, 29 Jul 2023 18:15:22 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a17090690c800b00997e99a662bsm3897323ejw.20.2023.07.29.18.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jul 2023 18:15:22 -0700 (PDT)
Message-ID: <622d0825-4c96-d527-5481-daffe1ed823a@linaro.org>
Date: Sun, 30 Jul 2023 04:15:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-2-dmitry.baryshkov@linaro.org>
 <c1582144-38c2-78ee-2808-d4595aa17264@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c1582144-38c2-78ee-2808-d4595aa17264@quicinc.com>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/07/2023 00:43, Jessica Zhang wrote:
> 
> 
> On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
>> It was noticed that dpu_kms_hw_init()'s error path contains several
>> labels which point to the same code path. Replace all of them with a
>> single label.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
>>   1 file changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index c11b3ab572ab..e7ac02e92f42 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1037,7 +1037,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>       if (!dpu_kms->catalog) {
>>           DPU_ERROR("device config not known!\n");
>>           rc = -EINVAL;
>> -        goto power_error;
>> +        goto err_pm_put;
>>       }
>>       /*
>> @@ -1047,13 +1047,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>       rc = _dpu_kms_mmu_init(dpu_kms);
>>       if (rc) {
>>           DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
>> -        goto power_error;
>> +        goto err_pm_put;
>>       }
>>       rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>>       if (rc) {
>>           DPU_ERROR("rm init failed: %d\n", rc);
>> -        goto power_error;
>> +        goto err_pm_put;
>>       }
>>       dpu_kms->rm_init = true;
>> @@ -1065,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>           rc = PTR_ERR(dpu_kms->hw_mdp);
>>           DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>>           dpu_kms->hw_mdp = NULL;
>> -        goto power_error;
>> +        goto err_pm_put;
>>       }
>>       for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>> @@ -1076,7 +1076,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>           if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
>> -            goto power_error;
>> +            goto err_pm_put;
>>           }
>>           dpu_kms->hw_vbif[vbif->id] = hw;
>> @@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>       rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, 
>> max_core_clk_rate);
>>       if (rc) {
>>           DPU_ERROR("failed to init perf %d\n", rc);
>> -        goto perf_err;
>> +        goto err_pm_put;
>>       }
>>       dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, 
>> dpu_kms->catalog);
>> @@ -1100,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>           rc = PTR_ERR(dpu_kms->hw_intr);
>>           DPU_ERROR("hw_intr init failed: %d\n", rc);
>>           dpu_kms->hw_intr = NULL;
>> -        goto hw_intr_init_err;
>> +        goto err_pm_put;
>>       }
>>       dev->mode_config.min_width = 0;
>> @@ -1125,7 +1125,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>       rc = _dpu_kms_drm_obj_init(dpu_kms);
>>       if (rc) {
>>           DPU_ERROR("modeset init failed: %d\n", rc);
>> -        goto drm_obj_init_err;
>> +        goto err_pm_put;
>>       }
>>       dpu_vbif_init_memtypes(dpu_kms);
>> @@ -1134,10 +1134,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>       return 0;
>> -drm_obj_init_err:
> 
> Hey Dmitry,
> 
> The change itself LGTM -- however, it seems that there's a dependency on 
> the core perf cleanup series that wasn't listed in the cover letter.

Yes. And unfortunately a dependency on
https://patchwork.freedesktop.org/series/105392/

> 
> Thanks,
> 
> Jessica Zhang
> 
>> -hw_intr_init_err:
>> -perf_err:
>> -power_error:
>> +err_pm_put:
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   error:
>>       _dpu_kms_hw_destroy(dpu_kms);
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

