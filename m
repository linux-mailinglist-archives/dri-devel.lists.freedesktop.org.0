Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8153574BD2E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 12:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BD110E0D8;
	Sat,  8 Jul 2023 10:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9E510E0D8
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 10:01:56 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb7373dd35so4943749e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688810514; x=1691402514;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9rj4Z+mfXCUyYvWmdsCMEO/uJfLE2EY/r48qFdhgyH0=;
 b=CUXDl9tiMZGH+iNUEyIY1qGILZhIZ9KyvhorLTot++kLhNw2jWrlbYOECjvgSlmHTE
 gKhvrbp01KSJHGubXkEaVZZOAArHTnFU0NOPYulJJS2IJAj6SG/5+2qaoM9udGQNihXS
 6TLN1CWIBcck5b6546uaATY+9n+i9uZGy/Hzk2AcxZ3Oo4kylvU2yKetj0HXZABzicgm
 xo7p5noonPOno28y7tLO0m2t17sIxskfUvQ/BRQvHqVraOEbq5SUX2vKTmeme+T976H0
 1n8Yu9FDna1wpRSQFPE+zF6or9zgjUMFHHKUU3cOJHMjZjCfIRkn7pBvcXtTwtZ0edxT
 ug9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688810514; x=1691402514;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9rj4Z+mfXCUyYvWmdsCMEO/uJfLE2EY/r48qFdhgyH0=;
 b=e6luWbj4K6bjTyv+LMzKWKxrWdUKUJtsOOC0jtkD6bwtPrGmh+2d3pL8xlJljSHTwj
 09m3cQg2EUl1Fdzw7QXReOpUMwK9keou6vb1kcEyEjkhajZkETe9tIjYB6mLf+Cj1bsh
 Bk9RikgrjtatEhKtdkVHwSHStwA67D9q8Jw+Hhsek+clTSZ7covyUImIzGZrb7WVgMWC
 jJawK7C3Hp8EZF9pWr6CEzjPIDBHONPZ8khEHTh1yk+tvEDdC0bvGogZIE7v7/tUMzkQ
 SLrR5c4PlPhNiFgRMSIJ2dHDdZf4+7PLSEfmcVCed+//4LbHWwWQf5x4SVjWneTQHG+6
 8qjQ==
X-Gm-Message-State: ABy/qLY9E7iLP/YgpdPvDTj3LWbdjkgmzLPjlpuaxKgyq/zmMfz3a+9Y
 VjAqOfdq8xK1oH1mqMzedL793A==
X-Google-Smtp-Source: APBJJlFtarhQ7GHwzpt/YmIpHZWCB8CH6BbzO3TJOLN98PLGPmi9DfQaZvOvRTZmU8hJUh560F2qRw==
X-Received: by 2002:a19:2d10:0:b0:4f9:56a5:81d0 with SMTP id
 k16-20020a192d10000000b004f956a581d0mr2607956lfj.24.1688810514203; 
 Sat, 08 Jul 2023 03:01:54 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 q15-20020ac246ef000000b004fac93bdaecsm973139lfo.242.2023.07.08.03.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 03:01:53 -0700 (PDT)
Message-ID: <537dfdac-9a60-34aa-ab60-e09a08792e43@linaro.org>
Date: Sat, 8 Jul 2023 12:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
 <20230707203724.3820757-2-dmitry.baryshkov@linaro.org>
 <81ff3de5-4fe4-9c01-5655-78f5311f7817@linaro.org>
 <cc312e51-e0c0-c1f9-aa56-60cf95e23b79@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <cc312e51-e0c0-c1f9-aa56-60cf95e23b79@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 8.07.2023 01:48, Dmitry Baryshkov wrote:
> On 08/07/2023 02:25, Konrad Dybcio wrote:
>> On 7.07.2023 22:37, Dmitry Baryshkov wrote:
>>> It was noticed that dpu_kms_hw_init()'s error path contains several
>>> labels which point to the same code path. Replace all of them with a
>>> single label.
>>>
>>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> it's the first time I'm seeing this code
>>
> 
> It is Suggested-by, not something else. And you pointed it out in https://lore.kernel.org/linux-arm-msm/6d598438-f10f-8678-7878-829b8b3ae790@linaro.org/
Oh, thanks

Konrad
> 
>> Konrad
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
>>>   1 file changed, 9 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index c11b3ab572ab..e7ac02e92f42 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1037,7 +1037,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>       if (!dpu_kms->catalog) {
>>>           DPU_ERROR("device config not known!\n");
>>>           rc = -EINVAL;
>>> -        goto power_error;
>>> +        goto err_pm_put;
>>>       }
>>>         /*
>>> @@ -1047,13 +1047,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>       rc = _dpu_kms_mmu_init(dpu_kms);
>>>       if (rc) {
>>>           DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
>>> -        goto power_error;
>>> +        goto err_pm_put;
>>>       }
>>>         rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>>>       if (rc) {
>>>           DPU_ERROR("rm init failed: %d\n", rc);
>>> -        goto power_error;
>>> +        goto err_pm_put;
>>>       }
>>>         dpu_kms->rm_init = true;
>>> @@ -1065,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>           rc = PTR_ERR(dpu_kms->hw_mdp);
>>>           DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>>>           dpu_kms->hw_mdp = NULL;
>>> -        goto power_error;
>>> +        goto err_pm_put;
>>>       }
>>>         for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>>> @@ -1076,7 +1076,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>           if (IS_ERR(hw)) {
>>>               rc = PTR_ERR(hw);
>>>               DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
>>> -            goto power_error;
>>> +            goto err_pm_put;
>>>           }
>>>             dpu_kms->hw_vbif[vbif->id] = hw;
>>> @@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>       rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
>>>       if (rc) {
>>>           DPU_ERROR("failed to init perf %d\n", rc);
>>> -        goto perf_err;
>>> +        goto err_pm_put;
>>>       }
>>>         dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
>>> @@ -1100,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>           rc = PTR_ERR(dpu_kms->hw_intr);
>>>           DPU_ERROR("hw_intr init failed: %d\n", rc);
>>>           dpu_kms->hw_intr = NULL;
>>> -        goto hw_intr_init_err;
>>> +        goto err_pm_put;
>>>       }
>>>         dev->mode_config.min_width = 0;
>>> @@ -1125,7 +1125,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>       rc = _dpu_kms_drm_obj_init(dpu_kms);
>>>       if (rc) {
>>>           DPU_ERROR("modeset init failed: %d\n", rc);
>>> -        goto drm_obj_init_err;
>>> +        goto err_pm_put;
>>>       }
>>>         dpu_vbif_init_memtypes(dpu_kms);
>>> @@ -1134,10 +1134,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>         return 0;
>>>   -drm_obj_init_err:
>>> -hw_intr_init_err:
>>> -perf_err:
>>> -power_error:
>>> +err_pm_put:
>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>   error:
>>>       _dpu_kms_hw_destroy(dpu_kms);
> 
