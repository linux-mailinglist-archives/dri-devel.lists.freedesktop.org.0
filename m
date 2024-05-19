Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2798C96D7
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 23:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BE510E136;
	Sun, 19 May 2024 21:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MpPQijC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBB010E32C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 21:35:23 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51f4d2676d1so2767640e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716154522; x=1716759322; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3X1Yrmk1MoHmOR9BQlqVx5v5vjA2rIgAkVdy8YftygA=;
 b=MpPQijC/evisy9uouqgm+9zcJqT/XaEOq62RaQ+tEkv35D50wsKWGyHYEVeKp6mVKL
 BEaymXz2i5zzQkBtcv63uF/qvGzfBDlbQaBvjt1ReQpEtJ/f9OCY+oXglcnT/xGZpWZp
 vbZCQMO8bOw7cYc6nrZ14UJlhUPadl2EyU7ttsEfGh0UbhW2SFXr5GSHmPq3SvmJz9Q+
 nutsOi+3QLUdlFyKzplbd5VY6h55y7w8Zd+yEmGf/oRRodW2sM+obs+PVoCEOVBicWp1
 LReEw9CHlnQOkV3pgzNRbLyOeaPcdbQLjxN/54IlvNbjRbBtKOGACILp1PLiDzgEwDJx
 0VpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716154522; x=1716759322;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3X1Yrmk1MoHmOR9BQlqVx5v5vjA2rIgAkVdy8YftygA=;
 b=HvBsVxVzVEhKa6l2IwFsqG6O0H5f6S93dQEA8NJ6C6lIdDQDiJgwGqNBkpqPpbIpAI
 UlAbyBUCuhFs6i3MIBNeKNHfaIivP2Nd6eDD8MGqhhsyqttbN3nCJkPtbJFR5gsJbulC
 lB2HIl6MfviUZySpV2QWKKYpjMXufnMXwPL4apwoYKAdlTUVXsMUz/4LmU8aEvF8LO/C
 0XVcinkyYfiF3Y8z89SssAMpJ/NJhvJnllRqeK2O0gQEiZQQ9K4dxPPsJFEeBn7TQScK
 vWYd58hbPI4kbbhjgBFGpouscNVipS+vPP+mSlGpj6wgT33/ZnlkO3yLdUE5e+3neILd
 WWhw==
X-Gm-Message-State: AOJu0YwQnTtDw1OAMD7esnSivs/Yz0GwyJdsrRqqk7CzU3WijyvwCRBt
 5qrD/9fFHzBv4lA/TM95G1gsMMoN3mOKnnJo8xrCeYLQb0yMBGnq28uNtvgFfqs=
X-Google-Smtp-Source: AGHT+IHFhLcimoHFdpBR6hAEKKHgEzXpoaS34rfFdJS0lF8TQ2Ce7Fm3Krw2KG+bznBsSAnt2LCThA==
X-Received: by 2002:a05:6512:23a0:b0:51b:e46c:19fd with SMTP id
 2adb3069b0e04-5220fc7acdcmr19544531e87.18.1716154521689; 
 Sun, 19 May 2024 14:35:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-523765da43dsm2090065e87.121.2024.05.19.14.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 14:35:21 -0700 (PDT)
Date: Mon, 20 May 2024 00:35:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/11] drm/imx/tve: convert to struct drm_edid
Message-ID: <opukbtmhml563rxrjkg2d6ynysth3id6acscnnnbkrds3ix2xf@gbdxb6e5vvxz>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <2f59a7ad10c29c21f08223ef19221cef48623cc8.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f59a7ad10c29c21f08223ef19221cef48623cc8.1715691257.git.jani.nikula@intel.com>
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

On Tue, May 14, 2024 at 03:55:16PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> index b49bddb85535..29f494bfff67 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> @@ -201,18 +201,16 @@ static int tve_setup_vga(struct imx_tve *tve)
>  static int imx_tve_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct imx_tve *tve = con_to_tve(connector);
> -	struct edid *edid;
> -	int ret = 0;
> +	const struct drm_edid *drm_edid;
> +	int ret;
>  
>  	if (!tve->ddc)
>  		return 0;
>  
> -	edid = drm_get_edid(connector, tve->ddc);
> -	if (edid) {
> -		drm_connector_update_edid_property(connector, edid);
> -		ret = drm_add_edid_modes(connector, edid);
> -		kfree(edid);
> -	}
> +	drm_edid = drm_edid_read_ddc(connector, tve->ddc);
> +	drm_edid_connector_update(connector, drm_edid);
> +	ret = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: if you change two last lines, you can drop ret= assignment and use
return drm_edid_connector_add_modes(connector).

Maybe we shoud add cocci rule for such cases.

>  
>  	return ret;
>  }
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry
