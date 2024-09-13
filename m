Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DB977A55
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8C710ECAE;
	Fri, 13 Sep 2024 07:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B6+QAD9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A8110ECAE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:55:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso16452875e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726214157; x=1726818957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qpTzSDvBYrkyHKuoj+wO5zn+z4Yh1FOYkc1VxdL7vAc=;
 b=B6+QAD9ozaSs+6EncqONld1lqzlQBBt970tQbqWFm+hb0bCkoh4rMifCgGaqRw7wSC
 zVcN6CHW9iK+oBbrgyyEXDHzGZP0azx7uIinSv1nAt+KewxMCnW3ODtsNzsx7OvCHog4
 LgPcbrpHVVLY1R9QloonLWP+wQpYvf5sI9TQjd0hXg+QDY/ndf6qLhwCUojKDPJDDwlX
 rqoLclzKC3pKIuREIfGmc2b7mSF1KZXyOII/ezXTtJ6I8tcRB0iBRM+Tl+OaPJhNurXU
 wLrio4ANRDZmLgXuhivJsXIhxCHeLA6Gg5j1cdz4hMgOAwRdl5GRp0XBr5j3dVL+sg4z
 Pqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726214157; x=1726818957;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qpTzSDvBYrkyHKuoj+wO5zn+z4Yh1FOYkc1VxdL7vAc=;
 b=Xrs4pE2GXzPMi9tjMBTjPwcZwIYhkqmVvPZt5wQwn19yL/TfCcpqZKehyWO9cqGcPz
 2v8fR+NyDeHA/MQSEb1DpQ+oYkghGmArqGBQf6YbCMy81fl51VVWFHeZFOLEC7eC9zuK
 n15ge1WQdhovfksAwMF+U2Jd/3fRvv+uOWJ6mb3RC2yeLeDzp96Z4nh4+V9VNql12kWw
 mq3x860Y9cvs1XvIrQSsb6UHNd9crKjrqoJGtSZj/rZSQkJycg+/g/xCovaBJFhgVIrm
 fKRlLyujkV/bi1poozbRpUo7EJQh9nVZuIuxVEo3ok3a0x/C8uex50Yn+rEUyZY/mznW
 4BXQ==
X-Gm-Message-State: AOJu0YxhQ6G42J5D1h9dENpWlcAiZoXJWpjrHggHN9N4UfmsuFZrnZt2
 dSUzxo3dlpiOUWoB3QnsOPhxVkYnbK0+2zWnLPr2KJJaYldIrX7034+wYsZadUU=
X-Google-Smtp-Source: AGHT+IEMJDCWhsJ1G+6tU9z1uEdB6hFH+MN3Eo32SqDktckuuO3ZulfwrdeZkxDnoTWA251Oe42UZQ==
X-Received: by 2002:a05:600c:2058:b0:42c:de9b:a1b5 with SMTP id
 5b1f17b1804b1-42cde9ba226mr36532255e9.32.1726214157104; 
 Fri, 13 Sep 2024 00:55:57 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b054dd3sm15035345e9.5.2024.09.13.00.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:55:56 -0700 (PDT)
Message-ID: <ba9c9e9e-006e-40c8-b4cf-45dc08a5ea57@linaro.org>
Date: Fri, 13 Sep 2024 09:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Use vsync/hsync polarity from
 display mode
To: Esben Haabendal <esben@geanix.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240814-nwl-dsi-sync-polarity-v1-1-ee198e369196@geanix.com>
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
In-Reply-To: <20240814-nwl-dsi-sync-polarity-v1-1-ee198e369196@geanix.com>
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

On 14/08/2024 12:37, Esben Haabendal wrote:
> Using the correct bit helps. The documentation specifies bit 0 in both
> registers to be controlling polarity of dpi_vsync_input and
> dpi_hsync_input polarity. Bit 1 is reserved, and should therefore not be
> set.
> 
> Tested with panel that requires active high vsync and hsync.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>   drivers/gpu/drm/bridge/nwl-dsi.c | 8 ++++----
>   drivers/gpu/drm/bridge/nwl-dsi.h | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 8d54091ec66e..5f05647a3bea 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -289,13 +289,13 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
>   
>   	nwl_dsi_write(dsi, NWL_DSI_INTERFACE_COLOR_CODING, NWL_DSI_DPI_24_BIT);
>   	nwl_dsi_write(dsi, NWL_DSI_PIXEL_FORMAT, color_format);
> -	/*
> -	 * Adjusting input polarity based on the video mode results in
> -	 * a black screen so always pick active low:
> -	 */
>   	nwl_dsi_write(dsi, NWL_DSI_VSYNC_POLARITY,
> +		      dsi->mode.flags & DRM_MODE_FLAG_PVSYNC ?
> +		      NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH :
>   		      NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW);
>   	nwl_dsi_write(dsi, NWL_DSI_HSYNC_POLARITY,
> +		      dsi->mode.flags & DRM_MODE_FLAG_PHSYNC ?
> +		      NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH :
>   		      NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW);
>   
>   	burst_mode = (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.h b/drivers/gpu/drm/bridge/nwl-dsi.h
> index a247a8a11c7c..61e7d65cb1eb 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.h
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.h
> @@ -30,11 +30,11 @@
>   #define NWL_DSI_PIXEL_FORMAT			0x20c
>   #define NWL_DSI_VSYNC_POLARITY			0x210
>   #define NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW	0
> -#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
> +#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(0)
>   
>   #define NWL_DSI_HSYNC_POLARITY			0x214
>   #define NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW	0
> -#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
> +#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(0)
>   
>   #define NWL_DSI_VIDEO_MODE			0x218
>   #define NWL_DSI_HFP				0x21c
> 
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240814-nwl-dsi-sync-polarity-ddc58435a4c4
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
