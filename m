Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD136B058F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B58810E040;
	Wed,  8 Mar 2023 11:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B04610E5B9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 11:13:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id n2so20811313lfb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 03:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678274035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dx9TBjiLxyBlYa7HZNp/7XOFpGVuez2eBR6EoiqkqNg=;
 b=CxJGXXdy0aSdXxZ4cXR9mdGpRrFm1IcJqQ5mnUI9LWGS8U81XeOrdqdSpDzzKoxw9l
 aMUK1DGTto7iQmbRnZLx/jbPgJZTTawgLGxMf59ROOC3VpfXr+k89cO3hiow+OW6uyvo
 HGqq1HQP5sy6+WJHA+YyfNYt95Jni1K5/wjazbpBMncqWpzU6elk+DAnfpQ2BWlbkZgD
 vRgKRc/bO3H9/eFQ+ojVkz+navST+xglkEvsQzJHWXVsM1lvEenF+CYEHPBn772V8eCq
 jKbOhpZjVWx264rZteXSmh4oDKNHjzODMI27t4NFY8P8DAePJon7gddXJPHBq4hC7ctT
 7pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678274035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dx9TBjiLxyBlYa7HZNp/7XOFpGVuez2eBR6EoiqkqNg=;
 b=XQ3LoZK+aoe3CtjB+E+oXMTYBdpJDbjs+6cLN/51b7SbpCchrvCco3YryR/AvD6TMO
 o2MYY5UYBOqDxuZLhJws5dG7a/j2IBBFFGM6Zh30SkPhAXR6PZtCe6FKzUwIki6Rsnsa
 brD4SClAiyOzaiEELAe+rCZJXQoTSIlHgb0iI51DQ79AyMQNvB0MfDoy90k0o1flx9wX
 W6gyZKtZEGzLQ6rQW9jIlRzR9v5Sn0YCr/feUhRj6/wMztlzhCcqMSpeubCyYrPd6QEG
 NFlOPzerq+5lDV88LrQM78AXFpcjiw7qMfVtyFuPjwXoflCKQsbYJ4FfJ1zVYuyYkd0P
 tgIw==
X-Gm-Message-State: AO0yUKWcIbaJRoLtd+8ENAJKxAItG8YHeAs0M1GqWQPWb357y8pm40tf
 7cq8RDkvrjfbT9vpWYwOwL3v5g==
X-Google-Smtp-Source: AK7set/qQ7inT93HAhK/w8G+hyRVpqzgpS5oDwb81oacAUEi86ChHNK67BNCyMaMY6vOPagNP5Kqbw==
X-Received: by 2002:a05:6512:25b:b0:4dd:ab39:86e0 with SMTP id
 b27-20020a056512025b00b004ddab3986e0mr5702092lfo.27.1678274035340; 
 Wed, 08 Mar 2023 03:13:55 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a056512041000b004cafe65883dsm2298293lfk.122.2023.03.08.03.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 03:13:54 -0800 (PST)
Message-ID: <66d293a8-f850-cb80-0c83-2ebf7e29d0c2@linaro.org>
Date: Wed, 8 Mar 2023 12:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230308043706.16318-1-lujianhua000@gmail.com>
 <20230308043706.16318-2-lujianhua000@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308043706.16318-2-lujianhua000@gmail.com>
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



On 8.03.2023 05:37, Jianhua Lu wrote:
> Add a driver for panels using the Novatek NT36523 display driver IC.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v3:
>   - Refactor source code
> 
> Changes in v2:
>   - Refactor and clean up source code
This is a veeery vague changelog, akin to "change patch", please
be more specific the next time around.


[...]

> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -0,0 +1,770 @@
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
> +/* Macro modified from mipi_dual_dsi_dcs_write_seq */
> +#define mipi_dual_dsi_dcs_write_seq(dsi, cmd, seq...)           	   \
> +	do {                                                               \
> +		static const u8 d[] = { cmd, seq };                        \
> +		int i, ret;                                                \
> +		for (i = 0; i < ARRAY_SIZE(dsi); i++) {                    \
> +			ret = mipi_dsi_dcs_write_buffer(dsi[i], d, ARRAY_SIZE(d));    \
> +			if (ret < 0) {                                             \
> +				dev_err_ratelimited(                               \
> +					&dsi[i]->dev, "sending command %#02x failed: %d\n", \
> +					cmd, ret);                                 \
> +				return ret;                                        \
> +			}                                                          \
> +		}                                                                  \
> +	} while (0)
> +
This should definitely be put in a common file..


> +static const struct drm_display_mode elish_boe_mode = {
> +	/* Current max freqency is 104HZ, TODO 120HZ */
Is it a DPU issue, or does the panel not work correctly when you
jack up the clocks? Did you use the correct init sequence and porches
for the 120Hz mode, including the mode switch command set?

Could you also implement a 60 (or whatever other value is also
implemented downstream) Hz mode?

> +	.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
> +	.hdisplay = 1600,
> +	.hsync_start = 1600 + 60,
> +	.hsync_end = 1600 + 60 + 8,
> +	.htotal = 1600 + 60 + 8 + 60,
> +	.vdisplay = 2560,
> +	.vsync_start = 2560 + 26,
> +	.vsync_end = 2560 + 26 + 4,
> +	.vtotal = 2560 + 26 + 4 + 168,
> +};
> +
> +static const struct drm_display_mode elish_csot_mode = {
> +	/* Current max freqency is 104HZ, TODO 120HZ */
> +	.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
> +	.hdisplay = 1600,
> +	.hsync_start = 1600 + 200,
> +	.hsync_end = 1600 + 200 + 40,
> +	.htotal = 1600 + 200 + 40 + 52,
> +	.vdisplay = 2560,
> +	.vsync_start = 2560 + 26,
> +	.vsync_end = 2560 + 26 + 4,
> +	.vtotal = 2560 + 26 + 4 + 168,
> +};
> +
> +static const struct panel_desc elish_boe_desc = {
> +	.modes = &elish_boe_mode,
> +	.dsi_info = {
> +		.type = "NT36523",
That's a bit vague, the driver IC is not very telling about the
panel itself. Since we're not able to determine much more information,
this could contain the panel manufacturer and the device name.

> +		.channel = 0,
> +		.node = NULL,
> +	},
> +	.width_mm = 127,
> +	.height_mm = 203,
> +	.bpc = 8,
> +	.lanes = 3,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.init_sequence = elish_boe_init_sequence,
> +	.is_dual_dsi = true,
> +};
> +
[...]

> +static int nt36523_probe(struct mipi_dsi_device *dsi)
> +{
[...]

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
Shouldn't you put the reference only if it's found?

> +		if (!dsi1_host) {
> +			dev_err(dev, "cannot get secondary DSI host\n");
> +			return -EPROBE_DEFER;
dev_err_probe, here and in neighbouring exit return paths?


Konrad
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
