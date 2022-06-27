Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C355BC1C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDDB10F37D;
	Mon, 27 Jun 2022 21:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA8C10F223
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 21:23:27 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a11so12525912ljb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/wLPUoy2pPh5k2BqmFFOQy1JZHLjbPr706Aorr9RkCg=;
 b=ZUvtm84o5Xus6asD33Qz20UyzTK82ynVsnvqIECW2CLfDOWIdFwz79aOYCZXfn4si6
 Ofx2gMQcJPnuq13TzHmlG/CsnjPBslYItdIM8B0NCxiVYI/McIWlZ/Z4kayA6HQsKLeB
 5vKcA303I1x4QKCPydiaj6cA8XvkldMirOnaXWAtn9kLhvi4j18Axjt6/DyHxfKQcaJZ
 buSdq3CqcUBWJ3u/+gtBVjy/j4ImB39eVf3tBIDT/C8K62t7Q0TjU6uO16f0WycK4wel
 bZFFHCrcY614cmIRdsq7OjLtWc7vk5gMY4k1F7KGqXyKbketsU3epjWnW8+0V8KURHRA
 5R0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/wLPUoy2pPh5k2BqmFFOQy1JZHLjbPr706Aorr9RkCg=;
 b=nbnqf9oTW9KwAgMROgfnHPr5UsUoafg6DPlme0ooO6yfOZSzlBV6p1oINa2qk/gGTK
 OROvWI+6vjpq6kws3tZ8qDDcTduQqr/Iv8CZw2YnuEyNTd1luJQhAztisgo3sEE4pCMA
 dcVv1UAUEOP3KBqQFB4L1mtVCkeexa06nxemXBANu9Nhd0YLyml6bVTV46qHGQb/HFRP
 ahNKsiLd+Zzx9HBkKp7R4GuVrViElUEJma2I6le34XLPsTVHRE3+sSMKrSp4ghnopPpL
 itmePpH/JF7ST19zkA2wC8jko+Ox51t9uMnLD89woQ0m2cxWiCXg3AgBBykgAV9LsqCK
 0RJw==
X-Gm-Message-State: AJIora+/AydAankFTPKKyRQg/dJ8F/TM4AZdV4ibZnZo7Qn2zYHoKcDq
 4uGQQb4TOhA1s71Mf2jUqn95sQ==
X-Google-Smtp-Source: AGRyM1sopHDGUg40Tmfjl6TKQ3fPR8QMuGTPk5+XM5+KH9vn2PFRQl0J662G84sETgPQUtNaQIRYbA==
X-Received: by 2002:a05:651c:a04:b0:25b:bc07:8884 with SMTP id
 k4-20020a05651c0a0400b0025bbc078884mr4939922ljq.39.1656365005631; 
 Mon, 27 Jun 2022 14:23:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056512210a00b0047da5e98e66sm1946927lfr.1.2022.06.27.14.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 14:23:24 -0700 (PDT)
Message-ID: <84819c2b-54b5-218e-6d42-bdd8a5fe9103@linaro.org>
Date: Tue, 28 Jun 2022 00:23:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
 <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
 <CAA8EJprR23ugdi926BDtGOGdGEqvWBgOQfekyJjD_OFE3yx0Aw@mail.gmail.com>
 <9e7c1015-80e6-308d-7910-95d27df174b4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9e7c1015-80e6-308d-7910-95d27df174b4@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2022 00:01, Kuogee Hsieh wrote:
> 
> On 6/27/2022 1:05 PM, Dmitry Baryshkov wrote:
>> On Mon, 27 Jun 2022 at 22:26, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>>
>>> On 6/27/2022 9:54 AM, Dmitry Baryshkov wrote:
>>>> If for some reason the msm_dp_config::descs array starts from non-zero
>>>> index or contains the hole, setting the msm_dp_config::num_descs might
>>>> be not that obvious and error-prone. Use ARRAY_SIZE to set this field
>>>> rather than encoding the value manually.
>>>>
>>>> Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 46 
>>>> +++++++++++++++++------------
>>>>    1 file changed, 27 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index f87fa3ba1e25..6fed738a9467 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -131,35 +131,43 @@ struct msm_dp_config {
>>>>        size_t num_descs;
>>>>    };
>>>>
>>>> +static const struct msm_dp_desc sc7180_dp_descs[] = {
>>>> +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> +};
>>>> +
>>>>    static const struct msm_dp_config sc7180_dp_cfg = {
>>>> -     .descs = (const struct msm_dp_desc[]) {
>>>> -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> -     },
>>>> -     .num_descs = 1,
>>>> +     .descs = sc7180_dp_descs,
>>>> +     .num_descs = ARRAY_SIZE(sc7180_dp_descs),
>>>> +};
>>>> +
>>> why you want to do that?
>>>
>>> It is very clear only one entry, why you want to make it 2 entry here?
>>>
>>> can you just embedded MSM_DP_COTROLLER_x into struct msm_dp_config?
>> Because we had enough stories of using a manually set 'number of
>> something' field. So I'd prefer to have it done automatically.
>> Also using the indexed array spares us from 'look for the DP
>> controller number N' functions. You can just get it.
> 
> static const struct msm_dp_config sc7280_dp_cfg = {
>           .descs = (const struct msm_dp_desc[]) {
>                   [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, 
> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>           },
>           .num_descs = ARRAY_SIZE(sc7280_dp_descs),

This will not work.

> };
> 
> At above example table, it just waste one entry. is it ok?

I'd assume this is an interim development state. Then it's fine. In the 
final version one would fill all existing DP controllers starting from 0.

> 
> can you elaborate  more on 'look for the DP controller number N' 
> functions, where is it?

Ignore this.

> 
> 
>>>> +static const struct msm_dp_desc sc7280_dp_descs[] = {
>>>> +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = 
>>>> true },
>>>> +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>>>>    };
>>>>
>>>>    static const struct msm_dp_config sc7280_dp_cfg = {
>>>> -     .descs = (const struct msm_dp_desc[]) {
>>>> -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = 
>>>> true },
>>>> -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>>>> -     },
>>>> -     .num_descs = 2,
>>>> +     .descs = sc7280_dp_descs,
>>>> +     .num_descs = ARRAY_SIZE(sc7280_dp_descs),
>>>> +};
>>>> +
>>>> +static const struct msm_dp_desc sc8180x_dp_descs[] = {
>>>> +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> +     [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_eDP },
>>>>    };
>>>>
>>>>    static const struct msm_dp_config sc8180x_dp_cfg = {
>>>> -     .descs = (const struct msm_dp_desc[]) {
>>>> -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> -             [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_eDP },
>>>> -     },
>>>> -     .num_descs = 3,
>>>> +     .descs = sc8180x_dp_descs,
>>>> +     .num_descs = ARRAY_SIZE(sc8180x_dp_descs),
>>>> +};
>>>> +
>>>> +static const struct msm_dp_desc sm8350_dp_descs[] = {
>>>> +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>>    };
>>>>
>>>>    static const struct msm_dp_config sm8350_dp_cfg = {
>>>> -     .descs = (const struct msm_dp_desc[]) {
>>>> -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, 
>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
>>>> -     },
>>>> -     .num_descs = 1,
>>>> +     .descs = sm8350_dp_descs,
>>>> +     .num_descs = ARRAY_SIZE(sm8350_dp_descs),
>>>>    };
>>>>
>>>>    static const struct of_device_id dp_dt_match[] = {
>>
>>


-- 
With best wishes
Dmitry
