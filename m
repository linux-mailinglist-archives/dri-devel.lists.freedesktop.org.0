Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5887B6B7E32
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 17:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5D110E5B9;
	Mon, 13 Mar 2023 16:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8DA10E5B9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 16:54:59 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t11so16568882lfr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 09:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678726498;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=95CYDuHHvTAJVFqvju6CvM9KhyIATAcbysxvdP4sDhM=;
 b=zrQhfO5SosVkJF/yAldKU+fb88H40O/JSOeJ3Lf+u9/QqFBPgXnK7Sei3sz/bx7yG1
 tqpVr7kaHBxXPOugoEZDyb3ET95L7XUH/3yqZZcNj34ixH2gzAs46I1q4aDUoLEaaPL0
 MWLQGm3QlmxqCYH+iwwEPHK0COLgSyDMsBsREIdSG+TJ9reVVegDriQTDpeBhZyQFdFm
 nima6MQeb09T6qv3d+ywA1/YGSHph1je58JE261IpUuz+lZHsIN+z82f+6t2a/NxWJIS
 nEH7KwPswPo1+pQIZqaFIyJeLrDl/2xpA9EB3bEo2EaQYIkzABeyiCiT0XiE6tbva5g3
 lylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726498;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=95CYDuHHvTAJVFqvju6CvM9KhyIATAcbysxvdP4sDhM=;
 b=DwvZd0kAEB15hS6oG2hn6sjRsYHOLaNVpVgv0+Es/9+LNLTagG/94TekHkUCGj9pJp
 6EGL5j7x6tu6KYkdQwfctdSeF6sPRXA6onb7SiTu+7Wzfwo4Q4zDspzXeRCKSaYDjGaP
 81gG+pYSD0cNb9YnGq8kfW1WRV0NHBs2PV5slm2wnLshqROvQHgca251IGCGd8XTvObp
 OkYWd4q0wZmMy4dDV2PocyC58V+WkHQAzwA8xa/BHj1HMCaBy5hKhjYn4XSD7PX/91WY
 JQIxIu16osHxnp52+MjR8gdOyBHP06lrSaHtvnJIB499GwlQD2Qo0T7k28+50RDL2yL4
 txIw==
X-Gm-Message-State: AO0yUKW53uehBnMDwazj4hcqR+QJCPV/HIb4EBgBti4IbhCJNObUFwQQ
 pFFibByRfz5kS5e4vMX5PeAUAQ==
X-Google-Smtp-Source: AK7set8TlLYFmTIqQsaFFyNmY7OCBJjH5uOIca39HAAucj+bcBCxhSYcL5RbfiRlpUG9u+LjMVejaQ==
X-Received: by 2002:ac2:4306:0:b0:4e8:41fc:b37 with SMTP id
 l6-20020ac24306000000b004e841fc0b37mr1536039lfh.10.1678726497648; 
 Mon, 13 Mar 2023 09:54:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 q27-20020ac2529b000000b004da8168eba2sm18917lfm.237.2023.03.13.09.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 09:54:57 -0700 (PDT)
Message-ID: <8e9fc1c0-f74f-ba82-fade-31212637d6bb@linaro.org>
Date: Mon, 13 Mar 2023 17:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Freedreno] [PATCH v3 4/7] drm/msm/a2xx: Implement .gpu_busy
To: Jonathan Marek <jonathan@marek.ca>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
 <20230223-topic-opp-v3-4-5f22163cd1df@linaro.org>
 <2f2467d1-f5f3-86dd-edba-fc26e60d142f@marek.ca>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2f2467d1-f5f3-86dd-edba-fc26e60d142f@marek.ca>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.02.2023 16:04, Jonathan Marek wrote:
> This won't work because a2xx freedreno userspace expects to own all the perfcounters.
> 
> This will break perfcounters for userspace, and when userspace isn't using perfcounters, this won't count correctly because userspace writes 0 to CP_PERFMON_CNTL at the start of every submit.

Rob, would you be willing to take this without the a2xx bits? It
should still be fine, except without devfreq. Not that we had
any significant sort of scaling on a2xx before.

Konrad
> 
> On 2/23/23 5:52 AM, Konrad Dybcio wrote:
>> Implement gpu_busy based on the downstream msm-3.4 code [1]. This
>> allows us to use devfreq on this old old old hardware!
>>
>> [1] https://github.com/LineageOS/android_kernel_sony_apq8064/blob/lineage-16.0/drivers/gpu/msm/adreno_a2xx.c#L1975
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
>> index c67089a7ebc1..104bdf28cdaf 100644
>> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
>> @@ -481,6 +481,31 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>>       return aspace;
>>   }
>>   +/* While the precise size of this field is unknown, it holds at least these three values.. */
>> +static u64 a2xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>> +{
>> +    u64 busy_cycles;
>> +
>> +    /* Freeze the counter */
>> +    gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_FREEZE);
>> +
>> +    busy_cycles = gpu_read64(gpu, REG_A2XX_RBBM_PERFCOUNTER1_LO);
>> +
>> +    /* Reset the counter */
>> +    gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_RESET);
>> +
>> +    /* Re-enable the performance monitors */
>> +    gpu_rmw(gpu, REG_A2XX_RBBM_PM_OVERRIDE2,
>> +        A2XX_RBBM_PM_OVERRIDE2_DEBUG_PERF_SCLK_PM_OVERRIDE,
>> +        A2XX_RBBM_PM_OVERRIDE2_DEBUG_PERF_SCLK_PM_OVERRIDE);
>> +    gpu_write(gpu, REG_A2XX_RBBM_PERFCOUNTER1_SELECT, 1);
>> +    gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_ENABLE);
>> +
>> +    *out_sample_rate = clk_get_rate(gpu->core_clk);
>> +
>> +    return busy_cycles;
>> +}
>> +
>>   static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>   {
>>       ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
>> @@ -502,6 +527,7 @@ static const struct adreno_gpu_funcs funcs = {
>>   #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
>>           .show = adreno_show,
>>   #endif
>> +        .gpu_busy = a2xx_gpu_busy,
>>           .gpu_state_get = a2xx_gpu_state_get,
>>           .gpu_state_put = adreno_gpu_state_put,
>>           .create_address_space = a2xx_create_address_space,
>>
