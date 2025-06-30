Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA6AEE28C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF7210E492;
	Mon, 30 Jun 2025 15:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hfT/sb8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A8710E492
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:32:41 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so1448691f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297560; x=1751902360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TM6bGARcZMrEFIPxun/H10tMl5YJTValxXf2mbuJKbE=;
 b=hfT/sb8S7CgWtUCImLZ75wqlawkQZQ6w+9qeuF/okEfynVSIyDkjyvkXYE0Uts0xk8
 PsszK8yptmjIsoTewAUGGJ3DOZ+0cPZpxF1fpWgpqeH0s/EXjDmhjv2rXJsopwxMQtj1
 1VcgHTUwfG6HceXl3os+H/ByfMkPCF2db+p/I24YER/HD32PpVrXD8mnhWKquYfCMnvD
 Ev6riFVOsolmV5uz9YawYdhzfFR7w++Js1WJjle9gxW02WdQ5jGU1KQ9tRDE5DiKmdV5
 llHCgOmCj/BMN6zduQHGXSDH6++qo6njoyvIU4ayHaTuzeUkK0bh7bA7MbyXfpHZNVX0
 TkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297560; x=1751902360;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TM6bGARcZMrEFIPxun/H10tMl5YJTValxXf2mbuJKbE=;
 b=r1bK5sYliAec7NuqCEFEBmJuaXDVk21ib0ZnWT2qbghGrafhH/vj+c1jitVRfwLGWM
 7WblFcsmPOlPdDBwiQkiA+rbHCo/Jef5LBYzF7xQzgLYsIyjcaaDMtmY69Gc6W/I88P/
 q3u6zewwmR/ept9URp+BZ2yJt7+7/JeZKtyBYpy+PbwI1kylq18GMzgndAsUb0PiS3Lr
 yP+HTW5jevU8k2yzINJE+ucBopTaTtbeu7htc616Ojii0oB7EVruPQC4nXoBgI96xLTD
 DpfKYSvKl+BNB84FPuCLfCEF8ru3WnCRqv3ddP5KPR2VQ0YHBNJyZ25tLFkfJnpvAaIk
 7kfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWquF0/6yHugXX+LZfZI2mjDU7MkjDvLWLXcwZEMGkzLrRfKfJJ5neatri37J/cYZLw3G+XjkIahhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1qVUxPmNjuxhi5uUAEsoKK9ZE2pOohC96Gnu+GzMLpbGsqM91
 je+EEyv5rbpeqIXKFs0TavshAHrhSKWl8d/F/UJVT5Bib/5H4vYgkBX+a/yKz/bWypo=
X-Gm-Gg: ASbGncuVx+dSCChv6q1dlG8k9/AwjTBtgfPlnKLcc/SI7tdKc3sGEaYWczHlX40O0ZC
 bL+d1Risz/AizcfFILWlxokVHIL0Qy0V+/Ng7xidhKPPPxL/Y6fiQpY/H79xnII32NTFhu7iOhI
 hXXvVD3PDGT3zzLi2ZcDII5WukP4Y/vwIY9pQY62WON85zauGk2COVpN+rU+bNt2+cVj0IvVjz0
 uTTRotTzhrcvgBuJFcyk6qR8hLltkjfjdogw+ssKtPLSLBcCCTuof8bg2oAUnnjB6M6gIdc2Yl9
 9LoY2xiQNape1BkzSrbdrF9705ULw9Iydm04Vd4aYZhjlyG3zWmFKtYKV74Ey8YrODOG5pETNCE
 +Dg5/N1xHteUtCwH2yHlTeVXkAQ5I5YsBoNObyxw=
X-Google-Smtp-Source: AGHT+IHOKCfX8o6K3iSWVeSWTleKXFk/Ck/rHxEVE+zexb4rWH1ySnJbEv+nOY5vdoWp42ccJUnAgQ==
X-Received: by 2002:a05:6000:4b02:b0:3a5:39ee:2619 with SMTP id
 ffacd0b85a97d-3a8ff149453mr10644984f8f.47.1751297559841; 
 Mon, 30 Jun 2025 08:32:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb?
 ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f8e1sm10573229f8f.88.2025.06.30.08.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:32:39 -0700 (PDT)
Message-ID: <f29335b2-47c3-46c1-b183-f623a940f54d@linaro.org>
Date: Mon, 30 Jun 2025 17:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: raydium-rm67200: Move initialization from
 enable() to prepare stage
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
References: <20250618091520.691590-1-andyshrk@163.com>
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
In-Reply-To: <20250618091520.691590-1-andyshrk@163.com>
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

On 18/06/2025 11:15, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DSI host has different modes in prepare() and enable() functions,
> prepare() is in LP command mode and enable() is in HS video mode.
> 
>  From our experience, generally the initialization sequence needs to be
> sent in the LP command mode.
> 
> Move the setup init function from enable() to prepare() to fix a display
> shift on rk3568 evb.
> 
> Tested on rk3568/rk3576/rk3588 EVB.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   drivers/gpu/drm/panel/panel-raydium-rm67200.c | 22 ++++++-------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> index df6c1727237b5..459381d53847f 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
> @@ -320,6 +320,7 @@ static void w552793baa_setup(struct mipi_dsi_multi_context *ctx)
>   static int raydium_rm67200_prepare(struct drm_panel *panel)
>   {
>   	struct raydium_rm67200 *ctx = to_raydium_rm67200(panel);
> +	struct mipi_dsi_multi_context mctx = { .dsi = ctx->dsi };
>   	int ret;
>   
>   	ret = regulator_bulk_enable(ctx->num_supplies, ctx->supplies);
> @@ -330,6 +331,12 @@ static int raydium_rm67200_prepare(struct drm_panel *panel)
>   
>   	msleep(60);
>   
> +	ctx->panel_info->panel_setup(&mctx);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 30);
> +
>   	return 0;
>   }
>   
> @@ -345,20 +352,6 @@ static int raydium_rm67200_unprepare(struct drm_panel *panel)
>   	return 0;
>   }
>   
> -static int raydium_rm67200_enable(struct drm_panel *panel)
> -{
> -	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
> -	struct mipi_dsi_multi_context ctx = { .dsi = rm67200->dsi };
> -
> -	rm67200->panel_info->panel_setup(&ctx);
> -	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> -	mipi_dsi_msleep(&ctx, 120);
> -	mipi_dsi_dcs_set_display_on_multi(&ctx);
> -	mipi_dsi_msleep(&ctx, 30);
> -
> -	return ctx.accum_err;
> -}
> -
>   static int raydium_rm67200_disable(struct drm_panel *panel)
>   {
>   	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
> @@ -383,7 +376,6 @@ static const struct drm_panel_funcs raydium_rm67200_funcs = {
>   	.prepare = raydium_rm67200_prepare,
>   	.unprepare = raydium_rm67200_unprepare,
>   	.get_modes = raydium_rm67200_get_modes,
> -	.enable = raydium_rm67200_enable,
>   	.disable = raydium_rm67200_disable,
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
