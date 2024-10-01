Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61E98BF51
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 16:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD48110E62D;
	Tue,  1 Oct 2024 14:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CfI8Q6zM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DAF10E62D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 14:13:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42f56ad2afaso60439105e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727791991; x=1728396791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=a1Cx91VSztN2rJnet5B8fnphU+Ct26TY7sP7XUXBJAE=;
 b=CfI8Q6zMGkEr/XyXgrMyUNTqQ/jpSMazpEHp7LuoZw21w+9i37R0AYXM/xj+WKPrlU
 vBmknSHwdTifq5si3j02mlsdK2hno1ZlmvFOZMni69fp2Wqi+4S8T9/DOSGcfUUFS/Ha
 QWOiVEOO0ZqV+Yw/skOGnQIyKlqPWn84NwSYUC9Yu+aeMbn3jegFj2G+pMgSxOb/lEwy
 BEIu8Go44vvvVpWz0b6GLJn4OCWHIpTYlroa2lGluEpriUmU4CdJQTmYwR+hFlPKwaGq
 1l8HFscNnVGIGiideJCOqG05eHVASiPJO/hdLNuwkw9LAbWym2OYww+eeirNLET7QmhF
 7tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727791991; x=1728396791;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=a1Cx91VSztN2rJnet5B8fnphU+Ct26TY7sP7XUXBJAE=;
 b=GekIQgTbtXEOOkoUo8Dw+MFZaFtods4s1rAUkhilV5h06T0gAJSTCepRrgrjMlmyaw
 /cZZ3XGVTEpmRVOKhS6tF4OidzeGVrbxMxE5TerL3EtAv/Jugz3Cr4VpbWWUKXVFkCbC
 U/nv/ZzJC7b8Gt1LxOaIFaeON2xQ+SpbGdkcl/w9rhEDP8Oxvgu4jgKIB1BmLf9281/S
 ksl6m707JuXDMN7g5k7ucsMgZgdFTYoitvTc957FLLRmGtXNVV67cdIpBLvxnLkoFLNK
 wBv6d5MHW/o8k6oep1SHucBJ+7VbayRaM8h0QePfl4YtR908rEMMrgNxB6BgWFldAko7
 oqMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGGGrvcZ9LmkwBehkrcUtSYbA0nISdBlSjaQRHIXezV0EzZy9/gZnhFYvmCKfImhKGbx7WZkf28Y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaC4K/PN/8SNIuVsMqv8CNlMJNWy0VtWdmTb3UIDr7mutndK0l
 56zhiOXltVRYwYGuiWs5CWq8SgllDl32AqAyO1ihpsWEEzNNWiFHaE00LVZrXIY=
X-Google-Smtp-Source: AGHT+IEXiTdUkwq0hs5gvz7znC7eRTgwUSQ6YDYbQFzkPBe0ChNgj2UgohJe3Hnz52MtEpTmvXyI3A==
X-Received: by 2002:a05:600c:4751:b0:42c:de34:34d8 with SMTP id
 5b1f17b1804b1-42f5849771fmr149867555e9.27.1727791990540; 
 Tue, 01 Oct 2024 07:13:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f9b2:9800:19f8:2888?
 ([2a01:e0a:982:cbb0:f9b2:9800:19f8:2888])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd575de73sm11807180f8f.115.2024.10.01.07.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 07:13:10 -0700 (PDT)
Message-ID: <e050f066-7c35-463f-8c0d-9061f78e319b@linaro.org>
Date: Tue, 1 Oct 2024 16:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: jd9365da-h3: Remove unused num_init_cmds
 structure member
To: Hugo Villeneuve <hugo@hugovil.com>, Jagan Teki <jagan@edgeble.ai>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240930170503.1324560-1-hugo@hugovil.com>
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
In-Reply-To: <20240930170503.1324560-1-hugo@hugovil.com>
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

On 30/09/2024 19:05, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Now that the driver has been converted to use wrapped MIPI DCS functions,
> the num_init_cmds structure member is no longer needed, so remove it.
> 
> Fixes: 35583e129995 ("drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 44897e5218a6..45d09e6fa667 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -26,7 +26,6 @@ struct jadard_panel_desc {
>   	unsigned int lanes;
>   	enum mipi_dsi_pixel_format format;
>   	int (*init)(struct jadard *jadard);
> -	u32 num_init_cmds;
>   	bool lp11_before_reset;
>   	bool reset_before_power_off_vcioo;
>   	unsigned int vcioo_to_lp11_delay_ms;
> 
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
