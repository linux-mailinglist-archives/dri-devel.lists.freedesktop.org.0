Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E128FE18B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 10:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E66510E10C;
	Thu,  6 Jun 2024 08:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XYVlaTD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB1C10E22A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 08:51:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42148c0cb1aso8548905e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 01:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717663869; x=1718268669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ZI5zO681dIZ5q8bqEnHAbUgRlM/vYadx+NmJdrvw+DY=;
 b=XYVlaTD4GkFbCPf13fWr4+kfCtWfnhk0QjCq85n5ZPjHPs0YkBTWOuxM4f5hCkXMGb
 l1B9IHUGah+w+ZQYKTuGEiri4hwPzEE7uj/Ah8nv+E1b0UnOVUBqajetDS3QlbC7kpMB
 2oNijAAspo0fflhwG+DVfucmFzt6CaIZWzRUzJPWplySQqrFjXS1nA3eR8xi26ox0q3K
 BV3TdKnCsWJDwyulBq2o+OpZVQ6G8DoCiBSFOuubjnfREN+aDp9Useb1tfKiXBHn+otH
 tqYRzDS7saQw7p01ZkkMfQ3Tzk2e4rMBuQSosA+fDs4L7JO52POVwD3ZcOuNxOZo5tsW
 xmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717663869; x=1718268669;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZI5zO681dIZ5q8bqEnHAbUgRlM/vYadx+NmJdrvw+DY=;
 b=He13D38Bv2CrO6c2pN8MScwJkEy0HmuWenldj/lM8ch9PhiBfq5k/Zypx3QSKjyWcR
 kqM54nSCjrjUnXLMPRoE+js2cSgLwRZF0UQM0kioH0kWSIECmNjJ/Rlw1A3dtjjVfApO
 lMqJJfJZS7RD7yHs60vuSmGLtB+j5ofKgEF6KVjfLLn4AAh6RssXLmtmRUDTwHYzbAAr
 ghS0cdCUQzVBGljyYgqloQf4gT8AhPYwKtBzDABdKTWREsSnVClAJSk5CEdQAEl4YoKB
 2mv4D/sT0SaFGzgDpGUksfsiSVYZzHjVDl8GHl0gJM6PNr7lc1DZJrBY5Xd/bLHTJDcn
 fOZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaTC0KR8aIGE8P//GI0CzHuL/rwV/bIKGLvZ7THehmZJBPVlVLt+h4+rCI6PhO+dCKexIZVjTOM/Rd74+HFTWjB8+m59nDC4nMuAK1DfAq
X-Gm-Message-State: AOJu0Yzru8h8PIdxo0+Vk1T3tN+J7QMOSulZ06wds3w6WVSiL74rnnXA
 QMXWFHDI+JV4R21j3AekW2IePJBgXnMFYJbaccoWmT3vFRhsU/k2Xd0vF/kq428=
X-Google-Smtp-Source: AGHT+IESxvRQoF/gagRjviYpc/SnR8a0ifFLan5H7+GDdNM95jrQIk7lkTGWJoL2Z9fRMGQKoi/Rxg==
X-Received: by 2002:a05:600c:1f8e:b0:421:29e1:998 with SMTP id
 5b1f17b1804b1-421563392dbmr36961795e9.39.1717663869196; 
 Thu, 06 Jun 2024 01:51:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2?
 ([2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4214bf59f60sm67973595e9.1.2024.06.06.01.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 01:51:08 -0700 (PDT)
Message-ID: <a5f7c9bc-49fb-4b20-bfed-0f65606c5e3b@linaro.org>
Date: Thu, 6 Jun 2024 10:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] drm/panel: simple: Add PrimeView PM070WL4 support
To: Primoz Fiser <primoz.fiser@norik.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko.stuebner@cherry.de>, Chris Morgan <macromorgan@hotmail.com>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20240606080104.3663355-1-primoz.fiser@norik.com>
 <20240606080104.3663355-3-primoz.fiser@norik.com>
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
In-Reply-To: <20240606080104.3663355-3-primoz.fiser@norik.com>
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

On 06/06/2024 10:01, Primoz Fiser wrote:
> Add support for PrimeView PM070WL4 7.0" (800x480) TFT-LCD panel.
> Datasheet can be found at [1].
> 
> [1] https://www.beyondinfinite.com/lcd/Library/Pvi/PM070WL4-V1.0.pdf
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
> Changes in v2:
> - sort alphabetically
> 
>   drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index dcb6d0b6ced0..80cca841db15 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3567,6 +3567,32 @@ static const struct panel_desc powertip_ph800480t013_idf02  = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct drm_display_mode primeview_pm070wl4_mode = {
> +	.clock = 32000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 42,
> +	.hsync_end = 800 + 42 + 128,
> +	.htotal = 800 + 42 + 128 + 86,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 10,
> +	.vsync_end = 480 + 10 + 2,
> +	.vtotal = 480 + 10 + 2 + 33,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc primeview_pm070wl4 = {
> +	.modes = &primeview_pm070wl4_mode,
> +	.num_modes = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct drm_display_mode qd43003c0_40_mode = {
>   	.clock = 9000,
>   	.hdisplay = 480,
> @@ -4725,6 +4751,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "powertip,ph800480t013-idf02",
>   		.data = &powertip_ph800480t013_idf02,
> +	}, {
> +		.compatible = "primeview,pm070wl4",
> +		.data = &primeview_pm070wl4,
>   	}, {
>   		.compatible = "qiaodian,qd43003c0-40",
>   		.data = &qd43003c0_40,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
