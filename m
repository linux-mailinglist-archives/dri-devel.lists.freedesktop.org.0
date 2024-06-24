Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75109141E2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 07:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF6A10E345;
	Mon, 24 Jun 2024 05:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="URrNFOqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA4D10E345
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 05:21:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ec1e5505abso40316231fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 22:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719206481; x=1719811281; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2MGm9hgBQiIaonwYDgBJ0aXBhWFo2f3cLhGxXka39iM=;
 b=URrNFOqJG3bKbxz2Xe4lWxkhqbrLsquSyddlQCq9T0XXuV7FEUOEWB+fPz5tkmZ6jS
 kP5WHEa4qRjPz1uS/Kaxs3IXt9Bl0QjMOVf5M9BuCXRT+pMWypvT9jED/94EtsmgXaJP
 o7lMIO1bVzhA+H2M66S9VGlaTEFVck+iXhsKlYamVKegkLWc3uvpiL+1LaIqbJ8uATRl
 ycWq0pNgSnQtkYMpDiC+U3b7LJAiU8tQ7FnhBqBIuH9EVT6ky4A93vJTTVa3IAmTtSa9
 QYPJCxwN7xY4Q42MVGvGtJqq7lQNSe6W0Xy04VkNOU0YYbeFa7kYRZIyBz++xHnS979I
 GM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719206481; x=1719811281;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MGm9hgBQiIaonwYDgBJ0aXBhWFo2f3cLhGxXka39iM=;
 b=j1dl15t7lCspjPY51cEh6UxZ/ZHBAdKT7CwHA+2h5njhyhVMiLtUpGWZcZpfAKMkJP
 sQTyrYhVpG6Gr/umQTeTse2P4fEj8RWmDJ9Z0JhHUqToTVjPDhtU7zhm43cPg8NfXJnX
 m40cYy49UsUb3SdOFrU9HumLYAbP50BPhkjrh4jTJReyOIqL06f/LkrZo1b4d2OlT90e
 yjvtZFsDylbrNKtQoX75mVYVIUPSxTPBaE1zbGWxS4EVuCC/Jbp23ntzyCKD5zpIUd6w
 H32hnoAp7R6bfXnycrMEW/4zmwui/Q+GsKUaGfWWKRhYA4NEooU8fG4tVlaNE/N7ppRm
 FZxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkuFctD4wIDPK98Qu7pb471w3vgfX3VJlis5QVgLZ1KeoGSxaD4m1DxX+tCgAJnQ8I2ru3Cz5HclI+dgjyEXjcDTi6TGhggRySxpd4x7Ie
X-Gm-Message-State: AOJu0YzfNIqYA4QAS/N+CX7rtI2q/N69amoUFpg60fh9aMsaGzkvvzid
 HVeD+IGY854kKmx++tND9oAQZCWEuAqpRWSsRDzriEmGeuJqtUOxOZUIplRmCZw=
X-Google-Smtp-Source: AGHT+IH+EF6ZVxgix/33CGJs1LcRlM58jSDEP6hH4S/kepamdqtcu83VYx7sjlT8qvi+UsLClCqQ1A==
X-Received: by 2002:a2e:9f08:0:b0:2ec:3c7e:3b3d with SMTP id
 38308e7fff4ca-2ec56be6b08mr10787131fa.26.1719206481012; 
 Sun, 23 Jun 2024 22:21:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d7e7906sm8868841fa.121.2024.06.23.22.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 22:21:20 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:21:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/7] drm: mipi: add mipi_dsi_generic_write_multi_type()
Message-ID: <jbxk6uo3q2ddwthtc5et6gquiofgywnwh6e5kwpqe7pvglgbfg@k3djx6owef2t>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-4-388eecf2dff7@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-4-388eecf2dff7@postmarketos.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 24, 2024 at 03:30:28AM GMT, Caleb Connolly wrote:
> Some panels like the Samsung AMB655X use long write commands for all
> non-standard messages and do not work when trying to use the appropriate
> command type.
> 
> Support these panels by introducing a new helper to send commands of a
> specific type, overriding the normal rules.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 16 ++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index a471c46f5ca6..d0fee0498d91 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -819,8 +819,48 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
>  	}
>  }
>  EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
>  
> +/**
> + * mipi_dsi_generic_write_type() - transmit data using a generic write packet of

This doesn't match the name of the function.

> + * a specific type
> + * @dsi: DSI peripheral device
> + * @type: data type of the packet
> + * @payload: buffer containing the payload
> + * @size: size of payload buffer
> + *
> + * This function will automatically choose the right data type depending on
> + * the payload length.
> + *
> + * Return: The number of bytes transmitted on success or a negative error code
> + * on failure.
> + */
> +ssize_t mipi_dsi_generic_write_multi_type(struct mipi_dsi_multi_context *ctx,
> +					  u8 type, const void *payload, size_t size)

write_type_multi. Or maybe write_raw_multi.

> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_msg msg = {
> +		.channel = dsi->channel,
> +		.tx_buf = payload,
> +		.tx_len = size,
> +		.type = type,
> +	};
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return 0;
> +
> +	ret = mipi_dsi_device_transfer(dsi, &msg);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(&dsi->dev, "sending generic data %*ph failed: %zd\n",
> +			(int)size, payload, ret);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mipi_dsi_generic_write_multi_type);
> +
>  /**
>   * mipi_dsi_generic_read() - receive data using a generic read packet
>   * @dsi: DSI peripheral device
>   * @params: buffer containing the request parameters
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 71d121aeef24..a5d949e695d4 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -287,8 +287,10 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>  int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
>  				  const void *payload, size_t size);
>  void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
>  				  const void *payload, size_t size);
> +ssize_t mipi_dsi_generic_write_multi_type(struct mipi_dsi_multi_context *ctx, u8 type,
> +				    const void *payload, size_t size);
>  ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>  			      size_t num_params, void *data, size_t size);
>  
>  #define mipi_dsi_msleep(ctx, delay)	\
> @@ -432,8 +434,22 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
>  		static const u8 d[] = { cmd, seq };                     \
>  		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>  	} while (0)
>  
> +/**
> + * mipi_dsi_dcs_write_long - transmit a DCS long command with payload
> + * @dsi: DSI peripheral device
> + * @cmd: Commands
> + * @seq: buffer containing data to be transmitted
> + */
> +#define mipi_dsi_dcs_write_long(ctx, cmd, seq...)                          \

foo_multi

> +	do {                                                               \
> +		static const u8 d[] = { cmd, seq };                        \
> +		mipi_dsi_generic_write_multi_type(ctx,                     \
> +						  MIPI_DSI_DCS_LONG_WRITE, \
> +						  d, ARRAY_SIZE(d));       \
> +	} while (0)
> +
>  /**
>   * struct mipi_dsi_driver - DSI driver
>   * @driver: device driver model driver
>   * @probe: callback for device binding
> 
> -- 
> 2.45.0
> 

-- 
With best wishes
Dmitry
