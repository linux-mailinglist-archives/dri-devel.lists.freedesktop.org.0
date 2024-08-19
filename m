Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4628956FBB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D3410E2FF;
	Mon, 19 Aug 2024 16:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XYF/w0Mz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACAD10E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:07:07 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso37910865e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724083626; x=1724688426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5LNqeb3ZgALy4xdwAEcRE9nVauPSurOEFzQxg2hY7+Y=;
 b=XYF/w0Mz0BXHJZJ7+OEH1S+mu2qcnu2s/RIXXzsJ31+IggrRjWFApBJFm/h4kLAhl+
 xblU5crfOCzANkbo9IThtSq52WEQQ3mYA8KxccbT00V+ajVqYHyQ3WNHDLrTo0ndJCW9
 3aRAt2Y2BdmhdD2O3UYb1NK5e/qiL+kObuhrv04U4VT9U2iNRHNGM2WhB8pG0wFZlCqG
 ZDe9HDR6UBOA6oFzu5d7+EVtJOWhuDSG1I9Gly+c1rU7J6q5DXhmEtVgSnGa3mowK4PZ
 TejinAoZAG6zOB/S44vv6m2hHZqCB+LGI+YgZCRHAMQvQmR08N7kdD4NKx+ZbYrtiuNr
 +h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724083626; x=1724688426;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5LNqeb3ZgALy4xdwAEcRE9nVauPSurOEFzQxg2hY7+Y=;
 b=MtSNRk9entb4d9YUeRDGh8wQ7MvDLVtA1NUVsABP4mJldmq1ZWEw2yPZHFc9wGIOal
 phA+9XdgXVw2pN+s83vaZVbBNjkxX5hwmJM0B6z8tsxV5G+VcUXZAxXhAKyOv3TzvEyf
 7nKG1X6VAA3kzTLZezOfl9lx8uUbHnTDevoE8vXvoQl8qdcbpgxfhfB8Szjj40lxpDDq
 AqDsW38AkuaBMBTHRuwxbPYL0jPcM2B6KU9T0fTTSfVz/larmAHi7A0iiubu7VAW4N16
 X/L/JIKBNMZ4XqvSGqdx74bY3w3YHqjb/kEXLF6LiHtaeM3qfMFvrO8Ot6G1PBdfKoH6
 1vTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUZU6KsSMxwiDYSLr1KFMjR6U3xEZgGst4IOhJrCB3Lj7wR5bRXWvvhf2Y+19NkeO7bMJcx9h5QiGT3WCut6o4T2qiYCZRmhM+DKfUXTzc
X-Gm-Message-State: AOJu0YwPnBCHhYz5q2Be4nf3K5NVbTZgpCLb8HPxYhqdTdZN7zBUvZpV
 FF78vtpN9QbWTw3DWwmiv1rmygW9QJJwWuarbzj7wL0C2icQhL9t15UsudjP+FU=
X-Google-Smtp-Source: AGHT+IEQR4t87/P6PagiJISQ0jKse0XEojnisMOIM3YVNy+F7eNVyZm87ufA5Y7uQKmtDCtIpWVusQ==
X-Received: by 2002:a05:600c:548c:b0:426:55a3:71af with SMTP id
 5b1f17b1804b1-42aa8275ea7mr49659035e9.33.1724083625240; 
 Mon, 19 Aug 2024 09:07:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d780ba5dsm222433555e9.0.2024.08.19.09.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 09:07:04 -0700 (PDT)
Message-ID: <004156e5-8dde-45a7-a291-425486e20696@linaro.org>
Date: Mon, 19 Aug 2024 18:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/9] drm/meson: dw-hdmi: fix incorrect comment in suspend
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-5-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-5-jbrunet@baylibre.com>
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

On 30/07/2024 14:50, Jerome Brunet wrote:
> Comment in suspend says TOP is put in suspend, but the register
> poke following is actually de-asserting the reset, like in init.
> 
> It is doing the opposite of what the comment says.
> 
> Align the comment with what the code is doing for now and add
> a FIXME note to sort this out later
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 2890796f9d49..5cd3264ab874 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -751,7 +751,7 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
>   	if (!meson_dw_hdmi)
>   		return 0;
>   
> -	/* Reset TOP */
> +	/* FIXME: This actually bring top out reset on suspend, why ? */
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>   				       HDMITX_TOP_SW_RESET, 0);
>   

Yes, this is probably useless and should:
meson_dw_hdmi->data->top_write(meson_dw_hdmi,
			       HDMITX_TOP_SW_RESET, 0xffff);

but I think it can be safely removed.

Neil
