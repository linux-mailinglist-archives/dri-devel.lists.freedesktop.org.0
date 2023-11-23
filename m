Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C67F607C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 14:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53DE10E750;
	Thu, 23 Nov 2023 13:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7009710E74F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 13:40:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b358f216dso5195825e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 05:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700746802; x=1701351602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=J3TPUaHvZ6rw/hVh2543ObAlnWCVHD/ml9MkJlTvJwY=;
 b=cCk7ytbMu25dtVzgOj1ZEU6kb3isn/toGPTHfqVEYStBHEA5q2ZqM5tHtcwhTur0za
 IbaanydrM39Hlma0DsQKXCTVrCZLTijSsd5FrXT39mIQv78DHcJAJ74QO2aZ10zpTXmH
 Npv+6K/F0yZqQLpcB7d6GEgDi00bXja2ncik2k0cx5cVH8TbiOBlpHIBiLnTA6xGIW7S
 DV+xVn6H4rBQrZDrrYj4L5lXvAwICMdS8u/VsMXTohLCxQfyyng+aEZXI8jTRe5dt+oT
 U9n1VmOH+c2+F2aGYpBFNLBiKWUXYYbb2nz0OPjYFGU0CvdlMRwfEIutNusnmEmLdZDI
 N5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700746802; x=1701351602;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=J3TPUaHvZ6rw/hVh2543ObAlnWCVHD/ml9MkJlTvJwY=;
 b=dBekjHK37AzbpssyUsysD0V3N1JYOt5jhxWZGFnbbbt0TwDU7t9kMEpu9qjfjXY1XD
 90TId1IqHFgb8BYpezqaO+08chn+n5QTlwJjHbJn6lAm1jBnH9xcsDoBQQjyDoi4dAZE
 FuMI5960nNvK2s/TeajG0Y7Upzxh1eTp776qiMVkO+Vg74L6xx2WdbMVAehdu8+5akI9
 PSMCnqIz4OE55sWvLHrsRGqyuNrZAQaOd1kQOKCU+BpLbln61Y1ZkFgQZIa9L+t4JqZH
 ro3ZnKY9xZHDul8zo2HRxHjCgm7lCrvCdRPSFeMTTecpNpf7hm0vQCkL6wVX8HjIZcDn
 UrqQ==
X-Gm-Message-State: AOJu0Yyn2e/PSXQIFDM2esVWrfDNl1/7lmeC4OSGQAS/NSo+xb/NIzBt
 LYjLUDsBM7Y++VTvL+7Ir7qZjg==
X-Google-Smtp-Source: AGHT+IEtpD7tPtTabhaiSeHfEY+xR8fiJQ5KN7fy/TFv3GL9r/hftulj44JOf2YzigBM5nkioHoqCg==
X-Received: by 2002:a05:600c:35cf:b0:3f6:9634:c8d6 with SMTP id
 r15-20020a05600c35cf00b003f69634c8d6mr4278069wmq.18.1700746801550; 
 Thu, 23 Nov 2023 05:40:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:89c5:1f48:b86f:30ba?
 ([2a01:e0a:982:cbb0:89c5:1f48:b86f:30ba])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a05600c189600b0040a4cc876e0sm1996390wmp.40.2023.11.23.05.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 05:40:01 -0800 (PST)
Message-ID: <22676a5b-cc2b-4cb9-b921-d1fb6c13a626@linaro.org>
Date: Thu, 23 Nov 2023 14:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
 <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
 <121163c9-0d56-47ad-a12e-e67390fef2b4@linux.dev>
 <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
 <00ba2245-0e48-4b21-bcd4-29dfb728e408@linux.dev>
 <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2023 09:08, Dmitry Baryshkov wrote:
