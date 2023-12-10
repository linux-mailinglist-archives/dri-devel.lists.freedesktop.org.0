Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E833E80BC5C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 18:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C1210E043;
	Sun, 10 Dec 2023 17:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED82A10E043
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 17:35:23 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6ce6d926f76so2432393b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702229723; x=1702834523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6Ue6ZZgr2xh9plvrWujHlHCEzhi9QUDt2M4ve2YKzs=;
 b=dExBOntqfBDw5klSpuaB9lD7YT5GOF0Y4Y5O8JGxEMQxXH5p7hkC2K+Q/JDMt/BRF8
 37a5BE3Mc4MJlVn2jwqR4K6NfqTJjKuiWWz+0FcqUz8PVjO/xQvJWWgZHiHG0ln1h3ab
 YlxjYcxpNEzGiLgLB4W1DyQhcKiAd3AKrr666CKY+s43GdiuS0/2/8NgVqhEdpNPZzxE
 Zm3yNXcFOZ0RkQtS/tDpA/4wFMYfKfQqPH0XiX9yLY9rWhXQ4S1105wjQpUtD6+PhPYr
 ajCghPoekGHmibJYaUHZnYHP4ZjWcCcAhe5e2tur+ifgq+cujDgEh7Zoaww9PYA1M4vi
 jhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702229723; x=1702834523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6Ue6ZZgr2xh9plvrWujHlHCEzhi9QUDt2M4ve2YKzs=;
 b=UHiGDwxjfOgvyJ72aaUOXFWnFWr7v9bjcUHTh4hmfp/nOtqvBf9alFmcrbSpk/AUOs
 2kfduXCTjCC3vR0iDV/XC9fuDCFXIT2M6cCt9y/6kSE6spXFR7lh6nb5CC/4RIDCHT2n
 yyPdqKTZu3Znf0IXE3PiCBDmnFktDrkhQlfUWIUTK0Sx6vhx1nlQjlp1ciRSNNpXbJ6i
 2+1CCxuRByeWL1kUJD170rQah+Kv7oisUgTI0FPASISOpVyA2icfcETMiwohwl58d9wq
 kz0+bJq/fMzCG1Tqetv7TuZeq7Lx02r0C1B1QUlSFlfglU/oE9E1jdWAzda1s8z+f2n0
 FIAg==
X-Gm-Message-State: AOJu0YzN8UyET+0JFSX1HW7v1v2+sutw2+6hCMe7Y819uK89NrANs70r
 SGJLrRp2vpmMyctz/9hWSOL2pEEJwLM4pv8OTfw=
X-Google-Smtp-Source: AGHT+IEtzuT8SpO2qLFgJhu5x3rZX50qxQWCOGHIKEgyZ0NA/p6gZFxh/cU/IDVW1PZmP0kjDBadB8ct4SCC8TA3H5U=
X-Received: by 2002:a17:90a:9918:b0:286:1e90:fe2f with SMTP id
 b24-20020a17090a991800b002861e90fe2fmr3782757pjp.15.1702229723231; Sun, 10
 Dec 2023 09:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
 <20230920205736.GB7723@pendragon.ideasonboard.com>
In-Reply-To: <20230920205736.GB7723@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 10 Dec 2023 11:35:11 -0600
Message-ID: <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sandor Yu <sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 patchwork-lst@pengutronix.de, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 3:57=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Lucas,
>
> Thank you for the patch.
>
> On Wed, Sep 20, 2023 at 07:10:09PM +0200, Lucas Stach wrote:
> > This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has=
 a
