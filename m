Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D2D6FA263
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D54910E189;
	Mon,  8 May 2023 08:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986B910E185
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:36:13 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4efd6e26585so4765689e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683534971; x=1686126971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7vOeK6NJXfng1Er3sfGOPlcD75JIf3x+ne87klUAZe8=;
 b=VjTc2e0tCdENNTGTlYaTu6SbmL+2zAqbhOvhqn8Ke3GrBw0BulOfpPKx61Gnsq+pau
 M97jxNpDaGyMW/osQhp3kBshxpA+lq1IZikHIjue/85Ye3S+zucnAIriJRfMjfKv91XR
 LXpKbcxRWPMkjOWfzBeqUKqb7sO5Tha6rVHExUgAiWXPOrk0KZsN1S5+VrT+AcbkXMhC
 nPuVH3iUsGdjUPSI/8SaEMgn4GZohy/J/J2mdHV6i/+9haCNoFx6/BYxpxKFTdSW8qXJ
 J/O3SefH9o5JXrkzC7cwR4tc+su3M2iLQcHon98PVnTrwxciiN7ExjmgJRWaQ83ztIYC
 sBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534971; x=1686126971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7vOeK6NJXfng1Er3sfGOPlcD75JIf3x+ne87klUAZe8=;
 b=SmIpqCBYPkFGu2LqcdyIenPDiCGzUXhp538aN6Eu/KH5dHHe8eqSXy6Lz8b3tBC6ZN
 iXNkPGPp7FwREMYQ/DTh3ZMmohmMNiMxiyFEmkqNb3npTBYoX0eka93pomJojFZlOrPg
 xQLPcwkyqiyRBRXLoCF2GRrWqdZ9H9iTFcXtmtMUkVqq8+lEsrsjnvygPMpkxImjyiEC
 meB3hNHGsA0oPBgfzIrtr7j4mvyO/GBsNvCU9wxVHSFCGDZje34EU2RpMzrblZkkiBu0
 NAIjuC2EdqOa08nbP0guNOkl/I9qMn4zTDZXtHP9ZINhPwrV2OnJfznnIbMmZK86vD2T
 y5YQ==
X-Gm-Message-State: AC+VfDzxTehaSYEWca7v2CVrYPQMPOfzxEtDV/NA6N21EjpwKwyPq4RF
 8q5WJoDojFIdAuYisnh8WAfPNg==
X-Google-Smtp-Source: ACHHUZ6/bXi/Yh+/jHrYdIbEzAMWQSkOek/BIP7BFnilquyHz/JZcmKS5cfq6hr+S1+7VeyczkzauA==
X-Received: by 2002:ac2:47e5:0:b0:4ef:ec94:9678 with SMTP id
 b5-20020ac247e5000000b004efec949678mr2744507lfp.20.1683534971320; 
 Mon, 08 May 2023 01:36:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 v9-20020ac25609000000b004efee4ff266sm1230248lfd.67.2023.05.08.01.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:36:10 -0700 (PDT)
Message-ID: <6b93e2a9-58aa-bb91-f615-3fdec52596da@linaro.org>
Date: Mon, 8 May 2023 10:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature
 flag
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
Content-Type: text/plain; charset=UTF-8
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7.05.2023 18:00, Marijn Suijten wrote:
> On 2023-05-05 14:23:50, Jessica Zhang wrote:
>> Add DATA_COMPRESS feature flag to DPU INTF block.
>>
>> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
>> PINGPONG to INTF.
>>
>> As core_rev (and related macros) was removed from the dpu_kms struct, the
>> most straightforward way to indicate the presence of this register would be
>> to have a feature flag.
> 
> Irrelevant.  Even though core_rev was still in mainline until recently,
> we always hardcoded the features in the catalog and only used core_rev
> to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
> then enable feature Y" logic, this manually-enabled feature flag is the
> only, correct way to do it.
> 
>> Changes in v2:
>> - Changed has_data_compress dpu_cap to a DATA_COMPRESS INTF feature flag
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 7944481d0a33..c74051906d05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -104,7 +104,7 @@
>>  #define INTF_SC7180_MASK \
>>  	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
>>  
>> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>> +#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS)
> 
> Konrad: Your SM6350/SM6375 series v3 [1] switched from INTF_SC7180_MASK
> to INTF_SC7280_MASK to enable HCTL on SM6375, but that will now
> erroneously also receive this feature flag and write the new
> DATA_COMPESS mask even if it's DPU 6.9 (< 7.x where it got added).
> 
> [1]: https://lore.kernel.org/linux-arm-msm/80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org/T/#u
> 
> Depending on who lands first, this flag should be split.
I'll adapt my patches. Jessica, no changes required on your side.

> 
> I still see value in inlining and removing these defines, though that
> brings a host of other complexity.
right, we should totally do it after we settle down from the patch
flurry

Konrad
> 
> - Marijn
> 
>>  #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>  			 BIT(DPU_WB_UBWC) | \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 4eda2cc847ef..01c65f940f2a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -185,6 +185,7 @@ enum {
>>   * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
>>   *                                  than video timing
>>   * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>> + * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
>>   * @DPU_INTF_MAX
>>   */
>>  enum {
>> @@ -192,6 +193,7 @@ enum {
>>  	DPU_INTF_TE,
>>  	DPU_DATA_HCTL_EN,
>>  	DPU_INTF_STATUS_SUPPORTED,
>> +	DPU_INTF_DATA_COMPRESS,
>>  	DPU_INTF_MAX
>>  };
>>  
>>
>> -- 
>> 2.40.1
>>
