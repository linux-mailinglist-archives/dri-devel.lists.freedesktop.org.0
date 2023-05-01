Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E666A6F365D
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3020C10E43C;
	Mon,  1 May 2023 18:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF79F10E43D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 18:56:05 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a8a6602171so28250251fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682967363; x=1685559363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zHnHsYqeyjXMXCvsuUTFEMxlXrBzaiqDC0QHxRJwGMA=;
 b=i4jBG1PGxTIiQHLCKi0+xx3ZFX3CegUx/EKeB/IE3HH2t6S9hRmXI2/EiMUTywD7HE
 4FaRfAB2O/vu51Tg44dErZRVn2+sP9iVpyQCf9KS2W50iHlHrOwVL0wv2hq+YaVE4tCA
 3iRjIBW0UGFM2WUjKPE4wyjXN7RPLrI8POjoQfHySEqHTlU9ENx/FTOBFXry/sSXe0Eo
 8Xprf1Bc2k8jwlVPTETN6+FOPs3GDoPnC2ZC25si2+CTwfOkz3LgsibVynlWpDRHD4Nl
 6jHixqS+lM22q/GvSXkN3F54MtzJm0AL+P4hfhzf3t1DtBKs/gUH4TOGdsRDz1V1vD5w
 wolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682967363; x=1685559363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zHnHsYqeyjXMXCvsuUTFEMxlXrBzaiqDC0QHxRJwGMA=;
 b=Q2j4ACE3IreYAWFdr8LphjlJzMmuwZHuxlq2TK10yCknq852jqVUEpuzljP1N7YfUB
 SSdD3cYDWfhuv6z8li0G3blLgzZtl1OZlXpel/Nn9ninDRHQeeeQOz6tc0ylcaj3IORB
 XZOFEJGrZkmBoXLyYQ2kVTMF2ewAnHrvI63z0HNss0MSkimCzlN18yTAfF1Hitobk6GF
 hzFTuEw8gcinyl2a1PIyxtzyBAZRmF0VPJaTV4ijx3zJWEl0HPq8UwXMZGorkiPjoT3W
 3uxd0exviScubguCQZ7B9NsYdQbGSlRzGnudvwVnTa7kamvBpmlMdTj1ZxRd0GtDcuJR
 nyeA==
X-Gm-Message-State: AC+VfDyRXQQleokV054HlnMgKB6G6BH9/MmsgJGzKk8gdq80qiZEtvSb
 NnRHmKX1o1lM/N8ImKqn4lA57Q==
X-Google-Smtp-Source: ACHHUZ5MhdpQdvtRSrP/nh43Rexl7II961KNQVe0RIK0bT30UPeaph1/f1UUUjnVeAI2SrzSYBckMw==
X-Received: by 2002:a2e:8053:0:b0:2a7:6807:2cf8 with SMTP id
 p19-20020a2e8053000000b002a768072cf8mr4068892ljg.35.1682967363427; 
 Mon, 01 May 2023 11:56:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a2e9b11000000b00293d7c95df1sm4768922lji.78.2023.05.01.11.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 11:56:02 -0700 (PDT)
Message-ID: <c2e1a277-4bb7-d437-9748-be6c36e460b4@linaro.org>
Date: Mon, 1 May 2023 21:56:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/msm/dpu: drop unused SSPP sub-block information
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
 <61997e7e-1a4f-8b1d-1a7d-a1ed802ae83d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <61997e7e-1a4f-8b1d-1a7d-a1ed802ae83d@quicinc.com>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/05/2023 21:49, Abhinav Kumar wrote:
> 
> 
> On 4/29/2023 2:25 PM, Dmitry Baryshkov wrote:
>> The driver  doesn't support hsic/memcolor and pcc SSPP subblocks.
>> Drop corresponding definitions.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Changes since v2:
>> - Fixed commit message to remove igc block mention.
>>
>> Changes since v1:
>>   - Rebased on top of 
>> https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
>>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 69d1f1e59db1..b2831b45ac64 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -380,9 +380,6 @@ struct dpu_caps {
>>    * @qseed_ver: qseed version
>>    * @scaler_blk:
>>    * @csc_blk:
>> - * @hsic:
>> - * @memcolor:
>> - * @pcc_blk:
> 
> pcc_blk is still there. So this should be dropped. Once that is fixed,

But the pcc_blk is removed in the next chunk. Please take a glance.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>>    * @format_list: Pointer to list of supported formats
>>    * @num_formats: Number of supported formats
>>    * @virt_format_list: Pointer to list of supported formats for 
>> virtual planes
>> @@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
>>       u32 qseed_ver;
>>       struct dpu_scaler_blk scaler_blk;
>>       struct dpu_pp_blk csc_blk;
>> -    struct dpu_pp_blk hsic_blk;
>> -    struct dpu_pp_blk memcolor_blk;
>> -    struct dpu_pp_blk pcc_blk;
>>       const u32 *format_list;
>>       u32 num_formats;

-- 
With best wishes
Dmitry

