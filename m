Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BBB7F0D8E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF32710E1EF;
	Mon, 20 Nov 2023 08:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B8610E1EF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:30:25 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4083f613275so14838165e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 00:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700469024; x=1701073824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=fW56ydtHHGyWNbGUdIq92ErsWrnkn83ftk8djZPzz2k=;
 b=avaL7tAdxEcuFXeYy3HkNLQxcT2ohRYIxUe1qcMm3CkG50ErGvecdkOOAja6jnQMNm
 hggpWA5g9/5S/1XOL9yPQCbGyBZ/NFybSflN9I+QytUKA+r7TejSPRBrNrA+RQ70MOF5
 1CiUz6r6BdQmyljAzzwAVxyxc4YHiicSE/9JVt+wVwtV9srOJ+Wg8oASzNSw9vIKXgY0
 FO+7USJiMJI8IuaNggsVLIUN6Hs9v7eA4yl1NYOiZrqqxpdUzmfTuBQhAi73+0CRBx2G
 IgJQlOS90enomWrGXRadJyeQ4eJjuB6Hb2FtXbulU2Q5SWmF/zNl2lZ89Pth9zfpDH+h
 xORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700469024; x=1701073824;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fW56ydtHHGyWNbGUdIq92ErsWrnkn83ftk8djZPzz2k=;
 b=mWmcBOCA5aiObE+Cbhm1iyTOvHeyNZPEioQMeMAZImMMzWc1A1yYAx/kP6CAgfbP7/
 uzwOVgeLU0kQESTEfOgtDY5vP0O5JsJ6O2Jej6GC3rMcQRcQGhMBLrxPcEhbu+mFPvrY
 J2D1lLaJviyVGDR5KBl+1ZzAGzAwpvxVV9vTuBxkGq3Fi4TCVjaKYpRrptszNH3wC8zQ
 1iFA5zECSHRcwQ0kETWIDIDgGDja+HDv1HI7QVepO+yTiWbuZUHM4ve6kEiOyUAFPksb
 /qV787poHoZs1bdVaLOpoQqvmctghHVX4VJukbkxAPtl78fJEkkt9hxfBVAuzc4asDfW
 5l/A==
X-Gm-Message-State: AOJu0YwecP3UKqapzko5bz/udDlm9+1zVvGtGt1rw6QAAPe29GrXbYkI
 ERzQtkRYDLdYdSEZwcNybo5o4Q==
X-Google-Smtp-Source: AGHT+IF1Bs0bUH2zTJPAzlUvNCWqr0hGZG/eEBRf3GgmZshdIFmUbn+TCXuE4SYOTIavOiovTvx5Yw==
X-Received: by 2002:a05:600c:3b0e:b0:406:535a:cfb4 with SMTP id
 m14-20020a05600c3b0e00b00406535acfb4mr5275390wms.1.1700469023860; 
 Mon, 20 Nov 2023 00:30:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06?
 ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a05600c1f8c00b0040839fcb217sm12641000wmb.8.2023.11.20.00.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 00:30:23 -0800 (PST)
Message-ID: <db3e1311-d8e9-437f-b517-e40d01f1da2c@linaro.org>
Date: Mon, 20 Nov 2023 09:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 5/5] drm/panel-elida-kd35t133: Drop prepare/unprepare
 logic
Content-Language: en-US, fr
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
 <20231117194405.1386265-6-macroalpha82@gmail.com>
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
In-Reply-To: <20231117194405.1386265-6-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2023 20:44, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Drop the prepare/unprepare logic, as this is now tracked elsewhere
> since this commit [1].
> 
> [1] commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_panel")
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index fea3d9e84905..00791ea81e90 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -43,7 +43,6 @@ struct kd35t133 {
>   	struct regulator *vdd;
>   	struct regulator *iovcc;
>   	enum drm_panel_orientation orientation;
> -	bool prepared;
>   };
>   
>   static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
> @@ -91,9 +90,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>   	int ret;
>   
> -	if (!ctx->prepared)
> -		return 0;
> -
>   	ret = mipi_dsi_dcs_set_display_off(dsi);
>   	if (ret < 0)
>   		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
> @@ -109,8 +105,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
>   	regulator_disable(ctx->iovcc);
>   	regulator_disable(ctx->vdd);
>   
> -	ctx->prepared = false;
> -
>   	return 0;
>   }
>   
> @@ -120,9 +114,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>   	int ret;
>   
> -	if (ctx->prepared)
> -		return 0;
> -
>   	dev_dbg(ctx->dev, "Resetting the panel\n");
>   	ret = regulator_enable(ctx->vdd);
>   	if (ret < 0) {
> @@ -166,8 +157,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
>   
>   	msleep(50);
>   
> -	ctx->prepared = true;
> -
>   	return 0;
>   
>   disable_iovcc:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
