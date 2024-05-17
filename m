Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DE08C8CD2
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 21:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FEC10EF40;
	Fri, 17 May 2024 19:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RewCqHYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79ED010EF40
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 19:33:07 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4202c0d316cso2781045e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715974386; x=1716579186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qx9oqw+ESbGoA6vHtqUKa4WfgYEJa+GoRcFRZdtN/8E=;
 b=RewCqHYbQc81HACIQFX0cPcOKrfNhZq6rpkiftHnjQwFduniDcS25XoURYz+FoB7VW
 99U3rqplKeC1dhLEDcniHEpb5uoMnjytcQuOw/WhCvMu/YZOLKYirZtpvzNZHidEWXMh
 p2RUUzMYyS7qHOWFPJmZoZHJByW+NLd7cSi4qE2OozgcnCf1D+pyqa6cwml+Yn6iudip
 jed/Fl2B7SXHAtly54QEhjufu1fz3YiQS+/tjcUf2vNQYGJ985C8G703mkgd7MBQXUIy
 T6iXLvx42tAZd1EJR4oyvjZnTcKtIDrG0gNr7YzdM3d+32496G8JYMR0kUBcaIfisQX8
 WY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715974386; x=1716579186;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qx9oqw+ESbGoA6vHtqUKa4WfgYEJa+GoRcFRZdtN/8E=;
 b=kZ/C0fSUTiskXVJ7M49Ov7sy9oF9RFU3uSfhnWrr3ZXjo/0U2cMgqRt3AqukNIQFN2
 IrZ5lqiGJUa0Nfd0KM4Jrod6aeytstX4Ov14fhBN6upw66myJCPybHYwc4KF9mDacYuL
 ZIpuLE7HqpKzyRuipUdgQ5n5jR/i2+r76uCN2Zu0BmWzOO7pBKFB0yDgYe88Hvdb4lJB
 WGX2J+2OJKtJ+tU8u+wsRErvBcMuMiT88Jcxk8oNSL/LKDO1PM+yVTwdMaGUIRoakCNB
 kKgV/jtBrklkrx3EeDYMJ6zxrsyfv/iaIRbMX8EjK2CKfAAs5qUb/bHIa+HZEDpsy3cK
 NlaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe/tPkWcURyXWjpwmRJVi8oTyWZkcypOexkP/iuEWci9QbTsq7cTtqqAJw6tjGRDpoQDgUbnbKNTYmVRpIpPX0Y/JYBbKrbf3uWw+HgZex
X-Gm-Message-State: AOJu0YzPu9SjNcgVRTdk5HRMNFnEiWrB+StW3m/8fNXPPNbGDN2duwbU
 +H6F3CpMyFph/ltGk0VwZZM4A+XwJWJL2eKUTccxcY97j99/PazQ6xrg68bq/Dk=
X-Google-Smtp-Source: AGHT+IH3XOyrvOaqm2UgmcUHPEYa2ystVK+VzS2iFwnNn/p2+CdetnMsVzXnl5ZBxioNFGf0wPRwAA==
X-Received: by 2002:adf:f591:0:b0:351:d76a:5e63 with SMTP id
 ffacd0b85a97d-354b8e00a9fmr61383f8f.10.1715974385362; 
 Fri, 17 May 2024 12:33:05 -0700 (PDT)
