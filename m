Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D5A6B4FD9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 19:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B59F10E9D6;
	Fri, 10 Mar 2023 18:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861C310E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 18:10:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id h9so6216386ljq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 10:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M46Ypt24nBb7PiPePkRiWJ0mAqFjlBx1ci9a7ayJTZs=;
 b=xt73l++1dpEFS7++Mfaw/PElqS7u14ponezDnY0eB3IciL8vhPxb7X6EPKPSsKuNdS
 oE2Vch8kNYX5b6B8iSUj04okwSwz9N2g46voP4MRkLSfDoSlj6JWykuhn2W1O27EAStU
 BlApQ39pcStrP+owZQ/Ff/88oNA1siLHUfYrNGyYjDW6H8XzCmKEoBv2ZDu0hsDClY7+
 SDoVYzX1RmiUnUtyLmVurkjJjr9WabqYXbTqtT5w9xIqgYurRsjfc9mk2ZMeNqs6rHDm
 moQpieYlzUXu1IrB/Qvj8aqMP4Rs/BrVANH4a5yvxy3cWADEZ3sSVmE5euD1Q+wnq3qN
 YUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M46Ypt24nBb7PiPePkRiWJ0mAqFjlBx1ci9a7ayJTZs=;
 b=1sJE+KdVuB93BKPIwk0YVz07+2LnNA9QHSbM4uZTVh/2ZVGOC39ajf7bKTGe/jz1nZ
 /obxq50pwwNWj409qdhafeH56tp+Lyeh6juikceuoCJ7Jc8PtfRpK+IUChqUCQxWkDc/
 dUclGT1euVQlO5jpEQ1u6OBjwr+ER/yvcfWRMPszGAzYaFwN9I9bSFcoWslc9XrGwXBf
 sTPotsh+PMCUwg2qH42ydqYP6nmXWwBAkVwAOBNi46xd2NFnn8AMNrGGnxNmCvSOzxoA
 8nhRBzp9YCoBdUWdHiczPiARqVM8KJkpmLsaJODZWCFXlOMm+iobV9uKzvULgTdAo++X
 Dwsw==
X-Gm-Message-State: AO0yUKVABRHsGXW0ADLZnRSY3jG9HPk+lq5/6mslSlfJn9LmDwg07Mcz
 UDeS7yMHIhE8zxX/8T0vlni4pA==
X-Google-Smtp-Source: AK7set8TBrhWDnnqeV6ZMAgkMrJsGMtuojst6Ogp8An+BFYvB0QyN1zuACfjkrI6CmLsnKOsVv9o2w==
X-Received: by 2002:a2e:b173:0:b0:295:b054:6809 with SMTP id
 a19-20020a2eb173000000b00295b0546809mr8407884ljm.8.1678471832596; 
 Fri, 10 Mar 2023 10:10:32 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a2ea1cc000000b00295a9be8764sm81063ljm.117.2023.03.10.10.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 10:10:31 -0800 (PST)
Message-ID: <6539f132-c740-b9b6-8810-0affd6ab91ba@linaro.org>
Date: Fri, 10 Mar 2023 19:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230310132144.2241-1-lujianhua000@gmail.com>
 <20230310132144.2241-2-lujianhua000@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230310132144.2241-2-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.03.2023 14:21, Jianhua Lu wrote:
> Add a driver for panels using the Novatek NT36523 display driver IC.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v4:
>   - add multiple modes support
>   - use dev_err_probe helper
>   - fix dsi_info type string
>   - reimplement mipi_dsi_dual_dcs_write_seq() macro
> 
> Changes in v3:
>   - Refactor source code
> 
> Changes in v2:
>   - Refactor and clean up source code
> 
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 771 ++++++++++++++++++
>  4 files changed, 789 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36523.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5383af5d3b45..3586248bb05d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6537,6 +6537,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
>  F:	drivers/gpu/drm/panel/panel-novatek-nt35560.c
>  
> +DRM DRIVER FOR NOVATEK NT36523 PANELS
> +M:	Jianhua Lu <lujianhua000@gmail.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +
>  DRM DRIVER FOR NOVATEK NT36672A PANELS
>  M:	Sumit Semwal <sumit.semwal@linaro.org>
>  S:	Maintained
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 8eeee71c0000..268508743b5c 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -377,6 +377,16 @@ config DRM_PANEL_NOVATEK_NT35950
>  	  Sharp panels used in Sony Xperia Z5 Premium and XZ Premium
>  	  mobile phones.
>  
> +config DRM_PANEL_NOVATEK_NT36523
> +	tristate "Novatek NT36523 panel driver"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the panels built
> +	  around the Novatek NT36523 display controller, such as some
> +	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
> +
>  config DRM_PANEL_NOVATEK_NT36672A
>  	tristate "Novatek NT36672A DSI panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index c05aa9e23907..570eab8bf2b2 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>  obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> new file mode 100644
> index 000000000000..78232c2735ff
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -0,0 +1,771 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Novatek NT36523 DriverIC panels driver
> + *
> + * Copyright (c) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +#define DSI_NUM_MIN 1
> +
> +#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
> +		do {                                                 \
> +			mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> +			mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> +		} while (0)
This should be in the same file as mipi_dsi_dcs_write_seq, imo

