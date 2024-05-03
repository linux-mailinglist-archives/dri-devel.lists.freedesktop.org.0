Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699388BA92D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 10:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9774210FAC8;
	Fri,  3 May 2024 08:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uP7MF5Pt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0179A10FAC8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 08:46:52 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41dc9f98e8dso9973455e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714726011; x=1715330811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3s3VD1w8KwFV35p/jSmlc51sDi7d4+Z33wjW3IjI2tw=;
 b=uP7MF5Pt0vMk24hiGmJjh+/9hIzau2W10jpmdPGJkZ0N1oJKC8beds68VFAVwmhbqt
 ZH+zd0W2zOAvPS3ugmzRDbqWfazOC3hrlf+7UGPaAyX9kB3Q6/oPLHx1dZSvU4rJqb43
 4EqrXgusk3YsX3lVc0sEOlClrswfYZ1lvJA/5yC7KxzaHnO50IT9Vy/biXHvG+AI3E8d
 qrhgzCtwbVgnpLzlF14NJjgDubdBwxebRhkEoeW22VPAWB47i5K6WOEdPWxepvPUOvw5
 VyhYvX07Xcf4qMZtxIC9oc4qGEUgzBmRX139IxbLKYy6XVa6s1D/Jw5zJhTNT06h5SR7
 DN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714726011; x=1715330811;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3s3VD1w8KwFV35p/jSmlc51sDi7d4+Z33wjW3IjI2tw=;
 b=RRKYjGF4ujVdu0PmZqH0cc9JSYC/P43n3EC0SupkojDuEBX9cqBL0gG8cdFM74kh89
 qcx9C9z+CrK6qg8FDtZK112O5UTGWNmg5+IkcvzgpxFBZCtoQ2ZE/sslaB5xYqmj81SW
 x+eylbjQOQRfqUtlrKUTvaXPqwpSrmjYEa/hwQJIwPcUNUB9FzNHbog4IyhHEzimpFik
 nYaS+QjvA3UyQo6XhFxxGbAW1V8EM+yAB0IfNN4fJFaQHO57vZoZOfabM2Xo80frk0bT
 jTbbjifcmPI5rZgssInHJ/KlPMxIEHktY87uorh6lG2kSl/48xPhsKuwTK4O+GLfnpKO
 f+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Keg2VgSOnVqo0oB53/WDR1/8STDzp5Ku9dhAaknJj1nlWiQ9p2DcXEXbNZwugLqVAKbhVsF2QSZT/kLbPsj+h2Rtmqfcsf3DFMqCBwVG
X-Gm-Message-State: AOJu0Yyj1MPnI6xqIQIVecigqDMyD8Smk5geHSSlyYBS6L31wQhfRqkz
 u33YjzN0Dq3Eah/vkWlxO3CHYLSjQyqsuyy2Lm4JGwOvibhwgEIplNAX+lNbEpI=
X-Google-Smtp-Source: AGHT+IFRrOqPSMjIxFVJ9l01s/bqrj8yU7lizFlG479j+KZ5hLYBZ60jwmCoCEWp/5wMFx6EWVnMJg==
X-Received: by 2002:a05:600c:3b99:b0:418:bdcd:e59b with SMTP id
 n25-20020a05600c3b9900b00418bdcde59bmr4362402wms.7.1714726010989; 
 Fri, 03 May 2024 01:46:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2?
 ([2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2])
 by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b0041bff91ea43sm4805857wmb.37.2024.05.03.01.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 01:46:50 -0700 (PDT)
