Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC0666CAF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 09:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5581010E898;
	Thu, 12 Jan 2023 08:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B305A10E894
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 08:43:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z5so16276773wrt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3Zb2prwX5ewnpgdzGw19Cc+Sw5XwnAa7NXe+OMV8jKw=;
 b=NmjCWa3o41jWihWfacB/vaadHdW6R3wPXPz0YoS1Zy9ajcSo8AHwhhmMNLzzZ9Jzch
 2s4zuWUU/tHZ5amGoQUBnaTLZYVtTL2gSh4uwB/BJUU3kHVRM+JkRzMQ4Y7r0rWk7Qpo
 FUB6IZYahv/m2gRJd8OmTl7puOGMtRtZ7SUaGolpuFDuMYD0u/7/6auSAaE0fdvXjqlT
 Tn/D+vlpVXPY30VyWCtFaCc8jRO0Ht3cDydmjac+ztFDNiCo5dxZAU8QXJ6ZBNYVUBDn
 Y+CzH18vNNsCGIjIC71JzXpqo1xkrGILS/qFAb3l4BhQ/NcvOI7ERU+HfeajEw93paYw
 V9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Zb2prwX5ewnpgdzGw19Cc+Sw5XwnAa7NXe+OMV8jKw=;
 b=HFUCDJPWGyGCA+9nQV9PV+Xp+p17FvUV9OjYxNFKmm//TM9Y6T7EifphAZstutA92/
 6TGiFUXwDBtIMPJ4EncOZPp2lFIrHY2T5DzPfeZbXJYLMJRhFn+spZBw4vfRJ3Q07BlU
 nCfz+RthcOsVaVGKIKhlHw1GZ0CgaFFQYDgDVt3eR/GnQNeBGniLLqyPkaAljT3Ir9hp
 vSLCYUJah38G97Nd3H1S3cfsuek4gDLUpytPj7xAFIQWcSltPXmC0e/krXAUHOasxJB+
 nHy5qFFbDQihUQMaWrKXIhkEp0MTRRhhY6fN9kglhurjW6RRzx4iy6YWiOKgTq85og+l
 Te1Q==
X-Gm-Message-State: AFqh2kpdrFA08A9anjPNRoRt070ezwvN9+FeqMkYBlbD7MRY2mklMU4X
 o5H/pkIa1zUCc5ycS8Q5wooVVQ==
X-Google-Smtp-Source: AMrXdXsejK532QbrJU+qy0oL4K+xygxwTovkVl1SS4XhjsKm22GDtCxbtqsPwWLfArk8pblgJRfzcQ==
X-Received: by 2002:a5d:5908:0:b0:2bb:dd87:3482 with SMTP id
 v8-20020a5d5908000000b002bbdd873482mr11003508wrd.39.1673512994127; 
 Thu, 12 Jan 2023 00:43:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a5d4b44000000b002366dd0e030sm15645501wrs.68.2023.01.12.00.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 00:43:13 -0800 (PST)
Message-ID: <c0ab0802-bced-34ac-c25f-f80ef17d7a41@linaro.org>
Date: Thu, 12 Jan 2023 09:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 12/13] drm/bridge: lt9611: stop filtering modes via the
 table
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-13-dmitry.baryshkov@linaro.org>
 <c03235b1-85d1-1e55-b8c2-9a553887145f@linaro.org>
 <1b29bbef-1ee3-654c-bb58-c8fcf3b876a0@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <1b29bbef-1ee3-654c-bb58-c8fcf3b876a0@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/01/2023 16:37, Dmitry Baryshkov wrote:
> On 11/01/2023 12:57, Neil Armstrong wrote:
>> On 08/01/2023 17:56, Dmitry Baryshkov wrote:
>>> The lt9611 bridge can support different modes, it makes no sense to list
>>> them in the table. Drop the table and check the number of interfaces
>>> using the fixed value.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/bridge/lontium-lt9611.c | 41 +++----------------------
>>>   1 file changed, 4 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
>>> index 82af1f954cc6..df9f015aa3a0 100644
>>> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
>>> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
>>> @@ -84,24 +84,6 @@ static const struct regmap_config lt9611_regmap_config = {
>>>       .num_ranges = ARRAY_SIZE(lt9611_ranges),
>>>   };
>>> -struct lt9611_mode {
>>> -    u16 hdisplay;
>>> -    u16 vdisplay;
>>> -    u8 vrefresh;
>>> -    u8 lanes;
>>> -    u8 intfs;
>>> -};
>>> -
>>> -static struct lt9611_mode lt9611_modes[] = {
>>> -    { 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
>>> -    { 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
>>> -    { 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
>>> -    { 1920, 1080, 24, 3, 1 },
>>> -    { 720, 480, 60, 4, 1 },
>>> -    { 720, 576, 50, 2, 1 },
>>> -    { 640, 480, 60, 2, 1 },
>>> -};
>>> -
>>>   static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
>>>   {
>>>       return container_of(bridge, struct lt9611, bridge);
>>> @@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct lt9611 *lt9611)
>>>       return 0;
>>>   }
>>> -static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
>>> -{
>>> -    int i;
>>> -
>>> -    for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
>>> -        if (lt9611_modes[i].hdisplay == mode->hdisplay &&
>>> -            lt9611_modes[i].vdisplay == mode->vdisplay &&
>>> -            lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
>>> -            return &lt9611_modes[i];
>>> -        }
>>> -    }
>>> -
>>> -    return NULL;
>>> -}
>>> -
>>>   static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
>>>   {
>>>       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>>> @@ -832,12 +799,12 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>>>                                const struct drm_display_info *info,
>>>                                const struct drm_display_mode *mode)
>>>   {
>>> -    struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
>>>       struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>>> -    if (!lt9611_mode)
>>> -        return MODE_BAD;
>>> -    else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
>>> +    if (mode->hdisplay >= 3840 && drm_mode_vrefresh(mode) >= 31)
>>
>> Isn't 31 a typo ?
> 
> Maybe I should change that to drm_mode_vrefresh(mode) > 30. The chip supports 3840x2160-30, but doesn't promise to support anything above that.

Yep >= 31 is valid, but > 30 seems more logical.

Concerning the hdisplay check, shouldn't be separate ?

You should switch to:
if (mode->hdisplay > 3840)
    return MODE_BAD_WIDTH;

if (mode->hdisplay == 3840 && drm_mode_vrefresh(mode) > 30)
    return MODE_CLOCK_HIGH;

Isn't there limits on vdisplay aswell ?

Neil

> 
>>
>>> +        return MODE_CLOCK_HIGH;
>>> +
>>> +    if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
>>>           return MODE_PANEL;
>>>       else
>>>           return MODE_OK;
>>
> 

