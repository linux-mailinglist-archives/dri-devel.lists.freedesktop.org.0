Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80D6F22E6
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 06:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D4B10E296;
	Sat, 29 Apr 2023 04:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9D010E296
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 04:30:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f199696149so2351845e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 21:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682742655; x=1685334655;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=70CLsPLPGvYuNGCjjpWeKhkV30RvIZvFqib8wvNo8BI=;
 b=S/kK6yVm8up3febiwVIbdTbOHRiu4sICNqG7fPocRLpCbKh7ooJiFrB74BwT2cBaH1
 /IogxMopSr+iRD9yMRLii3vYSJelmEp8PrbgBs4UeBiCcZeZWS11hCD3q5JfVh9Lbfg9
 iVXZ+kq0xbbBc+bMJ/kQSGONAotxpEnxGTxrIWb4J088lvXMXq2Yc9jqa/ko+TBWJof/
 vjOmeN1AYcZ+oQaQoClZ+WCduwzp2Psz3phLIwySlcyC7S3Jbqo8+Mu322GjnjRAAyn1
 bKQyR5v44C4po8rHXc9fNbQPxyJR8/f4xW2fgfXpwVH0BXMoYjOC6O5GWiePJ1a2oAk/
 XUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682742655; x=1685334655;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=70CLsPLPGvYuNGCjjpWeKhkV30RvIZvFqib8wvNo8BI=;
 b=d6M9rtSMqEJFXCpDIG7MA//Q+Vi+8/400ylwk+g1WH9H+5kaZ1gznDnRu8ddFaf3cQ
 lWUWwpgmLl8teVzAMie45r5L60bUbByyhpYkVsUX1REeARJ4PDmiUcU/ASvhggfPGfkw
 +mKkFWZkGUOmLFR2x5IWK3sBQF1qecdJCT26y4hamHe3JreCz2FiB/aNzlDdOub35MFg
 2khIJITP61RJWCQTtid7K0lUItG4slVZmJH9iuXnSyWWEQNwA3AV7LaGwCv8iQoOuC1Y
 azzKPhIF/yKpw4iP4OWczc9XgSpZL+K61VFRPPr1RgTZLpyEB2piBXl5go0qT9Le+zzD
 o1XQ==
X-Gm-Message-State: AC+VfDx/fDH8eTMmM7b2/9VkG0lhq/bIeijgYHN+b7nKn/dM7zJbNDrz
 OVqMxiMOkgYDEanZtco2lbDRXQ==
X-Google-Smtp-Source: ACHHUZ7yGixdJAGrCOCAVMIN2RhZecVVxHWLhGGgOW4BlsMHqcuFh0X45hj11xVYaxopwGAcwZ+BVQ==
X-Received: by 2002:a1c:ed01:0:b0:3ed:2e02:1c02 with SMTP id
 l1-20020a1ced01000000b003ed2e021c02mr5399359wmh.23.1682742654802; 
 Fri, 28 Apr 2023 21:30:54 -0700 (PDT)
Received: from [10.6.30.123] ([212.140.138.202])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003f1978bbcd6sm28540488wmo.3.2023.04.28.21.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 21:30:54 -0700 (PDT)
Message-ID: <5fbf2ba1-f8fd-1373-55f2-4eb3789bc5e7@linaro.org>
Date: Sat, 29 Apr 2023 07:30:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm/dpu: drop unused SSPP sub-block information
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230429024242.2613957-1-dmitry.baryshkov@linaro.org>
 <085c3b3a-1a29-7082-934d-497be5b050fd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <085c3b3a-1a29-7082-934d-497be5b050fd@quicinc.com>
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

On 29/04/2023 07:29, Abhinav Kumar wrote:
> 
> 
> On 4/28/2023 7:42 PM, Dmitry Baryshkov wrote:
>> The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
>> Drop corresponding definitions.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 3e92c2c66716..db6488a6929d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -384,10 +384,6 @@ struct dpu_caps {
>>    * @qseed_ver: qseed version
>>    * @scaler_blk:
>>    * @csc_blk:
>> - * @hsic:
>> - * @memcolor:
>> - * @pcc_blk:
>> - * @igc_blk:
>>    * @format_list: Pointer to list of supported formats
>>    * @num_formats: Number of supported formats
>>    * @virt_format_list: Pointer to list of supported formats for 
>> virtual planes
>> @@ -404,10 +400,6 @@ struct dpu_sspp_sub_blks {
>>       u32 qseed_ver;
>>       struct dpu_scaler_blk scaler_blk;
>>       struct dpu_pp_blk csc_blk;
>> -    struct dpu_pp_blk hsic_blk;
>> -    struct dpu_pp_blk memcolor_blk;
>> -    struct dpu_pp_blk pcc_blk;
>> -    struct dpu_pp_blk igc_blk;
> 
> I have included IGC in this patch 
> https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
> 
> So that one can be dropped from this patch?

It will get dropped while applying because of the conflict.

> 
> Rest is fine.
> 
>>       const u32 *format_list;
>>       u32 num_formats;

-- 
With best wishes
Dmitry

