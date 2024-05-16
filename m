Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652988C71BE
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C934310E3E5;
	Thu, 16 May 2024 06:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gYO7cmmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0535410E3E5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:55:20 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4202959b060so3598745e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715842519; x=1716447319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zApq4EhEn1SkxpN84kRXwF8kImjxLliRj17breW4Is4=;
 b=gYO7cmmt7eFqPWon3fONsMBZwvbFg2KlHEinHB9NARCdALhJNnqE2PlwMd6vPFueb/
 A2c3lOKsWJBl5MvZ7z1v24/4a+OESsBA8Miq4/HVQB0hRyHKlbCqXvGVZjdRdsdo6akp
 H0UhpaSsMrYlLCSF+ErEbHTjWobT/eDqATWjkMGUNKFaPrMyBSRaf/Fs3MxpDz+k6sc5
 s8Ye7JyipT2ruLyrlDdq+w+c305jfHKwCMYOzNn4jo2loVQRXqeLe4y5wqErbW1KGjgY
 owHDP24vbO6tBEmkdrwnkKGOASVV2NS4qjf6bdzBDRXZTSvWZFHS0pU8gh2A4YW0VNii
 3GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715842519; x=1716447319;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zApq4EhEn1SkxpN84kRXwF8kImjxLliRj17breW4Is4=;
 b=fE7x+jcM0xIXTy+Umzg7vzDkwykPMGJ1D8EAKfesRE7XPflZEpExXz/PKigKH2E84e
 jUTIJE3ILWwvG4bJyXAMFZ7REjCSgQDL7qfxdYlSc3FxjOE9c6KFyeREhKxig1iB/DWe
 v55iz3Gzud5EaL3OHu7P4c3DJnGlnvBdftjcH8UhxiNXOlcrSGWB0TB0FZZRk7wI04Pb
 g31nyfmwFev6inoPeDQA6H6ab0o01M2PWQTZo8PCytSDq2rChYQIKp8lYeFelvgkPPsS
 ivzsMPCfAHAOuBC0y321TiO2O7aoV5C2ppnCg6DTjL6KQUEdFOhFQdd8/WUHzVnhjJfr
 SJWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu4bTVEtcyTb9QiVsP4t4SbO8438weZBNN+2xwNqray4TJMH/ZHWKqNLAvau6tvMt0hpXQtu+QQNJZv+nic2l0xoQoMelbXK1QbN7b46gU
X-Gm-Message-State: AOJu0Yw9s/gIh6scS9Si8KthiAQHsb3P3AM4DsSg9LdRUaSYq/E0Ehqb
 eEKVKS0zLqPWBGMoUW4ehgQlYRPkw5GiLL8vIP2dIYTi4MzlEniqezyAL2zccZc=
X-Google-Smtp-Source: AGHT+IHmfhzYhswL+q5F4aVR+npRhzdTj2L7dKbOyBQ9wI3xHaXvPRu7CbbM43TEedhU2ph/itihzA==
X-Received: by 2002:a05:600c:3108:b0:416:536b:683a with SMTP id
 5b1f17b1804b1-41fead65000mr120876815e9.32.1715842518928; 
 Wed, 15 May 2024 23:55:18 -0700 (PDT)
Received: from [10.96.0.27] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4201916e7c6sm118983755e9.12.2024.05.15.23.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 23:55:18 -0700 (PDT)
Message-ID: <7b488473-7fd1-4f4f-8c32-72e84420b478@linaro.org>
Date: Thu, 16 May 2024 08:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [v7 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
To: cong yang <yangcong5@huaqin.corp-partner.google.com>,
 Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, daniel@ffwll.ch, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-4-yangcong5@huaqin.corp-partner.google.com>
 <0fcdb0ac-2e4a-44b2-a5d6-a67a1d747df8@linaro.org>
 <CAD=FV=XkBkQUN-93eQDKZcw_66uSeNBBhbiq2hRLcFN+Ck71RQ@mail.gmail.com>
 <CAHwB_N+foZpCjqUy0dJdS2wBbUjHVRQQP0p7S_eTG1Yrh0bgPw@mail.gmail.com>
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
In-Reply-To: <CAHwB_N+foZpCjqUy0dJdS2wBbUjHVRQQP0p7S_eTG1Yrh0bgPw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2024 08:43, cong yang wrote:
> Hi:
> 
> If it is determined that a separately patch needs to be sent, then I
> will remove this patch in V8 series?
> 
> Doug Anderson <dianders@chromium.org> 于2024年5月16日周四 05:28写道：
> 
>>
>> Hi,
>>
>> On Wed, May 15, 2024 at 2:16 PM <neil.armstrong@linaro.org> wrote:
>>>
>>> Hi,
>>>
>>> On 15/05/2024 03:46, Cong Yang wrote:
>>>> DRM_PANEL_HIMAX_HX83102 is being split out from DRM_PANEL_BOE_TV101WUM_NL6.
>>>> Since the arm64 defconfig had the BOE panel driver enabled, let's also
>>>> enable the himax driver.
>>>>
>>>> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>> ---
>>>>    arch/arm64/configs/defconfig | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>> index 2c30d617e180..687c86ddaece 100644
>>>> --- a/arch/arm64/configs/defconfig
>>>> +++ b/arch/arm64/configs/defconfig
>>>> @@ -864,6 +864,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
>>>>    CONFIG_DRM_PANEL_LVDS=m
>>>>    CONFIG_DRM_PANEL_SIMPLE=m
>>>>    CONFIG_DRM_PANEL_EDP=m
>>>> +CONFIG_DRM_PANEL_HIMAX_HX83102=m
>>>>    CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
>>>>    CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
>>>>    CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>>>
>>> You should probably sent this one separately since only an ARM SoC maintainer
>>> can apply this, probably via the qcom tree.
>>
>> Really? I always kinda figured that this was a bit like MAINTAINERS
>> where it can come through a bunch of different trees. Certainly I've
>> landed changes to it before through the drm-misc tree. If that was
>> wrong then I'll certainly stop doing it, of course.

Yeah we usually don't mess with arch specific defconfig from drm tree

>>
>> -Doug

