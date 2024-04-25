Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B793A8B1C47
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C178B11A253;
	Thu, 25 Apr 2024 07:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iv+a/A8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6234811A255
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:55:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so5676965e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 00:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714031714; x=1714636514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9gzHFo+ZVHj886+TN1PTtTcZZeGCWMQE2qidNssQocQ=;
 b=iv+a/A8lW4Gt3Xl0z2oTo392W2fQJwX3B9tkX6ueTjJVlzRz771ryXjUyU2sMxf8fl
 FjnuuG1mr48L/f43hn36N8psYcT7+rC6gz2jkEyjsS9GkaefOtbEYXWKsTOTkg/tglmq
 NdzyY53+GqE3snxgIFxk7RYmJ3dKuYgV0gEGlxBjbA1Tw821v6DHJpkYoDkZaNxBBpsQ
 r26Yd6H4hqc74gpSAlldPPjVJFLgAnmi1D2p0vJ3xNXbUyOD5Of9M0TZ/YCDYsCDnYME
 XeXHJdCnnH07dAZGATbT7Qt+v4XxgCp1KUzgogs4chdCpiIbN8CQS43sNqtCPdtwI103
 Qi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714031714; x=1714636514;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9gzHFo+ZVHj886+TN1PTtTcZZeGCWMQE2qidNssQocQ=;
 b=YHVfwCwZLsZoehrDnXMgZvWnIFtEaSboRZzD1YHBZWsMETgqMC1IWqNf1X8OQgIif3
 w5qDzP0wvcqtJfJpTVa8SwRoUmvv7/Wbo2WUNYe4MwYQKKjqQqyLyPvuKUCCvpTXnSEm
 KA9It2P8GCdSaPo0Jikizw+u/PIip90aHwcemOINkFTWUwpxaiqkwp98J7VoyPtU8Qh4
 1pHGSACNOhmPOH4mRCuMiRe603ybKEAYOurBejt4vjn0IyYwqEl0lIOylxSAkSEeoP89
 89wosi18/G2seOxJMacghvWP5n0AQlRsSH82Wl5oVLea6XIE5rC9FBu0fT0Z0qU7ugEe
 PCCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlHNteSNMIqSuxPvfrV9I2gBdHTvzq2/BFi+mncZp/GianW1nHeCBOEOG3Cx1bpNQ0onB5UhvW569fMyvmikfc2fP9MCvGbfazuxtDIUem
X-Gm-Message-State: AOJu0YwZe9BBj3Skk4Myvb+bBTBDmXy5q2IDsjwNJS4Mp5INmd7m9RTo
 iyjuUlr7wRVNOZQfX3j9ZAxwW/XKxQrK4Lmh8FqQr777fv/WbJVFLSOOceYiE3Q=