> On Thu, 23 Nov 2023 at 07:05, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>
>> Hi,
>>
>>
>> On 2023/11/16 19:19, Dmitry Baryshkov wrote:
>>> On Thu, 16 Nov 2023 at 12:13, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>>> Hi,
>>>>
>>>>
>>>> On 2023/11/16 17:30, Dmitry Baryshkov wrote:
>>>>> On Thu, 16 Nov 2023 at 11:14, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Thanks a lot for reviewing!
>>>>>>
>>>>>>
>>>>>> On 2023/11/15 00:30, Dmitry Baryshkov wrote:
>>>>>>> On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>>>>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>>>>
>>>>>>>> The it66121_create_bridge() and it66121_destroy_bridge() are added to
>>>>>>>> export the core functionalities. Create a connector manually by using
>>>>>>>> bridge connector helpers when link as a lib.
>>>>>>>>
>>>>>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/bridge/ite-it66121.c | 134 +++++++++++++++++++--------
>>>>>>>>      include/drm/bridge/ite-it66121.h     |  17 ++++
>>>>>>>>      2 files changed, 113 insertions(+), 38 deletions(-)
>>>>>>>>      create mode 100644 include/drm/bridge/ite-it66121.h
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
>>>>>>>> index 8971414a2a60..f5968b679c5d 100644
>>>>>>>> --- a/drivers/gpu/drm/bridge/ite-it66121.c
>>>>>>>> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
>>>>>>>> @@ -22,6 +22,7 @@
>>>>>>>>
>>>>>>>>      #include <drm/drm_atomic_helper.h>
>>>>>>>>      #include <drm/drm_bridge.h>
>>>>>>>> +#include <drm/drm_bridge_connector.h>
>>>>>>>>      #include <drm/drm_edid.h>
>>>>>>>>      #include <drm/drm_modes.h>
>>>>>>>>      #include <drm/drm_print.h>
>>>>>>>> @@ -703,14 +704,32 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
>>>>>>>>                                      enum drm_bridge_attach_flags flags)
>>>>>>>>      {
>>>>>>>>             struct it66121_ctx *ctx = bridge_to_it66121(bridge);
>>>>>>>> +       struct drm_bridge *next_bridge = ctx->next_bridge;
>>>>>>>> +       struct drm_encoder *encoder = bridge->encoder;
>>>>>>>>             int ret;
>>>>>>>>
>>>>>>>> -       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
>>>>>>>> -               return -EINVAL;
>>>>>>>> +       if (next_bridge) {
>>>>>>>> +               if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>>>>>>>> +                       WARN_ON(1);
>>>>>>> Why? At least use WARN() instead
>>>>>> Originally I want to
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>>> +                       flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
>>>>>>>> +               }
>>>>>>>> +               ret = drm_bridge_attach(encoder, next_bridge, bridge, flags);
>>>>>>>> +               if (ret)
>>>>>>>> +                       return ret;
>>>>>>>> +       } else {
>>>>>>>> +               struct drm_connector *connector;
>>>>>>>>
>>>>>>>> -       ret = drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
>>>>>>>> -       if (ret)
>>>>>>>> -               return ret;
>>>>>>>> +               if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>>>>>>>> +                       WARN_ON(1);
>>>>>>> No. It is perfectly fine to create attach a bridge with no next_bridge
>>>>>>> and with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>>>>>>>
>>>>>> The document say when DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is set
>>>>>> the bridge shall not create a drm_connector. So I think if a display
>>>>>> bridge driver don't have a next bridge attached (Currently, this is
>>>>>> told by the DT), it says that this is a non-DT environment. On such
>>>>>> a case, this display bridge driver(it66121.ko) should behavior like
>>>>>> a *agent*. Because the upstream port of it66121 is the DVO port of
>>>>>> the display controller, the downstream port of it66121 is the HDMI
>>>>>> connector. it66121 is on the middle. So I think the it66121.ko should
>>>>>> handle all of troubles on behalf of the display controller drivers.
>>>>> No. Don't make decisions for the other drivers. They might have different needs.
>>>> [...]
>>>>
>>>>
>>>>>> Therefore (when in non-DT use case), the display controller drivers
>>>>>> side should not set DRM_BRIDGE_ATTACH_NO_CONNECTOR flag anymore.
>>>>>> Which is to hint that the it66121 should totally in charge of those
>>>>>> tasks (either by using bridge connector helper or create a connector
>>>>>> manually). I don't understand on such a case, why bother display
>>>>>> controller drivers anymore.
>>>>> This is the reason why we had introduced this flag. It allows the
>>>>> driver to customise the connector. It even allows the driver to
>>>>> implement a connector on its own, completely ignoring the
>>>>> drm_bridge_connector.
>>>>
>>>> I know what you said is right in the sense of the universe cases,
>>>> but I think the most frequent(majority) use case is that there is
>>>> only one display bridge on the middle. Therefore, I don't want to
>>>> movethe connector things into device driver if there is only one display
>>>> bridge(say it66121) in the middle. After all, there is no *direct
>>>> physical connection* from the perspective of the hardware. I means that
>>>> there is no hardware wires connectthe HDMI connector and the DVO port. So display controller drivers
>>>> should not interact with anything related with the connector on a
>>>> perfect abstract on the software side. Especially for such a simple use
>>>> case. It probably make senses to make a  decision for themost frequently use case, please also note
>>>> that this patch didn't introduce any-restriction for the more advance
>>>> uses cases(multiple bridges in the middle).
>>> So, for the sake of not having the connector in the display driver,
>>> you want to add boilerplate code basically to each and every bridge
>>> driver. In the end, they should all behave in the same way.
>>>
>>> Moreover, there is no way this implementation can work without a
>>> warning if there are two bridges in a chain and the it66121 is the
>>> second (the last) one. The host can not specify the
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>>>>>>>> +                       WARN_ON(1);
>>>>>>> No. It is perfectly fine to create attach a bridge with no next_bridge
>>>>>>> and with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>>>>>>>
>>>>>> The document say when DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is set
>>>>>> the bridge shall not create a drm_connector. So I think if a display
>>>>>> bridge driver don't have a next bridge attached (Currently, this is
>>>>>> told by the DT), it says that this is a non-DT environment. On such
>>>>>> a case, this display bridge driver(it66121.ko) should behavior like
>>>>>> a *agent*. Because the upstream port of it66121 is the DVO port of
>>>>>> the display controller, the downstream port of it66121 is the HDMI
>>>>>> connector. it66121 is on the middle. So I think the it66121.ko should
>>>>>> handle all of troubles on behalf of the display controller drivers.
>>>>> No. Don't make decisions for the other drivers. They might have different needs.
>>>> [...]
>>>>
>>>>
>>>>>> Therefore (when in non-DT use case), the display controller drivers
>>>>>> side should not set DRM_BRIDGE_ATTACH_NO_CONNECTOR flag anymore.
>>>>>> Which is to hint that the it66121 should totally in charge of those
>>>>>> tasks (either by using bridge connector helper or create a connector
>>>>>> manually). I don't understand on such a case, why bother display
>>>>>> controller drivers anymore.
>>>>> This is the reason why we had introduced this flag. It allows the
>>>>> driver to customise the connector. It even allows the driver to
>>>>> implement a connector on its own, completely ignoring the
>>>>> drm_bridge_connector.
>>>>
>>>> I know what you said is right in the sense of the universe cases,
>>>> but I think the most frequent(majority) use case is that there is
>>>> only one display bridge on the middle. Therefore, I don't want to
>>>> movethe connector things into device driver if there is only one display
>>>> bridge(say it66121) in the middle. After all, there is no *direct
>>>> physical connection* from the perspective of the hardware. I means that
>>>> there is no hardware wires connectthe HDMI connector and the DVO port. So display controller drivers
>>>> should not interact with anything related with the connector on a
>>>> perfect abstract on the software side. Especially for such a simple use
>>>> case. It probably make senses to make a  decision for themost frequently use case, please also note
>>>> that this patch didn't introduce any-restriction for the more advance
>>>> uses cases(multiple bridges in the middle).
>>> So, for the sake of not having the connector in the display driver,
>>> you want to add boilerplate code basically to each and every bridge
>>> driver. In the end, they should all behave in the same way.
>>
>> No, I'm only intend to modify the one when there has a user emerged.
>> If we have the connector related code in the KMS display driver side,
>> then I think we don't honor the meaning of the word *bridge*. I was
>> told drm_bridge is a modern design, if we still need the DC side
>> worry about something do not have a physical connection, then it will
>> not be modern anymore, it is not a good bridge.
> 
> Next time the user emerges for another bridge. And then for another.
> This way the very similar code is copy-pasted over all bridge drivers.
> So instead it was decided to keep it in the display driver code.
> 
>>
>>
>>> Moreover, there is no way this implementation can work without a
>>> warning if there are two bridges in a chain and the it66121 is the
>>> second (the last) one.
>>
>> Yes and no!
>>
>> If one of them are transparent, then thisimplementation still can works. It is just that this will not be a good
>> abstract anymore.I do have seen such design on some notebook hardware.  But from my programming experiences,
>> using two bridges are typically a bad practice in engineering. As it tend
>> to increase the PCB board area and increase entire cost. As you need buy
>> one more TX encoder chip. Please also consider that the embedded world focus
>> on low cost and low power consume.
> 
> A typical pipeline for an embedded device can perfectly look like:
> - DSI host (drm_encoder)
> - DSI-HDMI or DSI-eDP bridge (drm_bridge)
> - hdmi-connector or panel-bridge (drm_bridge)
> - drm_bridge_connector.
> 
> Two drm_bridge instances.

