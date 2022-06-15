Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F654D112
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0900911287A;
	Wed, 15 Jun 2022 18:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D62112880
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 18:42:02 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id m25so14250610lji.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oLMY36PZ3nW7GKaFEt/tQXwOlaFMOJLeGVecYzJXHB0=;
 b=txKicfVz471k6uUxfSx1HiuFNxhaT8dtKjeFwbheGMbIC2Gfes23b8H0LwZAeH7kU+
 M0fnapAgLc5CApfDC7lsViX+89vHI8Kr9iw4QznDnLd6sSb1knZgluv6PbrEuJr3x5Qa
 PGr4qtQU1vOvcePHTZHR7xRUTEy3fK0tlf7n/t9piYE9eWyEQe+sbzmmcfancDQUXPHe
 mxuqinYfFIntz9nRE/m5S3wg4MBm6GSmpCQimRVv7G7pi5WT4ihdLFpFeGBN9fdYO44K
 VJvVYSod+9u/CNvGu3EGyOCLH3T3dsVAlAo2tp8csb0mrfWEMErvFCNfodE+d4LHEvNF
 Li1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oLMY36PZ3nW7GKaFEt/tQXwOlaFMOJLeGVecYzJXHB0=;
 b=4KGQ+LHnLV6ZiBKFgLi9Vn4GFPlbVSu7BtvBEl5ZNM3p8Q/2gtN/8zLrD9kElN0QOt
 5JgJdUmXJsljKdmwZp5zhwMLJbEoxi8sqq5fbEuHThcILZci6o/3Ge34Z0pGpZpJ3W0L
 0IC3KKzexXQF93Ef+lzGerBbJ54YgxGqtuLCKbAtKqffzvm/i/Nfh+8gEqVuxaAvPUc2
 XqwgjG9o5rAo6hBcQ1dt8LaYnnrpCiRCRIvExtyn6lcRG59rFADOwxMJ9jHxq27lEsui
 sfkgTJ+oDNGmxVWkYaeJBpFGstZQismthGM4B4ug1ZxH91MfwhoEn5XiaJsomoMZSEJ1
 BGIg==
X-Gm-Message-State: AJIora81QNunnyhDmVvFc443/JImK0OFyH6WaNKnjxt1/HTyKNi9aO5v
 4yrtQ2Bd3pwhd8iTmJMO9YxgoA==
X-Google-Smtp-Source: AGRyM1vDgzmCi4yDlvrCARv17NB22Q1PGE6RhpepS9n39418PdS0Z6OWHDGfQQyiNRkTTKF1pt3QDA==
X-Received: by 2002:a2e:908b:0:b0:255:68b4:4085 with SMTP id
 l11-20020a2e908b000000b0025568b44085mr554520ljg.369.1655318521094; 
 Wed, 15 Jun 2022 11:42:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 194-20020a2e05cb000000b00253dfbe2522sm1747017ljf.100.2022.06.15.11.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 11:42:00 -0700 (PDT)
Message-ID: <3e3215e2-2ddc-377f-f43a-1532dabd9727@linaro.org>
Date: Wed, 15 Jun 2022 21:42:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Freedreno] [PATCH v2 1/5] drm/msm/dpu: check both DPU and MDSS
 devices for the IOMMU
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-2-dmitry.baryshkov@linaro.org>
 <14f2d0e2-6c34-e244-26a4-79638b147592@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <14f2d0e2-6c34-e244-26a4-79638b147592@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/06/2022 20:55, Abhinav Kumar wrote:
> 
> 
> On 5/4/2022 5:16 PM, Dmitry Baryshkov wrote:
>> Follow the lead of MDP5 driver and check both DPU and MDSS devices for
>> the IOMMU specifiers.
>>
>> Historically DPU devices had IOMMU specified in the MDSS device tree
>> node, but as some of MDP5 devices are being converted to the supported
>> by the DPU driver, the driver should adapt and check both devices.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 143d6643be53..5ccda0766f6c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1004,14 +1004,22 @@ static int _dpu_kms_mmu_init(struct dpu_kms 
>> *dpu_kms)
>>       struct msm_mmu *mmu;
>>       struct device *dpu_dev = dpu_kms->dev->dev;
>>       struct device *mdss_dev = dpu_dev->parent;
>> +    struct device *iommu_dev;
>>       domain = iommu_domain_alloc(&platform_bus_type);
>>       if (!domain)
>>           return 0;
>> -    /* IOMMUs are a part of MDSS device tree binding, not the
>> -     * MDP/DPU device. */
>> -    mmu = msm_iommu_new(mdss_dev, domain);
>> +    /*
>> +     * IOMMUs can be a part of MDSS device tree binding, or the
>> +     * MDP/DPU device.
>> +     */
> 
> Can you please explain this a little more?
> 
> So even if some of the mdp5 devices are getting converted to use DPU 
> driver, their device trees are also updated right?

No. The DT describes the device, not the Linux drivers. So while 
updating the drivers we should not change the DT.

> 
> In other words, if DPU driver was using mdss_dev to initialize the 
> iommu, why should the new devices which are going to use DPU have the 
> binding in the dpu_dev?
> 
> 
>> +    if (dev_iommu_fwspec_get(dpu_dev))
>> +        iommu_dev = dpu_dev;
>> +    else
>> +        iommu_dev = mdss_dev;
>> +
>> +    mmu = msm_iommu_new(iommu_dev, domain);
>>       if (IS_ERR(mmu)) {
>>           iommu_domain_free(domain);
>>           return PTR_ERR(mmu);


-- 
With best wishes
Dmitry
