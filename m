Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A267B929D67
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 09:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A7310E269;
	Mon,  8 Jul 2024 07:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="he5XXDw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2141D10E269
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 07:44:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so21286855e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 00:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720424676; x=1721029476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PKc/6b8SzfBj7M2nYp8kBK/g6YH6J6CYddIrh37bRLc=;
 b=he5XXDw2wtgjtrmaKrvFkokNlSIBd93fVRZ/1ebOYhXQ5xuXz8hWZEhwk2B/Abrr0q
 oQGeaxI6c1oHtkZF9zDrQl13VKFYCfrTyxPpuCiLsMBhoY8dA9FWc/Dp71IrhJyBWD3j
 qH3nuGLLn7+41UqwiCM1ntPMSItOfLmp6cCwooEjYcIyA4Hj0VYRD7azSmJ5ibDXX+qY
 hvIbRYcKQovcD1GKqKDnBCczVuVOhGDiupS6HT0aVPYDtvkX39SAb7zWZamOpNUQozdG
 EK3YqzlLRyVmWPA6YvwHdLV3zDesjcZFcl3xC2KPr7+3ugbnZ8t6qMrRgUnkA1Y6UA7O
 vC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720424676; x=1721029476;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PKc/6b8SzfBj7M2nYp8kBK/g6YH6J6CYddIrh37bRLc=;
 b=qZi5zIApd6U5bO98uct7RC5qmIpcBP/asW2nIJOo90M0ACH2fZ6qP4NxBfNNF1+ED8
 8Bm8rZOj8eRNX1rIejDOdA4LLJ24fCe4KWIM8UzX/C0Ow2Jq58nhf54ZeP1H9il6jXG6
 RbL3zMdvEg698HcOeEHju6rmFFw7osgCz31fWvXn1INzebF7mWEXnJBMKONWhwJWvr+2
 uoQQdkg1k8fmTcDYA8fyd3MXslsPHf+NAu2mfNpwjbS/vWYahZAZBkyTqFWMp6zZBk0N
 PFfWOnBPkwi8cw2je98Ah4j9bQS33aLlyakHXflG2F5bcByiknnpqw6ab9Wd8v120zVn
 nxlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUxVko78Hn6P+CvfHRDI4WfW1dmWBr7ZfhSzWMOCvWrGJbtrZm+9BHpnPQiMrUt0J4AC/2K5OgEwr+7TZE7k+K4tONDayteyO136NsEgY1
X-Gm-Message-State: AOJu0YxYTj23s1Y3eE3eGr0gXN5n36hhMDz2AcaubkhENf/J0Aa9oLkc
 FOjX80hveGbvil9jCkYuRq6FwyHMkQcPzWipVycqvBVS8SdguHkv5n+MlxAi5nM4783Rc2u1psZ
 pf6M=
