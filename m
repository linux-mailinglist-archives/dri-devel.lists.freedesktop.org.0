Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE5724C90
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 21:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467F310E24F;
	Tue,  6 Jun 2023 19:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D144F10E257
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 19:09:04 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f619c2ba18so4658228e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686078542; x=1688670542;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t9wNtGVe5uNodwdHLyCXdbUp2XDGTrdArpaiEQ98OZ0=;
 b=VHsU0FdY5/IxaOlSfK9kAU0HnEJ4C3v2AzPTGZQLKgB30rzwQ/7Sp4oAzndFDee1Kw
 SNIGaaCAP0jhHZllaQatDujNQpo6oM/dOmFvFVOkJiGkegZY3rn6eHqIldmFuB29vrwO
 qNWzyYTGLt0RGY+gC33SSEbNy30x/2g44rLiQXxvk1VOGF+BXniE4q9RLPAnANwTos+R
 0VzL/QSx0Ii+mt7Xc4/GpXPQlrwbEAKIitFUtSluzEIhvZOxHnsb3N4WiDd1ZZHtDXZD
 AxTdl2A/oUCsLnkcd3aAEs+QwCJYCHcNOZeBnN86ZrdAG/ddtuFOL61L+c8yC/ESWzTw
 +w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686078542; x=1688670542;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t9wNtGVe5uNodwdHLyCXdbUp2XDGTrdArpaiEQ98OZ0=;
 b=CWBqQCkx6y7u5yE+Hi3playU7h5qNJ4SrVz5F9VmrlW97f9x+/mOqhbng/tpl1OWCD
 uCZhK9bHMhqoQ27Kwj2uMPnicCB8s4QHbhIo0Xow1E11pPinqPniQ6mOOdNx+GvwR3SY
 Tqzzjp+wc9vv9wm4qtkz7KAc31I/ajefUOKG4v0YSqYc4QhAM+hFv2tzxTjEeHn/MT2s
 McWjzfdCAnC00eGON6wX6jBWnvwPnipipXfPz6gbGlH7Of4HKBQhYHFAmSJgXz4C9ivT
 U6TTxnNFkRMviYzQeFN/ixwRdrp0xLke3NTRPvjAZj3ZeadIQjfEu6JhNOzZsphnZWSX
 VD3A==
X-Gm-Message-State: AC+VfDxYh4JRCy8Vag/F8BW60GPO8lS0inVzI8oy9AqJO97b7Lml0peA
 6L2LB0JxjDzOyIEgWDzlQw5z1Q==
X-Google-Smtp-Source: ACHHUZ4j8BRy/segC3SzGOJCjor3/0qvNwm84emP6Q2bAToFm7B9ORnQ2JBm0Qx+jRN6rLYuBd042g==
X-Received: by 2002:a2e:86c8:0:b0:2b1:bd11:a71a with SMTP id
 n8-20020a2e86c8000000b002b1bd11a71amr1537007ljj.17.1686078542614; 
 Tue, 06 Jun 2023 12:09:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a2e8198000000b00295a96a0f6csm1909720ljg.102.2023.06.06.12.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 12:09:01 -0700 (PDT)
Message-ID: <ee4ae0a3-ff6f-37d1-5829-2a55d3c2904f@linaro.org>
Date: Tue, 6 Jun 2023 22:09:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: re-introduce dpu core revision
 to the catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230531005358.18090-1-quic_abhinavk@quicinc.com>
 <CAA8EJpryw0h8TgpJ+SFJ7s0=LCjkQ6oqAjCKsm60dk_Q5e+wWA@mail.gmail.com>
 <0af4df3d-8048-98cd-6c91-7cd553f4f65f@quicinc.com>
 <98e4bda7-19e9-09b6-f008-383adada97cb@linaro.org>
 <a0b7a9fc-eb3c-3b26-b11d-fe1fb47b2c51@quicinc.com>
 <451b114c-05e1-541c-1d3e-26bb81a307c4@linaro.org>
 <47fda908-d76f-65d5-e001-8773c5b160b9@quicinc.com>
 <48cc3d26-10fe-5b10-30b6-0772d62a2a53@linaro.org>
 <804363cf-f6cf-71a6-be8f-5fc00eea3154@quicinc.com>
 <CAA8EJprDSd79AXQvqW+=0xvTrTMCTL+CJ2E6Rhjro3g3E9UWog@mail.gmail.com>
 <b605d666-8b79-67c2-f16e-1e45c01287c2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b605d666-8b79-67c2-f16e-1e45c01287c2@quicinc.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 20:51, Abhinav Kumar wrote:
