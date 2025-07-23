Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3464B101F2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDD510E8A5;
	Thu, 24 Jul 2025 07:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KewJP+xT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DCB10E058
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:45:39 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3e28be470f1so3448695ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753256739; x=1753861539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Z2c1E2HlWEomA33WDGgiqLFYGCrGr/mjGJf+DEuvUc=;
 b=KewJP+xTnkX2hsDoJSo0w6NWI8PiNiBbG36sdTC/M8s/vSC+cc5B/+1vwJsDZ/xKLt
 kfhDu19Aqo/MlGE8GKaLzGLXO1eNKD5nPSdPlyJ1GyUrviWEbFgZJxVZBtydUuZCM98x
 FdspqIL0pu5V9z7GIqHYtVz98DNm/XhnxjCnIGHZjd9i/az5teJ3DVyTHQNn0BCwQXzS
 bfDoPZsU7mqJIWkyQjH93JM5m0Gq+ph8ACLGvD11344wNZMFiq7SmpckKgEJ4w2cuSp2
 CVD9quxSevqNUtXA9r1vZsWCe1G7IuoN8K/ZygOfSmVeWDlVgMLBIX/miLuAF/Q0MrUJ
 iHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753256739; x=1753861539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Z2c1E2HlWEomA33WDGgiqLFYGCrGr/mjGJf+DEuvUc=;
 b=BFRaZKBagJPFNQv26A4OeoKE5L+7LA66IGvNF7n9PRzOA7trbKJII5k0WnwFcOeHDU
 i71T/xE5FGf2Rckk5i9PeymxhoPvn88U5iLjdmN2iDABT5xJ0H0aQLIi37iiBs1jMe+d
 r/tu79Up1Flh1AVnK8K3J+Hq6weOtN7bvARuNulnorDktP/jBMIa0GmGPKs4kvmOyuj3
 cnMi9GpbK8gSWMZFTGQjGYT8pm3+lEmgfBOl2kw5eNGYDyVICl4YYI7ydzkPXs1PBJU+
 kxTKJ5RjffaWgWQ1AYye3wmbDBTvi5F4iTyMDfN6686OP2RcH3N5vyQsz+NPeFgRv+/S
 owGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8xkFCIuaPPpAVBpV+kJngLKr7nWKOBd5VG+TEtkL+jFUkqSFZ/dX02OuEYotO24FYksJdhNtVg5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa7zuKv25w+KQ3Z/zfONRIXP4pZV1yq1xh4zASW/em29Ed+iZM
 1Y+OoS8QSkfIcPMBzKC2TUcFi3EivsMIHgbi6vN9AF8ySJzICgqvZPcV8ir6wA1z3kmc/4ugl2y
 76DkGZKk7008PQMQ7PY+qW+hJuSHRs28=
X-Gm-Gg: ASbGncvV9gJh+71puVtKQ2mRIlblY5b2TDwG1xFhgnGnoqkuS/dZM7Ro5cQsvGbSM2G
 2BHcYaSpfncyyjEQzjxXRDq/KOC2DrNjr5xx2FFLrc+A+8o51+x8qcE1Zu79QobzCu6Kk9Tvxxm
 Itj0f+VTNKKNXazsn+r9wCfoJ3f3R3Lioyxvr6/Zs4gKVuKo1h00ijW2A0s2DyVsTwRBbGmehRQ
 hWVIrw=
X-Google-Smtp-Source: AGHT+IFICg7g8jaxZZ+Em4CTXub/ZgcFu74MTTIlrlGcvffuXbT96y1FY09GFVR1OYxPAAaXugobzPmygdQsHFOlJHM=
X-Received: by 2002:a05:6e02:2162:b0:3d9:2992:671b with SMTP id
 e9e14a558f8ab-3e2be6d8bf0mr95356415ab.4.1753256738796; Wed, 23 Jul 2025
 00:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-3-shengjiu.wang@nxp.com>
 <e7c90b0c-8aec-4fe0-85ef-a629e67a56a0@nxp.com>
In-Reply-To: <e7c90b0c-8aec-4fe0-85ef-a629e67a56a0@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:45:25 +0800
X-Gm-Features: Ac12FXyU9MWwc47HuNlLZ4wsOV8YjC_8os7rfcH7895czw6qE04EF09wd4hE6AY
Message-ID: <CAA+D8APjsiMnmnaAsxdcLi5g0hHgGSpFCgAxo042RK4yD-DraQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Jul 2025 07:35:09 +0000
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

