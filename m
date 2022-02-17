Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0924B9517
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0A610E6C4;
	Thu, 17 Feb 2022 00:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EEF10E6CB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:40:06 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id o6so5899347ljp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=irfOfdSIE9rR3XmORLk7Bf5d4a0WcfMYhHYf+s3tbSs=;
 b=AILDcMvPG9itOtC+CSIt/42wtECc07XURtltr7tN1l6iwwVFUcer9QlOidGe1bE6Oo
 lJ3mxg5ho54gQsy4Y/h37a+rnbQJbxMwwHw4jUe4/O069PV3zrcMlH0VyS+hnJCf0p/V
 URQ3OT2qwI+4bahYujfrfw5Vrmj2Zs8/ybeC+XbUjCDSXju+aZRbUbxsyKVEaPewEZnz
 3fJwD7K39V77Cc5eE+fYj1bxFEellkt8bIitHmWKG0BYzfcebAK5JXISaKBQhEC5kyl4
 LUQ47gj+LjKBylW4dOtUv3SufxPxUbos5KcWkY4qz17jlaQivgaVkUA8SAleUnizDbjX
 XZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=irfOfdSIE9rR3XmORLk7Bf5d4a0WcfMYhHYf+s3tbSs=;
 b=HOtx66HQBpWYpQRfB52e203JXte1Sc/i8LVFNjI0Tu6bYXMgvFbYGentnqc3rTNJk6
 zqiWZ+yiIcGpvHn65y2/5kUtFe8H/GVizdcKTL9i0FpifQbnsmWFoiRVar1yUuHpg2lH
 A4OsLwUWjxXfz6zuG43Qj82K4O661ltx8NaDAlpfZgIj6AY23GNuV7b4t+L9ZpWDbYtQ
 4UBt8aHbp/jPgvm35QObJj8qQTTnlkuP3mpw/VzurOLCZ5sF2Ns+uxFCSxsOuNurgO5s
 8MtfvMg/LqwzoR/PJuLJGmaBy8l4NvIcwO80JXZCUriLl/zuH3dmVz4ZQ3/3qvDVu/h2
 LCXw==
X-Gm-Message-State: AOAM532hFnXv0Rjaae8RAZQRbXxhCj4jKj6Pp/g5ja+cmz2lF5mh8sfq
 3XXFaAtEgFIz37rcfEq0/LJ3ww==
X-Google-Smtp-Source: ABdhPJzv0HhA2eC9Ca8TvfoEl3imb6op8FIsLTF5dy8X5bvs6IGsJDWqpBElKJJ5mKwrc8q714fGLg==
X-Received: by 2002:a2e:9c15:0:b0:23f:96fa:4b96 with SMTP id
 s21-20020a2e9c15000000b0023f96fa4b96mr426058lji.293.1645058404997; 
 Wed, 16 Feb 2022 16:40:04 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l18sm4966807ljc.11.2022.02.16.16.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 16:40:04 -0800 (PST)
Message-ID: <8aeec164-836b-d964-3b40-fb0874612250@linaro.org>
Date: Thu, 17 Feb 2022 03:40:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd
 <swboyd@chromium.org>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 vkoul@kernel.org
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
 <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n534MH7ih4nKbjY5EewcZ0J73Zp_A=Q-CJ0M_z3nWoVaVQ@mail.gmail.com>
 <f480811d-3e82-a6c7-1e57-fabe51604f9b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f480811d-3e82-a6c7-1e57-fabe51604f9b@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2022 03:22, Kuogee Hsieh wrote:
> 
> On 2/16/2022 3:46 PM, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2022-02-02 10:56:39)
>>
>> Please add some commit text
>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++++------
>>>   drivers/gpu/drm/msm/dp/dp_catalog.c |  34 +++++++-----
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 106 
>>> +++++++++++++++++++-----------------
>>>   drivers/gpu/drm/msm/dp/dp_display.c |  68 +++++++++++++----------
>>>   drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>>>   drivers/gpu/drm/msm/dp/dp_link.c    |  99 
>>> +++++++++++++++++++--------------
>>>   drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++++------
>>>   drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>>>   drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>>>   9 files changed, 246 insertions(+), 179 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c 
>>> b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> index d7e4a39..4fbbe0a 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> @@ -136,7 +136,8 @@ static void dp_audio_stream_sdp(struct 
>>> dp_audio_private *audio)
>>>          parity_byte = dp_audio_calculate_parity(new_value);
>>>          value |= ((new_value << HEADER_BYTE_1_BIT)
>>>                          | (parity_byte << PARITY_BYTE_1_BIT));
>>> -       DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 
>>> 0x%x\n",
>>> +       drm_dbg_dp((struct drm_device *)NULL,
>> Why can't we pass the platform device pointer? Surely the cast is not
>> necessary and in fact harmful.
> 
> Platform device only available at top level (dp_display.c), other level 
> has no access to platform device or drm_device.

You can pass the platform device (or even better, drm device) to other 
driver blocks too. It's not something to be kept in secret in 
dp_display.c only.

> 
> I will just apss NULL, such as  drm_dbg_dp(NULL, ...), if not device 
> available.



-- 
With best wishes
Dmitry