> 
> 
> On 6/6/2023 4:14 AM, Dmitry Baryshkov wrote:
>> On Tue, 6 Jun 2023 at 05:35, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 6/5/2023 6:03 PM, Dmitry Baryshkov wrote:
>>>> On 06/06/2023 03:55, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 6/3/2023 7:21 PM, Dmitry Baryshkov wrote:
>>>>>> On 31/05/2023 21:25, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 5/31/2023 3:07 AM, Dmitry Baryshkov wrote:
>>>>>>>> On 31/05/2023 06:05, Abhinav Kumar wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 5/30/2023 7:53 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Wed, 31 May 2023 at 03:54, Abhinav Kumar
>>>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> With [1] dpu core revision was dropped in favor of using the
>>>>>>>>>>> compatible string from the device tree to select the dpu catalog
>>>>>>>>>>> being used in the device.
>>>>>>>>>>>
>>>>>>>>>>> This approach works well however also necessitates adding 
>>>>>>>>>>> catalog
>>>>>>>>>>> entries for small register level details as dpu capabilities 
>>>>>>>>>>> and/or
>>>>>>>>>>> features bloating the catalog unnecessarily. Examples include 
>>>>>>>>>>> but
>>>>>>>>>>> are not limited to data_compress, interrupt register set,
>>>>>>>>>>> widebus etc.
>>>>>>>>>>>
>>>>>>>>>>> Introduce the dpu core revision back as an entry to the catalog
>>>>>>>>>>> so that
>>>>>>>>>>> we can just use dpu revision checks and enable those bits which
>>>>>>>>>>> should be enabled unconditionally and not controlled by a 
>>>>>>>>>>> catalog
>>>>>>>>>>> and also simplify the changes to do something like:
>>>>>>>>>>>
>>>>>>>>>>> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>>>>>>>>>>>           enable the bit;
>>>>>>>>>>>
>>>>>>>>>>> Also, add some of the useful macros back to be able to use 
>>>>>>>>>>> dpu core
>>>>>>>>>>> revision effectively.
>>>>>>>>>>>
>>>>>>>>>>> [1]:
>>>>>>>>>>> https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>>>>> ---
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
>>>>>>>>>>>    .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
>>>>>>>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31
>>>>>>>>>>> ++++++++++++++++++-
>>>>>>>>>>>    14 files changed, 43 insertions(+), 1 deletion(-)
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> [skipped catalog changes]
>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>>>>>> index 677048cc3b7d..cc4aa75a1219 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>>>>>> @@ -19,6 +19,33 @@
>>>>>>>>>>>     */
>>>>>>>>>>>    #define MAX_BLOCKS    12
>>>>>>>>>>>
>>>>>>>>>>> +#define DPU_HW_VER(MAJOR, MINOR, STEP)\
>>>>>>>>>>> +                 ((((unsigned int)MAJOR & 0xF) << 28) |\
>>>>>>>>>>> +                 ((MINOR & 0xFFF) << 16) |\
>>>>>>>>>>> +                 (STEP & 0xFFFF))
>>>>>>>>>>> +
>>>>>>>>>>> +#define DPU_HW_MAJOR(rev)((rev) >> 28)
>>>>>>>>>>> +#define DPU_HW_MINOR(rev)(((rev) >> 16) & 0xFFF)
>>>>>>>>>>> +#define DPU_HW_STEP(rev)((rev) & 0xFFFF)
>>>>>>>>>>> +#define DPU_HW_MAJOR_MINOR(rev)((rev) >> 16)
>>>>>>>>>>> +
>>>>>>>>>>> +#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
>>>>>>>>>>> +(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
>>>>>>>>>>> +
>>>>>>>>>>> +#define DPU_HW_VER_300 DPU_HW_VER(3, 0, 0) /* 8998 v1.0 */
>>>>>>>>>>> +#define DPU_HW_VER_400 DPU_HW_VER(4, 0, 0) /* sdm845 v1.0 */
>>>>>>>>>>> +#define DPU_HW_VER_500 DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
>>>>>>>>>>> +#define DPU_HW_VER_510 DPU_HW_VER(5, 1, 1) /* sc8180 */
>>>>>>>>>>> +#define DPU_HW_VER_600 DPU_HW_VER(6, 0, 0) /* sm8250 */
>>>>>>>>>>> +#define DPU_HW_VER_620 DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>>>>>>>>>>> +#define DPU_HW_VER_630 DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>>>>>>>>>>> +#define DPU_HW_VER_650 DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>>>>>>>>>>> +#define DPU_HW_VER_700 DPU_HW_VER(7, 0, 0) /* sm8350 */
>>>>>>>>>>> +#define DPU_HW_VER_720 DPU_HW_VER(7, 2, 0) /* sc7280 */
>>>>>>>>>>> +#define DPU_HW_VER_800 DPU_HW_VER(8, 0, 0) /* sc8280xp */
>>>>>>>>>>> +#define DPU_HW_VER_810 DPU_HW_VER(8, 1, 0) /* sm8450 */
>>>>>>>>>>> +#define DPU_HW_VER_900 DPU_HW_VER(9, 0, 0) /* sm8550 */
>>>>>>>>>>
>>>>>>>>>> Instead of having defines for all SoCs (which can quickly become
>>>>>>>>>> unmanageable) and can cause merge conflicts, I'd suggest inlining
>>>>>>>>>> all
>>>>>>>>>> the defines into respective catalog files.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Sure, that can be done.
>>>>>>>>>
>>>>>>>>>> Also, I'm not sure that the "step" should be a part of the
>>>>>>>>>> catalog. I
>>>>>>>>>> know that this follows the hardware revision. However, please
>>>>>>>>>> correct
>>>>>>>>>> me if I'm wrong, different step levels are used for revisions 
>>>>>>>>>> of the
>>>>>>>>>> same SoC. The original code that was reading the hw revision from
>>>>>>>>>> the
>>>>>>>>>> hardware register, listed both 5.0.0 and 5.0.1 for sm8150.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This is one of the things i noticed while making this change.
>>>>>>>>>
>>>>>>>>> Before the catalog rework, we used to handle even steps as we used
>>>>>>>>> to read that from the register and match it with the mdss_cfg
>>>>>>>>> handler. But after the rework, we dont handle steps anymore. Yes,
>>>>>>>>> you are right that different step levels are used for the
>>>>>>>>> revisions of the same SOC and so with that, i dont expect or
>>>>>>>>> atleast am not aware of DPU differences between steps but I am not
>>>>>>>>> able to rule it out.
>>>>>>>>>
>>>>>>>>> So are you suggesting we drop step altogether and DPU_HW_VER()
>>>>>>>>> macro shall only handle major and minor versions? With the current
>>>>>>>>> chipsets I see, it should not make a difference . Its just that I
>>>>>>>>> am not sure if that will never happen.
>>>>>>>>
>>>>>>>> Yes. The goal of this rework would be to drop generic features and
>>>>>>>> to replace those checks with DPU-revision lookups. Correct?
>>>>>>>
>>>>>>> Yes thats right.
>>>>>>>
>>>>>>>> I think that from this perspective having to handle toe step
>>>>>>>> revision is a sign of an overkill. Having to handle the step
>>>>>>>> revision is a sign of paltform feature (or mis-feature) rather than
>>>>>>>> a generic DPU bit.
>>>>>>>>
>>>>>>>
>>>>>>> Not entirely. Lets not forget that at the moment even dpu_perf_cfg
>>>>>>> is part of the catalog. Even if in terms of major HW blocks steps
>>>>>>> shouldnt change, there is absolutely no guarantee that perf data
>>>>>>> cannot.
>>>>>>>
>>>>>>> This is what is the sticking point for me which is holding me back
>>>>>>> against dropping step. Thoughts?
>>>>>>
>>>>>> We usually do not support ES versions of the chips, only the final
>>>>>> version. So supporting the perf data for earlier revisions is also
>>>>>> not required.
>>>>>>
>>>>>
>>>>> ack, we will drop step in that case. and good to know about the ES
>>>>> versions.
>>>>>
>>>>>>>
>>>>>>>> In fact I suppose that even handling a minor revision would be an
>>>>>>>> overkill. Why don't we start with .dpu_major instead of .core_rev?
>>>>>>>> We can add .dpu_minor if/when required.
>>>>>>>>
>>>>>>>
>>>>>>> No, unfortunately we cannot drop minor version for sure. I am seeing
>>>>>>> examples in downstream code where some of the features are available
>>>>>>> after a minor verion as well.
>>>>>>
>>>>>> Can you please give an example?
>>>>>>
>>>>>
>>>>> Yes, watchdog timer, intf reset counter are available only after DPU
>>>>> HW version 8.1 (not major version 8).
>>>>
>>>> Hmm, IIRC, wd timer was available for ages. Was it moved together with
>>>> the introduction of MDSS_PERIPH_0_REMOVED?
>>>>
>>>
>>> I am not sure of the timeline but its certainly tied to 8.1.
>>>
>>>> But anyway, I see your point. Let's have major and minor. I'd probably
>>>> still ask for the separate major and minor fields, if you don't mind.
>>>>
>>>
>>> hmmm so something like this?
>>>
>>> +#define DPU_HW_VER_300 DPU_HW_VER(3, 0) /* 8998 v1.0 */
>>>
>>> const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>> .......
>>> .dpu_major_rev = DPU_HW_MAJOR(DPU_HW_VER_300),
>>> .dpu_minor_rev = DPU_HW_MINOR(DPU_HW_VER_300)
>>
>> Just:
>>
>> const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>      .dpu_major_rev = 3,
>>      .dpu_minor_rev = 0,
>>      /* .... */
>> };
>>
>> We do not need a single enumeration of all the versions. It can easily
>> become a source of merge conflicts.
>>
> 
> The issue with this approch is then the DPU_HW_VER_xxx macros become 
> redundant but we should keep them. Because in the code, its much more 
> readable to have
> 
> if (core_rev > DPU_HW_MAJOR(DPU_HW_VER_xxx))
>      then enable feature;
> 
> But now we will have to do
> 
> if (dpu_major_rev > xxx && dpu_minor_ver > yyy)
>      then enable feature;
> 
> /// probably folks will question this xxx and yyy as to what it means.

The first approach is less readable. It will require anybody to check, 
what is the major/minor of the mentioned XXX platform. In the second 
case we know exactly what we are looking for. E.g. we have new INTF 
interrupt addresses since 7.0. We have MDP_TOP_PERIPH0_REMOVED since 8.0 
(or 8.1?) We have PP_TE until 5.0 (not included) and INTF_TE since 5.0.

Having DPU_HW_VER_foo, I'd have to look up each time, what is the HW 
revision of sm8350, sc8280xp, sm8150, etc.

> 
> Can you please explain the single enumeration a bit more?
> 
> I thought we are going to move each revision to its separate file to 
> avoid the conflicts as you suggested earlier in the comments. Isnt that 
> enough?

This way you wouldn't be able to check against them in other modules.

> 
>>> .......
>>> }
>>>
>>> But may I ask why? Since the manor/minor version macros handle this
>>> nicely for us.
>>
>>
>>

-- 
With best wishes
Dmitry

