Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC06EB123
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8A910E2ED;
	Fri, 21 Apr 2023 17:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB7710E2ED
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 17:49:46 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4edc63c82d1so2031279e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 10:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682099385; x=1684691385;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QA8eIh8mDUQlSp+1L5GyLIAYl0/x6KnILq2r7tRuwzo=;
 b=eKu8ReBDszsudMGS/Ft57dFRbJC+wHQNBI8td/MG+bkN6SIsv8caGgqhiAiNVG8NP+
 3vSCF5s4z9lp2l1WBFR7AzWNmsrdYiAJa4nBqi4/twwn0RWgEDmeb+dMioLac/eNUlMJ
 lp7XLpjWRhIB2FYH3X8+3mpulbA3jWSB74zUj5WiLhGd2XOwbpDP9t5Gu8X22TXuNEcD
 Ehrl+jfUJi5QAL3IysYEzz+r33izDZ6EDIuKrF5P9jQl2wXV2PFvCLdLusblejHxzYfW
 H/0AOMwV6pwiJ/EPzhX5RoatbrrCegseEHBYukJZvREIE0qW+7rojDJ1HuyFQA3EG7CV
 M2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682099385; x=1684691385;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QA8eIh8mDUQlSp+1L5GyLIAYl0/x6KnILq2r7tRuwzo=;
 b=IkGrQ2OGwoVxzybiqRj2SJ8Oi4o4BZqNTFMzyyLOnKwO/jbEHpCbkxl6r0+knVs4uG
 +eN/EuAvDuPO1e9hkDnI3ZFd6ARmKHR6l4sscggaRYqtTrf8YE5sU0Ur9J9inZz59uoX
 H9CjETa9COmBrhND+C7CcNOXK97YNt4Xx1mG3LS+oxD0z7/MVcwJn3+mVlvt2FXRoaHG
 lSq6mcUqAeJCZxd/8SK1YbU0G/fwD5xmsw74wIA5fzbHnsjkvlHic5hjPbxyvNkuXbMa
 zti270/iV+pLOgbbXciDCtg8q2ueak7yZ7QagiKsn8DXkaGqbJuWdJ6e9KvjTJSLaTm8
 n6Aw==
X-Gm-Message-State: AAQBX9fumOe20yDTfpD5Aidy5hZLo4i/kePQh9J7FjarP+48PUveXRbm
 RD2L72Ib7SpWhUFhPzFZLYlVrg==
X-Google-Smtp-Source: AKy350Z/NqtsKv1DQxEaUYVtp5Q8Th1/CxJ4Z4Q6SIxaMWn4BwmuLNpuZT1lYVCslNVFrEC/uDubBw==
X-Received: by 2002:ac2:4101:0:b0:4ed:bfcf:3109 with SMTP id
 b1-20020ac24101000000b004edbfcf3109mr1386854lfi.56.1682099385033; 
 Fri, 21 Apr 2023 10:49:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h25-20020ac250d9000000b004eb09820adbsm623071lfm.105.2023.04.21.10.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 10:49:44 -0700 (PDT)
Message-ID: <fe3234f7-0f6a-aa63-c2b2-69bf3b2509f5@linaro.org>
Date: Fri, 21 Apr 2023 20:49:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: stop mapping the regdma region
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
 <20230420222558.1208887-2-dmitry.baryshkov@linaro.org>
 <cwy7eyop2heahqvlijp6a66acwhpfcg6feq2khfw2detul6fxk@qnkhj4iwo23k>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cwy7eyop2heahqvlijp6a66acwhpfcg6feq2khfw2detul6fxk@qnkhj4iwo23k>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 10:35, Marijn Suijten wrote:
> On 2023-04-21 01:25:58, Dmitry Baryshkov wrote:
>> Stop mapping the regdma region. The driver does not support regdma.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Should you add a third patch to remove this from dt-bindings?
> (msm8998 has it in both dpu and mdss files)

No. Bindings describe the hardware, and the hardware has this region. If 
at some point it is put to use, we should not modify bindings again.

> 
> Regardless, the patch itself is:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
>>   2 files changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 0e7a68714e9e..28d74d4d2c1d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1033,12 +1033,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   		DPU_DEBUG("VBIF NRT is not defined");
>>   	}
>>   
>> -	dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma");
>> -	if (IS_ERR(dpu_kms->reg_dma)) {
>> -		dpu_kms->reg_dma = NULL;
>> -		DPU_DEBUG("REG_DMA is not defined");
>> -	}
>> -
>>   	dpu_kms_parse_data_bus_icc_path(dpu_kms);
>>   
>>   	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> index aca39a4689f4..15111e433f21 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> @@ -71,7 +71,7 @@ struct dpu_kms {
>>   	const struct dpu_mdss_cfg *catalog;
>>   
>>   	/* io/register spaces: */
>> -	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
>> +	void __iomem *mmio, *vbif[VBIF_MAX];
>>   
>>   	struct regulator *vdd;
>>   	struct regulator *mmagic;
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

