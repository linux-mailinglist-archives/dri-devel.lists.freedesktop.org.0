Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2DF6E0131
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811D310E9A5;
	Wed, 12 Apr 2023 21:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A9610E9A5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:50:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id i26so16908701lfc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681336241; x=1683928241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5eOT9e4/C9MFvuVw0SQZQGY7fHUyfQCXLAIJ6rvBi7M=;
 b=zDL49vgl5DP9nszNI6PUZIsUeTh8Da8ZSaKi4A9hjlw4LTs2f/RdpylIifkAZck9Vn
 sgG+Wlfr3Vo4ain32iPawGt2LpjnUhLM3f3jtkAK6RZbl/yy5AoFvKpv6bMRu5VABvXy
 Td5LbVLJOzGZhNpD69G3zFjBrVinc9afPbjHwdhGKPmPFHR7d/3UJeK+al3rRbSrNzHD
 6t+tGsJ8i3fCm9J7CU9YgU440DNyOkOAl4DZXwXZYSXErSwpwZpZ64mNWXIxnskFCPkB
 oWUZ9yl8INhMCQtjqDUdY0QcYV+H713BHyuhsiyuhEYck8Ag+t+OhhhmkTtMl1ib7SNQ
 mzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681336241; x=1683928241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5eOT9e4/C9MFvuVw0SQZQGY7fHUyfQCXLAIJ6rvBi7M=;
 b=Geu0xgyhGUQIHlUqc5EuWOjYDUuKNWgHaj+zigKjS6NDlHPQJs3Gb5QA4dRERG+/QA
 YbGQ+4veLDOnzf+dQInnBvFMef9K2EH2XxsaK9OQRzrKOQ+D1H46SjsYdUnJPHCvMwf5
 Sh0Vm+umiLnqnCsjAi8qSMVP2bZwuxsyP3AqyPgk/fWJo6CvzMXO0OloxBEe82JAnTTq
 dU4VkwK59Y+1NOyAv6inlUbcTO2LYSOVrnx+GHak1zsOi7ouDFGpR1lwpoi5OSt0Z4Iq
 0iSINpVXn3nXJtwD8wOYYnc4JYNKPoN8+FaUbnEIPvoGNB19RFTz0oA4rQ854ypXCEq9
 RpaQ==
X-Gm-Message-State: AAQBX9dCQ2HDYse/QsNf8NjNXo7/tzEopsIBcFHkyB6QtBT7YlrdxPNm
 jjHwWXPRVnbutgjFDHC5fgOV+g==
X-Google-Smtp-Source: AKy350YKu8hcHn2DkrNBUcgb6sbYl1GgvVCX9RFOrPbw7HgZ2BJJZVYaZCkgWL3u0kM/oqEtZpXbUw==
X-Received: by 2002:ac2:4c25:0:b0:4eb:44da:e85d with SMTP id
 u5-20020ac24c25000000b004eb44dae85dmr60103lfq.57.1681336241533; 
 Wed, 12 Apr 2023 14:50:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a19c211000000b004dc721ea6a1sm3149027lfc.273.2023.04.12.14.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 14:50:41 -0700 (PDT)
Message-ID: <ec203372-979e-b5d6-ddfa-1255f2895717@linaro.org>
Date: Thu, 13 Apr 2023 00:50:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-2-0108401d7886@quicinc.com>
 <24f68708-dc1a-59eb-ffdc-288c72b91da6@linaro.org>
 <be12f528-c9e1-311a-2b2e-d7774ff9b266@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <be12f528-c9e1-311a-2b2e-d7774ff9b266@quicinc.com>
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