Received: from [172.33.81.195] (18.pool62-36-37.static.orange.es.
 [62.36.37.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a34sm22203418f8f.35.2024.05.17.12.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 12:33:04 -0700 (PDT)
Message-ID: <63ebc7ab-b7b4-4814-95b1-d45fc9818184@linaro.org>
Date: Fri, 17 May 2024 21:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] drm/mipi-dsi: wrap more functions for streamline
 handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul <vkoul@kernel.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
 <20240512-dsi-panels-upd-api-v2-2-e31ca14d102e@linaro.org>
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
In-Reply-To: <20240512-dsi-panels-upd-api-v2-2-e31ca14d102e@linaro.org>
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

On 12/05/2024 01:00, Dmitry Baryshkov wrote:
> Follow the pattern of mipi_dsi_dcs_*_multi() and wrap several existing
> MIPI DSI functions to use the context for processing. This simplifies
> and streamlines driver code to use simpler code pattern.
> 
> Note, msleep function is also wrapped in this way as it is frequently
> called inbetween other mipi_dsi_dcs_*() functions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 210 +++++++++++++++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     |  21 +++++
>   2 files changed, 231 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index d2957cb692d3..8721edd06c06 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -1429,6 +1429,216 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>   }
>   EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness_large);
>   
> +/**
> + * mipi_dsi_picture_parameter_set_multi() - transmit the DSC PPS to the peripheral
> + * @ctx: Context for multiple DSI transactions
> + * @pps: VESA DSC 1.1 Picture Parameter Set
> + *
> + * Like mipi_dsi_picture_parameter_set() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
> +				   const struct drm_dsc_picture_parameter_set *pps)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_picture_parameter_set(dsi, pps);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending PPS failed: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_picture_parameter_set_multi);
> +
> +/**
> + * mipi_dsi_compression_mode_ext_multi() - enable/disable DSC on the peripheral
> + * @ctx: Context for multiple DSI transactions
> + * @enable: Whether to enable or disable the DSC
> + * @algo: Selected compression algorithm
> + * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
> + *
> + * Like mipi_dsi_compression_mode_ext() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
> +					 bool enable,
> +					 enum mipi_dsi_compression_algo algo,
> +					 unsigned int pps_selector)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_compression_mode_ext(dsi, enable, algo, pps_selector);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending COMPRESSION_MODE failed: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
> +
> +/**
> + * mipi_dsi_dcs_nop_multi() - send DCS NOP packet
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_dcs_nop() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_nop(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending DCS NOP failed: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_nop_multi);
> +
> +/**
> + * mipi_dsi_dcs_enter_sleep_mode_multi() - send DCS ENTER_SLEEP_MODE  packet
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_dcs_enter_sleep_mode() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending DCS ENTER_SLEEP_MODE failed: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_enter_sleep_mode_multi);
> +
> +/**
> + * mipi_dsi_dcs_exit_sleep_mode_multi() - send DCS EXIT_SLEEP_MODE packet
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_dcs_exit_sleep_mode() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending DCS EXIT_SLEEP_MODE failed: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_exit_sleep_mode_multi);
> +
> +/**
> + * mipi_dsi_dcs_set_display_off_multi() - send DCS SET_DISPLAY_OFF packet
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_dcs_set_display_off() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending DCS SET_DISPLAY_OFF failed: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_set_display_off_multi);
> +
> +/**
> + * mipi_dsi_dcs_set_display_on_multi() - send DCS SET_DISPLAY_ON packet
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_dcs_set_display_on() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending DCS SET_DISPLAY_ON failed: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_set_display_on_multi);
> +
> +/**
> + * mipi_dsi_dcs_set_tear_on_multi() - send DCS SET_TEAR_ON packet
> + * @ctx: Context for multiple DSI transactions
> + * @mode: the Tearing Effect Output Line mode
> + *
> + * Like mipi_dsi_dcs_set_tear_on() but deals with errors in a way that
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
> +				    enum mipi_dsi_dcs_tear_mode mode)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_dcs_set_tear_on(dsi, mode);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "sending DCS SET_TEAR_ON failed: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
> +
>   static int mipi_dsi_drv_probe(struct device *dev)
>   {
>   	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 5e9cad541bd6..bd5a0b6d0711 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -275,6 +275,13 @@ int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
>   int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
>   				   const struct drm_dsc_picture_parameter_set *pps);
>   
> +void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
> +					 bool enable,
> +					 enum mipi_dsi_compression_algo algo,
> +					 unsigned int pps_selector);
> +void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
> +					  const struct drm_dsc_picture_parameter_set *pps);
> +
>   ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>   			       size_t size);
>   int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
> @@ -284,6 +291,12 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
>   ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>   			      size_t num_params, void *data, size_t size);
>   
> +#define mipi_dsi_msleep(ctx, delay)	\
> +	do {				\
> +		if (!ctx.accum_err)	\
> +			msleep(delay);	\
> +	} while (0)
> +
>   /**
>    * enum mipi_dsi_dcs_tear_mode - Tearing Effect Output Line mode
>    * @MIPI_DSI_DCS_TEAR_MODE_VBLANK: the TE output line consists of V-Blanking
> @@ -338,6 +351,14 @@ int mipi_dsi_dcs_set_display_brightness_large(struct mipi_dsi_device *dsi,
>   int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>   					     u16 *brightness);
>   
> +void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
> +				    enum mipi_dsi_dcs_tear_mode mode);
> +
>   /**
>    * mipi_dsi_generic_write_seq - transmit data using a generic write packet
>    *
> 

The mipi_dsi_msleep() seems a little bit over-enginerred for me, but it serves
the purpose so:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
