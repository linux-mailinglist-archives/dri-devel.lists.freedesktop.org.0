Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33122D1B6EC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B2C10E552;
	Tue, 13 Jan 2026 21:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="TwqKRaDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F19610E381
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768340226; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MCM+rKGImSssg9iSfQ7g7c1e2cK6QXKDqzCjtSasZYEydr9Ih9j+78vDH5AJKzTzuXrl5OUrbNGeO8d0kbooiHFjRQLx66/wU2E4lLyTEIa4jWrPonZG3aVpTrmjvlKp1s1UifpvxKriqAcRSB9OVwtLryr2EKOxGjb81taaSCM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768340226;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Zei4KTAsJshp6Vcua+q2Y3zJ4iL6WdDmcJtZbA2kELI=; 
 b=I0e7drqOmD3iGkIaip9BwnplAucN+OrBooxvKX7s8jgPQiBjTW3gUqnaM1QLEcIS49OrK9hvkr7ovJBUF3iotQNbCsR35SQy1QnIQsg+8q8Q6+Frw7EoBigincZLkc9sHKJlFJhQAeul2EJipZgW7+FCpaZQb3RrA0FbzFxx518=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768340226; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Zei4KTAsJshp6Vcua+q2Y3zJ4iL6WdDmcJtZbA2kELI=;
 b=TwqKRaDwVsCAqoIMGtn2xssnDGLC35eHrg4Fu4QHtR1kNW/I7QLrVzWw9fWQYZVB
 NXGuUfUc1aWILS/gN2QxuSqsGhKK2XHK9GdfGshg8/3mdKmPb2FTPnLnJNryvCjT7+c
 ltFhr+Nc87Ap8a5Yr+pONCilQkptcQ/tjHGX93fU=
Received: by mx.zohomail.com with SMTPS id 1768340224730540.8247444863133;
 Tue, 13 Jan 2026 13:37:04 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
 id C6967181010; Tue, 13 Jan 2026 22:36:58 +0100 (CET)
Date: Tue, 13 Jan 2026 22:36:58 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, dmitry.baryshkov@oss.qualcomm.com, krzk+dt@kernel.org, 
 conor+dt@kernel.org, cristian.ciocaltea@collabora.com, 
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, hjc@rock-chips.com,
 robh@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 2/5] drm/bridge: synopsys: dw-dp: Set pixel mode by
 platform data
Message-ID: <aWa6v2ouVlGYeESo@venus>
References: <20260109080054.228671-1-andyshrk@163.com>
 <20260109080054.228671-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109080054.228671-3-andyshrk@163.com>
X-ZohoMailClient: External
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

Hi,

On Fri, Jan 09, 2026 at 04:00:45PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DW DisplayPort hardware block can be configured to work in single,
> dual,quad pixel mode on differnt platforms, so make the pixel mode set
> by plat_data to support the upcoming rk3576 variant.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

> 
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c   |  8 +-------
>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 19 +++++++++++++++----
>  include/drm/bridge/dw_dp.h                |  7 +++++++
>  3 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> index 82aaf74e1bc0..eccf6299bdb7 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -352,12 +352,6 @@ enum {
>  	DW_DP_YCBCR420_16BIT,
>  };
>  
> -enum {
> -	DW_DP_MP_SINGLE_PIXEL,
> -	DW_DP_MP_DUAL_PIXEL,
> -	DW_DP_MP_QUAD_PIXEL,
> -};
> -
>  enum {
>  	DW_DP_SDP_VERTICAL_INTERVAL = BIT(0),
>  	DW_DP_SDP_HORIZONTAL_INTERVAL = BIT(1),
> @@ -1984,7 +1978,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
>  		return ERR_CAST(dp);
>  
>  	dp->dev = dev;
> -	dp->pixel_mode = DW_DP_MP_QUAD_PIXEL;
> +	dp->pixel_mode = plat_data->pixel_mode;
>  
>  	dp->plat_data.max_link_rate = plat_data->max_link_rate;
>  	bridge = &dp->bridge;
> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> index 25ab4e46301e..89d614d53596 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> @@ -75,7 +75,7 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
>  static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> -	struct dw_dp_plat_data plat_data;
> +	const struct dw_dp_plat_data *plat_data;
>  	struct drm_device *drm_dev = data;
>  	struct rockchip_dw_dp *dp;
>  	struct drm_encoder *encoder;
> @@ -89,7 +89,10 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
>  	dp->dev = dev;
>  	platform_set_drvdata(pdev, dp);
>  
> -	plat_data.max_link_rate = 810000;
> +	plat_data = of_device_get_match_data(dev);
> +	if (!plat_data)
> +		return -ENODEV;
> +
>  	encoder = &dp->encoder.encoder;
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev, dev->of_node);
>  	rockchip_drm_encoder_set_crtc_endpoint_id(&dp->encoder, dev->of_node, 0, 0);
> @@ -99,7 +102,7 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
>  		return ret;
>  	drm_encoder_helper_add(encoder, &dw_dp_encoder_helper_funcs);
>  
> -	dp->base = dw_dp_bind(dev, encoder, &plat_data);
> +	dp->base = dw_dp_bind(dev, encoder, plat_data);
>  	if (IS_ERR(dp->base)) {
>  		ret = PTR_ERR(dp->base);
>  		return ret;
> @@ -134,8 +137,16 @@ static void dw_dp_remove(struct platform_device *pdev)
>  	component_del(dp->dev, &dw_dp_rockchip_component_ops);
>  }
>  
> +static const struct dw_dp_plat_data rk3588_dp_plat_data = {
> +	.max_link_rate = 810000,
> +	.pixel_mode = DW_DP_MP_QUAD_PIXEL,
> +};
> +
>  static const struct of_device_id dw_dp_of_match[] = {
> -	{ .compatible = "rockchip,rk3588-dp", },
> +	{
> +		.compatible = "rockchip,rk3588-dp",
> +		.data = &rk3588_dp_plat_data,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dw_dp_of_match);
> diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
> index d05df49fd884..25363541e69d 100644
> --- a/include/drm/bridge/dw_dp.h
> +++ b/include/drm/bridge/dw_dp.h
> @@ -11,8 +11,15 @@
>  struct drm_encoder;
>  struct dw_dp;
>  
> +enum {
> +	DW_DP_MP_SINGLE_PIXEL,
> +	DW_DP_MP_DUAL_PIXEL,
> +	DW_DP_MP_QUAD_PIXEL,
> +};
> +
>  struct dw_dp_plat_data {
>  	u32 max_link_rate;
> +	u8 pixel_mode;
>  };
>  
>  struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
> -- 
> 2.43.0
> 
