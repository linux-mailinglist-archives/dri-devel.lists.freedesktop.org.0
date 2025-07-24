Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36405B10D0B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B1410E1F9;
	Thu, 24 Jul 2025 14:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zlzyRx1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1510E1F9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 14:18:32 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso11422475e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753366711; x=1753971511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=lQ/MB2FO+4yMWNUQ+Y5yKNu4mLCulW5xaxB8WmNAsDo=;
 b=zlzyRx1EFs81p4iNx3H3HAMgPo/xe5aDCgxR78Q7qKj77pJ769hdT/tkYlJkJcuN2q
 a2EeMiVoBovSG1OfI3rANYks8A55uR00ZpNT3ZjmA71jBdA1PWRdK0OIn4wRkJCvinrV
 eqJpwUlFtS8ovxQlhBCYd4ZXh2T8d4V5g5kuALEeZymaHnBpgnsOo6bE1ohNNmGae9aL
 JD1NfuuQOsxb0zjUtGDXh1swUME7bYPcy28iMZbBiz8h+TqIFpnKzvxIn43M1IOCIv01
 F11mz8lhFry9xBPwZFGMX7EMvcX15KPlcsuyL83XcsdXWdAO/a8XsKvljjmPetxagC+T
 +WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753366711; x=1753971511;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lQ/MB2FO+4yMWNUQ+Y5yKNu4mLCulW5xaxB8WmNAsDo=;
 b=ORLvmZM9u1AlIMQGszxrCx93sJtBWLbmioWkrfkMfgNQNzLTgs3sEYvTTeONtLJG8R
 ptpIQpa8Q4iDvANYbntb38ILP3HWAiHeXT5Ecf4Q+PW/qo/UHDBL6OY4itmFO3m0AOJr
 3NewDvMhDFB0uLnG24O7dlyCGFB0pIIkKvrj4tzXTQtylJjfvAG5tTNVWAFM/QkNyX5p
 7ibKI1SagwK4eKoPvzq7vuNWtoCY3FPE1ZIs+iXZ5wrdDbBxtG0rhT49/v4ia6V84XuQ
 uvFFtDolBGVlqItXV2ZNM+bouc7tZoycCYsRvYjRZO6y5q1az/FlTvphaxNPQts6KCnY
 xlAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnc9cacOIyFY20DIc7IjV6XoVBTSlVCxa5ZfAMAwNMsorqrpR3tOpBSFLhF65E6rFeYzSK6Fyvitg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzwm/SToE4C4Th638xEuRwRWInunE7ya+YTi7dJXIE2ERnijWPc
 uJKI+uTTQ6v9FKvRDak0/+Zx0RjGkIZ+9KQxvPfgbz/y3Qjf98Aq5QugsMGXAbvq/Z0=
X-Gm-Gg: ASbGnctgcbI8VMdoEeW2VwaeUTzGqe1g6fdjEle2i9Uhgw3HHa3GOX/DwBwP99RdHBW
 nU8DkTmPtzDuLBD5+o/rNd209GvK5ZKbx9O5DC21GAwpazy9sTLg2WsWf/JclmAf7xyyLVxfRAp
 JKHt8zIiwoUKoPDL6BueuyYdL3x+03uCsKwOBlY2f/Oo+/XA/aqZOKl0aM777jvgNudPyOBXXJn
 +UZf51AUFOrHKUKAkysJM6el77bF3eEVcM11hW78G/OPP65B8yaYaQUuiilui66ZrvEsjWEX9cE
 mX9fwuC+T67rBYWC3HeMhOVA7ml1NzPkThYRkcPWqrkKTOnUlOvohLr4mc5ojVOLdjd8bjY3ylD
 fZyNlhuBlsiDU/qwJka48BmtAdV5PcW9vyEm0PGyfHyqo66L2+ozXBH3j9UqslPttOhhIY1wNwO
 8hZ8pJVV9lWQ==
X-Google-Smtp-Source: AGHT+IFLUlbSd2mSrQRGoxUw7mtau3/gG9A7DGtu+3ENHPjDW/QeEUPPMGo49+vhbb8ipQI+kIijmQ==
X-Received: by 2002:a05:6000:2912:b0:3a5:8abe:a264 with SMTP id
 ffacd0b85a97d-3b768ef73fcmr5620891f8f.37.1753366711097; 
 Thu, 24 Jul 2025 07:18:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e2d3:d328:dc00:f187?
 ([2a01:e0a:cad:2140:e2d3:d328:dc00:f187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705e39b1sm20784965e9.34.2025.07.24.07.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:18:30 -0700 (PDT)
Message-ID: <5f406084-6014-4f88-8dc2-74527a711e26@linaro.org>
Date: Thu, 24 Jul 2025 16:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH][next] drm/panel: Kconfig: Fix spelling mistake "pannel"
 -> "panel"
To: Colin Ian King <colin.i.king@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250724112358.142351-1-colin.i.king@gmail.com>
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
In-Reply-To: <20250724112358.142351-1-colin.i.king@gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/07/2025 13:23, Colin Ian King wrote:
> There is a spelling mistake in the LEDS_BD2606MVV config. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 09b9f7ff9340..af90ca62e57d 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -971,7 +971,7 @@ config DRM_PANEL_STARTEK_KD070FHFID015
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for STARTEK KD070FHFID015 DSI panel
> -	  based on RENESAS-R69429 controller. The pannel is a 7-inch TFT LCD display
> +	  based on RENESAS-R69429 controller. The panel is a 7-inch TFT LCD display
>   	  with a resolution of 1024 x 600 pixels. It provides a MIPI DSI interface to
>   	  the host, a built-in LED backlight and touch controller.
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
