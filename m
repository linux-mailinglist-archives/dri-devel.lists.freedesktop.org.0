Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A4D8D7111
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 18:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861BA10E0F3;
	Sat,  1 Jun 2024 16:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ra22yzRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8691C10E0F3
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 16:23:43 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ea9386cde0so24059821fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717259021; x=1717863821; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AFYbHI/iftzeCVZcgyHEUN23jefa2GL40WdI+hSfcUY=;
 b=ra22yzRry2qvkVcMhSPCD8A+7GEA12LywGT4IJw6GPilhjSpP9Kx1wK4cLfNMEjXAi
 uhQeqaZ7C6t1UJbIP+hPZwB33jmKV6bkxR6p6sjczkNDhMkPS/oKBGE2PjVmKcKSRV4R
 an0Gp2ZEPnoqwmCSHVOVsE+zi3FaY4RdcWV1d67gxFo4j+/r38cNd8NLNGaFixDqoh0L
 qLxGcyyphkQF8hWif3Jj0yr5dxZBHcsmUh1OUNXs2owavx0xCqEfJpS+ung5GxH3ZSDO
 3VykwqVl18oV7cuhG7NexDGOdIzprVRmf+92boSv9k62U1ftiwIEReKntvDQuQZhsLKK
 b3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717259021; x=1717863821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFYbHI/iftzeCVZcgyHEUN23jefa2GL40WdI+hSfcUY=;
 b=MMsUJKG9CFIMJ8qMhBhg/K7j/9VX3UfR92r5Tx5AYCg31Cq3kqQ2Ko8D5IaUR+cnpC
 AZFLZ9gLmv0onJrvjPK4vGrrqnTk5cyP9EQsT8SELrIczn1mRMW07z1zAT6UICemBvZd
 vuuzt9na9tCaxlLqvjUS2vijIJVIs1T7WAnN//YHFLqYgCrKDedeal9EKGb3Fx9gEAIc
 M3V+jQTy+8GwmjXmdd9xmBdjKyACBYzI+WjuAlrfcIHcdI5b52MYkdYdwVInx2MlKFzv
 lL+aPinKFI+QVv/rGJCdbdDmBEkMBmR4w7PlDfA1MvY2iRkssPr6vVnH4TCoGVzOirAX
 Il/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGvkXbBDkxkIwftsUPGZWCH/rj66zPCpFkY+dWeaavzcDeyqFMN9Qbf9I8Am1mqrwlzKM5GK8kK026UeZRETXDZRfBiNIq//wPql2/puKf
X-Gm-Message-State: AOJu0YxVkzGa6WP613OQgGzkINpwRiOfHHDEsACPkYKYFxU6C40NRqXq
 DqNkh/EpEww9IJk2NKNqQHkK5R2yKyaA+p9NeFRS8E/+/tfXowkJe8rUTDx8ojQ=
X-Google-Smtp-Source: AGHT+IFyJhRqFa8IgrBp6/6h3OLMBLYTUBAoFXY0l3e5Be488IYl+3x1ULtRSmfe6DLuB5yjSSUS3Q==
X-Received: by 2002:a2e:7c10:0:b0:2e9:756f:cde0 with SMTP id
 38308e7fff4ca-2ea9512a367mr27454421fa.23.1717259020714; 
 Sat, 01 Jun 2024 09:23:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91bee773sm6157261fa.66.2024.06.01.09.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 09:23:40 -0700 (PDT)
