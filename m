Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707CA74BE4F
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 17:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8422C10E136;
	Sat,  8 Jul 2023 15:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F12E10E0F3
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 15:53:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso4753082e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688831608; x=1691423608;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1i4dVOYoOCE6fErhT+TFOHlRPq28nDs1UxaxtQ61A5U=;
 b=dIaDGGjr0HMvZPMnT/iOgNtZe9/kKDOalCAWVptidowD/WgB2hTwaqC/XGdDCKd7AL
 nzM0sGaluJiRP8QJ+a1SfAQJYbGvOdJYTDLEUiS+qzQ9xvayWwmhR6Ee/KS77eeE+ilB
 wKUsjR6cuNabWqApOzjjeHJ0gWRnzwMJXFsM778jY7k+NF4jfxLzZpEbpQR+K+DcEORf
 jFkZ3yl58T9e5vtGYLOAfRt7E0t2JgXpYhP8bbTva2/49Gucld7mMtGZki8Mr9ZncbVH
 Nlz23E++ZmoUnb2xgUi7BkhTwzbYYiXE0JEvpkEKf8yynzQafe2qf3NFnhR9j3h0Dx7/
 THsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688831608; x=1691423608;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1i4dVOYoOCE6fErhT+TFOHlRPq28nDs1UxaxtQ61A5U=;
 b=HoVquX4jcMQo75A4rW6vlH6lYWzPnf5hj4Z9++o4B4Xpe2nEdKoRBMPAu3mL4BV07g
 zcuim6Ar08TPiBgJWMVVoxbHbhRk+TLPZb2QJEcbFwxdzfgb7OxF9Ats9DBfBPtE6Ml6
 lUj577nvKHR/1J+Ekre2qHSbCkRleBZ+cGPfwNNCl7l7HpQzQUas9hqO/rWU5Va6y9hd
 IoK2kTSGwE9zLQWi4d/mrP42M9mVvQGkRBua5QDH0C3QQQhjXLxCElm0IGgxJ4wnD7mP
 QP3tn3i9/DEsN8/veMaK4q9mhtP2bwg4+K5J9IrOoddCi0zXnxtlfQryeKdoJ+IRIE6S
 TibA==
X-Gm-Message-State: ABy/qLYff3OqvvjNqKnqT4T/wJKM+voxY7kz5sqqgl4LQQD22PLztr3E
 UNiF5XjShZ6fevpBIHlzeCH3vQ==
X-Google-Smtp-Source: APBJJlFN4zfqVFPE5XoskdieGcmbU1lnFBIbXZR4Mp+4IMZH+KMBNg6mMdjlMq24uJMuvfwjB4MK0A==
X-Received: by 2002:a05:6512:32b7:b0:4f8:7897:55e6 with SMTP id
 q23-20020a05651232b700b004f8789755e6mr5349985lfe.45.1688831608430; 
 Sat, 08 Jul 2023 08:53:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r6-20020ac252a6000000b004fb8c31c8desm1045804lfm.208.2023.07.08.08.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 08:53:27 -0700 (PDT)
