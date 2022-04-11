Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA14FBEFE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B6110E14F;
	Mon, 11 Apr 2022 14:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53BD10E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:24:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t1so5576761wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iPBTL5GXZwpgZ95Bejt2kNG1QT9IaMS8Fkz2pTxjSBU=;
 b=C7xaEEeDt10Vt2sOlfwjN/yP0ESEY8aNVcRZverBGrFKEdaMSZtfyTG9n2d+qfwZin
 rFR1YDvDb47kTo3q3RuZGwgCZjNsXSDglfZLF8ghG96MyKriFd5fZFELwN58I6QK2B8j
 Ow2ZXC+t0jYimSj6460Ru1N7vNUzs/2C8sk/fQgPP0kP54nRb3wvqrN1qAFpPA2oN8AR
 1IqxWYWlPI9J6U+HnMXQZ6vRH/mmoQJ6e03Srg9xpego9bNbdHh6izjvK99xmYFcguWk
 2goE0VP8uM0JcJvQ8avRwmxaBKVXJaseD6F/DZ7T8Zj2yoPDBHI0s99sdUvJrRB12RnG
 9H5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iPBTL5GXZwpgZ95Bejt2kNG1QT9IaMS8Fkz2pTxjSBU=;
 b=LFxwbhwrUvf2Jxdku/QfUJvbTq9UWjaMrOpJGj+hr7oJiLRsLg9n2xHvuXpNRM+BoT
 EydrPH0A9d9UFNs7zpRZlhYhww8kVocp2D7mDqQX+zAbTXVhGCpsI/mpyJfYazzZ21cy
 G8T0RFwDky9x6aS78mMupWM1GGLMFmTty9sq1UQMFvZ3Tab+ZK5xEfzQP7kdX40Ho/lU
 j0v8XjNSl4gUwKpw1YrVEq+pDkXDuMFfWHSf9deVJoHjGx8wtJeYTF5mPqb4ghuqwoBE
 KE2AqGH+6/PJG6PIWbRdVStOFw4ONEPWZJnF493lQScV1qfU2QRCM5hvogDOI666c8wY
 KOvw==
X-Gm-Message-State: AOAM532t6UYe5Mm0ehS+707bm8xSWzVTH6KIUX8Hk7QTt2gBWckyvj3I
 i0S6QZ6ESBVp73gT0Kah54EXVw==
X-Google-Smtp-Source: ABdhPJzoOVCfWelNGnm4VJD9J02WZuybDdhANCt9rjHJmotPiKbKtzQ6AGPVbkEsIjsIydRF1soZvQ==
X-Received: by 2002:a5d:5482:0:b0:206:b5c:ef4d with SMTP id
 h2-20020a5d5482000000b002060b5cef4dmr24777393wrv.152.1649687065975; 
 Mon, 11 Apr 2022 07:24:25 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm17901847wma.37.2022.04.11.07.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 07:24:25 -0700 (PDT)
Message-ID: <265d46df-4789-948e-3b61-aa500fbebcbe@baylibre.com>
Date: Mon, 11 Apr 2022 16:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v18 3/3] drm/ingenic: Add dw-hdmi driver specialization
 for jz4780
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.1649330170.git.hns@goldelico.com>
 <e5cdf9cd44bde52cce379cc830f2d6117ea15c32.1649330171.git.hns@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <e5cdf9cd44bde52cce379cc830f2d6117ea15c32.1649330171.git.hns@goldelico.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/04/2022 13:16, H. Nikolaus Schaller wrote:
> From: Paul Boddie <paul@boddie.org.uk>
> 
> A specialisation of the generic Synopsys HDMI driver is employed for
> JZ4780 HDMI support. This requires a new driver, plus device tree and
> configuration modifications.
> 
> Here we add Kconfig DRM_INGENIC_DW_HDMI, Makefile and driver code.
> 
> Note that there is no hpd-gpio installed on the CI20 board HDMI
> connector. Hence there is no hpd detection by the connector driver
> and we have to enable polling in the dw-hdmi core driver.
> 
> For that we need to set .poll_enabled but that struct component
> can only be accessed by core code. Hence we use the public
> setter function drm_kms_helper_hotplug_event() introduced before.
> 
> Also note that we disable Color Space Conversion since it is not
> working on jz4780.
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>   drivers/gpu/drm/ingenic/Makefile          |   1 +
>   drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 103 ++++++++++++++++++++++
>   3 files changed, 113 insertions(+)
>   create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> 
> diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
> index 001f59fb06d56..090830bcbde7f 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -24,4 +24,13 @@ config DRM_INGENIC_IPU
>   
>   	  The Image Processing Unit (IPU) will appear as a second primary plane.
>   
> +config DRM_INGENIC_DW_HDMI
> +	tristate "Ingenic specific support for Synopsys DW HDMI"
> +	depends on MACH_JZ4780
> +	select DRM_DW_HDMI
> +	help
> +	  Choose this option to enable Synopsys DesignWare HDMI based driver.
> +	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
> +	  select this option.
> +
>   endif
> diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
> index d313326bdddbb..f10cc1c5a5f22 100644
> --- a/drivers/gpu/drm/ingenic/Makefile
> +++ b/drivers/gpu/drm/ingenic/Makefile
> @@ -1,3 +1,4 @@
>   obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
>   ingenic-drm-y = ingenic-drm-drv.o
>   ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
> +obj-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> new file mode 100644
> index 0000000000000..72f8b44998a51
> --- /dev/null
> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
> + * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
> + *
> + * Derived from dw_hdmi-imx.c with i.MX portions removed.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] = {
> +	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 0x0000 } } },
> +	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, 0x0005 } } },
> +	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, 0x000a } } },
> +	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, 0x000f } } },
> +	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 } } }
> +};
> +
> +static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] = {
> +	/*pixelclk     bpp8    bpp10   bpp12 */
> +	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
> +	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
> +	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
> +	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
> +	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
> +	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
> +};
> +
> +/*
> + * Resistance term 133Ohm Cfg
> + * PREEMP config 0.00
> + * TX/CK level 10
> + */
> +static const struct dw_hdmi_phy_config ingenic_phy_config[] = {
> +	/*pixelclk   symbol   term   vlev */
> +	{ 216000000, 0x800d, 0x0005, 0x01ad},
> +	{ ~0UL,      0x0000, 0x0000, 0x0000}
> +};
> +
> +static enum drm_mode_status
> +ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +			   const struct drm_display_info *info,
> +			   const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < 13500)
> +		return MODE_CLOCK_LOW;
> +	/* FIXME: Hardware is capable of 270MHz, but setup data is missing. */
> +	if (mode->clock > 216000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data = {
> +	.mpll_cfg   = ingenic_mpll_cfg,
> +	.cur_ctr    = ingenic_cur_ctr,
> +	.phy_config = ingenic_phy_config,
> +	.mode_valid = ingenic_dw_hdmi_mode_valid,
> +	.output_port	= 1,
> +};
> +
> +static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
> +	{ .compatible = "ingenic,jz4780-dw-hdmi" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
> +
> +static void ingenic_dw_hdmi_cleanup(void *data)
> +{
> +	struct dw_hdmi *hdmi = (struct dw_hdmi *)data;
> +
> +	dw_hdmi_remove(hdmi);
> +}
> +
> +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi;
> +
> +	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	return devm_add_action_or_reset(&pdev->dev, ingenic_dw_hdmi_cleanup, hdmi);
> +}
> +
> +static struct platform_driver ingenic_dw_hdmi_driver = {
> +	.probe  = ingenic_dw_hdmi_probe,
> +	.driver = {
> +		.name = "dw-hdmi-ingenic",
> +		.of_match_table = ingenic_dw_hdmi_dt_ids,
> +	},
> +};
> +module_platform_driver(ingenic_dw_hdmi_driver);
> +
> +MODULE_DESCRIPTION("JZ4780 Specific DW-HDMI Driver Extension");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:dw-hdmi-ingenic");

Looks fine, LGTM now we figured out all the details !

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
