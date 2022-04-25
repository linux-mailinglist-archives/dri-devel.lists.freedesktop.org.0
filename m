Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EAA50EB1F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDA410E25C;
	Mon, 25 Apr 2022 21:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131CF10E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 21:12:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w19so28466017lfu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=n48UC8FYBgza6LVhcnu3WqzBBzGR0TUqYOXWNSGJNhA=;
 b=NH4maRhQqGMoN/cZAlAaVgXCc/h1NJVTKr8F0GqK2f8ubsZMl5exb0+1Pt4QRMKgg0
 AYUnTGmzTKIb3XBcHuUVxyDZACSd0xMzNm2eH5moaKl8WolVTJO/Y/dyEo2jDXCPr9a+
 y/6FIg3Nyp8fupRVie1iD6axXOMvzsZzzZLyhJMfWKDA4Q7A5msr07uvlTkaMP90b5yp
 JegglGvQ5rDlYD519GW/1BkBSsJJRIx12rxtN/ySXsP47PQ97e56NX9M+jJd4+r2fLFF
 tVYHv0gQHpwX4pOLAj+krJiRGHPiarefgMG3xVWcRrBwIDkgeQKeCoNucZ1CwuAt6FJ5
 v3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n48UC8FYBgza6LVhcnu3WqzBBzGR0TUqYOXWNSGJNhA=;
 b=GdoN4jvpTw6WxCGPLC0ShqB7F+jje+CFByFHBhp7xqK9/VYDrK8aSlj7XOLwDZbKY+
 Y6sWiQmWg5aeQgexlNhcfstp7FGqVjibyHaypZGhy9Vo5nFziHJlbpvLkgaENDgX61cl
 r87TPgBORWej5JpNTrMDcs3qFrGkCBxEsUioUcrviR6t+4HudxIqKSs3FJGPnJLgu0Qy
 iS2/9j58RGE/5562Y76it9WPmSpesOySuXWrv1iW5PdAGgwY8xAm/be8hYbp4bVjmZFG
 G4mxJyo0xFw98GfsJ9kgwYnK+Py2F/Wh60dJn5SPtZ4wnk/Jj48lYaPmJ9EO/t/yLUjT
 RGfg==
X-Gm-Message-State: AOAM532fF6uNiG6JI1er1jXBC2z6bLKiuN6WKBA2Jn3mMUuZVcuNMEQh
 u8u+Hl/mWEiTzEuSePaS49qjid28geHYqA==
X-Google-Smtp-Source: ABdhPJwzna+WG3O2iW9VkiovidbQKqbuLtVxXaL1TUSZEFmS83MEMFZt8wBnv/+oE2d5HSXwHkMtqQ==
X-Received: by 2002:a19:674c:0:b0:448:3f49:e6d5 with SMTP id
 e12-20020a19674c000000b004483f49e6d5mr14477854lfj.518.1650921136308; 
 Mon, 25 Apr 2022 14:12:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a19670b000000b0044a385058acsm1522365lfc.187.2022.04.25.14.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:12:15 -0700 (PDT)
Message-ID: <664de9f0-a9a1-9b5e-9612-06a051c85434@linaro.org>
Date: Tue, 26 Apr 2022 00:12:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n51VBDmOOworjpuB1nqVD-7055yqvn2Er5H13qgFC5R2AQ@mail.gmail.com>
 <MW4PR02MB7186108BA0131C8BFC46A219E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n51oUFkYuZ5qd2CbnaUGo2xcAjU+F0M+Kptk8b=7curH0Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51oUFkYuZ5qd2CbnaUGo2xcAjU+F0M+Kptk8b=7curH0Q@mail.gmail.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, "steev@kali.org" <steev@kali.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2022 23:26, Stephen Boyd wrote:
> Quoting Sankeerth Billakanti (QUIC) (2022-04-25 02:39:43)
>> Hi Stephen,
>>
>>> Quoting Sankeerth Billakanti (2022-04-22 02:11:03)
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index d7a19d6..055681a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>
>>> Some nitpicks
>>>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>
>>>> @@ -1508,7 +1509,8 @@ void msm_dp_irq_postinstall(struct msm_dp
>>>> *dp_display)
>>>>
>>>>          dp_hpd_event_setup(dp);
>>>>
>>>> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>>>> +       if (!dp_display->is_edp)
>>>> +               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>>>
>>> Did it turn out that in fact DP isn't ready still to setup even after delaying the
>>> irq?
>>>
>>
>> The host_init, config_hpd, phy_init and enable_irq are happening in modeset_init already for eDP.
>> So, I am not scheduling the EV_HPD_INIT_SETUP event for eDP. I am not modifying the delay for DP.
> 
> Cool. That didn't answer my question though. Why does DP still need the
> delay? I thought recent changes made it unnecessary.

I'd say that if it is not necessary, it should be changed in the 
separate commit. The question is valid nevertheless.


-- 
With best wishes
Dmitry
