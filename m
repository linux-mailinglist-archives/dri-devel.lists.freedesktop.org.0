Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D3E9D85B8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 13:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A1310E002;
	Mon, 25 Nov 2024 12:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CuGDt2Vd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A65910E002
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:57:55 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-432d9bb168cso30605735e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 04:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732539474; x=1733144274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LK/o3FUGaKRZErsXHi8EyRs052osGciSWNJJ6Un26Ds=;
 b=CuGDt2VdNjftQnScreEpp/z94oLZ+uKuaOQo/N0zPZCzgI4W9hFwuBfjaQcWVJyyAa
 JvAygtjJHs2Ww+nzapW96IU+h7TwQ1AI/BzGlksi1BS1TBne909WXf6Vq8H4pH1EbDix
 Rk4xKnYzNCqcyqZZtU5VVO94aEoBg2As1p00m1rHBsIYF2pL8N4N6WKLVWuZD6RZyvpW
 yiCw/IRlVZgn5TZfokpPAp9/L9MXlz/LKTsYQLnOx6h3UCOhunOKlzsVDQtzn7PBmIgN
 y9JNjGz70Tv/FnbfZSe8z77Cd+YshqiZkcdUAloSVfLelfQZMwaNtDsg92p/Z7aIQxgG
 E7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732539474; x=1733144274;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LK/o3FUGaKRZErsXHi8EyRs052osGciSWNJJ6Un26Ds=;
 b=UlptJ3OPUVLhbDn0JsMUX+trJW8Na4XIwh6RnMIQfcjKuEwM7hbH4u5msRWFgSL0Uc
 DMGMlystQf5Gn3D0WL1pUZyvhcFmiRF7h2oMfS1b1LI+f41G7iacIzhVbH1xoijgLewk
 FfGD9sVXxopweprnxciwCMbz0496dYTzLIR4pE8hNN+4r/6wG++jyDa03AOH2wrY+luK
 EXFwH9EgxKXIfOsN4nq3u23mQHWMCifLA4YCB4ZSAJB5PS7Xqb8umPmFgcR7GDyAG5U1
 pgmxQe1HHWirczK7bJgYIj86m8ZGPIpCCToeOJqljv8R5yN19/Kvwudf5xaWrlPIcwtt
 a3yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWklTaCrICfFogs3hcf70Qdn7qwr/WpDzgyvGVXKpqMlldNaZX3VjIEJG8KYKIULMIv+H3y+vpMEic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzegs9aj0nHtyMaxbr4YKu5z82h3Mv1LqZuVSbnf9X+Z9glnuZK
 GZz2Am1V+MDdAXtn4OHsooIeeyIAUd5Ue6tAS9Fkf/ntA3wdkb0bZeut7HCogNI=
X-Gm-Gg: ASbGnct51WpyXnXUHp87plESZynibUwVzLCs9puxnp1dwR/zu/K2n9i3NeuuAaqCGzY
 61RkQDL++KAT+05wN7grFKBFVHzTZyTyRc5rEc/4lkAAVJw58KwqX/9C/6Te0+YDYqGlAfTpxW3
 cesOIwDVEuY07CtGhYquGEARnSMFRN9fvjU2EsN5CywBsTe3JZI7feOqly5/zvu0JdVUpOpe+sD
 qblZ2yhYyHExdsfoE3FyJdokRUMq+mrF/MCB22m1GVQsUTxvEzBAahTcAg0zQHmf1EPwz/yCzE5
 qsb0JHoYyCu6xtynnDAN6uDYH0g=
X-Google-Smtp-Source: AGHT+IHp9ZbYEEuOqvzmzN9bYFgBoyUQCliRxucIR2i6oG6nzBgRHtwS7cuLaCKRHjn/8s+t8OKggQ==
X-Received: by 2002:a05:600c:1e1e:b0:42c:b603:422 with SMTP id
 5b1f17b1804b1-433cdb0b504mr101998665e9.8.1732539473751; 
 Mon, 25 Nov 2024 04:57:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b?
 ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349dc19fd3sm52076065e9.39.2024.11.25.04.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:57:53 -0800 (PST)
Message-ID: <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
Date: Mon, 25 Nov 2024 13:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
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
In-Reply-To: <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
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

On 25/11/2024 12:24, Sasha Finkelstein wrote:
> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> So this controller only supports a single mode ???????
>>
> Most likely. On all devices it is connected to a single built-in display.
> 
> Ack on all other changes, will be fixed for v2.

OK, so instead make the panel driver return this single mode
and from the display driver just filter out anything that's
not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.

Neil
