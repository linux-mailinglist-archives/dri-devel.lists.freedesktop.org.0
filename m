Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9384C90E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 11:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04711320F;
	Wed,  7 Feb 2024 10:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DMIdl2To";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA27511320F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 10:57:47 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-60485382886so5132397b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 02:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707303467; x=1707908267; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WYBFM44xzhcEqq8w+7NljnljQjwiDGchHDV3zuSQMHw=;
 b=DMIdl2Toh1X5Ryf8BIuW0saq33HrO9v4lNG37gwUWzSHbuXpPJ8bM3lM/W5zHDYWgu
 IkaZxttqOj2Jx0CMwLLRh4t4U4zpJ3RoK/LtlNiMutfmJFWazZsQWO0EOBQFCuMKCawE
 ukrVX6JIHEi4tMZm856C8/Ah5CBCavs186cvTB49dnFfVYin28lRQ76C37EVaeRVCOhD
 om4EK/l3yQEf+VEFctoDfT+JJ/yscDQwlXKXW7VkD/9EmrunCL0mwIKbGqxAnsdNIKng
 nkyMryYmVANSnvPBI4g6bxY348zYpNA06mJgg4qZv0gVt9WpSZ//c2hWKSu3zjTwfSj9
 28YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707303467; x=1707908267;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WYBFM44xzhcEqq8w+7NljnljQjwiDGchHDV3zuSQMHw=;
 b=uUc4L+NR6TAb/i+oTbjI3Ykg2mWZ2lIoPW9r74IUyQkHa9YBQP0Y6bVDAoAxDq+zIp
 5ehFD5RCB96txIspweWJ7rQnKIYFj52y6JXdxrP4BX/rCv3fyOhNafQgOde/S9Geerda
 +5M1KLoX6DhcZSyVSl6P8xaqrrbL/oZe+RpZy5rSxhEEPDnH83XgYS3GiBowBEvjABON
 KfyBzMEYhkuMU9lA2bfw6Lx4Mk9SFWv9TErgVlSd/HPcP7UEptr5fCc2nNMq3/a2Dw4d
 gE+mwG+oo8V/QpDtx0iIv9PZad+sjSq9Ar0c30acEy7Ofhzon3EYwTdU3x4MtIMM+NaA
 53/g==
X-Gm-Message-State: AOJu0YyCCOx10nIDqr8o0U/kxMsBZUWBU6Na+/obVAWa0E7dqUCIaQDM
 sFlWcVSkm+Uqv7V1b3yimKigD2cXZ9+SwA0MohCi4+0BVejsHv/Oqud8lFdxHCwph4kQNA8WySA
 uCgg20rFmcrPy1ejZudTGivmbYzVAKPzBKhK9nw==
X-Google-Smtp-Source: AGHT+IHR4qEqKhpvA597gRq7PWRbcC6qFa/BxDhiAveADLFIPtfCjKzY1L5lD0Bcb/80Cz2mOHz0pI41PD7CsLtl4Oo=
X-Received: by 2002:a81:8b54:0:b0:5f1:e1f:fe7a with SMTP id
 e20-20020a818b54000000b005f10e1ffe7amr4112609ywk.10.1707303466809; Wed, 07
 Feb 2024 02:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20240206065709.108684-1-shengyang.chen@starfivetech.com>
 <20240206065709.108684-3-shengyang.chen@starfivetech.com>
In-Reply-To: <20240206065709.108684-3-shengyang.chen@starfivetech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 12:57:35 +0200
Message-ID: <CAA8EJppCe2uJe+tH93fD=UKWBejZfBgAvzzjtcWJd4hb99at+Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: cdns-dsi: Add support for StarFive
 JH7110 SoC
To: Shengyang Chen <shengyang.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, tomi.valkeinen@ideasonboard.com, r-ravikumar@ti.com, 
 aford173@gmail.com, agx@sigxcpu.org, rdunlap@infradead.org, 
 u.kleine-koenig@pengutronix.de, sam@ravnborg.org, bbrezillon@kernel.org, 
 changhuang.liang@starfivetech.com, keith.zhao@starfivetech.com, 
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 6 Feb 2024 at 08:57, Shengyang Chen
<shengyang.chen@starfivetech.com> wrote:
>
> From: Keith Zhao <keith.zhao@starfivetech.com>
>
> Add display bridge support for dsi on StarFive JH7110 SoC.
>
> The mainly modification is followed:
>     1.Add extra clock and reset operation for JH7110.
>     2.Add callback for JH7110.
>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
> ---
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   7 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  29 ++-
>  .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  21 ++
>  .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.c  | 193 ++++++++++++++++++
>  .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.h  |  16 ++
>  6 files changed, 266 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
>
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
> index cced81633ddc..ad9f572f4720 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -19,6 +19,13 @@ config DRM_CDNS_DSI_J721E
>         help
>           Support J721E Cadence DSI wrapper. The wrapper manages
>           the routing of the DSS DPI signal to the Cadence DSI.
> +
> +config DRM_CDNS_DSI_JH7110
> +       bool "JH7110 SOC Cadence DSI support"
> +       default n
> +       help
> +         Cadence DPI to DSI bridge which is embedded in the
> +         StarFive JH7110 SoC.
>  endif
>
>  config DRM_CDNS_MHDP8546
> diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
> index c95fd5b81d13..87f603a9f4ad 100644
> --- a/drivers/gpu/drm/bridge/cadence/Makefile
> +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  cdns-dsi-y := cdns-dsi-core.o
>  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
> +cdns-dsi-$(CONFIG_DRM_CDNS_DSI_JH7110) += cdns-dsi-jh7110.o
>  obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
>  cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
>  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 7457d38622b0..c0c81745e765 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -27,6 +27,10 @@
>  #include "cdns-dsi-j721e.h"
>  #endif
>
> +#ifdef CONFIG_DRM_CDNS_DSI_JH7110
> +#include "cdns-dsi-jh7110.h"
> +#endif
> +
>  #define IP_CONF                                0x0
>  #define SP_HS_FIFO_DEPTH(x)            (((x) & GENMASK(30, 26)) >> 26)
>  #define SP_LP_FIFO_DEPTH(x)            (((x) & GENMASK(25, 21)) >> 21)
> @@ -552,6 +556,10 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
>         /* data rate was in bytes/sec, convert to bits/sec. */
>         phy_cfg->hs_clk_rate = dlane_bps * 8;
>
> +       if (dsi->platform_ops && dsi->platform_ops->mode_fixup)
> +               adj_dsi_htotal = dsi->platform_ops->mode_fixup(dsi, dsi_cfg, phy_cfg,
> +                                                          dpi_hz, dpi_htotal, dsi_htotal);
> +
>         dsi_hfp_ext = adj_dsi_htotal - dsi_htotal;
>         dsi_cfg->hfp += dsi_hfp_ext;
>         dsi_cfg->htotal = dsi_htotal + dsi_hfp_ext;
> @@ -683,7 +691,7 @@ static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
>         pm_runtime_put(dsi->base.dev);
>  }
>
> -static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
> +void cdns_dsi_hs_init(struct cdns_dsi *dsi)
>  {
>         struct cdns_dsi_output *output = &dsi->output;
>         u32 status;
> @@ -1026,6 +1034,14 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
>
>         cdns_dsi_init_link(dsi);
>
> +       /*
> +        * on JH7110 SoC , when transfer dsi command ,
> +        * cdns_dsi_hs_init is needed.
> +        * or the final ret will be error value.
> +        */
> +       if (dsi->platform_ops && dsi->platform_ops->transfer)
> +               dsi->platform_ops->transfer(dsi);
> +
>         ret = mipi_dsi_create_packet(&packet, msg);
>         if (ret)
>                 goto out;
> @@ -1142,6 +1158,9 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
>         clk_prepare_enable(dsi->dsi_p_clk);
>         clk_prepare_enable(dsi->dsi_sys_clk);
>
> +       if (dsi->platform_ops && dsi->platform_ops->resume)
> +               dsi->platform_ops->resume(dsi);
> +
>         return 0;
>  }
>
> @@ -1152,6 +1171,10 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
>         clk_disable_unprepare(dsi->dsi_sys_clk);
>         clk_disable_unprepare(dsi->dsi_p_clk);
>         reset_control_assert(dsi->dsi_p_rst);
> +
> +       if (dsi->platform_ops && dsi->platform_ops->suspend)
> +               dsi->platform_ops->suspend(dsi);
> +
>         dsi->link_initialized = false;
>         return 0;
>  }
> @@ -1294,6 +1317,10 @@ static const struct of_device_id cdns_dsi_of_match[] = {
>  #ifdef CONFIG_DRM_CDNS_DSI_J721E
>         { .compatible = "ti,j721e-dsi", .data = &dsi_ti_j721e_ops, },
>  #endif
> +#ifdef CONFIG_DRM_CDNS_DSI_JH7110
> +       { .compatible = "starfive,jh7110-dsi", .data = &dsi_ti_jh7110_ops, },
> +#endif
> +
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> index ca7ea2da635c..0a86495ead7b 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> @@ -53,12 +53,22 @@ struct cdns_dsi;
>   * @deinit: Called in the CDNS DSI remove
>   * @enable: Called at the beginning of CDNS DSI bridge enable
>   * @disable: Called at the end of CDNS DSI bridge disable
> + * @resume: Called at the resume of CDNS DSI
> + * @suspend: Called at the suspend of CDNS DSI
> + * @update: Called at the middle of CDNS DSI bridge enable
>   */
>  struct cdns_dsi_platform_ops {
>         int (*init)(struct cdns_dsi *dsi);
>         void (*deinit)(struct cdns_dsi *dsi);
>         void (*enable)(struct cdns_dsi *dsi);
>         void (*disable)(struct cdns_dsi *dsi);
> +       void (*resume)(struct cdns_dsi *dsi);
> +       void (*suspend)(struct cdns_dsi *dsi);
> +       int (*mode_fixup)(struct cdns_dsi *dsi, struct cdns_dsi_cfg *dsi_cfg,
> +                         struct phy_configure_opts_mipi_dphy *phy_cfg,
> +                         unsigned long dpi_hz, unsigned long dpi_htotal,
> +                         unsigned long dsi_htotal);
> +       void (*transfer)(struct cdns_dsi *dsi);
>  };
>
>  struct cdns_dsi {
> @@ -79,6 +89,17 @@ struct cdns_dsi {
>         bool link_initialized;
>         bool phy_initialized;
>         struct phy *dphy;
> +
> +#ifdef CONFIG_DRM_CDNS_DSI_JH7110
> +       struct clk *dpi_clk;
> +       struct clk *txesc_clk;
> +       struct reset_control *dpi_rst;
> +       struct reset_control *sys_rst;
> +       struct reset_control *txesc_rst;
> +       struct reset_control *txbytehs_rst;
> +#endif
>  };
>
> +void cdns_dsi_hs_init(struct cdns_dsi *dsi);
> +
>  #endif /* !__CDNS_DSI_H__ */
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
> new file mode 100644
> index 000000000000..c6b9296a9275
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JH7110 SoC Cadence DSI wrapper
> + *
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +
> +#include "cdns-dsi-jh7110.h"
> +
> +static int cdns_dsi_clock_enable(struct cdns_dsi *dsi, struct device *dev)
> +{
> +       int ret;
> +
> +       ret = clk_prepare_enable(dsi->dpi_clk);
> +       if (ret) {
> +               dev_err(dev, "Failed to prepare/enable dpi_clk\n");
> +               return ret;
> +       }
> +
> +       ret = clk_prepare_enable(dsi->txesc_clk);
> +       if (ret) {
> +               dev_err(dev, "Failed to prepare/enable txesc_clk\n");
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +static void cdns_dsi_clock_disable(struct cdns_dsi *dsi)
> +{
> +       clk_disable_unprepare(dsi->dpi_clk);
> +       clk_disable_unprepare(dsi->txesc_clk);

Please use clk_bulk_ API and inline these two functions.

> +}
> +
> +static int cdns_dsi_resets_deassert(struct cdns_dsi *dsi, struct device *dev)
> +{
> +       int ret;
> +
> +       ret = reset_control_deassert(dsi->dpi_rst);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to deassert dpi_rst\n");
> +               return ret;
> +       }
> +
> +       ret = reset_control_deassert(dsi->txesc_rst);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to deassert txesc_rst\n");
> +               return ret;
> +       }
> +
> +       ret = reset_control_deassert(dsi->sys_rst);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to deassert sys_rst\n");
> +               return ret;
> +       }

Same, please use reset_control_bulk API.

> +
> +       return ret;
> +}
> +
> +static int cdns_dsi_resets_assert(struct cdns_dsi *dsi, struct device *dev)
> +{
> +       int ret;
> +
> +       ret = reset_control_assert(dsi->dpi_rst);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to assert dpi_rst\n");
> +               return ret;
> +       }
> +
> +       ret = reset_control_assert(dsi->txesc_rst);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to assert txesc_rst\n");
> +               return ret;
> +       }
> +
> +       ret = reset_control_assert(dsi->sys_rst);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to assert sys_rst\n");
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +static int cdns_dsi_get_clock(struct device *dev, struct cdns_dsi *dsi)
> +{
> +       dsi->dpi_clk = devm_clk_get(dev, "dpi");
> +       if (IS_ERR(dsi->dpi_clk))
> +               return PTR_ERR(dsi->dpi_clk);
> +
> +       dsi->txesc_clk = devm_clk_get(dev, "txesc");
> +       if (IS_ERR(dsi->txesc_clk))
> +               return PTR_ERR(dsi->txesc_clk);
> +
> +       return 0;
> +}
> +
> +static int cdns_dsi_get_reset(struct device *dev, struct cdns_dsi *dsi)
> +{
> +       dsi->sys_rst = devm_reset_control_get_exclusive(dev, "sys");
> +       if (IS_ERR(dsi->sys_rst))
> +               return PTR_ERR(dsi->sys_rst);
> +
> +       dsi->dpi_rst = devm_reset_control_get_exclusive(dev, "dpi");
> +       if (IS_ERR(dsi->dpi_rst))
> +               return PTR_ERR(dsi->dpi_rst);
> +
> +       dsi->txesc_rst = devm_reset_control_get_exclusive(dev, "txesc");
> +       if (IS_ERR(dsi->txesc_rst))
> +               return PTR_ERR(dsi->txesc_rst);
> +
> +       dsi->txbytehs_rst = devm_reset_control_get_exclusive(dev, "txbytehs");
> +       if (IS_ERR(dsi->txbytehs_rst))
> +               return PTR_ERR(dsi->txbytehs_rst);
> +
> +       return 0;
> +}
> +
> +static int cdns_dsi_jh7110_init(struct cdns_dsi *dsi)
> +{
> +       int ret;
> +
> +       ret = cdns_dsi_get_clock(dsi->base.dev, dsi);
> +       if (ret)
> +               return ret;
> +
> +       return cdns_dsi_get_reset(dsi->base.dev, dsi);
> +}
> +
> +static void cdns_dsi_jh7110_resume(struct cdns_dsi *dsi)
> +{
> +       int ret;
> +
> +       ret = cdns_dsi_clock_enable(dsi, dsi->base.dev);
> +       if (ret) {
> +               dev_err(dsi->base.dev, "failed to enable clock\n");
> +               return;
> +       }
> +       ret = cdns_dsi_resets_deassert(dsi, dsi->base.dev);
> +       if (ret < 0) {
> +               dev_err(dsi->base.dev, "failed to deassert reset\n");
> +               return;
> +       }
> +}
> +
> +static void cdns_dsi_jh7110_suspend(struct cdns_dsi *dsi)
> +{
> +       int ret;
> +
> +       ret = cdns_dsi_resets_assert(dsi, dsi->base.dev);
> +       if (ret < 0) {
> +               dev_err(dsi->base.dev, "failed to deassert reset\n");
> +               return;
> +       }
> +
> +       cdns_dsi_clock_disable(dsi);
> +}
> +
> +static int cdns_dsi_jh7110_mode_fixup(struct cdns_dsi *dsi, struct cdns_dsi_cfg *dsi_cfg,
> +                                     struct phy_configure_opts_mipi_dphy *phy_cfg,
> +                                     unsigned long dpi_hz, unsigned long dpi_htotal,
> +                                     unsigned long dsi_htotal)
> +{
> +       unsigned long long dlane_bps;
> +       unsigned long adj_dsi_htotal;
> +       unsigned int lanes = dsi->output.dev->lanes;
> +
> +       phy_cfg->hs_clk_rate = phy_cfg->hs_clk_rate - (phy_cfg->hs_clk_rate % 10000000);
> +       phy_cfg->hs_clk_rate += 100000000;

phy_cfg->hs_clk_rate = roundup(phy_cfg->hs_clk_rate, 100000000);

> +       dlane_bps = phy_cfg->hs_clk_rate * lanes * dpi_htotal / 8;
> +       adj_dsi_htotal = dlane_bps / dpi_hz;
> +
> +       return adj_dsi_htotal;
> +}
> +
> +static void jh7110_cdns_dsi_hs_init(struct cdns_dsi *dsi)
> +{
> +       cdns_dsi_hs_init(dsi);
> +       reset_control_deassert(dsi->txbytehs_rst);

Is a single deassert enough here? Which funciion asserts the reset?

> +}
> +
> +const struct cdns_dsi_platform_ops dsi_ti_jh7110_ops = {
> +       .init = cdns_dsi_jh7110_init,
> +       .resume = cdns_dsi_jh7110_resume,
> +       .suspend = cdns_dsi_jh7110_suspend,
> +       .mode_fixup = cdns_dsi_jh7110_mode_fixup,
> +       .transfer = jh7110_cdns_dsi_hs_init,
> +};
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
> new file mode 100644
> index 000000000000..15d6a766b502
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * JH7110 Cadence DSI
> + *
> + * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
> + * Author: keith.zhao <keith.zhao@starfivetech.com>
> + */
> +
> +#ifndef __CDNS_DSI_JH7110_H__
> +#define __CDNS_DSI_JH7110_H__
> +
> +#include "cdns-dsi-core.h"
> +
> +extern const struct cdns_dsi_platform_ops dsi_ti_jh7110_ops;
> +
> +#endif /* !__CDNS_DSI_JH7110_H__ */
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