On 13/04/2023 00:49, Jessica Zhang wrote:
> 
> 
> On 4/12/2023 12:16 PM, Dmitry Baryshkov wrote:
>> On 12/04/2023 22:09, Jessica Zhang wrote:
>>> Introduce MSM-specific DSC helper methods, as some calculations are
>>> common between DP and DSC.
>>>
>>> Changes in v2:
>>> - Moved files up to msm/ directory
>>> - Dropped get_comp_ratio() helper
>>> - Used drm_int2fixp() to convert to integers to fp
>>> - Style changes to improve readability
>>> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
>>> - Changed msm_dsc_get_slice_per_intf() to a static inline method
>>> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>>>    method name accordingly
>>> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
>>> - Fixed some math issues caused by passing in incorrect types to
>>>    drm_fixed methods in get_bytes_per_soft_slice()
>>>
>>> Changes in v3:
>>> - Dropped src_bpp parameter from all methods -- src_bpp can be
>>>    calculated as dsc->bits_per_component * 3
>>> - Dropped intf_width parameter from get_bytes_per_soft_slice()
>>> - Moved dsc->bits_per_component to numerator calculation in
>>>    get_bytes_per_soft_slice()
>>> - Renamed msm_dsc_get_uncompressed_pclk_per_line to
>>>    *_get_uncompressed_pclk_per_intf()
>>> - Removed dsc->slice_width check from
>>>    msm_dsc_get_uncompressed_pclk_per_intf()
>>> - Made get_bytes_per_soft_slice() a public method (this will be called
>>>    later to help calculate DP pclk params)
>>> - Added documentation in comments
>>> - Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num() and
>>>    renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
>>>
>>> Changes in v4:
>>> - Changed msm_dsc_get_uncompressed_pclk_per_intf to
>>>    msm_dsc_get_pclk_per_intf
>>>
>>> Changes in v5:
>>> - Added extra line at end of msm_dsc_helper.h
>>> - Simplified msm_dsc_get_bytes_per_soft_slice() math
>>> - Simplified and inlined msm_dsc_get_pclk_per_intf() math
>>> - Removed unused headers
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 25 ++++++++++++
>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 75 
>>> ++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 101 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index 7274c41228ed..b814fc80e2d5 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -94,6 +94,7 @@ msm-y += \
>>>       msm_atomic_tracepoints.o \
>>>       msm_debugfs.o \
>>>       msm_drv.o \
>>> +    msm_dsc_helper.o \
>>>       msm_fb.o \
>>>       msm_fence.o \
>>>       msm_gem.o \
>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c 
>>> b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>> new file mode 100644
>>> index 000000000000..a34614b8e131
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>> @@ -0,0 +1,25 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#include <drm/drm_fixed.h>
>>> +
>>> +#include "msm_dsc_helper.h"
>>> +
>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>>> +{
>>> +    return drm_fixp_from_fraction(dsc->slice_width * 
>>> msm_dsc_get_bpp_int(dsc), 8);
>>> +}
>>> +
>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>> intf_width)
>>> +{
>>> +    u32 bytes_per_soft_slice;
>>> +    s64 bytes_per_soft_slice_fp;
>>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>>> +
>>> +    bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
>>> +    bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>>> +
>>> +    return bytes_per_soft_slice * slice_per_intf;
>>> +}
>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h 
>>> b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> new file mode 100644
>>> index 000000000000..34238153ffdf
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> @@ -0,0 +1,75 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#ifndef MSM_DSC_HELPER_H_
>>> +#define MSM_DSC_HELPER_H_
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/bug.h>
>>> +#include <drm/display/drm_dsc_helper.h>
>>> +
>>> +/*
>>> + * Helper methods for MSM specific DSC calculations that are common 
>>> between timing engine,
>>> + * DSI, and DP.
>>> + */
>>> +
>>> +/**
>>> + * msm_dsc_get_bpp_int - get bits per pixel integer value
>>> + * @dsc: Pointer to drm dsc config struct
>>> + */
>>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>>> +{
>>> +    WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>>> +    return dsc->bits_per_pixel >> 4;
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_slice_per_intf - get number of slices per interface
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + */
>>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>>> *dsc, int intf_width)
>>> +{
>>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_dce_bytes_per_line - get bytes per line to help 
>>> calculate data width
>>> + *    when configuring the timing engine
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + */
>>> +static inline u32 msm_dsc_get_dce_bytes_per_line(struct 
>>> drm_dsc_config *dsc, int intf_width)
>>> +{
>>> +    return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_pclk_per_intf - Calculate pclk per interface.
>>> + * @dsc: Pointer to drm dsc config struct
>>> + *
>>> + * Note: This value will then be passed along to DSI and DP for some 
>>> more
>>> + * calculations. This is because DSI and DP divide the pclk_per_intf 
>>> value
>>> + * by different values depending on if widebus is enabled.
>>> + */
>>> +static inline int msm_dsc_get_pclk_per_intf(struct drm_dsc_config *dsc)
>>> +{
>>> +    return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * 
>>> msm_dsc_get_bpp_int(dsc), 8);
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice 
>>> for dsc
>>> + * @dsc: Pointer to drm dsc config struct
>>
>> Nit:
>> Returns value in fixed point s31.32 format.
> 
> Hi Dmitry,
> 
> Acked, I'll add docs on the return value for all the helpers.
> 
>>
>> Even better would be to make this an internal-only static function. 
>> When DSI or DP driver requires it, we can make it public again.
> 
> I'd prefer to keep the method public since we're planning to submit DP 
> driver DSC v1.2 patches (after this series has been finalized) that will 
> make use of this method. Keeping this function public would mean that 
> the DP changes won't have to touch the msm_dsc_helper files at all.

Ack (though it is really not the usual way of adding API).

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>> + */
>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + */
>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>> intf_width);
>>> +
>>> +#endif /* MSM_DSC_HELPER_H_ */
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

