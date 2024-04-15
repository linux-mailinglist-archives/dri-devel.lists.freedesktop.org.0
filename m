Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64798A596F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 19:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D8911254C;
	Mon, 15 Apr 2024 17:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="i7Xw5asM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCEF11274A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 17:55:54 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.17.157]) by smtp.orange.fr with ESMTPA
 id wQYWrGoAULfMZwQYWrYCD1; Mon, 15 Apr 2024 19:55:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1713203752;
 bh=dW3oL+k/ZeNgRT3UGBFK7vTFs88VdDG5H8DfUFlIPC4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=i7Xw5asM45SBeb0bSeXC8Fp4smRGc53cIohAynnLwvuUEaaSJNcszOriVjf9r8bE3
 qiDhxY5wjQbGahF3VxFjJuD5DS7jYDU6j8gfZoVkYpp637XhqZWmp2SXTs6qQb9TUG
 1EyrI4WDInrQMBN7KLyy6BxQ+GzDeeR5uQW+OLQKXLUu+PDD+DQnbTxmOn/5DxvqGw
 nUYfc+qiXrN0O3DQKcIUHggNWWm9QCd5ELDJzb2m3BIIQxbCUTkinUt8V1Kh1wQZV+
 e9xSjB04woj4hLr3lz5E3b1ozYIKVMFjGM7wsUFESWSOy2WMMcWGZsgbk5NhAJQn59
 eXkspoh3YeLlg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Apr 2024 19:55:52 +0200
X-ME-IP: 86.243.17.157
Message-ID: <97189d64-0db1-4663-8a2e-c1a7c06a241c@wanadoo.fr>
Date: Mon, 15 Apr 2024 19:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for EDO RM69380 OLED panel
To: david@mainlining.org
Cc: airlied@gmail.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, marijn.suijten@somainline.org,
 mripard@kernel.org, neil.armstrong@linaro.org, phone-devel@vger.kernel.org,
 quic_jesszhan@quicinc.com, robh@kernel.org, sam@ravnborg.org,
 tzimmermann@suse.de, ~postmarketos/upstreaming@lists.sr.ht
References: <20240415-raydium-rm69380-driver-v2-0-524216461306@mainlining.org>
 <20240415-raydium-rm69380-driver-v2-2-524216461306@mainlining.org>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240415-raydium-rm69380-driver-v2-2-524216461306@mainlining.org>
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

Le 15/04/2024 à 18:10, David Wronek a écrit :
> Add support for the 2560x1600@90Hz OLED panel by EDO bundled with a
> Raydium RM69380 controller, as found on the Lenovo Xiaoxin Pad Pro 2021.
> 
> Signed-off-by: David Wronek <david-vu3DzTD92ROXwddmVfQv5g@public.gmane.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  14 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-raydium-rm69380.c | 366 ++++++++++++++++++++++++++
>   3 files changed, 381 insertions(+)
> 

...

> +static int rm69380_on(struct rm69380_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi[0];
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +	if (ctx->dsi[1])
> +		ctx->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0xd4);
> +	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
> +	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0xd0);
> +	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x26);
> +	mipi_dsi_dcs_write_seq(dsi, 0x75, 0x3f);
> +	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x1a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0x53, 0x28);
> +	mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x08);
> +	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0x51, 0x07, 0xff);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(36);

36 and 35 below are un-usual values for msleep.

Why 2 different values?
Would using a #define for this(these) value(s) make sense here?

> +
> +	return 0;
> +}
> +
> +static int rm69380_off(struct rm69380_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi[0];
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +	if (ctx->dsi[1])
> +		ctx->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(35);

(here)

> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);
> +
> +	return 0;
> +}

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
> +		dev_dbg(dev, "Using Dual-DSI\n");

This should be after de 'info' variable below, so...

> +
> +		const struct mipi_dsi_device_info info = { "RM69380", 0,
> +							   dsi_sec };
> +
> +		dev_dbg(dev, "Found second DSI `%s`\n", dsi_sec->name);

... maybe merge the 2 messages into something like:
       dev_dbg(dev, "Using Dual-DSI: found `%s`\n", dsi_sec->name);

> +
> +		dsi_sec_host = of_find_mipi_dsi_host_by_node(dsi_sec);
> +		of_node_put(dsi_sec);
> +		if (!dsi_sec_host) {
> +			return dev_err_probe(dev, -EPROBE_DEFER,
> +					     "Cannot get secondary DSI host\n");
> +		}
> +

Nit: unneeded { }

> +		ctx->dsi[1] =
> +			mipi_dsi_device_register_full(dsi_sec_host, &info);
> +		if (IS_ERR(ctx->dsi[1])) {
> +			return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
> +					     "Cannot get secondary DSI node\n");
> +		}

Nit: unneeded { }

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
> +			drm_panel_remove(&ctx->panel);
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach to DSI%d\n", i);

The error handling looks incomplete.
Previous mipi_dsi_attach() should be undone by a mipi_dsi_detach() as 
done in the remove function.

> +		}
> +	}
> +
> +	return 0;
> +}

...

CJ

