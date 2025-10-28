Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0603AC13ECC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8B410E0B6;
	Tue, 28 Oct 2025 09:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lCGwsgge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC60D10E0B6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:53:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso71553155e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761645230; x=1762250030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8I8yp/MiZ7ri17yJV9kzL93n+BFpQFCc+/QSsi4tVMs=;
 b=lCGwsggeSJTdzphqCjSEJ3m6eumCPJExKrZV0t8Z+jl6MwQ+IqHAuCHyQvzPnk/EA5
 NxbXhKCvRteAaVZ+HvdPxhCv+p8TYiVhO5Xu0jo7KjVa1KHQjepSGXSuvUrLTITJuS+0
 izSSYixvGxW26yIAYrv5bfxIrW1DgG+eHT+WfxEkPc9VXRpVoEIoBJquA1IYh4Gqg1+a
 EDNehDdFHbkMUIpzrB9MoRfwlEY/ODu7skHSFe8ZJWM9xp4H+x7oPoE+7IziDKsKf38d
 r5f1l19gt7ZyDxAOXsL5L9vKESnIO7eRM1sju35DIifcrVyPu1Q7NjYN6HgpJWd30JeN
 P6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761645230; x=1762250030;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8I8yp/MiZ7ri17yJV9kzL93n+BFpQFCc+/QSsi4tVMs=;
 b=vpZgDl0YI5lywp0cPNvAX4zyTf3LAHOexhbm0I+9OW2xKIRVPVTKomINRzyX5pkNE7
 HKtI7kqoFsgE6Zmhqkw1DP/x7riTAbfaResjW8CMn58db5mj2BCSSMaytGk/yzqv4qhx
 54vHbEexeRb7J5dun4QC8iddYDKvo4RaYQsysjwP823SYi1hQVeGdcseRRbZn8imijvo
 gM1gLvArwM7nIrEfcvb4iKYDnxgRNDxG+y26ySU+aWtTt9eUPbwpKCt1Q+yPTVwtM+L4
 KCAavj2MLaXcKyJR62JYhLYrkvUqVeM8suqIar4H9DJ/RWP9qGF7t+Q6N9bqA8lH4yru
 ggWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUewpNi/AaMhpxtnYRV/9bwsjhUu9aMkz2R7UwaPCEo6Mz0FiYdposBvJpnZbnW+y5QoZsXo0yOUo4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvl1mOgyN8hs/ltO4Gq2unSYjCnLPslCA2rBDIsjvgZNj3F86I
 z3eQ1WbBItxSHsmXm5Ro1QJJRcS5SmFZNOgn7QaEdXkgRq5CYX/KQCvSlKCuUP0xsFI=
X-Gm-Gg: ASbGncuiZDeEukadHfISYuoXwt7x+RWD7g3cpLENE3I20DH/27aMeaPQS85wqV0wUo4
 TPSEP59nLXLn6rpRipCuHwibIcvkK/CsZQ6r8AG9UsVepsA4wzuqgkGe3n0gvWgFoBe3sZ74Dxc
 Hblr3wHLKlJLthheYNjy75wqrMlDljdWC0/99u4UUjz07Sb2ekugfMhAGkMrtTrYCByOfLaEQ89
 ddYrOiVHAa+E3GBVZnIZ/xgRlikZF64YOmoNvVEC+3etUnAO7+bRp7vbZLL52pnMuYTaJDDLJXi
 QoQpz9ABk5+e0vamZLXyITjby0ZH4HJwxTRkYELfxkKNjxGHnAmUsN1AKX4YypggWCsjqVBqDiS
 XMicXvJ9uuumfsOBay5O0CKAMX+V+FOTqBxsnpv3tjZwQ9JbvgQiG6+tnhEKbU0WzLACPWYuWMl
 5o9bOgevS7fPLjYq/Rcyl7hioS1bZdiUxB0iOEsgRUFiE9tKTL0Q==
X-Google-Smtp-Source: AGHT+IEqG+78yGFGY+SL/zvW3Zf5gXKbhNU8p6clS9qReHpKKpmAUUwL60SMqhqOg8eCmjLjilEooQ==
X-Received: by 2002:a05:600c:4f0b:b0:476:4efc:8edc with SMTP id
 5b1f17b1804b1-47717dfe1fdmr20085705e9.15.1761645230249; 
 Tue, 28 Oct 2025 02:53:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5?
 ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd48942dsm189090425e9.4.2025.10.28.02.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 02:53:49 -0700 (PDT)
Message-ID: <fbc3237e-0185-4c06-a6ea-f061a2afbd64@linaro.org>
Date: Tue, 28 Oct 2025 10:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: Fix reference count leak in
 meson_encoder_dsi_probe
To: Miaoqian Lin <linmq006@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki
 <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20251027084258.79180-1-linmq006@gmail.com>
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
In-Reply-To: <20251027084258.79180-1-linmq006@gmail.com>
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

On 10/27/25 09:42, Miaoqian Lin wrote:
> The of_graph_get_remote_node() function returns a device node with its
> reference count incremented. The caller is responsible for calling
> of_node_put() to release this reference when done.
> 
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 6c6624f9ba24..01edf46e30d0 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -121,6 +121,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
>   	}
>   
>   	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
> +	of_node_put(remote);
>   	if (!meson_encoder_dsi->next_bridge)
>   		return dev_err_probe(priv->dev, -EPROBE_DEFER,
>   				     "Failed to find DSI transceiver bridge\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
