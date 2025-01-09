Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50EA07604
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AD210EDAE;
	Thu,  9 Jan 2025 12:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dEyX4Lsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF2A10EDAE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:46:36 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-304d760f12aso6628091fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736426734; x=1737031534; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VHN/5X/Qy69qyMpCWb8kneKgFMU5IOAUBhcGNPPugoM=;
 b=dEyX4Lsh8BIqjDGLUbN+qRL4yuhWAfTdR+a+bgsJQ8p44/hGqi+bXBZF4dESkFR3zs
 l5ZzD6K4QiJ0DYY0jmKBZX6PnR/0MXWNSIgYiUhBkBKy1kuBorScufhvRKebH3tlUzj6
 EjFoGVtNNxrsiZ93KhxNeVOy4uMSkQ/By0oiDH1qT6NdPKyOGNtdbgSvuvlE89nxjZfr
 rZBQkK96U9pFOdjZgh1DzBUzv5y/Z2ZoC8XyN8Hy2HF57Jbl06H9Y/hFJ5dJaPlPi/Lr
 p1JFfxUR4/LEYAUYEU9+ktu3KIJmt4GX5XNQ/m3Iu+ch0Y95GjHPnlHoq0BDAVeRYpH2
 qWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736426734; x=1737031534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHN/5X/Qy69qyMpCWb8kneKgFMU5IOAUBhcGNPPugoM=;
 b=bT9ZWVQBtUVU+M/EogPoCCq2yRAi05AadUYoqN8nE1DfCwf8VmOHtJ6qcNok6069D5
 /df+tb4Q5gIc41hf839RD6aYqFSnbTfvw0XJkTHdQfYyB8OBLTljJ81OybdvYDG6GX0p
 o9fb2FQ7i0MpKyqn+BuA0aTcrL7ZDCCK1/7oz3g7v1Lf/BQr/cXyK2+03inIAsGS1KV6
 CwJzlMIRaqyhVbOcA4mK1eT91YuL0ubhDkeiam/3K5GmgO+bKONC3CXS8tKgCuP7OnKz
 xYbNE603zZIQb33wjR51YEmXE1kBLvQhOKGY0o6AS6KVpuXQkxkIwOQz+/Ls0OO3Xz+5
 Sidw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhRHBBKgGDVaPItJH+9hYT5gW4KgENwv2d6DdNfQqJYNfd6UHenYT2tm1RoAj11Q023zt7C+qZpHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkfPVUGSpvOz02yo313wV0C1D15y+5xwmfB3Y33aSLjltaZGxF
 NI3vTgHwcv8FvHEhY8kvdZRAlxN01TAqOgZ+d5pus0e2mH9wrxraviXckpiAorY=
X-Gm-Gg: ASbGncuAvKxtYXscylLRw0vtCudlnj4c7nxSMCzQDWhHUlCS/zk0RUd/sBUBerWFPMd
 K/DWzGQXZ3Fg+Jsy9CtHiNMo9OB7nXn1VqxObXIy28Pvh9mFfhuVwCHCEF5bMJIOl/V8F3kyE0u
 A/zFDSAGC7pdSLCXS5d/8obrbTbdHSKFSUnKxncOBkNA6F2IYGr6ZXyl+bsZAXj3m+jNvB55fOl
 pZ6O9IshTYshdpkp1HWS9LxSqjPBpc0YUxxW3L8xbFnUHIca3XYMZblK8erprnhm3/9894neY5p
 kEUi2pOH9jDxI7YsW4T2Kf0OkAXVgKTOARv3
X-Google-Smtp-Source: AGHT+IElPQjul5XrLoFmXQxy4bhtqUX4GjET6+7h8yvFk+lQX7gbeGOus+f4biXivZj6ML5v9KKwQQ==
X-Received: by 2002:a05:651c:f11:b0:301:2d8d:a3ba with SMTP id
 38308e7fff4ca-305f45a06d8mr18524331fa.23.1736426734459; 
 Thu, 09 Jan 2025 04:45:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0cfc32sm1877911fa.45.2025.01.09.04.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:45:34 -0800 (PST)
