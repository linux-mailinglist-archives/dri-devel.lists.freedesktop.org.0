Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4BECF7412
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5DF10E49E;
	Tue,  6 Jan 2026 08:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ep82XW0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB5D10E49E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:16:04 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so5706505e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687363; x=1768292163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=2RXzUF1ln5+oulmXk/n680HR54Be5PwLRIBrC3MX2Ps=;
 b=ep82XW0XLCGfg5jS1n1pBNtBVolJ6xaMAC2S1FD7EQT4VD55eOtN4VQ5pi7RdwYk8V
 CcEbQZbf53/nFjHp8+0IdVCFn4eQFc+33hcpf6UT/daKndfKW/xNgPiK3IX59OGWnHK+
 dfsHYO04JOidZ7F3WkAaBxsRLmwjMb8cHkuPh8giu4H+9XyYTUjHb/4cgoh8/DGLcZAU
 HalooMDl7xxABJOF6MZZ/KSLdf5RuLaBRLHXr4Cbe7OAdzoQp1IVFhKRzlXV2bnS8Rev
 L3J0n64Ql85fFoGZ5LIc6rHRTjslqqjBCf2bwbHad+VXmyyFIUm6bDusDyScb2E7RXBi
 YJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687363; x=1768292163;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2RXzUF1ln5+oulmXk/n680HR54Be5PwLRIBrC3MX2Ps=;
 b=H8VeP7sxZeNFZCTmC5e0rTa8NrB1wMglcMPs1NBrrfshEVpn2ZoN4vZPD5sTlajJPl
 g0ALmsA1uggFZoj6Ni0V4iNKHeStYnALHBeT69lzf6w1+wpU3XtL4qw8KnlQwcsQVKR/
 XrnEzXTPxjGwVInkhoqU0sqmDU80FXGqp5tOIHvHp980siV5zYv+XXOsUShmhFobI5Yz
 t/tCa7VghYyf4nCWrLLoQowfJxwaljhF1PNWo3DtH9hmkxVF7RYcFaZWob3g+ShFo+fO
 mzHtBWoy4fQu2nI9UxAiKjzvlLg9All+dWBYQzU5qwNkkgoKfqFSa53Y/u/WBR/CtKel
 Eh0Q==
X-Gm-Message-State: AOJu0YyHxpyhCm1Mm2wjwqxSGNjtHm54h9NT1CXS5HLUsm2r8z6a38hq
 JdM67dRVHyJdrVtiwdWxpnB1VtlYGugZp2Oj4F1OxQ76dieUCfboV4qpIxnCpdPCG5g=
X-Gm-Gg: AY/fxX7g7/Lb+H6lJc4wz9aw6T2lk4Dxfesj/4FKvVP2cglzDrEYPT/0JCs6ZE6g/tL
 c62jla3UB6Yqvw/6ZjtXyYork/M81tcXEEZ7EQgjk6mRPwmQE6RTNDtYqHei7M5ju2Nz4V4Nh28
 oMQotee0MRxiqMPTyyyvxQjBGzvK7sWen39VSHRRJ+OY85qDC4u/GBGaDz8kgZXec6WVb12NOXS
 635orjpDtA36Hre4WivZ2bW0hNsqoaGyJ+T+HfKTnKpT0XTvfJc69qfzaggZ6edOP05hAYVl4ad
 93ZX1DAD80z0OP4ZFdUqsVZVGMlWKbBgiyNWP7Hr4QNo/EbP1UDHWYoNNlWErmJYxp0xrHwnhlr
 Z4XJU1GvonLqeXiMHm3MJc3hX9FZJDTY1bMQHu4JvqTwP3eDeZ1qgBJoomCaKxfNKyLh3IIZLjb
 fPLOcZlfwCpEXjINCSRSfNlIoaLOcukqzkI7gjaDkJcJ1WwMX9rTR2tKeTu+C+Hqo=
X-Google-Smtp-Source: AGHT+IH60kuK/PXY0IqMZE4Sd9cXHxZGsJIz5+sRgLkn7IO6l5nc253rglz2ZxZzrX/dYgPe7W1yWQ==
X-Received: by 2002:a05:600c:8b72:b0:475:e007:baf1 with SMTP id
 5b1f17b1804b1-47d7f0a3af9mr22232555e9.34.1767687362860; 
 Tue, 06 Jan 2026 00:16:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6ef885sm28607805e9.9.2026.01.06.00.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:16:02 -0800 (PST)
Message-ID: <307ea449-c8a1-4fd7-a67b-7c6777eb4669@linaro.org>
Date: Tue, 6 Jan 2026 09:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] drm/panel: mantix: Drop bank 9 initialization
To: sebastian.krzyszkowiak@puri.sm, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
 <20260105-mantix-halo-fixes-v1-4-1ebc9b195a34@puri.sm>
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
In-Reply-To: <20260105-mantix-halo-fixes-v1-4-1ebc9b195a34@puri.sm>
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

On 1/5/26 21:24, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> This command is part of LIC sequence included in FT8006P firmware.
> There's no need to repeat it here.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 0e66ee7a727d..30e378faafcd 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -53,11 +53,9 @@ static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a);
>   
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x03);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xa9, 0x00);
>   
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x09);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x03);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xa9, 0x00); /* VCOM */
>   
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xa5);
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2f);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
