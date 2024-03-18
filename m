Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494187E55D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 10:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3030310F2C9;
	Mon, 18 Mar 2024 09:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lTO0zkHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6271D10F09C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 09:03:25 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-513d599dbabso4354470e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710752603; x=1711357403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1PZGRYPJqqzn9iYzTtc5s9xoTBTj3c32T3hMoy3urCI=;
 b=lTO0zkHpZPvQUoK50A6lfQPfhlKfx4QkzOtlF8YtFEF8E1hzD3VlsTJCykM5zYCIk1
 qCkJ/H95LFihlw77LCxXFTtpXgf4sGrPrPhUgctWb1mkOH0dM7inAQyBfk9Kbdc8O/BC
 9sHXaNGDFe7D8ahXvBvpfkdHxQBz1BQkj4OlosRwnWCSgTjvDx0nucZAO0KVB0l5Co7I
 GoGmgFNmwF1oPighm/weIcI/LY0P1qoYo+dAm25s1Tfq02UvIg9p6eSgd4aMHwMcdYPQ
 KpgNNWmCc8CLNyJtEpJO5ILdbmVnx6XWPXXud0H1bd5/5a924o0HQjBQJyjm4lQfJLbg
 Mg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710752603; x=1711357403;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1PZGRYPJqqzn9iYzTtc5s9xoTBTj3c32T3hMoy3urCI=;
 b=OEHnKDCWTpDBFq5YjiHtNGG/13rAi7OUODKeUqEWF7FvlHc0edV8+fn519uEShbqWh
 y/dIvZAjOZkH3EMvD/uUxJEgFMW5zF3VsqK26zv9utJEiDdAUlpTDXr7px58DpWwDZUe
 cdJzK2LvFC5JZz5ZSMpRZyVDP4F+IKAu0q2+uOExZ84v1U/7kP9HuKA6vF1RaWLP22C6
 1nD5wlv8H/kQjVYbIug7DCSSn+DVRvqw3zGu5OyjNjKDyPpyV4bzhF/VubNTIt78a4Ge
 oLtVr2d7ReJp2gORRo832zH1Cld8D4o+A9k34o8nGFaRzN80Es3EREiJ+ZnMAtnmxtpn
 iC9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE7FOsJKuXn7+SDsFw4hvKICmgqwMAvVlOEI4IIt9VTS+/n0lyWu4zh32PBbP/AXiSM0Ow0NV28AGkLkIkjA7ivmUrXXLITUsfwYzkPYeg
X-Gm-Message-State: AOJu0YzkPukmKxLG96APsikYA/b7nNnEqX2GKD7Jxxiq2BYRJO4Zf/lP
 6HMWEoR6uQk1J8P6wSwzNiXMA3Lnu1gLI050osb3sJRGqQcVzrgwfxVYqRsNLjA=
X-Google-Smtp-Source: AGHT+IGDTGVzgBQKuZMi/rMEembyBy+qabsFmeh7b4Qc2+N1V7EG0R0KnA3+AuzOZU4YpbhyM/Oh1w==
X-Received: by 2002:a05:6512:3a93:b0:513:e7ff:15af with SMTP id
 q19-20020a0565123a9300b00513e7ff15afmr2572077lfu.64.1710752602935; 
 Mon, 18 Mar 2024 02:03:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc?
 ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0041409fa57c4sm5752066wmq.34.2024.03.18.02.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 02:03:22 -0700 (PDT)
Message-ID: <1c15f8b3-e9e0-4840-ab67-8a9de9d3ea6a@linaro.org>
Date: Mon, 18 Mar 2024 10:03:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Fix warning with GPIO
 controllers that sleep
Content-Language: en-US, fr
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20240317154839.21260-1-laurent.pinchart@ideasonboard.com>
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
In-Reply-To: <20240317154839.21260-1-laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

On 17/03/2024 16:48, Laurent Pinchart wrote:
> The ilitek-ili9881c controls the reset GPIO using the non-sleeping
> gpiod_set_value() function. This complains loudly when the GPIO
> controller needs to sleep. As the caller can sleep, use
> gpiod_set_value_cansleep() to fix the issue.

Seems something buggy happened to the patchset, this patch doesn't appear
in the cover letter and insn't numbered...

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 80b386f91320..084c37fa7348 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1276,10 +1276,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
>   	msleep(5);
>   
>   	/* And reset it */
> -	gpiod_set_value(ctx->reset, 1);
> +	gpiod_set_value_cansleep(ctx->reset, 1);
>   	msleep(20);
>   
> -	gpiod_set_value(ctx->reset, 0);
> +	gpiod_set_value_cansleep(ctx->reset, 0);
>   	msleep(20);
>   
>   	for (i = 0; i < ctx->desc->init_length; i++) {
> @@ -1334,7 +1334,7 @@ static int ili9881c_unprepare(struct drm_panel *panel)
>   
>   	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
>   	regulator_disable(ctx->power);
> -	gpiod_set_value(ctx->reset, 1);
> +	gpiod_set_value_cansleep(ctx->reset, 1);
>   
>   	return 0;
>   }

Anyway:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
