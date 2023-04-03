Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E626D549F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 00:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD48C10E5B6;
	Mon,  3 Apr 2023 22:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B4A10E5A3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 22:16:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g19so26835820lfr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 15:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680560183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5bxA4Gss3+RptUe9l82LyArjhA/BEimzCrq88tRrjxk=;
 b=ThsidMxEnDpVEQwTPwwaLS+vc0EYzoqJy1xKlf/taZhAz87kNLQPLokCDj2uVY6XqQ
 EjSK85lZE7YDLYHZk0zojbWjIUh5D0DiGt2v431dXGAzqcfV1YEb9VRgds5/4moFjBhU
 YLTFFyw2CT1if24t/dUG5D5a4VnhWumy5UrMpqWyi1SmjYSd1Q4crAkJfX1hWiibGUSU
 sT1KsbQrO2KEqXafy96uRqMZltE43g+ukjtbp27e3jihUzHW9VWXvaEGo43W2clKZuIw
 8klhGTcE0uwxKMIhTvoeBLWZLSwVHobPA7R6wvUoHKLTJnI6njsho1vWXUdqp2XDq3XU
 ttyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680560183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5bxA4Gss3+RptUe9l82LyArjhA/BEimzCrq88tRrjxk=;
 b=tkDJMd82or/y2ID9Bvpapyztv6FMm6NtuB8lwoydf3LZBKhbgrbbenrEIvBWds7+Gc
 RWRXD1zeL1Yoc2YpDVByjyvlBpW4AVSy8+S0LjmvhBwMpLiRlxxwZ+vCSVpvZeHSscSc
 9t86E8i3uGTNdvtiocs5xGmecybI+/x8G5u4wA/dW16zo1qW0EFZ3ViHWJbTKIBekEkK
 6ALelgW8pBWtASvPdPYSEGjaxTPyhHYdJe/R13OZjTg12gm0LYKIIlokynP20c9C9fIz
 WdBdC7cPsLaGxY9KKgE+jQgE5NOjmZ0eSrpr6qFNO9pWBSZFD5691wrQmEykOrcOymcs
 Vp1A==
X-Gm-Message-State: AAQBX9cT/tZC8qB7ulMh/eZx7kroUJxhfA/EZ4N3YamjtReZv+g8eo1i
 FHoPwu9rrUp1nGRK4rpZOsdN9A==
X-Google-Smtp-Source: AKy350Y/IBSgH+tFeEA1GQREyA7F8/5hOuGrOnkaZm9d7ktpMtv2+gTKYXFMNw1z7lcQQSVjJ2FBUg==
X-Received: by 2002:a19:ad04:0:b0:4cb:4362:381d with SMTP id
 t4-20020a19ad04000000b004cb4362381dmr40604lfc.62.1680560182861; 
 Mon, 03 Apr 2023 15:16:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a24-20020ac25218000000b004db00b4c671sm1956313lfl.7.2023.04.03.15.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 15:16:22 -0700 (PDT)
Message-ID: <29f0f5e6-bad2-6371-6afd-12eefcba9919@linaro.org>
Date: Tue, 4 Apr 2023 01:16:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 00/38] drm/msm/dpu: rework HW catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
 <b4972790-d990-063a-7ef4-2f05407357e8@quicinc.com>
 <f198ac6a-df12-9c08-55e8-f677acea8e2c@linaro.org>
 <9d1529c0-779c-7f1f-6e6e-1972bb0d39f4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9d1529c0-779c-7f1f-6e6e-1972bb0d39f4@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2023 22:07, Abhinav Kumar wrote:
> 
> 
> On 4/3/2023 11:48 AM, Dmitry Baryshkov wrote:
>> On 03/04/2023 21:06, Abhinav Kumar wrote:
>>>
>>>
>>> On 3/30/2023 2:52 PM, Dmitry Baryshkov wrote:
>>>> This huge series attempts to restructure the DPU HW catalog into a
>>>> manageable and reviewable data set. In order to ease review and testing
>>>> I merged all the necessary fixes into this series. Also I cherry-picked
>>>> & slightly fixed Konrad's patch adding size to the SSPP and INTF 
>>>> macros.
>>>>
>>>
>>> I had to first dig up some history about why dpu catalog grew so much 
>>> in the first place before starting this review. When the DPU driver 
>>> first landed (which pre-dates my work in upstream), it looks like it 
>>> followed mdp5 model from mdp5_cfg.c. But looks like as the number of 
>>> chipsets which use DPU kept growing, this is becoming a burden.
>>>
>>> As everyone knows, downstream follows a devicetree model for the dpu 
>>> hardware and that should have always been the case. Perhaps in the 
>>> last 2-3 years more time could have been spent on standardizing the 
>>> bindings used for hw blocks in order to maintain a less hard-coded 
>>> catalog file and more in the device tree.
>>
>> Unfortunately, this is not how the upstream DT works. If something is 
>> a constant hardware property, it should not go into the DT. So pushing 
>> catalog to dt would have been immediately frowned upon by Rob Herring 
>> or Krzysztof.
>>
> 
> Yes certainly we cannot put hardware specific properties. But in 
> general, modelling the hardware like the number of sspps, number of 
> interfaces and number of dspps etc can be a bit abstracted? like 
> blk-type and blk-offset? blk-type can be a custom string because each 
> block is named differently for different vendors?

