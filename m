Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F382A6D5591
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C8C10E08E;
	Tue,  4 Apr 2023 00:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEAE10E0E2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 00:33:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bi9so40246970lfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 17:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680568414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cQdINa2c6b4cgwx9wIV+bAKsEBFB3eV4drGNhbSbciE=;
 b=pqylwOZ+zjqFmrzhKur/24LKOTmKskSUp/S1MJ0cbLu1xlJ+L6g1g2OFNGpzmuDI8E
 K/ttVaPO357dXy+MKG1OPurY5MuLXWHUFatl0oyzo2jZxw7ErDGLzG4uq4LjCmRzt3Ix
 s3j2YMm/ZZIkyDx79xD/HmwhIB709R9LiY5TY2jcaanc+UxvNznQ6qQALT4OHjBdmhdv
 3O+rIRN8KZKuJTQFTqMVjriemlnV4fWf3X7n8/NqTjiZBzoT+7/ExRWKW/NBGqbdSOjy
 zTVkPUxntV979KmqA8dfGAL4kCjmhVSFA8rpiRnBTFuU8F79FokKWSFwrglqN8C83kgP
 TzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680568414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cQdINa2c6b4cgwx9wIV+bAKsEBFB3eV4drGNhbSbciE=;
 b=eg7GjVg2CYn6kk4P5sl/LH05WNXNe9RVb+82+cHImhU5WhP0GMEDHRVFgW6heB8Cd8
 B4WL/twPt6eikisnwoVshvDI5qW2ehMB0E2r9cMO1D/UzqT6QDv8wB6KrG44EAhaJoB6
 sobpAdFqPhq6AjFEDtO7crUhvSF1N8mUjSEWnyGV7BdtH/rI9zfVBCnUpCxigFuTuYHx
 cIdKvNnZIPhiJwkMXcAbYq4Eihdkq4dsIb8WcWHi5QfXL6X67TZEK5QTM/jdyOPzP1uj
 W8lzFUeQeyWXQs4e4o+d/B+O8rW8EFPIGExPo/t0suhZ/dAKEVYiqsn/jNpz7hHYaLzh
 XhvA==
X-Gm-Message-State: AAQBX9dRCbBfXNlBFRWutrkByOe+ua95M+tBNDjTbJVCKMAM3BpHAKRs
 sLnoNWE1zEb9yhJ5C3EEa01NxQ==
X-Google-Smtp-Source: AKy350ZJE+SvDuB0jQquKqVa/yajz63oN/jCeMQj7fTO8UvUauIUL0UIyP6CqQ78DKopphI1PerrOw==
X-Received: by 2002:ac2:5613:0:b0:4e8:3dc1:70f4 with SMTP id
 v19-20020ac25613000000b004e83dc170f4mr136318lfd.34.1680568414251; 
 Mon, 03 Apr 2023 17:33:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac244ba000000b004e792045b3dsm2018969lfm.106.2023.04.03.17.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 17:33:33 -0700 (PDT)
Message-ID: <2591482a-a259-5406-83b8-4afeee9e3a43@linaro.org>
Date: Tue, 4 Apr 2023 03:33:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 2/6] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-2-3c13ced536b2@quicinc.com>
 <5b4a3305-1e26-220d-a770-1f6945fbac7a@linaro.org>
 <acdd6ae0-a6e8-3338-5e68-44a93f94de77@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <acdd6ae0-a6e8-3338-5e68-44a93f94de77@quicinc.com>
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

