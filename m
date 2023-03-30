Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B57F6D03FC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4041110E2B1;
	Thu, 30 Mar 2023 11:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FED10E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:52:48 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y15so24147852lfa.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680177166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jtu3FkLFmcLnbaFtYSIDnYVNyyAEmoII/wg78Y34KpI=;
 b=iCCH9qa0oouMDSenbJBAIMGMZf3aCf4i5BFlcuak3Y/khczgnqb2YLYcqXbOScU8C1
 frifsEsBTsV81cNfhc6C/MSx76yARZQoIjWK+vUI7dzGwQCkc0vQ5pTS1Qx0paSNYMuC
 qCjDiHvYT4U/u9bpNIHH9QZFrdMeiy8IpA5xctpq0nAeZHoIERq9/dn00XOpRlKdgThO
 DK1DxyWOjygfpWjXQgU/4OoMl2+N39SKL5f+6CyrRwP5A9ULiGkyaHxvvs9iClkDVNtw
 URRGKDULxWQ/WXjVSMge+56V/0JhiUxyus7PFe+fGQv5qgF2Nd6Pl2J3akvbVtX11EhM
 Vwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680177166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jtu3FkLFmcLnbaFtYSIDnYVNyyAEmoII/wg78Y34KpI=;
 b=kLosTJWNzMvSlxG4TxrSWk+Gqcu32U7QP1KgLxwlmYuHrjihYovLMLDGIlCfVcQgW6
 JjB9TI9NV6BD0VfLBNtio1YX/weRxG9fOsV+dUdt4gEeWAN5cV3fGbCX3D/zoOcOARkd
 IVbMP0RxY5TszUGFkEf+TUKl7vZfyKZkM65vR2XvDBBvPFdDLhsb+/1qYiNKWdYH2Oys
 7vRuTqWQWB75zRKbtH6Kq9pdepgFP097XqY4DfmqdA8Xj0Zf3wmHTiOxxMmUeVTC2oKA
 3Z+FSgbNQIZtpgewu7hmTTnKiJJ3csAo6Vcp/YNeW46eLHm0SJK1w1SYs6GpkMD/p84L
 DMXA==
X-Gm-Message-State: AAQBX9cxuXuZwMvEVrOs6Ax4e4WGfhFgKgFFUZ6kGccRYzohOuoMBEFj
 F/pHmBQxACs9l9JJKTgJz1Fy0w==
X-Google-Smtp-Source: AKy350aGP6kLYjjIqP7EOtDRK9vBYCR08CJ0cEzTg/+9gOtng8/9hR9FlwmT0xL4BgCC47GRw6NdMg==
X-Received: by 2002:ac2:519c:0:b0:4b5:9e70:ca6e with SMTP id
 u28-20020ac2519c000000b004b59e70ca6emr1836184lfi.17.1680177166077; 
 Thu, 30 Mar 2023 04:52:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b28-20020a056512025c00b004cb0dd2367fsm5843292lfo.308.2023.03.30.04.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:52:45 -0700 (PDT)
Message-ID: <09573c91-9cb4-f6eb-aa68-ee89d5ba2aac@linaro.org>
Date: Thu, 30 Mar 2023 14:52:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,24/50] drm/msm/dpu: split QCM2290 catalog entry to the
 separate file
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-25-dmitry.baryshkov@linaro.org>
 <a282b382-2e75-7f13-03ca-6e85169817d2@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a282b382-2e75-7f13-03ca-6e85169817d2@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 14:50, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 116 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 108 +---------------
>>   2 files changed, 117 insertions(+), 107 deletions(-)
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> new file mode 100644
>> index 000000000000..48e7d4c641cd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> @@ -0,0 +1,116 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DPU_6_5_QCM2290_H
>> +#define _DPU_6_5_QCM2290_H
>> +
>> +static const struct dpu_caps qcm2290_dpu_caps = {
>> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>> +	.max_mixer_blendstages = 0x4,
>> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> Rebase

Yes, I will rebase before sending next iteration

> 
>> +	.has_dim_layer = true,
>> +	.has_idle_pc = true,
>> +	.max_linewidth = 2160,
>> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
> 
> [...]
> 
>> +#include "catalog/dpu_6_5_qcm2290.h"
>>   #include "catalog/dpu_6_3_sm6115.h"
> I will not ask you to do redo it now, as it will mess with 50 patches
> (unless you fix that in the following ones that I didn't get to yet),
> but please rename qcm2290 things to sm6115 or whatever the case may be
> so that we can keep the dpu_x_y_abcd sorted.

This is fixed in patch 42. The intention here was only to move date 
without changing it.

> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>>   
>>   #include "catalog/dpu_7_0_sm8350.h"

-- 
With best wishes
Dmitry

