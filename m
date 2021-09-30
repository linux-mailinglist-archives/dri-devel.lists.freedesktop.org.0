Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819DE41E2A3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 22:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57886E462;
	Thu, 30 Sep 2021 20:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D91B6EC68
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 20:20:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v17so12002939wrv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=498LPkH4Nb6HbpN3dLoVr/vBONswYBBw5ue0vyNDRvI=;
 b=sMhtUwruXOyJZn2fDxnyX3+v2mNpf3hIbtFmvxWrbeAgH8ik+FRE9CJVcS+CPtg4a2
 f8hyMOcyVA8sbGIIO7E9SoFuwi3+FYQoqFla5XHmvCT6u6xSH6Gk+UFXUFXAIVGUgl0I
 Jp9whRs5hhprrmxGI5poYcKgqo7AOJcb3aDTEfM3ZlfVr5Et5pBL/hgVzmKdwGNsd64+
 MQ7NSayuqLd7LHCwvOKZ9WbGd5UdJmChkz7RMXqm5ssqnamUoEJ3El1YPCN2pTtvc2yD
 kFpaY5Z+ORItx4cV5uZvyYb5Kf0Zaov34n9Aa6S9uEnBJmQQUDNUwcOzI77dX11FFIL4
 bbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=498LPkH4Nb6HbpN3dLoVr/vBONswYBBw5ue0vyNDRvI=;
 b=qUYRaEYRe90GHI+eO2iHfaUuWctAFAWGXMvdWrSe7J2yb3S3/BpmjXg10Nj2jOj40o
 z+RtikQhVoO6cSPYB3LiI6BLF3f/Zuv32WIVul31ZalZ56+j45q9Lrv3bzmv6Bo+rudw
 zFgu4zSQruBIqGpYQh7n8VwXTk+rJc0IftjyJfiEGSOLfGnO4Dcw+3OqapHp4Wi8SuDu
 CRAnhRhY/Q0DCtRJ5aQEAJfBHdnK/1FxtuvtZf+A945XP50m6UdqGSxpzhlAlSU4A7Ue
 bi0R0d9bjsCC8A5VvwvPARvLvOU7tPR4oEU01/c2mkN9lW9YCWRAyATOeQ6laVf5oiQ9
 LxMQ==
X-Gm-Message-State: AOAM5320qKpOjDSfObMRFt0rryXkjVVusV7YTUUUp0rfvCr0xhd0gq40
 KzDGRps2dg3JEihPdhTeuJHZaA==
X-Google-Smtp-Source: ABdhPJxhz8iWM9UY3qGxY1zsVr08xvko8HAZeg4iYl/l4ntzdnbIG4I3UJSrJH6N/YFj2uMGiYvQEw==
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr8224593wrx.303.1633033255681; 
 Thu, 30 Sep 2021 13:20:55 -0700 (PDT)
Received: from [192.168.0.30]
 (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
 by smtp.gmail.com with ESMTPSA id c132sm5830516wma.22.2021.09.30.13.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 13:20:54 -0700 (PDT)
Message-ID: <b57fbc24-9ef3-a57b-17d4-2cb33fb409d4@linaro.org>
Date: Thu, 30 Sep 2021 21:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order
 consistent
Content-Language: en-US
To: Amit Pundir <amit.pundir@linaro.org>, Rob Clark <robdclark@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
 <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
 <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
 <YXiZIuao6wNch7j-D3ZktdSR3_IRAQ3oSeL8sLCCX8lEhwsoWaouE6_eV6C2Zv9r2_dww_Mtal18UBJfc4fz4g==@protonmail.internalid>
 <CAMi1Hd0sUUFvNzYwt29af9d99o1-x+LiXBPCrQ8=9H0tHvxVHg@mail.gmail.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CAMi1Hd0sUUFvNzYwt29af9d99o1-x+LiXBPCrQ8=9H0tHvxVHg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 30/09/2021 20:49, Amit Pundir wrote:
> On Thu, 30 Sept 2021 at 04:50, Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Wed, Sep 29, 2021 at 2:51 PM John Stultz <john.stultz@linaro.org> wrote:
>>>
>>> On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org> wrote:
>>>> On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> wrote:
>>>>> On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
>>>>>> The best practice to avoid those issues is to register its functions only after
>>>>>> all its dependencies are live. We also shouldn't wait any longer than we should
>>>>>> to play nice with the other components that are waiting for us, so in our case
>>>>>> that would mean moving the DSI device registration to the bridge probe.
>>>>>>
>>>>>> I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
>>>>>> would be affected by this and wouldn't probe anymore after those changes.
>>>>>> Exynos and kirin seems to be simple enough for a mechanical change (that still
>>>>>> requires to be tested), but the changes in msm seemed to be far more important
>>>>>> and I wasn't confortable doing them.
>>>>>
>>>>>
>>>>> Hey Maxime,
>>>>>    Sorry for taking so long to get to this, but now that plumbers is
>>>>> over I've had a chance to check it out on kirin
>>>>>
>>>>> Rob Clark pointed me to his branch with some fixups here:
>>>>>     https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
>>>>>
>>>>> But trying to boot hikey with that, I see the following loop indefinitely:
>>>>> [    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
>>>>> [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
>>>>> [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
>>>>> [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
>>>>> [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
>>>>> [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
>>>>> [    4.681898] adv7511 2-0039: failed to find dsi host
>>>>
>>>> I just realized Rob's tree is missing the kirin patch. My apologies!
>>>> I'll retest and let you know.
>>>
>>> Ok, just retested including the kirin patch and unfortunately I'm
>>> still seeing the same thing.  :(
>>>
>>> Will dig a bit and let you know when I find more.
>>
>> Did you have a chance to test it on anything using drm/msm with DSI
>> panels?  That would at least confirm that I didn't miss anything in
>> the drm/msm patch to swap the dsi-host vs bridge ordering..
> 
> Hi, smoke tested
> https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> on Pocophone F1 (sdm845 / A630) with v5.15-rc3. I see no obvious
> regressions in my limited testing so far including video (youtube)
> playback.
Tested on the OnePlus 6 too booting AOSP, works fine. This *fixes* FBDEV_EMULATION (so we can get a working framebuffer 
console) which was otherwise broken on 5.15.

However it spits out some warnings during boot: https://p.calebs.dev/gucysowyna.yaml


> 
>>
>> BR,
>> -R

-- 
Kind Regards,
Caleb (they/them)
