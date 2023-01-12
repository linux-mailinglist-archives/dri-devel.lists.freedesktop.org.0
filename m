Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9425666DF0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5031110E8AE;
	Thu, 12 Jan 2023 09:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D3710E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:19:07 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j17so27554883lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fYbDISTr9eXrsREhDp4FdSJ0+u1GwHTxxGi/PTMxcqk=;
 b=Sqd/9fILAjLUJ+6r1o5sm0QbuGqMq8HiJ1jly2+sWxYgFjlWzWE4MBH9Wwt9aAe9dM
 rXEZvW1mXXgJFUMxvYWoUbaW5A7ZeAl7Zv172yqmpQAdUmdOoNlpNtlJFsNXICw7T/Jw
 OuimNTXUuGatWG/RAIuyUxmQst+zWejJa17cWSVsT528MKWhzt7aF+5P4D5qL7MFjMrP
 qPTp+BE+DxyC4Y+y4ENZuBkYNZ/ptfBtO7czw4AsU9QVxUv3DGyMmu5wtVybpN08FgP4
 is8X1hWp0wGjfbhU7yT4Pi8PJ7LcCUZ1RJCYJANB9UMkNYmdacUG4Pi42XH3eYA6+nBq
 DXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fYbDISTr9eXrsREhDp4FdSJ0+u1GwHTxxGi/PTMxcqk=;
 b=QH5cq+nd/aK96YB/HMu7U4JKrRKYPIZqSpQJg0E+ca/1L49GQLiuvEI98I+QGQHaTl
 c59wQB3BnnhKA6jg6nMJPPEWOjv8dQcrA+CMAm9wliS6o7vmKFuDWbNnwMoTNI4WufL1
 1qcWBiEiW58x53Ta7yZYsuGRN04hRlFkart+RT2jEIBoozeaUtenuNncMzZWArKxuMFL
 C8yPO/8DiM0cV8YcpO2lLaDhQFZJmE8mMnunPQRd+2JSNbogG4XZfuJipAwGES8m9LyO
 x0oP1H1eTxax+Ox4u42MUQ7GoItlYWU0Io7KKmrwj6lJrV+iDfFaNbY70J8gnOeQVIVO
 Lkrw==
X-Gm-Message-State: AFqh2krgmg1VnZM0VrtlHGT89vLxWdq1Hf455dlZIhj3mcI1kP3QdMj1
 68qY2jKlksV10k9Kj0mPQGlGgA==
X-Google-Smtp-Source: AMrXdXsAApGOAAvBmw3i04nuOTkmkI4zSUWCrhXcgxdfaIUXMXhGPe8/ynUxGarQTFN2TAyNrLHtNw==
X-Received: by 2002:a05:6512:3a8f:b0:4a4:68b8:f4e1 with SMTP id
 q15-20020a0565123a8f00b004a468b8f4e1mr23549392lfu.39.1673515146092; 
 Thu, 12 Jan 2023 01:19:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a056512314300b0048a9e899693sm3214245lfi.16.2023.01.12.01.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:19:05 -0800 (PST)
Message-ID: <930f3f32-c391-dacc-71d0-7b3dc5b81095@linaro.org>
Date: Thu, 12 Jan 2023 11:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 12/13] drm/bridge: lt9611: stop filtering modes via the
 table
Content-Language: en-GB
To: neil.armstrong@linaro.org, Vinod Koul <vkoul@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-13-dmitry.baryshkov@linaro.org>
 <c03235b1-85d1-1e55-b8c2-9a553887145f@linaro.org>
 <1b29bbef-1ee3-654c-bb58-c8fcf3b876a0@linaro.org>
 <c0ab0802-bced-34ac-c25f-f80ef17d7a41@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c0ab0802-bced-34ac-c25f-f80ef17d7a41@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2023 10:43, neil.armstrong@linaro.org wrote:
