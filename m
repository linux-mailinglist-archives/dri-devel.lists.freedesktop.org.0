Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5F31CFD9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 19:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C35B89F4A;
	Tue, 16 Feb 2021 18:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC10989D52
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 18:06:23 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id c1so7717360qtc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 10:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jY9iK1+FYhqLlmeOaaKNMJnRWWpPl1FPPGfZFgnoHOA=;
 b=J61crQvmK+qVVsBKTRgxh97TUx35Xd9UngcxEIQ/FyDCnqG3ntUYW6zNuklrBgg7x5
 ShKstpDoEWs9PStyAOU+UKjYTs6+5LthtKz9Rg4OdVpGi0Zv3SkYd4HXkdhQvm/NfgdN
 YprLyz0UaIbY8olus8ju7DrI7UfbrWx/hAZi2BXnPFnU3f2VZ0si/d2X/sfJdfLviiKA
 1Euhj4lzODbXo/VEV3LvfmPFEY+nKCsAGI51foeMn1jiL289OS7qcCHVaz2+jPqSiPSx
 MLnSqIDr8fokhb3RBdL+sZA+blwRG/leGdFtkBDxvvrvwBFPcR65/tRVe+4aKs9CI2Ai
 JhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jY9iK1+FYhqLlmeOaaKNMJnRWWpPl1FPPGfZFgnoHOA=;
 b=I72/idOaS6mpsdJ2cvblVX84pwgegUDYN0v2fICLwIPUCPhNA3ytFOgrclVb4XrQi0
 TbXciR8sk/4hXzjywNgWuq2CEXYAPEjoIYxsUZZ7CR/XEogCut0J2jA7/KVvsojgvAPF
 Bm6GMwFj3Gm5HUAyeGAbzEwqwmetIHipKdIHD/As/sXgWQgpuXNQBau0bYx8/9be6jAN
 iB+AEFdV1b7JRosCOA9pRfrTXNZL0RseXk8tkSueGSr1uG+g2dTWv9tYCnpKFdshsSFz
 IjLYY0KWhjUDHLQupUNcJdEqk/xMi8kCd2VJk8YpwoJ2IxPocIVVv8JQ2KyVzQZjx55W
 P8dQ==
X-Gm-Message-State: AOAM530pYRFppJJZzU1W/IJuwdbgTIJnsAe3To+PJ28rfzyXLXmlMNsH
 2R8aGB0Gw6kNLMrgPuXhKBbn+A==
X-Google-Smtp-Source: ABdhPJwokn1VAbBbWme8hbQKD48AY7keANjDwy6xiTFqQEmNtcyAGSGs2OgTmgYhB+BvFCvS44aLWw==
X-Received: by 2002:a05:622a:216:: with SMTP id
 b22mr19554660qtx.163.1613498782789; 
 Tue, 16 Feb 2021 10:06:22 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id x6sm3255622qkj.118.2021.02.16.10.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 10:06:22 -0800 (PST)
Subject: Re: [PATCH v2 1/2] drm/msm: add compatibles for sm8150/sm8250 display
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20210215161537.14696-1-jonathan@marek.ca>
 <20210215161537.14696-2-jonathan@marek.ca>
 <CAA8EJpo_Fs8Wj6zjH6BQqm=mG=qcGt3_JMj4nK-vsKCzr8tn1g@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <29231c68-0cc4-9d8a-8cb1-791511780bcd@marek.ca>
Date: Tue, 16 Feb 2021 13:05:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAA8EJpo_Fs8Wj6zjH6BQqm=mG=qcGt3_JMj4nK-vsKCzr8tn1g@mail.gmail.com>
Content-Language: en-US
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Tanmay Shah <tanmay@codeaurora.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, tongtiangen <tongtiangen@huawei.com>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/21 11:54 AM, Dmitry Baryshkov wrote:
> On Mon, 15 Feb 2021 at 19:25, Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> The driver already has support for sm8150/sm8250, but the compatibles were
>> never added.
>>
>> Also inverse the non-mdp4 condition in add_display_components() to avoid
>> having to check every new compatible in the condition.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
>>   drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
>>   3 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
>> index 551ae26f60da..5763f43200a0 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
>> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
>>
>>   MDSS:
>>   Required properties:
>> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
>> +- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
>>   - reg: physical base address and length of contoller's registers.
>>   - reg-names: register region names. The following region is required:
>>     * "mdss"
>> @@ -41,7 +41,7 @@ Optional properties:
>>
>>   MDP:
>>   Required properties:
>> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
>> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
>>   - reg: physical base address and length of controller's registers.
>>   - reg-names : register region names. The following region is required:
>>     * "mdp"
> 
> These two chunks should probably go to the separate patch 'dt-bindings:...'.
> 

In this case I think its better to have this change in the same patch, 
but maybe one of the Robs will disagree.

> Also, could you please pinpoint the reason for adding more
> compatibility strings, while they map to the same internal data?
> I think we might want instead to use some generic name for the dpu
> block, like "qcom,dpu" or "qcom,mdp-dpu" instead of specifying the
> platform name.
> 

sdm845 and sc7180 aren't using generic compatibles, this is just being 
consistent with that.

> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 5a8e3e1fc48c..fff12a4c8bfc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
>>   static const struct of_device_id dpu_dt_match[] = {
>>          { .compatible = "qcom,sdm845-dpu", },
>>          { .compatible = "qcom,sc7180-dpu", },
>> +       { .compatible = "qcom,sm8150-dpu", },
>> +       { .compatible = "qcom,sm8250-dpu", },
>>          {}
>>   };
>>   MODULE_DEVICE_TABLE(of, dpu_dt_match);
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 94525ac76d4e..928f13d4bfbc 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
>>           * Populate the children devices, find the MDP5/DPU node, and then add
>>           * the interfaces to our components list.
>>           */
>> -       if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
>> -           of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
>> -           of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
>> +       if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
>>                  ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>>                  if (ret) {
>>                          DRM_DEV_ERROR(dev, "failed to populate children devices\n");
>> @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
>>          { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
>>          { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>>          { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
>> +       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
>> +       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
>>          {}
>>   };
>>   MODULE_DEVICE_TABLE(of, dt_match);
>> --
>> 2.26.1
>>
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
