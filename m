Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792437BEC03
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFA910E1A4;
	Mon,  9 Oct 2023 20:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAAD10E1A4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 20:53:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5041cc983f9so5914416e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 13:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696884825; x=1697489625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+NsT8wiOulucIWx22N4JZ3mBmzzP+oqgix2ms+capXo=;
 b=JaAqM2NWUJpoN2u84MpeXcEzbU4DP82ttbVlzMH2oZaGLXwXb9Bq7VDGv5fbHm81QO
 osHoZFBr48DAlbpE5c3VKi3/gzdHyn5uP53wDrtkBulAk6s6EaX+tqabeWKSm4SQoHv9
 YJRqzbKrtFpDlr7jNECRWXUFlEKRHvL88n8Dwe+ENuTaNQU45f6YNvB9ULjeV5XKg92p
 /oO84tzREdlqd2TCE8p+eJMQri2sKq1g3NiOMOFFuTFBktownTolq5f5QY6Rjg/FqRO+
 JSEz637pfFgBdOFZqwvlVkQbeDWkq9zipOITK7faoiMUB1Iz4+7eZA/lQx1YNTp3tcdU
 x39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696884825; x=1697489625;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+NsT8wiOulucIWx22N4JZ3mBmzzP+oqgix2ms+capXo=;
 b=Yklutc5B2XZ+xPDRFqyn9rgLNZsqy6dvQ9ZNhXE9gfX9mFJ7U+DyP/SCPxto3Jgfxq
 amJauXtyAHIDLhCAGv/qrOSLMjAEx/P+aZZr4jGl5V6wzUjiaud/ry16FfQvT3nkMk8s
 hAd1Gfq7js8pYKdqqofV4kr1BfHxswVkSmJE9HXHzY7kcqTYAhidUr2uuvW0rtZevmpq
 i0Ao1jJlnQ9F9HZ+ZL2tNZmOqf/NeBgUH3naq7JE4k8/ytRDxHVsNqHCT5xPrIC/lAfS
 kgss4Jj+doH0dn1fOAdGQ8549IkNako0CPhcnlpxRkXyI9Tcy+egeufREeFWFnT9dAMP
 +7Jw==
X-Gm-Message-State: AOJu0YzPjV3FPTxwZDCskLFGCjlnxh/zGSS+NcDhE7ExqTlF74A+dmM/
 JFWPo3Fe4e2KbRcybPtDofxdJA==
X-Google-Smtp-Source: AGHT+IExWiGWcZpJT182d6s2keHa1ddzZaoRcYRDgsEC2X/7DnYTgcW15uIwZa3T7mY58M0PcbCPNQ==
X-Received: by 2002:a05:651c:87:b0:2bb:b626:5044 with SMTP id
 7-20020a05651c008700b002bbb6265044mr13302731ljq.6.1696884825287; 
 Mon, 09 Oct 2023 13:53:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a2e2413000000b002bcdeeecd11sm2091722ljk.66.2023.10.09.13.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 13:53:44 -0700 (PDT)
Message-ID: <8ef34ba0-f30a-45b0-991e-0a7eb573956d@linaro.org>
Date: Mon, 9 Oct 2023 23:53:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] drm/msm/hdmi: switch to devm_drm_bridge_add()
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-3-dmitry.baryshkov@linaro.org>
 <d56daed9-35ac-0ee3-a0b4-f8596b0490fc@quicinc.com>
 <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
In-Reply-To: <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 22:21, Dmitry Baryshkov wrote:
> On 09/10/2023 22:19, Abhinav Kumar wrote:
>>
>>
>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>> Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
>>> drm_bridge_add(). As the driver doesn't require any additional cleanup,
>>> stop adding created bridge to the priv->bridges array.
>>>
>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
>>>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
>>>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 ++++++++------------------
>>>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
>>>   4 files changed, 17 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> index b6bcb9f675fe..c8ebd75176bb 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> @@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>           struct drm_device *dev, struct drm_encoder *encoder)
>>>   {
>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>       int ret;
>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>> -        return -ENOSPC;
>>> -    }
>>> -
>>>       hdmi->dev = dev;
>>>       hdmi->encoder = encoder;
>>>       hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
>>> -    hdmi->bridge = msm_hdmi_bridge_init(hdmi);
>>> -    if (IS_ERR(hdmi->bridge)) {
>>> -        ret = PTR_ERR(hdmi->bridge);
>>> +    ret = msm_hdmi_bridge_init(hdmi);
>>> +    if (ret) {
>>>           DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: 
>>> %d\n", ret);
>>> -        hdmi->bridge = NULL;
>>>           goto fail;
>>>       }
>>> @@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>           goto fail;
>>>       }
>>> -    priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>>> -
>>>       return 0;
>>>   fail:
>>> -    /* bridge is normally destroyed by drm: */
>>> -    if (hdmi->bridge) {
>>> -        msm_hdmi_bridge_destroy(hdmi->bridge);
>>> -        hdmi->bridge = NULL;
>>> -    }
>>>       if (hdmi->connector) {
>>>           hdmi->connector->funcs->destroy(hdmi->connector);
>>>           hdmi->connector = NULL;
>>> @@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, 
>>> struct device *master,
>>>           if (priv->hdmi->audio_pdev)
>>>               platform_device_unregister(priv->hdmi->audio_pdev);
>>> +        if (priv->hdmi->bridge)
>>> +            msm_hdmi_hpd_disable(priv->hdmi);
>>> +
>>
>> Now is this the only place where hdmi->bridge is used?
>>
>> Why cant we just keep msm_hdmi_hpd_disable(priv->hdmi) here since its 
>> anyway protected by if (priv->hdmi) and drop hdmi->bridge completely?
> 
> Sure, sounds like a good idea, same followup as for the DSI.

I was wrong here. hdmi::bridge is used by the driver (e.g. for HPD 
reporting).

-- 
With best wishes
Dmitry

