Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B30731571
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 12:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A05110E4BC;
	Thu, 15 Jun 2023 10:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9EA10E4BC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 10:34:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f655293a38so9888310e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686825249; x=1689417249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G8QVs6IFYYIXBUDr6PLIM4vaEwCL0Jet3wwAQMko+hY=;
 b=TYyKQmV+8Q/wxVs6R4Uml9i+kL0onsHJpSQ0m6cvTbJwiGniH59jYx9ptbp1qn4JTJ
 dLawg1a0MgiGEVc5U/pvgihrz4Ze+rTI0ZlsTa7Mej+zmR77v7uW4E72/Ti47A0W/r9S
 lKzZP6PjJcb5gDqRq0hFSZQ02CkRPOMOkzACI5/YxwoXOoiY3EkjqkFU1MNzkwgCKadN
 gc1UUlvAdKDSD/npgg5kYy6Y2lsmSxgijCaDxu9Q6vbXuB/2JorDHOovJsw3q7uwJd20
 RwgPz6wh+5aW7CU9r6MhABb1/4jZdcPwMUZFnmLESeBBAz2X9xk2Y+CXmldi+T/w0lnS
 GfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686825249; x=1689417249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G8QVs6IFYYIXBUDr6PLIM4vaEwCL0Jet3wwAQMko+hY=;
 b=EiCv+U51MV/qJa6lsYKZNz2oXet1dqT6LS9oIqFMKl37NDJEGTNIL9HYISASlcRY68
 L60lO4KK1yyPc4aDAnTG5rm6BGWYlY/lt4t31lgVm5ryD5MFPW/SXVuInYs/JQxbw3gQ
 IrR1EP8h1USGGLqS4JH7Zr8uBKqiHmum0hvf2T3R12uPIqfbJyc22Vbzj3213wvwXphv
 Wh915HdE7t/DMvEBpKDAbQR3UnzjVNojkfD6pwWhTw+YVRqp+WXRuVcuK9BdgTOBui96
 fg05TxQR/vf2Mpq7codkSQi4m836+BVzRUWIOc0/3lhJ3dK5FD0DOrmReU027axl71Mr
 cw5A==
X-Gm-Message-State: AC+VfDxKeUTqTnCqusiCm7WSdr5ufEwWFrDR4a7sWIrUeI2m5dDT7SgA
 8IOKkXUeXqpaOzWoa0COTBWGNQ==
X-Google-Smtp-Source: ACHHUZ7yhIVM9232hKYltYGexXTGAQbYM4uGSl7gtvYnnnoTX1sxq98NzXEeEFBv5qIChyCAh3VCcQ==
X-Received: by 2002:a19:651a:0:b0:4f7:69a9:b882 with SMTP id
 z26-20020a19651a000000b004f769a9b882mr2538888lfb.3.1686825249292; 
 Thu, 15 Jun 2023 03:34:09 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u26-20020ac243da000000b004f4d5003e8dsm2505864lfl.7.2023.06.15.03.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 03:34:08 -0700 (PDT)
Message-ID: <001d7571-5e9f-4f60-f6d0-35806a3e51c5@linaro.org>
Date: Thu, 15 Jun 2023 12:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 07/18] drm/msm/a6xx: Add a helper for
 software-resetting the GPU
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-7-69c68206609e@linaro.org>
 <jplt5g5xuphbnci73pdtaxd63fguxtgtp4c37kc7ehavzrjbau@kamshezxnvgy>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <jplt5g5xuphbnci73pdtaxd63fguxtgtp4c37kc7ehavzrjbau@kamshezxnvgy>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6.06.2023 19:18, Akhil P Oommen wrote:
> On Mon, May 29, 2023 at 03:52:26PM +0200, Konrad Dybcio wrote:
>>
>> Introduce a6xx_gpu_sw_reset() in preparation for adding GMU wrapper
>> GPUs and reuse it in a6xx_gmu_force_off().
>>
>> This helper, contrary to the original usage in GMU code paths, adds
>> a write memory barrier which together with the necessary delay should
>> ensure that the reset is never deasserted too quickly due to e.g. OoO
>> execution going crazy.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +--
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
>>  3 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index b86be123ecd0..5ba8cba69383 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -899,8 +899,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
>>  	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
>>  
>>  	/* Reset GPU core blocks */
>> -	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
>> -	udelay(100);
>> +	a6xx_gpu_sw_reset(gpu, true);
>>  }
>>  
>>  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index e3ac3f045665..083ccb5bcb4e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1634,6 +1634,17 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
>>  	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
>>  }
>>  
>> +void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
>> +{
>> +	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
>> +	/* Add a barrier to avoid bad surprises */
> Can you please make this comment a bit more clear? Highlight that we
> should ensure the register is posted at hw before polling.
> 
> I think this barrier is required only during assert.
Generally it should not be strictly required at all, but I'm thinking
that it'd be good to keep it in both cases, so that:

if (assert)
	we don't keep writing things to the GPU if it's in reset
else
	we don't start writing things to the GPU becomes it comes
	out of reset

Also, if you squint hard enough at the commit message, you'll notice
I intended for this so only be a wmb, but for some reason generalized
it.. Perhaps that's another thing I should fix!
for v9..

Konrad
> 
> -Akhil.
>> +	mb();
>> +
>> +	/* The reset line needs to be asserted for at least 100 us */
>> +	if (assert)
>> +		udelay(100);
>> +}
>> +
>>  static int a6xx_pm_resume(struct msm_gpu *gpu)
>>  {
>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 9580def06d45..aa70390ee1c6 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -89,5 +89,6 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
>>  int a6xx_gpu_state_put(struct msm_gpu_state *state);
>>  
>>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
>> +void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
>>  
>>  #endif /* __A6XX_GPU_H__ */
>>
>> -- 
>> 2.40.1
>>
