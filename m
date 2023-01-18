Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F76F67181C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6C910E6CE;
	Wed, 18 Jan 2023 09:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854248902A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 09:45:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso1083556wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lrUX/Kg3NoRa31wbbje+S4lImexuDVGCZWRb0tomIAI=;
 b=WaxyMTsW9kQE/WMVU5QzULSg1HN1MRAKgs7H+p7OxdWLUnVeFKFlLxyFECHcGSSI8c
 7hDI5QRqG0YTCodSKm8TNbpLwPmrAfQls3J55zYi0PA+v/1rl6JprxkeeDo+Q+xImLTy
 ZNBkn8UZXqt/DpvunTAh7eIOC0ArdAPSotFC2xRbG5eTk9/4Sm/hS0vLzxYZK2LQynT6
 V8L2VOq1Ao8oHChHiMv4IGvjY0OoOnJSh3iGhFpwIUQ7ZpkAibyjl6CR3YkXaBvlDp1H
 cZxEw27IbEvJHtHu6ukQAnoJHDy1evACP4xC5H8G2h9JU8lf7a1lNux2mqh15y3ueXFr
 Y0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrUX/Kg3NoRa31wbbje+S4lImexuDVGCZWRb0tomIAI=;
 b=jYrRavnWRWMy4Tlz9zckXfNrV548AV8/1tM6ML7k3mVCx3xMV//6jk+NuSYUf1iEkK
 CKYYrW1b1HQ3vQ2jR02qtQPKLKpfi/SuDmeJtgYM0telV68hq8zRGwNmExi5yEXztFOn
 0aC7VHs0qwv+esqQvM9VeVs08+bFRDKOnB/HMyrkmGYSuEtmID6NGV4EMVGjh/KQD/N1
 Mv5PJxjFs3HdL4F83d+Ji2SQfkr7plbN0XWBKMsn5RGOWrEkBmYhfBcpQFydO7Xc4b6u
 fZVtP5tGE7S5MHsLDEppSYDUqXHyDYzo06x/TX2eCTTZduK06tuBRyBr/BImolntrKCQ
 Rh4g==
X-Gm-Message-State: AFqh2koIJjhZ/ArXDhuHDEv40wOaDK7AuvtUxDMCsPaCZQkaHq5cvGeH
 eL6uR5041bzd9HME3WOA84WzGg==
X-Google-Smtp-Source: AMrXdXuWFjI8jqgfiykpXK3AM90rahR3UE8WbZL6P/U1COVUVPK9V9pmUN6kxKHbBHvv+VlJlHxMwg==
X-Received: by 2002:a05:600c:3b07:b0:3d9:c6f5:c643 with SMTP id
 m7-20020a05600c3b0700b003d9c6f5c643mr6046833wms.29.1674035127968; 
 Wed, 18 Jan 2023 01:45:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:37dc:5071:959c:93e4?
 ([2a01:e0a:982:cbb0:37dc:5071:959c:93e4])
 by smtp.gmail.com with ESMTPSA id
 fm11-20020a05600c0c0b00b003c21ba7d7d6sm1392944wmb.44.2023.01.18.01.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 01:45:27 -0800 (PST)
Message-ID: <f3c24686-2cef-7c0a-f9e2-b35e3c4caf8e@linaro.org>
Date: Wed, 18 Jan 2023 10:45:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v3 1/3] drm/mipi-dsi: Fix byte order of 16-bit DCS
 set/get brightness
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Vinay Simha BN
 <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230116224909.23884-1-mailingradian@gmail.com>
 <20230116224909.23884-2-mailingradian@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230116224909.23884-2-mailingradian@gmail.com>
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
Cc: Caleb Connolly <caleb@connolly.tech>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 23:49, Richard Acayan wrote:
> From: Daniel Mentz <danielmentz@google.com>
> 
> The MIPI DCS specification demands that brightness values are sent in
> big endian byte order. It also states that one parameter (i.e. one byte)
> shall be sent/received for 8 bit wide values, and two parameters shall
> be used for values that are between 9 and 16 bits wide.
> 
> Add new functions to properly handle 16-bit brightness in big endian,
> since the two 8- and 16-bit cases are distinct from each other.
> 
> Fixes: 1a9d759331b8 ("drm/dsi: Implement DCS set/get display brightness")
> Signed-off-by: Daniel Mentz <danielmentz@google.com>
> Link: https://android.googlesource.com/kernel/msm/+/754affd62d0ee268c686c53169b1dbb7deac8550
> [richard: fix 16-bit brightness_get]
> [richard: use separate functions instead of switch/case]
> [richard: split into 16-bit component]
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Tested-by: Caleb Connolly <caleb@connolly.tech>
> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 52 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     |  4 +++
>   2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 497ef4b6a90a..4bc15fbd009d 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -1224,6 +1224,58 @@ int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>   }
>   EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness);
>   
> +/**
> + * mipi_dsi_dcs_set_display_brightness_large() - sets the 16-bit brightness value
> + *    of the display
> + * @dsi: DSI peripheral device
> + * @brightness: brightness value
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int mipi_dsi_dcs_set_display_brightness_large(struct mipi_dsi_device *dsi,
> +					     u16 brightness)
> +{
> +	u8 payload[2] = { brightness >> 8, brightness & 0xff };
> +	ssize_t err;
> +
> +	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +				 payload, sizeof(payload));
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_set_display_brightness_large);
> +
> +/**
> + * mipi_dsi_dcs_get_display_brightness_large() - gets the current 16-bit
> + *    brightness value of the display
> + * @dsi: DSI peripheral device
> + * @brightness: brightness value
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
> +					     u16 *brightness)
> +{
> +	u8 brightness_be[2];
> +	ssize_t err;
> +
> +	err = mipi_dsi_dcs_read(dsi, MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
> +				brightness_be, sizeof(brightness_be));
> +	if (err <= 0) {
> +		if (err == 0)
> +			err = -ENODATA;
> +
> +		return err;
> +	}
> +
> +	*brightness = (brightness_be[0] << 8) | brightness_be[1];
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness_large);
> +
>   static int mipi_dsi_drv_probe(struct device *dev)
>   {
>   	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 4f503d99f668..16f30975b22b 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -296,6 +296,10 @@ int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
>   					u16 brightness);
>   int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>   					u16 *brightness);
> +int mipi_dsi_dcs_set_display_brightness_large(struct mipi_dsi_device *dsi,
> +					     u16 brightness);
> +int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
> +					     u16 *brightness);
>   
>   /**
>    * mipi_dsi_generic_write_seq - transmit data using a generic write packet

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