> On 11/01/2023 16:37, Dmitry Baryshkov wrote:
>> On 11/01/2023 12:57, Neil Armstrong wrote:
>>> On 08/01/2023 17:56, Dmitry Baryshkov wrote:
>>>> The lt9611 bridge can support different modes, it makes no sense to 
>>>> list
>>>> them in the table. Drop the table and check the number of interfaces
>>>> using the fixed value.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/bridge/lontium-lt9611.c | 41 
>>>> +++----------------------
>>>>   1 file changed, 4 insertions(+), 37 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c 
>>>> b/drivers/gpu/drm/bridge/lontium-lt9611.c
>>>> index 82af1f954cc6..df9f015aa3a0 100644
>>>> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
>>>> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
>>>> @@ -84,24 +84,6 @@ static const struct regmap_config 
>>>> lt9611_regmap_config = {
>>>>       .num_ranges = ARRAY_SIZE(lt9611_ranges),
>>>>   };
>>>> -struct lt9611_mode {
>>>> -    u16 hdisplay;
>>>> -    u16 vdisplay;
>>>> -    u8 vrefresh;
>>>> -    u8 lanes;
>>>> -    u8 intfs;
>>>> -};
>>>> -
>>>> -static struct lt9611_mode lt9611_modes[] = {
>>>> -    { 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
>>>> -    { 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
>>>> -    { 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
>>>> -    { 1920, 1080, 24, 3, 1 },
>>>> -    { 720, 480, 60, 4, 1 },
>>>> -    { 720, 576, 50, 2, 1 },
>>>> -    { 640, 480, 60, 2, 1 },
>>>> -};
>>>> -
>>>>   static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
>>>>   {
>>>>       return container_of(bridge, struct lt9611, bridge);
>>>> @@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct 
>>>> lt9611 *lt9611)
>>>>       return 0;
>>>>   }
>>>> -static struct lt9611_mode *lt9611_find_mode(const struct 
>>>> drm_display_mode *mode)
>>>> -{
>>>> -    int i;
>>>> -
>>>> -    for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
>>>> -        if (lt9611_modes[i].hdisplay == mode->hdisplay &&
>>>> -            lt9611_modes[i].vdisplay == mode->vdisplay &&
>>>> -            lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
>>>> -            return &lt9611_modes[i];
>>>> -        }
>>>> -    }
>>>> -
>>>> -    return NULL;
>>>> -}
>>>> -
>>>>   static enum drm_connector_status lt9611_bridge_detect(struct 
>>>> drm_bridge *bridge)
>>>>   {
>>>>       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>>>> @@ -832,12 +799,12 @@ static enum drm_mode_status 
>>>> lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>>>>                                const struct drm_display_info *info,
>>>>                                const struct drm_display_mode *mode)
>>>>   {
>>>> -    struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
>>>>       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>>>> -    if (!lt9611_mode)
>>>> -        return MODE_BAD;
>>>> -    else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
>>>> +    if (mode->hdisplay >= 3840 && drm_mode_vrefresh(mode) >= 31)
>>>
>>> Isn't 31 a typo ?
>>
>> Maybe I should change that to drm_mode_vrefresh(mode) > 30. The chip 
>> supports 3840x2160-30, but doesn't promise to support anything above 
>> that.
> 
> Yep >= 31 is valid, but > 30 seems more logical.
> 
> Concerning the hdisplay check, shouldn't be separate ?
> 
> You should switch to:
> if (mode->hdisplay > 3840)
>     return MODE_BAD_WIDTH;
> 
> if (mode->hdisplay == 3840 && drm_mode_vrefresh(mode) > 30)
>     return MODE_CLOCK_HIGH;

Good idea, I'll adapt it for v3.

> 
> Isn't there limits on vdisplay aswell ?

I don't see any special limit in the datasheet. HDMI 1.4, 4k@30, that's 
all. I think I'll just add vdisply > 2160 check next to hdisplay.

> 
> Neil
> 
>>
>>>
>>>> +        return MODE_CLOCK_HIGH;
>>>> +
>>>> +    if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
>>>>           return MODE_PANEL;
>>>>       else
>>>>           return MODE_OK;
>>>
>>
> 

-- 
With best wishes
Dmitry

