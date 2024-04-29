Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7638B545A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 11:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B957910E3DC;
	Mon, 29 Apr 2024 09:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AXKVbFuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5740C10E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 09:38:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41c7ac6f635so823705e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714383486; x=1714988286; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=A+LnRlsICvGEFiJqDwaAff8ODI9d9U18e2E6oVjJp+M=;
 b=AXKVbFuwttfQEPdlenmwcmPVY/53o7gr0LzA7WdAjg8HPuCBzkhiu0vmkwbDaGZJka
 3CChPEnLHKkGKMQBneN+CwjLx2+hDNuLtkBQxmjCsyS22Xl//7wFQnoYcBd3nH1ulODE
 Ldk5xhu749SoieE0/CEQrkVTbFTIx/jRmn8PTkZrvm3tGr5iUUU7UoksPsVbya8IP1dt
 bOegGFq74T3B46K3lp4KoU4cUvzNocob7wtiFiBv8W2htAkmsjUtUy/65GJR3jP7CMRr
 UH60z0Gc/Rz8/1xH9OUYr9oEuEnJEL6+XP5fOK6Q+IdKOOvDOdS38I46VECXr34/3cEa
 SpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714383486; x=1714988286;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=A+LnRlsICvGEFiJqDwaAff8ODI9d9U18e2E6oVjJp+M=;
 b=paZKIhD5V91oZNeejTohxXetCdTECznc0CozikMgWRxum81WlLVJZ82PzOIYCMVxS8
 fbhKELiG4M4EBTMIf747CCDC7eMOP4ECgbcPevGRTwM5eEwxRsQSYKAJsJc83novczFR
 5TqdIYEuWpW39XKr4POghhEb9SCdiH1GZ7XrB7EbUGPUUsWiTO7EACDauepni4LcM1md
 yy0ctGT9zjicR2t4MIh1ILMRymWl57Q8N+iEA4EOZ8HuMDA1tz5q28TCCB4RuYcZjGPT
 9/lUbZuOlJF4xpGvp/3x3wBo46X5CEf6ZG7idiOgJnB3cpN6s1VcY44VCiKrh7sXs38R
 WnXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2epfw4ZRgLg0GHkK38XAXeo3ca5sq0s1dEZKDgKlNyYm5Hy1JAK5ZIKmeZ2kuLYAKcqryPa8wsKl7o3HwWbuP55WeyhHmzlTn86I4cjnd
X-Gm-Message-State: AOJu0Yy4U3zZL+9CwmaVJj36wNQLyvvFOtIyEFwBNnmzHWMaBgePTr/f
 LH4D0P/CiLO3wT7tk/YHk2tr7uZuiGYxfgHEMNCG40aQAFRV0ABAs1UmrUpbAYw=
X-Google-Smtp-Source: AGHT+IF4glwX/gOVNwy5kk//cdVouWrqxBeBlGjgMfsH0PaEMwuHOiWu8jeqIKtAZwy8kuUkkxiUtg==
X-Received: by 2002:a5d:59a8:0:b0:34c:ceee:b2f5 with SMTP id
 p8-20020a5d59a8000000b0034cceeeb2f5mr4652539wrr.67.1714383486530; 
 Mon, 29 Apr 2024 02:38:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d72:4b40:65fa:89e6?
 ([2a01:e0a:cad:2140:d72:4b40:65fa:89e6])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adffec4000000b00347f6b5bb6dsm28923908wrs.30.2024.04.29.02.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 02:38:06 -0700 (PDT)
Message-ID: <2af446d3-7834-4a6b-897b-b14c6bccff65@linaro.org>
Date: Mon, 29 Apr 2024 11:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/8] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj
 <jo@jsfamily.in>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
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
In-Reply-To: <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
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

Hello Mister Anderson,

On 27/04/2024 01:58, Douglas Anderson wrote:
> The current mipi_dsi_*_write_seq() macros are non-intutitive because
> they contain a hidden "return" statement that will return out of the
> _caller_ of the macro. Let's mark them as deprecated and instead
> introduce some new macros that are more intuitive.
> 
> These new macros are less optimal when an error occurs but should
> behave more optimally when there is no error. Specifically these new
> macros cause smaller code to get generated and the code size savings
> (less to fetch from RAM, less cache space used, less RAM used) are
> important. Since the error case isn't something we need to optimize
> for and these new macros are easier to understand and more flexible,
> they should be used.
> 
> After converting to use these new functions, one example shows some
> nice savings while also being easier to understand.
> 
> $ scripts/bloat-o-meter \
>    ...after/panel-novatek-nt36672e.ko \
>    ...ctx/panel-novatek-nt36672e.ko
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-988 (-988)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init                6236    5248    -988
> Total: Before=10651, After=9663, chg -9.28%
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Right now this patch introduces two new functions in
> drm_mipi_dsi.c. Alternatively we could have changed the prototype of
> the "chatty" functions and made the deprecated macros adapt to the new
> prototype. While this sounds nice, it bloated callers of the
> deprecated functioin a bit because it caused the compiler to emit less
> optimal code. It doesn't seem terrible to add two more functions, so I
> went that way.
> 
> Changes in v2:
> - New
> 
>   drivers/gpu/drm/drm_mipi_dsi.c | 56 +++++++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     | 57 ++++++++++++++++++++++++++++++++++
>   2 files changed, 113 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 1e062eda3b88..b7c75a4396e6 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -792,6 +792,34 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
>   }
>   EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
>   

<snip>

>   };
>   
> +/**
> + * struct mipi_dsi_multi_context - Context to call multiple MIPI DSI funcs in a row
> + * @dsi: Pointer to the MIPI DSI device
> + * @accum_err: Storage for the accumulated error over the multiple calls. Init
> + *	to 0. If a function encounters an error then the error code will be
> + *	stored here. If you call a function and this points to a non-zero
> + *	value then the function will be a noop. This allows calling a function
> + *	many times in a row and just checking the error at the end to see if
> + *	any of them failed.
> + */
> +
> +struct mipi_dsi_multi_context {
> +	struct mipi_dsi_device *dsi;
> +	int accum_err;
> +};

I like the design, but having a context struct seems over-engineered while we could pass
a single int over without encapsulating it with mipi_dsi_multi_context.

void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
				     const void *data, size_t len);
vs
void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_device *dsi, int *accum_err,
				     const void *data, size_t len);

is the same, and it avoids having to declare a mipi_dsi_multi_context and set ctx->dsi,
and I'll find it much easier to migrate, just add a &ret and make sure ret is initialized to 0.


<snip>

