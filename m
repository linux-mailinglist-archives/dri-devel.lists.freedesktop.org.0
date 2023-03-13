Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936816B7B7A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFACD10E565;
	Mon, 13 Mar 2023 15:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D0710E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:07:06 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l1so11615575wry.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678720024;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rL0BVB8yVy8g/X8namDJv2PpxvDd9rucVVAjV+eFu6o=;
 b=QdvONbThyVV+DBa82xY+qATxzVRSdW19SJKlN6Hz5DnjXIrQSONJHbdAgw8bcTlcrZ
 +PvrjWsDdOFx58QY7Nmx2df0YyG4ZlmxJTuqI3dhz+TYsHhm+yDdvut1LHUJ6sav/+i9
 3FFo5zRuipP46qVwAo4bHbqv+U/Uh8JhVyrVTXFcuR20coGS8o0oR+ic4hpVUUrtEZsZ
 YZruecmIwGhqq63FGTDY7cOgub538/mhLNO0UN9SlVbdse4/oBqyQ1jO8aVhyoWy/ELA
 WRnJeIcgWKvTsWHMLcN/QDwto/dvGM5quM5sm//pY0lGHqClmp+G/1W6NpjcyAjiHVke
 bktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678720024;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rL0BVB8yVy8g/X8namDJv2PpxvDd9rucVVAjV+eFu6o=;
 b=vZszM1LLoIVUcT2/kzxcUClL2r24TaInWsl8+hrk2tR8M0oMFpYDKW9k62kG4S/BBC
 scBmXNfl2G4ChF+1aRcHRPdIUqhnR81rFE/AdnGiojte44TG7T8bPr2RjjwxN+gXuozn
 PSwArSAgNrHm+lNvIl62A1UPsADoKAeWRYD5qLCXwNPbUKpwu68F7Wr8y8vK2g4ycZAE
 c/PKhRXwur3jac/P/pFv0ICnqRe1qiFVxD3xt+N4gWySQd0hD+pWsLy/MnP606CfMdR8
 EYrNVonXok5TRPg6euMCDtVDAtO7tBl3Slv6HPhv9+Uj06jk7wwx1iGX/71j40Ldom0g
 mGhA==
X-Gm-Message-State: AO0yUKUf/sT9PSfn0U1102nba9B7PhaPet3liDg+f/3OK/B959hQUboE
 8YLT0EYxVpjpoq/3CXLP6IQCXQ==
X-Google-Smtp-Source: AK7set/f7u+i1UBCcCechI+MsKU/Gzy0aH7VNngoqD0zLJHy0+QcWOtz7jNei/9qeKH0bDndP+/mQw==
X-Received: by 2002:a05:6000:1c2:b0:2ce:a944:1d9b with SMTP id
 t2-20020a05600001c200b002cea9441d9bmr4056571wrx.58.1678720024276; 
 Mon, 13 Mar 2023 08:07:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c08:f9:c8f6:bc87?
 ([2a01:e0a:982:cbb0:5c08:f9:c8f6:bc87])
 by smtp.gmail.com with ESMTPSA id
 e3-20020adfdbc3000000b002c55efa9cbesm8394912wrj.39.2023.03.13.08.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 08:07:03 -0700 (PDT)
Message-ID: <598f95a4-5379-ce03-09fe-9b68dbada0fc@linaro.org>
Date: Mon, 13 Mar 2023 16:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230313101858.14611-1-lujianhua000@gmail.com>
 <20230313101858.14611-2-lujianhua000@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230313101858.14611-2-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/03/2023 11:18, Jianhua Lu wrote:
