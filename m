Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5E74BA1A
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5451710E617;
	Fri,  7 Jul 2023 23:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DE710E61C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:48:55 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so3998566e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688773733; x=1691365733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZAR6us1ginvwagA6iA1+ZaHnkbJvmRpkHBkWSUBw4zI=;
 b=uvURydsxo0LbzY1Q2/aSupUNVxlZygjxYAVrQQTXCMyb6IBVHYTbhYrVjGjci+T9A0
 eEWuurCTIQwj3ixFqT4DnLakYtWPRFyl/umtiCSS7VY612cIH0moX3/+/RziJ+shmQ1G
 wlLlbGyGSXT3sqHu0A2FhHX3zaNtG3CZK4PHThIs2Hfct+jXhVFfSzTv9Fkoe1/2cKtq
 I+luCdnTat4CCdrfyVvoKadAeFWHRTFEp8vcsbRb4sL7UjGOK0sPZkO14r/Y5YmXq44l
 79GzX4jVFVZTruJMert2w8/8Df+LjwYRcT1TRDYoW8jH9lX2H+1PQLPJkXPjl8XSfigU
 j7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688773733; x=1691365733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAR6us1ginvwagA6iA1+ZaHnkbJvmRpkHBkWSUBw4zI=;
 b=LmE2Z0702n7uI+psvrqSIA0QTRXJR6TsNat3KWAqaitmJEeZy5Qt7RJZQFBPPZoFdB
 blyJHQuxfaBpfpOEWNgtFIBBGAoujcN960YXIjGp+0fpfO7SldXKSadApR4EFlFKW7z5
 0TyZlceOsAZZmTyi605c4SU97qk9ZmHuJ7JP4J3o1s9II/2LdQJOlwbirhQAUXvHuY8J
 8H6dOfvJug1u+00UqbyqYTM9EzgCyT3E+kZBF2wxlbNK7YEnIqDDKCxXLOVpW0yHwRWC
 fSbqUfFSzn6X14JUvg7imlXrCuxB9U7FHOqPZeoUxG+Ppux/a93VZPElDAGtv4AmqbRU
 1GWA==
X-Gm-Message-State: ABy/qLYvM7lDize/lE16dUyh5mpHtj4JStCRFL+pW2SwQfkMYY1FFc/l
 P9RdL6Rphe4O8xOUcSkdBlKOAg==
X-Google-Smtp-Source: APBJJlHcwTn6+gi0XyaxHfo/sKdp+Jvp0ZA0w7IT0pnTqhPPEhXuvL62dJE/e7VxTOTaT1cPNxe/Ng==
X-Received: by 2002:ac2:58e4:0:b0:4fb:9772:6639 with SMTP id
 v4-20020ac258e4000000b004fb97726639mr4153871lfo.6.1688773733550; 
 Fri, 07 Jul 2023 16:48:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o15-20020ac2494f000000b004fba09ae900sm838031lfi.149.2023.07.07.16.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 16:48:53 -0700 (PDT)
Message-ID: <cc312e51-e0c0-c1f9-aa56-60cf95e23b79@linaro.org>
Date: Sat, 8 Jul 2023 02:48:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
 <20230707203724.3820757-2-dmitry.baryshkov@linaro.org>
 <81ff3de5-4fe4-9c01-5655-78f5311f7817@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <81ff3de5-4fe4-9c01-5655-78f5311f7817@linaro.org>
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

On 08/07/2023 02:25, Konrad Dybcio wrote:
> On 7.07.2023 22:37, Dmitry Baryshkov wrote:
>> It was noticed that dpu_kms_hw_init()'s error path contains several
>> labels which point to the same code path. Replace all of them with a
>> single label.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> it's the first time I'm seeing this code
> 

It is Suggested-by, not something else. And you pointed it out in 
https://lore.kernel.org/linux-arm-msm/6d598438-f10f-8678-7878-829b8b3ae790@linaro.org/

> Konrad
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
>>   1 file changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index c11b3ab572ab..e7ac02e92f42 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1037,7 +1037,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   	if (!dpu_kms->catalog) {
>>   		DPU_ERROR("device config not known!\n");
>>   		rc = -EINVAL;
>> -		goto power_error;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	/*
>> @@ -1047,13 +1047,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   	rc = _dpu_kms_mmu_init(dpu_kms);
>>   	if (rc) {
>>   		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
>> -		goto power_error;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>>   	if (rc) {
>>   		DPU_ERROR("rm init failed: %d\n", rc);
>> -		goto power_error;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	dpu_kms->rm_init = true;
>> @@ -1065,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   		rc = PTR_ERR(dpu_kms->hw_mdp);
>>   		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>>   		dpu_kms->hw_mdp = NULL;
>> -		goto power_error;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>> @@ -1076,7 +1076,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>>   			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
>> -			goto power_error;
>> +			goto err_pm_put;
>>   		}
>>   
>>   		dpu_kms->hw_vbif[vbif->id] = hw;
>> @@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
>>   	if (rc) {
>>   		DPU_ERROR("failed to init perf %d\n", rc);
>> -		goto perf_err;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
>> @@ -1100,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   		rc = PTR_ERR(dpu_kms->hw_intr);
>>   		DPU_ERROR("hw_intr init failed: %d\n", rc);
>>   		dpu_kms->hw_intr = NULL;
>> -		goto hw_intr_init_err;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	dev->mode_config.min_width = 0;
>> @@ -1125,7 +1125,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   	rc = _dpu_kms_drm_obj_init(dpu_kms);
>>   	if (rc) {
>>   		DPU_ERROR("modeset init failed: %d\n", rc);
>> -		goto drm_obj_init_err;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	dpu_vbif_init_memtypes(dpu_kms);
>> @@ -1134,10 +1134,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   
>>   	return 0;
>>   
>> -drm_obj_init_err:
>> -hw_intr_init_err:
>> -perf_err:
>> -power_error:
>> +err_pm_put:
>>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   error:
>>   	_dpu_kms_hw_destroy(dpu_kms);

-- 
With best wishes
Dmitry

