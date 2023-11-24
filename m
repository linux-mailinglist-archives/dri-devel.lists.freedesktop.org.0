Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC07F6EDF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E430410E7BD;
	Fri, 24 Nov 2023 08:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3371710E7C5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:49:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b394f13b1so5551095e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815741; x=1701420541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/nxqoCCxAtS/DTDDGWfSMVRGqEH4JSuCIX2Y9oRVsZs=;
 b=IkY5f/p2/61vhIOrax82wh7lmk50UuKtc4yKYFdleH6CpH2E1YKfLiAx1Om9vSfRve
 CSms6oZUjeWpLjs4WnqCr6ZGIHFoNx+zhospWFIVtMs1+HY42QP1uTwRWihZ8VHvDC5N
 vkLs2D+ajE3TZlFdIZR86vQ1tqwo0tgVAdAfr9d191SPM8eYcJWUo5fhL4hjkVm5JMYn
 rV29rUx95ymCAgYBQA82zY5peuqZhmSj3l1TG2iiB/e9r6sNvAji1sCwizz0LtYQMbNB
 o4vSmwz6HynkOtdldsxN6g4zs4BEq4OSFmVzzUb8FK1DswinDLnvQvk3r/iTtcKE+6CU
 Zzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815741; x=1701420541;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/nxqoCCxAtS/DTDDGWfSMVRGqEH4JSuCIX2Y9oRVsZs=;
 b=ewrimBkDnQBv9AhucfQI9b6XSY0tBchMHrDZ7WkBKa2DM+SwW5KzLWTkCvX39CR8Wj
 QYydVMikID2s0Kl/jTr3pTE9TKdcY9fg0s71imoGWLjIAihIow1MIz76BBPP31DgFRxI
 60Dy7BjmUqAort2XhSrpERMeimt3YAIeDPxahHbAr7xdU7WyuJCxL4eMJOMLe1EP7B1x
 9cM2+v8qtLbKk05HLk/rAfKatS2Inaq9KNwkqEubTlX+Z8sfsC3axsdBwWto5mbK7/L1
 ENMK4vf7k5GggE7w7+P5YYr+Ip+ubqFHjeXLm9TYqiRZwMAiY/jH3ngNkGxGooD8NCrz
 BTpw==
X-Gm-Message-State: AOJu0Yy8gkkN6IYt+NXlKDBFHtSCTZBuTakVIbVH6UHQQawS3yWVv5yr
 xkQlU3B7T9ApkcSagxl5A5vqdw==
X-Google-Smtp-Source: AGHT+IGYszf7IWZvWpWt6baX7kEJrpCbA2qEoeibLC5+W8kVfmPM0Tspn0jvun4EQ+vpSqAQsJJ7QA==
X-Received: by 2002:adf:cd01:0:b0:332:e9a2:2376 with SMTP id
 w1-20020adfcd01000000b00332e9a22376mr1349667wrm.25.1700815741537; 
 Fri, 24 Nov 2023 00:49:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4?
 ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a5d5258000000b00332c0aace23sm3714103wrc.105.2023.11.24.00.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 00:49:01 -0800 (PST)
Message-ID: <bc2401c4-5506-48de-a308-926243d2f854@linaro.org>
Date: Fri, 24 Nov 2023 09:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify using
 pm_runtime_resume_and_get()
Content-Language: en-US, fr
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
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
In-Reply-To: <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
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
> pm_runtime_resume_and_get() already drops the runtime PM usage counter
> in the error case. So a call to pm_runtime_put_sync() can be dropped.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c45c07840f64..5b8e1dfc458d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1413,11 +1413,9 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>   	int ret;
>   
>   	if (!pdata->pwm_enabled) {
> -		ret = pm_runtime_get_sync(pdata->dev);
> -		if (ret < 0) {
> -			pm_runtime_put_sync(pdata->dev);
> +		ret = pm_runtime_resume_and_get(pdata->dev);
> +		if (ret < 0)
>   			return ret;
> -		}
>   	}
>   
>   	if (state->enabled) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
