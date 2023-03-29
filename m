Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9405D6CF7C1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 01:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA03310EC7C;
	Wed, 29 Mar 2023 23:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C4710EC7C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 23:51:54 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id h25so22343211lfv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680133913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0LKiTCfatgunVbCY7EWbbfW1aBzT4BASgK3wqqdG5gw=;
 b=zq1HXarnX1WAfWcjIJj/xMH2dxgZaXAEq5cuINHDgaW9dwVuYteEqDFwaIp0kCy3dI
 KkrUJ8IMLtI/EQenf9WZlbr3sTefJ5oLh82vln3V6Mqwy/L3Gbp6LPP+PASO1BZsHLY4
 NvnkOnNL5OCWmmhLOKypejobPBmg8Oz8r+lI+OsnJmDQcR7TqJfHam0rcsG7wLR8hoRS
 xoWu4FsccRkOlcOiQlsfurPMz5pmPuJaarnieJPb9oMe7FfPXuASiB4tMUdR5rMei2JA
 ng+8nlJz3NUHjy7+W3p80dx/REJX/wQErT2vzMCDS9rJ6V4OPGYd8J8Yo8m380i6qjjK
 /qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680133913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LKiTCfatgunVbCY7EWbbfW1aBzT4BASgK3wqqdG5gw=;
 b=676Uf6WahnZEU7fBbw7VXw49mnsn/4TA+Tp6+mF4CfT8V+rtMrneF6OKAu9i9Yqo21
 MTSHgIz7Z7+yEL3GrDMUQhnfNPbGIWa3Z59s8G0//z9OYKDEfu9jd3lzT8Mw5jGODgNf
 yrISqOYPvQ9T4RwCm45uwMFUiYLddwx6EBMb0vtUi78SA29WjdwEWSevL0xO18DVjeWI
 KE9US7er/1ZwHIjzWXXuVQlxqgyiMTte4D6l9mbVxXCS7ZgBxafcSQdvuprsge+KCXBx
 iRxQas8NhtzPZw8On0Gdox4s12FyXWzZlqhJWbHx41N2UZ+oNW9cKyD/nWDdjTm+mJvf
 62oA==
X-Gm-Message-State: AAQBX9eMMQC5+bNCKvS6nDN78Hatu8huvGWaADe2MSmqwekH8VU8VRU5
 Mi5H5Nf24fHUo/Qjg2GJw6rqzg==
X-Google-Smtp-Source: AKy350ZJJicQZ0HPbY32XDLcOd4mG+jW4zOrY9d5/HGOO1Dg49vg5uMHEjnFau66a/aIThHm2s1bUA==
X-Received: by 2002:ac2:5a03:0:b0:4e9:d53:a5ef with SMTP id
 q3-20020ac25a03000000b004e90d53a5efmr6180140lfn.1.1680133912855; 
 Wed, 29 Mar 2023 16:51:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f16-20020ac25330000000b004e844eeb555sm5671147lfh.214.2023.03.29.16.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 16:51:52 -0700 (PDT)
Message-ID: <e52a1a47-ce6f-7654-a8fb-428b5a896ad9@linaro.org>
Date: Thu, 30 Mar 2023 02:51:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 3/5] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-3-f3e479f59b6d@quicinc.com>
 <4e12cc50-cd34-e1a1-3a91-0da369b785c1@linaro.org>
 <9ba94f43-845f-886f-a87e-ec46613b74b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9ba94f43-845f-886f-a87e-ec46613b74b6@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 02:45, Jessica Zhang wrote:
> 
> 
> On 3/29/2023 4:31 PM, Dmitry Baryshkov wrote:
>> On 30/03/2023 02:18, Jessica Zhang wrote:
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> index 619926da1441..648c530b5d05 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> @@ -3,6 +3,8 @@
>>>    * Copyright (c) 2020-2022, Linaro Limited
>>>    */
>>> +#include <drm/display/drm_dsc_helper.h>
>>> +
>>>   #include "dpu_kms.h"
>>>   #include "dpu_hw_catalog.h"
>>>   #include "dpu_hwio.h"
>>> @@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc 
>>> *hw_dsc,
>>>       data |= dsc->final_offset;
>>>       DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
>>> -    det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
>>> +    det_thresh_flatness = drm_dsc_calculate_det_thresh_flatness(dsc);
>>
>> But this changes the value! Compare:
>>
>> bpc | old | new
>> 8   | 7   | 2
>> 10  | 11  | 8
>> 12  | 15  | 256
>>
>> If this is intentional, please state so and maybe add a Fixes tag.
> 
> Hi Dmitry,
> 
> Yep this was intentional to match downstream and the spec. Will add a 
> fixes tag for this.

Good! I found corresponding change in msm-4.14, so now I understand why 
previously we had what we had.

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>
>>>       data = det_thresh_flatness << 10;
>>>       data |= dsc->flatness_max_qp << 5;
>>>       data |= dsc->flatness_min_qp;
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