> Add a driver for panels using the Novatek NT36523 display driver IC.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v6:
>    - Make the first mode to be DRM_MODE_TYPE_PREFERRED.
> 
> Changes in v5:
>    - use lowercase hex for init sequence
>    - fix code style
>    - enable DRM_MODE_TYPE_PREFERRED if where is only one mode.
> 
> Changes in v4:
>    - add multiple modes support
>    - use dev_err_probe helper
>    - fix dsi_info type string
>    - reimplement mipi_dsi_dual_dcs_write_seq() macro
> 
> Changes in v3:
>    - Refactor source code
> 
> Changes in v2:
>    - Refactor and clean up source code
> 
>   MAINTAINERS                                   |   7 +
>   drivers/gpu/drm/panel/Kconfig                 |  10 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 777 ++++++++++++++++++
>   4 files changed, 795 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36523.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5383af5d3b45..3586248bb05d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6537,6 +6537,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
>   F:	drivers/gpu/drm/panel/panel-novatek-nt35560.c
>   
> +DRM DRIVER FOR NOVATEK NT36523 PANELS
> +M:	Jianhua Lu <lujianhua000@gmail.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +
>   DRM DRIVER FOR NOVATEK NT36672A PANELS
>   M:	Sumit Semwal <sumit.semwal@linaro.org>
>   S:	Maintained
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 8eeee71c0000..268508743b5c 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -377,6 +377,16 @@ config DRM_PANEL_NOVATEK_NT35950
>   	  Sharp panels used in Sony Xperia Z5 Premium and XZ Premium
>   	  mobile phones.
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
>   config DRM_PANEL_NOVATEK_NT36672A
>   	tristate "Novatek NT36672A DSI panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index c05aa9e23907..570eab8bf2b2 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>   obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> new file mode 100644
> index 000000000000..d30dbbfb67b1
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -0,0 +1,777 @@
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
> +
> +struct panel_info {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi[2];
> +	const struct panel_desc *desc;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct backlight_device *backlight;
> +	struct regulator *vddio;
> +
> +	bool prepared;
> +};
> +
> +struct panel_desc {
> +	unsigned int width_mm;
> +	unsigned int height_mm;
> +
> +	unsigned int bpc;
> +	unsigned int lanes;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +
> +	const struct drm_display_mode *modes;
> +	unsigned int num_modes;
> +	const struct mipi_dsi_device_info dsi_info;
> +	int (*init_sequence)(struct panel_info *pinfo);
> +
> +	bool is_dual_dsi;
> +};
> +
> +static inline struct panel_info *to_panel_info(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct panel_info, panel);
> +}
> +
> +static int elish_boe_init_sequence(struct panel_info *pinfo)
> +{
> +	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
> +	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
> +	/* No datasheet, so write magic init sequence directly */
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x47);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x47);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x47);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd2, 0x30);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x49);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x76, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x77, 0x49);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x49);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x49);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x49);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x04);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x49);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x04);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x59);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x48);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x43);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x3c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x43);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x3c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x43);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x3c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd7, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdc, 0x43);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdd, 0x3c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe1, 0x43);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe2, 0x3c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf2, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf3, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf4, 0x48);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x13, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x23);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x23);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x97, 0x3c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x98, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x99, 0x95);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9b, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9c, 0x0b);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9d, 0x0a);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9e, 0x90);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa3, 0x50);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x60);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0xc0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
> +	msleep(70);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
> +
> +	return 0;
> +}
> +
> +static int elish_csot_init_sequence(struct panel_info *pinfo)
> +{
> +	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
> +	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
> +	/* No datasheet, so write magic init sequence directly */
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x30);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0x40);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x55, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x46);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x46);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x46);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x4d);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x4b);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x96);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x4b);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x07);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x4b);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x07);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x5c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x3f);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x40);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x40);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x08);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x40);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x1c);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
> +	msleep(70);
> +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode elish_boe_modes[] = {
> +	{
> +		/* There is only one 120 Hz timing, but it doesn't work perfectly, 104 Hz preferred */
> +		.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
> +		.hdisplay = 1600,
> +		.hsync_start = 1600 + 60,
> +		.hsync_end = 1600 + 60 + 8,
> +		.htotal = 1600 + 60 + 8 + 60,
> +		.vdisplay = 2560,
> +		.vsync_start = 2560 + 26,
> +		.vsync_end = 2560 + 26 + 4,
> +		.vtotal = 2560 + 26 + 4 + 168,
> +	},
> +};
> +
> +static const struct drm_display_mode elish_csot_modes[] = {
> +	{
> +		/* There is only one 120 Hz timing, but it doesn't work perfectly, 104 Hz preferred */
> +		.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
> +		.hdisplay = 1600,
> +		.hsync_start = 1600 + 200,
> +		.hsync_end = 1600 + 200 + 40,
> +		.htotal = 1600 + 200 + 40 + 52,
> +		.vdisplay = 2560,
> +		.vsync_start = 2560 + 26,
> +		.vsync_end = 2560 + 26 + 4,
> +		.vtotal = 2560 + 26 + 4 + 168,
> +	},
> +};
> +
> +static const struct panel_desc elish_boe_desc = {
> +	.modes = elish_boe_modes,
> +	.num_modes = ARRAY_SIZE(elish_boe_modes),
> +	.dsi_info = {
> +		.type = "BOE-elish",
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
> +static const struct panel_desc elish_csot_desc = {
> +	.modes = elish_csot_modes,
> +	.num_modes = ARRAY_SIZE(elish_csot_modes),
> +	.dsi_info = {
> +		.type = "CSOT-elish",
> +		.channel = 0,
> +		.node = NULL,
> +	},
> +	.width_mm = 127,
> +	.height_mm = 203,
> +	.bpc = 8,
> +	.lanes = 3,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.init_sequence = elish_csot_init_sequence,
> +	.is_dual_dsi = true,
> +};
> +
> +static void nt36523_reset(struct panel_info *pinfo)
> +{
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> +	usleep_range(12000, 13000);
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
> +	usleep_range(12000, 13000);
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> +	usleep_range(12000, 13000);
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
> +	usleep_range(12000, 13000);
> +}
> +
> +static int nt36523_prepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int ret;
> +
> +	if (pinfo->prepared)
> +		return 0;
> +
> +	ret = regulator_enable(pinfo->vddio);
> +	if (ret) {
> +		dev_err(panel->dev, "failed to enable vddio regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	nt36523_reset(pinfo);
> +
> +	ret = pinfo->desc->init_sequence(pinfo);
> +	if (ret < 0) {
> +		regulator_disable(pinfo->vddio);
> +		dev_err(panel->dev, "failed to initialize panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pinfo->prepared = true;
> +
> +	return 0;
> +}
> +
> +static int nt36523_disable(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +	int i, ret;
> +
> +	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
> +		ret = mipi_dsi_dcs_set_display_off(pinfo->dsi[i]);
> +		if (ret < 0)
> +			dev_err(&pinfo->dsi[i]->dev, "failed to set display off: %d\n", ret);
> +	}
> +
> +	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
> +		ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->dsi[i]);
> +		if (ret < 0)
> +			dev_err(&pinfo->dsi[i]->dev, "failed to enter sleep mode: %d\n", ret);
> +	}
> +
> +	msleep(70);
> +
> +	return 0;
> +}
> +
> +static int nt36523_unprepare(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +
> +	if (!pinfo->prepared)
> +		return 0;
> +
> +	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
> +	regulator_disable(pinfo->vddio);
> +
> +	pinfo->prepared = false;
> +
> +	return 0;
> +}
> +
> +static void nt36523_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(pinfo->dsi[0]);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI0 host: %d\n", ret);
> +
> +	if (pinfo->desc->is_dual_dsi) {
> +		ret = mipi_dsi_detach(pinfo->dsi[1]);
> +		if (ret < 0)
> +			dev_err(&pinfo->dsi[1]->dev, "failed to detach from DSI1 host: %d\n", ret);
> +		mipi_dsi_device_unregister(pinfo->dsi[1]);
> +	}
> +
> +	drm_panel_remove(&pinfo->panel);
> +}
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
> +		if (i == 0)
> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
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


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