Message-ID: <572e975a-47e1-4098-9254-f90a4bb81836@linaro.org>
Date: Fri, 3 May 2024 10:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/meson: dw-hdmi: add bandgap setting for g12
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240426160256.3089978-1-jbrunet@baylibre.com>
 <20240426160256.3089978-3-jbrunet@baylibre.com>
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
In-Reply-To: <20240426160256.3089978-3-jbrunet@baylibre.com>
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
> When no mode is set, the utility pin appears to be grounded. No signal
> is getting through.
> 
> This is problematic because ARC and eARC use this line and may do so even
> if no display mode is set.
> 
> This change enable the bandgap setting on g12 chip, which fix the problem
> with the utility pin. This is done by restoring init values on PHY init and
> disable.
> 
> Fixes: 3b7c1237a72a ("drm/meson: Add G12A support for the DW-HDMI Glue")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 ++++++++++++++++-----------
>   1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index a83d93078537..5565f7777529 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -106,6 +106,8 @@
>   #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
>   #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
>   #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
> +#define  PHY_CNTL1_INIT		0x03900000
> +#define  PHY_INVERT		BIT(17)
>   #define HHI_HDMI_PHY_CNTL2	0x3a8 /* 0xea */
>   #define HHI_HDMI_PHY_CNTL3	0x3ac /* 0xeb */
>   #define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
> @@ -130,6 +132,8 @@ struct meson_dw_hdmi_data {
>   				    unsigned int addr);
>   	void		(*dwc_write)(struct meson_dw_hdmi *dw_hdmi,
>   				     unsigned int addr, unsigned int data);
> +	u32 cntl0_init;
> +	u32 cntl1_init;
>   };
>   
>   struct meson_dw_hdmi {
> @@ -458,7 +462,9 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi,
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0);
> +	/* Fallback to init mode */
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, dw_hdmi->data->cntl1_init);
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, dw_hdmi->data->cntl0_init);
>   }
>   
>   static enum drm_connector_status dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
> @@ -576,11 +582,22 @@ static const struct regmap_config meson_dw_hdmi_regmap_config = {
>   	.fast_io = true,
>   };
>   
> -static const struct meson_dw_hdmi_data meson_dw_hdmi_gx_data = {
> +static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
>   	.top_read = dw_hdmi_top_read,
>   	.top_write = dw_hdmi_top_write,
>   	.dwc_read = dw_hdmi_dwc_read,
>   	.dwc_write = dw_hdmi_dwc_write,
> +	.cntl0_init = 0x0,
> +	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
> +};
> +
> +static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
> +	.top_read = dw_hdmi_top_read,
> +	.top_write = dw_hdmi_top_write,
> +	.dwc_read = dw_hdmi_dwc_read,
> +	.dwc_write = dw_hdmi_dwc_write,
> +	.cntl0_init = 0x0,
> +	.cntl1_init = PHY_CNTL1_INIT,
>   };
>   
>   static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
> @@ -588,6 +605,8 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
>   	.top_write = dw_hdmi_g12a_top_write,
>   	.dwc_read = dw_hdmi_g12a_dwc_read,
>   	.dwc_write = dw_hdmi_g12a_dwc_write,
> +	.cntl0_init = 0x000b4242, /* Bandgap */
> +	.cntl1_init = PHY_CNTL1_INIT,
>   };
>   
>   static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
> @@ -626,18 +645,8 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>   
>   	/* Setup PHY */
> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -			   0xffff << 16, 0x0390 << 16);
> -
> -	/* BIT_INVERT */
> -	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
> -	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
> -		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -				   BIT(17), 0);
> -	else
> -		regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> -				   BIT(17), BIT(17));
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
>   
>   	/* Enable HDMI-TX Interrupt */
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
> @@ -848,11 +857,11 @@ static const struct dev_pm_ops meson_dw_hdmi_pm_ops = {
>   
>   static const struct of_device_id meson_dw_hdmi_of_table[] = {
>   	{ .compatible = "amlogic,meson-gxbb-dw-hdmi",
> -	  .data = &meson_dw_hdmi_gx_data },
> +	  .data = &meson_dw_hdmi_gxbb_data },
>   	{ .compatible = "amlogic,meson-gxl-dw-hdmi",
> -	  .data = &meson_dw_hdmi_gx_data },
> +	  .data = &meson_dw_hdmi_gxl_data },
>   	{ .compatible = "amlogic,meson-gxm-dw-hdmi",
> -	  .data = &meson_dw_hdmi_gx_data },
> +	  .data = &meson_dw_hdmi_gxl_data },
>   	{ .compatible = "amlogic,meson-g12a-dw-hdmi",
>   	  .data = &meson_dw_hdmi_g12a_data },
>   	{ }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
