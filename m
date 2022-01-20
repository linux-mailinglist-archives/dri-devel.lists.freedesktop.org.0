Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7B49500B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D04710E563;
	Thu, 20 Jan 2022 14:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A6410E550
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:23:06 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id l5so12319454edv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xggRvSFBLIaR/QgerZZVvbOSKVlz0ESTMXna4xv4wtg=;
 b=UVWwXEca8jRTa1C24yf6uJF8L5oLFawCy5YoRQZcpfrbTu8DAIME2gQO2XOeS2EE1r
 EKC9tCmInnyOI3di4DoIKAja4wQmu69WrWD0rCyGyhmQCBcHNeMM1bwI8MmuVsM3Tvkw
 mLSwUiGue+TuBK3Qtdg3+Tj7+LFjJNRW7wdMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xggRvSFBLIaR/QgerZZVvbOSKVlz0ESTMXna4xv4wtg=;
 b=h50gy20nXwAVKP8+eHjDHL+jvgyja77TqadKtRXKnGT2EqGSdOsPxsBVKNFu7jRM6Q
 nXVVBCk2Ka22ZqRNm8fiRmmmZ5idN7O5/SOifFDnCKZgu2GGCsuc8XURzp2/XW9pwdqt
 /bCS/uaAZeCX3vmP9PWxsEinrpznEdPYN5274DTQy2qPq/R6uiTy66ZCapEQ0tEcf2kN
 PT15DOR0JOa3rQbc0LtQHcpcu/LUifKx4z2J8galm3HedbGQhL59X91PYDD6C571xf3Q
 oJPRJxA9exSwUkhYL87jkOBG5MKRqwqgCfAif2Dg2LrkHU88sGoQ3pH3on1dF5E8GyAt
 ZrkA==
X-Gm-Message-State: AOAM533F7Kv6MUpp3d6Je3TsBWHZbncOdBZ9KA9jKBYio3uBs7K3ELXd
 5HwYOQY3k5/NaR6RilUku3h8eoKDrAz5zIB/jQyxYw==
X-Google-Smtp-Source: ABdhPJxXb5ggNakazw/zxkr1Byl+dRjKm1t+zcMS3ZHqR1oeZFsp8eaiJm2LiwP+6JZkaT4X64tlhWnCmUHgXa6JRlc=
X-Received: by 2002:a17:906:7cc9:: with SMTP id
 h9mr29329294ejp.111.1642688585288; 
 Thu, 20 Jan 2022 06:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-6-narmstrong@baylibre.com>
