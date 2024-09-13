Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9710F977A5C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFC910E1A1;
	Fri, 13 Sep 2024 07:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zmSZRYS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B703110E1A1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:58:31 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so17477235e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726214310; x=1726819110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=AbWxlhJcWPE+Koez5ppRankPIQBdDzC13YoHFCecZGo=;
 b=zmSZRYS+5YZwNNbapSaQ7Rn5ATnE5aulwRq6DIFbeuUUvKNC5nRL36Gs2ffzHVTGv2
 FgIsccop/T4uq7OgR4U/vrJWEas+/1YTsq5YnBqzCB131Bv0coRSN/bTDYkEQD2Ntsn3
 +6rVF9QBqX69iqt1Y5TEADdGELE5B8aAo2dVzbeSApeuLNBdcUiMvPjwjfrhuOowN81j
 FlndxEkljBQqbOjmyAmZvrDrJu+mfwR1X+e/EprCCiS1ZcI2maj5ndb/QVKSreIAMbha
 OqC9U4p7gfvQlVq3PfJVx85ygmKm0GUYxc6tb5pSAxwNFF7VQbAhqoyXgtiNHuHGklkY
 IbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726214310; x=1726819110;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AbWxlhJcWPE+Koez5ppRankPIQBdDzC13YoHFCecZGo=;
 b=wtDlHZQSrjFg3MXv1Fzy3aOBBhKaY6Ji1/SrMOu9tHJfgb6MHr1PRHh9g5P5566ybe
 +YJmsUybITg2qYfFURdTkTzPY/wJBP2T5MYIGMNB3TzfxiB8a15glZAcSqSbrTnoy5Gm
 gTP1/8T9uIzBv4CnMFwy+xeAScUqxV+WoO5AtL1tNUHJ2Ic00NUIRd1jcs5ailauTYoh
 B7Z50sdAnoHhsN74bH8fufl0fJKFwG1PMI5EL+pELu3wif/3qnmJ5RQGXyJtS7Njj2BV
 YpzaRZr0VDcTnYh7DviAO0g8u/9NciHyL8ELRrCh27hmHoGogbh5YWXfMSCmRmJOMR/f
 RsFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu9bs2swmk8NBi2IxZKttygAkBWGJzr2sB2rKU2Kg5phDhIyLMaU8sXLAO9ovXwmAUhXgPdXWHoCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJLrtfr8HJxCl4GTOgmw8fSfoTHHXAwmYi7HkBihImVQ1bmzi+
 0NM/d6Z2V5ONVMK5MvUb5OS85xfpS7ZWZ0ujc08V2r8w3E0eF4KiYxpqtK/buKA=
X-Google-Smtp-Source: AGHT+IEtwEq12l/l2Vv83WLN/FY6VjATA4N5WWYr0RgITb7geX87WGYnJwiwMtYxZPOQ0LNk+LMOAw==
X-Received: by 2002:a05:600c:3581:b0:42c:b995:20b6 with SMTP id
 5b1f17b1804b1-42cdb5385b2mr43179505e9.2.1726214309770; 
 Fri, 13 Sep 2024 00:58:29 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b002a9asm15412375e9.0.2024.09.13.00.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:58:29 -0700 (PDT)
Message-ID: <216c2666-7dfb-4753-adde-7ccd39ef4975@linaro.org>
Date: Fri, 13 Sep 2024 09:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/6] drm/bridge: imx8mp-hdmi-tx: Switch to
 SYSTEM_SLEEP_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>, rfoss@kernel.org
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20240626230704.708234-1-festevam@gmail.com>
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
In-Reply-To: <20240626230704.708234-1-festevam@gmail.com>
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

On 27/06/2024 01:06, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_SYSTEM_SLEEP_PM_OPS with its modern SYSTEM_SLEEP_PM_OPS()
> alternative.
> 
> The combined usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 13bc570c5473..4a3a8a3ce250 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -111,12 +111,12 @@ static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
>   	dw_hdmi_remove(hdmi->dw_hdmi);
>   }
>   
> -static int __maybe_unused imx8mp_dw_hdmi_pm_suspend(struct device *dev)
> +static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
>   {
>   	return 0;
>   }
>   
> -static int __maybe_unused imx8mp_dw_hdmi_pm_resume(struct device *dev)
> +static int imx8mp_dw_hdmi_pm_resume(struct device *dev)
>   {
>   	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
>   
> @@ -126,8 +126,7 @@ static int __maybe_unused imx8mp_dw_hdmi_pm_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops imx8mp_dw_hdmi_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(imx8mp_dw_hdmi_pm_suspend,
> -				imx8mp_dw_hdmi_pm_resume)
> +	SYSTEM_SLEEP_PM_OPS(imx8mp_dw_hdmi_pm_suspend, imx8mp_dw_hdmi_pm_resume)
>   };
>   
>   static const struct of_device_id imx8mp_dw_hdmi_of_table[] = {
> @@ -142,7 +141,7 @@ static struct platform_driver imx8mp_dw_hdmi_platform_driver = {
>   	.driver		= {
>   		.name	= "imx8mp-dw-hdmi-tx",
>   		.of_match_table = imx8mp_dw_hdmi_of_table,
> -		.pm = &imx8mp_dw_hdmi_pm_ops,
> +		.pm = pm_ptr(&imx8mp_dw_hdmi_pm_ops),
>   	},
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