No.

> 
> The number of blk_offsets decides number of blocks. Its not constant 
> right. We are seeing it varying with chipsets.
> 
>>> Then the catalog would have just been a place to parse the device 
>>> tree, set the feature capability based on chipset (refer 
>>> _sde_hardware_pre_caps). That way offsets , number of blocks and the 
>>> blocks themselves still come from the device tree but perhaps some 
>>> specific features are at SOC level for which the catalog still stays.
>>>
>>> That being said, I thought of different strategies even before the 
>>> review but two issues prevented me from suggesting those ideas (one 
>>> of which I am seeing even here , which I am going to suggest below 
>>> and also suggest why it wont work).
>>>
>>> 1) For the same DPU major/minor version, some features might get 
>>> dropped or even get added with different SOCs as overall the system 
>>> capabilities might differ like number of SSPPs or memory footprint of 
>>> the SOC etc.
>>>
>>> So there is no good way right now to generalize any dpu catalog or to 
>>> tie it with a DPU major/minor version. We will have to stick with a 
>>> per-SOC model.
>>
>> Up to now, the SoC was equal to major+minor. Could you please be more 
>> specific here, if there are any actual differences within major+minor 
>> families?
>>
> 
> So lets say, the same DPU major/minor version is used but we have only 
> one DSI on one chipset Vs two DSIs on the other, some of the features 
> which come into play only for dual DSI cannot be used. Like broadcasting 
> a DCS command across two DSIs etc. This is a very basic example, but 
> there are many examples.

I'm asking for the exact details, because up to now the driver was using 
major:minor to find the catalog entry. It was modelled this way in 
sdm845/sc7180, then it was natural for us to continue down this path.

I will put reworking catalog to be bound to the binding data

> 
>>>
>>> This is what led me to not pursue that route.
>>>
>>> 2) For the same DPU major/minor version, even if core-DPU is same (in 
>>> terms of SSPP, DSPP etc), the number of interfaces can change. So 
>>> again no room to generalize same DPU hw version.
>>
>> Again, I might be just scratching the surface, but I have not observed 
>> this.
>>
> 
> This typically happens based on what products that chipset is catered 
> towards. Thats pretty much what I can share. But more number of 
> interfaces for more number of displays / use-cases.

Ack, I will not that we should be more careful about this items.

> 
>>>
>>> 3) For the same reason as (1) and (2), I think the de-duplication 
>>> strategy used in this series is not correct. The idea of 
>>> dpu_hw_version_num_layer_mixer is just not scalable as I dont know 
>>> how many variants that will lead to. So it seems like just an attempt 
>>> to de-duplicate which perhaps works today for existing dpu chipsets 
>>> in upstream but by no means scalable. Lets go ahead with per-SOC 
>>> catalog file but lets live with some amount of duplication between 
>>> them if we really have to split it across header files.
>>
>> Indeed, this leads to minor differences on top of major+lm. However, I 
>> think, the overall complexity is lowered.
>>
>> Nevertheless, let's land the major set of patches and leave 
>> generalization for the later time. I think, with the addition of the 
>> next several platforms we will see the drill.
>>
> 
> Yes, I would say lets handle generalization/de-duplication later when we 
> see more patterns.
> 
> Lets land the main pieces first.
> 
> Going with dpu version and number of lms is not the way to generalize it 
> from what we think.
> 
>>> I also thought of similar strategies to generalize like based on 
>>> sub-blocks similar to what you have done but all of these were NAKed 
>>> internally by folks who work on more chipsets / have more visibility 
>>> into the spread of features across chipsets.
>>>
>>>> First 4 patches clean up the catalog a bit in order to make it more
>>>> suitable for refactoring.
>>>>
>>>
>>> These are okay. I will address your follow-up questions about patch 
>>> (1) and lets land these.
>>>
>>>> Then the next batch of 13 + 5 patches split the hw catalog entries into
>>>> per-SoC files.
>>>>
>>>
>>> This part is also fine. But perhaps dont have dpu hw version in the 
>>> file. So just dpu_hw_sm8250.h or dpu_hw_sm8350.h etc.
>>
>> Having a version makes it easier to compare chipsets (and also to 
>> verify that feature masks are correct), so I'd like to retain it.
>>
> 
> This is again trying to generalize it. So for example, yes perhaps today 
> the chipsets we have belong to a particular DPU major/minor version and 
> it might look like because they are in the same family things look 
> similar but that can also go against this. If we find some differences 
> among them, then some upstream developers might think "Oh, these belong 
> to the same family, but how come it doesnt have the same features?". 
> Thats why I am hesitant to go with DPU major/minor version in the name.

We have both major/minor and SoC name, so we will not mix them. However, 
yes, if I were to see two SoCs having the same major/minor, it would be 
natural for me to compare them. Ask/check if I got it correct that the 
details are not the same. Curse and add a separate catalog entry.

