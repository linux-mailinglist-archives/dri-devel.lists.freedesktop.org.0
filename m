Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C97F0D8D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F02E10E1BD;
	Mon, 20 Nov 2023 08:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E6710E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:30:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so12341525e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 00:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700469016; x=1701073816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3bCkLFG9CgeNUFjJBnn7uh7VJJzXZrEr4SRNB/Ys/9Y=;
 b=qySsWfgLCcARdxj42cyTQcr+QeW1QLYmoK5a7rSDZixO5evpJUPDQC9mvVcRL7MnOR
 utspUO+mauN1UdLWrROi2Ozkw0095AXMfNAp4VcuHUdoYO0XsGqVTJEH0E3LWpnH/xsy
 4EqWuqvdF2MMbB/lKYUIL8OApOUGOQ0Ol5/bCpBDxEtBfVzvWpIWDEuyTQwgFoakOCW+
 tXcLtqOAoMUIV+eMN/kZdu1boYHT5imE0xC7YRp73zMRnDUU+J4f+dAU5NUcWxVnea+/
 K7kM+2M2CDZr/gvz9wfC62tDpRBFs2LWfWsvksBNgHePHp0TXFvmQoPzb9jZKRyETMx4
 D4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700469016; x=1701073816;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3bCkLFG9CgeNUFjJBnn7uh7VJJzXZrEr4SRNB/Ys/9Y=;
 b=JB6Hm9MF+A7CgcPTQ2vQdPk/UER8hmS1Rt/I8ltomEKVtDEDjQZOkRFfkg5Jclrlku
 r+H1YZ2xeZriCCk020S4wvqUjVSKcLqMNkjVeRcQ/i9LPwpR9hFRWZDI3rIB4IrPtDgN
 qi6U+/rIJfd+vCTQSh1+Qayi+UcCfOYiHaHpeslH0cRpLcrRscUDerkw48x9/iowPaPJ
 oP43Fu0+ssjegJu0ZlztfFAEP4N3f7YgkvZYaCcsxZcHy50Uh27E4DsLKyNt+83LT+rA
 2/n+bHjhBckVqPDcOAkqKtAkN8+TdQZXuyOQYv0RSkYdSRbr+Vo19gtOFhEVMXHfUmDA
 IDzA==
X-Gm-Message-State: AOJu0YwK9MPTnEiSLDRzY+qMbMKxaYau5HVHUBkXnWsmTrxJXXDQWSe4
 1hi3hheE/pUu3M879L9QX5FE++81lB+iQfFUhnM/QkVJ
X-Google-Smtp-Source: AGHT+IG7vS3QLt6XCeb4QSoTBj/2h2FI0D97jjyC65qOgviq1lT27QdLL5WFiPPtXFh7pdb0q0LrXw==
X-Received: by 2002:a05:600c:3507:b0:401:b652:b6cf with SMTP id
 h7-20020a05600c350700b00401b652b6cfmr5253291wmq.13.1700469016330; 
 Mon, 20 Nov 2023 00:30:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06?
 ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a05600c1f8c00b0040839fcb217sm12641000wmb.8.2023.11.20.00.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 00:30:15 -0800 (PST)
Message-ID: <c0f070b7-1229-417b-a795-49bddf395923@linaro.org>
Date: Mon, 20 Nov 2023 09:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 4/5] drm/panel-elida-kd35t133: Drop shutdown logic
Content-Language: en-US, fr
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
 <20231117194405.1386265-5-macroalpha82@gmail.com>
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
In-Reply-To: <20231117194405.1386265-5-macroalpha82@gmail.com>
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
> The driver shutdown is duplicate as it calls drm_unprepare and
> drm_disable which are called anyway when associated drivers are
> shutdown/removed.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index 29b4ee63d83b..fea3d9e84905 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -296,27 +296,11 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>   	return 0;
>   }
>   
> -static void kd35t133_shutdown(struct mipi_dsi_device *dsi)
> -{
> -	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
> -	int ret;
> -
> -	ret = drm_panel_unprepare(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
> -
> -	ret = drm_panel_disable(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
> -}
> -
>   static void kd35t133_remove(struct mipi_dsi_device *dsi)
>   {
>   	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
>   	int ret;
>   
> -	kd35t133_shutdown(dsi);
> -
>   	ret = mipi_dsi_detach(dsi);
>   	if (ret < 0)
>   		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> @@ -337,7 +321,6 @@ static struct mipi_dsi_driver kd35t133_driver = {
>   	},
>   	.probe	= kd35t133_probe,
>   	.remove = kd35t133_remove,
> -	.shutdown = kd35t133_shutdown,
>   };
>   module_mipi_dsi_driver(kd35t133_driver);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
