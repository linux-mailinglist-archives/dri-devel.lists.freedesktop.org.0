Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7569B6916
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 17:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D11310E3E5;
	Wed, 30 Oct 2024 16:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DRYg3SrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3ED10E3E5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 16:26:16 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37d50fad249so49028f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730305575; x=1730910375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=nRQIzE56a78f3UCXKUKwjgBDwr7TVubijgfr1LJ07ho=;
 b=DRYg3SrLsTKKMtCtEJTn4XoY9N3qiR/42kwtV9RYLStgbSvr0fk442f+XYVdkrw4JA
 XC+9y+KMLzyBtbRxTzxJANZXO36LMCMcmv3v2RmTa8u/VVd2Jgvt0i7zhsJITPyyRFKr
 28tX9YtzZT50ms/nLtp9iawQKBXaA7fdx+TAdJ0TyzguGjIL1rUBZDhwQxgk+vmLF6R5
 28Vh23WX/iuqjv2rvqPFbIWHxwTt5cJXnPYcf66JOX/e+vtBDOMudrF2ru3oZkiRCBUt
 cHvUZZb+7l6Cc3tIBKhEoMmy13CC7HIBjPXCh6MUIpikgWbsQdLW/JmN8ydJZq9s6Wj0
 ndww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730305575; x=1730910375;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nRQIzE56a78f3UCXKUKwjgBDwr7TVubijgfr1LJ07ho=;
 b=WkXmKjl4lyiACOuOUNiYaZ8bYPkRzSJ9M3Sg58NHfbcaKoAHmW3A/gc4ycY6S2JhbT
 kRcsNEicFcdldFeY2UPHbdplErAWJPm5rxnylvo9zlAQ2TxMZk5tPECLnCx2mgaBGfG4
 i4lMtu0kE2P+zJ3OCtBEeJCJTsqL5WNtXTxHwfXX7+dWVES75tdegGRVyaybU/qjkXQP
 rRUB7vdcZDz69onukd67a5EhpM1OMrNcCu3M5+fm9jAtgKGErvAFMt7BuYtUUVJteo8M
 Tpbr8v1bAwyHggE/YaF2O0kij5ty46qr7nWAM1dPVCX+9JHI2wNon2Lj3dEYiHkdSixp
 TIGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWELpZjn7o5aD4kKVUqUr1yh4m5cwmNN0CbL965t0/wWIDsg+HTd2L4lQQjSk8V4RyiyHq9Zwu6mjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOROqkFi0/du/tSTFJ6lCwjupXzZIAAlwyxAMjhV60GHzXKL/E
 eUZX0xso5uQxf4z9cjBrnGk6qzEEGoIQPNn+p739WLjLqCAwMsJz1Rxjq5RMc94=
X-Google-Smtp-Source: AGHT+IGQ8G7g4zNKZcy/h19K3HYfsFs0a2mnCjVa1TLoKI8avaYE7I8PLXucpWqzh2b6kF4aX23e1w==
X-Received: by 2002:adf:e304:0:b0:37d:3a2d:8577 with SMTP id
 ffacd0b85a97d-3806115a2e6mr12142255f8f.33.1730305574942; 
 Wed, 30 Oct 2024 09:26:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:201:dd6:9287:c715?
 ([2a01:e0a:982:cbb0:201:dd6:9287:c715])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b479a4sm15664996f8f.55.2024.10.30.09.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 09:26:14 -0700 (PDT)
Message-ID: <ea885b7d-e44b-4fdd-bada-ae368bb7c1b7@linaro.org>
Date: Wed, 30 Oct 2024 17:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241026035928.183454-1-tejasvipin76@gmail.com>
 <CAD=FV=Vps5vWD72O_kYhuKudduYed41+tZrVRB6x+FiaZrm-EA@mail.gmail.com>
 <c389ea3e-70cb-46c5-8cf1-878a99f771ec@gmail.com>
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
In-Reply-To: <c389ea3e-70cb-46c5-8cf1-878a99f771ec@gmail.com>
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

On 30/10/2024 08:24, Tejas Vipin wrote:
> 
> 
> On 10/29/24 12:24 AM, Doug Anderson wrote:
>> Hi,
>>
>> On Fri, Oct 25, 2024 at 9:00 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>>
>>> @@ -418,79 +398,42 @@ static const struct ltk050h3146w_desc ltk050h3146w_data = {
>>>                  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>>>   };
>>>
>>> -static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int page)
>>> +static void ltk050h3146w_a2_select_page(struct mipi_dsi_multi_context *dsi_ctx, int page)
>>>   {
>>> -       struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>>> -       u8 d[3] = { 0x98, 0x81, page };
>>> +       u8 d[4] = { 0xff, 0x98, 0x81, page };
>>>
>>> -       return mipi_dsi_dcs_write(dsi, 0xff, d, ARRAY_SIZE(d));
>>> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, d, ARRAY_SIZE(d));
>>
>> FWIW: the above might be slightly better as:
>>
>> mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x98, 0x81, page);
>>
>> That would make it more documenting that the 0xff is the "cmd", has
>> fewer lines of code, and also gets the array marked as "static const"
>> which might make the compiler slightly more efficient. ;-)
>>
>> Not really a huge deal, though.
>>
> 
> I did try this initially, but got an error because of page not being a
> compile time constant. Not sure how I should handle this.

I think the current version is fine:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 