On 04/04/2023 00:38, Jessica Zhang wrote:
> 
> 
> On 4/2/2023 4:21 AM, Dmitry Baryshkov wrote:
>> On 31/03/2023 21:49, Jessica Zhang wrote:
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
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 53 
>>> ++++++++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 42 ++++++++++++++++++++++++++++
>>>   3 files changed, 96 insertions(+)
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
>>> index 000000000000..60b73e17e6eb
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>> @@ -0,0 +1,53 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/errno.h>
>>> +#include <drm/drm_fixed.h>
>>> +
>>> +#include "msm_drv.h"
>>> +#include "msm_dsc_helper.h"
>>> +
>>> +static s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc, int 
>>> intf_width, u32 src_bpp)
>>
>> intf_width is unused
> 
> Hi Dmitry,
> 
> Acked.
> 
>>
>>> +{
>>> +    int bpp = msm_dsc_get_bpp_int(dsc);
>>> +    s64 numerator_fp, denominator_fp;
>>> +    s64 comp_ratio_fp = drm_fixp_from_fraction(src_bpp, bpp);
>>> +
>>> +    numerator_fp = drm_int2fixp(dsc->slice_width * 3);
>>
>> You have lost dsc->bits_per_component here.
> 
> This was moved to the denominator calculation, but I'll move it back to 
> this line to avoid confusion.

Maybe you occasionally mixed bpp and bpc, because there is no 
bits_per_component usage in denominator. Could you please recheck the 
calculations.

> 
>>
>>> +    denominator_fp = drm_fixp_from_fraction(comp_ratio_fp * 8, 
>>> drm_int2fixp(bpp));
>>
>> denominator_fp = drm_fixp_from_fraction(src_bpp * 8, bpp);
> 
> Acked.
> 
>>
>>> +
>>> +    return drm_fixp_div(numerator_fp, denominator_fp);
>>> +}
>>> +
>>> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int 
>>> intf_width, u32 src_bpp)
>>> +{
>>> +    u32 bytes_per_soft_slice, extra_eol_bytes, bytes_per_intf;
>>> +    s64 bytes_per_soft_slice_fp;
>>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>>> +
>>> +    bytes_per_soft_slice_fp = get_bytes_per_soft_slice(dsc, 
>>> intf_width, src_bpp);
>>> +    bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>>> +
>>> +    bytes_per_intf = bytes_per_soft_slice * slice_per_intf;
>>> +    extra_eol_bytes = bytes_per_intf % 3;
>>> +    if (extra_eol_bytes != 0)
>>> +        extra_eol_bytes = 3 - extra_eol_bytes;
>>
>> I become confused here when I checked eol_bytes in the display techpack.
>>
>> I see that for DP the dp_panel_dsc_pclk_param_calc() calculates 
>> dsc->eol_bytes_num in this way, the size to pad dsc_byte_count * 
>> slice_per_intf to 3 bytes.
>>
>> However, for DSI this is a simple as total_bytes_per_intf % 3 , so it 
>> is not a padding, but a length of the last chunk.
>>
>> Could you please clarify? If the techpack code is correct, I'd prefer 
>> if we return last chunk size here and calculate the padding length in 
>> the DP driver.
> 
> I've double checked the calculations between DP and DSI, and I think 
> you're right. Will move the `if (extra_eol_bytes != 0)` block out to DP 
> code.

Ack. Could you please check with HW team that our understanding is correct?

> 
>>
>>> +
>>> +    return extra_eol_bytes;
>>> +}
>>> +
>>> +int msm_dsc_get_uncompressed_pclk_per_line(struct drm_dsc_config 
>>> *dsc, int intf_width, u32 src_bpp)
>>
>> Basing on Abhinav's description ("pclk_per_line can be only per 
>> interface") would it better be named as 
>> msm_dsc_get_uncompressed_pclk_per_intf() ? or 
>> msm_dsc_get_uncompressed_pclk_for_intf() ?
>>
>> BTW: if get_bytes_per_soft_slice() doesn't use intf_width, we can 
>> probably drop it here too.
>>
>>> +{
>>> +    s64 data_width;
>>> +
>>> +    if (!dsc->slice_width || (intf_width < dsc->slice_width))
>>> +        return -EINVAL;
>>
>> Error code is not validated at dsi_timing_setup. I'd suggest moving 
>> error checks there and dropping the error handling here. If 
>> dsc->slice_width is not set, we should stop much earlier than 
>> drm_bridge's pre_enable() callback.
> 
> Acked.
> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>> +
>>> +    data_width = drm_fixp_mul(dsc->slice_count,
>>> +            get_bytes_per_soft_slice(dsc, intf_width, src_bpp));
>>> +
>>> +    return drm_fixp2int_ceil(data_width);
>>> +}
>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h 
>>> b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> new file mode 100644
>>> index 000000000000..743cd324b7d9
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> @@ -0,0 +1,42 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#ifndef MSM_DSC_HELPER_H_
>>> +#define MSM_DSC_HELPER_H_
>>> +
>>> +#include <drm/display/drm_dsc_helper.h>
>>> +#include <drm/drm_modes.h>
>>> +
>>> +/*
>>> + * Helper methods for MSM specific DSC calculations that are common 
>>> between timing engine,
>>> + * DSI, and DP.
>>> + */
>>> +
>>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>>> +{
>>> +    WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>>> +    return dsc->bits_per_pixel >> 4;
>>> +}
>>> +
>>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>>> *dsc, int intf_width)
>>> +{
>>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>>> +}
>>> +
>>> +static inline u32 msm_dsc_get_dce_bytes_per_line(struct 
>>> drm_dsc_config *dsc, int intf_width)
>>> +{
>>> +    return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
>>> +}
>>> +
>>> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int 
>>> intf_width, u32 src_bpp);
>>> +u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int 
>>> intf_width);
>>> +
>>> +/* Calculate uncompressed pclk per line. This value will then be 
>>> passed along to
>>> + * DSI and DP to calculate pclk_per_line. This is because DSI and DP 
>>> divide the
>>> + * uncompressed pclk_per_line by different values depending on if 
>>> widebus is enabled.
>>> + */
>>> +int msm_dsc_get_uncompressed_pclk_per_line(struct drm_dsc_config *dsc,
>>> +        int intf_width, u32 src_bpp);
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

