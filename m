Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B557977A46
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D0810ECA5;
	Fri, 13 Sep 2024 07:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zc2JuNVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA6E10ECA5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:49:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42cbbb1727eso15688455e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726213757; x=1726818557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=H0O9MoWTqvZaEeAdFYF60ujkYQPiUaLOiXidmFBkv5I=;
 b=Zc2JuNVFiyxcJYw612muXPlzCiEicwiznWrb/ztrzd2PAlGKqgbGqTObTU5t64Npo0
 6EIPly09dPevdfRT1sRjTvqTb21fIpaNUqLaHwcTj8kxkQ3AsGcuojTUlucTP4XKFxi/
 L7jL/3de11Jn+g6DEr6LDVV4fba+HlCnnIxYNGiPF6doZrHufuX1NviOvs8HBhQ8WJIH
 6Dy60oZG4W2GnmTDqm3ZNptfw9h+DedkBopgoqFMIK1qeFMPGi+R87d/qRcw7fU7J98q
 7Il2lyBcz0jlKZ/F277KrDfXsxzN8tL8twJV0CIs5H7mcf9v9fAwPw3obCc+ndrqBk4b
 soSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213757; x=1726818557;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=H0O9MoWTqvZaEeAdFYF60ujkYQPiUaLOiXidmFBkv5I=;
 b=HG5QDBG/WkQZ2QNek4pGF9yg+d8kRp9CyHXgBeTYp8yvkuxNQxZuKNUWmYHYsXXamZ
 Cuz9wtd7ADWUAZ5mofTtRc/eII8PzzLFNlB1+YNWEIiNIyFxjkkfYEUB8sNtvuqTlXRm
 LCoZr3uRV/VPLp7U31GmKnVQRHWz2xN7yelPakKFCmpoWPoMI2CG4mQQcW1nLPycYEik
 G4gT6+mWvDlbmSHe3pYqTaXJI/rGyL7mRRs5pM2y3aXAfQ0ZGriuM2BkRMKD3coQqZnX
 oKD+BB3RnYE8pt+ndlXK/Lyf1gI/CsB3cpiJiXg8IreHwl0L8wKAtcQB75Mx/rXbFttT
 vseA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU+BdvHSEsAV8tvdoRE5smyPXltJ5t3w0uWWUuJHRFllWZjmBgqPF5oRLbSwfua0nHU06mjuc/0ro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznaiWJixqX7lAm/MPxb4ur6ysadLyfsJkXQKIjFT1yY4udczId
 PWgi+rtPiR5ehD/Osc4jr8Wrhrl08Q/+dbcIZIIqNYXLyTrdaRKjwan61YnsyAk=
X-Google-Smtp-Source: AGHT+IFkYr6GVCuD5wEVmqXXwcDaIj0pW23nPyuWEdN1LrD6z6v9mAWyAhoRr7HNrYphfyTb33EKaQ==
X-Received: by 2002:a05:600c:297:b0:42c:afea:2a10 with SMTP id
 5b1f17b1804b1-42cdb54d5e8mr43291365e9.21.1726213757269; 
 Fri, 13 Sep 2024 00:49:17 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b189a1esm14671165e9.31.2024.09.13.00.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:49:16 -0700 (PDT)
Message-ID: <384e500d-d30d-417b-a53b-2d02efd8c5ad@linaro.org>
Date: Fri, 13 Sep 2024 09:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/6] drm/bridge: imx8qm-ldb: Switch to RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>, rfoss@kernel.org
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20240626230704.708234-1-festevam@gmail.com>
 <20240626230704.708234-2-festevam@gmail.com>
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
In-Reply-To: <20240626230704.708234-2-festevam@gmail.com>
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
>   drivers/gpu/drm/bridge/imx/imx8qm-ldb.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> index 21471a9a28b2..c879e37f5811 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> @@ -542,12 +542,12 @@ static void imx8qm_ldb_remove(struct platform_device *pdev)
>   	pm_runtime_disable(&pdev->dev);
>   }
>   
> -static int __maybe_unused imx8qm_ldb_runtime_suspend(struct device *dev)
> +static int imx8qm_ldb_runtime_suspend(struct device *dev)
>   {
>   	return 0;
>   }
>   
> -static int __maybe_unused imx8qm_ldb_runtime_resume(struct device *dev)
> +static int imx8qm_ldb_runtime_resume(struct device *dev)
>   {
>   	struct imx8qm_ldb *imx8qm_ldb = dev_get_drvdata(dev);
>   	struct ldb *ldb = &imx8qm_ldb->base;
> @@ -559,8 +559,7 @@ static int __maybe_unused imx8qm_ldb_runtime_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops imx8qm_ldb_pm_ops = {
> -	SET_RUNTIME_PM_OPS(imx8qm_ldb_runtime_suspend,
> -			   imx8qm_ldb_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(imx8qm_ldb_runtime_suspend, imx8qm_ldb_runtime_resume, NULL)
>   };
>   
>   static const struct of_device_id imx8qm_ldb_dt_ids[] = {
> @@ -573,7 +572,7 @@ static struct platform_driver imx8qm_ldb_driver = {
>   	.probe	= imx8qm_ldb_probe,
>   	.remove_new = imx8qm_ldb_remove,
>   	.driver	= {
> -		.pm = &imx8qm_ldb_pm_ops,
> +		.pm = pm_ptr(&imx8qm_ldb_pm_ops),
>   		.name = DRIVER_NAME,
>   		.of_match_table = imx8qm_ldb_dt_ids,
>   	},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
