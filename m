Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB17F6F00
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A4210E7C0;
	Fri, 24 Nov 2023 08:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DD310E7C0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:57:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b2ddab817so11513105e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700816225; x=1701421025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=hEO/jFJwgKyM3tQLWMxdV5D1pjTcir1oc4pH4VxY8Ig=;
 b=fZn7ATWslDmSWgqRQvJqp/Dhmqk6k6I1XZ1bX19/Iz9XqqVbD9rnqQeOB0rPDmSqyR
 kfhsTLopjRAd728clWF7V7UV08M1BFm57jtAtOOqb5VBddvCwyM7iYTeuvXCOHxAfy9S
 H3pBTP9eHLXJz5PfoszI6837MDwGT7UP/UrWYw4Grj3LEPWl3WFjsN5uju5F/eCe149k
 1cZqxsfK94/1OV6NdbHHmKJ8JqsT13AJ+2nzLty1LcjuziZqz0ZIbER89hLA4cV29t9P
 45x28ZSzVxS/Idm6uQYVezBTDTwrIgt7LQdks3RIGNlximTqq9l0f208ufcgEeNjRAFX
 vKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700816225; x=1701421025;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hEO/jFJwgKyM3tQLWMxdV5D1pjTcir1oc4pH4VxY8Ig=;
 b=W7/Vi1AV6CH1FcJ3qz6HB7X5Y0VtSg1jZHZAIahGXAiWZtrBhtet4wIZmKg33bg+E8
 Zv4BAwsvVeYegDWUMPJ8hGyyqXq0g3uyGujCKPqPxoonkv7yVMb8yxocpF75xhWcxHTb
 6gc1xDmwLcTzXzYCPc+f5V+el3w4sG1tEcxpiTsv8YpPgDO+h+rSbFljrkrkO6vfrvQA
 zl06DR0TlI0+SeUG77LVgywztF8l27OQyUaXPKoARYGfkSZA1KM85wPDIXoG/iRg1Olm
 wCmVFqUc02eVg0meyoVWauVQfSL9+tOLO+aRSnVPpqxvwvdF3y616fn6osSPgY1knnJ9
 hWFw==
X-Gm-Message-State: AOJu0Yyn6UelCP/qpxbPAVrOEc1V/isdbfhJRLb6OqAO9Zuj619e7iVZ
 vHcQqF6jLMeRU/MJChsB4WyvDA==
X-Google-Smtp-Source: AGHT+IFf6f7q2xm46erBQVVhuOlnAhzSkU4hyM4n9zuWs7qOnQVgcuT7GHFSNhPo4jd/4jNNzdidmA==
X-Received: by 2002:a05:600c:3b16:b0:3fe:ba7:f200 with SMTP id
 m22-20020a05600c3b1600b003fe0ba7f200mr1737118wms.20.1700816225620; 
 Fri, 24 Nov 2023 00:57:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4?
 ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d480d000000b00332cb0937f4sm3757284wrq.33.2023.11.24.00.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 00:57:05 -0800 (PST)
Message-ID: <192238a9-0715-452b-86e8-c6a988058ae7@linaro.org>
Date: Fri, 24 Nov 2023 09:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Change parameters of
 ti_sn65dsi86_{read,write}_u16
Content-Language: en-US, fr
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-3-u.kleine-koenig@pengutronix.de>
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
In-Reply-To: <20231123175425.496956-3-u.kleine-koenig@pengutronix.de>
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
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2023 18:54, Uwe Kleine-König wrote:
> This aligns the function's parameters to regmap_{read,write} and
> simplifies the next change that takes pwm driver data out of struct
> ti_sn65dsi86.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 5b8e1dfc458d..d6e3b1280e38 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -221,13 +221,13 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
>   	.max_register = 0xFF,
>   };
>   
> -static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> +static int __maybe_unused ti_sn65dsi86_read_u16(struct regmap *regmap,
>   						unsigned int reg, u16 *val)
>   {
>   	u8 buf[2];
>   	int ret;
>   
> -	ret = regmap_bulk_read(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> +	ret = regmap_bulk_read(regmap, reg, buf, ARRAY_SIZE(buf));
>   	if (ret)
>   		return ret;
>   
> @@ -236,12 +236,12 @@ static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
>   	return 0;
>   }
>   
> -static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
> +static void ti_sn65dsi86_write_u16(struct regmap *regmap,
>   				   unsigned int reg, u16 val)
>   {
>   	u8 buf[2] = { val & 0xff, val >> 8 };
>   
> -	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> +	regmap_bulk_write(regmap, reg, buf, ARRAY_SIZE(buf));
>   }
>   
>   static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> @@ -968,9 +968,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
>   	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>   		vsync_polarity = CHA_VSYNC_POLARITY;
>   
> -	ti_sn65dsi86_write_u16(pdata, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
> +	ti_sn65dsi86_write_u16(pdata->regmap, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
>   			       mode->hdisplay);
> -	ti_sn65dsi86_write_u16(pdata, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
> +	ti_sn65dsi86_write_u16(pdata->regmap, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
>   			       mode->vdisplay);
>   	regmap_write(pdata->regmap, SN_CHA_HSYNC_PULSE_WIDTH_LOW_REG,
>   		     (mode->hsync_end - mode->hsync_start) & 0xFF);
> @@ -1509,8 +1509,8 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>   			goto out;
>   		}
>   
> -		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> -		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
> +		ti_sn65dsi86_write_u16(pdata->regmap, SN_BACKLIGHT_SCALE_REG, scale);
> +		ti_sn65dsi86_write_u16(pdata->regmap, SN_BACKLIGHT_REG, backlight);
>   	}
>   
>   	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, state->enabled) |
> @@ -1544,11 +1544,11 @@ static int ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>   	if (ret)
>   		return ret;
>   
> -	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
> +	ret = ti_sn65dsi86_read_u16(pdata->regmap, SN_BACKLIGHT_SCALE_REG, &scale);
>   	if (ret)
>   		return ret;
>   
> -	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
> +	ret = ti_sn65dsi86_read_u16(pdata->regmap, SN_BACKLIGHT_REG, &backlight);
>   	if (ret)
>   		return ret;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
