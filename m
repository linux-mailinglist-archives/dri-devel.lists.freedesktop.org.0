Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB7E744E1D
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 16:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C8F10E03E;
	Sun,  2 Jul 2023 14:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D195210E03C
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 14:34:44 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso52809231fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 07:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688308480; x=1690900480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sNOyK3uM1VI6m2ZBZf4zg7COB6mHtjci4Ve6p9MOV60=;
 b=g/GsphzvegeJC4AemXYWP9s3yr4w9GkEeRuKCi4vE3l/psaKijNJ0MDScU4xx1saxj
 e4QGMP564C5HAxBmJll0bwNjrdn+dE5+5yIiivejJ0N0N5hf9LeCVkPRkhGHwqmSveLw
 cuR1GQLyqR7HztxiLZ6+j1chHeC+fN0Krzfh/uMDw6+jYr/f5SyNjm8oWEmnRx2PiR9y
 pEv+4FqjktlbThuDzrPljDlNYY4ybiPEjE5rNjfxRpn+qs/2/xTH1lHGc4T4VFotN03C
 iSXI/0mLadWPa8pvRzbeHI9e/Um81Gt66vLQOT8kGscYQ7EjzrB9IzoVdpWK8/vzuy9s
 LP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688308480; x=1690900480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sNOyK3uM1VI6m2ZBZf4zg7COB6mHtjci4Ve6p9MOV60=;
 b=biQ+B1FUDorC3EqFCTf9Q2IhsimLL5wlWtfOQKSHcefo85HzWSRebELTiXp9MfjF8T
 tZW8vddsnt6RP5gO3l7YZHn+kgDXmkgnHe2IB13e3U7M45K3fq9EaXehsmZakutVyh+x
 aFnBbnDOWgnd2gc6Au/rgY22z7OWAAHnlD1g7Fw8OmaLbXNqPpbUSZY63JNZ33uRyqpV
 Fha9zHg/9ntQ7rDha1vA6mOKdOPKqs7tAtZZeOPJNkR9oQ3mdHy5kJpQ0zv2rT8q9tkS
 x+OpqfMVILUrRXrJSQOhcV8BAJwe7thjAd7O7nV9QExffIhhVAXFAUH6o0FcGJkceAM1
 2GQw==
X-Gm-Message-State: ABy/qLZAdIqDHV7F5SmbQ/cuiSE8PPNH6P4ozV2AKncwj0GxV8grDMLF
 TG7mUnTXOIRH4Sz5dyX3LsRCcA==
X-Google-Smtp-Source: APBJJlGCJgtGGjGH6KfxT38DxNOGKhtam0EoBWCqB/nQwtQ5gwJD9P3AfcHcH3Ig9iOIS6UPQTmU6Q==
X-Received: by 2002:a2e:7c0f:0:b0:2b6:d7a0:c27d with SMTP id
 x15-20020a2e7c0f000000b002b6d7a0c27dmr3000281ljc.37.1688308480371; 
 Sun, 02 Jul 2023 07:34:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a2e9417000000b002b6cba03427sm2059267ljh.79.2023.07.02.07.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 07:34:39 -0700 (PDT)
Message-ID: <5e70cb31-61a7-55d7-b3a5-5051e6d338e9@linaro.org>
Date: Sun, 2 Jul 2023 17:34:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/msm/adreno: Assign revn to A635
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
 <CAF6AEGsH0BZd_yyn7UtJ3cLbbw2A5qdg8gQ6SORzQKjsMsnvHA@mail.gmail.com>
 <CAA8EJpripp+Hf=GvCit75naGQqK8owHzPb+VuYHin393HcFPwA@mail.gmail.com>
 <CAF6AEGsdPhWO+hw3FHiqtMfiF34_RtrvvS4apykHNBbtmdj7fQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGsdPhWO+hw3FHiqtMfiF34_RtrvvS4apykHNBbtmdj7fQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2023 17:31, Rob Clark wrote:
> On Sat, Jul 1, 2023 at 5:24 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Sat, 1 Jul 2023 at 18:50, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Fri, Jun 30, 2023 at 4:12 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> Recently, a WARN_ON() was introduced to ensure that revn is filled before
>>>> adreno_is_aXYZ is called. This however doesn't work very well when revn is
>>>> 0 by design (such as for A635). Fill it in as a stopgap solution for
>>>> -fixes.
>>>>
>>>> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>> Changes in v2:
>>>> - add fixes
>>>> - Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-5056e09c08fb@linaro.org
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> index cb94cfd137a8..8ea7eae9fc52 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] = {
>>>>                  .address_space_size = SZ_16G,
>>>>          }, {
>>>>                  .rev = ADRENO_REV(6, 3, 5, ANY_ID),
>>>> +               .revn = 635,
>>>>                  .fw = {
>>>>                          [ADRENO_FW_SQE] = "a660_sqe.fw",
>>>>                          [ADRENO_FW_GMU] = "a660_gmu.bin",
>>>>
>>>
>>> hmm, I realized a problem with this, it would change what
>>> MSM_PARAM_GPU_ID and more importantly MSM_PARAM_CHIP_ID return..  The
>>> former should be "harmless", although it isn't a good idea for uabi
>>> changes to be a side effect of a fix.  The latter is more problematic.
>>
>> I'd say MSM_PARAM_GPU_ID is broken for 635 anyway (won't it return 0
>> in this case)?
>> So the new value should be correct.
> 
> no, it is very much intentional that GPU_ID returns 0 for newer GPUs,
> userspace should be matching on CHIP_ID.  (Also, we should be moving
> away from trying to infer generation/etc from CHIP_ID.. userspace is
> farther ahead of the kernel on this.)

Thanks for the explanation. So in theory we can change this to always 
return 0? Or must we keep it to keep UABI / compatibility?

I'm trying to understand if we can drop revn at all.


> 
>> But more importantly, why are we exporting speedbin in
>> MSM_PARAM_CHIP_ID only if there is no revn? And why are we exporting
>> the speedbin at all as a part of CHIP_ID?
> 
> Basically just being paranoid about not changing uabi.  It probably
> would be ok to export the speedbin for all, but I'd have to double
> check mesa version history.

Thanks!

> 
> BR,
> -R
> 
>>>
>>> I think I'm leaning more towards reverting commit cc943f43ece7
>>> ("drm/msm/adreno: warn if chip revn is verified before being set") for
>>> -fixes.  I'm still thinking about options for a longer term fix.
>>>
>>> BR,
>>> -R
>>>
>>>
>>>> ---
>>>> base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
>>>> change-id: 20230628-topic-a635-1b3c2c987417
>>>>
>>>> Best regards,
>>>> --
>>>> Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

