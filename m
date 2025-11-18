Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0277FC6840E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675E310E438;
	Tue, 18 Nov 2025 08:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mHioQdn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA88410E438
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:44:48 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so28067155e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763455487; x=1764060287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=BiLXvYR3SAh3lzG8T3IGcW7j/zOR5abUB7/PBrsQY6A=;
 b=mHioQdn/scIjwEggpPg/KsCVqJX+Y1XJnhNdIhYh89TSLh6JriKW3JuoQanzcjb5qk
 4oSBKh+IgpJo9hdG3f+YCvEnljDHvrNRibt/FtgIWFkKvWRjvkS85tDHyHNdcV/yvbJ7
 uTTNXrSVvM3pSmetrK2PRfHyW4mfe5CtXELzSzCTifTs1X8akkJ7O39WnFpuAb8NKIoN
 Q25S7DBwdgsXfv3wkAnof9jhyKqawN3epLJBUdl8m82JiIBojHEudzZuCysFmnIqnEvf
 bzCTL2qCwnoWZXe67vioqZY4IPjW9QF8QHJEyAxFNdNdxHQwEgp8CSUv9Je9cUSU2VGu
 W66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455487; x=1764060287;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BiLXvYR3SAh3lzG8T3IGcW7j/zOR5abUB7/PBrsQY6A=;
 b=LeO0IEXIH+e3XtuV3LOfX67yGl3F7FyYsjGG6ao7gfIErRbEE+KXzqKLERpq7WptsD
 PUTDzVSSQpTUS5MAi0nTVPOiUveO7cLvm/4Ryh4xZlm/kPhqRHfEXhP4GCLJO2DKSqJN
 awD6SvoGcl7z2bXYmk/9QEnGeAKfxTWh7bTltHDDgKQ2deQpO5oo3ycavwE8g438Zy3J
 tHMzMMKStEy+HLU8Gvv8BNx/m/OxJM+Y7kRZJ94TbBYGp8k91jT96L0GkkldUmDSw4To
 unMU/8qoNhZ3rYzyR7RpFYXhbUftEFS5WGvnyZ5hQHsmZPykTGAH6i7MnGaQxS66qyo1
 prEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGfICUlEI2G0PYyZKFhFtD5vpaTc3hQ3/xzjjt9JbFENtkWfiNAVAOA8TmfV/kb3404OHjmrGEGZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0Jt+rlTEiNesQx55xVX0TZrtRKg7SBt4QiI+FJ/kHfC+mc8Ac
 in844p2OzSr4tIqg/NAAlkGi1/fjbSzplWXmDoC+JhrctzhXpN/O3SStpOr2V/Oz1uo=
X-Gm-Gg: ASbGncvl436ZKjLqXJn9P8GBdH/o2EQeFyhT4oZ25vapvGcXaawsjugp1gDnwVzrfwy
 iiFxrT5WFlLzbNgY1KpbKBHvc+iob1YOKfh8dDYzUtUjjpbsdhiyfWvBnzzWsb1wI3fyDfWPXe7
 FrRfTkuGYzGHHchV7bC95ovj42xUuMtK2Ut5kWgIQ4NzcLyDurWGms1LWj5yvPgh042J994pf86
 NkHWcHg0RnKuFVezQMCp1dnpyzDVGqRZXK6ra5GGUsoxpBZz5wvM8Jwhc9ws03FFBjVi+AfROPC
 4FL5e/u/+JzCZxKJjWtYCHMBJqN2+Y/KlPJy7cATV53YFiJR7jw6UFsv1TKU3848C0rdYeVDpb+
 rNLqH+7StVcyL5uRpjESKdo68/59VQ2W8Om3OwUlJQQ9LPwG2tEZicalXwxZ4W7MgAgcjAavcKj
 ahJT0rz876zrVrI8FtlVuGX7YXgD5+jN+tcILWWe8bWdCupweNY00rFTjy2pn3sel2zZ4rwW5G4
 KMr6Rhxo0BJ
X-Google-Smtp-Source: AGHT+IGJqAXhGGSb6TQDs+/kJY+mvonLz1d9fwow8P219ibyRskSfl5sWQxul2oAsZJHK4/xFqAfuQ==
X-Received: by 2002:a05:600c:1f88:b0:475:dd8d:2f52 with SMTP id
 5b1f17b1804b1-4778fea7579mr123949675e9.32.1763455487194; 
 Tue, 18 Nov 2025 00:44:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49?
 ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9dcbca9sm11108095e9.6.2025.11.18.00.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 00:44:46 -0800 (PST)
Message-ID: <5401d99e-fa43-4c9c-8eb2-c3bb126ff75e@linaro.org>
Date: Tue, 18 Nov 2025 09:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 05/11] drm/panel: ronbo-rb070d30: fix warning with gpio
 controllers that sleep
To: Josua Mayer <josua@solid-run.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-5-bf1a4cf5fa8e@solid-run.com>
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
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-5-bf1a4cf5fa8e@solid-run.com>
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

On 11/17/25 13:28, Josua Mayer wrote:
> The ronbo-rb070d30 controles the various gpios for reset, standby,
> vertical and horizontal flip using the non-sleeping gpiod_set_value()
> function.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>   drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index ad35d0fb0a167..c3fbc459c7e0d 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -54,9 +54,9 @@ static int rb070d30_panel_prepare(struct drm_panel *panel)
>   	}
>   
>   	msleep(20);
> -	gpiod_set_value(ctx->gpios.power, 1);
> +	gpiod_set_value_cansleep(ctx->gpios.power, 1);
>   	msleep(20);
> -	gpiod_set_value(ctx->gpios.reset, 1);
> +	gpiod_set_value_cansleep(ctx->gpios.reset, 1);
>   	msleep(20);
>   	return 0;
>   }
> @@ -65,8 +65,8 @@ static int rb070d30_panel_unprepare(struct drm_panel *panel)
>   {
>   	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
>   
> -	gpiod_set_value(ctx->gpios.reset, 0);
> -	gpiod_set_value(ctx->gpios.power, 0);
> +	gpiod_set_value_cansleep(ctx->gpios.reset, 0);
> +	gpiod_set_value_cansleep(ctx->gpios.power, 0);
>   	regulator_disable(ctx->supply);
>   
>   	return 0;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
