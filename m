Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9067809FC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 12:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFA510E4B3;
	Fri, 18 Aug 2023 10:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA52810E4BB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 10:27:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe655796faso1080183e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 03:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692354453; x=1692959253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nlXT9md8080DEr+acXH0JtgYAnwZDwEyadn2+HMjFjk=;
 b=rqFLCrA7QBZzZyFNTFX3AvdJMRiZcmD2i2owtGO6Zsu/GgzatS5o1iNi/W3c5hP2CP
 XsbW1zvtmk99UBUzngmYhGGstRa2oCvZux4N2vpatLsVHDtPvl9Iz0cKutUqQcZowGt5
 lIq2CNfdnpjD82EdhL/tbbFAWmXd1QOGmEk+yPDGvSBobyWb41CTX60X6dx6wyin4mbW
 xPi/VRBcP2t/X/We7lRwCrdxz0+Q+ubtvH6S+YPzvcPfVK34ePnZv1/nb61dwlBhubeu
 csR/c5donUJDH1PVMmENMKaI13tKs9NkfaJkgf6t7VOY3PD6QzNAShjBiQOeG6vL3xEi
 wp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692354453; x=1692959253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nlXT9md8080DEr+acXH0JtgYAnwZDwEyadn2+HMjFjk=;
 b=eXtZjCOLwjd3rSFH9K3dUIjjV/JOaGuMvT+oKnkGGqT+MTsTyzIOuTDbT1UnXYAv/M
 2KwYkPcG+WXrDr/4XV2WQL77ZVAG+8qLwP4O7AeowLbg9SHmfHBlDGmJ/Bt7/pF5yU4E
 B3C/KqyxiP8r1DFMVweW+FDjZ7xQcilvXTUdiIYHqG5LzJ5hpc30cJbNtvnUrDny3fJE
 i69e5w6ID+4AvR8NcngvKeZz/mDP72hC2jpaPLj1KW/3nSVvFVaA5bj8S8YfqRBtTpKg
 FCQ8Hbrg4wxqGY95+qr6bYomrlLP3za5rnsbLd67pNfyoWcqjLD12JnB0cDcHJ2pP2Ji
 SHZw==
X-Gm-Message-State: AOJu0Yx5k1mW4JvR5UVPM2ZuuH1btRWjyFt1PeUILZXnl6bMirQqGpX9
 GGeSWaX5AQQdm8e8sXCtFqpazA==
X-Google-Smtp-Source: AGHT+IGRBJD902zrlTshk1ZqFLG8P0QkjV90cqS9tfwDLohDJLsURSx/5L5Oi+2GWp1CRXZF2WI8JA==
X-Received: by 2002:a05:6512:2513:b0:4fb:741f:75bf with SMTP id
 be19-20020a056512251300b004fb741f75bfmr916915lfb.16.1692354452718; 
 Fri, 18 Aug 2023 03:27:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q5-20020ac25a05000000b004fcdea129basm281442lfn.94.2023.08.18.03.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 03:27:32 -0700 (PDT)
