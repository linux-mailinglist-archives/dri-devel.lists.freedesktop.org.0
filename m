Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E59F2C77
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E6C10E544;
	Mon, 16 Dec 2024 08:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pzSYi7eT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B48C10E544
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:57:47 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3022c61557cso40693971fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734339465; x=1734944265; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AjIJpKGlM0gtWiQBxlwaVUAhcYgn8uwwEWeXUlNCUao=;
 b=pzSYi7eTunSfFq+KdtGn18xqDbgM7cjfaxN92/vq+ErW6Ehik2ESwnyORXjSxs3c0j
 WKuscGU0CXiZyHYjtuyqYzPMBC6AMi0Rhyby4d2NJ+q767+NR5eeDT0szEERBia/B3j8
 F4T491XJHgI6DdDMwbLrgOS9iKCfjcOwS5U7+6eDKQnVPmx79MHue6AExEzAWimhN4Zr
 Eoo2hYF+hXjEVzF10KnQRu3BOFf+o9Ir7gMqmsJ68+Bt/CCfYW5lDhfQekT+QE7P2k80
 jFL6PH/EAxIQc9xABkAkrjB86ruDAkbxiY2mIikoMZ2sdGyaoj5zGqp1tEkJsLfvsh9q
 Q79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734339465; x=1734944265;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AjIJpKGlM0gtWiQBxlwaVUAhcYgn8uwwEWeXUlNCUao=;
 b=ukFlX5XyqsGM6H53BcNDBzZdwhooI7yWIRZZ/gy3yPTECG+6QLNySXPQUJSj4Nr4ZO
 ZsQfz5KguGsVlvBaft9Wbtbit1pjltzB2GHSTK5pNjZqD4fRFxMEKSQP44Gtn+kIXhZw
 Ri3ry8TKx9pa6EIZMdmuK3U+ZhlC/bVqwPYjV5cHLE3lOIIKue6IcyqtyfGvWASKwkgE
 5dIiRD+/BjdE8tQTewlkMVtsEMySFC/AFpqoUpn+00EXWo3yGvLrlaEPkrzlcoeudIxh
 acUal7YrXMGK1fcf569aOXnF+WHh/lLV10yKYaWruxGH9CH2knUCwizGrXNQBiskivPf
 5xyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpsEcsRVJUhfr61nfHFITxtktfO/UZucsUpb9HY9oENDdxlBTVdGnmJqQ9yqaaS+FnXa0270IMYok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxwGXrGgDVZVdXQtwog8BZg9We+W3b0MSKf4k/KKPllzXjGErO
 6CKItE8+vpDPnT+oQrw6IyvTD65NwF1f5dKl/+x7JVVWF5efuQDKAn6Wtn0pyYk=
X-Gm-Gg: ASbGncvQQl/X66gAFtFKb/Y8oIUuuO3D4vna+aN/82hzjnQIOIUG21zzlXi2VPDUXUo
 1yLCBlwSA1i0xxNpIWNWsRhuf+wETX6zAjAhE1+GUaTsvGcH7+ttHIBu6BRScjwTokEdV4oFJPB
 wAfGSMZnge84W1+HRCV4MeR0vxnoDJeDF7L9qjOdf+RPknf+SRmmWxhztbM4NN2VONspa1p5lPu
 K/rW/j8v572UtB/WcJSLRsA1yLup3Zu2hRyH4o8p7bVquiN4WujmgerQPhGke6b69XkbMpXrQ47
 BRi/zFD5UQ4e8EABiDp+RgoK96pmeoHKO81J
X-Google-Smtp-Source: AGHT+IGiv0XpHh+7rtFdMzcdCLnItW3iZioZ/1D4bSk6d6rk/mbtm3bcDCP3tB0pIzXojiHobYEBPA==
X-Received: by 2002:a2e:be1e:0:b0:303:4289:b991 with SMTP id
 38308e7fff4ca-303428a04efmr28820241fa.19.1734339465327; 
 Mon, 16 Dec 2024 00:57:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344046c9asm8429141fa.50.2024.12.16.00.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:57:44 -0800 (PST)
Date: Mon, 16 Dec 2024 10:57:41 +0200
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
Subject: Re: [PATCH v2 03/11] drm/rockchip: analogix_dp: Add support for RK3588
Message-ID: <gwogudb5vae7wu452zwuqmdlyaibenoso4f5pjmu3uttckhy2w@shndol4mz5n4>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-4-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216031225.3746-4-damon.ding@rock-chips.com>
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

On Mon, Dec 16, 2024 at 11:12:17AM +0800, Damon Ding wrote:
> RK3588 integrates the analogix eDP 1.3 TX controller IP and the HDMI/eDP
> TX Combo PHY based on a Samsung IP block, and there are also two
> independent eDP display interface on RK3588 Soc.
> 
> Add just the basic support for now, i.e. RGB output up to 4K@60Hz, without
> the tests of audio, PSR and other eDP 1.3 specific features.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add support for the other eDP output edp1
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 82 ++++++++++++++++---
>  include/drm/bridge/analogix_dp.h              |  3 +-
>  2 files changed, 74 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index 871606a31ef1..4c9a55776ada 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -51,10 +51,12 @@ struct rockchip_grf_reg_field {
>  /**
>   * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
>   * @lcdc_sel: grf register field of lcdc_sel
> + * @edp_mode: grf register field of edp_mode
>   * @chip_type: specific chip type
>   */
>  struct rockchip_dp_chip_data {
>  	const struct rockchip_grf_reg_field lcdc_sel;
> +	const struct rockchip_grf_reg_field edp_mode;
>  	u32	chip_type;
>  };
>  
> @@ -134,12 +136,21 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>  		return ret;
>  	}
>  
> +	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
> +	if (ret != 0)
> +		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);

