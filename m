Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7058C6D84
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5095510E08F;
	Wed, 15 May 2024 21:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ReZdkRoh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B3410E08F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:09:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42016c8daa7so25409465e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715807395; x=1716412195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3SnmjCK7izQwl6ASZrNS2yJUXoDimlZk3ChzYsJJLIQ=;
 b=ReZdkRohHxQ2Djm67J1AqM/mY6OLPOTA18QpA6bDtZiqXJC81RzMuIBYK+np2hvjRn
 Dgi0oFv4jJwXk0yyaMLBFmxG7gORshZfEW8TpeyahzZYn1s0W1R+bycakSr1chSQ94iH
 hCBjWRBwW8WECTdypMaBlLjy/TGnaWj6cutI96pV4Ydeca8MGpv8weKQ7b4UPZ/jU/Tt
 lEKOrcdPJ7Yxj7pdpRsPhdIf6IYakJULn3APNLoUj97FcNGSeATGprlJsKWy+zc1oM0Y
 euVv7OuRQxZ8CDmro48331aYjY6rAM2qHa2+Iqb+2Un64ADUE6GG3ymO3B1W+Njs9c1f
 DcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715807395; x=1716412195;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3SnmjCK7izQwl6ASZrNS2yJUXoDimlZk3ChzYsJJLIQ=;
 b=tN7dmd4t+qTkRHj3DS4I2Dmrb2P97P9TjWsxmDmazqBmAV84KXNg1z3UruRq5k/l7E
 UATwZ65eQ3olFNB9TvdKCGHZWXrWykHgxZMYMv8al9ECQv12heLdDL9hP0dBsN7MTMzT
 mXxLtDhNq7bNVYazClWHM4YXA/8mwM3+81NXltn/fp7XDfne2IEfEHOEg3fOpaugWWVn
 oA6vA25inum1s6QwtdTHiFYZ/L8uBbAjNPdSxedqt/eYRGDmyJiAuW40or9cRR4HxCSS
 g995pxW5prF0XWHgk1eHmk7dv988KSqATjIC7fMU0yP26AnyHO90UL3gdMV+zaI53seC
 gLHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUquiBMyRDW0z24deACr6vHQjZRfluIzi53VdlcZayHoCP9vtUQceSo0sthagfK7fuliX4ySGkW1NdDBwhSKeAukLhgTz/muT9QOgxZqA7
X-Gm-Message-State: AOJu0YwKWFJGsgGBVuAi5exjOnDk7hu5rko5zr+AsvSZK4mL4go22N0N
 HsxXlChgFyFn5orMBQBu2Vs+ZmJbhqZjTZbO5osjVzAdogvVt3HVO7TZGRBDiDY=
X-Google-Smtp-Source: AGHT+IH7D5pE7KpmkjyzHmFjDR+WnvIc64hJiz/d322p06M6DRxUrMx0ZmDryvZmW0Cq5TBG1J7j3Q==
X-Received: by 2002:a05:600c:3548:b0:419:f3f9:8ee3 with SMTP id
 5b1f17b1804b1-41fea93a80amr144473985e9.5.1715807394622; 
 Wed, 15 May 2024 14:09:54 -0700 (PDT)
Received: from [10.1.2.176] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce24c0sm246328965e9.17.2024.05.15.14.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 14:09:54 -0700 (PDT)
Message-ID: <4960c10d-e538-4907-a443-b4cba5e0a723@linaro.org>
Date: Wed, 15 May 2024 23:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/3] dt-bindings: display: panel: constrain 'reg'
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Konrad Dybcio <konradybcio@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Shawn Guo <shawn.guo@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
 <20240513131711.GA2419451-robh@kernel.org>
 <CAA8EJppkJ9rukeUZ=1kAL3Y0WVhN5QFXnNU3tjv4yuXMjc++7w@mail.gmail.com>
 <a1108f14-9a1b-414a-97c5-0bc43457d635@linaro.org>
 <778500c9-83bc-47b7-bf1d-28de44084776@kernel.org>
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
In-Reply-To: <778500c9-83bc-47b7-bf1d-28de44084776@kernel.org>
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

On 14/05/2024 11:07, Krzysztof Kozlowski wrote:
> On 14/05/2024 10:44, Neil Armstrong wrote:
>> On 13/05/2024 18:41, Dmitry Baryshkov wrote:
>>> On Mon, 13 May 2024 at 16:17, Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Thu, May 09, 2024 at 11:42:50AM +0200, Krzysztof Kozlowski wrote:
>>>>> Hi,
>>>>>
>>>>> Cleanups for display panel bindings.
>>>>>
>>>>> Rob, maybe you could take entire set if it applies? I based it on
>>>>> linux-next, so letl me know if I need to rebase on your for-next.
>>>>
>>>> Applied. These 2 don't exist in my tree:
>>>
>>> It's most likely fine, but was there an ack from drm-misc maintainers?
>>>
>>>> Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
>>>> Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
>>>
>>> Because those were added to drm-misc during the last cycle. So ideally
>>> the patch should have gone through drm-misc.
>>>
>>
>> Exact there's a conflict on today's next, Rob can you drop them so I can apply them via drm-misc ?
> 
> It's almost the first time I see bindings picked up via drm-misc. Is
> this an exception or rather new trend (which would be awesome as this is
> what we prefer usually)?

I usually pick up bindings along drivers like other subsystems, and when reviewed I
take independent bindings fixes aswell when rob doesn't pick them before.

Neil

> 
> Best regards,
> Krzysztof
> 