Date: Thu, 9 Jan 2025 14:45:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 11/20] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <v3is3v3fpx42i2eh2qrfkx3qx3z7iema3honi544qoc4j2whdo@h6ajv5h53gry>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-12-damon.ding@rock-chips.com>
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

On Thu, Jan 09, 2025 at 11:27:16AM +0800, Damon Ding wrote:
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operaions to
> ensure that eDP controller and phy are prepared for AUX transmission.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
> 
> Changes in v5:
> - Advance PM operations to make eDP AUX work well
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 62 ++++++++++---------
>  1 file changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8251adfce2f9..78e78fb474d3 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1548,6 +1548,18 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>  	return ret;
>  }
>  
> +static void analogix_dp_runtime_disable(void *data)
> +{
> +	struct analogix_dp_device *dp = (struct analogix_dp_device *)data;
> +
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		pm_runtime_dont_use_autosuspend(dp->dev);
> +		pm_runtime_disable(dp->dev);
> +	} else {
> +		analogix_dp_suspend(dp);
> +	}
> +}
> +
>  struct analogix_dp_device *
>  analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>  {
> @@ -1658,8 +1670,29 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>  	}
>  	disable_irq(dp->irq);
>  
> +	dp->aux.name = "DP-AUX";
> +	dp->aux.transfer = analogix_dpaux_transfer;
> +	dp->aux.dev = dp->dev;
> +	drm_dp_aux_init(&dp->aux);
> +
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		pm_runtime_use_autosuspend(dp->dev);
> +		pm_runtime_set_autosuspend_delay(dp->dev, 100);
> +		pm_runtime_enable(dp->dev);
> +	} else {
> +		ret = analogix_dp_resume(dp);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, analogix_dp_runtime_disable, dp);

This looks like a local version of devm_pm_runtime_enable()

> +	if (ret)
> +		goto err_disable_pm_runtime;
> +
>  	return dp;
>  
> +err_disable_pm_runtime:
> +	analogix_dp_runtime_disable((void *)dp);
>  err_disable_clk:
>  	clk_disable_unprepare(dp->clock);
>  	return ERR_PTR(ret);
> @@ -1708,25 +1741,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  	dp->drm_dev = drm_dev;
>  	dp->encoder = dp->plat_data->encoder;
>  
> -	if (IS_ENABLED(CONFIG_PM)) {
> -		pm_runtime_use_autosuspend(dp->dev);
> -		pm_runtime_set_autosuspend_delay(dp->dev, 100);
> -		pm_runtime_enable(dp->dev);
> -	} else {
> -		ret = analogix_dp_resume(dp);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	dp->aux.name = "DP-AUX";
> -	dp->aux.transfer = analogix_dpaux_transfer;
> -	dp->aux.dev = dp->dev;
>  	dp->aux.drm_dev = drm_dev;
>  
>  	ret = drm_dp_aux_register(&dp->aux);
>  	if (ret) {
>  		DRM_ERROR("failed to register AUX (%d)\n", ret);
> -		goto err_disable_pm_runtime;
> +		return ret;
>  	}
>  
>  	ret = analogix_dp_create_bridge(drm_dev, dp);
> @@ -1739,13 +1759,6 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  
>  err_unregister_aux:
>  	drm_dp_aux_unregister(&dp->aux);
> -err_disable_pm_runtime:
> -	if (IS_ENABLED(CONFIG_PM)) {
> -		pm_runtime_dont_use_autosuspend(dp->dev);
> -		pm_runtime_disable(dp->dev);
> -	} else {
> -		analogix_dp_suspend(dp);
> -	}
>  
>  	return ret;
>  }
> @@ -1762,13 +1775,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
>  	}
>  
>  	drm_dp_aux_unregister(&dp->aux);
> -
> -	if (IS_ENABLED(CONFIG_PM)) {
> -		pm_runtime_dont_use_autosuspend(dp->dev);
> -		pm_runtime_disable(dp->dev);
> -	} else {
> -		analogix_dp_suspend(dp);
> -	}
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