[...]

> +static int elish_boe_init_sequence(struct panel_info *pinfo)
> +{
> +	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
> +	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
> +	/* No datasheet, so write magic init sequence directly */
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xFF, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xFB, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xB9, 0x05);
Non-#defines should use lowercase hex

[...]

> +	msleep(70);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
> +	return 0;
I think it's a general practice to add a newline before the return
statement, but that's just a nit that triggered my OCD..

[...]

> +			       struct drm_connector *connector)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int i;
> +
> +	for (i =0; i < pinfo->desc->num_modes; i++) {
missing space after =
> +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
> +		struct drm_display_mode *mode;
Missing newline between declarations and code

> +		mode = drm_mode_duplicate(connector->dev, m);
> +		if (!mode) {
> +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> +			return -ENOMEM;
> +		}
> +		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
DRM_MODE_TYPE_PREFERRED: Preferred mode, usually the native resolution of an LCD panel. There should only be one preferred mode per connector at any given time.

https://docs.kernel.org/gpu/drm-kms.html

I'd suggest adding something like:

if (i == 0)
	mode->type |= DRM_MODE_TYPE_PREFERRED


I think I've ran out of things to complain about.. And that's
a good thing! :D

Konrad
> +		drm_mode_set_name(mode);
> +		drm_mode_probed_add(connector, mode);
> +	}
> +
> +	connector->display_info.width_mm = pinfo->desc->width_mm;
> +	connector->display_info.height_mm = pinfo->desc->height_mm;
> +	connector->display_info.bpc = pinfo->desc->bpc;
> +
> +	return pinfo->desc->num_modes;
> +}
> +
> +static const struct drm_panel_funcs nt36523_panel_funcs = {
> +	.disable = nt36523_disable,
> +	.prepare = nt36523_prepare,
> +	.unprepare = nt36523_unprepare,
> +	.get_modes = nt36523_get_modes,
> +};
> +
> +static int nt36523_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct device_node *dsi1;
> +	struct mipi_dsi_host *dsi1_host;
> +	struct panel_info *pinfo;
> +	const struct mipi_dsi_device_info *info;
> +	int i, ret;
> +
> +	pinfo = devm_kzalloc(dev, sizeof(*pinfo), GFP_KERNEL);
> +	if (!pinfo)
> +		return -ENOMEM;
> +
> +	pinfo->vddio = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(pinfo->vddio))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->vddio), "failed to get vddio regulator\n");
> +
> +	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pinfo->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio), "failed to get reset gpio\n");
> +
> +	pinfo->desc = of_device_get_match_data(dev);
> +	if (!pinfo->desc)
> +		return -ENODEV;
> +
> +	/* If the panel is dual dsi, register DSI1 */
> +	if (pinfo->desc->is_dual_dsi) {
> +		info = &pinfo->desc->dsi_info;
> +
> +		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> +		if (!dsi1) {
> +			dev_err(dev, "cannot get secondary DSI node.\n");
> +			return -ENODEV;
> +		}
> +
> +		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
> +		of_node_put(dsi1);
> +		if (!dsi1_host) {
> +			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
> +		}
> +
> +		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi1_host, info);
> +		if (!pinfo->dsi[1]) {
> +			dev_err(dev, "cannot get secondary DSI device\n");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	pinfo->dsi[0] = dsi;
> +	mipi_dsi_set_drvdata(dsi, pinfo);
> +	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
> +
> +	ret = drm_panel_of_backlight(&pinfo->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get backlight\n");
> +
> +	drm_panel_add(&pinfo->panel);
> +
> +	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
> +		pinfo->dsi[i]->lanes = pinfo->desc->lanes;
> +		pinfo->dsi[i]->format = pinfo->desc->format;
> +		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
> +
> +		ret = mipi_dsi_attach(pinfo->dsi[i]);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "cannot attach to DSI%d host.\n", i);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id nt36523_of_match[] = {
> +	{
> +		.compatible = "xiaomi,elish-boe-nt36523",
> +		.data = &elish_boe_desc,
> +	},
> +	{
> +		.compatible = "xiaomi,elish-csot-nt36523",
> +		.data = &elish_csot_desc,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, nt36523_of_match);
> +
> +static struct mipi_dsi_driver nt36523_driver = {
> +	.probe = nt36523_probe,
> +	.remove = nt36523_remove,
> +	.driver = {
> +		.name = "panel-novatek-nt36523",
> +		.of_match_table = nt36523_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(nt36523_driver);
> +
> +MODULE_AUTHOR("Jianhua Lu <lujianhua000@gmail.com>");
> +MODULE_DESCRIPTION("DRM driver for Novatek NT36523 based MIPI DSI panels");
> +MODULE_LICENSE("GPL");
