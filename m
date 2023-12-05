Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA5804B85
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 08:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E8A10E47F;
	Tue,  5 Dec 2023 07:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12F610E47F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 07:55:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c0f3a7717so11999135e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701762954; x=1702367754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tzcmZffbYx5/tNtAx6xcxlIAc5PghrZPFARiIkWCcG4=;
 b=Fq6oUbaJNHCrYVmbmlMFGmBEN2+TQSUf7alJS1wqarq/6N2kiRv7/mq6Rhx8yWIema
 7YZCKO/m5R2AuTxEIo6BPlV9yH4FeWhgd0fb2CY7hAX/GKMEPQ2aFfbK/YeY1VwtmDwY
 Ogv/MK8PpJbipFazeoqTwD2GUG6yvLvAQb1hmm0soYTFNwWFGugfpNyZ5W9DF+znH9gz
 1gsat6Sxrptk/CX0aUvGG7fgpVONfAJdIF804DcDUYj+2fgPOU+ggXLIFxBoQG5VCaYs
 sKN4b0du6ItTJSx46M2pukV+jGjCkB8ZhhahNPMjm71UM9zHaAQchf4P/FgXxs5QUKOk
 MDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701762954; x=1702367754;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tzcmZffbYx5/tNtAx6xcxlIAc5PghrZPFARiIkWCcG4=;
 b=R9u2jHBNCxdlO1KqZ5IdU84VNsffqvyZVtWR5yOhnd6CeMycnC3Gam4tfTpYEHRTlI
 M52Pj6CnazJe9SDEmEwOwL+fx3ikuQH1dkBFAGdh5EUhhQz9JMUwpKhdr1dK423gOCHd
 zQ9jw3FpOkQ9i0xiiwzYZVIDBCuAnYZKryIOa3ajC+eG+IwkL+lJuUtvUaKRd/zjtvrm
 LEv/AS2bNQxcX3VFKPPSEZ6tQbUAf8sRHwxT919uqQIs5iLKycCNdu4Mm9IxUY/wzusz
 C+KSEewA5GDXft/OMu2nYiwJAFhrI5iQxaGvtC393drXpoYHvS05cfLXiVIE1l6nggdY
 WL9Q==
X-Gm-Message-State: AOJu0YwBMACSKcqSZw7W9wFjETYf+x0ISccYk7zUwWhiyVNXimwh1ssc
 2roAEYKIIR3oKhm90VkLsrk72A==
X-Google-Smtp-Source: AGHT+IGj0QWa5dXQAF81+oHycch4XYGtWZwVER3ydaII5Y478qsGTyrMo2LxZzhBfx9sGHj97fWCsg==
X-Received: by 2002:a05:600c:4ecf:b0:40b:5e22:30a with SMTP id
 g15-20020a05600c4ecf00b0040b5e22030amr1676069wmq.118.1701762954374; 
 Mon, 04 Dec 2023 23:55:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb?
 ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
 by smtp.gmail.com with ESMTPSA id
 fm19-20020a05600c0c1300b004060f0a0fd5sm17803498wmb.13.2023.12.04.23.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 23:55:53 -0800 (PST)
Message-ID: <802900cc-b47b-4340-a391-1d96b5a9959c@linaro.org>
Date: Tue, 5 Dec 2023 08:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 01/10] drm/panel: himax-hx8394: Drop prepare/unprepare
 tracking
Content-Language: en-US, fr
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
References: <20231204185719.569021-1-macroalpha82@gmail.com>
 <20231204185719.569021-2-macroalpha82@gmail.com>
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
In-Reply-To: <20231204185719.569021-2-macroalpha82@gmail.com>
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
> Drop the panel specific prepare/unprepare logic. This is now tracked
> by the DRM stack [1].
> 
> [1] commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
> drm_panel")
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8394.c | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index c73243d85de7..3823ff388b96 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -68,7 +68,6 @@ struct hx8394 {
>   	struct gpio_desc *reset_gpio;
>   	struct regulator *vcc;
>   	struct regulator *iovcc;
> -	bool prepared;
>   
>   	const struct hx8394_panel_desc *desc;
>   };
> @@ -262,16 +261,11 @@ static int hx8394_unprepare(struct drm_panel *panel)
>   {
>   	struct hx8394 *ctx = panel_to_hx8394(panel);
>   
> -	if (!ctx->prepared)
> -		return 0;
> -
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   
>   	regulator_disable(ctx->iovcc);
>   	regulator_disable(ctx->vcc);
>   
> -	ctx->prepared = false;
> -
>   	return 0;
>   }
>   
> @@ -280,9 +274,6 @@ static int hx8394_prepare(struct drm_panel *panel)
>   	struct hx8394 *ctx = panel_to_hx8394(panel);
>   	int ret;
>   
> -	if (ctx->prepared)
> -		return 0;
> -
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   
>   	ret = regulator_enable(ctx->vcc);
> @@ -301,8 +292,6 @@ static int hx8394_prepare(struct drm_panel *panel)
>   
>   	msleep(180);
>   
> -	ctx->prepared = true;
> -
>   	return 0;
>   
>   disable_vcc:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
