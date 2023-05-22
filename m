Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5CC70BFFD
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8A610E330;
	Mon, 22 May 2023 13:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8625410E330
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:47:20 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f3af4295ddso3622623e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 06:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684763238; x=1687355238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BEm06L/7RszwTIxy7pZPEut/9V9YOp9nD/0czZj6vfg=;
 b=qspBx3gPki+B/6OIlBL+/7rh81kgid9ZjuEPUTdGBfHWkhsgiYeag/dvITBGiPSh1e
 CtHpklW80UGUb+vB9V86s3hKhhoJNxDxud2VmrA5IE88VG8UnnwzAX3kgoF7kkWBv9Jz
 8pLxhBA0imSQOkFB+FaM28GXUAqHo1KN9YY2C+fFsyJagKWtyU6uC/t1oPLjdyldwN3+
 h2WnRYyuExTMMhRhbmqMYkAORscjl6KXw0N5yaT+gDb2Lzx8NKVFeFv39ofDf7MaH//a
 zIHPG/1YnrNz1cz1QYsKp0PvTZ+hXwlJ+VGmmm6mFzIdmHQ75tNWr/8FQXKHGEeMWl0E
 gszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684763238; x=1687355238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BEm06L/7RszwTIxy7pZPEut/9V9YOp9nD/0czZj6vfg=;
 b=Vu5IFfYyiCirfswU9IqM0dyV3ozrV4vUTrRLU5JMBVUl+Zb+YOq8j+BIa3mg4VW11V
 CoD7dPghDE6ub21mIOF+Ndxspicg4v46CPlMd+uSk4KaqAXFKAemAVIgKeXqHj/WnAbA
 uddJJPRYLJS7yx2NxPw7Jlv+eWm1J0R7nfGMkUflKebDsXFU3cr3n+4pEg0tV65tYViN
 QBtBXHuN4MP9KpqSz+74bmerW4u7tRRMXlbDaTEg7iPoI322+SvM5q6d3kVp4JdDLPf9
 +13FshsHkSNwbwZJrGlWY2GAXnyGb+yBCxUxrDN5hIVeo8Q3vZpHq59AuDHpEXtaI9X9
 fNGQ==
X-Gm-Message-State: AC+VfDwqZG13oZ6QpvGSeZvld5Mq3AqON21DRT7bM6xILHxqZwi8rn6+
 Y1vyI3h7idRiZEEaaeh97Mz7zA==
X-Google-Smtp-Source: ACHHUZ554G38stoHAuoE6L5jFwpgLt44bq7oflbiqDD8iP07EyugQUr3QL7/ePqCIUhz7TIxfRodCA==
X-Received: by 2002:ac2:539a:0:b0:4cc:96f8:f9c6 with SMTP id
 g26-20020ac2539a000000b004cc96f8f9c6mr3451737lfh.5.1684763238295; 
 Mon, 22 May 2023 06:47:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x14-20020ac259ce000000b004f13bd73419sm996412lfn.38.2023.05.22.06.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 06:47:17 -0700 (PDT)
Message-ID: <2e17e84d-aced-1f28-990f-689c8c56ce45@linaro.org>
Date: Mon, 22 May 2023 16:47:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Visionox r66451 panel
Content-Language: en-GB
To: neil.armstrong@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-2-4210bcbb1649@quicinc.com>
 <3cca2809-fa26-f0cf-2ccc-6737d150b43d@linaro.org>
 <69c6f4fe-4610-8301-b90b-03bcea7587b9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <69c6f4fe-4610-8301-b90b-03bcea7587b9@linaro.org>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 12:10, Neil Armstrong wrote:
> On 18/05/2023 02:19, Dmitry Baryshkov wrote:
>> On 16/05/2023 23:20, Jessica Zhang wrote:
>>> Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
>>> comes with the Qualcomm HDK8350 display expansion pack.
>>>
>>> The panel enables display compression (DSC v1.2) by default.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/panel/Kconfig                 |   8 +
>>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>>   drivers/gpu/drm/panel/panel-visionox-r66451.c | 395 
>>> ++++++++++++++++++++++++++
>>>   3 files changed, 404 insertions(+)

[skipped]

>>> +
>>> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    msleep(120);
>>> +
>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
>>
>> Should the mipi_dsi_dcs_set_display_on() (and maybe exit sleep mode) 
>> be a a part of _enable()? Correspondingly _off should IMO be a part of 
>> _disable callback().
> 
> Nop, mipi_dsi_dcs_set_display_on() should be part of prepare, to be 
> called *before* the video stream starts, enable is called after in the 
> atomic modeset chain,

To summarize our discussion: some controllers do not support sending 
commands in non-LPM mode. Thus the panel driver should send all commands 
before the DSI host switches from LPM to VIDEO mode.

Is this corret?

> 
>>
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed on set display on: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    msleep(20);
>>
>>
>> Do we need to add here the following line?
>>
>> dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>
> 
> No, it will be changed by the DSI core.

Hmm, where?

> 
>>
>>> +
>>> +    return 0;
>>> +}

[skipped]

>>> +static int visionox_r66451_bl_update_status(struct backlight_device 
>>> *bl)
>>> +{
>>> +    struct mipi_dsi_device *dsi = bl_get_data(bl);
>>> +    u16 brightness = backlight_get_brightness(bl);
>>> +
>>> +    return mipi_dsi_dcs_set_display_brightness(dsi, 
>>> cpu_to_le16(brightness));
>>
>> mipi_dsi_dcs_set_display_brightness() already converts the brightness, 
>> so you don't need cpu_to_le16 here.
> 
> 
> The _large variant must be used instead.

But cpu_to_le16 is NOP, isn't it?

-- 
With best wishes
Dmitry

