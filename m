Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346D8368E3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC88E10F487;
	Mon, 22 Jan 2024 15:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC8710F48D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:49:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 62F09CE2B0F;
 Mon, 22 Jan 2024 15:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EC4C43394;
 Mon, 22 Jan 2024 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705938552;
 bh=r9cek4TNL7iU3rGA42BnO85+Lfv74y24ZpIUL+KRyOo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JriZUrUsaiOjdmfIzlDf3LLVtL2vURl0xlTL/VeV3bl5xiB1Set2DdqzFs4kOULeK
 ly6Hrkmhmlj+QO8xetpJQ8h8DE4gNzHS6AxiRm9Lhy1yhZysh4d+8gF51AwwDNo88+
 hJIM1mf+JIosoMkg7R1mU/T0tdT7UIH68pZS1etofXNDpahLXw83VkJ2YXRkQtgmG4
 ude7J0UeDrh8xbsc+/0ipRt0wDd61mORuxFpNmT525n3iiVJQoEIG3qr2DkyOizP1x
 IrXKq6ye/vm6iQmh8PnaG3XsasTJWbVgO3ZJlc3lLs6WG4pW1sp6ueBQDxSwQ+y1I9
 cs0KHDHzt5WgQ==
Message-ID: <7cd4d9f9-e14a-4cd4-92f7-51c43acd23e2@kernel.org>
Date: Mon, 22 Jan 2024 16:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/bridge: add lvds controller support for sam9x7
Content-Language: en-US
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 manikandan.m@microchip.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240122082947.21645-1-dharma.b@microchip.com>
 <20240122082947.21645-3-dharma.b@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240122082947.21645-3-dharma.b@microchip.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux4microchip@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/01/2024 09:29, Dharma Balasubiramani wrote:
> Add a new LVDS controller driver for sam9x7 which does the following:
> - Prepares and enables the LVDS Peripheral clock
> - Defines its connector type as DRM_MODE_CONNECTOR_LVDS and adds itself
> to the global bridge list.
> - Identifies its output endpoint as panel and adds it to the encoder
> display pipeline
> - Enables the LVDS serializer
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---

...

> +
> +static int mchp_lvds_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mchp_lvds *lvds;
> +	struct resource *res;
> +	struct device_node *port;
> +	int ret;
> +
> +	if (!dev->of_node)
> +		return -ENODEV;
> +
> +	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> +	if (!lvds)
> +		return -ENOMEM;
> +
> +	lvds->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	lvds->regs = devm_ioremap_resource(lvds->dev, res);

Why not combining these two?

> +	if (IS_ERR(lvds->regs))
> +		return PTR_ERR(lvds->regs);
> +
> +	lvds->pclk = devm_clk_get(lvds->dev, "pclk");
> +	if (IS_ERR(lvds->pclk)) {
> +		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");

Handle properly deferred probe. What's DRM wrapper over dev_err_probe()?

> +		return PTR_ERR(lvds->pclk);
> +	}
> +
> +	ret = clk_prepare(lvds->pclk);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to prepare pclk_lvds\n");
> +		return ret;
> +	}
> +
> +	port = of_graph_get_remote_node(dev->of_node, 1, 0);
> +	if (!port) {
> +		DRM_DEV_ERROR(dev,
> +			      "can't find port point, please init lvds panel port!\n");
> +		return -EINVAL;
> +	}
> +
> +	lvds->panel = of_drm_find_panel(port);
> +	of_node_put(port);
> +
> +	if (IS_ERR(lvds->panel)) {
> +		DRM_DEV_ERROR(dev, "failed to find panel node\n");
> +		return -EPROBE_DEFER;

OK, that's for sure wrong. Don't print anything on deferred probe.

> +	}
> +
> +	lvds->panel_bridge = devm_drm_panel_bridge_add(dev, lvds->panel);
> +
> +	if (IS_ERR(lvds->panel_bridge))
> +		return PTR_ERR(lvds->panel_bridge);
> +
> +	lvds->bridge.of_node = dev->of_node;
> +	lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
> +	lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
> +
> +	dev_set_drvdata(dev, lvds);
> +	pm_runtime_enable(dev);
> +
> +	drm_bridge_add(&lvds->bridge);
> +
> +	return 0;
> +}
> +
> +static int mchp_lvds_remove(struct platform_device *pdev)
> +{
> +	struct mchp_lvds *lvds = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	clk_unprepare(lvds->pclk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mchp_lvds_dt_ids[] = {
> +	{
> +		.compatible = "microchip,sam9x7-lvds",
> +	},
> +	{},
> +};
> +
> +struct platform_driver mchp_lvds_driver = {
> +	.probe = mchp_lvds_probe,
> +	.remove = mchp_lvds_remove,
> +	.driver = {
> +		   .name = "microchip-lvds",
> +		   .of_match_table = mchp_lvds_dt_ids,
> +	},
> +};
> +module_platform_driver(mchp_lvds_driver);
> +
> +MODULE_AUTHOR("Manikandan Muralidharan <manikandan.m@microchip.com>");
> +MODULE_AUTHOR("Dharma Balasubiramani <dharma.b@microchip.com>");
> +MODULE_DESCRIPTION("Low Voltage Differential Signaling Controller Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:microchip-lvds");

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.


Best regards,
Krzysztof

