Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2B0752B3D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E65310E77F;
	Thu, 13 Jul 2023 19:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6813810E77E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 19:54:15 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6f9edac8dso16939751fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689278053; x=1689882853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T0PYM0UrWih48djb/uyUnMby6/gvfb7iVYx22EYJs4k=;
 b=m+rIfx6P7LvMs6REVDW0Wib+N+7v1FLYFxaUGf0eC5CAQVVGFyGjybas/Uj1HDXu4j
 15DueT0E/ltT41JNlrQz1edX0sipbMLry39wTQixtzGO1ELichHvnkMMqTUWxySKa5oW
 aXKbmtKwAsKywxylA7UrLf4EfdlgFCt11QTuPRfHm2Xd+NWzeffb5eqxEGWPsEXIiV64
 ZzgU1tnKYlsPe93OowPB+UwA1nHDoUONWR5cLISaUgb2enRzB2xWFa8X0Lr/CknXQOjF
 hi3xiV2s+0uPqqSH8XWdXyBbTtQEM6F8FFOwsz3tHEhlzGnuChaDw1aOsEzLfxRznQ3m
 xv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689278053; x=1689882853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T0PYM0UrWih48djb/uyUnMby6/gvfb7iVYx22EYJs4k=;
 b=ANLpsV8yQ46Oa+0UCTw3WuXjqnXQvjOqTy/EcZU1zQGGIp+O8dkzPLl4FEgc6N/exV
 dVObbHF1L3hKNpcUJcGafm/x4KmFqztRgFptzqanPnngd8vRl0IOXf6BKAm4YQyb/qOV
 sV5chhPKPB2aXc9FXlXU1PqJkq4W/K3LfL7wpdC88LVrUjYUSA1Pg1D/rEE/kSIWFk2C
 QZI7aw2SkSnyIAOPhzVRjCsxszpiz96rDwGSVvoFZm6Y4vrCp4oCRRtdQUpeNZnsOE9z
 4DeC3HP8MC9D+WXtm6bLAZxGYHwmoyOBVb//TzpztNqHdgb7tOGXJ3MABIX/bYKxc/bA
 bLwQ==
X-Gm-Message-State: ABy/qLYkzAZEkQQrA0+Az0hkYrHUKCg7ZrzCdX5KOVvKry38T/aDdM4e
 KV9njbgdcASfVsIOuJzdiyDVLQ==
X-Google-Smtp-Source: APBJJlETnvibsCCmERXIHJK73TAkEeVSmNjnAyh0pV4MqOqRRJ6kzrri5+/drueama2aunZKEETH6Q==
X-Received: by 2002:a2e:8ece:0:b0:2b6:9ed5:bf15 with SMTP id
 e14-20020a2e8ece000000b002b69ed5bf15mr2332564ljl.23.1689278053181; 
 Thu, 13 Jul 2023 12:54:13 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a2e95c6000000b002b736576a10sm1096097ljh.137.2023.07.13.12.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 12:54:12 -0700 (PDT)
Message-ID: <8c55ea7b-8ad3-48bc-d1e7-83c7d1a75a2f@linaro.org>
Date: Thu, 13 Jul 2023 22:54:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] drm/msm/adreno: Fix warn splat for devices without
 revn
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230704163640.6162-1-robdclark@gmail.com>
 <CAA8EJpoAZ7z2aURWHs1ouEuTzj2c0O-CypCHmocXO62EpuffsQ@mail.gmail.com>
 <CAF6AEGtUq3Y3YjTt1qazWcP4NcH2q_k4p2pfzEcrJMP34n_L+Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGtUq3Y3YjTt1qazWcP4NcH2q_k4p2pfzEcrJMP34n_L+Q@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2023 17:42, Rob Clark wrote:
> On Tue, Jul 4, 2023 at 10:20 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Tue, 4 Jul 2023 at 19:36, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Recently, a WARN_ON() was introduced to ensure that revn is filled before
>>> adreno_is_aXYZ is called. This however doesn't work very well when revn is
>>> 0 by design (such as for A635).
>>>
>>> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> index 65379e4824d9..ef1bcb6b624e 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> @@ -149,7 +149,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>>>
>>>   static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
>>>   {
>>> -       WARN_ON_ONCE(!gpu->revn);
>>> +       /* revn can be zero, but if not is set at same time as info */
>>> +       WARN_ON_ONCE(!gpu->info);
>>>
>>>          return gpu->revn == revn;
>>>   }
>>> @@ -161,14 +162,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
>>>
>>>   static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>>>   {
>>> -       WARN_ON_ONCE(!gpu->revn);
>>> +       /* revn can be zero, but if not is set at same time as info */
>>> +       WARN_ON_ONCE(!gpu->info);
>>>
>>>          return (gpu->revn < 300);
>>
>> This is then incorrect for a635 / a690 if they have revn at 0.
> 
> Fortunately not any more broken that it has ever been.  But as long as
> sc7280/sc8280 have GPU OPP tables, you'd never hit this.  I'm working
> on a better solution for next merge window.

Sounds fine with me then.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> BR,
> -R
> 
>>>   }
>>>
>>>   static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>>>   {
>>> -       WARN_ON_ONCE(!gpu->revn);
>>> +       /* revn can be zero, but if not is set at same time as info */
>>> +       WARN_ON_ONCE(!gpu->info);
>>>
>>>          return (gpu->revn < 210);
>>
>> And this too.
>>
>>>   }
>>> --
>>> 2.41.0
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