Please note, that if we remove the major/minor from the file name, the 
entry becomes completely deteached from hw version. The only connection 
will be the cfg_handler table. And moving the SoC <-> catalog binding to 
the match data (as there can be different chipsets with the same hw rev) 
will remove this binding completely.

Thus, I think I am going to keep it in the file name at least. The note 
that major/minor doesn't guarantee the same set of features is noted.

> 
>>>
>>>> Next 9 patches rework catalog entries, mostly targeting 
>>>> deduplication of
>>>> data used by several platforms. At this moment only three pairs (out of
>>>> 13 devices supported by DPU) are merged. However this part lays out the
>>>> ground to ease adding support for new platforms, some of which use the
>>>> same configuration as the existing platforms
>>>>
>>>
>>> This is the part I suggest we drop.
>>>
>>>> Last batch of 7 patches renames existing macros to ease using them 
>>>> while
>>>> adding support for new devices.
>>>>
>>>
>>> I have to check this part but perhaps after re-basing based on my 
>>> earlier comment.
>>
>> Ack, I'll see what I can drop and what is going to be there.
>>
>> Up to now there were some natural shares, like sm8150 vs sc8180x and 
>> qcm2290 vs sm6115. Do you think we should populate the missing parts 
>> by duplicate the data?
>>
> 
> Yes, lets go ahead with the duplicate data for now. Once a more 
> reasonable strategy evolves for generalizing it, we can update it.

Ack, will provide corresponding patches.

> 
>>>
>>>> This pile of patches is submitted in a single batch to allow one to
>>>> observe the final goal of the cleanup which otherwise might be hard to
>>>> assess.
>>>>
>>>>
>>>> Changes since v2:
>>>> - Fixed sc8280xp SSPP size to 0x2ac
>>>> - Rebased on top of msm-next-lumag, dropped merged patches
>>>>
>>>> Changes since v1:
>>>> - Picked up Konrad's patch
>>>> - Picked up dependencies into the main series
>>>> - Moved qseed3lite vs qseed4 patches into the fixes part
>>>> - Fixed sm6115 in a similar manner.
>>>>
>>>> Dmitry Baryshkov (37):
>>>>    drm/msm/dpu: constify DSC data structures
>>>>    drm/msm/dpu: mark remaining pp data as const
>>>>    drm/msm/dpu: move UBWC/memory configuration to separate struct
>>>>    drm/msm/dpu: split SM8550 catalog entry to the separate file
>>>>    drm/msm/dpu: split SM8450 catalog entry to the separate file
>>>>    drm/msm/dpu: split SC8280XP catalog entry to the separate file
>>>>    drm/msm/dpu: split SC7280 catalog entry to the separate file
>>>>    drm/msm/dpu: split SM8350 catalog entry to the separate file
>>>>    drm/msm/dpu: split SM6115 catalog entry to the separate file
>>>>    drm/msm/dpu: split QCM2290 catalog entry to the separate file
>>>>    drm/msm/dpu: split SC7180 catalog entry to the separate file
>>>>    drm/msm/dpu: split SM8250 catalog entry to the separate file
>>>>    drm/msm/dpu: split SC8180X catalog entry to the separate file
>>>>    drm/msm/dpu: split SM8150 catalog entry to the separate file
>>>>    drm/msm/dpu: split MSM8998 catalog entry to the separate file
>>>>    drm/msm/dpu: split SDM845 catalog entry to the separate file
>>>>    drm/msm/dpu: duplicate sdm845 catalog entries
>>>>    drm/msm/dpu: duplicate sc7180 catalog entries
>>>>    drm/msm/dpu: duplicate sm8150 catalog entries
>>>>    drm/msm/dpu: duplicate sm8250 catalog entries
>>>>    drm/msm/dpu: duplicate sm8350 catalog entries
>>>>    drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
>>>>    drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
>>>>    drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
>>>>    drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
>>>>    drm/msm/dpu: drop duplicate vig_sblk instances
>>>>    drm/msm/dpu: enable DSPP on sc8180x
>>>>    drm/msm/dpu: deduplicate sc8180x with sm8150
>>>>    drm/msm/dpu: deduplicate sm6115 with qcm2290
>>>>    drm/msm/dpu: deduplicate sc8280xp with sm8450
>>>>    drm/msm/dpu: drop unused macros from hw catalog
>>>>    drm/msm/dpu: inline IRQ_n_MASK defines
>>>>    drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
>>>>    drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
>>>>    drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU 
>>>> version
>>>>    drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
>>>>    drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
>>>>
>>>> Konrad Dybcio (1):
>>>>    drm/msm/dpu: Allow variable SSPP/INTF_BLK size
>>>>
>>>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  210 ++
>>>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  210 ++
>>>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
>>>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
>>>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
>>>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  151 ++
>>>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   91 +
>>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   83 +
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   53 +
>>>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
>>>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  158 ++
>>>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  136 ++
>>>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  142 ++
>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |   99 +
>>>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
>>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2175 
>>>> +----------------
>>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   37 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
>>>>   21 files changed, 2443 insertions(+), 2147 deletions(-)
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>>
>>

-- 
With best wishes
Dmitry

