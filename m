Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594318C4DDD
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 10:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2CC10E498;
	Tue, 14 May 2024 08:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rOntfd+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857D810E498
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 08:44:29 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59ce1e8609so1083842866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715676268; x=1716281068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=R8VqkRij0WMpHYa35VasMXQrv2YaZLsJLDLUP+EZyj0=;
 b=rOntfd+0DkBL4vJUatStBEw1A3DvxIJfbMz6l/nePwynbM3uGh0GQ+NBDhSIbHvBEy
 IiwGwxv7g3QLvfrkX7lybASsngVKD10j7ZixRjvWVQvBFt0gttvldS++OwVtWfZxaeSZ
 g5oTPIa4/T0/g/emfwiO7fOb3tM7Ef8yl09bzNNTzj7W3KsmjIJRcIKv1djRhXL/S0Ht
 eoPut5ANfZ+w45/WFtnECVNBUXo5JyCa4mOLcXm1cZob1krdMGI5cIhZC/CyXCky58dj
 L4tchxO8qegeYWGPH4D9UFD8KQRHCHYansHnD8FcdcvGBoixCIn4fJo9MYugGqtkLbsV
 KeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715676268; x=1716281068;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=R8VqkRij0WMpHYa35VasMXQrv2YaZLsJLDLUP+EZyj0=;
 b=RZHtAVX+VATu7IZw0E1ixCWhYwWERoPCM+CeJDrmdx0waRYJWLIQh9HjHJv9y2XopH
 3rMuvgYjVhAY5Xq4o9mB0zhoXJz2tI2ayk9sxMEBzlbiLLwScAVbDBkTm52EgufF+9SV
 ltj5qT7PMghLcDccJ0mvttC+uxYOZXbMU6WATSUFRvYkWwlh06psLZ0UP0GHINoGarqQ
 v7obtpNUvaF39Al1VENO2qhUNufDkH10x5VbGEHhbvNjQqlYFukl4FvAgkCBct1+WN+U
 tjj9/EvgmaD+vrigmXC0pgMf2XCJ7dipAQY3LWMB1AeQgy2x6iVMjjqvBvYX3fTtSaC6
 tCZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Wz71Lx0XLUh7TN1qdvH06qEJ1wiiwF/JRU9+55mBP2suuDajgzRzxkEam8/lTciyKRK5SFhOGp6uB4dJn65iNHehes7uaTjTzPoesysB
X-Gm-Message-State: AOJu0YzqoeMyUB+5UzehRIrs+hXcoW0rxeBop9rvgQ9x/6ezMwyh0XA7
 FTQUE2qJ6Wy1/Glg+JnsRnzpqcT5gjB0TGJkBMMaaLOSokfHWbk2kzGKE8VdID0=
X-Google-Smtp-Source: AGHT+IE8nJilU29Fw1fFlxNnytzQcgglRReBkYoprBZaNxRl5+KclDd7dkoKUAr+c9rnQqQAzlKHmQ==
X-Received: by 2002:a17:906:19d0:b0:a59:fb06:5d35 with SMTP id
 a640c23a62f3a-a5a1156665fmr1158823466b.8.1715676267705; 
 Tue, 14 May 2024 01:44:27 -0700 (PDT)
Received: from [10.91.0.73] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17891f87sm690254566b.65.2024.05.14.01.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 01:44:27 -0700 (PDT)
Message-ID: <a1108f14-9a1b-414a-97c5-0bc43457d635@linaro.org>
Date: Tue, 14 May 2024 10:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] dt-bindings: display: panel: constrain 'reg'
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
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
In-Reply-To: <CAA8EJppkJ9rukeUZ=1kAL3Y0WVhN5QFXnNU3tjv4yuXMjc++7w@mail.gmail.com>
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

On 13/05/2024 18:41, Dmitry Baryshkov wrote:
> On Mon, 13 May 2024 at 16:17, Rob Herring <robh@kernel.org> wrote:
>>
>> On Thu, May 09, 2024 at 11:42:50AM +0200, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Cleanups for display panel bindings.
>>>
>>> Rob, maybe you could take entire set if it applies? I based it on
>>> linux-next, so letl me know if I need to rebase on your for-next.
>>
>> Applied. These 2 don't exist in my tree:
> 
> It's most likely fine, but was there an ack from drm-misc maintainers?
> 
>> Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
>> Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
> 
> Because those were added to drm-misc during the last cycle. So ideally
> the patch should have gone through drm-misc.
> 

Exact there's a conflict on today's next, Rob can you drop them so I can apply them via drm-misc ?

Thanks,
Neil
