Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A428A4D10C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 02:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA6F10E10F;
	Tue,  4 Mar 2025 01:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="NjUmjvzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 370 seconds by postgrey-1.36 at gabe;
 Tue, 04 Mar 2025 01:36:12 UTC
Received: from mail-m3270.qiye.163.com (mail-m3270.qiye.163.com
 [220.197.32.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400F410E10F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 01:36:12 +0000 (UTC)
Received: from [172.16.12.69] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id ccffe4af;
 Tue, 4 Mar 2025 09:31:05 +0800 (GMT+08:00)
Message-ID: <61bf39de-3aae-46fb-b1d4-c9c7fd0df4a7@rock-chips.com>
Date: Tue, 4 Mar 2025 09:31:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/rockchip: lvds: Hide scary error messages on
 probe deferral
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250301173547.710245-1-heiko@sntech.de>
 <20250301173547.710245-3-heiko@sntech.de>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250301173547.710245-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh1CTlZDTklPTEseH0JOT0lWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a955ec727f109d6kunmccffe4af
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTo6ISo4QzIII04dHU0fGDYd
 KgkwCT5VSlVKTE9KS05KQ01NT0hNVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTEpLTDcG
DKIM-Signature: a=rsa-sha256;
 b=NjUmjvzSLTOdAuDwfT/iBdPhYaJ3GCp98Ll5sZLHMqmfPw6h78bYZzeLmguwNkHWtNa/JZH7RGc191tqXJrfGSHAjUKNBDTEa40AzYIw4pP2kkZaQW1Lgs93PZrrt3YeagYrDxRB87U9vWvlIoAv8RNs0v/hprtCX1MB8MdgArY=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=KHMJZ+PBDPoJdIr2Mpzq4LEUmIWTTjJgD1i7rDnsrh8=;
 h=date:mime-version:subject:message-id:from;
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

Hi Heiko,


On 3/2/25 01:35, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Commit 52d11c863ac9 ("drm/rockchip: lvds: do not print scary message when
> probing defer") already started hiding scary messages that are not relevant
> if the requested supply just returned EPROBE_DEFER, but there are more
> possible sources - like the phy.
> 
> So modernize the whole logging in the probe path by replacing the
> remaining deprecated DRM_DEV_ERROR with appropriate dev_err(_probe)
> and drm_err calls.
> 
> The distinction here is that all messages talking about mishaps of the
> lvds element use dev_err(_probe) while messages caused by interaction
> with the main Rockchip drm-device use drm_err.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

   Reviewed-by: Andy Yan <andy.yan@rock-chips.com>

Thanks.
> ---
>   drivers/gpu/drm/rockchip/rockchip_lvds.c | 61 ++++++++++--------------
>   1 file changed, 26 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index ecfae8d5da89..d8b2007123fa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -453,10 +453,9 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>   		return PTR_ERR(lvds->regs);
>   
>   	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
> -	if (IS_ERR(lvds->pclk)) {
> -		DRM_DEV_ERROR(lvds->dev, "could not get or prepare pclk_lvds\n");
> -		return PTR_ERR(lvds->pclk);
> -	}
> +	if (IS_ERR(lvds->pclk))
> +		return dev_err_probe(lvds->dev, PTR_ERR(lvds->pclk),
> +				     "could not get or prepare pclk_lvds\n");
>   
>   	lvds->pins = devm_kzalloc(lvds->dev, sizeof(*lvds->pins),
>   				  GFP_KERNEL);
> @@ -465,14 +464,14 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>   
>   	lvds->pins->p = devm_pinctrl_get(lvds->dev);
>   	if (IS_ERR(lvds->pins->p)) {
> -		DRM_DEV_ERROR(lvds->dev, "no pinctrl handle\n");
> +		dev_err(lvds->dev, "no pinctrl handle\n");
>   		devm_kfree(lvds->dev, lvds->pins);
>   		lvds->pins = NULL;
>   	} else {
>   		lvds->pins->default_state =
>   			pinctrl_lookup_state(lvds->pins->p, "lcdc");
>   		if (IS_ERR(lvds->pins->default_state)) {
> -			DRM_DEV_ERROR(lvds->dev, "no default pinctrl state\n");
> +			dev_err(lvds->dev, "no default pinctrl state\n");
>   			devm_kfree(lvds->dev, lvds->pins);
>   			lvds->pins = NULL;
>   		}
> @@ -547,11 +546,10 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   	lvds->drm_dev = drm_dev;
>   	port = of_graph_get_port_by_id(dev->of_node, 1);
> -	if (!port) {
> -		DRM_DEV_ERROR(dev,
> -			      "can't found port point, please init lvds panel port!\n");
> -		return -EINVAL;
> -	}
> +	if (!port)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "can't found port point, please init lvds panel port!\n");
> +
>   	for_each_child_of_node(port, endpoint) {
>   		child_count++;
>   		of_property_read_u32(endpoint, "reg", &endpoint_id);
> @@ -563,8 +561,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		}
>   	}
>   	if (!child_count) {
> -		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");
> -		ret = -EINVAL;
> +		ret = dev_err_probe(dev, -EINVAL, "lvds port does not have any children\n");
>   		goto err_put_port;
>   	} else if (ret) {
>   		dev_err_probe(dev, ret, "failed to find panel and bridge node\n");
> @@ -581,8 +578,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		lvds->output = rockchip_lvds_name_to_output(name);
>   
>   	if (lvds->output < 0) {
> -		DRM_DEV_ERROR(dev, "invalid output type [%s]\n", name);
> -		ret = lvds->output;
> +		ret = dev_err_probe(dev, lvds->output, "invalid output type [%s]\n", name);
>   		goto err_put_remote;
>   	}
>   
> @@ -593,7 +589,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		lvds->format = rockchip_lvds_name_to_format(name);
>   
>   	if (lvds->format < 0) {
> -		DRM_DEV_ERROR(dev, "invalid data-mapping format [%s]\n", name);
> +		dev_err(dev, "invalid data-mapping format [%s]\n", name);
>   		ret = lvds->format;
>   		goto err_put_remote;
>   	}
> @@ -604,8 +600,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
>   	if (ret < 0) {
> -		DRM_DEV_ERROR(drm_dev->dev,
> -			      "failed to initialize encoder: %d\n", ret);
> +		drm_err(drm_dev,
> +			"failed to initialize encoder: %d\n", ret);
>   		goto err_put_remote;
>   	}
>   
> @@ -618,8 +614,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   					 &rockchip_lvds_connector_funcs,
>   					 DRM_MODE_CONNECTOR_LVDS);
>   		if (ret < 0) {
> -			DRM_DEV_ERROR(drm_dev->dev,
> -				      "failed to initialize connector: %d\n", ret);
> +			drm_err(drm_dev,
> +				"failed to initialize connector: %d\n", ret);
>   			goto err_free_encoder;
>   		}
>   
> @@ -633,9 +629,9 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   		connector = drm_bridge_connector_init(lvds->drm_dev, encoder);
>   		if (IS_ERR(connector)) {
> -			DRM_DEV_ERROR(drm_dev->dev,
> -				      "failed to initialize bridge connector: %pe\n",
> -				      connector);
> +			drm_err(drm_dev,
> +				"failed to initialize bridge connector: %pe\n",
> +				connector);
>   			ret = PTR_ERR(connector);
>   			goto err_free_encoder;
>   		}
> @@ -643,8 +639,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);
>   	if (ret < 0) {
> -		DRM_DEV_ERROR(drm_dev->dev,
> -			      "failed to attach encoder: %d\n", ret);
> +		drm_err(drm_dev, "failed to attach encoder: %d\n", ret);
>   		goto err_free_connector;
>   	}
>   
> @@ -706,24 +701,20 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
>   
>   	lvds->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>   						    "rockchip,grf");
> -	if (IS_ERR(lvds->grf)) {
> -		DRM_DEV_ERROR(dev, "missing rockchip,grf property\n");
> -		return PTR_ERR(lvds->grf);
> -	}
> +	if (IS_ERR(lvds->grf))
> +		return dev_err_probe(dev, PTR_ERR(lvds->grf), "missing rockchip,grf property\n");
>   
>   	ret = lvds->soc_data->probe(pdev, lvds);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "Platform initialization failed\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Platform initialization failed\n");
>   
>   	dev_set_drvdata(dev, lvds);
>   
>   	ret = component_add(&pdev->dev, &rockchip_lvds_component_ops);
>   	if (ret < 0)
> -		DRM_DEV_ERROR(dev, "failed to add component\n");
> +		return dev_err_probe(dev, ret, "failed to add component\n");
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static void rockchip_lvds_remove(struct platform_device *pdev)
