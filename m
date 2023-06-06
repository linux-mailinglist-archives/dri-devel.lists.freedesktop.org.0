Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F91A7250B5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 01:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B15B10E3EA;
	Tue,  6 Jun 2023 23:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7E610E3E7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 23:21:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4db9987f8so36970e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 16:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686093695; x=1688685695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n0tlPXqbLJGaYQ6NS1ZilhIHMIXaOOlhIbxk59xanGI=;
 b=GIzDkpCqhgHS6ZIncgdbBp5dU9OAvWa02cfMoXqBXnygF2MGpune38gyDdd6jXRBlx
 YEd1AMp1WkBfO+LWaaOeXESl1YZQhu7AfULz9TXsTXwpDTEz4Ui632Pn5BQZfG+BBU4j
 2aYvDek5RpT+BA9nSGC/II9zjo/6aSYdimrO6KG+56x9rVpNgEyBq6PrBwFm6gUvDFu6
 c1mDQgm7BwCcYsGRoygj4SZnDKeJTWZzMUBOwALnEWG14LKvfk2k8/BN2xYxs9cL+w7d
 ovmm6KD648RItPI0AWzwG5Q31a/h0rb3rg6cTfeflM2ODYC40cyo7KS/D74KRVhBVNLm
 Wp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686093695; x=1688685695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n0tlPXqbLJGaYQ6NS1ZilhIHMIXaOOlhIbxk59xanGI=;
 b=YtcOpOFX6pHz/flbxwRIkbkCMDOGMh6sv8GrvcunkVTYAzKv55yYiUdof/jEoZ2Svq
 8/QehNJEIAF+wrv1Cqok7l7J3NJ6Fl5+8UlEIot8CK3KKPcQdAFdxmQReQCwlaSb2eLs
 ZWMmFu46yJn/ORmTya6WSq6gtEEaSj3WaJbnhuQgdp63eZlXF0gnWofJJJiLqHfSj+xx
 lxIEreP/C+wlgDnT6s7ibN+uvBD9m5nU0L4jH1KPMvXfxUQEUyFLqliOQHPV0VKphlZG
 nI0HozfrA7y+yypc1Kta1hCM06e42nR9x23cmrel4w/EhRQkKYszOudBsXy4v/NfKOnw
 Dg6w==
X-Gm-Message-State: AC+VfDygT/AJDiNM4htaKnkj0yENVKa+x/ARC9g4NETCOnhKbJYhQ6Na
 1VMB5rPtqXldJq8lpmzcbk0kng==
X-Google-Smtp-Source: ACHHUZ4YOP/wtS47JRGyvVl7YbgUiVbr9qgveh559sTBgxv5SOhA0GoPzd2Nqk2EE48SMkKJH1aPbw==
X-Received: by 2002:a05:6512:3d05:b0:4f3:822d:bcf7 with SMTP id
 d5-20020a0565123d0500b004f3822dbcf7mr5086223lfv.21.1686093695294; 
 Tue, 06 Jun 2023 16:21:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r11-20020ac25a4b000000b004f391a2028dsm1599768lfn.265.2023.06.06.16.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 16:21:34 -0700 (PDT)
Message-ID: <fa38edf1-a3e4-0859-8f00-73708fe8cbbc@linaro.org>
Date: Wed, 7 Jun 2023 02:21:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 10/13] drm/msm/dpu: add list of
 supported formats to the DPU caps
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
 <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
 <CAA8EJpr0DcVfG86SYKRb-4Ph82dfXafed9CFgY1qFSECFbAcTw@mail.gmail.com>
 <6c61a8f1-f77e-3a18-15f8-7c004a99f78d@quicinc.com>
 <cfad7817-2d7e-843d-033d-cf2f3aba440d@linaro.org>
 <868e69f5-0f47-18cf-0e1e-377c37376437@quicinc.com>
 <e258fce0-9044-399c-fcc9-634ea1d53f7a@linaro.org>
 <e43c9e17-1c0b-f3cd-036f-1a4968a0150d@quicinc.com>
 <12aacfc4-8ed5-1c85-8c1c-abd0aed7f8a9@linaro.org>
 <9addd6fc-460a-0bb6-d6d1-b2b51354c695@quicinc.com>
 <0cf278c9-d28a-34c4-f45d-c2c9fb5271e8@linaro.org>
 <c21baf52-8993-8036-9378-f276166b509d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c21baf52-8993-8036-9378-f276166b509d@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2023 02:14, Abhinav Kumar wrote:
