Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F075CC1DEC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 10:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B314410E41B;
	Tue, 16 Dec 2025 09:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CN5z96e6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3741110E831
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 09:53:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so52433955e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 01:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765878819; x=1766483619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=B77gVNs+N24W0zy7hh7wrFHCGHcgHUUg1aqdMgvjdak=;
 b=CN5z96e6nULB5ndGRoCrNTFcUm7g9igCjcZZj3iKJbPZs0nd1iL4pMnXOfCwBgWrlB
 BpSPT0ngjwott4e4561JNTJph3AlCEIz4o7JJsej7S2AotQMsm8qpp1apH69jIgGgMp9
 tbxUGiat3GmX/ol+nWN8HaADFNUmQ19D8C5BfJDx9W2g96VNAV5WmZTi9PnmzTLoyC80
 ZAs5b7/E7I6YMXjxS8CFlFsNa4KVv8qe2tcaLcDOQbNJiYdlCX9+qDmxok8RlmNXR0ja
 A+lhHlQQS0a+KigzOtSLrh4+EwdHgl9n3QPZgeFp2ecza8Uwdovy6jqanraQ7JRMykjH
 YS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765878819; x=1766483619;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B77gVNs+N24W0zy7hh7wrFHCGHcgHUUg1aqdMgvjdak=;
 b=JcX/LX8skbufUdWNvLun7Tv93LFklM0CuDCWG64Dm1PyhGFy+gYhoyK3IhNhiwPxui
 ANbjv2pG8iAJx9Y5n17X8COaDliT0s31ghoIfTxvnBsARjn3FZtvIqnbRf06oDQ3rAFA
 UkT7f7VvC/sKbJk0oDJhO+Vrn0NgS6+wXSe+Mz055fsx7We47/IqedfSnbwi4s1wUOIP
 z7JR/4pcX9mdbyecTWsKVZMehzwpnm8tFR7ouE4c5+eEvr8K3SLUp145OHzgdQZuB5VI
 L6ZAIa4ak/Qcy3VF5y1WyO7wDgJSAXrxSIWSwLbTtkQmTdMtDYKp+jZYfo4KphuBBq3h
 d7zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZGehVdfJ70M34hNbL9vHM2rJaxiiWaR5xLsMZPKwKJVT4DWodvTR8cXlsQ/vfI4ErjUgy/zO1yl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLKZFN5nf10g16UeqExOjjup0lcCiozO/+75/K426yitEVwq12
 OUrpZAB6feqXFkN71n5OeCnfNnQrhWO2K0y9U7DvkgrEq0rIqnWtyvwkopfUHMUZR14=
X-Gm-Gg: AY/fxX4zXTrymdbUb0ytE28PbS6eIEEal6J3S8xw9th1N4/hNW35sxJPrwEB+CwFRi6
 yF42CD5KBY/eIPwgdfLzAnY/3SLTay922FYKD3flsrr0K/ib3RGYN/b6l0hOlWcyqlSjASWdA3j
 bY655ZTWAzHGTEGaP7CsBXxKFoh+uhuAtOmEDGuuvGGhAJzdTJq0w8RHWnTci66b5ajyfXpoQeM
 xrsFXV+riTEc4KuDEc5gXlxZHvnnJctsTsbL29qg+rXCrJGW4NOnr5JtVV4+/1jepb/nff4cv0g
 eQMIJTnVO1W1Dm4YmATZJ+dsTYEfoCK9t0Lk/ELF7vi0X3y9IMvaj/wjVZ1+yViveoTEWwbOVph
 vUPTjaa7Pq5TIJNQG9HtlvWs7y55SEfG92aBBrAp2HjWPrdzV1SUvofk0sri9oYjDKwH10YvztJ
 zDB625xnKPg64a/0D1La8kR2P3HHeKvhrABvNPvgFTlbREFCiJG/d2DKVEY8SUWDc=
X-Google-Smtp-Source: AGHT+IHhh7eNAvL73sUX53//v2jQskR2Q8o/cn9pMbSxXR/ZXz2pFzXlk7MoGVqsyxZ2xGWvQxnFEQ==
X-Received: by 2002:a05:600c:1ca0:b0:477:9b35:3e36 with SMTP id
 5b1f17b1804b1-47a8f89be82mr154636105e9.2.1765878818536; 
 Tue, 16 Dec 2025 01:53:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2?
 ([2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430fb078e56sm13657861f8f.21.2025.12.16.01.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 01:53:38 -0800 (PST)
Message-ID: <6c04c58e-339b-4b5c-a2b4-8a9509612335@linaro.org>
Date: Tue, 16 Dec 2025 10:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 4/8] drm/panel: sw43408: Separate reset sequence into
 own function
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Petr Hodina <phodina@protonmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
 <20251214-pixel-3-v7-4-b1c0cf6f224d@ixit.cz>
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
In-Reply-To: <20251214-pixel-3-v7-4-b1c0cf6f224d@ixit.cz>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/14/25 15:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Splitting reset() from prepare() follows clean coding practices and lets
> us potentially make reset optional in the future for flicker-less
> takeover from a bootloader or framebuffer driver where the panel is
> already configured.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index dcca7873acf8e..ed9c7452ea846 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -119,6 +119,16 @@ static int sw43408_program(struct drm_panel *panel)
>   	return ctx.accum_err;
>   }
>   
> +static void sw43408_reset(struct sw43408_panel *ctx)
> +{
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +}
> +
>   static int sw43408_prepare(struct drm_panel *panel)
>   {
>   	struct sw43408_panel *ctx = to_panel_info(panel);
> @@ -130,12 +140,7 @@ static int sw43408_prepare(struct drm_panel *panel)
>   
>   	usleep_range(5000, 6000);
>   
> -	gpiod_set_value(ctx->reset_gpio, 0);
> -	usleep_range(9000, 10000);
> -	gpiod_set_value(ctx->reset_gpio, 1);
> -	usleep_range(1000, 2000);
> -	gpiod_set_value(ctx->reset_gpio, 0);
> -	usleep_range(9000, 10000);
> +	sw43408_reset(ctx);
>   
>   	ret = sw43408_program(panel);
>   	if (ret)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
