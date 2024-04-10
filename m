Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6193089FB60
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 17:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B98B10ECBE;
	Wed, 10 Apr 2024 15:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gO5DYAub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6511411249D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 15:20:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-417c5aa361cso1611395e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712762416; x=1713367216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4R3K7LNBl3184aok8Mf+8acLiZ1zYz0SQ3/7PRWvxQs=;
 b=gO5DYAubdE+Wi4KiHDAwM1UXMEbNBpJMxrfxuKB74ASVt1jj34nmOHKqeENHcrtbKo
 ogNSISn2rfmDyDJ+gcOwHzM3V27gCikZzhjJjqHAkQCaYv2xFxE6G9+luHvdD84joaL4
 DWXLX6K8Wi+l/7WK3Y0k1Ywu1/LWFWgcXXf2zbgUNIj7syI93/1qnFOioGPssmMKAoqU
 thY8GBtJWZiqtfR0qy0KtOYakoxpc9aseK3GlJ1bmffD4OZ3d+K/04a7DMkTpzN26Ync
 b3KZLTIESSByDWuw1LpbDFAVAc1+P8UcMzJiOAS4VmT2UNnylKHFdfPFKr86E8FODLfD
 +TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712762416; x=1713367216;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4R3K7LNBl3184aok8Mf+8acLiZ1zYz0SQ3/7PRWvxQs=;
 b=s+NIti/D37Ax+5vDgrDS1IAPNzCUQKo2gTWLmr8f2Q49LuTfuwTu72WPScMle2q0N5
 DrF6DDCqUh/fRYy3WvTnEguSLKCvafGNj42se80aW7EdTiu0TN5PJSPvY/jUKBlOuJxB
 n8MGLdS34LpJtf7pkDOdpsjsZB7mwmc6rW7uciRgvBvc09WQY3PqlvocQvXuAOWX+ZUY
 NhBAtuAK+o1uunfw0xN8NDF4Pzt/yT+zu+HYUy44o0MS0Qr68GwcfdLzIkgEFXFjJs6n
 f8IRJ9Ems4wIB1cdrdrIviZlhoitwCdUEYcPcrzGoulAnq88zo0dSls3cmhUJA4Ylw/G
 ENUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPWKLz9zHT7xGgsrfBSZO1dZWpkBfVuM2IsPnvdJ+k/5Ns6dItENRfz8IfaBZkmWlmFbguwKy/ZRySP+fgS+ks+mxKB6tvVBwNxhWp26ZI
X-Gm-Message-State: AOJu0YyZDhi5EunZXYEUATQssz2kCF6k7sFfpfngkDU1VixBOQctVNG1
 IGim/+q5gQciq7/wqbX+k4wQsa635/XTMefWZYU11lYFJOPlmyZpoGz6WqjtIrs=
X-Google-Smtp-Source: AGHT+IHxgjP320DE2jUKQCRgcCpJqzP7jHw3GAQXoFs/HfmASu3+rbIL4V0ixmvpeRaEe7uw11zC2Q==
X-Received: by 2002:a05:6000:d4f:b0:33e:78ca:e039 with SMTP id
 du15-20020a0560000d4f00b0033e78cae039mr1744407wrb.59.1712762416285; 
 Wed, 10 Apr 2024 08:20:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3?
 ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a056000110d00b0034174875850sm14057849wrw.70.2024.04.10.08.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 08:20:15 -0700 (PDT)
Message-ID: <7c612f63-fd7d-4f5a-ace6-05b2bc29f3eb@linaro.org>
Date: Wed, 10 Apr 2024 17:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND] drm/armada: drop unneeded MODULE_ALIAS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240410082218.46525-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240410082218.46525-1-krzysztof.kozlowski@linaro.org>
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

On 10/04/2024 10:22, Krzysztof Kozlowski wrote:
> The MODULE_DEVICE_TABLE already creates proper alias for platform
> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Resent third time
> https://lore.kernel.org/all/20220407202443.23000-1-krzysztof.kozlowski@linaro.org/
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/armada/armada_drv.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index e51ecc4f7ef4..f48e2cf8de43 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -283,4 +283,3 @@ module_exit(armada_drm_exit);
>   MODULE_AUTHOR("Russell King <rmk+kernel@armlinux.org.uk>");
>   MODULE_DESCRIPTION("Armada DRM Driver");
>   MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:armada-drm");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I think we'll need maxime or thomas ack to apply this via drm-misc-next

Neil
