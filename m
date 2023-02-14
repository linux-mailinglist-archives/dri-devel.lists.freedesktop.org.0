Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89769696262
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4F010E8A2;
	Tue, 14 Feb 2023 11:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7E410E88F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 11:25:05 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id lf10so7364124ejc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 03:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5TGkTb84xWLMG/13fJRvA7TRiYPYi0w1Swy3fYZHFmQ=;
 b=qrsYnscwV52Y0VUk71OYY1ldy21oHOaKQ5RlMrj9BazqS2SQShekW4a4HfU+4rB3VN
 eKjZz4661I5EKvhJhXeNNHvUBorw47RrH6T2cX+AhC/+FsxwmccjjJo1nTlPZljHzuQl
 vJWw7CxaSf7GPUq0t1yy1Ypq8LBirVW77n1O3KsIBugDnWfQGKA889w4mpV+EHm81dTV
 K+2ID04MgeDLrZV4vl0evUgnGrGYqsZS7i0kKLBj05BL2e7f6GUg43RFYXoxfkLhV83Q
 YWiQ8yJJQZd5mTEiYl4eFprQhgxIRGOKPlE/yDnX7YTvryxn+SBRGFd1s7/xvZP+P5yo
 Zxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5TGkTb84xWLMG/13fJRvA7TRiYPYi0w1Swy3fYZHFmQ=;
 b=I/oC+kUescJmr32Niq58JewYhfCXt/jPkJgXVrvPokm0pdO9YcYRnoxIuVCA8iXb52
 23OjXJ1v4EeKdYGK45xJpKCKy7BBSFctV3NJ42w09OCp19XEJaRmjsF+Ci6no76tqAgW
 UWHqkDZ7v4QH7+fb9gXkyUlaa0kzw5dyXWo2FUIcm1940oRwqDNd3a63EPPnH0X/Jg2e
 IWeiv8q8iem57T9v9bjehsOlMJaVjWUuTuMuiXP0yNT8h0FVHu3OCes+Puy9FPeDdF6k
 +bNckH/sQVFROpv6T9msshiud0X5JiK3Y0M9rkrDDCNCdful8zZcn4B6tq1ljmEsWGqT
 RGig==
X-Gm-Message-State: AO0yUKVwST7ayq2nXduTLSpYJWjMjqe8assgz1cOx1vCES2TjOnIeGFE
 2s8lPJ9oTC6XCpG1xx3OrH8loA==
X-Google-Smtp-Source: AK7set8d4qwwJ3IKiKndtYvjo+bLtM6RA5dfulIstN4IPGmyQeW5ECkuHkFFF5kRAariNWsOgwnDYg==
X-Received: by 2002:a17:907:2087:b0:8ae:e876:ea68 with SMTP id
 pv7-20020a170907208700b008aee876ea68mr2544984ejb.74.1676373903653; 
 Tue, 14 Feb 2023 03:25:03 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00888f92f0708sm8229934ejt.15.2023.02.14.03.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 03:25:03 -0800 (PST)
Message-ID: <48364c3f-699d-ce14-37c4-53bf4a90bc23@linaro.org>
Date: Tue, 14 Feb 2023 12:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Freedreno] [PATCH 09/14] drm/msm/a6xx: Fix some A619 tunables
Content-Language: en-US
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
 <20230126151618.225127-10-konrad.dybcio@linaro.org>
 <20230208182101.53ykatzah6zvpy76@amazon.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230208182101.53ykatzah6zvpy76@amazon.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8.02.2023 19:21, Jordan Crouse wrote:
> On Thu, Jan 26, 2023 at 04:16:13PM +0100, Konrad Dybcio wrote:
>> Adreno 619 expects some tunables to be set differently. Make up for it.
>>
>> Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 7a480705f407..f34ab3f39f09 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1171,6 +1171,8 @@ static int hw_init(struct msm_gpu *gpu)
>>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
>>         else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>> +       else if (adreno_is_a619(adreno_gpu))
>> +               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
>>         else if (adreno_is_a610(adreno_gpu))
>>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
>>         else
>> @@ -1188,7 +1190,9 @@ static int hw_init(struct msm_gpu *gpu)
>>         a6xx_set_ubwc_config(gpu);
>>
>>         /* Enable fault detection */
>> -       if (adreno_is_a610(adreno_gpu))
>> +       if (adreno_is_a619(adreno_gpu))
>> +               gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
>> +       else if (adreno_is_a610(adreno_gpu))
>>                 gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
>>         else
>>                 gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
> 
> The number appended to the register is the number of clock ticks to wait
> before declaring a hang. 0x3fffff happens to be the largest value that
> can be set for the a6xx family (excepting the 610 which, IIRC, used older
> hardware that had a smaller field for the counter).
Makes sense!

Downstream the
> number would creep up over time as unexplained hangs were discovered and
> diagnosed or covered up as "just wait longer".
lol..

> 
> So in theory you could leave this with the "default value" or even bump
> up the default value to 0x3fffff for all targets if you wanted to. An
> alternate solution (that downstream does) is to put this as a
> pre-defined configuration in gpulist[].
I'm not sure it's a good idea to let things loose, as that may let some
bugs slip through.. Perhaps let's leave that as-is until we have a seriously
otherwise-unresolvable situation..

Konrad
> 
> Jordan
