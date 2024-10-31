Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F409B7A8E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 13:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA53110E412;
	Thu, 31 Oct 2024 12:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pWzIEYkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5608310E412
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 12:31:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so551661f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730377909; x=1730982709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TtULGftwvkV6PBeqGDEzspAud7gcNgJ/xN3Giran/QY=;
 b=pWzIEYkgxLzGF9lgwWZzJy4oFWTnOPPmoCnA1EDG8Fl8WVbsoBWtDUIJ1ctfKk6rRd
 ZU2yDjVDD0eGJJEmVSI5a4MYmd/q1wm9GEnCqpcCjVs2zQwO5hvMz58h/rAyCPp8KK/r
 UF+c4b4O0jdrpevmxkyGGr+1SFadwP4dEjsTq5N3p1+glwcOvaggg0cCnpNZJZzYJoNL
 uNtA3iH+lC8EYtS8jBZ+qlu9scTe0JgUcyFi+XOqD+VK1cukeqbjQm94Lb+ZWfxjenL3
 h5OcEdmKuSr5cEWTOXcI7dZ+Bd/NTP7d4SJaG5owwhkKGAs9u9pbb7mwsp8owwCZ/L5V
 0wQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730377909; x=1730982709;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TtULGftwvkV6PBeqGDEzspAud7gcNgJ/xN3Giran/QY=;
 b=vtriX+UINh/He7fnJNbGVXjp8y8Ai8l3iK0zvqZef63+iYlLkjgJuVcYZ2QkWdm4Jg
 TRSXJvhpF3vpm+Fd90LHn1Kpt+y4gC9d1ikEk9ZfF8uuQ5rev/39gy20d+E1pI/gBlf2
 ABMLAakX+nh63/T2NIeD2aPL/p5iJdVMpVwtWZKDuiUltOxf4uwNte7gGgri0soHTSJn
 mGhOZkiFoTDcCzNGO7IZu3lsIbHj5RI2bHzKyaIJkQH4kvO12rkuLct6xWryuEYeBzcb
 XtNK/eZ4it1zYPLcXYJaYVi16pS7y3EQ3IzHfbSAhZ7p+JEV7tZC6KSGgSjaQpB/nkWC
 oVQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaS6D9ORsiltM6sV4gbBszWxLg997Ubljf3CssN690JeFkfCHDnuKh8/tqOC8czwgIQDfiBFPdjUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM8SL1Yxgs/bvvtobFDklm/geJxAyK4hZt7AcbN7DBhM4tbJXp
 LxPcd9Z0W82VbKsMp2mScuRzdo2Z8DS1mrafE5DS8iwsn1vQjje4z5IXlUl8gQA=
X-Google-Smtp-Source: AGHT+IGkHR0OvxDEr7PMMN5pZS2wB+wRi7rYAoUIxvk8EKhcVrYCEcy8oIPQET5ElU3EYFZKT+iwFQ==
X-Received: by 2002:adf:f1cd:0:b0:374:c8a0:5d05 with SMTP id
 ffacd0b85a97d-3806121ff99mr13664108f8f.50.1730377908520; 
 Thu, 31 Oct 2024 05:31:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:de28:ccc7:fdcf:6514?
 ([2a01:e0a:982:cbb0:de28:ccc7:fdcf:6514])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5230d5sm24947215e9.0.2024.10.31.05.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 05:31:48 -0700 (PDT)
Message-ID: <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
Date: Thu, 31 Oct 2024 13:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
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
In-Reply-To: <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
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

On 30/10/2024 15:49, Sui Jingfeng wrote:
> Hi,
> 
> On 2024/10/21 21:08, Neil Armstrong wrote:
>> Hi,
>>
>> On Fri, 18 Oct 2024 15:49:34 +0300, Abel Vesa wrote:
>>> The assignment of the of_node to the aux bridge needs to mark the
>>> of_node as reused as well, otherwise resource providers like pinctrl will
>>> report a gpio as already requested by a different device when both pinconf
>>> and gpios property are present.
>>> Fix that by using the device_set_of_node_from_dev() helper instead.
>>>
>>>
>>> [...]
>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
> 
> 
> It's quite impolite to force push patches that still under reviewing,
> this prevent us to know what exactly its solves.

It's quite explicit.

> 
> This also prevent us from finding a better solution.

Better solution of ? This needed to be fixed and backported to stable,
if there's desire to redesign the driver, then it should be discussed in a separate thread.

> 
>> [1/1] drm/bridge: Fix assignment of the of_node of the parent to aux bridge
>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/85e444a68126a631221ae32c63fce882bb18a262
>>