> 
> 
> On 6/6/2023 3:59 PM, Dmitry Baryshkov wrote:
>> On 07/06/2023 01:57, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/6/2023 3:50 PM, Dmitry Baryshkov wrote:
>>>> On 07/06/2023 01:47, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 6/6/2023 2:52 PM, Dmitry Baryshkov wrote:
>>>>>> On 07/06/2023 00:47, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 6/6/2023 2:29 PM, Dmitry Baryshkov wrote:
>>>>>>>> On 07/06/2023 00:14, Abhinav Kumar wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 5/24/2023 6:47 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, 25 May 2023 at 02:16, Abhinav Kumar 
>>>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> As we are going to add virtual planes, add the list of 
>>>>>>>>>>>> supported formats
>>>>>>>>>>>> to the hw catalog entry. It will be used to setup universal 
>>>>>>>>>>>> planes, with
>>>>>>>>>>>> later selecting a pipe depending on whether the YUV format 
>>>>>>>>>>>> is used for
>>>>>>>>>>>> the framebuffer.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> If your usage of format_list is going to be internal to 
>>>>>>>>>>> dpu_plane.c, I
>>>>>>>>>>> can think of another idea for this change.
>>>>>>>>>>>
>>>>>>>>>>> This essentially translates to if (num_vig >= 1)
>>>>>>>>>>>
>>>>>>>>>>> If we can just have a small helper to detect that from the 
>>>>>>>>>>> catalog can
>>>>>>>>>>> we use that instead of adding formats to the dpu caps?
>>>>>>>>>>
>>>>>>>>>> I'd prefer to be explicit here. The list of supported formats 
>>>>>>>>>> might
>>>>>>>>>> vary between generations, might it not? Also we don't have a 
>>>>>>>>>> case of
>>>>>>>>>> the devices not having VIG planes. Even the qcm2290 (which 
>>>>>>>>>> doesn't
>>>>>>>>>> have CSC) lists YUV as supported.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> the list of formats is tied to the sspps the dpu generation has 
>>>>>>>>> and the capabilities of those sspps.
>>>>>>>>>
>>>>>>>>> qcm2290 is really an interesting case. It has one vig sspp but 
>>>>>>>>> no csc block for that vig sspp, hence it cannot support non-RGB 
>>>>>>>>> formats.
>>>>>>>>>
>>>>>>>>> I have confirmed that downstream is incorrect to populate yuv 
>>>>>>>>> formats for qcm2290.
>>>>>>>>>
>>>>>>>>> I still think that having atleast one vig sspp with csc sub-blk 
>>>>>>>>> is the right condition to check if we want to decide if the dpu 
>>>>>>>>> for that chipset supports yuv formats. Extra csc-blk check to 
>>>>>>>>> handle qcm2290.
>>>>>>>>>
>>>>>>>>> Having a small helper in dpu_plane.c is good enough for that 
>>>>>>>>> because with virtual planes, you only need to know "if such a 
>>>>>>>>> plane exists and not which plane" and a full catalog change 
>>>>>>>>> isnt needed IMO
>>>>>>>>
>>>>>>>> This goes down to the question: is the list of YUV and non-YUV 
>>>>>>>> formats static or not? Do all DPU devices support the same set 
>>>>>>>> of YUV and non-YUV formats? If it is static, we might as well 
>>>>>>>> drop dpu_sspp_sub_blks::format_list.
>>>>>>>>
>>>>>>>
>>>>>>> I would say yes based on the below reference:
>>>>>>>
>>>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/clo/main/msm/sde/sde_hw_catalog.c#L3858
>>>>>>>
>>>>>>> We always add the same set of YUV formats for all Vig SSPPs 
>>>>>>> irrespective of the chipsets.
>>>>>>
>>>>>> Well, as your example pointed out, few lines below it starts 
>>>>>> adding formats to the list, so the format list is not static and 
>>>>>> depends on the generation.
>>>>>>
>>>>>
>>>>> No, the DPU revision checks are there to add P010 UBWC formats on 
>>>>> top of the Vig formats.
>>>>>
>>>>> At the moment, the latest downstream code (code which is not on CLO 
>>>>> hence I cannot share) has dropped all that and just checks if P010 
>>>>> UBWC is supported for the Vig SSPP and adds all those.
>>>>>
>>>>> So its still tied to the feature bit whether P010 UBWC is supported 
>>>>> in the Vig SSPP and not at the chipset level.
>>>>
>>>> So, what is the difference? This means that depending on some 
>>>> conditions either we can support P010 UBWC or we can not. So the 
>>>> list of all suppored formats is not static.
>>>>
>>>
>>> The difference is SSPP level vs chipset level. This patch was made 
>>> with chipset level in mind and had to expand the format list for each 
>>> chipset.
>>>
>>> What I am suggesting is its a SSPP level decision. Please note its 
>>> not just P010 UBWC but P010 UBWC FOR Vig SSPP.
>>>
>>> So expanding each chipset's format list is not needed when the 
>>> decision can be made just on the basis of the SSPP's feature flag OR 
>>> the presence of the csc blk.
>>
>> Maybe I misunderstand something. Is P010 UBWC format supported on VIG 
>> SSPPs on all generations? The code that you have pointed me suggests 
>> that is is not.
>>
> 
> No, your understanding is correct that P010 UBWC format is supported 
> only on Vig SSPPs of certain generations.
> 
> But my point is that, its still a SSPP level decision.
> 
> So even if we add P010 UBWC formats later to the list of supported 
> formats, what we will do is add that feature bit alone in the Vig SSPP's 
> feature mask of that chipset and based on that all the P010 UBWC formats 
> for the virtual planes.
> 
> But if we follow your approach, we will add another array called 
> plane_formats_p010_ubwc and add that to each chipset which will support it.

sspp->sblk->formats_list is constant, so we will have to add another 
formats array anyway.

> The only difference in idea is that, based on the SSPP's feature set of 
> that chipset we can still determine that Vs adding it to each chipset.
> 
>>>
>>>>>
>>>>>>>
>>>>>>>> Note to myself: consider 
>>>>>>>> dpu_mdss_cfg::{dma_formats,cursor_formats,vig_formats}. Either 
>>>>>>>> migrate dpu_sspp_sub_blks::format_list users to these fields or 
>>>>>>>> drop them.
>>>>>>>>
>>>>>>>
>>>>>>> Yes, I agree. There is no need to have format list in the sub_blk 
>>>>>>> as for one type of SSPP, it supports the same format across DPU 
>>>>>>> generations.
>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Note: I think at some point we should have a closer look at 
>>>>>>>>>> the list
>>>>>>>>>> of supported formats and crosscheck that we do not have either
>>>>>>>>>> unsupported formats being listed, or missing formats which are 
>>>>>>>>>> not
>>>>>>>>>> listed as supported.
>>>>>>>>>>
>>>>
>>

-- 
With best wishes
Dmitry

