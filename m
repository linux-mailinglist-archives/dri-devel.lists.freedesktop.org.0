Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CB38D8381
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0609E10E3BA;
	Mon,  3 Jun 2024 13:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KipBIS3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4810E3BA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:08:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4211a86f124so37428205e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717420119; x=1718024919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Gx8F+Fp9SWNUY6Yomh+HNjqS3oRk4P5HF08WogPmZDs=;
 b=KipBIS3Qb+qi7wv8XAIH4G26+AYcintGam1ubue66DN4Lfvi+QP3X1X18xA8kBzWFF
 9sQo66CxGuCIUmH8PQcjKZtf3VPrbjV0tjlUT0D2kCYgQClWY/SDmkdKHeHKZUbxd1D9
 FuFh1ajCMXdfMELpUqe/tC4xApSFc6YeQ31A4MkfXkt5l6UNg5i35Aozb7SWguITYgrg
 5sE+1+cK5h+NjO2o3vYvTGxzOdu24RuATnAJP0XeXLqnjDvu3xJgTWsILQpBKJoDl1HV
 mXXpQQxLDrYJmv76YGZ4juTxHAj7q3rsLimHia0N2hR9fiBXT1aqjbnt6Q+W5jxMzRHo
 ZudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717420119; x=1718024919;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Gx8F+Fp9SWNUY6Yomh+HNjqS3oRk4P5HF08WogPmZDs=;
 b=FE2ddxaQxOE04sKwgEFhpvrD0aNZFjYExUUYAelze7IMc8jI78vvy/zaFo91deZGWi
 p78lK1RyheUdxSf50qMrTda5mX2FqBI0xaxp+vyUiRC1qRm8+NaOQfTs7gHmZjtwR40Z
 VYartsdUXFlq0Blxhh7t+n41/+iaM8neKUZbR7U8PIe3YnOJ4APuIl8TdON7RKWwNAZ5
 pN5IOy432Z2h12dqLb2s2Sb3tMkLr6gDD43uIc6lQXaEKhHAjIUdgxh5m4SPofOAwP9a
 VrdXosqBpLIl1AnD6WmiACTPx5JpSSw7cGRnDkL3Gwo+0yDmPeciumUHH6w6KE9YKQIH
 co3A==
X-Gm-Message-State: AOJu0Yzpg+KbM9lqtsQTTpOI3wM4Fz1KMtde33Dzp+fcz646AkuqPE94
 OWoAbZDfxoR+Cz1Vx5Cn9x77VR/2JiLr4axD0akYtBsoTdCRalGDouez1bmCs2Q=
X-Google-Smtp-Source: AGHT+IGk0uTd6E9uGLIil4o8K0nvJynzZnkSYzkdwscvLlhumYGzjCi6eNdCTeQ3QEO7F5aMBDsE0Q==
X-Received: by 2002:a05:600c:1550:b0:420:1fd2:e611 with SMTP id
 5b1f17b1804b1-4212e0adf99mr54609955e9.27.1717420119183; 
 Mon, 03 Jun 2024 06:08:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79fe:b764:2b06:ab4b?
 ([2a01:e0a:982:cbb0:79fe:b764:2b06:ab4b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b8b76f3sm115776355e9.47.2024.06.03.06.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 06:08:38 -0700 (PDT)
Message-ID: <ef60403f-078f-411a-867b-9b551e863f56@linaro.org>
Date: Mon, 3 Jun 2024 15:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
To: Heiko Stuebner <heiko@sntech.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
 <ab0a6372-091b-4293-8907-a4b3ff4845c0@rock-chips.com>
 <11359776.NyiUUSuA9g@phil>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <11359776.NyiUUSuA9g@phil>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 03/06/2024 15:03, Heiko Stuebner wrote:
> Am Montag, 3. Juni 2024, 14:14:17 CEST schrieb Andy Yan:
>> Hi Neil:
>>
>> On 6/3/24 16:55, Neil Armstrong wrote:
>>> Hi Christian,
>>>
>>> On 01/06/2024 15:12, Cristian Ciocaltea wrote:
>>>> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
>>>> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
>>>>
>>>> It is HDMI 2.1 compliant and supports the following features, among
>>>> others:
>>>>
>>> .
>>>
>>> ..
>>>
>>>> * SCDC I2C DDC access
>>>> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
>>>> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
>>>> * Multi-stream audio
>>>> * Enhanced Audio Return Channel (EARC)
>>> -> Those features were already supported by the HDMI 2.0a compliant HW, just
>>> list the _new_ features for HDMI 2.1
>>>
>>> I did a quick review of your patchset and I don't understand why you need
>>> to add a separate dw-hdmi-qp.c since you only need simple variants of the I2C
>>> bus, infoframe and bridge setup.
>>>
>>> Can you elaborate further ? isn't this Quad-Pixel (QP) TX controller version
>>> detectable at runtime ?
>>>
>>> I would prefer to keep a single dw-hdmi driver if possible.
>>
>>
>>
>> The QP HDMI controller is a completely different variant with totally different
>> registers layout, see PATCH 13/14.
>> I think make it a separate driver will be easier for development and maintenance.
> 
> I'm with Andy here. Trying to navigate a driver for two IP blocks really
> sounds taxing especially when both are so different.

I agree, I just wanted more details than "variant of the
Synopsys DesignWare HDMI TX controller", if the register mapping is 100%
different, and does not match at all with the old IP, then it's indeed time
to make a brand new driver, but instead of doing a mix up, it's time to extract
the dw-hdmi code that could be common helpers into a dw-hdmi-common module
and use them.

As I see, no "driver" code can be shared, only DRM plumbings, so perhaps those
plumbing code should go into the DRM core ?

In any case, please add more details on the cover letter, including the detailed
HW differrence and the design you chose so support this new IP.

Neil

> 
> Synopsis also created a new dsi controller for the DSI2 standard, with
> a vastly different registers layout.
> 
> I guess at some point there is time to say this really is a new IP ;-) .
> 
> 
> Though while on that thought, I don't fully understand why both a compiled
> under the dw_hdmi kconfig symbol. People going for a minimal kernel might
> want one or the other, but not both for their specific board.
> 
> 
> Heiko
> 
> 

