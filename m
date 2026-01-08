Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A617D0452A
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 17:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D49C10E7A8;
	Thu,  8 Jan 2026 16:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QVpYc5L3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196B210E36C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 16:24:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso16313895e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767889447; x=1768494247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Xj3aIiaT0bH4pSRmSIPmDloBNbQZF2Z2t+m5n9HJxGY=;
 b=QVpYc5L3CTgmxj7EVOoqbNcNDkb4gXYeF6Y1Cm7g8Poy3J8pI8eN9TLPZS+QmIJ4Uc
 VmbtJ0/p/KhXLUJCpsm0RK5aCYDx8q3L3Z6X9R4q4kzvyrmm+sfoI2Id0ZfMa121qg+C
 eakXpejieiGjQm2LZgrhYnB/uvwuoDQTVKlt4xjwMM48y1pWhgzmUEO+LJX1r7u/RdY2
 FhT9I01caGHtBet8rFQszc0h00D/TNQdnnc2kppy7j8/qld32pW2CxEpCAizVzvgyG4Y
 3DTXox7N+HnAoTBnRL2vqeRqpdLyJ5CAaJnu683BBhzOgMexE1T7qaZPsIKOEJ9wiWQy
 Ww7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767889447; x=1768494247;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xj3aIiaT0bH4pSRmSIPmDloBNbQZF2Z2t+m5n9HJxGY=;
 b=aLqQblXPLfv/cyHycGpk48+O8ykXqd2OO9nGnAj4V/WwEU+e13wiq0JlgkzfvWMkwH
 yyTR2ezhgcPUXWu2HTKJWudGRRpf5x0LKRn//Dw/h4AOi4JLPx/6seXMoKzvO9YcbOVb
 +PrKhhI/4Lv2zzx8pK3XgPZGkucTv+Y3yT3u1/u3ne4k9cP8HBjTqTh3md181JK+yhJh
 u9EBKH5Fla9QjkgnqG4Y5jGCnQ6pG9jFVWrv9a43BPq00G2XPfjcvPGR1ey0pOKTuqpq
 fZ0U3qXTYdaA90u5EXs8d3Miai6D76ZLfosG8GybL7F3VUObwh4LPa0QblXKMqlZofua
 GDCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA+0f3dXO/GsUQOZgSxJhXfPLYqTuZFeiWaKGaWAarzV4aTkNN6TugOKB75jshN+9pM3ssS2CAdkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYPQGq6aqbGBmQubbWa44lOAZjBfw8oOJHtQ7kF3hyMTVz9l8e
 Sr1jSNHNX0JUy1Kt/KUp2W4BgQBm+R1Ju0lLqQlEaSCVNdVKJUbnavIpbTViP/D9cBYTAXF2TJn
 7z0vhiUQ=
X-Gm-Gg: AY/fxX6QLaK8g+U155Nfwzq0WT1wyaiv+CBCYR/8sepivI60wgETWFNcsZRSxYwHjs0
 WOW2nT6XQwj8rp1kuXE+jjceDcKrwRrsh4r2K9u6mk5gdVEx+ZhblyvruFsVMRxX+GlqMShmY1n
 Wmi8dBQNXncxrNp0pIBVPXhTq3y3y6vp2I5huldqxb/2ZuJH+YtT9nwe1ZResr2GYXd+TwKDK0k
 WajGRwC7KwGTsaN5mPdh0dwKj/GSDO9yxKrMC0i3Pb0pdmtiVtWAsVkvJGP4w/0aUEPGjmYA/r1
 l74ylL2VU/VaJJGxeNs3puzE4x9yyvihqZJf58AtxSyRECpqAPGaa+hkxi7sS1qHTQ1GH6KcZFD
 1KLfz1RRM780lu6SUFEjDNceYdbwXEaw64X8zaArWjMZcwyxi0mMVh9aKr0g6JQZFKfePP22Wqm
 UwDTM58hSzhmUwOM3RhmE9CgBTIpsUzmh3tRx1YJKciwZVZEB/uQftT+czk+L7ytM=
X-Google-Smtp-Source: AGHT+IFtkr+pOe+dymcdTTnpe2tek3vHKNG63sW1D+pxy/ROjygFfnUCBjyfiTcNGWCt+yUnplxx4w==
X-Received: by 2002:a05:600c:468e:b0:477:a1a2:d829 with SMTP id
 5b1f17b1804b1-47d84b1862cmr87476145e9.13.1767889447411; 
 Thu, 08 Jan 2026 08:24:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2cb0:c864:18bd:9835?
 ([2a01:e0a:3d9:2080:2cb0:c864:18bd:9835])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f69e802sm164071575e9.8.2026.01.08.08.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 08:24:06 -0800 (PST)
Message-ID: <276fa41c-d575-419d-ae29-ad2acbe7f024@linaro.org>
Date: Thu, 8 Jan 2026 17:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/mipi-dsi: add mipi_dsi_shutdown_peripheral_multi
To: Avinal Kumar <avinal.xlvii@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20260106112302.204635-1-avinal.xlvii@gmail.com>
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
In-Reply-To: <20260106112302.204635-1-avinal.xlvii@gmail.com>
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

On 1/6/26 12:21, Avinal Kumar wrote:
> Add mipi_dsi_shutdown_peripheral_multi function and mark
> mipi_dsi_shutdown_peripheral function as deprecated.
> 
> Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
> ---
> Please refer: https://patchwork.kernel.org/project/dri-devel/patch/20251127161337.396531-1-avinal.xlvii@gmail.com/#26719778
> Build and boot tested with QEMU.
> 
>   drivers/gpu/drm/drm_mipi_dsi.c | 28 ++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     |  1 +
>   2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index a712e177b350..2fed50172a44 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -587,6 +587,9 @@ EXPORT_SYMBOL(mipi_dsi_create_packet);
>    * mipi_dsi_shutdown_peripheral() - sends a Shutdown Peripheral command
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_shutdown_peripheral_multi()
> + * instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi)
> @@ -1980,6 +1983,31 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
>   }
>   EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline_multi);
> 
> +/**
> + * mipi_dsi_shutdown_peripheral_multi() - sends a Shutdown Peripheral command
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_shutdown_peripheral() but deals with errors in a way that
> + * makes it convienient to make seeral calls in a row.
> + */
> +void mipi_dsi_shutdown_peripheral_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_shutdown_peripheral(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "Failed to shutdown peripheral: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_shutdown_peripheral_multi);
> +
>   static int mipi_dsi_drv_probe(struct device *dev)
>   {
>   	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 3aba7b380c8d..19ccdf5eeb5f 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -389,6 +389,7 @@ void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
>   void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
>   					  u16 scanline);
>   void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_shutdown_peripheral_multi(struct mipi_dsi_multi_context *ctx);
> 
>   /**
>    * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
> --
> 2.52.0
> 


Looks good, please send a multi-patch patchset with "drm/panel: panasonic-vvx10f034n00: transition to mipi_dsi wrapped functions"
updated to use this function aswell.

If you want to use a simpler way to generate patchsets, please have a look the b4 tool.

Neil
