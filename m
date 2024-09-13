Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909C977A47
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9465210ECA6;
	Fri, 13 Sep 2024 07:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r/2ce/lA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE46510ECA6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:49:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso17298705e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726213765; x=1726818565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qUjVjWYX5HPulUO+IlZVugiYWLFyMhQ8G8GELBNvEr4=;
 b=r/2ce/lAEaeKdb9ZP4UhkdcqMBRytqzEAMXgVOAkRyin5tyxHZTbuElDIi7qUTFznN
 Aza013hAx1hmclAWYcgtJgC/G1orugt/WIk5D+fT/Kg9hqFkJUzlRp8zGr+R6WzQ7S62
 7HX3HH9VlbwunNjgsBjbKu7eLFOPuuDfmE6JLnA3RAMc0fEWPFjtPVmVP1PNxZ0/sx9M
 e6lYIDHcCffdN/SVrHSgrMIV1HTcS0KwK33eDnma+HMEroDiMB7k772W/lZ2779e8BGz
 GDNg72OaT1mvtXNgJbVTTPG7Z8kedir1Y8T16dyT9JDxFOSsgMZZwOro9U4ysq1ro+to
 h75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213765; x=1726818565;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qUjVjWYX5HPulUO+IlZVugiYWLFyMhQ8G8GELBNvEr4=;
 b=p/xNnWRSI7qpmP/2/pQ2N7vn4yG7e8M5aw60VvZ1rHIdfGp3bQOSGcUKdoL+JeHbXF
 x6yk8zihq8K1xXtmpdRmc8jUghOvmROETxvsNKlJYrVDS7b9vYJIxwbxI2LdR3yi2dCS
 ncZGXo7ExR2MsVJsC0TX2WaU1W0M0hr+OgSMEnGo/wQQ2Z2KHN+QgZUQdKdQxHbkTUOf
 CiLHsas4P6R7oB7DOUjTej/8Y3QkMw3k8oTyFotWju/XsKdlwVzflAfOzirEumHW2XdN
 A6vs9qb1ZLc17tmY6zGS2UQzywPtF+JM55CpIvEKTcEgDdB1nOo36d76KcBMq0SSBlxN
 XMBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnu3B+qEtOQ+VaSypWrt+nL4LNXIoTK0M4TGYbm7zQX+P3XN7VkJ34zUfJlylzi29Td3xkiFev7JQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo5E6zrj9ys751btuaSf8AIDu9HKcw3C0r4K1L0WPPLhpveHX6
 xm0ruCyu8Z+stC+hAh2HR/D80UpBhu4wUNSzNnjk8X6xGIUhWYF9VMYZBgMpST6/0XXh0SmElXS
 j
X-Google-Smtp-Source: AGHT+IFZIIK3e3Y04UIcB7VWE2sxPCdw/hzqTyEJbwACH7uYsLYAz33/31NT+ZyWhBYlaWIlgsfGcw==
X-Received: by 2002:a05:600c:21d9:b0:42c:b1a4:c3ef with SMTP id
 5b1f17b1804b1-42cdfb15de5mr31271455e9.33.1726213764886; 
 Fri, 13 Sep 2024 00:49:24 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b05da47sm14717215e9.17.2024.09.13.00.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:49:24 -0700 (PDT)
Message-ID: <7e6d6fb6-fb4f-4d9f-8184-c825d9ca7de2@linaro.org>
Date: Fri, 13 Sep 2024 09:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] drm/bridge: imx8qxp-pixel-combiner: Switch to
 RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>, rfoss@kernel.org
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20240626230704.708234-1-festevam@gmail.com>
 <20240626230704.708234-3-festevam@gmail.com>
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
In-Reply-To: <20240626230704.708234-3-festevam@gmail.com>
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

On 27/06/2024 01:07, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_RUNTIME_PM_OPS with its modern RUNTIME_PM_OPS() alternative.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>   drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index e6dbbdc87ce2..ce43e4069e21 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -371,7 +371,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
>   	pm_runtime_disable(&pdev->dev);
>   }
>   
> -static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
> +static int imx8qxp_pc_runtime_suspend(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
> @@ -393,7 +393,7 @@ static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
>   	return ret;
>   }
>   
> -static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
> +static int imx8qxp_pc_runtime_resume(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
> @@ -415,8 +415,7 @@ static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops imx8qxp_pc_pm_ops = {
> -	SET_RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend,
> -			   imx8qxp_pc_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend, imx8qxp_pc_runtime_resume, NULL)
>   };
>   
>   static const struct of_device_id imx8qxp_pc_dt_ids[] = {
> @@ -430,7 +429,7 @@ static struct platform_driver imx8qxp_pc_bridge_driver = {
>   	.probe	= imx8qxp_pc_bridge_probe,
>   	.remove_new = imx8qxp_pc_bridge_remove,
>   	.driver	= {
> -		.pm = &imx8qxp_pc_pm_ops,
> +		.pm = pm_ptr(&imx8qxp_pc_pm_ops),
>   		.name = DRIVER_NAME,
>   		.of_match_table = imx8qxp_pc_dt_ids,
>   	},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
