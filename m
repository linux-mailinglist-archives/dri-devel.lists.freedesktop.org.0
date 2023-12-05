Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AF804B88
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 08:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565E410E486;
	Tue,  5 Dec 2023 07:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A9E10E486
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 07:57:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso39595405e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 23:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701763020; x=1702367820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9wKxs7xZ79jme4PTKHT6uJoUIG1TQVqgCh6CwpsPZMc=;
 b=t7KXoOH/C8x6Tsa6oCyNpEKv6UKgK+lkFgiIu3WpO41wLUL/2cI3CtLgy5sR2kpuTY
 NK0CZzS97q4qF7Zdx95LmwKircDc93QaX0ktEfQJy88I+BwwpaRvNztuTi6OTuMZLs3E
 sdVl5KbQ5E+XV2OqcYyD8vEszM/1SARIii7KzvDjPTffOU4a2UL8BJ/Xnx0S2qMeLWYD
 6S0goAmdskl+OJ4fKDFdXB/On92AxsEPAVmgRdMzWwD+/asW71pfuC173/UCqyYvSLv5
 UAcZs/EsT9xZza/ugg6h6OTEPQ75jHWqIj1pw25UV6vU1psTpu+9E6vNnorxx5wfbR0a
 1AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701763020; x=1702367820;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9wKxs7xZ79jme4PTKHT6uJoUIG1TQVqgCh6CwpsPZMc=;
 b=gNWpvXXq95E+M+3AI6ndRfCn4mbkXVM7+GLe9QRClBhd0p+VCEj9zlxVSkLsTQrcEr
 BPIaXKhKt98AF8Iy8kZfnK27bFYS4wqxVVaXKSd/ci7b090jd7Kocbq6YZ9JM0yTUIoe
 f7Pye9OzNE67b6O0XtB0lXbsXoLARbp3GOI7Zd333ER4UizaWgUSlCDTtTHFnmKSaWhg
 SfYFXn+ZNbMYrGGB6GsXK7si9YI+gmX1YMX8Ir49AZSdnAiEXilxtTXmkpFtLk+rSVbX
 fp3M6zEeyc5shmjhzdwrMQLgNReW3LyYAiGttOQlLOXYilq9ct5mvtbiHxD0r27xmYKk
 t/DQ==
X-Gm-Message-State: AOJu0Yy6wiPXw1Wi/LOsIwuF/AxDNEMXJTeJqLOCyuDhOba5B3+cAgEa
 JPGNwrIxG/WtIWX0UwTzazvAoEFTn4FZcv+07hqUKOMy
X-Google-Smtp-Source: AGHT+IFoJA1vRBeRLH4mvga4DYOp11YjGDr1cQTpr5rPNeAKttSMcEOvcRe388zba48daFYOKpqDkw==
X-Received: by 2002:a05:600c:1396:b0:40b:5e4a:235d with SMTP id
 u22-20020a05600c139600b0040b5e4a235dmr260692wmf.95.1701763019867; 
 Mon, 04 Dec 2023 23:56:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb?
 ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
 by smtp.gmail.com with ESMTPSA id
 fm19-20020a05600c0c1300b004060f0a0fd5sm17803498wmb.13.2023.12.04.23.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 23:56:59 -0800 (PST)
Message-ID: <5502597d-cb2f-4fdd-8a2d-c7b6726b18f3@linaro.org>
Date: Tue, 5 Dec 2023 08:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 04/10] drm/panel: himax-hx8394: Add Panel Rotation
 Support
Content-Language: en-US, fr
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
References: <20231204185719.569021-1-macroalpha82@gmail.com>
 <20231204185719.569021-5-macroalpha82@gmail.com>
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
In-Reply-To: <20231204185719.569021-5-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 sboyd@kernel.org, sam@ravnborg.org, mturquette@baylibre.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 19:57, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for setting the rotation property for the Himax HX8394
> panel.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8394.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index d8e590d5e1da..b68ea09f4725 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -68,6 +68,7 @@ struct hx8394 {
>   	struct gpio_desc *reset_gpio;
>   	struct regulator *vcc;
>   	struct regulator *iovcc;
> +	enum drm_panel_orientation orientation;
>   
>   	const struct hx8394_panel_desc *desc;
>   };
> @@ -324,12 +325,20 @@ static int hx8394_get_modes(struct drm_panel *panel,
>   	return 1;
>   }
>   
> +static enum drm_panel_orientation hx8394_get_orientation(struct drm_panel *panel)
> +{
> +	struct hx8394 *ctx = panel_to_hx8394(panel);
> +
> +	return ctx->orientation;
> +}
> +
>   static const struct drm_panel_funcs hx8394_drm_funcs = {
>   	.disable   = hx8394_disable,
>   	.unprepare = hx8394_unprepare,
>   	.prepare   = hx8394_prepare,
>   	.enable	   = hx8394_enable,
>   	.get_modes = hx8394_get_modes,
> +	.get_orientation = hx8394_get_orientation,
>   };
>   
>   static int hx8394_probe(struct mipi_dsi_device *dsi)
> @@ -347,6 +356,12 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
>   		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>   				     "Failed to get reset gpio\n");
>   
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret < 0) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> +		return ret;
> +	}
> +
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   
>   	ctx->dev = dev;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
