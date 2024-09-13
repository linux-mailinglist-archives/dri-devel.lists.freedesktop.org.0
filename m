Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C71C977A4A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CEA10ECAA;
	Fri, 13 Sep 2024 07:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LHd8ISEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E14D10ECAA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:49:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-374c1963cb6so1261700f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726213786; x=1726818586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=rDq7EDSXEQgrT90d6komWOFIyy09UnN04IDKdYKFcYk=;
 b=LHd8ISEfbaUhAiCUm+pppo1X5/JUQGwWKaYWSN/to6Nmk5ZqTBrXbMZ9ycMwn6wuAl
 GkMCCcGeusJ3hxWDGShGmM7gDyp8SzS8jJwqlMGPAUiT1BGjOhNlbOJFg5oIY7yXM7Z9
 Gs1e9bo2yyL7LCpB4CDN2W7b5VOn6neJnuKvpgIsny4e0Z1l5vPNYgYFGRg1YfPBIB7B
 /SDZoulEJ9Uvtai6bO68wKz3zrrkp+bbLxg2NkWQevxDzxcXxCgz0X2NWpv0z6A7TpuU
 dYDq8lVTw46Go3o3vC8kDO1vDEiq/77B87qGHG15OJWxSPib9XdHVKyC2gNiajFm5Isz
 iCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213786; x=1726818586;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rDq7EDSXEQgrT90d6komWOFIyy09UnN04IDKdYKFcYk=;
 b=nVicrtEDJPYDezoA9IdFSzdt7E0mh9enpXo7SWrJyMMlTsTdQPkmevK8gR8LIhII1q
 U3qp4PE5rK1VUbsaHfrMRf7D7MJXHIsOe0QAa+qQyyzYuxvW5UGuXUMysPZl8X4F9pCx
 w3/8Xt/ipi04ebuvOq8UquOc/oOx5aDGlt1V+s9z7rv8wlt6G2ni5VVA/Fd81O3ThVhZ
 YgBnnJd+e3GembDXw4dX1NckzRPLfu2jeMCB05eX3hIT7UEW541rQO+RweIOine448r2
 vwaCX3s2TNHRD1GQCo2bxdXrjdVO5iQ5GREz6y1vN5Qa4O3N9MggzWjnoKxAxUghw66l
 cr1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWollS3/i5Tmf442viYwt7rBFqw3irqwlz1iHcltUR8a69i8mZbvsSjWpehJfD1+uKl76QiKojb4Eg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIz6u4o6XVFlmQF/hqICo6AaOlMOpYGpv0mLBEAUD64O+hvI1V
 U529tXsnRYFYrmsdYJXkhc8LJn21O13Iw1tK6VKsVbMhSxoT27wLZRwvqx89X9g=
X-Google-Smtp-Source: AGHT+IEeRUWBEfEf8XKRbZFVuDuAUvumIvsA4Amfg1ykGBP9UGS1pYeuJ58j0g7e3wmhWchVjy8KTw==
X-Received: by 2002:a5d:5747:0:b0:377:27f1:d54f with SMTP id
 ffacd0b85a97d-378c2d5b27fmr3364681f8f.45.1726213785502; 
 Fri, 13 Sep 2024 00:49:45 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956652ddsm16172755f8f.29.2024.09.13.00.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:49:45 -0700 (PDT)
Message-ID: <9432c068-3508-4780-8314-c43228fb6126@linaro.org>
Date: Fri, 13 Sep 2024 09:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/6] drm/bridge: imx8qxp-ldb: Switch to RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>, rfoss@kernel.org
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20240626230704.708234-1-festevam@gmail.com>
 <20240626230704.708234-6-festevam@gmail.com>
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
In-Reply-To: <20240626230704.708234-6-festevam@gmail.com>
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
>   drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> index 7984da9c0a35..b33011f397f0 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -678,12 +678,12 @@ static void imx8qxp_ldb_remove(struct platform_device *pdev)
>   	pm_runtime_disable(&pdev->dev);
>   }
>   
> -static int __maybe_unused imx8qxp_ldb_runtime_suspend(struct device *dev)
> +static int imx8qxp_ldb_runtime_suspend(struct device *dev)
>   {
>   	return 0;
>   }
>   
> -static int __maybe_unused imx8qxp_ldb_runtime_resume(struct device *dev)
> +static int imx8qxp_ldb_runtime_resume(struct device *dev)
>   {
>   	struct imx8qxp_ldb *imx8qxp_ldb = dev_get_drvdata(dev);
>   	struct ldb *ldb = &imx8qxp_ldb->base;
> @@ -695,8 +695,7 @@ static int __maybe_unused imx8qxp_ldb_runtime_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops imx8qxp_ldb_pm_ops = {
> -	SET_RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend,
> -			   imx8qxp_ldb_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend, imx8qxp_ldb_runtime_resume, NULL)
>   };
>   
>   static const struct of_device_id imx8qxp_ldb_dt_ids[] = {
> @@ -709,7 +708,7 @@ static struct platform_driver imx8qxp_ldb_driver = {
>   	.probe	= imx8qxp_ldb_probe,
>   	.remove_new = imx8qxp_ldb_remove,
>   	.driver	= {
> -		.pm = &imx8qxp_ldb_pm_ops,
> +		.pm = pm_ptr(&imx8qxp_ldb_pm_ops),
>   		.name = DRIVER_NAME,
>   		.of_match_table = imx8qxp_ldb_dt_ids,
>   	},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
