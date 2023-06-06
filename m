Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00536724F0A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 23:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ACE10E3D9;
	Tue,  6 Jun 2023 21:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AC910E3D9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 21:53:00 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f3ba703b67so8139268e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686088379; x=1688680379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ArbCbrLD74q6e/lUgRkAtIyFuUJ59jhNPTFpJp2pIz4=;
 b=cllelVXvY20LDd1Em3sI5LEHr6Ni6g6PNtdkBpZnnpOUUtwV+x2siKs++fZIqmYrp3
 vgnfnCDo5QGT1c5yHdewuTI77UYDL5Ze+zvQW2F2vDoimn7nGcA9lYDXPj56VE6iQXEn
 rK11jpFarJ0iibUIaIUJYghYFy2raGBkHxrkDp6RGFr9aPnEbO3IW7T8QfdEdOwGXcfO
 icXEVI1h8rfOGt8Td+pJQQKjJSb05R2jl6FvX4YJWp9scyOrS+ZicbyndEz1fBxkyegf
 HAIlH0urtk/Y5hy7qgTwXEC9XljyqazS3E5DNJnGnEGou6IDAn77l6md8hdzjdG9lniJ
 Waww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686088379; x=1688680379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ArbCbrLD74q6e/lUgRkAtIyFuUJ59jhNPTFpJp2pIz4=;
 b=ZA1lVvxcj9KfCHhY9kAJ0aGaf7y1UPV+uMt89JZ4MN8LQevtObGGQxy7Z4PmU2Mu8r
 ffyqMwkRzp6e2gIzpjhXOwZ6RMDdyhMW7gtnhDfcs0+vYrvx+Kb7GZAwF3mZF+OxIxxD
 ZHDqGfOfwuHHq10FCxdk+MpN7B0Uae5DrQu9JSxi6DkSJYYE4/BMY8vY7TfsQkEQXYDY
 xu2xasCOyOAAqjFBcgLYqnWyTXG/7aLaJWtB7YS9jnNJejJJmnyQuXqD3nybwbcTaSr+
 ZO0VlAx308goiviuW3Dp6FxoSmBmOPwOFnxSvwTePVIKhCXiObftB2pJl1a4YVh57Jlk
 tpwQ==
X-Gm-Message-State: AC+VfDzXwxsNyLKN8tS0SGAjB2kBCl1ewsCBlXIegzkyr06uXXmZ2u12
 uvpN6586E/SBgVNiGf2fplWRVQ==
X-Google-Smtp-Source: ACHHUZ71JOc8rwTalvAdYRyx9RQfSEHb5HfdwskP61Wm9XyoQtZcR/11vRTaNXnW3E7wknwRi9CFDw==
X-Received: by 2002:ac2:4439:0:b0:4ec:a19c:32b0 with SMTP id
 w25-20020ac24439000000b004eca19c32b0mr1212470lfl.5.1686088378622; 
 Tue, 06 Jun 2023 14:52:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w5-20020ac25d45000000b004f3a71a9e72sm1578291lfd.102.2023.06.06.14.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 14:52:56 -0700 (PDT)
Message-ID: <e258fce0-9044-399c-fcc9-634ea1d53f7a@linaro.org>
Date: Wed, 7 Jun 2023 00:52:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 10/13] drm/msm/dpu: add list of supported formats
 to the DPU caps
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
 <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
 <CAA8EJpr0DcVfG86SYKRb-4Ph82dfXafed9CFgY1qFSECFbAcTw@mail.gmail.com>
 <6c61a8f1-f77e-3a18-15f8-7c004a99f78d@quicinc.com>
 <cfad7817-2d7e-843d-033d-cf2f3aba440d@linaro.org>
 <868e69f5-0f47-18cf-0e1e-377c37376437@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <868e69f5-0f47-18cf-0e1e-377c37376437@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2023 00:47, Abhinav Kumar wrote:
> 
> 
> On 6/6/2023 2:29 PM, Dmitry Baryshkov wrote:
>> On 07/06/2023 00:14, Abhinav Kumar wrote:
>>>
>>>
>>> On 5/24/2023 6:47 PM, Dmitry Baryshkov wrote:
>>>> On Thu, 25 May 2023 at 02:16, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>>>> As we are going to add virtual planes, add the list of supported 
>>>>>> formats
>>>>>> to the hw catalog entry. It will be used to setup universal 
>>>>>> planes, with
>>>>>> later selecting a pipe depending on whether the YUV format is used 
>>>>>> for
>>>>>> the framebuffer.
>>>>>>
>>>>>
>>>>> If your usage of format_list is going to be internal to dpu_plane.c, I
>>>>> can think of another idea for this change.
>>>>>
>>>>> This essentially translates to if (num_vig >= 1)
>>>>>
>>>>> If we can just have a small helper to detect that from the catalog can
>>>>> we use that instead of adding formats to the dpu caps?
>>>>
>>>> I'd prefer to be explicit here. The list of supported formats might
>>>> vary between generations, might it not? Also we don't have a case of
>>>> the devices not having VIG planes. Even the qcm2290 (which doesn't
>>>> have CSC) lists YUV as supported.
>>>>
>>>
>>> the list of formats is tied to the sspps the dpu generation has and 
>>> the capabilities of those sspps.
>>>
>>> qcm2290 is really an interesting case. It has one vig sspp but no csc 
>>> block for that vig sspp, hence it cannot support non-RGB formats.
>>>
>>> I have confirmed that downstream is incorrect to populate yuv formats 
>>> for qcm2290.
>>>
>>> I still think that having atleast one vig sspp with csc sub-blk is 
>>> the right condition to check if we want to decide if the dpu for that 
>>> chipset supports yuv formats. Extra csc-blk check to handle qcm2290.
>>>
>>> Having a small helper in dpu_plane.c is good enough for that because 
>>> with virtual planes, you only need to know "if such a plane exists 
>>> and not which plane" and a full catalog change isnt needed IMO
>>
>> This goes down to the question: is the list of YUV and non-YUV formats 
>> static or not? Do all DPU devices support the same set of YUV and 
>> non-YUV formats? If it is static, we might as well drop 
>> dpu_sspp_sub_blks::format_list.
>>
> 
> I would say yes based on the below reference:
> 
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/clo/main/msm/sde/sde_hw_catalog.c#L3858
> 
> We always add the same set of YUV formats for all Vig SSPPs irrespective 
> of the chipsets.

