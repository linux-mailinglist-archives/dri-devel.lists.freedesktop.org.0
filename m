Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790076BD576
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172E010ED3D;
	Thu, 16 Mar 2023 16:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E289F10ED47
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:23:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bp27so3064750lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OS51DEs1klGjNu5T9+KrlA76UxbSNf8NkvnUJv/9XXw=;
 b=o7oRGazZTtZGugSZz3MJu/7xMSeHWWaWLUq4lCH8a3LO38B7QxVlgSdPiDo0pvmk6+
 sOlKCS/lsQTDjvQTK6mgiGWNQAg3l/xyEr4GlxE+JU0kn/SyUuM5odMhV5Z8MITB+H8h
 vnVKIXDQa9flDKZ8aaAPOlXmLe9UfsaQrFL8e1lIUwObom505jfEJz98enomNvMZUmlh
 /ZlTW+ZDkc8t+3fcNU++nGxYJT0BVLU0n6ubioxHyXwwuBs8JgiaQvNCi/qsHzZlQLrd
 gAlkVpZ/kKz+inH50rq9r2diuYkQxMlyd5N++cISplSdhUrr3snUaxVuBiR19FV79OC/
 6GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OS51DEs1klGjNu5T9+KrlA76UxbSNf8NkvnUJv/9XXw=;
 b=Bpc828Z1JwmcSiidnATF3qUoIW+mbSPYpg6ZIuhUuJ6xHWdAOdC8i9yHk/KB1RGBAk
 a1UDidn8JZZpUpL6ba7+eKCCxskp43HTWTCBoS/U36X17uc5szUS/KOIOrs8c5B8S8qg
 Jk4dmhameA4aQL3K4penr8hUz2CVM/ZP5Ep8hw6LUO3bsnlC5EVIyv/L2uNKIIOXViE/
 h3k8F4bNuObgdfBeNb4zO5Vfu6vgXga+CD9offwLyumYhHFJPwQXDT3DTSWAon12VaCX
 3tfDQ3rqHDLzP9g4BTku60bfFWsfYlXkvaAU8je4/DdHxLSlm9iml77EwBFQfLkycoLh
 9c7Q==
X-Gm-Message-State: AO0yUKXgiG8NxH2kf85xMYLds8TIp+GReiEFVsaZ6qOmh6XrgHlDY0GA
 leeOzchTurgRFu0ps6GGdOtUSw==
X-Google-Smtp-Source: AK7set93gfp7bBO1dJEQ4/X8dmOfIx/ImeRDqfsGFt/N762d0McCpX1ugrNHQC3Aoa122pVHckdoJg==
X-Received: by 2002:a05:6512:972:b0:4de:3f2e:2a14 with SMTP id
 v18-20020a056512097200b004de3f2e2a14mr2942323lft.19.1678983783110; 
 Thu, 16 Mar 2023 09:23:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d27-20020ac24c9b000000b004e7fa99f2b5sm1281189lfl.186.2023.03.16.09.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 09:23:02 -0700 (PDT)
Message-ID: <04156713-3f8e-c29e-322f-259ae163a93a@linaro.org>
Date: Thu, 16 Mar 2023 18:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Freedreno] [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
 <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
 <f1a6ee82-9502-7ea5-fe48-f296fc7df497@linaro.org>
 <3e114c0f-a042-6801-69bf-67436cb2a448@quicinc.com>
 <113a10b6-6097-c80e-c29c-6f61b2b2896a@linaro.org>
 <c4c0ebf8-275d-500f-4019-e3d7517a884f@quicinc.com>
 <CAA8EJppxX4haZSwdvVbN7bc6kXAyNO1rg6zWZv9wPFdqGrcXuw@mail.gmail.com>
 <c650e746-64c5-ce6b-933d-057349356b78@quicinc.com>
 <58E03B71-20C4-4F81-96C1-6D8CE517F3FB@linaro.org>
 <fd876ad2-3fd0-eaab-3407-dd32d494f662@quicinc.com>
 <a5d1a74f-1b7a-569d-e487-774720dfae22@quicinc.com>
 <CAA8EJpq_mwUt0+1yGYo6hRx8Vz12DumVdpEjJbPk8gGHhGZ2bA@mail.gmail.com>
 <176c6088-4470-5559-e79e-fd5675db0097@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <176c6088-4470-5559-e79e-fd5675db0097@quicinc.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, quic_sbillaka@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, andersson@kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, sean@poorly.run,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/03/2023 18:13, Abhinav Kumar wrote:
> 
> 
> On 3/16/2023 9:03 AM, Dmitry Baryshkov wrote:
>> Hi,
>>
>> [removed previous conversation]
>>
>>>
>>> Hi Dmitry and Abhinav,
>>>
>>> Just wanted to follow up on this thread. I've gone over the MSM-specific
>>> DSC params for DP and DSI and have found a few shared calculations and
>>> variables between both DSI and DP paths:
>>>
>>> - (as mentioned earlier in the thread) almost all the calculations in
>>> dpu_dsc_populate_dsc_config() match dsi_populate_dsc_params() [1]. The
>>> only difference in the math I'm seeing is initial_scale_value.
>>
>> The value in dsi code is valid for initial_offset = 6144. Please use
>> the formula from the standard (= sde_dsc_populate_dsc_config) and add
>> it to drm_dsc_helper.c
>>
>> If I remember correctly the last remaining item in
>> dsi_populate_dsc_params() (except mentioned initial_offset) was
>> line_buf_depth, see [3]. I'm not sure about setting it to bpc+1.
>> According to the standard it should come from a DSC decoder spec,
>> which means it should be set by the DSI panel driver or via
>> drm_dp_dsc_sink_line_buf_depth() in the case of DP output.
>>
>>> - dsc_extra_pclk_cycle_cnt and dce_bytes_per_line, which were introduced
>>> in Kuogee's v1 DSC series [2], are used for DSI, DP, and the DPU timing
>>> engine. dsc_extra_pclk_cycle_cnt is calculated based on pclk_per_line
>>> (which is calculated differently between DP and DSI), but
>>> dce_bytes_per_line is calculated the same way between DP and DSI.
>>>
>>> To avoid having to duplicate math in 2 different places, I think it
>>> would help to have these calculations in some msm_dsc_helper.c file. Any
>>> thoughts on this?
>>
>> dsc_extra_pclk_cycle_cnt and dce_bytes_per_line are used only in DPU
>> code, so they can stay in DPU driver.
>>
> 
> They can stay in the dpu driver is fine but where?
> 
> Like Jessica wrote, this is computed and used in 3 places today :
> 
> 1) DSI video engine computation
> 2) DP controller computation
> 3) timing engine programming

Please excuse me if I'm wrong. I checked both vendor techpack and the 
Kuogee's patches. I see them being used only in the SDE / DPU driver 
code. Could you please point me to the code path that we are discussing?


> So either we have a helper in a common location somewhere so that these 
> 3 modules can call that helper and use it OR each module duplicates the 
> computation code.
> 
> What should be the common location is the discussion here.
> 
> It cannot be dpu_encoder.c as the DSI/DP dont call into the encoder 
> methods.
> 
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/v6.3-rc2/source/drivers/gpu/drm/msm/dsi/dsi_host.c#L1756
>>>
>>> [2] https://patchwork.freedesktop.org/patch/519845/?series=113240&rev=1
>>
>> [3] https://patchwork.freedesktop.org/patch/525441/?series=114472&rev=2
>>
>>
>>

-- 
With best wishes
Dmitry

