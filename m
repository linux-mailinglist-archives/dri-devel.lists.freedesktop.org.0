Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9E764156
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 23:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B531F10E4D4;
	Wed, 26 Jul 2023 21:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26C010E4C1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 21:43:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso419070e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690407801; x=1691012601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZP9CoyVy2pTatmhYQyFqnX1QWLbmjzO1vtHl1NuLxfg=;
 b=QqR1HjDAhYW+38DvQ9VNeOFpIA2AQt3DoXK90ATtLV+bzNoZmoeREsw1NcwgsHgzkv
 1Z8pe6oExwN0OcvkaB2zYDVaGZNgwmsAn2hF/Rh10D58g4ZPWwmxbiRrBG54QgpkU4gu
 bWQ/8VQqG/J2PAMoOW8jE2Ex8nABmBw8x8qLiOzndUvO2JZnK6v824k6MNrtWLZq+H6e
 VNsqBcUkVN5B/APUPDngB9Lw8ophyfJdWcKFE4MZ7l1IBffY2SRAJMTpwZ601+3C1Awe
 2BprRg4yCWpfWDfDJb8uDbPYTKH2IqHqujelkoOx5dLdnFLE7Ll1Q+isMhXJsi17VO5J
 Bvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690407801; x=1691012601;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZP9CoyVy2pTatmhYQyFqnX1QWLbmjzO1vtHl1NuLxfg=;
 b=L8qL5nSaRauwmgGoQWjC+g50rfUyXQMWyU7ddpsn48CIUFdeCTKfEcIVwYZUXadNoG
 ZCtcYoMmVaE+HBguFiKUVXwPgHXRFmCM1Q3eNLDHChhRpmfZpAa9YqRt92Me1vUEPqEv
 3cSdNMzyl0VLCD4rN698MxwZs3H0F1jJT2GjaUaRukHd6Lmvn7Byl2x9RRQTvjgu0hZ3
 sI6hw8JVBRRLTqm2botXB3E8+s97tslMQ7ko7sRDkX0IqHDiv98QNH2i4dduF8st3+9n
 YPlkidqEaZXKQOQpNQmsHtRxigZ+exNrNvtL2htPcFzSORWQJ3XaSfLYXVqCQlAoutrs
 SmWQ==
X-Gm-Message-State: ABy/qLZfhUgo4P6Ft4Q/j4paoAT2iPPwGzu1euWBPQ0xmwsRpAlRkAyB
 32nH4pd2HVd+87XJT5q/jsQVRg==
X-Google-Smtp-Source: APBJJlE5XrrJytmjId1aWJOQRpas2cyE4xBPQmZqdVNE290cCWhJc5WS4MaPIKd8nVmhTIF0hK0AZw==
X-Received: by 2002:ac2:5323:0:b0:4fb:8a92:4fba with SMTP id
 f3-20020ac25323000000b004fb8a924fbamr280735lfh.25.1690407800896; 
 Wed, 26 Jul 2023 14:43:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a056512021a00b004fbae51d1a5sm3465411lfo.295.2023.07.26.14.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 14:43:20 -0700 (PDT)
Message-ID: <f58998c9-82d3-d2fe-6f1c-801e616467be@linaro.org>
Date: Thu, 27 Jul 2023 00:43:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
 <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org>
 <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
 <CAF6AEGt+qnUBAq3CHS4eTO1YQsbLjj3Urtt2LuSwRJ7XpzPBww@mail.gmail.com>
 <CAA8EJppJNrcXp8yswDycqA5HuK6bDCKrAkT4ttkGJvsWqD_YMg@mail.gmail.com>
 <CAF6AEGtLcwKRCMGgLAuABEbSR1CeYKF+D=ffsQLRo-f1BiprbA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGtLcwKRCMGgLAuABEbSR1CeYKF+D=ffsQLRo-f1BiprbA@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 23:11, Rob Clark wrote:
> On Wed, Jul 26, 2023 at 1:00 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Wed, 26 Jul 2023 at 21:28, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Thu, Jul 13, 2023 at 1:26 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On Fri, Jul 07, 2023 at 05:34:04AM +0300, Dmitry Baryshkov wrote:
>>>>>
>>>>> On 07/07/2023 00:10, Rob Clark wrote:
>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>
>>>>>> There are cases where there are differences due to SoC integration.
>>>>>> Such as cache-coherency support, and (in the next patch) e-fuse to
>>>>>> speedbin mappings.
>>>>>
>>>>> I have the feeling that we are trying to circumvent the way DT works. I'd
>>>>> suggest adding explicit SoC-compatible strings to Adreno bindings and then
>>>>> using of_device_id::data and then of_device_get_match_data().
>>>>>
>>>> Just thinking, then how about a unique compatible string which we match
>>>> to identify gpu->info and drop chip-id check completely here?
>>>
>>> Ok, I think we could do this, so something like:
>>>
>>>    compatible = "qcom,sm4350-adreno-619.0", qcom,adreno-619.0", "qcom,adreno"
>>>
>>> ?
>>>
>>> It looks like we don't have gpu dt bits upstream yet for either sm4350
>>> or sm6375, so I suppose we could get away with this change
>>
>> I think we can even skip the 619.0 part in the SoC compat string.
>> So it will be:
>>
>> compatible = "qcom,sm4350-adreno", qcom,adreno-619.0", "qcom,adreno";
>>
>> In future we can drop the chipid part completely and handle that as a
>> part of SoC data:
>>
>> compatible = "qcom,sm4350-adreno", "qcom,adreno";
>>
>> With the driver knowing that sm4350-adreno means ADRENO_ID(6,1,9,0)
>>
> 
> I don't think we can do that, there are cases where the same SoC had
> multiple revisions of adreno.

