Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A83977A49
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7A410ECAB;
	Fri, 13 Sep 2024 07:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sQkakv1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5E010ECAA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:49:40 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so5096715e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726213779; x=1726818579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=JdPkXWh1C46xxFP6cYfdXMHH2WOMRlUXJaNNTnRKE2s=;
 b=sQkakv1KYVEpGNVsUSX/CHh9m4jtMjHqXhWJVclH67dcpBokrLv0Tb0PU+KzANXEM+
 Uz72cWM8NN/kvddfenZ65UuTuowRko2PRGyML6+v66uwEGeNdxFOIBrO/c5UyOQ6WkKJ
 fjW1+/MLMR/zxWw09/iZycokDk8UWvDTiab7D49BWabChiH26MweKlilUS2Cot5+G4WS
 Ikpw5YiQupQ1VZg3Ax/IwfOQ+tPFm/jUIf5tOJ5w0GCf2hLMzG+jg2unPWdf+NhY/bRu
 CVihEMCKE6cOkItuhu4jIrmfcFuFNE9HvZu6/e/QD7G3c6JxfkHk6vAUOUjyi6ZsYgdw
 F3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213779; x=1726818579;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JdPkXWh1C46xxFP6cYfdXMHH2WOMRlUXJaNNTnRKE2s=;
 b=T5cPc+213n0qU86pxJOkHmkSeE7UvtPAX/883EJP2lpqV6s3ypIr0+gSIwFaCEeWIh
 z9ADuqvai9kVv5triiHETGfV+PdshTAzoF+WoFRok5tyovRfSgSeQH/Kkd1Jh2wqKT8C
 XfwL+oxWlXGDc2xQKGiY3nAXlwuCZHnm40E2uzgFlEz1Rc54Bcow2uW/XDmgJi35S0C7
 BP1dz6mTA/kRp6xtKFVQK/JsJsq2YMyVohkhHL8+oJzEXn4tJvKZcA0vPr3nwO31tnog
 RnWCnPoHAbrt9DArNL6VcZA/pbRcAaItjSQqKw9t9RDTf7G5MGFE1PUZIsl8KNZFsT8Q
 djuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaG259G2whRE6AkXXMMu2FhX2+1L/S6sFgR23rFwYcw89mHAnLGbc98/tVt/juiI45UTMdeTFThxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGEXlqnnhqdhjsRHqbcmmZ+KT0mtL3VPlLKn7kXtK0CyZOq6em
 f3GbaApsYQNVDS3O4xYeJ5Vo2S3oWSxwgB1ec4Icf8CgHNnk14RSs1FDnkKsWwE=
X-Google-Smtp-Source: AGHT+IFSQEvaC1yWQQaP5AymGzmcSVF24uMfjX1IYlrKTw5hT/DUuMHvT6ZjwI3kQ1O6/b01WS08Yg==
X-Received: by 2002:a05:600c:3590:b0:42c:d7da:737b with SMTP id
 5b1f17b1804b1-42d90721bf9mr12259905e9.9.1726213778601; 
 Fri, 13 Sep 2024 00:49:38 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b16bf68sm14744595e9.27.2024.09.13.00.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:49:38 -0700 (PDT)
Message-ID: <1f32cd10-2c91-472e-af44-02d6574adb31@linaro.org>
Date: Fri, 13 Sep 2024 09:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/6] drm/bridge: dw-hdmi-cec: Switch to
 SYSTEM_SLEEP_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>, rfoss@kernel.org
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20240626230704.708234-1-festevam@gmail.com>
 <20240626230704.708234-5-festevam@gmail.com>
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
In-Reply-To: <20240626230704.708234-5-festevam@gmail.com>
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
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 673661160e54..d4614de1ae1e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -312,7 +312,7 @@ static void dw_hdmi_cec_remove(struct platform_device *pdev)
>   	cec_unregister_adapter(cec->adap);
>   }
>   
> -static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
> +static int dw_hdmi_cec_resume(struct device *dev)
>   {
>   	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
>   
> @@ -328,7 +328,7 @@ static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
>   	return 0;
>   }
>   
> -static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
> +static int dw_hdmi_cec_suspend(struct device *dev)
>   {
>   	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
>   
> @@ -341,7 +341,7 @@ static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops dw_hdmi_cec_pm = {
> -	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
> +	SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
>   };
>   
>   static struct platform_driver dw_hdmi_cec_driver = {
> @@ -349,7 +349,7 @@ static struct platform_driver dw_hdmi_cec_driver = {
>   	.remove_new = dw_hdmi_cec_remove,
>   	.driver = {
>   		.name = "dw-hdmi-cec",
> -		.pm = &dw_hdmi_cec_pm,
> +		.pm = pm_ptr(&dw_hdmi_cec_pm),
>   	},
>   };
>   module_platform_driver(dw_hdmi_cec_driver);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