X-Google-Smtp-Source: AGHT+IEPCBod4hEdYtHuPJ8xARgVziqMxN6jilsih9qLqB38Gkx/8Q+QCKG8slRe0IQKFjxMrWFgug==
X-Received: by 2002:a05:600c:19ce:b0:417:fbc2:caf8 with SMTP id
 u14-20020a05600c19ce00b00417fbc2caf8mr3644192wmq.23.1714031713281; 
 Thu, 25 Apr 2024 00:55:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62?
 ([2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b00418a386c17bsm30281607wmq.12.2024.04.25.00.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 00:55:12 -0700 (PDT)
Message-ID: <300eab2e-f884-4978-9f19-b764bb5fb47a@linaro.org>
Date: Thu, 25 Apr 2024 09:55:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linus.walleij@linaro.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 lvzhaoxiong@huaqin.corp-partner.google.com, Hsin-Yi Wang
 <hsinyi@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
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
In-Reply-To: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
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

On 25/04/2024 02:20, Douglas Anderson wrote:
> The consensus of many DRM folks is that we want to move away from DSI
> drivers defining tables of init commands. Instead, we want to move to
> init functions that can use common DRM functions. The issue thus far
> has been that using the macros mipi_dsi_generic_write_seq() and
> mipi_dsi_dcs_write_seq() bloats the driver using them.
> 
> Through a cooperative effort between Hsin-Yi Wang and Dmitry
> Baryshkov, we have realized that the majority of the bloat is the fact
> that we have the dev_err_ratelimited() directly in the macros. Let's
> hoist this call into drm_mipi_dsi.c by adding a "chatty" version of
> the functions that includes the print.
> 
> Without any changes to clients this gives a dramatic savings. Building
> with my build system shows one example:
> 
> $ scripts/bloat-o-meter \
>    .../before/panel-novatek-nt36672e.ko \
>    .../after/panel-novatek-nt36672e.ko
> 
> add/remove: 0/1 grow/shrink: 1/1 up/down: 6/-19652 (-19646)
> Function                                     old     new   delta
> __UNIQUE_ID_vermagic520                       64      70      +6
> nt36672e_1080x2408_60hz_init               16592    7260   -9332
> nt36672e_1080x2408_60hz_init._rs           10320       -  -10320
> Total: Before=31503, After=11857, chg -62.36%
> 
> Note that given the change in location of the print it's harder to
> include the "cmd" in the printout for mipi_dsi_dcs_write_seq() since,
> theoretically, someone could call the new chatty function with a
> zero-size array and it would be illegal to dereference data[0].
> There's a printk format to print the whole buffer and this is probably
> more useful for debugging anyway. Given that we're doing this for
> mipi_dsi_dcs_write_seq(), let's also print the buffer for
> mipi_dsi_generic_write_seq() in the error case.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> The MIPI device I have in front of me (wormdingler) hasn't been
> converted to use these functions yet, so this is just compile
> tested. It's about my end of day so I'm sending this out since it's
> pretty straightforward. Hopefully others can confirm it works well for
> them and also saves space under their compilers.
> 
>   drivers/gpu/drm/drm_mipi_dsi.c | 54 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     | 31 ++++++++-----------
>   2 files changed, 67 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 795001bb7ff1..5ded6aef38ed 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -764,6 +764,33 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>   }
>   EXPORT_SYMBOL(mipi_dsi_generic_write);
>   
> +/**
> + * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
> + * @dsi: DSI peripheral device
> + * @payload: buffer containing the payload
> + * @size: size of payload buffer
> + *
> + * Just like mipi_dsi_generic_write() but includes a dev_err_ratelimited()
> + * call for you.
> + *
> + * Return: The number of bytes transmitted on success or a negative error code
> + * on failure.
> + */
> +ssize_t mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
> +				      const void *payload, size_t size)
> +{
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_generic_write(dsi, payload, size);
> +	if (ret < 0)
> +		dev_err_ratelimited(dev, "sending generic data %*ph failed: %d\n",
> +				    (int)size, payload, ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
> +
>   /**
>    * mipi_dsi_generic_read() - receive data using a generic read packet
>    * @dsi: DSI peripheral device
> @@ -852,6 +879,33 @@ ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
>   }
>   EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer);
>   
> +/**
> + * mipi_dsi_dcs_write_buffer_chatty - mipi_dsi_dcs_write_buffer() w/ an error log
> + * @dsi: DSI peripheral device
> + * @data: buffer containing data to be transmitted
> + * @len: size of transmission buffer
> + *
> + * Just like mipi_dsi_dcs_write_buffer() but includes a dev_err_ratelimited()
> + * call for you.
> + *
> + * Return: The number of bytes successfully transmitted or a negative error
> + * code on failure.
> + */
> +ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
> +					 const void *data, size_t len)
> +{
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
> +	if (ret < 0)
> +		dev_err_ratelimited(dev, "sending dcs data %*ph failed: %d\n",
> +				    (int)len, data, ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_chatty);
> +
>   /**
>    * mipi_dsi_dcs_write() - send DCS write command
>    * @dsi: DSI peripheral device
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 82b1cc434ea3..784e425dc4c8 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -256,6 +256,8 @@ int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
>   
>   ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>   			       size_t size);
> +ssize_t mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
> +				      const void *payload, size_t size);
>   ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>   			      size_t num_params, void *data, size_t size);
>   
> @@ -279,6 +281,8 @@ enum mipi_dsi_dcs_tear_mode {
>   
>   ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
>   				  const void *data, size_t len);
> +ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
> +					 const void *data, size_t len);
>   ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
>   			   const void *data, size_t len);
>   ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
> @@ -317,14 +321,10 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>   #define mipi_dsi_generic_write_seq(dsi, seq...)                                \
>   	do {                                                                   \
>   		static const u8 d[] = { seq };                                 \
> -		struct device *dev = &dsi->dev;                                \
>   		int ret;                                                       \
> -		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
> -		if (ret < 0) {                                                 \
> -			dev_err_ratelimited(dev, "transmit data failed: %d\n", \
> -					    ret);                              \
> +		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
> +		if (ret < 0)                                                   \
>   			return ret;                                            \
> -		}                                                              \
>   	} while (0)
>   
>   /**
> @@ -333,18 +333,13 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>    * @cmd: Command
>    * @seq: buffer containing data to be transmitted
>    */
> -#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
> -	do {                                                               \
> -		static const u8 d[] = { cmd, seq };                        \
> -		struct device *dev = &dsi->dev;                            \
> -		int ret;                                                   \
> -		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
> -		if (ret < 0) {                                             \
> -			dev_err_ratelimited(                               \
> -				dev, "sending command %#02x failed: %d\n", \
> -				cmd, ret);                                 \
> -			return ret;                                        \
> -		}                                                          \
> +#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                               \
> +	do {                                                                   \
> +		static const u8 d[] = { cmd, seq };                            \
> +		int ret;                                                       \
> +		ret = mipi_dsi_dcs_write_buffer_chatty(dsi, d, ARRAY_SIZE(d)); \
> +		if (ret < 0)                                                   \
> +			return ret;                                            \
>   	} while (0)
>   
>   /**

At first sight it looks o for me, it's less efficient since it adds a function call
for each sequence, but the saving if very significant.

I'll run a test on the vtdr6130 to be sure.

Neil
