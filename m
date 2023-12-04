Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF6802F65
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598FE10E344;
	Mon,  4 Dec 2023 09:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F9F10E0CC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:55:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33349b3f99aso581071f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 01:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701683739; x=1702288539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Jxjebb37Sne+DCka+TV8LuBzeXYyvVFK5U1pDR7IXD0=;
 b=sdGR0ReGcSVeK06xWl+Z1PKabdghG1uXf6OOwPpv4h/j+y6mNP11K/9YGDHNsbu5uL
 aPXbO2Q7yKx4fSAQ1P+pR4nQV7Km3qq9BFTtMIY3Ok0kIZFvqTVdDOkPOb/dzQRQ5M3t
 QtCshak4pcV8APnLU6jP1o4ha5kgIovO2NxKo0VANTHeB17Feab7Ppq0uwQNNpwahLmy
 Ikg3qPftJkRDrjxnJYacfKH4a9MVUvCtwSgRFJoIsZLdlsGfY1VOMLszg1cxHzKUIUAZ
 f33VrvULtjdx5KtxstgTsSpMDLUuNTh5VXOa0iK8LHDBGULah/nAdQJj4dbsS/GtUe4F
 rfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701683739; x=1702288539;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Jxjebb37Sne+DCka+TV8LuBzeXYyvVFK5U1pDR7IXD0=;
 b=f+DXnbU+C40tp5OtQBJDBbXwT/f0SWaP+4G2GZKFBvkJb3PJbzm+E69pPbQhR86vF0
 YnH027r4ql45W6E0QaqLm19RcfOWaN63Ml6mc2qZHKSrnphMLQ9H2S6htvjxES+5+W9W
 bALEyd7pobJ8Gewfv7hmcrPMYDdzuS2KOYSEtKvF6i5AZkw0GWKVQTqMZaSjAwzm8AhG
 rLvouspuxpIItV3Hl4IiMdx/40eIr6YGu7vbwkTeNp272ZkPKID7Xyq2ERP0ljZPAUCf
 kDB39kT66UujSqI3/iKDqa05bLanyXmPvwqVfb0WOhEAQAcIHJh5tBih0AFP42dH/yzq
 BcVw==
X-Gm-Message-State: AOJu0Yy/KRZTacA4y5vYVWaNSYuU7/cI3WxbWPQn1b2nbVGsShv+TKKn
 j3Gx2rZJPSWkFwNom/BwQVa4Zg==
X-Google-Smtp-Source: AGHT+IHOF2x2nOBvKzkL5ClpV4l+rVoeI49QmCyyViebLcCdoNL/gwOZllNFKElB4n4NjA2FqTxO9g==
X-Received: by 2002:a5d:4291:0:b0:332:f8d2:6407 with SMTP id
 k17-20020a5d4291000000b00332f8d26407mr3737740wrq.64.1701683739255; 
 Mon, 04 Dec 2023 01:55:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58:12b5:777b:9d17?
 ([2a01:e0a:982:cbb0:58:12b5:777b:9d17])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a056000118300b0033340b6d3a7sm4421442wrx.76.2023.12.04.01.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 01:55:38 -0800 (PST)
Message-ID: <bb1554d0-7a5e-4b1e-a8e7-bcfabad9b070@linaro.org>
Date: Mon, 4 Dec 2023 10:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: tc358768: select CONFIG_VIDEOMODE_HELPERS
To: Arnd Bergmann <arnd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20231204072814.968816-1-arnd@kernel.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20231204072814.968816-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 08:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A dependency on this feature was recently introduced:
> 
> x86_64-linux-ld: vmlinux.o: in function `tc358768_bridge_pre_enable':
> tc358768.c:(.text+0xbe3dae): undefined reference to `drm_display_mode_to_videomode'
> 
> Make sure this is always enabled.
> 
> Fixes: e5fb21678136 ("drm/bridge: tc358768: Use struct videomode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/bridge/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index ba82a1142adf..3e6a4e2044c0 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -313,6 +313,7 @@ config DRM_TOSHIBA_TC358768
>   	select REGMAP_I2C
>   	select DRM_PANEL
>   	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
>   	help
>   	  Toshiba TC358768AXBG/TC358778XBG DSI bridge chip driver.
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
