Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF096D03FF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A1910E283;
	Thu, 30 Mar 2023 11:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FE810E2A1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:53:22 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y20so24189464lfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680177200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0VcsUugWXvWORsNkEbnHv9IdzEJ+PY780Uk4W/Srgto=;
 b=iYzzha0Z1dDcA7SWO9r6yHP+VwnwT+k1NK2sEesta17+KIEC2rvDEkLu46wffcyVp8
 93ArtckF9aqN9vrAgKuh+vrjHkrDZMjCjhTTqAoh5Fqz6jRopPtwMznTm+B6OgPe/00/
 blnqsQ5eUTszDEM9896oawkIkCQKzMcgmOwuPfpJVhYCR34HGCoA6LJppKyGg5DLBn6q
 TW0X6cusSq0iiT8peYoCXwHw6xkhpEp/YoX+HvooZXJnRmqd7BPJKpGrzr3KrOec38SV
 4pAfYaigcHklqIpSYO7CF2oCt3O4UohzfCwXu6EWCIP4bRsk2IqUxicozU6+TPJmDXOc
 gzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680177200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0VcsUugWXvWORsNkEbnHv9IdzEJ+PY780Uk4W/Srgto=;
 b=sY1XCH7lIag5vtujOlfgj+u57lQA4vCN4qgzz5l0WWwsD5Bxj3L0o6MNyKwoHKbC7L
 bU9BW+9HUntRy3pxsTaf/dU/ZnjtRJ+dYYCu3ciFAI5AXbXzCo+aVhGkzqFJTakRJ7FT
 h8XvPFHEQ3BMjeNlXVXNp+9GGcHG0Tl1nYFwaPnUeaCDBp20wEF+2pZXPyCx6OhRYk+u
 rb89nZb3FateLUZqasEpk1vx9AHG0IARt7AvAna0DaL++lLHp8f9iLsSC6uRj837pAIx
 ZVUc5yuhav1dTzsMEqwdZY3ybpD071Rls8IFKFyy20OVJCWWw4tw/XOBX176yCVvp2DB
 XlNw==
X-Gm-Message-State: AAQBX9eDpgtbNEspDVJPe1wUG1BqvoSehtF/thNBWhbht37VWEYNJetg
 7NPxNHaYSurgb9yUemP8IZ2FVA==
X-Google-Smtp-Source: AKy350ZYcyfK6TwRw3aRpQFYDKrAblJGNV/rfF03O1bhh3w0IFvVvRHOOzCwRwCfLmaS8Y9kuqRYmw==
X-Received: by 2002:ac2:5192:0:b0:4eb:f6d:653 with SMTP id
 u18-20020ac25192000000b004eb0f6d0653mr4055452lfi.50.1680177200555; 
 Thu, 30 Mar 2023 04:53:20 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac24855000000b004d5a720e689sm5883877lfy.126.2023.03.30.04.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:53:20 -0700 (PDT)
Message-ID: <c4f6975f-3048-5814-9c8f-f3c3ed183ffb@linaro.org>
Date: Thu, 30 Mar 2023 13:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,24/50] drm/msm/dpu: split QCM2290 catalog entry to the
 separate file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-25-dmitry.baryshkov@linaro.org>
 <a282b382-2e75-7f13-03ca-6e85169817d2@linaro.org>
 <09573c91-9cb4-f6eb-aa68-ee89d5ba2aac@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <09573c91-9cb4-f6eb-aa68-ee89d5ba2aac@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.03.2023 13:52, Dmitry Baryshkov wrote:
> On 30/03/2023 14:50, Konrad Dybcio wrote:
>>
>>
>> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 116 ++++++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 108 +---------------
>>>   2 files changed, 117 insertions(+), 107 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> new file mode 100644
>>> index 000000000000..48e7d4c641cd
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> @@ -0,0 +1,116 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
>>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>>> + */
>>> +
>>> +#ifndef _DPU_6_5_QCM2290_H
>>> +#define _DPU_6_5_QCM2290_H
>>> +
>>> +static const struct dpu_caps qcm2290_dpu_caps = {
>>> +    .max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>>> +    .max_mixer_blendstages = 0x4,
>>> +    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
>> Rebase
> 
> Yes, I will rebase before sending next iteration
> 
>>
>>> +    .has_dim_layer = true,
>>> +    .has_idle_pc = true,
>>> +    .max_linewidth = 2160,
>>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>> +};
>>> +
>>
>> [...]
>>
>>> +#include "catalog/dpu_6_5_qcm2290.h"
>>>   #include "catalog/dpu_6_3_sm6115.h"
>> I will not ask you to do redo it now, as it will mess with 50 patches
>> (unless you fix that in the following ones that I didn't get to yet),
>> but please rename qcm2290 things to sm6115 or whatever the case may be
>> so that we can keep the dpu_x_y_abcd sorted.
> 
> This is fixed in patch 42. The intention here was only to move date without changing it.
Great, thanks!

Konrad
> 
>>
>> With that:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Konrad
>>>     #include "catalog/dpu_7_0_sm8350.h"
> 