In-Reply-To: <20220120083357.1541262-6-narmstrong@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 20 Jan 2022 19:52:54 +0530
Message-ID: <CAMty3ZCrcQchnne1KU1RQA6MfwRQS8dObJQcOF_H7fEQ57wa0w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/meson: add DSI encoder
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds an encoder bridge designed to drive a MIPI-DSI display
> by using the ENCL encoder through the internal MIPI DSI transceiver
> connected to the output of the ENCL pixel encoder.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/Makefile            |   2 +-
>  drivers/gpu/drm/meson/meson_drv.c         |   7 +
>  drivers/gpu/drm/meson/meson_encoder_dsi.c | 160 ++++++++++++++++++++++
>  drivers/gpu/drm/meson/meson_encoder_dsi.h |  12 ++
>  4 files changed, 180 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h
>
> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
> index 3afa31bdc950..833e18c20603 100644
> --- a/drivers/gpu/drm/meson/Makefile
> +++ b/drivers/gpu/drm/meson/Makefile
> @@ -2,7 +2,7 @@
>  meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_encoder_cvbs.o
>  meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
>  meson-drm-y += meson_rdma.o meson_osd_afbcd.o
> -meson-drm-y += meson_encoder_hdmi.o
> +meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
>
>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 26aeaf0ab86e..15344cf9f913 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -33,6 +33,7 @@
>  #include "meson_registers.h"
>  #include "meson_encoder_cvbs.h"
>  #include "meson_encoder_hdmi.h"
> +#include "meson_encoder_dsi.h"
>  #include "meson_viu.h"
>  #include "meson_vpp.h"
>  #include "meson_rdma.h"
> @@ -323,6 +324,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>         if (ret)
>                 goto exit_afbcd;
>
> +       if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
> +               ret = meson_encoder_dsi_init(priv);
> +               if (ret)
> +                       goto free_drm;
> +       }
> +
>         ret = meson_plane_create(priv);
>         if (ret)
>                 goto exit_afbcd;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> new file mode 100644
> index 000000000000..12a586316183
> --- /dev/null
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2016 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "meson_drv.h"
> +#include "meson_encoder_dsi.h"
> +#include "meson_registers.h"
> +#include "meson_venc.h"
> +#include "meson_vclk.h"
> +
> +struct meson_encoder_dsi {
> +       struct drm_encoder encoder;
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct meson_drm *priv;
> +};
> +
> +#define bridge_to_meson_encoder_dsi(x) \
> +       container_of(x, struct meson_encoder_dsi, bridge)
> +
> +static int meson_encoder_dsi_attach(struct drm_bridge *bridge,
> +                                   enum drm_bridge_attach_flags flags)
> +{
> +       struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, encoder_dsi->next_bridge,
> +                                &encoder_dsi->bridge, flags);
> +}
> +
> +static void meson_encoder_dsi_mode_set(struct drm_bridge *bridge,
> +                                      const struct drm_display_mode *mode,
> +                                      const struct drm_display_mode *adjusted_mode)
> +{
> +       struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
> +       struct meson_drm *priv = encoder_dsi->priv;
> +
> +       meson_vclk_setup(priv, MESON_VCLK_TARGET_DSI, mode->clock, 0, 0, 0, false);
> +
> +       meson_venc_mipi_dsi_mode_set(priv, mode);
> +       meson_encl_load_gamma(priv);
> +
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
> +
> +       writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
> +                           priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
> +}
> +
> +static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
> +                                           struct drm_bridge_state *bridge_state)
> +{
> +       struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
> +       struct meson_drm *priv = encoder_dsi->priv;
> +
> +       writel_bits_relaxed(BIT(0), 0, priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
> +
> +       writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
> +}
> +
> +static void meson_encoder_dsi_atomic_disable(struct drm_bridge *bridge,
> +                                            struct drm_bridge_state *bridge_state)
> +{
> +       struct meson_encoder_dsi *meson_encoder_dsi =
> +                                       bridge_to_meson_encoder_dsi(bridge);
> +       struct meson_drm *priv = meson_encoder_dsi->priv;
> +
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
> +
> +       writel_bits_relaxed(BIT(0), BIT(0), priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
> +}
> +
> +static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
> +       .attach = meson_encoder_dsi_attach,
> +       /*
> +        * TOFIX: remove when dw-mipi-dsi moves out of mode_set
> +        * We should get rid of mode_set, but until dw-mipi-dsi uses it
> +        * we need to setup the pixel clock before the following
> +        * bridge tries to setup the HW.
> +        */
> +       .mode_set = meson_encoder_dsi_mode_set,
> +       .atomic_enable = meson_encoder_dsi_atomic_enable,
> +       .atomic_disable = meson_encoder_dsi_atomic_disable,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> +
> +int meson_encoder_dsi_init(struct meson_drm *priv)
> +{
> +       struct meson_encoder_dsi *meson_encoder_dsi;
> +       struct device_node *remote;
> +       int ret;
> +
> +       meson_encoder_dsi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_dsi), GFP_KERNEL);
> +       if (!meson_encoder_dsi)
> +               return -ENOMEM;
> +
> +       /* DSI Transceiver Bridge */
> +       remote = of_graph_get_remote_node(priv->dev->of_node, 2, 0);
> +       if (!remote) {
> +               dev_err(priv->dev, "DSI transceiver device is disabled");
> +               return 0;
> +       }
> +
> +       meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
> +       if (!meson_encoder_dsi->next_bridge) {
> +               dev_dbg(priv->dev, "Failed to find DSI transceiver bridge: %d\n", ret);
> +               return -EPROBE_DEFER;
> +       }
> +
> +       /* DSI Encoder Bridge */
> +       meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
> +       meson_encoder_dsi->bridge.of_node = priv->dev->of_node;
> +       meson_encoder_dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
> +       drm_bridge_add(&meson_encoder_dsi->bridge);
> +
> +       meson_encoder_dsi->priv = priv;
> +
> +       /* Encoder */
> +       ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
> +                                     DRM_MODE_ENCODER_DSI);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to init DSI encoder: %d\n", ret);
> +               return ret;
> +       }
> +
> +       meson_encoder_dsi->encoder.possible_crtcs = BIT(0);
> +
> +       /* Attach DSI Encoder Bridge to Encoder */
> +       ret = drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_encoder_dsi->bridge, NULL, 0);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /*
> +        * We should have now in place:
> +        * encoder->[dsi encoder bridge]->[dw-mipi-dsi bridge]->[panel bridge]->[panel]
> +        */

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
