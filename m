Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130098A9B0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 18:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860DD10E263;
	Mon, 30 Sep 2024 16:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gj0bEUCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA71210E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 16:24:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cb58d810eso33438445e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727713486; x=1728318286; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KTQmpWX1xjrIeCQTKfF4B9XU+G77FDiaMmwwkCmoSps=;
 b=Gj0bEUCm6Ith9TDWGGdijqwhxY4OS8f89YjkAmsElllhVUMutasuNht5m1JAn76wYI
 PeQvnAu/B7w9Z1HaAps3O+gBKLxxBHZQ6wS3a4HjZX8FZawGtM95ajwgMDVdvWqfW62b
 dv/pc+kwdXnqm8QYeN2zvNa1yuRstmSvqDV+s7zwLi6RSrK+f5632u+VgEzPTAwJAbaf
 o1brxfKdtYwx6xt90Azt9WEwiA8B1pDCyMOWCBO93qHDWAhNp/CMMVVWsvg8No0MPbeA
 3Cqtf6XisnBk7XVRTvHebPXVDCWnDHoT+ahdTaJHYuYzeXrBkvK2JNLGAQZccoltGGlU
 0JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727713486; x=1728318286;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KTQmpWX1xjrIeCQTKfF4B9XU+G77FDiaMmwwkCmoSps=;
 b=vptsGxLNS6B1N1pCtGCN2VBOH6dFa2C7klRdtLqLPzJ6HXYKRp5u3ksaDEVQFV7k70
 QJMrijC+VNIkpJAQr3pOINEvy/RZ1dNiYqMjjB24ej0GfuphJ8dmW157ZB+QoqZuRESY
 nkJqoeaUza/XiPt94kTb9FgbBF5YmkHAgi6/0dsyl4QLiq+o5LLZz65fSLnP9O+JTOUc
 GhL1u4XqtgGsawzqL0e6CjeG3/vo0J20v2bRtAX5DcMi+K37h1JP2yYAuSTKPoOeO1SU
 U/mp6qHm9kfv1JPUyxQyTusGaLQQYuuVaSUkPjcpiqKzPgG3ftGWtRcbyD0B7+zV3pzu
 DL9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr42YojVH5dlkbVMyc4FYLynGI2Gzil3w5PANiEnQ7Aen2oFcevG8+PZx1jg+BadjlbrBjeAaAoiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDWo7At3pqYKXCc1+cZYmht9VQJFJU4/2OYRpAGLxF9oQGIvVq
 EnS6eAatIkg3qB48pD8dlSoff1jk7GrfU1zL57qqPYVMS9sksB68Pjp0+KvagFk=
X-Google-Smtp-Source: AGHT+IFjyl1j45oZbdtAwMgdv1A0Xh0Oniofn6QvCC2y9fqqxuW5fJm1hT9Wb31GWHDBB6/zrBOuGw==
X-Received: by 2002:a05:600c:3b88:b0:426:64c1:8388 with SMTP id
 5b1f17b1804b1-42f713698d9mr1065435e9.17.1727713485908; 
 Mon, 30 Sep 2024 09:24:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828?
 ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f57dd30efsm106891195e9.9.2024.09.30.09.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 09:24:45 -0700 (PDT)
Message-ID: <16bd6bc2-8f10-4b99-9903-6e9f0f8778d8@linaro.org>
Date: Mon, 30 Sep 2024 18:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm: panel: jd9365da-h3: fix reset signal polarity
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Jagan Teki <jagan@edgeble.ai>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240927135306.857617-1-hugo@hugovil.com>
 <f9b0cc53-00ae-4390-9ff9-1dac0c0804ba@linaro.org>
 <20240930110537.dbbd51824c2bb68506e2f678@hugovil.com>
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
In-Reply-To: <20240930110537.dbbd51824c2bb68506e2f678@hugovil.com>
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

On 30/09/2024 17:05, Hugo Villeneuve wrote:
> On Mon, 30 Sep 2024 16:38:14 +0200
> Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Hi,
>>
>> On 27/09/2024 15:53, Hugo Villeneuve wrote:
>>> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>>>
>>> In jadard_prepare() a reset pulse is generated with the following
>>> statements (delays ommited for clarity):
>>>
>>>       gpiod_set_value(jadard->reset, 1); --> Deassert reset
>>>       gpiod_set_value(jadard->reset, 0); --> Assert reset for 10ms
>>>       gpiod_set_value(jadard->reset, 1); --> Deassert reset
>>>
>>> However, specifying second argument of "0" to gpiod_set_value() means to
>>> deassert the GPIO, and "1" means to assert it. If the reset signal is
>>> defined as GPIO_ACTIVE_LOW in the DTS, the above statements will
>>> incorrectly generate the reset pulse (inverted) and leave it asserted
>>> (LOW) at the end of jadard_prepare().
>>
>> Did you check the polarity in DTS of _all_ users of this driver ?
> 
> Hi Neil,
> I confirmed that no in-tree DTS is referencing this driver. I did a
> search of all the compatible strings defined in the
> "jadard,jd9365da-h3.yaml" file. I also did the same on Debian code
> search.


OK then:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
> Hugo.
> 
> 
>>
>> Neil
>>
>>>
>>> Fix reset behavior by inverting gpiod_set_value() second argument
>>> in jadard_prepare(). Also modify second argument to devm_gpiod_get()
>>> in jadard_dsi_probe() to assert the reset when probing.
>>>
>>> Do not modify it in jadard_unprepare() as it is already properly
>>> asserted with "1", which seems to be the intended behavior.
>>>
>>> Fixes: 6b818c533dd8 ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>>> ---
>>>    drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> index 44897e5218a69..6fec99cf4d935 100644
>>> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> @@ -110,13 +110,13 @@ static int jadard_prepare(struct drm_panel *panel)
>>>    	if (jadard->desc->lp11_to_reset_delay_ms)
>>>    		msleep(jadard->desc->lp11_to_reset_delay_ms);
>>>    
>>> -	gpiod_set_value(jadard->reset, 1);
>>> +	gpiod_set_value(jadard->reset, 0);
>>>    	msleep(5);
>>>    
>>> -	gpiod_set_value(jadard->reset, 0);
>>> +	gpiod_set_value(jadard->reset, 1);
>>>    	msleep(10);
>>>    
>>> -	gpiod_set_value(jadard->reset, 1);
>>> +	gpiod_set_value(jadard->reset, 0);
>>>    	msleep(130);
>>>    
>>>    	ret = jadard->desc->init(jadard);
>>> @@ -1131,7 +1131,7 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>>>    	dsi->format = desc->format;
>>>    	dsi->lanes = desc->lanes;
>>>    
>>> -	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>>> +	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>>>    	if (IS_ERR(jadard->reset)) {
>>>    		DRM_DEV_ERROR(&dsi->dev, "failed to get our reset GPIO\n");
>>>    		return PTR_ERR(jadard->reset);
>>>
>>> base-commit: 18ba6034468e7949a9e2c2cf28e2e123b4fe7a50
>>
>>
> 
> 

