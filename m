Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5AE8BA90A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 10:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098FE10E728;
	Fri,  3 May 2024 08:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aUs37K/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90F910E728
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 08:42:42 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so10939695e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714725760; x=1715330560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=mYoRu527Djh8ZG1yR7a+brPHoHQwejy0Kxn14NxRy3M=;
 b=aUs37K/KsfFNXSGmfrdV3fiN4dyEGWKvy4wQw8IPumOKgQzppqbo6o4ND5NyBLVlTn
 HJOA0iFKUEL4WvLgUGAj9+h/GbqMOw7aEH/R9RgXqwRUKKsCP1v4gCUAbL0i6btW4fu2
 cwCUpOnro8qPTdSU8loPethcX9lEULmoZo/Nip++RQRcRX2+CyN6AEIwVWWs8y+tKt75
 abnbBGOlz4Js2nkPg/0zLR4Hx3K8Ru5gr2dBitioceLbxCx7w1jtF+EOKYSwDh7dsYbS
 WSUUxk+fAZ1O4ibktf6cxwIT9CV+b7V7UxbSEz+vK05E2QpuiZAVr3TgcUX5XfS+y33y
 BYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714725760; x=1715330560;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mYoRu527Djh8ZG1yR7a+brPHoHQwejy0Kxn14NxRy3M=;
 b=C4O6pHpuiN+w4XMbVFXVqWkrTHYdDJT8AgAxOV3jcXNbQULULXXvy931CsxnSj1yMx
 wzzm33Jzrnf4MpRXRPK20VSyOZnC88aat6U84rpLi09QIVkrOH89422ASM8wTjyYtdVE
 exIDBbaksTyGSKw38H8/vb/GJ8nz4NFpfr5WKZhCdZLw3+QXqHPdjbj7oS226a/J5KCx
 /8ME82PrFjzg5GRg694gvMgee92BslR/snVNGP9LX1qGd5QnTwxMdNXCtXqDo0KSsf/f
 gILIqS2H5yNbtRLUsohTvRnxe8rXekDDfca0tp8YDvPmFy2bE1I5nCvqIUgE4qDYs4oH
 7yXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8sWN9FKPXiXrwpaO2mLpvvYJrmboRRAhPIzoJhwui1wzh6M17PAmekagQ9X8Sp/qwjK2SdeyVmwLVkuIgddQXzcoc6mWYxOKvHNkC0U1J
X-Gm-Message-State: AOJu0Yzbek4uGuD2JKoQ0eo9Ua2zwxVCwDT8df348xW7Nk78Y8pYWVQO
 18gwbHnTnKThDwAU1UxOSIHX1WIAS51/y8aYLHSolGzYBXKTamxUcXVt2uEVCpw=
X-Google-Smtp-Source: AGHT+IFjj2VXVI4GYTa+9MVFooqDbutk3qTYh1g2xyD+WgAXrK00lZRLsFkT67EwWybHsADpYViXGg==
X-Received: by 2002:ac2:5e29:0:b0:51e:15d1:b2d6 with SMTP id
 o9-20020ac25e29000000b0051e15d1b2d6mr1100584lfg.50.1714725760440; 
 Fri, 03 May 2024 01:42:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2?
 ([2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2])
 by smtp.gmail.com with ESMTPSA id
 s3-20020adfe003000000b0034e8a10039esm177867wrh.10.2024.05.03.01.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 01:42:40 -0700 (PDT)
Message-ID: <bc8523bb-8d51-46c6-a011-7c46bb62acfa@linaro.org>
Date: Fri, 3 May 2024 10:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/meson: dw-hdmi: power up phy on device init
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240426160256.3089978-1-jbrunet@baylibre.com>
 <20240426160256.3089978-2-jbrunet@baylibre.com>
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
In-Reply-To: <20240426160256.3089978-2-jbrunet@baylibre.com>
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

On 26/04/2024 18:02, Jerome Brunet wrote:
> The phy is not in a useful state right after init. It will become useful,
> including for auxiliary function such as CEC or ARC, after the first mode
> is set. This is a problem on systems where the display is using another
> interface like DSI or CVBS.
> 
> This change refactor the init and mode change callback to power up the PHY
> on init and leave only what is necessary for mode changes in the related
> function. This is enough to fix CEC operation when HDMI display is not
> enabled.
> 
> Fixes: 3f68be7d8e96 ("drm/meson: Add support for HDMI encoder and DW-HDMI bridge + PHY")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 51 +++++++++------------------
>   1 file changed, 17 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5a9538bc0e26..a83d93078537 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -384,26 +384,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>   	    dw_hdmi_bus_fmt_is_420(hdmi))
>   		mode_is_420 = true;
>   
> -	/* Enable clocks */
> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
> -
> -	/* Bring HDMITX MEM output of power down */
> -	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
> -
> -	/* Bring out of reset */
> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_SW_RESET,  0);
> -
> -	/* Enable internal pixclk, tmds_clk, spdif_clk, i2s_clk, cecclk */
> -	dw_hdmi_top_write_bits(dw_hdmi, HDMITX_TOP_CLK_CNTL,
> -			       0x3, 0x3);
> -
> -	/* Enable cec_clk and hdcp22_tmdsclk_en */
> -	dw_hdmi_top_write_bits(dw_hdmi, HDMITX_TOP_CLK_CNTL,
> -			       0x3 << 4, 0x3 << 4);
> -
> -	/* Enable normal output to PHY */
> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
> -
>   	/* TMDS pattern setup */
>   	if (mode->clock > 340000 && !mode_is_420) {
>   		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
> @@ -425,20 +405,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>   	/* Setup PHY parameters */
>   	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
>   
> -	/* Setup PHY */
> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -			   0xffff << 16, 0x0390 << 16);
> -
> -	/* BIT_INVERT */
> -	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
> -		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -				   BIT(17), 0);
> -	else
> -		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -				   BIT(17), BIT(17));
> -
>   	/* Disable clock, fifo, fifo_wr */
>   	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
>   
> @@ -656,6 +622,23 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>   				       HDMITX_TOP_CLK_CNTL, 0xff);
>   
> +	/* Enable normal output to PHY */
> +	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
> +
> +	/* Setup PHY */
> +	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +			   0xffff << 16, 0x0390 << 16);
> +
> +	/* BIT_INVERT */
> +	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
> +	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
> +	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
> +		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +				   BIT(17), 0);
> +	else
> +		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> +				   BIT(17), BIT(17));
> +
>   	/* Enable HDMI-TX Interrupt */
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
>   				       HDMITX_TOP_INTR_CORE);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
