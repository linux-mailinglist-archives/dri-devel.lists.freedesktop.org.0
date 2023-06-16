Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1EB732C69
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 11:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112BA10E59A;
	Fri, 16 Jun 2023 09:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E4510E58E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 09:45:59 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f6370ddd27so609129e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686908757; x=1689500757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXLM4NFaLwOKoRpyf+vOO8vBgPE/jR4bTbtGmnUq/5c=;
 b=En91242UsGlQP0bme45MubDUSzku9MUCw40vuwNsik+T6e79QMxSkB4l/nwuWmm1RV
 aI227qqMhYRWKdMi6fUnUYody8QKUo6jTuFWBTW6SAPhfB6t5VsB1S5TdyTgYD5YSu0m
 vz7TzvK4WPmZw3i+1KlUq0iLQ7ejidVKTrQvfoQ9ymbRIYCiAOGze4zxqONJc4Ycvjb1
 l99AxYqJucrK2NEbU+0pkWAB6tmdHXGXbvf2D4kuDib9SKwSHbHXfykxyC+4Si7Gqs1r
 8dtilI1mWouWnofeCLNk9GrDHuNmkfNpwBaiHbERo0uCExmtsW3WBXx16JGTv91v6ZH5
 +EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686908757; x=1689500757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXLM4NFaLwOKoRpyf+vOO8vBgPE/jR4bTbtGmnUq/5c=;
 b=MEK+Jn8VORIA1celtMY50fE+2FVqsJSECQk48vcTWAYpDr8Rl92y/rGnl6ejX7dZn5
 gWr4c0s9j8z+yVoy1IeeDz6cLTdq5TvLyOhbHx4zUxe9ZTzWQIzhTcXRtqlAhnDJQACw
 nRLQK5zxjPX1I0ZlFJ/lLvg0nvee6WdsTRX5YVbatGjRSlSqVHRzBixELvW8nE1EIU2i
 eWUAXH0WguenPnhg+Ub4Q2hwfxAfO4Wj6JmCEw15p/S7HsaKriMiKteNxHKHa/il1cCa
 AnpvAvcy57bwKM1sh8tuD5op9zKWzQFZz7YUao7XbPjTPsJsHqPquFT3x3h32sF5tcXq
 G3Bg==
X-Gm-Message-State: AC+VfDxtV1GwAaF12Buhlyg9Dm15dQzygIy0g9xHlbWwBVrdCQjFJR/r
 cZ52Q6bkx8HWDRAz+UVARCRedg==
X-Google-Smtp-Source: ACHHUZ6AJTxuGkVYzvPH0ELAab9b7fXx+ccjFNbrYYWva7GJsrsI7CMAvuq1Y7mmMyl2AgDfFEHfgg==
X-Received: by 2002:a2e:95c2:0:b0:2ae:db65:2d01 with SMTP id
 y2-20020a2e95c2000000b002aedb652d01mr1371945ljh.23.1686908757350; 
 Fri, 16 Jun 2023 02:45:57 -0700 (PDT)
Received: from [192.168.1.151] (85-76-68-127-nat.elisa-mobile.fi.
 [85.76.68.127]) by smtp.gmail.com with ESMTPSA id
 l5-20020a2ea305000000b002b1a7823548sm3562992lje.98.2023.06.16.02.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 02:45:56 -0700 (PDT)
Message-ID: <dcd7e7bf-ce9f-2862-c246-32b57f53afff@linaro.org>
Date: Fri, 16 Jun 2023 12:45:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 02/22] drm/msm/dpu: correct MERGE_3D length
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-3-dmitry.baryshkov@linaro.org>
 <qjaeua65pboforhlqusbmiwgvhm5j5c7quijjm2n55ivki5wjv@cgip4znnt2sl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <qjaeua65pboforhlqusbmiwgvhm5j5c7quijjm2n55ivki5wjv@cgip4znnt2sl>
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

On 16/06/2023 01:22, Marijn Suijten wrote:
> On 2023-06-13 03:09:41, Dmitry Baryshkov wrote:
>> Each MERGE_3D block has just two registers. Correct the block length
>> accordingly.
>>
>> Fixes: 4369c93cf36b ("drm/msm/dpu: initial support for merge3D hardware block")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Indeed, and that patch wasn't even introducing the register writes -
> this only happened in commit 9ffd0e8569937 ("drm/msm/dpu: setup merge
> modes in merge_3d block").

Yep. Vendor dts declares merge 3d block length to be 0x100, which I 
blindly copied.

> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 36ba3f58dcdf..0de507d4d7b7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -508,7 +508,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>   #define MERGE_3D_BLK(_name, _id, _base) \
>>   	{\
>>   	.name = _name, .id = _id, \
>> -	.base = _base, .len = 0x100, \
>> +	.base = _base, .len = 0x8, \
>>   	.features = MERGE_3D_SM8150_MASK, \
>>   	.sblk = NULL \
>>   	}
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

