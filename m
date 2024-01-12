Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348D82BCC5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2988110E9D8;
	Fri, 12 Jan 2024 09:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF40010E9D8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:17:04 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cd0c17e42bso70508661fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705051023; x=1705655823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=x+qGQk9kZKQizJyhm+l5tX1GkAmDGkc81FoKbINBLR4=;
 b=ZU46jFBSZTd5AkcvcjMIluB47uA/+ZfN+Z4pJQsW8qnokDcSsKCB1ECvyjE/YF70z5
 3Ku6tYCeOMgTNhOV/tcG91htQSMuR0ekEWxmK68ew62MlGF4BhmCxo81QTQz9a9+b2bk
 J2QAtbMGITg6cGcly+cTUE8QdSs9G1rHyG0m2kqL4pZzAg5sIvfbenImIDZlLlHp8M+U
 MLeNOM7a09Xz97tsKvVdvVTORu5QOkGAx2H7YzwkNNrzh4cUQ091uiK8rog35g5ZZH1a
 PqNcapxf59Oc898Y6ta9DCD3NcFoZTfOsCe/8l3FhrtgL5iMSTzW0iaM9ZqQ6A6XVSat
 WFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705051023; x=1705655823;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x+qGQk9kZKQizJyhm+l5tX1GkAmDGkc81FoKbINBLR4=;
 b=BaOwnMNy1A4/GOqDhWOrCnK+DMPj6IsP2gmRiFRGz8aPKXZK7sFKk4oWonXykW7t3q
 zj49h110sWU9tfJi1rVddkORpkHKe1Mwa0dLrSCUjHHbYcFzu5Ddv0IIxGL++cWdrqaQ
 vGvFjLsJY29X96bmkzakIIc1KwKsPEao2r5bYkdHJqmOzNQwp45eumQLSWzhX4aNjjl8
 xbzZsAs6/b9CbyYDE7PsIC3KSzcMthwYz1iqsdgcTS1YQ9lO+pzHEK3IGHV8gJFpkH10
 cwuk3E0ZJvmF83mepUMeCTbwtTEapZ8nK6kWLPzAA/cc3Cajf60LpUFqJClPaay+TL/j
 jXRA==
X-Gm-Message-State: AOJu0YzcT2mY5JKDgYmUzyz/nElwHH4C5R9EG3eC3qGQH5dNHVwY/dlg
 UMFEuojzUC9lmbPzmqWp5fe6B06k59N9yA==
X-Google-Smtp-Source: AGHT+IElvV++SXAMCTEt9C5Hq01ACShemBdkM7Sw7aSOE7iq05yuQJzudIXYQBqv/blfMbhTaPUJNg==
X-Received: by 2002:a2e:9b45:0:b0:2cd:55f1:2518 with SMTP id
 o5-20020a2e9b45000000b002cd55f12518mr494391ljj.88.1705051023102; 
 Fri, 12 Jan 2024 01:17:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:59d5:231:f1ee:77f?
 ([2a01:e0a:982:cbb0:59d5:231:f1ee:77f])
 by smtp.gmail.com with ESMTPSA id
 q28-20020adfab1c000000b003372b8ab19asm3327103wrc.64.2024.01.12.01.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 01:17:02 -0800 (PST)
Message-ID: <ba2f82f2-a9b0-435d-9f49-1ef7963ae0a6@linaro.org>
Date: Fri, 12 Jan 2024 10:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/1] drm: panel: simple: convert LG LB070WV8 fixed mode
 into display timings
Content-Language: en-US, fr
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240110082245.417736-1-alexander.stein@ew.tq-group.com>
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
In-Reply-To: <20240110082245.417736-1-alexander.stein@ew.tq-group.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2024 09:22, Alexander Stein wrote:
> At least the pixelclock has a range which can vary. Convert fixed mode
> into display timings so they can be overwritten in DT if necessary.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Rebase to next-20240110
> 
>   drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d3ba94f796a32..754e154f22bfc 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2793,21 +2793,21 @@ static const struct panel_desc lemaker_bl035_rgb_002 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_LOW,
>   };
>   
> -static const struct drm_display_mode lg_lb070wv8_mode = {
> -	.clock = 33246,
> -	.hdisplay = 800,
> -	.hsync_start = 800 + 88,
> -	.hsync_end = 800 + 88 + 80,
> -	.htotal = 800 + 88 + 80 + 88,
> -	.vdisplay = 480,
> -	.vsync_start = 480 + 10,
> -	.vsync_end = 480 + 10 + 25,
> -	.vtotal = 480 + 10 + 25 + 10,
> +static const struct display_timing lg_lb070wv8_timing = {
> +	.pixelclock = { 31950000, 33260000, 34600000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 88, 88, 88 },
> +	.hback_porch = { 88, 88, 88 },
> +	.hsync_len = { 80, 80, 80 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 10, 10, 10 },
> +	.vback_porch = { 10, 10, 10 },
> +	.vsync_len = { 25, 25, 25 },
>   };
>   
>   static const struct panel_desc lg_lb070wv8 = {
> -	.modes = &lg_lb070wv8_mode,
> -	.num_modes = 1,
> +	.timings = &lg_lb070wv8_timing,
> +	.num_timings = 1,
>   	.bpc = 8,
>   	.size = {
>   		.width = 151,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
