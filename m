Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88E854676
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 10:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FCA10E1F2;
	Wed, 14 Feb 2024 09:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wC1fllyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883D410E225
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 09:50:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-411f429a171so1465125e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 01:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707904224; x=1708509024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=K3oqzJu651I3hD2aUVksoi8h7VJNzLL1lNiNLXvIQ20=;
 b=wC1fllyIb5Td7UacfxO5awvobY3AkxoaiH9IQLWQQgYcX0GRunsFx5QL+9go9YWKtx
 U0qxn7LEA6QdkhnARkPJ1zT3evNlouCLYLv7m3ZIssn+kXKQfGl2uih81wZFrEv8KA37
 J3H1NkT/KuY/Gw+Xb10s7USPFNXZgqRTuQQ5q8PSrJa6IefA+PtoSSZ/v21OGPIWdmhv
 N0l0n/eE4fekANf9m8eKZetK1BTNDsUEjBOHRhdmVnJxdHmbHNYuvXwwZUqbgTAdhJNa
 QCRlWtN9yJ5aawfKqS2sYMBHpi6sWRrhJyEV8GcwXKG1+RPLc7SZO9eOxECUwNFzi17L
 KJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707904224; x=1708509024;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=K3oqzJu651I3hD2aUVksoi8h7VJNzLL1lNiNLXvIQ20=;
 b=eXY7iLy0US3Rz+V3aJ5ATcjF+AE81YhWsJYe7sSFu6U/fFtyJRPvfrBTeITIJmHWwn
 1DK4IKMPHo4D5YpSCDaAI6GW2pUhqwR8laweVk1Z6cUXHzSaXCU7LUUsnjj8DkS98Qxh
 +on9fASVdKWtNfgxejV4cXmk6+tgzlgCHk05HM3W4Co74XkMhvghPqr56SHcmR3lJ0d+
 qrec3mOzw73o+Zo/OyZ9CCbCzHcF4MHoUS1FoXfmuJh6aLGyoOk8O07BJ4zE6cFDq6Hf
 Dct1ntazkFzJGTJufKwjpoZKxVvb5Nl/gyr30+av3Hd0U9UP5nBvCm6TGeE0p3FmnIQ0
 K6Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWHEmvf4mN0LcR6qRANhM/oSUp3qHXtmwLFFw4LWvEdpMPyC65ysXaCGRhP1BQUE+JgF5VbfLj/0SS/A/sI+uV1YAe5GSLFhFHoMHiflne
X-Gm-Message-State: AOJu0YzfDxkvu/mGuXBx1xhRyRUAHx+MnlzV0yDSoeo+k3QBEch5j77b
 l0CdFXC0bgj5nfAAmM7yCTaBMJ3EkW4kkLkonofQDmwQ3ZKX2b+aS7YAxiolqk8=
X-Google-Smtp-Source: AGHT+IHmyPUjUsGUAjjrxpz8F2ZqModlPfmBdwaETRWIh6d05Ckg0QgddgagrlPFXl8qhK5otBtxZw==
X-Received: by 2002:a5d:558e:0:b0:33b:49bb:5f91 with SMTP id
 i14-20020a5d558e000000b0033b49bb5f91mr1383897wrv.16.1707904223601; 
 Wed, 14 Feb 2024 01:50:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOBmHidvJmdLA/fLShjhU6mSvfYljQS2avuA9S1BOTgr0k/gV3tq6mFxzsXbiGd32AL15BGjwpkfaSMlDVL3aKSWNFvLYEkYoeQa7El8rpv/kGRExl7ax5XGhNY04rrZYRkh9lQKLT9AddhyjkFAGv950Ic0GWvCv+0v+p2BrOJuEMsQv491ZKos1SWkhhRFoZhpsmChhH9SugyG9lA1c+K4l+Q4LIjGrkwstbRgETiwQelCLq95P1702l6zpwIpaad1Yjzla0fdv2Zp/ERevwnv8qy7sF9DUbGxldVtMK+rh1oe3fLx4/6Gqn6P3fVphIfVR9XJ+y35Ps3CpWIL5zO8TStNr8fcm/n/oX6bROuC9SksQLt9NmyPWTATtxaK/8sxChHAW2qeOhVyzN80GBAAIi1D+40cjZ6y8dMvwuM9tUs8rsUrBTKqAO6KV40u5rzad/O7x+33IRqg9Jz/EMTtGPfJfiSK7G6+tSQCxr96tDINJOv3NE4GIAye3isOOziT+qpOEsWwp8XUZbwuKKE7Y0SVqAu/4UZei3GoAWqXu128Njlh+XdUZvHyMN+PHpCbJxhFMchq8+T+5laOBnqs18dX4uDX2uW22ooCjrUyCoI7rCpYUwgat6BOKfvHsJV6dg58kp3agHqI7QTr70cuCJ6nZtuYNg21cQiKfoTyvDZAV+EZcofIiE60sVe3aqfjMPOryY
