Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D2DA1A2E1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CC210E234;
	Thu, 23 Jan 2025 11:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OtmFtES6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7311510E234
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:25:38 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so757952e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737631537; x=1738236337; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bNbAEqQ3dzAhzmo5DcpNruuevQ1QRA6TJaugf1zsVsY=;
 b=OtmFtES6Gh7AFgbA2C/UAaQbVkDJNzwBDRzz7bIF21K5wTdJZ7ATMdJHwOWjfkYrPe
 LVpUYSKS+yCG3auRQNYoCcsIs5NDeSv/rxWtEm+7iPdJr7IOPIqd4j/L9sM1AEGlloYj
 ByegAU2Q9FwSZVdgg5u/0aPWwzH/cQmaReyUc74uywAZqSEeTJfuQygua3T1TV75DCqg
 67RCLUjqGn2fgcdKIjUEgh+62Fu87HjWs5pYQqVDbJHWowpdbnDoQDglcPw4hI58pTkT
 47knwBOnmsBcN6mr5sFWf5w41Cpj6OkCSDXYfFoq39D8B/GjYu7nFlqr9fH9+aFXZhfy
 Z5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737631537; x=1738236337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNbAEqQ3dzAhzmo5DcpNruuevQ1QRA6TJaugf1zsVsY=;
 b=B76hhy7onTodDVltGvJXkTRh5Y/lBrmEsM6J8JkTPw6k46xgycl5P4wxMnbSgBVssI
 X3IbxPLlKSXMJwUqRFjx1N7LF97K2kFUPjdfMuF5/tYTRqMfS7XxpXxHQjK5yzKJpUyX
 YW5yqkbWdorL1ulOdNZwFuLHKqoj2JO6CDcT+0nVkexmrxwhaag19w3zDI5xUVHzgw++
 8xHMhJl4EA7EPxW3YEANYckbh4c/yAMb5rhF+16K4WNDr+PnAiDpM5x4aSwwnegiQKUM
 WHHEf/emx5/rKNe4W8Och84wlYpGQqXs4eNXMAnCByPXCRZqHIoV6SF+VlYYg6C/CJ0P
 LB5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0cimp6OA9Wv4a5/S5XqoYobyjZduJg2ChsIh9gf10GUQviMp+5/06WFeo4beo76lxLujs67pi278=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhgatKh9Yi6Fohyb3bg/OqCYgc9ihh0FnYP/MxabGu3cAAoOq3
 v5hiKPZAVKneKVq8ceCfUV+ylP4fmel33FMZwP9oDH0FgwZF69Td1O/lO/6G8/0rdXjC7d0ttNZ
 MdtI=
X-Gm-Gg: ASbGnctQCOMLEk7GxBsWu2Z8qpb/VHuXzsJNjHPzyi+fC3F93+Hu1Y/K0LXzMC85mHI
 S8eiEeIgMZd0ZmG2rukEcq3cp1Q4QAtgqpwVSfsuiR83yZMe/fdUZPrGwmU0nDfTWJUkOvE6Nr+
 Tx7PoLlx/3hMmpRnezGgfJBG4LO8tY55yRsm9xCkTt0YRRhZTfUfK8n9Gy1iUOxr/MCC4lw9JbO
 Yyg5wpMiANgH8WYDZvkWtuiRFwPE/si8AUiKhknqEY6ofmJP9BTTypoHYECeBrRL03yhE5/brdk
 Yenj9fxd1ShhHHwR78LteRaQYiT7HSfakDubnqZtecovB3u8ZOeW2eiTI4CU
X-Google-Smtp-Source: AGHT+IE6ibA+SRqqESfpmIp0xn+MDgVnaMtNtXwPAf6a4XrGleP9tXnk5wy5cdgtpp2cytg3OJlqNw==
X-Received: by 2002:a05:6512:e83:b0:542:2a81:a759 with SMTP id
 2adb3069b0e04-5439c21f23dmr7041361e87.2.1737631536605; 
 Thu, 23 Jan 2025 03:25:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78955sm2603438e87.234.2025.01.23.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:25:36 -0800 (PST)
Date: Thu, 23 Jan 2025 13:25:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 07/14] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <fw74xd2hgwc7iodhh5wb3ovd26tzlsomgypx4hqlqrxl4k2mdf@pycb5ugojyhr>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-8-damon.ding@rock-chips.com>
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

On Thu, Jan 23, 2025 at 06:07:40PM +0800, Damon Ding wrote:
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operaions to
> ensure that eDP controller and phy are prepared for AUX transmission.

This doesn't sound right. Per the documentation of
drm_dp_aux::transfer(), the device should power itself up if transfer()
is called when it is powered off. The caller must only ensure that the
panel is on.

Doug, what's your opinion?

> 
> In addtion, add a new function analogix_dp_remove() to ensure symmetry
> for PM operations.
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
> 
> Changes in v6:
> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>   operations
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 57 ++++++++++---------
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  4 ++
>  include/drm/bridge/analogix_dp.h              |  1 +
>  3 files changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8251adfce2f9..30da8a14361e 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1658,14 +1658,42 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
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
> +		ret = devm_pm_runtime_enable(dp->dev);
> +		if (ret)
> +			goto err_disable_pm_runtime;
> +	} else {
> +		ret = analogix_dp_resume(dp);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
> +
>  	return dp;
>  
> +err_disable_pm_runtime:
> +	pm_runtime_dont_use_autosuspend(dp->dev);
>  err_disable_clk:
>  	clk_disable_unprepare(dp->clock);
>  	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_probe);
>  
> +void analogix_dp_remove(struct analogix_dp_device *dp)
> +{
> +	if (IS_ENABLED(CONFIG_PM))
> +		pm_runtime_dont_use_autosuspend(dp->dev);
> +	else
> +		analogix_dp_suspend(dp);
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_remove);
> +
>  int analogix_dp_suspend(struct analogix_dp_device *dp)
>  {
>  	phy_power_off(dp->phy);
> @@ -1708,25 +1736,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
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
> @@ -1739,13 +1754,6 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
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
> @@ -1762,13 +1770,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
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
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index a63c2c867059..13f32aeea7ca 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -459,6 +459,10 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  
>  static void rockchip_dp_remove(struct platform_device *pdev)
>  {
> +	struct rockchip_dp_device *dp = dev_get_drvdata(&pdev->dev);
> +
> +	analogix_dp_remove(dp->adp);
> +
>  	component_del(&pdev->dev, &rockchip_dp_component_ops);
>  }
>  
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 1b119b547988..d9b721fd7201 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -43,6 +43,7 @@ int analogix_dp_suspend(struct analogix_dp_device *dp);
>  
>  struct analogix_dp_device *
>  analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data);
> +void analogix_dp_remove(struct analogix_dp_device *dp);
>  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev);
>  void analogix_dp_unbind(struct analogix_dp_device *dp);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
