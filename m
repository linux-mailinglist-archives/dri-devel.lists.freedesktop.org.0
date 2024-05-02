Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE28B9548
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DC410EFE5;
	Thu,  2 May 2024 07:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QJahz67c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7723510F200
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:28:33 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41b79450f78so44640325e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 00:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714634912; x=1715239712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=EAYVbhkSlUWJPsnQXQt9SynXL0L0vg1XbxE7nTp8ygY=;
 b=QJahz67c8TuIGGgG4ti/KfEHHAMgZ55549N27V+XyyLcZtBwyk+7+vwB3+epceDn5o
 P7vqwJGPQ/5R7qHhlnOdVOj4yE+HO87KYnq0aAw+wL8CCOr8vIK7xlabpjM/sLyqZUnJ
 fcPVUQYFOnrtIKYq5ql20d08T3/9KDv7yKWKNNp0qJNak5ftlxLt0VaGsw2qb7Du97f8
 Ojwm84HlFNW30ahgz/flKIuucuyv3NPwzbIlnYRciq0QsWItgQSd6GBfGZYNipo3qz3N
 QMKVyAqhUrZ5iVHffm9fPL5HnENSzqohitpTubhMVo4nNov1XrIE54ikHOL48fEnWOpN
 aXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714634912; x=1715239712;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EAYVbhkSlUWJPsnQXQt9SynXL0L0vg1XbxE7nTp8ygY=;
 b=EpIzV9ac49EpfourxGl/db9Z1ghb4aqkNIU8xJq5ddNySdA8QGiKg4ubSthqpi8Bx8
 JMmIHDSbrhAs0dtkXDF4U4RKjAiNrcYa3qrAmTznKJUX+W2VwrPftgmffkeL8j/rGxYC
 n/j1Ed52WJKpvrbCM+6QO9UMreW65bvpmO4MCqVQgEF2QFuByYBrkAOiUqkRLTUmIgoM
 +M9q9W0QB9s6su/sRkjzVvNrzrkeyJCdELjUaBon7RuoZ6xHkmEpFWpcT9iJXAeuvzZe
 EUXJi4ejv4HkAqeZWh+ts4mLNYOeNI/wrtta8795dorxUQdmvGGPnoshqMym6eteEK+f
 8dUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDXPboXS+YlGsRNaUdoGmbbSG/NQL5ATwJUoIPsk1bP6vqIDIE1/3h6C2H6CiGBMf7vGfi/XGJZomuhd1x7GPYYsWyyCYqHM0IqYKJBfoe
X-Gm-Message-State: AOJu0YwTRNNhZR/sLg2z4QVVTsqI9qm38GAbTh7g4PXPfjXI/XnjkJ+u
 Tdbui8obZomHgnVMt9oU7GzirBcx5tX/f5jPSAFbP96VHr6uw61OG0VY/SpXB+o=
X-Google-Smtp-Source: AGHT+IFg+7H0QarbP4+qvpL7EnZBUPH5jduwtoAjY9s5Iz2hBR8PhUgiX8N7RaoMmKDPah1ruy4Hcw==
X-Received: by 2002:a5d:674d:0:b0:34e:2363:2c59 with SMTP id
 l13-20020a5d674d000000b0034e23632c59mr804522wrw.26.1714634911513; 
 Thu, 02 May 2024 00:28:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129?
 ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a05600001c300b0034df7313bf1sm557982wrx.0.2024.05.02.00.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:28:31 -0700 (PDT)
Message-ID: <f4fd280f-19c7-46a3-a8bb-2915f6694c3f@linaro.org>
Date: Thu, 2 May 2024 09:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/9] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Brian Norris <briannorris@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj
 <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.5.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
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
In-Reply-To: <20240501084109.v3.5.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
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

