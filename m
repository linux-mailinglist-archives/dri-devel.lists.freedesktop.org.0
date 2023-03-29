Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405CB6CF11E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FE010EBD5;
	Wed, 29 Mar 2023 17:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9862B10EBC7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:31:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h11so14237003lfu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680111085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zKUp8oQT2937+iLDgPVmHMrXn9AJqcS/Qo7VP4VGSrc=;
 b=N4TvfqSwMCVjbDDxy2dbivFCv1ns9kOMPlc9B5Kmc25WwSGhOCDHi0l9gd4u5UHtNZ
 3FOuQEgFMv1Mi5d75fnCo4VAWlojeZM2kOHCZnunlNdRQ81oxa1c501aYr8JtvPyRpxr
 5Q2sl7FdhTbqEnoza6Fhrm0UgcZAzrEyp1PuwPJruTiTMhCLLL4zUihCmOgX46SQF7JR
 yStG0DDIVsfLX+VjLaDsGScIDjSYqMZzCGteWYlOrgpc6X1BRgbdopXFCbYjF5jwl3N7
 hoDQ1jh4Tl21Bqwb6hNIwyu+GXx1PdxaFXtVLMwYwjYrpAPQJcH4zzdVqJbQbtg1vrBa
 zW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKUp8oQT2937+iLDgPVmHMrXn9AJqcS/Qo7VP4VGSrc=;
 b=Vs9SCebWARFBrbiek0BeHZ27ZDNJaWKYV8M2JtQ4+mT0b3O+IvQKGYerZklSDWf+fx
 3HhfxMt7lkfSnZsp4/q/KkoK77UDT3Fw8Y+hU73EPVdOlJGAxa+MpqyS6TvkUdChYW9X
 Sg+b4NKV79zSQRgXu6PvBS3vGCF0zBLMMR17Xubrghmd15Hdv/tnlfpjPBvOD6wt3zjk
 1J865oVI2jCWephhtqtSX0vc11dtgsa+239i5OFPokvKFz+7WqABxzM5HCy1whPsdkHS
 GBrZcwXXpD5h2MjYWoTbs63JehzNY7FNNVkOeCQrQXimp2yZtH03zoLqnpystrgZ54xV
 lQ4Q==
X-Gm-Message-State: AAQBX9cygvtj7YytfLpgucFGqnXnSFHwPG2hHgZush18QF427fXSz1dW
 Yx9m0KoIcee7AZsR92FPynVFf8RMA3crH8zKB00=
X-Google-Smtp-Source: AKy350aB0j3c+eGT0mY6Ft1GQFoC5DsZuQx4Y3sE2T8yMJTGK8FwE7Y4b3VTXhlfEqTak5pPqZGpgw==
X-Received: by 2002:a05:6512:971:b0:4e9:a75b:cccb with SMTP id
 v17-20020a056512097100b004e9a75bcccbmr5072963lft.28.1680111084835; 
 Wed, 29 Mar 2023 10:31:24 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 m10-20020ac2428a000000b004b6f00832cesm5510541lfh.166.2023.03.29.10.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 10:31:24 -0700 (PDT)
Message-ID: <bc0961f3-5608-eab9-0937-462d498bd6e6@linaro.org>
Date: Wed, 29 Mar 2023 19:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/adreno: adreno_gpu: Use suspend() instead of
 idle() on load error
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
 <ZCRNFitcrAeH27Pn@hovoldconsulting.com>
 <83986fa9-c9eb-ae5a-b239-584092f2cea5@linaro.org>
 <CAF6AEGsYimELcEAs8hdkYqdMzteMwzhPFavvmEUiEFsO01RrrQ@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAF6AEGsYimELcEAs8hdkYqdMzteMwzhPFavvmEUiEFsO01RrrQ@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>, agross@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.03.2023 19:30, Rob Clark wrote:
> On Wed, Mar 29, 2023 at 8:48 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 29.03.2023 16:37, Johan Hovold wrote:
>>> On Wed, Mar 29, 2023 at 04:04:44PM +0200, Konrad Dybcio wrote:
>>>> If we fail to initialize the GPU for whatever reason (say we don't
>>>> embed the GPU firmware files in the initrd), the error path involves
>>>> pm_runtime_put_sync() which then calls idle() instead of suspend().
>>>>
>>>> This is suboptimal, as it means that we're not going through the
>>>> clean shutdown sequence. With at least A619_holi, this makes the GPU
>>>> not wake up until it goes through at least one more start-fail-stop
>>>> cycle. Fix that by using pm_runtime_put_sync_suspend to force a clean
>>>> shutdown.
>>>
>>> This does not sound right. If pm_runtime_put_sync() fails to suspend the
>>> device when the usage count drops to zero, then you have a bug somewhere
>>> else.
>> I was surprised to see that it was not called as well, but I wasn't able
>> to track it down before..
>>
>>>
>>> Also since commit 2c087a336676 ("drm/msm/adreno: Load the firmware
>>> before bringing up the hardware") the firmware is loaded before even
>>> hitting these paths so the above description does not sound right in
>>> that respect either (or is missing some details).
>> ..but I did some more digging and I found that the precise "firmware"
>> that fails is the ZAP blob, which is not checked like SQE in the
>> commit you mentioned!
>>
>> Now I don't think that we can easily check for it as-is since
>> zap_shader_load_mdt() does the entire find-load-authenticate
>> dance which is required with secure assets, but it's obviously
>> possible to rip out the find-load part of that and go on from
>> there.
>>
>> Do you think that would be a better solution?
> 
> Hmm, to hit this it sounds like you'd need all the fw _except_ the zap
> in the initrd?
Correct.

Konrad
> 
> BR,
> -R
> 
>> Konrad
>>
>>>
>>>> Test cases:
>>>> 1. firmware baked into kernel
>>>> 2. error loading fw in initrd -> load from rootfs at DE start
>>>>
>>>> Both succeed on A619_holi (SM6375) and A630 (SDM845).
>>>>
>>>> Fixes: 0d997f95b70f ("drm/msm/adreno: fix runtime PM imbalance at gpu load")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> index f61896629be6..59f3302e8167 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> @@ -477,7 +477,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>>>>      return gpu;
>>>>
>>>>  err_put_rpm:
>>>> -    pm_runtime_put_sync(&pdev->dev);
>>>> +    pm_runtime_put_sync_suspend(&pdev->dev);
>>>>  err_disable_rpm:
>>>>      pm_runtime_disable(&pdev->dev);
>>>
>>> Johan