Nowadays, we are moving the encoder code into bridge so we can have way
more than 2 bridges, and connector code has been moved to a bridge.

On Amlogic SoCs, the HDMI chain has at least 3 bridges, it can have up to 4
on DSI usecase if you plug a DSI to eDP bridge.

On iMX8 platform, they have multiple internal SoC bridges even before the HDMI or DSI bridge.

The model works very well across extremely heterogeneous embedded platforms.

> 
>>
>> I think, multiple display bridges case should be avoided for middle/low end
>> application. Or allow us to handle the two and/or more bridges cases in the
>> future. When there has at least one user emerged, we will introduce new
>> approach to handle then.
>>
>> Do you find any product level boards that using two external display bridge and
>> one of them is it66121? If we can not even find a user, we are not even have a
>> board to test if current design (state of art) works. Does it suffer from module
>> loading order problems? what if their i2c slave address is same? Does such a use
>> case will past the S3/S4 test? All of those concerns are imposed to every display
>> bridges programmer from the very beginning.
> 
> Please add a hdmi-connector device to your testing model. You don't
> have to use it, but it is a fully legit use case. And suddenly you
> have to drm_bridge instances in your chain.
> 
>>
>> I'm agree with the idea that drm bridges drivers involved toward to a direction
>> that support more complex design, but I think we should also leave a way for the
>> most frequent use case. Make it straight-forward as a canonical design.
> 
> Not having anything connector-related in the drm_bridge driver is a
> canonical design.
> 
>>
>>> The host can not specify the
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, it will cause a warning here. And
>>> it can not omit the flag (as otherwise the first bridge will create a
>>> connector, without consulting the second bridge).
>>
>> The semantics of DRM_BRIDGE_ATTACH_NO_CONNECTOR flagare implement-defined,
> 
> No, they are not. Semantics are pretty simple: do not create the
> drm_connector instance. Pass the flag to the next bridge in the chain.
> 
>> for our case, I could just ignore it if their
>> don't have a signal(DT or ACPI) tell me that there are multiple bridges
>> in the chain. This depend on community's attitude.
> 
> Ignoring a flag is a bad idea.
> 
>>
>> For it66121 with a canonical design, the host should not need to specify this flag.
>> Because at the time of when the device driver(it66121.ko) get loaded, the it66121
>> driver could parse the DT by itself, and detect if there has a next bridge, is it a
>> connector or is it yet another display bridges. The DT speak everything about the
>> topology. The flag is there just for the KMS display controller driver to explicit
>> control, use it and make it more useful is the right way, is it?
> 
> No. We have been there (before the DRM_BRIDGE_ATTACH_NO_CONNECTOR was
> introduced), we have gone away from it.
> 
>>
>>
>>>>
>>>>>>>> +
>>>>>>>> +               connector = drm_bridge_connector_init(bridge->dev, encoder);
>>>>>>>> +               if (IS_ERR(connector))
>>>>>>>> +                       return PTR_ERR(connector);
>>>>>>>> +
>>>>>>>> +               drm_connector_attach_encoder(connector, encoder);
>>>>>>> This goes into your device driver.
>>>>>>>
>>>>>>>> +
>>>>>>>> +               ctx->connector = connector;
>>>>>>>> +       }
>>>>>>>>
>>>>>>>>             if (ctx->info->id == ID_IT66121) {
>>>>>>>>                     ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>>>>>>>> @@ -1632,16 +1651,13 @@ static const char * const it66121_supplies[] = {
>>>>>>>>             "vcn33", "vcn18", "vrf12"
>>>>>>>>      };
>>>>>
>>>
>>>
> 
> 
> 

