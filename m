Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B300B73ADA9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 02:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB2610E5C6;
	Fri, 23 Jun 2023 00:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2C310E5C7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 00:15:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso8945366e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 17:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687479314; x=1690071314;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mwHzVLTtnHqsMBGC/FQz0dqtXzYxkIgtPAX7zoSxuL4=;
 b=SoClXjsERx79ZMZPpfyw8UKuqcOCAxhoaAsSuKiUYGsU5CEqD/FsQwAwIeBgqEVWm4
 7yuyvJI7EegWt8ura5VIvwFTucZf1vsNs+ZnJUC+dv4oyMfA3JdH9bPj20gZ0s7jYtXB
 TTsfonEHK8sSKEmrZypHZvVnu9xTKWV7PHEd+wjG/YVoyCdX1qofBCti1dHwiymKAbgC
 X+ARR5ci6HHLktG1jM+f2bGCWo8EvlcQNU4V4H8g0BjCC07+PPInZ5K8TED2tsoNSl5+
 QZImD9QP4JAKa21SfeeKvq1JRENG/JBvsUmyB4X+SXPEgverM25ZlIPtcxSbNdvf090J
 aIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687479314; x=1690071314;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mwHzVLTtnHqsMBGC/FQz0dqtXzYxkIgtPAX7zoSxuL4=;
 b=joZnwqqzo7VPSav2G6NP8KAwtAhWaNo5dN5MSs7u0wnDMseT70XIGEltz0jpE1Xlyr
 z9Ht8cnyXpc/M2/v5+iUhB0L9Q8RhdpV4/P87/D37GaeXDELtJH46bEBYql2qUoq9yXP
 QY2/p48EuJPcyQKSbo/3NcoS+nt/XUWdK2hjcDmh9GSHT3ATBlGd4mvHbdfuwE91h302
 ceSPEfayqD+2ctybJ5cMqet4hHn32XlhR4TxucRjJ7Z+/ehV/jq9kOkd1REoubodcChW
 l+9NSeAeohTMYLNHHpZR3Z95dx1T0NvQJzMBFAOZqc9CtmHU/4dvpPITldxauNYYQs43
 jWCw==
X-Gm-Message-State: AC+VfDwymWHw0h6SUMxabPx97shHqSuUGHEg813Z76OKbmNvr71YVd9J
 dFIiSg9TjU0qWf+uBgJ0Hv+j2Q==
X-Google-Smtp-Source: ACHHUZ4Jrm2gqG4uJaH179xMkyfeTBx4XcT8MrEfOAlu9CWo5wtOhHNGfL7MI1bnecP0/lwiYPT38A==
X-Received: by 2002:a19:6909:0:b0:4f8:7513:8cb0 with SMTP id
 e9-20020a196909000000b004f875138cb0mr7444566lfc.2.1687479313847; 
 Thu, 22 Jun 2023 17:15:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y10-20020ac255aa000000b004f842478f9asm1242246lfg.88.2023.06.22.17.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 17:15:13 -0700 (PDT)
Message-ID: <a87e51e5-416f-307f-fe7c-368a5942e998@linaro.org>
Date: Fri, 23 Jun 2023 03:15:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/6] drm/msm/dpu: Drop unused num argument from relevant
 macros
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-2-3b2cdcc6a576@quicinc.com>
 <0d702a8d-c9fa-1fd4-1c2b-a1a10abca22f@linaro.org>
In-Reply-To: <0d702a8d-c9fa-1fd4-1c2b-a1a10abca22f@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 02:57, Dmitry Baryshkov wrote:
> On 23/06/2023 02:48, Ryan McCann wrote:
>> Drop unused parameter "num" from VIG_SBLK_NOSCALE and DMA sub block
>> macros. Update calls to relevant macros to reflect change.
> 
> This is not relevant for this patchset.

Ok, after reviewing the rest of the patches, I see that it is indeed 
relevant. However could you please follow another path (outlined in the 
review for patch 6).

Note, that for the sake of subblock dumping we can ignore the issue with 
the names completely and drop them in the separate patchset.

> 
> With https://patchwork.freedesktop.org/patch/534745/?series=116851&rev=2 
> in place, VIG_SBLK and VIG_SBLK_ROT should also stop using num. But 
> let's probably take another step forward and drop both arguments and use 
> just a single instance of sblk per platform. I'll send a patch for it.
> 
>>
>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 22 
>> +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 0de507d4d7b7..69200b4cf210 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -288,7 +288,7 @@ static const uint32_t wb2_formats[] = {
>>       .rotation_cfg = rot_cfg, \
>>       }
>> -#define _DMA_SBLK(num, sdma_pri) \
>> +#define _DMA_SBLK(sdma_pri) \
>>       { \
>>       .maxdwnscale = SSPP_UNITY_SCALE, \
>>       .maxupscale = SSPP_UNITY_SCALE, \
>> @@ -323,10 +323,10 @@ static const struct dpu_sspp_sub_blks 
>> sdm845_vig_sblk_2 =
>>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
>>                   _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
>> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = 
>> _DMA_SBLK("8", 1);
>> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = 
>> _DMA_SBLK("9", 2);
>> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = 
>> _DMA_SBLK("10", 3);
>> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = 
>> _DMA_SBLK("11", 4);
>> +static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
>> +static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
>> +static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
>> +static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
>>   #define SSPP_BLK(_name, _id, _base, _len, _features, \
>>           _sblk, _xinid, _type, _clkctrl) \
>> @@ -365,11 +365,11 @@ static const struct dpu_sspp_sub_blks 
>> sm8550_vig_sblk_1 =
>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
>>                   _VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>> -                _VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
>> -static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = 
>> _DMA_SBLK("12", 5);
>> -static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = 
>> _DMA_SBLK("13", 6);
>> +                _VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4);
>> +static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
>> +static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
>> -#define _VIG_SBLK_NOSCALE(num, sdma_pri) \
>> +#define _VIG_SBLK_NOSCALE(sdma_pri) \
>>       { \
>>       .maxdwnscale = SSPP_UNITY_SCALE, \
>>       .maxupscale = SSPP_UNITY_SCALE, \
>> @@ -380,8 +380,8 @@ static const struct dpu_sspp_sub_blks 
>> sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>>       .virt_num_formats = ARRAY_SIZE(plane_formats), \
>>       }
>> -static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = 
>> _VIG_SBLK_NOSCALE("0", 2);
>> -static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = 
>> _DMA_SBLK("8", 1);
>> +static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = 
>> _VIG_SBLK_NOSCALE(2);
>> +static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK(1);
>>   /*************************************************************
>>    * MIXER sub blocks config
>>
> 

-- 
With best wishes
Dmitry

