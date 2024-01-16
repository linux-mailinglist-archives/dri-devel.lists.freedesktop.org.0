Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A971582EBA6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D9010E1F0;
	Tue, 16 Jan 2024 09:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79C210E1F0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:35:20 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40e86c02054so8545e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 01:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705397659; x=1706002459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=scaiOvL+sHXGXBndgR8Y3X1QJKhL+HNInVidZxI8/34=;
 b=FVg62fz8Zlyw1692BqveBW3ub2dpB5ifgsB85Qsqm9LnxE8cLDut5FfDOiy0v3ZVPn
 cgJ6hIT1hFmo6ekabM/+N7p9dkvVLS1X26R4AdJgU/JkU9k7Fhp19e4dR/mntCYOMjxO
 Muc7X0nY+BGLkQUmITeBj2aU9XvZZwVdBAnUoohaxaj22PpAhyPSpliPynUe40ddr6cE
 LaJH1xjqYU4ySEgoUfHIA1l3yBBHzXHgHuOJWRZmOHmGJmLfU7VyU5gYXV/FmJRVcpFH
 MBPPPnUpyWetx5b/EHeq9bn9wKZiMEP1lAjV2/XTo4T3qXWDUYiuPDF0u70Qif8Hy+XU
 v4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705397659; x=1706002459;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=scaiOvL+sHXGXBndgR8Y3X1QJKhL+HNInVidZxI8/34=;
 b=RkDlr2CDQyEQg21LulJzq+D0+bv4yTMhIJXmKcgCX/MNflkIWphDveOuEmq8p5AGW1
 sAXU5mJ6vsqcS+/xGeDVHTdAy91NCD6EnpkY2JNOd62oT7BNn0fZ2vDGCbqdeSNIrLKd
 4acl+53zHqamDBujs1DkAHcQ4HCa0gOjA35w/kei28bO+Bhxoy5zWW0sGFI7a/oharoB
 b9bJGWK8nB4BQbABMv8zayZNuaLlqHsUEwAcmMgb02vxGW9zgR3Je1xjLqFabbJ0lRqn
 f9N2jgIzy1yAScwiiekevsalXvARCWMfx1vf75c+7AZ8MTnSiPHjkTwiIo7fd7ZcSgK6
 EZ0g==
X-Gm-Message-State: AOJu0YxdUQ9W+IwZzsmxsyXgLKA8tgoGzzJ7ajlVVdP1n8O8vMQwNDcS
 z90bckqPWtDd9Uy5yKXvJc1uNZezNOaXCQ==
X-Google-Smtp-Source: AGHT+IGK1foTTcURYUk+FuNSxXLTJ3GwXxB9NPta21goS9Ylzyw9DDtzjlYaWBBRuYi91H+rCptOyQ==
X-Received: by 2002:a05:600c:a005:b0:40e:3772:cb56 with SMTP id
 jg5-20020a05600ca00500b0040e3772cb56mr3866601wmb.8.1705397659111; 
 Tue, 16 Jan 2024 01:34:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:30a6:c236:cc88:349e?
 ([2a01:e0a:982:cbb0:30a6:c236:cc88:349e])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b0040e4746d80fsm18723036wmq.19.2024.01.16.01.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 01:34:18 -0800 (PST)
Message-ID: <4ce0ce11-771d-48b5-8ef1-e7671d7c9615@linaro.org>
Date: Tue, 16 Jan 2024 10:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Content-Language: en-US, fr
To: Shengyang Chen <shengyang.chen@starfivetech.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
 <ZQ0PR01MB10626BCA7ACA6CB9754BB70BEF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
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
In-Reply-To: <ZQ0PR01MB10626BCA7ACA6CB9754BB70BEF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
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
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2024 10:32, Shengyang Chen wrote:
> Hi, Neil
> 
> Thanks for your comment.
> 
>> -----Original Message-----
>> From: neil.armstrong@linaro.org <neil.armstrong@linaro.org>
>> Sent: 2024年1月9日 19:19
>> To: Shengyang Chen <shengyang.chen@starfivetech.com>;
>> devicetree@vger.kernel.org; dri-devel@lists.freedesktop.org
>> Cc: quic_jesszhan@quicinc.com; sam@ravnborg.org; airlied@gmail.com;
>> daniel@ffwll.ch; maarten.lankhorst@linux.intel.com; mripard@kernel.org;
>> tzimmermann@suse.de; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; wahrenst@gmx.net;
>> dave.stevenson@raspberrypi.com; thierry.reding@gmail.com; Changhuang
>> Liang <changhuang.liang@starfivetech.com>; Keith Zhao
>> <keith.zhao@starfivetech.com>; Jack Zhu <jack.zhu@starfivetech.com>;
>> linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
>>
>> Hi,
>>
>> On 09/01/2024 08:09, Shengyang Chen wrote:
>>> This patchset adds waveshare 7inch touchscreen panel support for the
>>> StarFive JH7110 SoC.
>>
>> Could you precise which SKU you're referring to ? is it 19885 =>
>> https://www.waveshare.com/7inch-dsi-lcd.htm ?
>>
> 
> yes, it is
> sorry for confusing you.
> 
>> Are you sure it requires different timings from the RPi one ? In the Waveshare
>> wiki it explicitly uses the rpi setup (vc4-kms-dsi-7inch) to drive it:
>> https://www.waveshare.com/wiki/7inch_DSI_LCD
>>
> 
> Referring to Keith's answer
> https://lists.freedesktop.org/archives/dri-devel/2023-December/434200.html
> the panel timing value is generated to fit phy's bitrate and prevent overflow and underflow.
> 
> Referring to the suggestion, we may try other timing from panel-simple to drive the panel.

Please implement a mode_fixup in your DSI host driver instead.

Neil

> 
>> Neil
>>
>>>
>>>
>>> changes since v1:
>>> - Rebased on tag v6.7.
>>>
>>> patch 1:
>>> - Gave up original changing.
>>> - Changed the commit message.
>>> - Add compatible in panel-simple.yaml
>>>
>>> patch 2:
>>> - Gave up original changing.
>>> - Changed the commit message.
>>> - Add new mode for the panel in panel-simple.c
>>>
>>> v1:
>>> https://patchwork.kernel.org/project/dri-devel/cover/20231124104451.44
>>> 271-1-shengyang.chen@starfivetech.com/
>>>
>>> Shengyang Chen (2):
>>>     dt-bindings: display: panel: panel-simple: Add compatible property for
>>>       waveshare 7inch touchscreen panel
>>>     gpu: drm: panel: panel-simple: add new display mode for waveshare
>>>       7inch touchscreen panel
>>>
>>>    .../bindings/display/panel/panel-simple.yaml  |  2 ++
>>>    drivers/gpu/drm/panel/panel-simple.c          | 28
>> +++++++++++++++++++
>>>    2 files changed, 30 insertions(+)
>>>
> 
> 
> Best Regards,
> Shengyang

