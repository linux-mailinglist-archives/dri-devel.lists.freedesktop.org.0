Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18871946D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 09:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025FB10E52B;
	Thu,  1 Jun 2023 07:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDAF10E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:22:24 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b04706c85fso26376275ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685524944; x=1688116944; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4BuOttEkzIDjYYKlTMlX4P7EXoIDpsCsCl1iVqlonk=;
 b=sKcdXa6BZeF2sj5PetGxPflpH1xykuh8J0vSRHPKd5M4gGt4s1eEVpOTlFLhhK238+
 Glo2xYMKIXtMjoohAa98vrqmuCzXLm1vUkD4xFahwS30f2pWjL95mI/CrNXd6jBlAovk
 7r1085cKcLRIq4kTYUc3cyw8jkwyu9ZSpTKS2J6pTpwaZoIpOdlFvDSms1wnwPHKJJH4
 LDbRl17AaqFxaQBxwRMoALNs55oo+ulJap53MohDL9qANnOs5/qi8NRTh+vQg5ViE42I
 m6fbYyDQ7pT7PrSppfqKLVuOO39vElQ0L51+9PbOQXNoULoiYhKxcAUEGlaadjW8Mx7M
 KOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524944; x=1688116944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4BuOttEkzIDjYYKlTMlX4P7EXoIDpsCsCl1iVqlonk=;
 b=fNoI8665kuhu9JMbo/3/FCUllIy4vlOKao1veHfyWdpw7oL8P1DAnvvGMoJj3JO4D3
 mPNiwMe35A1z/KDWb1FjZbOTjUbmn+3jcqGGj8njHl0gfMak9sSaDsr3HTtEbKfjHxt9
 IORYNzXKb4nJ0O99JsbnwDOg3oKjC/JUMhRP1vmKfshoeFxAwhAmvbuxhrC0Q957IcgZ
 cZJxWeaoBtkez7NtKcRXOGenNNYXEG49ECZuyQq6nqIr8j/zeiV77bA6VWR0oOQ0NvDk
 jHxpGIYy4Nm32EgkMane6KD7Bo1Ea8Ux329sGFrm/nV5ntTAhiRXbDcLyGVTa0YqWY6g
 KC8w==
X-Gm-Message-State: AC+VfDx/sgYWQiKcZ42MmHleYErqM6J2TMvc8sB3OzwGxyhOdQ3OL3A1
 4jh/hoN22e70G4HgVVVrCE6BLzjnIEMs+KylQo34NA==
X-Google-Smtp-Source: ACHHUZ4HrXjYkI4M54qsIaVszzrvdSl29q+6o63+aypXCmlUL1rf7cMtjcPmTEQhigjJpUQdr2LFELugaG7I0FmlOww=
X-Received: by 2002:a17:903:32c8:b0:1af:ccc9:ce4a with SMTP id
 i8-20020a17090332c800b001afccc9ce4amr5945680plr.25.1685524943862; Wed, 31 May
 2023 02:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-11-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-11-56eb7a4d5b8e@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 31 May 2023 11:22:12 +0200
Message-ID: <CAJZgTGHzWSmRLVzVYDHpCMuevyoXAVA43kcXuz5aKpk67NGuKw@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] drm/meson: add DSI encoder
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Jun 2023 07:37:12 +0000
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mar. 30 mai 2023 =C3=A0 09:38, Neil Armstrong
<neil.armstrong@linaro.org> a =C3=A9crit :
>
> This adds an encoder bridge designed to drive a MIPI-DSI display
> by using the ENCL encoder through the internal MIPI DSI transceiver
> connected to the output of the ENCL pixel encoder.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/meson/Makefile            |   2 +-
>  drivers/gpu/drm/meson/meson_drv.c         |   9 ++
>  drivers/gpu/drm/meson/meson_drv.h         |   1 +
>  drivers/gpu/drm/meson/meson_encoder_dsi.c | 174 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/meson/meson_encoder_dsi.h |  13 +++
>  5 files changed, 198 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makef=
ile
> index 3afa31bdc950..833e18c20603 100644
> --- a/drivers/gpu/drm/meson/Makefile
> +++ b/drivers/gpu/drm/meson/Makefile
> @@ -2,7 +2,7 @@
>  meson-drm-y :=3D meson_drv.o meson_plane.o meson_crtc.o meson_encoder_cv=
bs.o
>  meson-drm-y +=3D meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson=
_overlay.o
>  meson-drm-y +=3D meson_rdma.o meson_osd_afbcd.o
> -meson-drm-y +=3D meson_encoder_hdmi.o
> +meson-drm-y +=3D meson_encoder_hdmi.o meson_encoder_dsi.o
>
>  obj-$(CONFIG_DRM_MESON) +=3D meson-drm.o
>  obj-$(CONFIG_DRM_MESON_DW_HDMI) +=3D meson_dw_hdmi.o
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index e935c0286a20..747b639ea0c4 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -34,6 +34,7 @@
>  #include "meson_registers.h"
>  #include "meson_encoder_cvbs.h"
>  #include "meson_encoder_hdmi.h"
> +#include "meson_encoder_dsi.h"
>  #include "meson_viu.h"
>  #include "meson_vpp.h"
>  #include "meson_rdma.h"
> @@ -329,6 +330,12 @@ static int meson_drv_bind_master(struct device *dev,=
 bool has_components)