Is that the case for the production versions of the SoC? In other 
subsystems what we usually do is that we add support only for the latest 
SoC revision (which would probably mean the latest GPU patch revision). 
Previous GPU revisions can be added in the following way (pure example):

qcom,sm4350-adreno -> 6,1,9,1 // assuming v2.0 or v1.1 is the commercial 
sample
qcom,sm4350-v1-adreno -> 6,1,9,0

>  We could possibly do that with future
> things where we can read the chip-id from fw.
> 
> What we _could_ do at the expense of making the compatible parsing a
> tiny bit more complex is something like:
> 
>     compatible = "qcom,sm4350-adreno-619.0", "qcom,adreno"
> 
> BR,
> -R
> 
>>>
>>> BR,
>>> -R
>>>
>>>> -Akhil
>>>>
>>>>>>
>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
>>>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>>>>>>    2 files changed, 31 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>>>> index 3c531da417b9..e62bc895a31f 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>>>> @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] = {
>>>>>>              .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>>>>              .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>>>>>>              .init = a6xx_gpu_init,
>>>>>> +   }, {
>>>>>> +           .machine = "qcom,sm4350",
>>>>>> +           .rev = ADRENO_REV(6, 1, 9, ANY_ID),
>>>>>> +           .revn = 619,
>>>>>> +           .fw = {
>>>>>> +                   [ADRENO_FW_SQE] = "a630_sqe.fw",
>>>>>> +                   [ADRENO_FW_GMU] = "a619_gmu.bin",
>>>>>> +           },
>>>>>> +           .gmem = SZ_512K,
>>>>>> +           .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>>>> +           .init = a6xx_gpu_init,
>>>>>> +           .zapfw = "a615_zap.mdt",
>>>>>> +           .hwcg = a615_hwcg,
>>>>>> +   }, {
>>>>>> +           .machine = "qcom,sm6375",
>>>>>> +           .rev = ADRENO_REV(6, 1, 9, ANY_ID),
>>>>>> +           .revn = 619,
>>>>>> +           .fw = {
>>>>>> +                   [ADRENO_FW_SQE] = "a630_sqe.fw",
>>>>>> +                   [ADRENO_FW_GMU] = "a619_gmu.bin",
>>>>>> +           },
>>>>>> +           .gmem = SZ_512K,
>>>>>> +           .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>>>> +           .init = a6xx_gpu_init,
>>>>>> +           .zapfw = "a615_zap.mdt",
>>>>>> +           .hwcg = a615_hwcg,
>>>>>>      }, {
>>>>>>              .rev = ADRENO_REV(6, 1, 9, ANY_ID),
>>>>>>              .revn = 619,
>>>>>> @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
>>>>>>      /* identify gpu: */
>>>>>>      for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
>>>>>>              const struct adreno_info *info = &gpulist[i];
>>>>>> +           if (info->machine && !of_machine_is_compatible(info->machine))
>>>>>> +                   continue;
>>>>>>              if (adreno_cmp_rev(info->rev, rev))
>>>>>>                      return info;
>>>>>>      }
>>>>>> @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>>>>>>              config.rev.minor, config.rev.patchid);
>>>>>>      priv->is_a2xx = config.rev.core == 2;
>>>>>> +   priv->has_cached_coherent =
>>>>>> +           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
>>>>>>      gpu = info->init(drm);
>>>>>>      if (IS_ERR(gpu)) {
>>>>>> @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>>>>>>      if (ret)
>>>>>>              return ret;
>>>>>> -   priv->has_cached_coherent =
>>>>>> -           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
>>>>>> -           !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
>>>>>> -
>>>>>>      return 0;
>>>>>>    }
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> index e08d41337169..d5335b99c64c 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
>>>>>>    extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>>>>>>    struct adreno_info {
>>>>>> +   const char *machine;
>>>>>>      struct adreno_rev rev;
>>>>>>      uint32_t revn;
>>>>>>      const char *fw[ADRENO_FW_MAX];
>>>>>
>>>>> --
>>>>> With best wishes
>>>>> Dmitry
>>>>>
>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

