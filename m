Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0486B5BDD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 13:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A2410E13E;
	Sat, 11 Mar 2023 12:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DB910E13E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 12:38:56 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y15so577020lfa.7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 04:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678538334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U6GNVCYsVkEJkheLQcF7W0xxKL/2eVGz8WLI2GDDBzY=;
 b=EshV7VMlzrErX/XcoNWWXJbtghs7rdoa3iwo7hVWcBZo1UF+J7wnzK2r3ZmYX5t2am
 BLDCFraBHKAM1lAYuCkhviOugCdsWN5r8crwSLTvJAw+QQPxG7IFkH/gDmnGmPtTKfca
 HTL9O262PicGz+SVbhwbQn20gFugsQv3z1CH9GA1UOQuz3IhuHO0eXTrGeF8fXiuWPzb
 vNUax4axIGRS/xVzayB5ZW2Uh7FjVuE4GwrZvFDyiFDglk08aMMgVFt21W/e4YMgtqFi
 OGkLoPpzKOkUnXjLkePj9hK588XlRXr9z2Xi1B8vTJ7CkhpUQRoE86Ih687zGnUqdqrl
 Ivbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678538334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U6GNVCYsVkEJkheLQcF7W0xxKL/2eVGz8WLI2GDDBzY=;
 b=CwtZL128U4hp8arGIZVeYJHEBd89ne/w6mItphWcDrF762PmVg4wWD3mTd2b2aYkbW
 Di+r5FpBV+cqXehTzTGSXi64po4mIbl5cEqThJnQ6yBY+Ugx3QK3pbZsqb7+ftofhrWO
 LoIZZjTDiY9JV6znAo17a5Wed4e+cl7Isyo3lyF+jbYsyjB3JGzjD2Bn+PUMkLUzAjwy
 qz+GeL+mOIKptLY4CWctiZ8DiOc2oskqPhKpz14XtQasRWapdRr3fxgs5HzvsFVutawT
 lRy8ExKQKeBMsgi+hHKiLyEV1LZxh7VJaZeNlxzmqZeVr2Lc2HaLybrpZxpFbHFPY0JJ
 JaLw==
X-Gm-Message-State: AO0yUKXnQ2SRm3YZOLNplPYbwFp0ARjr3kVuxRSwiQH3SEEUsHvC8Qea
 fkl3v26oyzlHg9HYuoeXJnoCFA==
X-Google-Smtp-Source: AK7set/Vf28xh6snK9V6Ywov49da2lm6HlGDCAblKmeWGvXee8O9ykMJfpxafGPhNgiqy9YtjzMgsw==
X-Received: by 2002:ac2:5637:0:b0:4b6:e405:1027 with SMTP id
 b23-20020ac25637000000b004b6e4051027mr1605897lff.14.1678538334505; 
 Sat, 11 Mar 2023 04:38:54 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a19ac47000000b0048a982ad0a8sm308626lfc.23.2023.03.11.04.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Mar 2023 04:38:54 -0800 (PST)
Message-ID: <904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org>
Date: Sat, 11 Mar 2023 13:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230311123231.20771-1-lujianhua000@gmail.com>
 <20230311123231.20771-2-lujianhua000@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230311123231.20771-2-lujianhua000@gmail.com>
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



On 11.03.2023 13:32, Jianhua Lu wrote:
> Add a driver for panels using the Novatek NT36523 display driver IC.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
[...]

> +
> +static int nt36523_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int i;
> +
> +	for (i = 0; i < pinfo->desc->num_modes; i++) {
> +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
> +		struct drm_display_mode *mode;
> +
> +		mode = drm_mode_duplicate(connector->dev, m);
> +		if (!mode) {
> +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> +			return -ENOMEM;
> +		}
> +
> +		mode->type = DRM_MODE_TYPE_DRIVER;
> +		if (pinfo->desc->num_modes == 1)
> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
That's not quite correct, as that means "if you have more than one
defined panel mode (say 60Hz and 120 Hz), there will be no preferred one".

Konrad
> +
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
> +		if (!dsi1_host)
> +			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
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