> > full timing generator and can switch between different video sources. O=
n
> > the i.MX8MP however the only supported source is the LCDIF. The block
> > just needs to be powered up and told about the polarity of the video
> > sync signals to act in bypass mode.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> > Tested-by: Marek Vasut <marex@denx.de> (v1)
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> > Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
> >  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 206 +++++++++++++++++++
> >  3 files changed, 214 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridg=
e/imx/Kconfig
> > index 9fae28db6aa7..3a4e663d922a 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -3,6 +3,13 @@ if ARCH_MXC || COMPILE_TEST
> >  config DRM_IMX_LDB_HELPER
> >       tristate
> >
> > +config DRM_IMX8MP_HDMI_PVI
> > +     tristate "Freescale i.MX8MP HDMI PVI bridge support"
> > +     depends on OF
> > +     help
> > +       Choose this to enable support for the internal HDMI TX Parallel
> > +       Video Interface found on the Freescale i.MX8MP SoC.
> > +
> >  config DRM_IMX8QM_LDB
> >       tristate "Freescale i.MX8QM LVDS display bridge"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/brid=
ge/imx/Makefile
> > index 8e2ebf3399a1..be9b4f9adb50 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -1,4 +1,5 @@
> >  obj-$(CONFIG_DRM_IMX_LDB_HELPER) +=3D imx-ldb-helper.o
> > +obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) +=3D imx8mp-hdmi-pvi.o
> >  obj-$(CONFIG_DRM_IMX8QM_LDB) +=3D imx8qm-ldb.o
> >  obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-combiner.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu=
/drm/bridge/imx/imx8mp-hdmi-pvi.c
> > new file mode 100644
> > index 000000000000..5ccd70c98187
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> > @@ -0,0 +1,206 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> > + */
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_crtc.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#define HTX_PVI_CTRL                 0x0
> > +#define  PVI_CTRL_OP_VSYNC_POL               BIT(18)
> > +#define  PVI_CTRL_OP_HSYNC_POL               BIT(17)
> > +#define  PVI_CTRL_OP_DE_POL          BIT(16)
> > +#define  PVI_CTRL_INP_VSYNC_POL              BIT(14)
> > +#define  PVI_CTRL_INP_HSYNC_POL              BIT(13)
> > +#define  PVI_CTRL_INP_DE_POL         BIT(12)
> > +#define  PVI_CTRL_MODE_MASK          GENMASK(2, 1)
> > +#define  PVI_CTRL_MODE_LCDIF         2
> > +#define  PVI_CTRL_EN                 BIT(0)
> > +
> > +struct imx8mp_hdmi_pvi {
> > +     struct drm_bridge       bridge;
> > +     struct device           *dev;
> > +     struct drm_bridge       *next_bridge;
> > +     void __iomem            *regs;
> > +};
> > +
> > +static inline struct imx8mp_hdmi_pvi *
> > +to_imx8mp_hdmi_pvi(struct drm_bridge *bridge)
> > +{
> > +     return container_of(bridge, struct imx8mp_hdmi_pvi, bridge);
> > +}
> > +
> > +static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
> > +                                      enum drm_bridge_attach_flags fla=
gs)
> > +{
> > +     struct imx8mp_hdmi_pvi *pvi =3D to_imx8mp_hdmi_pvi(bridge);
> > +
> > +     return drm_bridge_attach(bridge->encoder, pvi->next_bridge,
> > +                              bridge, flags);
> > +}
> > +
> > +static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge=
_state)
> > +{
> > +     struct drm_atomic_state *state =3D bridge_state->base.state;
> > +     struct imx8mp_hdmi_pvi *pvi =3D to_imx8mp_hdmi_pvi(bridge);
> > +     struct drm_connector_state *conn_state;
> > +     const struct drm_display_mode *mode;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector *connector;
> > +     u32 bus_flags, val;
> > +
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(state, bri=
dge->encoder);
> > +     conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> > +
> > +     if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
> > +             return;
> > +
> > +     mode =3D &crtc_state->adjusted_mode;
> > +
> > +     val =3D FIELD_PREP(PVI_CTRL_MODE_MASK, PVI_CTRL_MODE_LCDIF) | PVI=
_CTRL_EN;
> > +
> > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > +             val |=3D PVI_CTRL_OP_VSYNC_POL | PVI_CTRL_INP_VSYNC_POL;
> > +
> > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > +             val |=3D PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
> > +
> > +     if (pvi->next_bridge->timings)
> > +             bus_flags =3D pvi->next_bridge->timings->input_bus_flags;
> > +     else if (bridge_state)
> > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > +
> > +     if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
> > +             val |=3D PVI_CTRL_OP_DE_POL | PVI_CTRL_INP_DE_POL;
> > +
> > +     writel(val, pvi->regs + HTX_PVI_CTRL);
> > +}
> > +
> > +static void imx8mp_hdmi_pvi_bridge_disable(struct drm_bridge *bridge,
> > +                                        struct drm_bridge_state *bridg=
e_state)
> > +{
> > +     struct imx8mp_hdmi_pvi *pvi =3D to_imx8mp_hdmi_pvi(bridge);
> > +
> > +     writel(0x0, pvi->regs + HTX_PVI_CTRL);
> > +
> > +     pm_runtime_put(pvi->dev);
> > +}
> > +
> > +static u32 *
> > +imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge=
_state,
> > +                                       struct drm_crtc_state *crtc_sta=
te,
> > +                                       struct drm_connector_state *con=
n_state,
> > +                                       u32 output_fmt,
> > +                                       unsigned int *num_input_fmts)
> > +{
> > +     struct imx8mp_hdmi_pvi *pvi =3D to_imx8mp_hdmi_pvi(bridge);
> > +     struct drm_bridge *next_bridge =3D pvi->next_bridge;
> > +     struct drm_bridge_state *next_state;
> > +
> > +     if (!next_bridge->funcs->atomic_get_input_bus_fmts)
> > +             return 0;
> > +
> > +     next_state =3D drm_atomic_get_new_bridge_state(crtc_state->state,
> > +                                                  next_bridge);
> > +
> > +     return next_bridge->funcs->atomic_get_input_bus_fmts(next_bridge,
> > +                                                          next_state,
> > +                                                          crtc_state,
> > +                                                          conn_state,
> > +                                                          output_fmt,
> > +                                                          num_input_fm=
ts);
> > +}
> > +
> > +static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs =3D {
> > +     .attach         =3D imx8mp_hdmi_pvi_bridge_attach,
> > +     .atomic_enable  =3D imx8mp_hdmi_pvi_bridge_enable,
> > +     .atomic_disable =3D imx8mp_hdmi_pvi_bridge_disable,
> > +     .atomic_get_input_bus_fmts =3D imx8mp_hdmi_pvi_bridge_get_input_b=
us_fmts,
> > +     .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +};
> > +
> > +static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
> > +{
> > +     struct device_node *remote;
> > +     struct imx8mp_hdmi_pvi *pvi;
> > +
> > +     pvi =3D devm_kzalloc(&pdev->dev, sizeof(*pvi), GFP_KERNEL);
> > +     if (!pvi)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, pvi);
> > +     pvi->dev =3D &pdev->dev;
> > +
> > +     pvi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(pvi->regs))
> > +             return PTR_ERR(pvi->regs);
> > +
> > +     /* Get the next bridge in the pipeline. */
> > +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
> > +     if (!remote)
> > +             return -EINVAL;
> > +
> > +     pvi->next_bridge =3D of_drm_find_bridge(remote);
> > +     of_node_put(remote);
> > +
> > +     if (!pvi->next_bridge)
> > +             return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> > +                                  "could not find next bridge\n");
> > +
> > +     /* Register the bridge. */
> > +     pvi->bridge.funcs =3D &imx_hdmi_pvi_bridge_funcs;
> > +     pvi->bridge.of_node =3D pdev->dev.of_node;
> > +     pvi->bridge.timings =3D pvi->next_bridge->timings;
> > +
> > +     drm_bridge_add(&pvi->bridge);
> > +
> > +     pm_runtime_enable(&pdev->dev);
>
> I would move this just before drm_bridge_add(). In theory, as soon as
> the bridge is added, it could get used, so it's a good practice to
> initialize everything before adding it.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx8mp_hdmi_pvi_remove(struct platform_device *pdev)
> > +{
> > +     struct imx8mp_hdmi_pvi *pvi =3D platform_get_drvdata(pdev);
> > +
> > +     pm_runtime_disable(&pdev->dev);
> > +
> > +     drm_bridge_remove(&pvi->bridge);
>
> And here you could flip the two as well for consistency.
>
> With these minor changes,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Lucas,

It's been a few months since there has been any action.  If you want,
I can help apply the suggestions that Laurent has and re-submit with
both of our names if you want.  It would be nice to get this
integrated.

adam
>
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id imx8mp_hdmi_pvi_match[] =3D {
> > +     {
> > +             .compatible =3D "fsl,imx8mp-hdmi-pvi",
> > +     }, {
> > +             /* sentinel */
> > +     }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pvi_match);
> > +
> > +static struct platform_driver imx8mp_hdmi_pvi_driver =3D {
> > +     .probe  =3D imx8mp_hdmi_pvi_probe,
> > +     .remove =3D imx8mp_hdmi_pvi_remove,
> > +     .driver         =3D {
> > +             .name =3D "imx-hdmi-pvi",
> > +             .of_match_table =3D imx8mp_hdmi_pvi_match,
> > +     },
> > +};
> > +module_platform_driver(imx8mp_hdmi_pvi_driver);
> > +
> > +MODULE_DESCRIPTION("i.MX8MP HDMI TX Parallel Video Interface bridge dr=
iver");
> > +MODULE_LICENSE("GPL");
>
> --
> Regards,
>
> Laurent Pinchart
