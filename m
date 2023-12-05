Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2F5804C05
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2EE10E49B;
	Tue,  5 Dec 2023 08:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5DF10E49B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:14:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33330a5617fso3344937f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701764062; x=1702368862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3r3u+lfPgj1JME98keqJXmNsSgVU0cZOaWgFI+wHvyU=;
 b=oxpLUNwKgi1XgtfnxCOFVHlh+19NfFDKLnzWxGzZVMxIJau+XowesHbkRoGBJLYC1M
 wCGpu6PFFW8myr+SQHw7t5e9BFuJBdJCjxGlXvKnAddU7Bwv2QKhHvxE+t2oeMxJJB9N
 5D0FUA7BPEV5sc+K6lXb9FRKAPMyE/0eE4qVysWy0WbV7y4LX1P6CAV5x3vs/70nGPRi
 mjlj60MC2PiiRkm7ZZzd/DNNSeSPZKbPUqsO51jWzEz10WvhRoS6OgfYR6cfF/VOklx0
 xxW6LfKvecmeJfWFRRO4aBegLJMmHNGponmwxsIVSmp/MUmS39hPj96E3PhV0DfOigMW
 l6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701764062; x=1702368862;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3r3u+lfPgj1JME98keqJXmNsSgVU0cZOaWgFI+wHvyU=;
 b=AtA1c0hI+MtIFeKqp1ztiG07cLjTFfUe9x2y/UWMnJIiDVq7uj6ZAoryOjZbZmmzm2
 UhzT4XD3YnZ/4G8kieRTYnJ5h7J8AuUkMBqdiqhE5n5wk6XroejxSmlPwBXMOTgmuKGQ
 OOqCDD0Z8EWvGMVQLpw/ettTbJLc5m04OHlAypq5NCuKiK4y5c0hg5Fda/RY4vY35v6U
 VutQ+KgwN2wuSGbXGQ5HoZlWPjGqUJ36OofEIPU5gQtwGtwTUWusK4sTQCijgFRVLRSm
 n6ZqUYBuSWDNX4X4vBaEDsDaqOWtxk7eUzOMCizGJfU6vdG0CzvIGARgdv0WL8fkT6p0
 eixA==
X-Gm-Message-State: AOJu0YyaPizJkN817riaxa1n0VjVodWGCg6P1JWvjzyQBYvI2dGuuGtQ
 vmpmwxnwEW5hH594p4kPvQZwMw==
X-Google-Smtp-Source: AGHT+IGVKYcMrW+WT06NoqnE3KfNoyRxuwkiBfywhYdAyuWS9yEvlOB6hd1OtWDyG/1dfRdI7b+2ww==
X-Received: by 2002:a1c:4c19:0:b0:408:57bb:ef96 with SMTP id
 z25-20020a1c4c19000000b0040857bbef96mr246760wmf.30.1701764061761; 
 Tue, 05 Dec 2023 00:14:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb?
 ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b004063cd8105csm21461190wmo.22.2023.12.05.00.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 00:14:21 -0800 (PST)
Message-ID: <600382c8-9560-4228-b621-b41e28b2ace4@linaro.org>
Date: Tue, 5 Dec 2023 09:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel-simple: add Evervision VGG644804 panel entry
Content-Language: en-US, fr
To: Michael Walle <mwalle@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20231123102404.2022201-1-mwalle@kernel.org>
 <20231123102404.2022201-2-mwalle@kernel.org>
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
In-Reply-To: <20231123102404.2022201-2-mwalle@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2023 11:24, Michael Walle wrote:
> Timings taken from the datasheet, although sometimes there are just
> typical values and it's not clear if they are no min and max values or
> if you must use the typical value exactly. To make things worse, there
> is no back porch but only a combined sync and back porch length.
> 
> Unfortunately, there is not public datasheet. Therefore, here are the
> relevant timings:
>                   | min |  typ   | max |
> -----------------+-----+--------+-----+
> CLK frequency    |  -  | 25.175 |  -  |
> HS period        |  -  |   800  |  -  |
> HS pulse width   |  5  |    30  |  -  |
> HS-DEN time      | 112 |   144  | 175 |
> DEN pulse width  |  -  |   640  |  -  |
> VS pulse width   |  1  |     3  |  5  |
> VS-DEN time      |  -  |    35  |  -  |
> VS period        |  -  |   525  |  -  |
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9367a4572dcf..26702a847b63 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1973,6 +1973,33 @@ static const struct panel_desc eink_vb3300_kca = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct display_timing evervision_vgg644804_timing = {
> +	.pixelclock = { 25175000, 25175000, 25175000 },
> +	.hactive = { 640, 640, 640 },
> +	.hfront_porch = { 16, 16, 16 },
> +	.hback_porch = { 82, 114, 170 },
> +	.hsync_len = { 5, 30, 30 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 10, 10, 10 },
> +	.vback_porch = { 30, 32, 34 },
> +	.vsync_len = { 1, 3, 5 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc evervision_vgg644804 = {
> +	.timings = &evervision_vgg644804_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 115,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +};
> +
>   static const struct display_timing evervision_vgg804821_timing = {
>   	.pixelclock = { 27600000, 33300000, 50000000 },
>   	.hactive = { 800, 800, 800 },
> @@ -4334,6 +4361,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "eink,vb3300-kca",
>   		.data = &eink_vb3300_kca,
> +	}, {
> +		.compatible = "evervision,vgg644804",
> +		.data = &evervision_vgg644804,
>   	}, {
>   		.compatible = "evervision,vgg804821",
>   		.data = &evervision_vgg804821,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
