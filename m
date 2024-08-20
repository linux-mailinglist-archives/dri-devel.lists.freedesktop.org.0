Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DBB95821A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D368B10E573;
	Tue, 20 Aug 2024 09:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TqUrN5Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9A10E573
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:25:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42812945633so46247715e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724145953; x=1724750753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5fpdSwy3nGrw4PABZFiCr5LgDgb+DtH007BgfPyMTp0=;
 b=TqUrN5Pvz5bgVsOwNMaOpbY3ZlvJRa6mJejKdxcdVY1VdqWFnf3tO7vnXIpSDbcAHf
 Rn248RZRdULb1wZhX8mYWLcEtSL1JBzY66cqaN8NN3aSTwyy+UgZbQnBp1bb0HFpQRvI
 un3ibuWB8y2sE6shed2/Hdz8loMl33UTQtzK/N6oWyI/M4atbH5KKiVbKyhGbu/Z1yhv
 wSR/nmH8oAdFTGjb00FceGZMM3AOAIiZ9rhuvV6UmVUApuNqQyHoekhTHCx/31eDAMti
 MZIadQUU9UMhw8o8TKlOnp+bZ7cvJUr17DQmH7CxuzsfZlB0WGJUTQYZBQ+QHiYizguH
 tdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724145953; x=1724750753;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5fpdSwy3nGrw4PABZFiCr5LgDgb+DtH007BgfPyMTp0=;
 b=hPDUnSZ11XZFSCMea763Tnp2mIkyOjpOLHi2K0SYRlqqt2JP7icGlskv0KoAI10YQB
 LXYHdXuioe/OFk5OhRMqEk+OQweVN1LOZ/SDodTjrx2D0a+RWyIJllSHIqn50dNJepU7
 zZ8sCm1f1LC9pqIiW+ubK9mKhslyPS6Hx34eD96oc78yLbk0q93aR0mIey5SD3FpwNcq
 8KIUYS1iCqBbxnSAh5HV+R1mD/3HU4xW7opwAhSp78PoZe/tFla3Cg6cFTQTUS4aeAUg
 PdLrhoD5+QH1PbVVviech3h4JSnz4N+Efuh/QtxCXmTyLMn7b02cxhYH7wTww/k+R8Eu
 IA+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxU3zjf7SkZ9wuJrBU9mhkxuOIA3zVOiRO4Lp5Xshj7Lfl9d38CbC7kj1Id2QkpQwxf2qW3hrTfUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI/r7XyujnnShr4CqpXqLwiXpGFwMU2dKihh0qKdY1Xb5dLp2N
 M9xxzhFmxUF093RiF8zd596q1L/3tiNjenRxPsZejjtgc91RU/OhM1bcBxRrOKE=
X-Google-Smtp-Source: AGHT+IE5taQEJMC1YeBdOtD2SdXBNuCi3YY2RtBFOJ7kytJ3vZFgMvT8yq2apa+5KoIxZxwxyRVs6A==
X-Received: by 2002:a05:600c:3509:b0:426:6b92:387d with SMTP id
 5b1f17b1804b1-429ed7b8860mr97908635e9.21.1724145952525; 
 Tue, 20 Aug 2024 02:25:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad?
 ([2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898aabf5sm12616024f8f.97.2024.08.20.02.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 02:25:52 -0700 (PDT)
Message-ID: <230d1888-294d-4651-af23-a7045f9d998b@linaro.org>
Date: Tue, 20 Aug 2024 11:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] drm/panel: mantix-mlaf057we51: write hex in
 lowercase
To: Tejas Vipin <tejasvipin76@gmail.com>, agx@sigxcpu.org, kernel@puri.sm
Cc: dianders@chromium.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240820091556.1032726-1-tejasvipin76@gmail.com>
 <20240820091556.1032726-3-tejasvipin76@gmail.com>
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
In-Reply-To: <20240820091556.1032726-3-tejasvipin76@gmail.com>
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

On 20/08/2024 11:15, Tejas Vipin wrote:
> Converts uppercase hex to lowercase hex for cleanup.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 2a365eaa4ad4..4db852ffb0f6 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -23,7 +23,7 @@
>   
>   /* Manufacturer specific Commands send via DSI */
>   #define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
> -#define MANTIX_CMD_INT_CANCEL           0x4C
> +#define MANTIX_CMD_INT_CANCEL           0x4c
>   #define MANTIX_CMD_SPI_FINISH           0x90
>   
>   struct mantix {
> @@ -50,18 +50,18 @@ static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>   	/*
>   	 * Init sequence was supplied by the panel vendor.
>   	 */
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a);
>   
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xA9, 0x00);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x03);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xa9, 0x00);
>   
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x09);
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
>   	mipi_dsi_msleep(dsi_ctx, 20);
>   
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xa5);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2f);
>   	mipi_dsi_msleep(dsi_ctx, 20);
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
