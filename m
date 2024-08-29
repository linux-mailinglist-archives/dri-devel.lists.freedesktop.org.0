Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51932964278
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6770D10E616;
	Thu, 29 Aug 2024 11:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w0HqrjxK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C074110E616
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:00:22 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42ab880b73eso4940595e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929221; x=1725534021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zCBO2fXDMFuHjibYZ90lcTzSffCRMYyprDRaor954cw=;
 b=w0HqrjxK+KMSGzaw6LWLYZtcmoar4zIIdB6a28zjG2BseiUcswu90AajldK7Jun4Sx
 sd5T7HiYdr9qhX5fo2ddOnnkTX7fyYXdikPtHBebZvxsTOVd06+x8o8O4QMUmbcjrKOb
 qGGIAto1o0vpM8StBKOgs+cMyEWnslO6Q7EGBLz89mrENMOnzpOW2mS7DakgCpEdZ5sx
 VSC++6fFPC8wpDUXFuDnhcKeObZIOVOT11oXZpO5gV0Xd3PZnWBeYAnxtnI/PfuenIX1
 s9fesAgZBfk/aJO1gAYetFZ1cuEKEbJzgkpeUf7UV39LJSCokBZLUYf8WFLLm8pT+hkq
 PwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929221; x=1725534021;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zCBO2fXDMFuHjibYZ90lcTzSffCRMYyprDRaor954cw=;
 b=XRkIy5nhhUwPn57L3bmfSLfmsuI3Ke981uIWawgnNq3qylAXer2ArLdwhNYZXbcqvy
 scSALQyHqBhNjybd2rkA6AH7FDQMrpWWqPCZoaqakhDvvfM6BxuAUzFm7bUGbQfOHWF3
 IXlIDHCEOQCOXQLK1Vhsfu2syTczAtF/SMylcqXjdJSF0Bl6tkbgM2jafu9dkdQHj5kj
 sJh0DLtBTKQDI5ubOYg6w9n5xQzn1jcnqYWwfz9+uLt4T6Rla93qnPfLYJaaIArKZL1L
 h/eVILDbBPLEmQS1U3ZjOvvJH2MIEIbmRhf4gyXO/81AW/xOsWXlNGVOxmatJJM2p/ol
 7Lrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/y3N2wLrOjAyeXrW19aDUZyKkOkqpxmQbW8tl2a0lJKV9Ggk73PK8Eed60zmcSTTMtyUzxdRCwEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDNrfLZyooT0bwMm2TsvQ+UXvIooO5ToDOgjOML5BS1ygyhdk1
 UE7kM108GjbwQpHeYCHCSoHcl63+l084aG47bIJS8oOUq3p/Skx5VYOmeef29vzqrsTm0Qf9CGl
 U
X-Google-Smtp-Source: AGHT+IGG76SR3oNW+HCIychd+P3LUXVnADqBzPZBXBpifnY7av308etEvxlverR30bjayZZkQv+6vw==
X-Received: by 2002:a05:6000:88d:b0:368:420e:b790 with SMTP id
 ffacd0b85a97d-3749b5447aamr1570845f8f.14.1724929220635; 
 Thu, 29 Aug 2024 04:00:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915?
 ([2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee6f76asm1100153f8f.25.2024.08.29.04.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 04:00:20 -0700 (PDT)
Message-ID: <de807810-ab84-49eb-a96a-080f44452205@linaro.org>
Date: Thu, 29 Aug 2024 13:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: visionox-vtdr6130: switch to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
 <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-1-0cae20d4c55d@linaro.org>
 <CAD=FV=Wke51vmTy7zZ+RV7oDoCGSeszOarhLGapdDrkByNyi-g@mail.gmail.com>
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
In-Reply-To: <CAD=FV=Wke51vmTy7zZ+RV7oDoCGSeszOarhLGapdDrkByNyi-g@mail.gmail.com>
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

On 28/08/2024 18:32, Doug Anderson wrote:
> Hi,
> 
> On Wed, Aug 28, 2024 at 9:03 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> Make usage of the new _multi() mipi_dsi functions instead of the
>> deprecated macros, improving error handling and printing.
>>
>> bloat-o-meter gives a 12% gain on arm64:
>> Function                                     old     new   delta
>> visionox_vtdr6130_unprepare                  208     204      -4
>> visionox_vtdr6130_prepare                   1192     896    -296
>> Total: Before=2348, After=2048, chg -12.78%
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 186 +++++++++++-------------
>>   1 file changed, 82 insertions(+), 104 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> index 540099253e1b..ebe92871dbb6 100644
>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> @@ -40,120 +40,103 @@ static void visionox_vtdr6130_reset(struct visionox_vtdr6130 *ctx)
>>   static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>>   {
>>          struct mipi_dsi_device *dsi = ctx->dsi;
>> -       struct device *dev = &dsi->dev;
>> -       int ret;
>> +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>>
>>          dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> 
> This isn't something you introduced in your patch, but I wonder if we
> should avoid setting the "MIPI_DSI_MODE_LPM" bit when the function
> returns an error?

Yeah it's unrelated to this change, but I'll investigate.

> 
> In any case:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Neil