On 01/05/2024 17:41, Douglas Anderson wrote:
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
> Right now this patch introduces two new functions in drm_mipi_dsi.c.
> Alternatively we could have changed the prototype of the "chatty"
> functions and made the deprecated macros adapt to the new prototype.
> While this sounds nice, it bloated callers of the deprecated functioin
> a bit because it caused the compiler to emit less optimal code. It
> doesn't seem terrible to add two more functions, so I went that
> way. There may be cases where callers who aren't writing many
> sequences prefer to use the "chatty" versions anyway.
> 
> Changes in v3:
> - Add a TODO item for cleaning up the deprecated macros/functions.
> - Inline kerneldoc comments for struct mipi_dsi_multi_context.
> 
> Changes in v2:
> - New
> 
>   Documentation/gpu/todo.rst     | 18 ++++++++++
>   drivers/gpu/drm/drm_mipi_dsi.c | 56 ++++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     | 62 ++++++++++++++++++++++++++++++++++
>   3 files changed, 136 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index fb9ad120b141..45a59c176b06 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -507,6 +507,24 @@ Contact: Douglas Anderson <dianders@chromium.org>
>   
>   Level: Starter/Intermediate
>   
> +Transition away from using mipi_dsi_*_write_seq()
> +-------------------------------------------------
> +
> +The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
> +non-intuitive because, if there are errors, they return out of the *caller's*
> +function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
> +and mipi_dsi_dcs_write_seq_multi() macros instead.
> +
> +Once all callers are transitioned, the macros and the functions that they call,
> +mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
> +probably be removed. Alternatively, if people feel like the _multi() variants
> +are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
> +variants but change them not to return out of the caller.
> +
> +Contact: Douglas Anderson <dianders@chromium.org>
> +
> +Level: Starter
> +
>   
>   Core refactorings
>   =================
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 8593d9ed5891..d2957cb692d3 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -792,6 +792,34 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
>   }
>   EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
>   
> +/**
> + * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write_chatty() w/ accum_err
> + * @ctx: Context for multiple DSI transactions
> + * @payload: buffer containing the payload
> + * @size: size of payload buffer
> + *
> + * Like mipi_dsi_generic_write_chatty() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
> +				  const void *payload, size_t size)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_generic_write(dsi, payload, size);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending generic data %*ph failed: %d\n",
> +			(int)size, payload, ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
> +
>   /**
>    * mipi_dsi_generic_read() - receive data using a generic read packet
>    * @dsi: DSI peripheral device
> @@ -908,6 +936,34 @@ int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
>   }
>   EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_chatty);
>   
> +/**
> + * mipi_dsi_dcs_write_buffer_multi - mipi_dsi_dcs_write_buffer_chatty() w/ accum_err
> + * @ctx: Context for multiple DSI transactions
> + * @data: buffer containing data to be transmitted
> + * @len: size of transmission buffer
> + *
> + * Like mipi_dsi_dcs_write_buffer_chatty() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
> +				     const void *data, size_t len)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending dcs data %*ph failed: %d\n",
> +			(int)len, data, ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_multi);
> +
>   /**
>    * mipi_dsi_dcs_write() - send DCS write command
>    * @dsi: DSI peripheral device
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 6d68d9927f46..5e9cad541bd6 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -197,6 +197,27 @@ struct mipi_dsi_device {
>   	struct drm_dsc_config *dsc;
>   };
>   
> +/**
> + * struct mipi_dsi_multi_context - Context to call multiple MIPI DSI funcs in a row
> + */
> +struct mipi_dsi_multi_context {
> +	/**
> +	 * @dsi: Pointer to the MIPI DSI device
> +	 */
> +	struct mipi_dsi_device *dsi;
> +
> +	/**
> +	 * @accum_err: Storage for the accumulated error over the multiple calls
> +	 *
> +	 * Init to 0. If a function encounters an error then the error code
> +	 * will be stored here. If you call a function and this points to a
> +	 * non-zero value then the function will be a noop. This allows calling
> +	 * a function many times in a row and just checking the error at the
> +	 * end to see if any of them failed.
> +	 */
> +	int accum_err;
> +};
> +
>   #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
>   
>   #define to_mipi_dsi_device(__dev)	container_of_const(__dev, struct mipi_dsi_device, dev)
> @@ -258,6 +279,8 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>   			       size_t size);
>   int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
>   				  const void *payload, size_t size);
> +void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
> +				  const void *payload, size_t size);
>   ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>   			      size_t num_params, void *data, size_t size);
>   
> @@ -283,6 +306,8 @@ ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
>   				  const void *data, size_t len);
>   int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
>   				     const void *data, size_t len);
> +void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
> +				     const void *data, size_t len);
>   ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
>   			   const void *data, size_t len);
>   ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
> @@ -319,6 +344,9 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>    * This macro will print errors for you and will RETURN FROM THE CALLING
>    * FUNCTION (yes this is non-intuitive) upon error.
>    *
> + * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
> + * Please replace calls of it with mipi_dsi_generic_write_seq_multi().
> + *
>    * @dsi: DSI peripheral device
>    * @seq: buffer containing the payload
>    */
> @@ -331,12 +359,30 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>   			return ret;                                            \
>   	} while (0)
>   
> +/**
> + * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
> + *
> + * This macro will print errors for you and error handling is optimized for
> + * callers that call this multiple times in a row.
> + *
> + * @ctx: Context for multiple DSI transactions
> + * @seq: buffer containing the payload
> + */
> +#define mipi_dsi_generic_write_seq_multi(ctx, seq...)                \
> +	do {                                                         \
> +		static const u8 d[] = { seq };                       \
> +		mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
> +	} while (0)
> +
>   /**
>    * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
>    *
>    * This macro will print errors for you and will RETURN FROM THE CALLING
>    * FUNCTION (yes this is non-intuitive) upon error.
>    *
> + * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
> + * Please replace calls of it with mipi_dsi_dcs_write_seq_multi().
> + *
>    * @dsi: DSI peripheral device
>    * @cmd: Command
>    * @seq: buffer containing data to be transmitted
> @@ -350,6 +396,22 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>   			return ret;                                            \
>   	} while (0)
>   
> +/**
> + * mipi_dsi_dcs_write_seq_multi - transmit a DCS command with payload
> + *
> + * This macro will print errors for you and error handling is optimized for
> + * callers that call this multiple times in a row.
> + *
> + * @ctx: Context for multiple DSI transactions
> + * @cmd: Command
> + * @seq: buffer containing data to be transmitted
> + */
> +#define mipi_dsi_dcs_write_seq_multi(ctx, cmd, seq...)                  \
> +	do {                                                            \
> +		static const u8 d[] = { cmd, seq };                     \
> +		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
> +	} while (0)
> +
>   /**
>    * struct mipi_dsi_driver - DSI driver
>    * @driver: device driver model driver

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