On Tue, Jul 22, 2025 at 4:47=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/18/2025, Shengjiu Wang wrote:
> > The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> > acts as the bridge between the Audio Subsystem to the HDMI TX Controlle=
r.
> > This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> >
> > Data received from the audio subsystem can have an arbitrary component
> > ordering. The HTX_PAI block has integrated muxing options to select whi=
ch
> > sections of the 32-bit input data word will be mapped to each IEC60958
> > field. The HTX_PAI_FIELD_CTRL register contains mux selects to
> > individually select P,C,U,V,Data, and Preamble.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
> >  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 134 +++++++++++++++++++
> >  include/drm/bridge/dw_hdmi.h                 |   6 +
> >  4 files changed, 148 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridg=
e/imx/Kconfig
> > index 9a480c6abb85..d95fa84a8dcd 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -24,6 +24,13 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> >         Choose this to enable support for the internal HDMI encoder fou=
nd
> >         on the i.MX8MP SoC.
> >
> > +config DRM_IMX8MP_HDMI_PAI
> > +     tristate "Freescale i.MX8MP HDMI PAI bridge support"
> > +     depends on OF
> > +     help
> > +       Choose this to enable support for the internal HDMI TX Parallel
> > +       Audio Interface found on the Freescale i.MX8MP SoC.
>
> Should DRM_IMX8MP_DW_HDMI_BRIDGE imply DRM_IMX8MP_HDMI_PAI as it implies
> DRM_IMX8MP_HDMI_PVI and PHY_FSL_SAMSUNG_HDMI_PHY?

yes.

>
> > +
> >  config DRM_IMX8MP_HDMI_PVI
> >       tristate "Freescale i.MX8MP HDMI PVI bridge support"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/brid=
ge/imx/Makefile
> > index dd5d48584806..8d01fda25451 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -1,6 +1,7 @@
> >  obj-$(CONFIG_DRM_IMX_LDB_HELPER) +=3D imx-ldb-helper.o
> >  obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) +=3D imx-legacy-bridge.o
> >  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) +=3D imx8mp-hdmi-tx.o
> > +obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) +=3D imx8mp-hdmi-pai.o
> >  obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) +=3D imx8mp-hdmi-pvi.o
> >  obj-$(CONFIG_DRM_IMX8QM_LDB) +=3D imx8qm-ldb.o
> >  obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu=
/drm/bridge/imx/imx8mp-hdmi-pai.c
> > new file mode 100644
> > index 000000000000..f09ee2622e57
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> > @@ -0,0 +1,134 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#include <drm/bridge/dw_hdmi.h>
>
> Usually, linux/*.h header files come before drm/*.h header files.
>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define HTX_PAI_CTRL                   0x00
> > +#define HTX_PAI_CTRL_EXT               0x04
> > +#define HTX_PAI_FIELD_CTRL             0x08
> > +#define HTX_PAI_STAT                   0x0c
> > +#define HTX_PAI_IRQ_NOMASK             0x10
> > +#define HTX_PAI_IRQ_MASKED             0x14
> > +#define HTX_PAI_IRQ_MASK               0x18
>
> The above 4 registers are unused.  Drop.
>
> > +
> > +#define CTRL_ENABLE                    BIT(0)
>
> Drop CTRL_ prefix.  Same for the other bits/fields.
>
> Define this bit under register HTX_PAI_CTRL.  Same for bits/fields of
> the other registers.

Ok, will update them.
>
> > +
> > +#define CTRL_EXT_WTMK_HIGH_MASK                GENMASK(31, 24)
> > +#define CTRL_EXT_WTMK_HIGH             (0x3 << 24)
>
> Add a parameter for the macro and use FIELD_PREP.
> Same for WTMK_LOW and NUM_CH.
>
> #define WTMK_HIGH(n)    FIELD_PREP(WTMK_HIGH_MASK, (n))
>
> > +#define CTRL_EXT_WTMK_LOW_MASK         GENMASK(23, 16)
> > +#define CTRL_EXT_WTMK_LOW              (0x3 << 16)
> > +#define CTRL_EXT_NUM_CH_MASK           GENMASK(10, 8)
> > +#define CTRL_EXT_NUM_CH_SHIFT          8
>
> This is not needed if FIELD_PREP is used.
>
> > +
> > +#define FIELD_CTRL_B_FILT              BIT(31)
> > +#define FIELD_CTRL_PARITY_EN           BIT(30)
> > +#define FIELD_CTRL_END_SEL             BIT(29)
> > +#define FIELD_CTRL_PRE_SEL             GENMASK(28, 24)
> > +#define FIELD_CTRL_PRE_SEL_SHIFT       24
> > +#define FIELD_CTRL_D_SEL               GENMASK(23, 20)
> > +#define FIELD_CTRL_D_SEL_SHIFT         20
> > +#define FIELD_CTRL_V_SEL               GENMASK(19, 15)
> > +#define FIELD_CTRL_V_SEL_SHIFT         15
> > +#define FIELD_CTRL_U_SEL               GENMASK(14, 10)
> > +#define FIELD_CTRL_U_SEL_SHIFT         10
> > +#define FIELD_CTRL_C_SEL               GENMASK(9, 5)
> > +#define FIELD_CTRL_C_SEL_SHIFT         5
> > +#define FIELD_CTRL_P_SEL               GENMASK(4, 0)
> > +#define FIELD_CTRL_P_SEL_SHIFT         0
> > +
> > +struct imx8mp_hdmi_pai {
> > +     struct device   *dev;
> > +     void __iomem    *base;
> > +};
> > +
> > +static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channe=
l,
> > +                                int width, int rate, int non_pcm)
> > +{
> > +     const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw=
_hdmi);
> > +     struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pd=
ata->priv_audio;
> > +     int val;
> > +
> > +     /* PAI set */
>
> /* PAI set control extended */
>
> > +     val =3D CTRL_EXT_WTMK_HIGH | CTRL_EXT_WTMK_LOW;
> > +     val |=3D ((channel - 1) << CTRL_EXT_NUM_CH_SHIFT);
> > +     writel(val, hdmi_pai->base + HTX_PAI_CTRL_EXT);
>
> Can you use regmap API?