Received: from ?IPV6:2a01:e0a:982:cbb0:31aa:ecd:7a9f:63a1?
 ([2a01:e0a:982:cbb0:31aa:ecd:7a9f:63a1])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adf9bcc000000b0033ce9e6e8easm1444672wrc.32.2024.02.14.01.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:50:23 -0800 (PST)
Message-ID: <f9164049-6529-42c1-a35a-e91132c823b9@linaro.org>
Date: Wed, 14 Feb 2024 10:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
Content-Language: en-US, fr
To: Luca Weiss <luca.weiss@fairphone.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
 <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
 <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com>
 <cdc18e2a-b7eb-4b54-a513-481148fb3b0d@linaro.org>
 <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
 <CACRpkdacS9ojXUuogygkz6xxCf3mMq6GG_75sze8ukUu=rxVyw@mail.gmail.com>
 <f99d363c-d4a6-44b3-8057-3925f8dac1d5@linaro.org>
 <CYL76M5KT424.G3BC6JX74XVN@fairphone.com>
 <CZ4P5PWJTODV.3UJ89H6M8W07H@fairphone.com>
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
In-Reply-To: <CZ4P5PWJTODV.3UJ89H6M8W07H@fairphone.com>
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

On 14/02/2024 10:33, Luca Weiss wrote:
> On Mon Jan 22, 2024 at 12:27 PM CET, Luca Weiss wrote:
>> On Fri Jan 12, 2024 at 11:26 AM CET,  wrote:
>>> On 12/01/2024 11:23, Linus Walleij wrote:
>>>> On Fri, Jan 12, 2024 at 10:52 AM Luca Weiss <luca.weiss@fairphone.com> wrote:
>>>>
>>>>> Since there's zero indication Truly is involved in this panel in my
>>>>> documentation - much less the number 5P65 - I'm not going to add that.
>>>
>>> Ack
>>>
>>>>
>>>> OK then, I fold, thanks for looking into it.
>>>> Keep the Himax hx83112a file name and symbols.
>>>>
>>>>> So in short this panel is the model 9A-3R063-1102B from DJN, which uses
>>>>> a Himax HX83112A driver IC.
>>>>
>>>> So compatible = "djn,9a-3r063-1102b" since the setup sequences for
>>>> hx83112a are clearly for this one display?
>>>
>>> Yep let's settle on that!
>>
> 
> Hi Neil and Linus,
> 
> Any feedback about the below question?
> 
> Regards
> Luca
> 
>> It's clear to me to use "djn,9a-3r063-1102b" in the driver now but what
>> about dts?
>>
>> Currently here in v2 we have this:
>> compatible = "fairphone,fp4-hx83112a-djn", "himax,hx83112a";
>>
>> Should this just become this?
>> compatible = "djn,9a-3r063-1102b";
>>
>> Or e.g. this?
>> compatible = "djn,9a-3r063-1102b", "himax,hx83112a";
>>
>> Or something else completely? Do we have some documentation / best
>> practises around this maybe?

Sorry I totally missed the question.

Not sure if "himax,hx83112a" is needed here, the "djn,9a-3r063-1102b" is enough to know the IC is hx83112a.

I don't think you'll ever find a "djn,9a-3r063-1102b" with another controller IC ?

And "himax,hx83112a" alone as fallback is not enough to describe the panel hardware, so I think it should be dropped.

Thanks,
Neil

>>
>> Regards
>> Luca
>>
>>>
>>> Thanks,
>>> Neil
>>>
>>>>
>>>> Yours,
>>>> Linus Walleij
> 

