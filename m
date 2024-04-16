Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D88A7587
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829C510E3BE;
	Tue, 16 Apr 2024 20:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tyXNSo8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B3E10F319
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:28:05 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.17.157]) by smtp.orange.fr with ESMTPA
 id wpPIr4rKwJyTUwpPIrI9PX; Tue, 16 Apr 2024 22:28:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1713299283;
 bh=6NAIXi4V2CyDIBGCO7IWkHyMEgnTzqCwkzfq/h/mMuw=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=tyXNSo8B7EnAUKS1e+KW+mkiLn1/6R8tzRJ+fpQg0WsbOpEndvwU4n181hvn30gsE
 zg/UcWYOGd1CX2OgsUTbDn0DL3tlsj7MDwzWJ1v9l6YCNLldcoSvIaCGEP5QXnG9y5
 GzqPA8/PUEjZUPb/5ZWAbSqLw2o00rXCXUFsPBL/IofzMo4pfWPcXBXF+q7q+pBhzH
 q3eiduhBMxD1FBI+P8HCjlB85APKc22jSD7yf96Fj0Cd34/kxy2iE1ULtCrgWV/Uro
 wkelgnH/oOmNEUqoOPyD9DIqGjQzOf1cNzabljZr+JgK/QOnsFLRUxSKhbHAvF4BTT
 qlDwuzv6tDDlg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 16 Apr 2024 22:28:03 +0200
X-ME-IP: 86.243.17.157
Message-ID: <a92ea6be-d518-4e8a-86a3-1985ff54a24a@wanadoo.fr>
Date: Tue, 16 Apr 2024 22:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for EDO RM69380 OLED panel
To: david@mainlining.org
Cc: conor+dt@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 marijn.suijten@somainline.org, mripard@kernel.org,
 neil.armstrong@linaro.org, phone-devel@vger.kernel.org,
 quic_jesszhan@quicinc.com, robh@kernel.org, sam@ravnborg.org,
 tzimmermann@suse.de, ~postmarketos/upstreaming@lists.sr.ht
References: <20240416-raydium-rm69380-driver-v3-0-21600ac4ce5f@mainlining.org>
 <20240416-raydium-rm69380-driver-v3-2-21600ac4ce5f@mainlining.org>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240416-raydium-rm69380-driver-v3-2-21600ac4ce5f@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 16/04/2024 à 20:30, David Wronek a écrit :
> Add support for the 2560x1600@90Hz OLED panel by EDO bundled with a
> Raydium RM69380 controller, as found on the Lenovo Xiaoxin Pad Pro 2021.
> 
> Signed-off-by: David Wronek <david-vu3DzTD92ROXwddmVfQv5g@public.gmane.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  14 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-raydium-rm69380.c | 367 ++++++++++++++++++++++++++
>   3 files changed, 382 insertions(+)
> 

...

> +static int rm69380_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct mipi_dsi_host *dsi_sec_host;
> +	struct rm69380_panel *ctx;
> +	struct device *dev = &dsi->dev;
> +	struct device_node *dsi_sec;
> +	int ret, i;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->supplies[0].supply = "vddio";
> +	ctx->supplies[1].supply = "avdd";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	dsi_sec = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> +
> +	if (dsi_sec) {
> +		const struct mipi_dsi_device_info info = { "RM69380", 0,
> +							   dsi_sec };
> +
> +		dev_dbg(dev, "Using Dual-DSI: found `%s`\n", dsi_sec->name);
> +
> +		dsi_sec_host = of_find_mipi_dsi_host_by_node(dsi_sec);
> +		of_node_put(dsi_sec);
> +		if (!dsi_sec_host)
> +			return dev_err_probe(dev, -EPROBE_DEFER,
> +					     "Cannot get secondary DSI host\n");
> +
> +		ctx->dsi[1] =
> +			devm_mipi_dsi_device_register_full(dev, dsi_sec_host, &info);
> +		if (IS_ERR(ctx->dsi[1]))
> +			return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
> +					     "Cannot get secondary DSI node\n");
> +
> +		dev_dbg(dev, "Second DSI name `%s`\n", ctx->dsi[1]->name);
> +		mipi_dsi_set_drvdata(ctx->dsi[1], ctx);
> +	} else {
> +		dev_dbg(dev, "Using Single-DSI\n");
> +	}
> +
> +	ctx->dsi[0] = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	drm_panel_init(&ctx->panel, dev, &rm69380_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = rm69380_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++) {
> +		if (!ctx->dsi[i])
> +			continue;
> +
> +		dev_dbg(&ctx->dsi[i]->dev, "Binding DSI %d\n", i);
> +
> +		ctx->dsi[i]->lanes = 4;
> +		ctx->dsi[i]->format = MIPI_DSI_FMT_RGB888;
> +		ctx->dsi[i]->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +					  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +		ret = mipi_dsi_attach(ctx->dsi[i]);
> +		if (ret < 0) {
> +			mipi_dsi_detach(ctx->dsi[i]);

I don't think this works.
if 'i' fails, you have to detach 0...i-1

maybe something like below (complety untested).

> +			drm_panel_remove(&ctx->panel);
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach to DSI%d\n", i);
> +		}
> +	}
> +
> +	return 0;
> +}


	drm_panel_add(&ctx->panel);

	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++) {
		if (!ctx->dsi[i])
			continue;

		dev_dbg(&ctx->dsi[i]->dev, "Binding DSI %d\n", i);

		ctx->dsi[i]->lanes = 4;
		ctx->dsi[i]->format = MIPI_DSI_FMT_RGB888;
		ctx->dsi[i]->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
					  MIPI_DSI_CLOCK_NON_CONTINUOUS;

		ret = mipi_dsi_attach(ctx->dsi[i]);
		if (ret < 0) {
			dev_err_probe(dev, ret,
				      "Failed to attach to DSI%d\n", i);
			goto err_detach_dsi;
		}
	}

	return 0;

err_detach_dsi:
	while (--i >= 0)
		if (ctx->dsi[i])
			mipi_dsi_detach(ctx->dsi[i]);

	drm_panel_remove(&ctx->panel);

	return ret;
}