Message-ID: <118d00df-131b-4ea6-98eb-bb39424ffb72@linaro.org>
Date: Fri, 18 Aug 2023 13:27:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-GB
To: neil.armstrong@linaro.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
 <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
 <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
 <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
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
Cc: quic_parellan@quicinc.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/08/2023 11:25, neil.armstrong@linaro.org wrote:
> Hi Dmitry,
> 
> On 17/08/2023 20:35, Dmitry Baryshkov wrote:
>> On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
>>> Hi Abhinav,
>>>
>>> On 14/08/2023 20:02, Abhinav Kumar wrote:
> 
> <snip>
> 
>>>
>>> Sending HS commands will always work on any controller, it's all 
>>> about LP commands.
>>> The Samsung panels you listed only send HS commands so they can use 
>>> prepare_prev_first
>>> and work on any controllers.
>>
>> I think there is some misunderstanding there, supported by the 
>> description of the flag.
>>
>> If I remember correctly, some hosts (sunxi) can not send DCS commands 
>> after enabling video stream and switching to HS mode, see [1]. Thus, 
>> as you know, most of the drivers have all DSI panel setup commands in 
>> drm_panel_funcs::prepare() / drm_bridge_funcs::pre_enable() callbacks, 
>> not paying attention whether these commands are to be sent in LP or in 
>> HS mode.
>>
>> Previously DSI source drivers could power on the DSI link either in 
>> mode_set() or in pre_enable() callbacks, with mode_set() being the 
>> hack to make panel/bridge drivers to be able to send commands from 
>> their prepare() / pre_enable() callbacks.
>>
>> With the prev_first flags being introduced, we have established that 
>> DSI link should be enabled in DSI host's pre_enable() callback and 
>> switched to HS mode (be it command or video) in the enable() callback.
>>
>> So far so good.
> 
> It seems coherent, I would like first to have a state of all DSI host 
> drivers and make this would actually work first before adding the 
> prev_first flag to all the required panels.
> 
>>
>> Unfortunately this change is not fully backwards-compatible. This 
>> requires that all DSI panels sending commands from prepare() should 
>> have the prepare_prev_first flag. In some sense, all such patches 
>> might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first 
>> flag to drm_panel").
> 
> This kind of migration should be done *before* any possible regression, 
> not the other way round.
> 
> If all panels sending commands from prepare() should have the 
> prepare_prev_first flag, then it should be first, check for regressions 
> then continue.
> 
> <snip>
> 
>>>
>>> I understand, but this patch doesn't qualify as a fix for 
>>> 9e15123eca79 and is too late to be merged in drm-misc-next for v6.6,
>>> and since 9e15123eca79 actually breaks some support it should be 
>>> reverted (+ deps) since we are late in the rc cycles.
>>
>> If we go this way, we can never reapply these patches. There will be 
>> no guarantee that all panel drivers are completely converted. We 
>> already have a story without an observable end - 
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> I don't understand this point, who would block re-applying the patches ?

Consider us reverting 9e15123eca79 now and then reapplying it next 
cycle. Then another panel / bridge that was not converted to use 
pre_enable_prev_first pops up. And suddently we have to revert them again.

> The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over multiple 
> Linux version and went smoothly because we reverted
> regressing patches and restarted when needed, I don't understand why we 
> can't do this here aswell.

With DRM_BRIDGE_ATTACH_NO_CONNECTOR both host and peripheral drivers 
were involved. This way they share knowledge about the migration state.

With prev_first we do not have such shared knowledge. Host assumes that 
it can work according to the documentation: turn DSI link to LP-11 in 
pre_enable(), switch to HS in enable(). It can not check whether the 
next bridge did not set pre_enable_prev_first because of it not being 
required (like for the Parade bridge) or because next bridge is not 
converted yet (and thus DSI host should power up the link in 
atomic_mode_set).

Granted that there is no way for the DSI host driver to attune itself to 
the DSI peripheral driver requirements, I can only consider 
corresponding (requiring prev_first) panel drivers broken since 
5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel") and 
all bridge drivers with this issue broken since 4fb912e5e190 
("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order").

> 
>>
>> I'd consider that the DSI driver is correct here and it is about the 
>> panel drivers that require fixes patches. If you care about the 
>> particular Fixes tag, I have provided one several lines above.
> 
> Unfortunately it should be done in the other way round, prepare for 
> migration, then migrate,
> 
> I mean if it's a required migration, then it should be done and I'll 
> support it from both bridge and panel PoV.
> 
> So, first this patch has the wrong Fixes tag, and I would like a better 
> explanation on the commit message in any case.
> Then I would like to have an ack from some drm-misc maintainers before 
> applying it because it fixes a patch that
> was sent via the msm tree thus per the drm-misc rules I cannot apply it 
> via the drm-misc-next-fixes tree.
> 
> Neil
> 
> <snip>
> 

-- 
With best wishes
Dmitry