Well, as your example pointed out, few lines below it starts adding 
formats to the list, so the format list is not static and depends on the 
generation.

> 
>> Note to myself: consider 
>> dpu_mdss_cfg::{dma_formats,cursor_formats,vig_formats}. Either migrate 
>> dpu_sspp_sub_blks::format_list users to these fields or drop them.
>>
> 
> Yes, I agree. There is no need to have format list in the sub_blk as for 
> one type of SSPP, it supports the same format across DPU generations.
> 
>>>
>>>
>>>> Note: I think at some point we should have a closer look at the list
>>>> of supported formats and crosscheck that we do not have either
>>>> unsupported formats being listed, or missing formats which are not
>>>> listed as supported.
>>>>
>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 
>>>>>> +++++++++++++++++++
>>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +++
>>>>>>    2 files changed, 30 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> index 212d546b6c5d..2d6944a9679a 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> @@ -315,6 +315,8 @@ static const struct dpu_caps msm8998_dpu_caps = {
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps qcm2290_dpu_caps = {
>>>>>> @@ -324,6 +326,8 @@ static const struct dpu_caps qcm2290_dpu_caps = {
>>>>>>        .has_idle_pc = true,
>>>>>>        .max_linewidth = 2160,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sdm845_dpu_caps = {
>>>>>> @@ -339,6 +343,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sc7180_dpu_caps = {
>>>>>> @@ -350,6 +356,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
>>>>>>        .has_idle_pc = true,
>>>>>>        .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sm6115_dpu_caps = {
>>>>>> @@ -361,6 +369,8 @@ static const struct dpu_caps sm6115_dpu_caps = {
>>>>>>        .has_idle_pc = true,
>>>>>>        .max_linewidth = 2160,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sm8150_dpu_caps = {
>>>>>> @@ -376,6 +386,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sc8180x_dpu_caps = {
>>>>>> @@ -391,6 +403,8 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sc8280xp_dpu_caps = {
>>>>>> @@ -404,6 +418,8 @@ static const struct dpu_caps sc8280xp_dpu_caps 
>>>>>> = {
>>>>>>        .has_3d_merge = true,
>>>>>>        .max_linewidth = 5120,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sm8250_dpu_caps = {
>>>>>> @@ -417,6 +433,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
>>>>>>        .has_3d_merge = true,
>>>>>>        .max_linewidth = 900,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sm8350_dpu_caps = {
>>>>>> @@ -430,6 +448,8 @@ static const struct dpu_caps sm8350_dpu_caps = {
>>>>>>        .has_3d_merge = true,
>>>>>>        .max_linewidth = 4096,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sm8450_dpu_caps = {
>>>>>> @@ -443,6 +463,8 @@ static const struct dpu_caps sm8450_dpu_caps = {
>>>>>>        .has_3d_merge = true,
>>>>>>        .max_linewidth = 5120,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sm8550_dpu_caps = {
>>>>>> @@ -456,6 +478,8 @@ static const struct dpu_caps sm8550_dpu_caps = {
>>>>>>        .has_3d_merge = true,
>>>>>>        .max_linewidth = 5120,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_caps sc7280_dpu_caps = {
>>>>>> @@ -467,6 +491,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
>>>>>>        .has_idle_pc = true,
>>>>>>        .max_linewidth = 2400,
>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>> +     .format_list = plane_formats_yuv,
>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>    };
>>>>>>
>>>>>>    static const struct dpu_mdp_cfg msm8998_mdp[] = {
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>> index 89b372cdca92..4847aae78db2 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>> @@ -404,6 +404,8 @@ struct dpu_rotation_cfg {
>>>>>>     * @pixel_ram_size     size of latency hiding and de-tiling 
>>>>>> buffer in bytes
>>>>>>     * @max_hdeci_exp      max horizontal decimation supported (max 
>>>>>> is 2^value)
>>>>>>     * @max_vdeci_exp      max vertical decimation supported (max 
>>>>>> is 2^value)
>>>>>> + * @format_list: Pointer to list of supported formats
>>>>>> + * @num_formats: Number of supported formats
>>>>>>     */
>>>>>>    struct dpu_caps {
>>>>>>        u32 max_mixer_width;
>>>>>> @@ -419,6 +421,8 @@ struct dpu_caps {
>>>>>>        u32 pixel_ram_size;
>>>>>>        u32 max_hdeci_exp;
>>>>>>        u32 max_vdeci_exp;
>>>>>> +     const u32 *format_list;
>>>>>> +     u32 num_formats;
>>>>>>    };
>>>>>>
>>>>>>    /**
>>>>
>>>>
>>>>
>>

-- 
With best wishes
Dmitry