Is it to be called for non-eDP hosts too? Or for older hosts?

> +
>  	return ret;
>  }
>  
>  static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>  {
>  	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
> +	int ret;
> +
> +	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 0);
> +	if (ret != 0)
> +		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);

Same question.

>  
>  	clk_disable_unprepare(dp->pclk);
>  
> @@ -203,6 +214,10 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
>  	struct rockchip_dp_device *dp = encoder_to_dp(encoder);
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state;
> +	struct of_endpoint endpoint;
> +	struct device_node *remote_port, *remote_port_parent;
> +	char name[32];
> +	u32 port_id;
>  	int ret;
>  
>  	crtc = rockchip_dp_drm_get_new_crtc(encoder, state);
> @@ -220,13 +235,27 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
>  		return;
>  	}
>  
> -	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
> +	ret = drm_of_encoder_active_endpoint(dp->dev->of_node, encoder, &endpoint);
>  	if (ret < 0)
>  		return;
>  
> -	DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
> +	remote_port_parent = of_graph_get_remote_port_parent(endpoint.local_node);
> +	if (remote_port_parent) {
> +		if (of_get_child_by_name(remote_port_parent, "ports")) {
> +			remote_port = of_graph_get_remote_port(endpoint.local_node);
> +			of_property_read_u32(remote_port, "reg", &port_id);
> +			of_node_put(remote_port);
> +			sprintf(name, "%s vp%d", remote_port_parent->full_name, port_id);
> +		} else {
> +			sprintf(name, "%s %s",
> +				remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
> +		}
> +		of_node_put(remote_port_parent);
> +
> +		DRM_DEV_DEBUG(dp->dev, "%s output to edp\n", name);
> +	}

The "output to dp" message got dropped. Is it expected?

>  
> -	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, ret);
> +	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, endpoint.id);
>  	if (ret != 0)
>  		DRM_DEV_ERROR(dp->dev, "Could not write to GRF: %d\n", ret);
>  
> @@ -396,6 +425,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	const struct rockchip_dp_chip_data *dp_data;
>  	struct drm_panel *panel = NULL;
>  	struct rockchip_dp_device *dp;
> +	int id, i;
>  	int ret;
>  
>  	dp_data = of_device_get_match_data(dev);
> @@ -410,9 +440,22 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>  	if (!dp)
>  		return -ENOMEM;
>  
> +	id = of_alias_get_id(dev->of_node, "edp");
> +	if (id < 0)
> +		id = 0;

Alias is not documented.

Please check how other platforms handle device -> ID conversion and
consider following it (yes, the best option currently known is to
hardcode bus addresses into the driver data).

> +
> +	i = 0;
> +	while (is_rockchip(dp_data[i].chip_type))
> +		i++;
> +
> +	if (id >= i) {
> +		DRM_DEV_ERROR(dev, "invalid edp id: %d\n", id);
> +		return -ENODEV;
> +	}

Is it applicable to non-eDP case?

> +
>  	dp->dev = dev;
>  	dp->adp = ERR_PTR(-ENODEV);
> -	dp->data = dp_data;
> +	dp->data = &dp_data[id];
>  	dp->plat_data.panel = panel;
>  	dp->plat_data.dev_type = dp->data->chip_type;
>  	dp->plat_data.power_on = rockchip_dp_poweron;
> @@ -464,19 +507,38 @@ static int rockchip_dp_resume(struct device *dev)
>  static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
>  		rockchip_dp_resume, NULL);
>  
> -static const struct rockchip_dp_chip_data rk3399_edp = {
> -	.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> -	.chip_type = RK3399_EDP,
> +static const struct rockchip_dp_chip_data rk3399_edp[] = {
> +	{
> +		.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> +		.chip_type = RK3399_EDP,
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static const struct rockchip_dp_chip_data rk3288_dp[] = {
> +	{
> +		.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> +		.chip_type = RK3288_DP,
> +	},
> +	{ /* sentinel */ }
>  };
>  
> -static const struct rockchip_dp_chip_data rk3288_dp = {
> -	.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> -	.chip_type = RK3288_DP,
> +static const struct rockchip_dp_chip_data rk3588_edp[] = {
> +	{
> +		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
> +		.chip_type = RK3588_EDP,
> +	},
> +	{
> +		.edp_mode = GRF_REG_FIELD(0x0004, 0, 0),
> +		.chip_type = RK3588_EDP,
> +	},
> +	{ /* sentinel */ }
>  };
>  
>  static const struct of_device_id rockchip_dp_dt_ids[] = {
>  	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
>  	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
> +	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 6002c5666031..54086cb2d97d 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -15,11 +15,12 @@ enum analogix_dp_devtype {
>  	EXYNOS_DP,
>  	RK3288_DP,
>  	RK3399_EDP,
> +	RK3588_EDP,
>  };
>  
>  static inline bool is_rockchip(enum analogix_dp_devtype type)
>  {
> -	return type == RK3288_DP || type == RK3399_EDP;
> +	return type == RK3288_DP || type == RK3399_EDP || type == RK3588_EDP;
>  }
>  
>  struct analogix_dp_plat_data {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