yes.

>
> > +
> > +     /* IEC60958 format */
> > +     val =3D 31 << FIELD_CTRL_P_SEL_SHIFT;
> > +     val |=3D 30 << FIELD_CTRL_C_SEL_SHIFT;
> > +     val |=3D 29 << FIELD_CTRL_U_SEL_SHIFT;
> > +     val |=3D 28 << FIELD_CTRL_V_SEL_SHIFT;
> > +     val |=3D 4 << FIELD_CTRL_D_SEL_SHIFT;
> > +     val |=3D 0 << FIELD_CTRL_PRE_SEL_SHIFT;
> > +
>
> Nit: remove this blank line.
>
> > +     writel(val, hdmi_pai->base + HTX_PAI_FIELD_CTRL);
>
> Nit: add a blank line here.
>
> > +     /* PAI start running */
> > +     writel(CTRL_ENABLE, hdmi_pai->base + HTX_PAI_CTRL);
> > +}
> > +
> > +static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
> > +{
> > +     const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw=
_hdmi);
> > +     struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pd=
ata->priv_audio;
> > +
> > +     /* Stop PAI */
> > +     writel(0, hdmi_pai->base + HTX_PAI_CTRL);
> > +}
> > +
> > +static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct dw_hdmi_plat_data *plat_data;
> > +     struct imx8mp_hdmi_pai *hdmi_pai;
> > +     struct device_node *remote;
> > +     struct platform_device *hdmi_tx;
> > +     struct resource *res;
> > +
> > +     hdmi_pai =3D devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> > +     if (!hdmi_pai)
> > +             return -ENOMEM;
> > +
> > +     hdmi_pai->base =3D devm_platform_get_and_ioremap_resource(pdev, 0=
, &res);
> > +     if (IS_ERR(hdmi_pai->base))
> > +             return PTR_ERR(hdmi_pai->base);
> > +
> > +     hdmi_pai->dev =3D dev;
> > +
> > +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 0, -1);
> > +     if (!remote)
> > +             return -EINVAL;
> > +
> > +     hdmi_tx =3D of_find_device_by_node(remote);
> > +     if (!hdmi_tx)
> > +             return -EINVAL;
> > +
> > +     plat_data =3D platform_get_drvdata(hdmi_tx);
> > +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> > +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
>
> {enable,disable}_audio callbacks could be set too late...
> You are trying to probe this driver after imx8mp_hdmi_tx is probed,
> i.e., after dw_hdmi_probe() is called in imx8mp_dw_hdmi_probe().
> Note that after dw_hdmi_probe() is called, the audio device could be
> functional soon, while this probe is called asynchronously.
>
> Also, what if imx8mp_hdmi_pai module is removed while imx8mp_hdmi_tx
> is running?  Leaking {enable,disable}_audio callbacks?
>
> I think that you may try to use component helper to take imx8mp_hdmi_tx
> as an aggregate driver and this driver as a component driver.  After
> the component is bound, you may set {enable,disable}_audio callbacks
> in imx8mp_hdmi_tx before calling dw_hdmi_probe().
> And, you need to export imx8mp_hdmi_pai_{enable,disable} symbols.

yes, will use component helper.  with component helper, we can assign
the {enable, disable}_audio in .bind() callback,  not matter which driver
probe first.

best regards
Shengjiu Wang
>
> > +     plat_data->priv_audio =3D hdmi_pai;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id imx8mp_hdmi_pai_of_table[] =3D {
> > +     { .compatible =3D "fsl,imx8mp-hdmi-pai" },
> > +     { /* Sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> > +
> > +static struct platform_driver imx8mp_hdmi_pai_platform_driver =3D {
> > +     .probe          =3D imx8mp_hdmi_pai_probe,
> > +     .driver         =3D {
> > +             .name   =3D "imx8mp-hdmi-pai",
> > +             .of_match_table =3D imx8mp_hdmi_pai_of_table,
> > +     },
> > +};
> > +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> > +
> > +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.=
h
> > index a56a3519a22a..9ca70ce80cc5 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
> >                                          const struct drm_display_info =
*info,
> >                                          const struct drm_display_mode =
*mode);
> >
> > +     /*
> > +      * priv_audio is specially used for additional audio device to ge=
t
> > +      * driver data through this dw_hdmi_plat_data.
> > +      */
> > +     void *priv_audio;
> > +
> >       /* Platform-specific audio enable/disable (optional) */
> >       void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
> >                            int width, int rate, int non_pcm);
>
> --
> Regards,
> Liu Ying