>         if (ret)
>                 goto exit_afbcd;
>
> +       if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
> +               ret =3D meson_encoder_dsi_init(priv);
> +               if (ret)
> +                       goto exit_afbcd;
> +       }
> +
>         ret =3D meson_plane_create(priv);
>         if (ret)
>                 goto exit_afbcd;
> @@ -367,6 +374,7 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
>  free_drm:
>         drm_dev_put(drm);
>
> +       meson_encoder_dsi_remove(priv);
>         meson_encoder_hdmi_remove(priv);
>         meson_encoder_cvbs_remove(priv);
>
> @@ -399,6 +407,7 @@ static void meson_drv_unbind(struct device *dev)
>         free_irq(priv->vsync_irq, drm);
>         drm_dev_put(drm);
>
> +       meson_encoder_dsi_remove(priv);
>         meson_encoder_hdmi_remove(priv);
>         meson_encoder_cvbs_remove(priv);
>
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/me=
son_drv.h
> index c62ee358456f..b23009a3380f 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -28,6 +28,7 @@ enum vpu_compatible {
>  enum {
>         MESON_ENC_CVBS =3D 0,
>         MESON_ENC_HDMI,
> +       MESON_ENC_DSI,
>         MESON_ENC_LAST,
>  };
>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/=
meson/meson_encoder_dsi.c
> new file mode 100644
> index 000000000000..812e172dec63
> --- /dev/null
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -0,0 +1,174 @@
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
> +       struct meson_encoder_dsi *encoder_dsi =3D bridge_to_meson_encoder=
_dsi(bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, encoder_dsi->next_bridg=
e,
> +                                &encoder_dsi->bridge, flags);
> +}
> +
> +static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
> +                                           struct drm_bridge_state *brid=
ge_state)
> +{
> +       struct meson_encoder_dsi *encoder_dsi =3D bridge_to_meson_encoder=
_dsi(bridge);
> +       struct drm_atomic_state *state =3D bridge_state->base.state;
> +       struct meson_drm *priv =3D encoder_dsi->priv;
> +       struct drm_connector_state *conn_state;
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_connector *connector;
> +
> +       connector =3D drm_atomic_get_new_connector_for_encoder(state, bri=
dge->encoder);
> +       if (WARN_ON(!connector))
> +               return;
> +
> +       conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> +       if (WARN_ON(!conn_state))
> +               return;
> +
> +       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> +       if (WARN_ON(!crtc_state))
> +               return;
> +
> +       /* ENCL clock setup is handled by CCF */
> +
> +       meson_venc_mipi_dsi_mode_set(priv, &crtc_state->adjusted_mode);
> +       meson_encl_load_gamma(priv);
> +
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
> +
> +       writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE=
_ADV_VFIFO_EN,
> +                           priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
> +
> +       writel_bits_relaxed(BIT(0), 0, priv->io_base + _REG(VPP_WRAP_OSD1=
_MATRIX_EN_CTRL));
> +
> +       writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
> +}
> +
> +static void meson_encoder_dsi_atomic_disable(struct drm_bridge *bridge,
> +                                            struct drm_bridge_state *bri=
dge_state)
> +{
> +       struct meson_encoder_dsi *meson_encoder_dsi =3D
> +                                       bridge_to_meson_encoder_dsi(bridg=
e);
> +       struct meson_drm *priv =3D meson_encoder_dsi->priv;
> +
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
> +
> +       writel_bits_relaxed(BIT(0), BIT(0), priv->io_base + _REG(VPP_WRAP=
_OSD1_MATRIX_EN_CTRL));
> +}
> +
> +static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs =3D =
{
> +       .attach =3D meson_encoder_dsi_attach,
> +       .atomic_enable =3D meson_encoder_dsi_atomic_enable,
> +       .atomic_disable =3D meson_encoder_dsi_atomic_disable,
> +       .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> +       .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset =3D drm_atomic_helper_bridge_reset,
> +};
> +
> +int meson_encoder_dsi_init(struct meson_drm *priv)
> +{
> +       struct meson_encoder_dsi *meson_encoder_dsi;
> +       struct device_node *remote;
> +       int ret;
> +
> +       meson_encoder_dsi =3D devm_kzalloc(priv->dev, sizeof(*meson_encod=
er_dsi), GFP_KERNEL);
> +       if (!meson_encoder_dsi)
> +               return -ENOMEM;
> +
> +       /* DSI Transceiver Bridge */
> +       remote =3D of_graph_get_remote_node(priv->dev->of_node, 2, 0);
> +       if (!remote) {
> +               dev_err(priv->dev, "DSI transceiver device is disabled");
> +               return 0;
> +       }
> +
> +       meson_encoder_dsi->next_bridge =3D of_drm_find_bridge(remote);
> +       if (!meson_encoder_dsi->next_bridge) {
> +               dev_dbg(priv->dev, "Failed to find DSI transceiver bridge=
\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       /* DSI Encoder Bridge */
> +       meson_encoder_dsi->bridge.funcs =3D &meson_encoder_dsi_bridge_fun=
cs;
> +       meson_encoder_dsi->bridge.of_node =3D priv->dev->of_node;
> +       meson_encoder_dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
> +
> +       drm_bridge_add(&meson_encoder_dsi->bridge);
> +
> +       meson_encoder_dsi->priv =3D priv;
> +
> +       /* Encoder */
> +       ret =3D drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->en=
coder,
> +                                     DRM_MODE_ENCODER_DSI);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to init DSI encoder: %d\n", re=
t);
> +               return ret;
> +       }
> +
> +       meson_encoder_dsi->encoder.possible_crtcs =3D BIT(0);
> +
> +       /* Attach DSI Encoder Bridge to Encoder */
> +       ret =3D drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_enc=
oder_dsi->bridge, NULL, 0);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /*
> +        * We should have now in place:
> +        * encoder->[dsi encoder bridge]->[dw-mipi-dsi bridge]->[panel br=
idge]->[panel]
> +        */
> +
> +       priv->encoders[MESON_ENC_DSI] =3D meson_encoder_dsi;
> +
> +       dev_dbg(priv->dev, "DSI encoder initialized\n");
> +
> +       return 0;
> +}
> +
> +void meson_encoder_dsi_remove(struct meson_drm *priv)
> +{
> +       struct meson_encoder_dsi *meson_encoder_dsi;
> +
> +       if (priv->encoders[MESON_ENC_DSI]) {
> +               meson_encoder_dsi =3D priv->encoders[MESON_ENC_DSI];
> +               drm_bridge_remove(&meson_encoder_dsi->bridge);
> +               drm_bridge_remove(meson_encoder_dsi->next_bridge);
> +       }
> +}
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.h b/drivers/gpu/drm/=
meson/meson_encoder_dsi.h
> new file mode 100644
> index 000000000000..9277d7015193
> --- /dev/null
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2021 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#ifndef __MESON_ENCODER_DSI_H
> +#define __MESON_ENCODER_DSI_H
> +
> +int meson_encoder_dsi_init(struct meson_drm *priv);
> +void meson_encoder_dsi_remove(struct meson_drm *priv);
> +
> +#endif /* __MESON_ENCODER_DSI_H */
>
> --
> 2.34.1
>
Reviewed-by: Nicolas Belin <nbelin@baylibre.com>
Tested-by: Nicolas Belin <nbelin@baylibre.com> # on Khadas VIM3 + TS050 Pan=
el

Thanks,
Nicolas