Date: Sat, 1 Jun 2024 19:23:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/panel: kd101ne3: add new panel driver
Message-ID: <hsf7dz5uzpf2gn34wicjycs4f22vuaessle6wk7jwcvnnwspwe@dzxku34gz55b>
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240601084528.22502-3-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601084528.22502-3-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Sat, Jun 01, 2024 at 04:45:26PM +0800, Zhaoxiong Lv wrote:
> The bias IC of this kindisplay-kd101ne3 panel is placed
> on the panel side, so when the panel is powered on,
> there is no need to control AVDD and AVEE in the driver,
> only 3.3v and reset are needed.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> 
> Chage since V2:
> 
> -  1. Use the new mipi_dsi_dcs_write_seq_multi() function.
> -  2. Modify Move mipi_dsi_dcs_set_display_off() and mipi_dsi_dcs_enter_sleep_mode() to disable(),
> -  and drop kingdisplay_panel_enter_sleep_mode().
> -  3. If prepare fails, disable GPIO before regulators.
> -  4. This function drm_connector_set_panel_orientation() is no longer used. Delete it.
> -  5. Drop ".shutdown = kingdisplay_panel_shutdown".
> 
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../drm/panel/panel-kingdisplay-kd101ne3.c    | 533 ++++++++++++++++++
>  3 files changed, 543 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index e54f6f5604ed..71669e990e8e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -297,6 +297,15 @@ config DRM_PANEL_KINGDISPLAY_KD097D04
>  	  24 bit RGB per pixel. It provides a MIPI DSI interface to
>  	  the host and has a built-in LED backlight.
>  
> +config DRM_PANEL_KINGDISPLAY_KD101NE3
> +	tristate "Kingdisplay kd101ne3 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the kingdisplay kd101ne3
> +	  4-lane 800x1280 MIPI DSI panel.
> +
>  config DRM_PANEL_LEADTEK_LTK050H3146W
>  	tristate "Leadtek LTK050H3146W panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index f0203f6e02f4..4576c9fe33d9 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_DRM_PANEL_JDI_LPM102A188A) += panel-jdi-lpm102a188a.o
>  obj-$(CONFIG_DRM_PANEL_JDI_R63452) += panel-jdi-fhd-r63452.o
>  obj-$(CONFIG_DRM_PANEL_KHADAS_TS050) += panel-khadas-ts050.o
>  obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04) += panel-kingdisplay-kd097d04.o
> +obj-$(CONFIG_DRM_PANEL_KINGDISPLAY_KD101NE3) += panel-kingdisplay-kd101ne3.o
>  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
>  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
> diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> new file mode 100644
> index 000000000000..8994a1c9afb5
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd101ne3.c
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Panels based on the JD9365DA display controller.
> + * Author: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct kingdisplay_panel;
> +
> +struct panel_desc {
> +	const struct drm_display_mode *modes;
> +	unsigned int bpc;
> +
> +	/**
> +	 * @width_mm: width of the panel's active display area
> +	 * @height_mm: height of the panel's active display area
> +	 */
> +	struct {
> +		unsigned int width_mm;
> +		unsigned int height_mm;
> +	} size;
> +
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	const struct panel_init_cmd *init_cmds;
> +	int (*init)(struct kingdisplay_panel *kingdisplay);
> +	unsigned int lanes;
> +	bool discharge_on_disable;
> +	bool lp11_before_reset;
> +};
> +
> +struct kingdisplay_panel {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *dsi;
> +
> +	const struct panel_desc *desc;
> +
> +	enum drm_panel_orientation orientation;
> +	struct regulator *pp3300;
> +	struct gpio_desc *enable_gpio;
> +};
> +
> +static int kingdisplay_kd101ne3_init(struct kingdisplay_panel *kingdisplay)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->dsi };
> +
> +	/* T5:HWreset to init_code >= 50ms */
> +	msleep(50);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x65);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xf8);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xc7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xc7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x7e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x6a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x2e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x15);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x61);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x35);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x38);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x54);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x42);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x39);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x34);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x61);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x35);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x38);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x54);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x42);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x39);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x34);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x53);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x51);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x0d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x75);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0xb4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xbb);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x61);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;

No need to, the execution can continue.

> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_EXIT_SLEEP_MODE);

mipi_dsi_dcs_exit_sleep_mode_multi()

> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;

No need to

> +
> +	msleep(120);

mipi_dsi_msleep

> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_ON);

mipi_dsi_dcs_set_display_on_multi

> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;

No need to