Message-ID: <4bc710b1-f361-c525-7692-1dc275ec9bb7@linaro.org>
Date: Sat, 8 Jul 2023 18:53:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-GB
To: Marek Vasut <marex@denx.de>, neil.armstrong@linaro.org,
 Amit Pundir <amit.pundir@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <800f9e1a-cb66-5bf5-d225-ef338c1c1584@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <800f9e1a-cb66-5bf5-d225-ef338c1c1584@denx.de>
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
Cc: Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2023 18:40, Marek Vasut wrote:
> On 7/7/23 10:47, Neil Armstrong wrote:
>> On 07/07/2023 09:18, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 06/07/2023 11:20, Amit Pundir wrote:
>>>> On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>
>>>>> [Adding freedreno@ to cc list]
>>>>>
>>>>> On Wed, 5 Jul 2023 at 08:31, Jagan Teki 
>>>>> <jagan@amarulasolutions.com> wrote:
>>>>>>
>>>>>> Hi Amit,
>>>>>>
>>>>>> On Wed, Jul 5, 2023 at 10:15 AM Amit Pundir 
>>>>>> <amit.pundir@linaro.org> wrote:
>>>>>>>
>>>>>>> Hi Marek,
>>>>>>>
>>>>>>> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>>>>>>>>
>>>>>>>> Do not generate the HS front and back porch gaps, the HSA gap and
>>>>>>>> EOT packet, as these packets are not required. This makes the 
>>>>>>>> bridge
>>>>>>>> work with Samsung DSIM on i.MX8MM and i.MX8MP.
>>>>>>>
>>>>>>> This patch broke display on Dragonboard 845c (SDM845) devboard 
>>>>>>> running
>>>>>>> AOSP. This is what I see
>>>>>>> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
>>>>>>> Reverting this patch fixes this regression for me.
>>>>>>
>>>>>> Might be msm dsi host require proper handling on these updated
>>>>>> mode_flags? did they?
>>>>>
>>>>> The msm DSI host supports those flags. Also, I'd like to point out
>>>>> that the patch didn't change the rest of the driver code. So even if
>>>>> drm/msm ignored some of the flags, it should not have caused the
>>>>> issue. Most likely the issue is on the lt9611 side. I's suspect that
>>>>> additional programming is required to make it work with these flags.
>>>>
>>>> I spent some time today on smoke testing these flags (individually and
>>>> in limited combination) on DB845c, to narrow down this breakage to one
>>>> or more flag(s) triggering it. Here are my observations in limited
>>>> testing done so far.
>>>>
>>>> There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
>>>> alone and system boots to UI as usual.
>>>>
>>>> MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in the
>>>> screenshot[1] shared earlier as well.
>>>>
>>>> Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
>>>> MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
>>>> with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
>>>> display as reported.
>>>>
>>>> In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
>>>> added in this commit break the display on DB845c one way or another.
>>>
>>> I think the investigation would be to understand why samsung-dsim 
>>> requires
>>> such flags and/or what are the difference in behavior between MSM DSI 
>>> and samsung DSIM
>>> for those flags ?
>>>
>>> If someone has access to the lt9611 datasheet, so it requires 
>>> HSA/HFP/HBP to be
>>> skipped ? and does MSM DSI and samsung DSIM skip them in the same way ?
> 
> I don't have the LT9611 datasheet, no.

I also don't have an lt9611 datasheet, unfortunately. I was using the 
existing third-party drivers as a source.

> 
> The MX8M DSI (samsung-dsim) skips the HSA/HFP/HBP completely (see 
> i.MX8MP RM 13.6.2.7.2 RGB Interface , there is infographics on the 
> following pages).

Do you know, why did you have to disable HPB/HSA/HFP on your platform? 
What was the result otherwise?

> 
>> I think there's a mismatch, where on one side this flags sets the link 
>> in LP-11 while
>> in HSA/HFP/HPB while on the other it completely removes those blanking 
>> packets.
>>
>> The name MIPI_DSI_MODE_VIDEO_NO_HBP suggests removal of HPB, not LP-11 
>> while HPB.
>> the registers used in both controllers are different:
>> - samsung-dsim: DSIM_HBP_DISABLE_MODE
>> - msm dsi: DSI_VID_CFG0_HBP_POWER_STOP
>>
>> The first one suggest removing the packet, while the second one 
>> suggests powering
>> off the line while in the blanking packet period.
>>
>> @Abhinav, can you comment on that ?
>>
>> @Jagan, Andrezej So you have any documentation on what 
>> DSIM_xxx_DISABLE_MODE does ?
> 
> See above, i.MX8M M/N/P uses the samsung-dsim block .
> 
>> @Dmitry, so you have access to the lt9611 datasheet to know what's 
>> needed here ?
> 
> [...]

-- 
With best wishes
Dmitry

