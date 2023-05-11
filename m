Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983CE6FEBC3
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 08:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A99610E5AA;
	Thu, 11 May 2023 06:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D8C89207
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:28:22 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac87e7806aso75593361fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 23:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683786500; x=1686378500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VkKw6ZJBdEv1VTWUTJzAPl6i/3wgR4mhq3aqwGsAmdA=;
 b=K2hymQ87e1u+8I9WMgX/eLRbWKyt+C50E3VVcTu2KszPWB4w/uRXgCNXT7NIy2UC4L
 bhuKTbAKzC/DqCzOlzIYh7uHkku1MTnLPmhZqvDQxu0e9INtPEIXPhE25pgF9wsmwg/d
 8IsSbD0xP5DfjNZzQORKGpbIcUfqK78RX00v+zmslW6wcbVVgBmkRW4RqB9COpmZ0q2u
 gdMEZUPJHZ9Gx3OghSkvMfwZcxUWe7TPRUfNXmcEvXYQP97ueiQeGr8UN8exJhaZw4kn
 voHaDcV2zb/XplucKY6PPhqxPa++LO+hStJrlGQhR5KQ38iocc7IlS9wZ2euM/paqRQE
 6cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683786500; x=1686378500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VkKw6ZJBdEv1VTWUTJzAPl6i/3wgR4mhq3aqwGsAmdA=;
 b=MLMB9hmDHphUW9TfWKxdcT9DXBf/HVWTWoQnujVnfY1PzUqFlMXXqvx+5R8BVNN0t0
 WoGnpQUc35D8TvYji5KvsIXGiXpoNEQAMkZWxh2ZWSij6l8IdLSV19OIje0Tz7vzR6Xr
 YTLIt6GiHfahEGNn4xAHgZimdSfOfEbSiU4uS9ytK2/lRtN7o7AcTSEVRHowipyiQGaU
 X3i7YA9NhyeOtGhIXk6kK+IcCSWISvNMx7u6xrczv2qlmOEXHNDasXUqPEXKF+LVpIcc
 H4siBxJQZL28gml4TvNlEhxCha9totpuJmZX7aZJ34ebZGS1N7Wuvocx9BB16bcJXMPu
 PhYA==
X-Gm-Message-State: AC+VfDxmSolMoRWl1ayB2125DGADvmoqU+TR3Wdxzcp9N1vkUTF6Mgrc
 eqyruVTkjhqbUQQnsxY8WVyYhw==
X-Google-Smtp-Source: ACHHUZ7047nQKa2OkrfRPPMeF3vprp0FemWK+Zik3moRd+4v+8oXqjo/B5MHCt6M39YWpy53E/pb0w==
X-Received: by 2002:a2e:9907:0:b0:2ad:8a4b:6a9e with SMTP id
 v7-20020a2e9907000000b002ad8a4b6a9emr2646101lji.26.1683786500410; 
 Wed, 10 May 2023 23:28:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a2e9199000000b002a8bb52d994sm2274326ljg.25.2023.05.10.23.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 23:28:19 -0700 (PDT)
Message-ID: <8c883eb6-26f7-8f82-04a4-d3a556d90138@linaro.org>
Date: Thu, 11 May 2023 09:28:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
 <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
 <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 00:03, Jessica Zhang wrote:
> 
> 
> On 5/9/2023 11:33 PM, Marijn Suijten wrote:
>> On 2023-05-09 15:06:50, Jessica Zhang wrote:
>>> Introduce MSM-specific DSC helper methods, as some calculations are
>>> common between DP and DSC.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++++
>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 69 
>>> ++++++++++++++++++++++++++++++++++++
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
>>> index 000000000000..29feb3e3b5a4
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>> @@ -0,0 +1,26 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <drm/drm_fixed.h>
>>> +
>>> +#include "msm_dsc_helper.h"
>>> +
>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>>> +{
>>> +    return drm_fixp_from_fraction(dsc->slice_width * 
>>> msm_dsc_get_bpp_int(dsc), 8);
>>
>> How about using dsc->slice_chunk_size?
> 
> Hi Marijn,
> 
> Thanks for pointing this out. However, I would prefer to keep this fixed 
> point version of the slice_chunk_size math as the downstream DP math 
> also uses fixed point [1].

This is pretty weak argument. Especially since this particular piece of 
code does lots of wrong or inefficient things.

> 
> If we are able to confirm that integer math also works for DP, we will 
> make the change to use slice_chunk_size within the DP DSC series.

This is why we usually do not accept API-only series. It is next to 
imposible to judge if the API is good enough without the actual users.

> 
> I also want to note that this math has stayed the same throughout all 7 
> revisions. In the interest of making review more efficient, I think it 
> would be helpful to point out important details like this early on in 
> the process. That way we can address major concerns early on and keep 
> the number of revisions per series low.

This is not always possible. We grasp the details of the patchset as we 
review and dive into the patchset under the review and other close 
enough patches/commits. So it is infrequent but still valid when at some 
point a reviewer (or the author) would come up with the comments 
demanding significant changes to the patch.

> 
> [1] 
> https://github.com/ianmacd/gts6lwifi/blob/master/drivers/gpu/drm/msm/dp/dp_panel.c#L335
> 
>>
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
>>> index 000000000000..38f3651d0b79
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> @@ -0,0 +1,69 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#ifndef MSM_DSC_HELPER_H_
>>> +#define MSM_DSC_HELPER_H_
>>> +
>>> +#include <linux/bug.h>
>>> +#include <linux/math.h>
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
>>
>> For all function docs, don't forget the trailing parenthesis after the
>> function name: msm_dsc_get_bpp_int()
>>
>> https://www.kernel.org/doc/html/next/doc-guide/kernel-doc.html#function-documentation
> 
> Acked.
> 
>>
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * Returns: BPP integer value
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
>>> + * Returns: Integer representing the slice per interface
>>> + */
>>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>>> *dsc, int intf_width)
>>> +{
>>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>>
>> Looks good.
>>
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_line - Calculate bytes per line
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * Returns: Integer value representing pclk per interface
>>> + *
>>> + * Note: This value will then be passed along to DSI and DP for some 
>>> more
>>> + * calculations. This is because DSI and DP divide the pclk_per_intf 
>>> value
>>> + * by different values depending on if widebus is enabled.
>>> + */
>>> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config 
>>> *dsc)
>>> +{
>>> +    return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * 
>>> msm_dsc_get_bpp_int(dsc), 8);
>>
>> dsc->slice_chunk_size * dsc->slice_count?
> 
> Acked.
> 
>>
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice 
>>> for dsc
>>
>> Explain to the reader what a "soft" slice is?
> 
> A soft slice is a slice defined in software as opposed to "hard slices" 
> that are defined by hardware.
> 
> Since the slice-related variables in drm_dsc_config hold information 
> related to soft slices and there is no separate variable for hard 
> slices, I'll change this name to *_get_bytes_per_slice instead.
> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>> - Marijn
>>
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * Returns: s31.32 fixed point value representing bytes per soft slice
>>> + */
>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + * Returns: u32 value representing bytes per interface
>>> + */
>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>> intf_width);
>>> +
>>> +#endif /* MSM_DSC_HELPER_H_ */
>>>
>>> -- 
>>> 2.40.1
>>>

-- 
With best wishes
Dmitry