> +
> +	msleep(20);

mipi_dsi_msleep
> +
> +	return 0;
> +};
> +
> +static inline struct kingdisplay_panel *to_kingdisplay_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct kingdisplay_panel, base);
> +}
> +
> +static int kingdisplay_panel_disable(struct drm_panel *panel)
> +{
> +	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
> +	int err;
> +
> +	kingdisplay->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	msleep(100);
> +
> +	err = mipi_dsi_dcs_set_display_off(kingdisplay->dsi);

You might want to use context / mipi_dsi_*_multi here too.

> +	if (err < 0)
> +		dev_err(panel->dev, "failed to set display off: %d\n", err);
> +
> +	msleep(50);
> +
> +	err = mipi_dsi_dcs_enter_sleep_mode(kingdisplay->dsi);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
> +		return err;
> +	}
> +
> +	msleep(120);
> +
> +	return 0;
> +}
> +
> +static int kingdisplay_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
> +	int err;
> +
> +	gpiod_set_value_cansleep(kingdisplay->enable_gpio, 0);
> +
> +	/* T15: 2ms */
> +	usleep_range(1000, 2000);
> +
> +	err = regulator_disable(kingdisplay->pp3300);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int kingdisplay_panel_prepare(struct drm_panel *panel)
> +{
> +	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
> +	int err;
> +
> +	gpiod_set_value(kingdisplay->enable_gpio, 0);
> +
> +	err = regulator_enable(kingdisplay->pp3300);
> +	if (err < 0)
> +		return err;
> +
> +	/* T1:Vdd to mipi_lp >= 0ms */
> +	usleep_range(5000, 6000);
> +
> +	if (kingdisplay->desc->lp11_before_reset) {
> +		err = mipi_dsi_dcs_nop(kingdisplay->dsi);
> +		if (err < 0)
> +			goto poweroff;
> +
> +		usleep_range(1000, 2000);
> +	}
> +
> +	/* T2: 10ms, T1 + T2 > 60ms */
> +	msleep(60);
> +
> +	gpiod_set_value_cansleep(kingdisplay->enable_gpio, 1);
> +
> +	err = kingdisplay->desc->init(kingdisplay);
> +	if (err < 0)
> +		goto poweroff;
> +
> +	return 0;
> +
> +poweroff:
> +	gpiod_set_value(kingdisplay->enable_gpio, 0);
> +		/* T6: 2ms */
> +	usleep_range(1000, 2000);
> +	regulator_disable(kingdisplay->pp3300);
> +
> +	return err;
> +}
> +
> +static int kingdisplay_panel_enable(struct drm_panel *panel)
> +{
> +	msleep(130);

This happens after enabling the DSI video signal. What is the point of sleeping here?

> +	return 0;
> +}
> +
> +static const struct drm_display_mode kingdisplay_kd101ne3_40ti_default_mode = {
> +	.clock = 70595,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 30,
> +	.hsync_end = 800 + 30 + 30,
> +	.htotal = 800 + 30 + 30 + 30,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 30,
> +	.vsync_end = 1280 + 30 + 4,
> +	.vtotal = 1280 + 30 + 4 + 8,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc kingdisplay_kd101ne3_40ti_desc = {
> +	.modes = &kingdisplay_kd101ne3_40ti_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 135,
> +		.height_mm = 216,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init = kingdisplay_kd101ne3_init,
> +	.lp11_before_reset = true,
> +};
> +
> +static int kingdisplay_panel_get_modes(struct drm_panel *panel,
> +			       struct drm_connector *connector)
> +{
> +	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
> +	const struct drm_display_mode *m = kingdisplay->desc->modes;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, m);
> +	if (!mode) {
> +		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> +		return -ENOMEM;
> +	}
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +
> +	connector->display_info.width_mm = kingdisplay->desc->size.width_mm;
> +	connector->display_info.height_mm = kingdisplay->desc->size.height_mm;

Please move dimensions to the mode and use drm_connector_helper_get_modes_fixed()

> +	connector->display_info.bpc = kingdisplay->desc->bpc;
> +
> +	return 1;
> +}
> +
> +static enum drm_panel_orientation kingdisplay_panel_get_orientation(struct drm_panel *panel)
> +{
> +	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
> +
> +	return kingdisplay->orientation;
> +}
> +
> +static const struct drm_panel_funcs kingdisplay_panel_funcs = {
> +	.disable = kingdisplay_panel_disable,
> +	.unprepare = kingdisplay_panel_unprepare,
> +	.prepare = kingdisplay_panel_prepare,
> +	.enable = kingdisplay_panel_enable,
> +	.get_modes = kingdisplay_panel_get_modes,
> +	.get_orientation = kingdisplay_panel_get_orientation,
> +};
> +
> +static int kingdisplay_panel_add(struct kingdisplay_panel *kingdisplay)
> +{
> +	struct device *dev = &kingdisplay->dsi->dev;
> +	int err;
> +
> +	kingdisplay->pp3300 = devm_regulator_get(dev, "pp3300");
> +	if (IS_ERR(kingdisplay->pp3300))
> +		return dev_err_probe(dev, PTR_ERR(kingdisplay->pp3300),
> +				     "Cannot get pp3300\n");
> +
> +	kingdisplay->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(kingdisplay->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(kingdisplay->enable_gpio),
> +				     "Cannot get enable GPIO\n");
> +
> +	drm_panel_init(&kingdisplay->base, dev, &kingdisplay_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	err = of_drm_get_panel_orientation(dev->of_node, &kingdisplay->orientation);
> +	if (err < 0) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
> +		return err;
> +	}
> +
> +	err = drm_panel_of_backlight(&kingdisplay->base);
> +	if (err)
> +		return err;
> +
> +	kingdisplay->base.funcs = &kingdisplay_panel_funcs;
> +	kingdisplay->base.dev = &kingdisplay->dsi->dev;
> +
> +	drm_panel_add(&kingdisplay->base);
> +
> +	return 0;
> +}
> +
> +static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct kingdisplay_panel *kingdisplay;
> +	int ret;
> +	const struct panel_desc *desc;
> +
> +	kingdisplay = devm_kzalloc(&dsi->dev, sizeof(*kingdisplay), GFP_KERNEL);
> +	if (!kingdisplay)
> +		return -ENOMEM;
> +
> +	desc = of_device_get_match_data(&dsi->dev);
> +	dsi->lanes = desc->lanes;
> +	dsi->format = desc->format;
> +	dsi->mode_flags = desc->mode_flags;
> +	kingdisplay->desc = desc;
> +	kingdisplay->dsi = dsi;
> +	ret = kingdisplay_panel_add(kingdisplay);
> +	if (ret < 0)
> +		return ret;
> +
> +	mipi_dsi_set_drvdata(dsi, kingdisplay);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		drm_panel_remove(&kingdisplay->base);
> +
> +	return ret;
> +}
> +
> +static void kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
> +
> +	if (kingdisplay->base.dev)
> +		drm_panel_remove(&kingdisplay->base);
> +}
> +
> +static const struct of_device_id kingdisplay_of_match[] = {
> +	{ .compatible = "kingdisplay,kd101ne3-40ti",
> +	  .data = &kingdisplay_kd101ne3_40ti_desc
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, kingdisplay_of_match);
> +
> +static struct mipi_dsi_driver kingdisplay_panel_driver = {
> +	.driver = {
> +		.name = "panel-kingdisplay-kd101ne3",
> +		.of_match_table = kingdisplay_of_match,
> +	},
> +	.probe = kingdisplay_panel_probe,
> +	.remove = kingdisplay_panel_remove,
> +};
> +module_mipi_dsi_driver(kingdisplay_panel_driver);
> +
> +MODULE_AUTHOR("Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>");
> +MODULE_DESCRIPTION("kingdisplay kd101ne3-40ti 800x1280 video mode panel driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
