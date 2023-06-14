Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D472FDC6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 14:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E89610E44C;
	Wed, 14 Jun 2023 12:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88A110E452
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 12:02:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f74cda5f1dso3996165e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686744120; x=1689336120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=APFMvQ7ODanIJV/49mozRJR24EjLchmIY1aNYth0n0A=;
 b=cTE7StskKa1gOaN7Q4vGHXf7JziI+921scTA1Z61XuufieMoN+Trr9ZQ3pSAeRV9kQ
 fuWWvXmT8uxLNssEsSF0r6cJQE5YwKJX79SJAahFrtogD0kzcxNFvshgApQn1+He74TY
 NBAUeTr/VEIAq2IJ4OBAPpm1ijZIYWLtssBGvtnRXUyALHFQWAtwqQBw8z2NHDUe193U
 XAzCGOun/DCYIp2+uZ79CwN6kthVUm9oNNBZOyRoxkO6A/KFszlfmyfYpWDIlHsWjJGB
 qm6iE1owS5MD7z8NHdozhaCLxjreKzzcr3HB7murAFsjKmevtaYAxo4hRkA1lsmj4YHZ
 B41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686744120; x=1689336120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=APFMvQ7ODanIJV/49mozRJR24EjLchmIY1aNYth0n0A=;
 b=QrfZdqvZyVq4G2IpvaRUQ64U8EKU/2FZp6LjFghjHO6Pge/AxrjCaUfH6XwwOp+LtT
 bmEafZ2tXg19BnNIQrbqJ8AMuRyG6OEwMAsPSrQipWebWl0wzDIlckubx7y+tEXP0rK5
 0uSCqvin3pO2J/IPr4y4keEO+xaR5SQHTdZilbeiUqYCC6fIMxicDcPaGAXOm/ZwGJfp
 oGhx7ioEAOGWEe2IHngwPxJWdCnM8M/9GBKrlzX1SYg/wfVoeXOkdWmIG1pbAKD+4DpE
 M8pGYbYPke/62tQCQF5+Co/fP6A8LdPTdvkMtTKkZLi0jRVPp4IqIO6M8NuIg+mn+8Jm
 kciQ==
X-Gm-Message-State: AC+VfDy+o5xKETYX1SjAIPsi0QV6D515CQIv6vC6ELSR11ORrj78F0Xi
 XcpyEuuAjx5B5DeFk/P4v1AiCw==
X-Google-Smtp-Source: ACHHUZ4rNTYSmY8dJMj9rW18QV3jmWIGNjGK3rX385cmsN6Bsiry3yG0eLvhyGVb2+zuGkVHDiUiCQ==
X-Received: by 2002:ac2:4d9b:0:b0:4f3:a61d:19d2 with SMTP id
 g27-20020ac24d9b000000b004f3a61d19d2mr7414911lfe.36.1686744120599; 
 Wed, 14 Jun 2023 05:02:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f2-20020ac251a2000000b004f62229b6c1sm2099072lfk.252.2023.06.14.05.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 05:01:59 -0700 (PDT)
Message-ID: <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
Date: Wed, 14 Jun 2023 15:01:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN feature flag
 for DPU >= 5.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2023 14:42, Marijn Suijten wrote:
> On 2023-06-13 18:57:11, Jessica Zhang wrote:
>> DPU 5.x+ supports a databus widen mode that allows more data to be sent
>> per pclk. Enable this feature flag on all relevant chipsets.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 36ba3f58dcdf..0be7bf0bfc41 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -103,7 +103,8 @@
>>   	(BIT(DPU_INTF_INPUT_CTRL) | \
>>   	 BIT(DPU_INTF_TE) | \
>>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>> -	 BIT(DPU_DATA_HCTL_EN))
>> +	 BIT(DPU_DATA_HCTL_EN) | \
>> +	 BIT(DPU_INTF_DATABUS_WIDEN))
> 
> This doesn't work.  DPU 5.0.0 is SM8150, which has DSI 6G 2.3.  In the
> last patch for DSI you state and enable widebus for DSI 6G 2.5+ only,
> meaning DPU and DSI are now desynced, and the output is completely
> corrupted.
> 
> Is the bound in dsi_host wrong, or do DPU and DSI need to communicate
> when widebus will be enabled, based on DPU && DSI supporting it?

I'd prefer to follow the second approach, as we did for DP. DPU asks the 
actual video output driver if widebus is to be enabled.

> 
> - Marijn
> 
>>   #define INTF_SC7280_MASK (INTF_SC7180_MASK | BIT(DPU_INTF_DATA_COMPRESS))
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index b860784ade72..b9939e00f5e0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -182,6 +182,7 @@ enum {
>>    *                                  than video timing
>>    * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>>    * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
>> + * @DPU_INTF_DATABUS_WIDEN          INTF block has DATABUS_WIDEN register
>>    * @DPU_INTF_MAX
>>    */
>>   enum {
>> @@ -190,6 +191,7 @@ enum {
>>   	DPU_DATA_HCTL_EN,
>>   	DPU_INTF_STATUS_SUPPORTED,
>>   	DPU_INTF_DATA_COMPRESS,
>> +	DPU_INTF_DATABUS_WIDEN,
>>   	DPU_INTF_MAX
>>   };
>>   
>>
>> -- 
>> 2.40.1
>>

-- 
With best wishes
Dmitry