X-Google-Smtp-Source: AGHT+IFi1UJrpS7oW1nzOg6c48MFbp0L4M8yB6ww5kHrzgS7QC/RcwAaxZOQdCBl4dSZKgy7bT1lyA==
X-Received: by 2002:a05:600c:2d16:b0:426:5b52:84fb with SMTP id
 5b1f17b1804b1-4265b528599mr57698455e9.7.1720424676295; 
 Mon, 08 Jul 2024 00:44:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c?
 ([2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2fc9desm155494565e9.45.2024.07.08.00.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 00:44:35 -0700 (PDT)
Message-ID: <c6a911c9-64e4-46aa-a6da-3311907b1c8b@linaro.org>
Date: Mon, 8 Jul 2024 09:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] drm/panel: st7701: Decouple DSI and DRM parts
To: Hironori KIKUCHI <kikuchan98@gmail.com>, linux-kernel@vger.kernel.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20240706102338.99231-1-kikuchan98@gmail.com>
 <20240706102338.99231-3-kikuchan98@gmail.com>
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
In-Reply-To: <20240706102338.99231-3-kikuchan98@gmail.com>
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

On 06/07/2024 12:23, Hironori KIKUCHI wrote:
> Split into a DSI-specific part and a DRM-specific part.
> 
> Additionally, use devm_add_action_or_reset() to simplify the flow,
> and disable and unprepare the panel on cleanup.
> 
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 72 ++++++++++++-------
>   1 file changed, 45 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index a9a8fd85057..a0644f7a4c8 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -539,7 +539,7 @@ static int st7701_get_modes(struct drm_panel *panel,
>   
>   	mode = drm_mode_duplicate(connector->dev, desc_mode);
>   	if (!mode) {
> -		dev_err(&st7701->dsi->dev, "failed to add mode %ux%u@%u\n",
> +		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
>   			desc_mode->hdisplay, desc_mode->vdisplay,
>   			drm_mode_vrefresh(desc_mode));
>   		return -ENOMEM;
> @@ -974,42 +974,48 @@ static const struct st7701_panel_desc rg_arc_desc = {
>   	.gip_sequence = rg_arc_gip_sequence,
>   };
>   
> -static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
> +static void st7701_cleanup(void *data)
> +{
> +	struct st7701 *st7701 = (struct st7701 *)data;
> +
> +	drm_panel_remove(&st7701->panel);
> +	drm_panel_disable(&st7701->panel);
> +	drm_panel_unprepare(&st7701->panel);
> +}
> +
> +static int st7701_probe(struct device *dev, int connector_type)
>   {
>   	const struct st7701_panel_desc *desc;
>   	struct st7701 *st7701;
>   	int ret;
>   
> -	st7701 = devm_kzalloc(&dsi->dev, sizeof(*st7701), GFP_KERNEL);
> +	st7701 = devm_kzalloc(dev, sizeof(*st7701), GFP_KERNEL);
>   	if (!st7701)
>   		return -ENOMEM;
>   
> -	desc = of_device_get_match_data(&dsi->dev);
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> -	dsi->format = desc->format;
> -	dsi->lanes = desc->lanes;
> +	desc = of_device_get_match_data(dev);
> +	if (!desc)
> +		return -ENODEV;
>   
>   	st7701->supplies[0].supply = "VCC";
>   	st7701->supplies[1].supply = "IOVCC";
>   
> -	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(st7701->supplies),
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(st7701->supplies),
>   				      st7701->supplies);
>   	if (ret < 0)
>   		return ret;
>   
> -	st7701->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
> +	st7701->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   	if (IS_ERR(st7701->reset)) {
> -		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
> +		dev_err(dev, "Couldn't get our reset GPIO\n");
>   		return PTR_ERR(st7701->reset);
>   	}
>   
> -	ret = of_drm_get_panel_orientation(dsi->dev.of_node, &st7701->orientation);
> +	ret = of_drm_get_panel_orientation(dev->of_node, &st7701->orientation);
>   	if (ret < 0)
> -		return dev_err_probe(&dsi->dev, ret, "Failed to get orientation\n");
> +		return dev_err_probe(dev, ret, "Failed to get orientation\n");
>   
> -	drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
> -		       DRM_MODE_CONNECTOR_DSI);
> +	drm_panel_init(&st7701->panel, dev, &st7701_funcs, connector_type);
>   
>   	/**
>   	 * Once sleep out has been issued, ST7701 IC required to wait 120ms
> @@ -1028,27 +1034,39 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
>   
>   	drm_panel_add(&st7701->panel);
>   
> -	mipi_dsi_set_drvdata(dsi, st7701);
> -	st7701->dsi = dsi;
> +	dev_set_drvdata(dev, st7701);
>   	st7701->desc = desc;
>   
> -	ret = mipi_dsi_attach(dsi);
> -	if (ret)
> -		goto err_attach;
> +	return devm_add_action_or_reset(dev, st7701_cleanup, st7701);
> +}
> +
> +static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct st7701 *st7701;
> +	int err;
> +
> +	err = st7701_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
> +	if (err)
> +		return err;
> +
> +	st7701 = dev_get_drvdata(&dsi->dev);
> +	st7701->dsi = dsi;
> +
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	dsi->format = st7701->desc->format;
> +	dsi->lanes = st7701->desc->lanes;
> +
> +	err = mipi_dsi_attach(dsi);
> +	if (err)
> +		return dev_err_probe(&dsi->dev, err, "Failed to init MIPI DSI\n");
>   
>   	return 0;
> -
> -err_attach:
> -	drm_panel_remove(&st7701->panel);
> -	return ret;
>   }
>   
>   static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
>   {
> -	struct st7701 *st7701 = mipi_dsi_get_drvdata(dsi);
> -
>   	mipi_dsi_detach(dsi);
> -	drm_panel_remove(&st7701->panel);
>   }
>   
>   static const struct of_device_id st7701_of_match[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
