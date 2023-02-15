Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD7697D1B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 14:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0050410E116;
	Wed, 15 Feb 2023 13:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ECC10E116
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 13:24:12 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id bw10so2774720pfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 05:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1676467452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7GnOxLWe1/WMxDYNunpHkJzS4sJeWRh+kWcuhCx9ueM=;
 b=lD9d0px0zEo4l2CjATWAv00g2N8ADXEjCI2xF2f9a5ya5vt6UYUHhp0pYyyR8ac4Mi
 2LRlY7+VfkcTq6fdi9p0lylLzuJlIPomiapwCHijO2IOLQKy1kFLuWIB1bh+r4ehai3d
 elEzmBU+r74BFgLVQF0gxB13f3bFZAWWQ9Ovu2rJKMl++Tq5ygtLfYe35Gt5hlgbIWRO
 Rn4b0f2/Clc3/A220uqE+yKs2sWq0Oxg1RQKfDKzlL866MdyT2hQJe8Dp60xJaSJDT9x
 GBBICqcFEd49jJjedTNfAkbpiEfxIF1tLIC3RbPL6YmRHJHBN/MqXG44FoIrTWzxVcOS
 p6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676467452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7GnOxLWe1/WMxDYNunpHkJzS4sJeWRh+kWcuhCx9ueM=;
 b=zwDkPlOoeWBnfOQz/YbYDxBvSBXfTkpQCjaq15DuTq7OqWjbKotbQBC0nsAPNGENch
 qZoSPfqddMsI8HUju1nuGUSMdUnM1zLk8b4PCLph3MC1M5KwhX8NhHmsloNxPByF5jLe
 cSzdt9rjlJjVmpczT3FU7JxaPuiNYy/jF2V8uz9qEmZWXJjfZNRV6irDrGKyKQnfoi2g
 kS5e4dIvni/kaK9Nm0jfmlub39T202ufayHjV/OoVA4wdloUFZ6TTa7YjyabGVKs6oAA
 Oa8nqqVqcMc1GivoAtgivQJTP8z6ffeoGWPk5lYsl1XJmdcyKW8JSAsfYxqU2DNJtk8w
 cXzQ==
X-Gm-Message-State: AO0yUKVKmlDwXboGa3ukAvNO2462sRoQzzry2PefK9PzC3xjZqBBs/R5
 /tkmavFYP+mFZgc9yMjXXa5jZOZYwi2xr4c9ikQ=
X-Google-Smtp-Source: AK7set9tkxWn+3TjLPEQLo2DbuAkWJoL23ZEJfIlKcUbcnSLUZ2T1+98L3KCqz0EpBOGN0SehYOZJQN7TFDp2uaq5FI=
X-Received: by 2002:a62:cf83:0:b0:5a8:4b71:ebf5 with SMTP id
 b125-20020a62cf83000000b005a84b71ebf5mr337434pfg.10.1676467451977; Wed, 15
 Feb 2023 05:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-2-l.stach@pengutronix.de>
 <eb199fc25e7cc6d76677225929cf3ad3ca9d410d.camel@nxp.com>
In-Reply-To: <eb199fc25e7cc6d76677225929cf3ad3ca9d410d.camel@nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 15 Feb 2023 07:24:00 -0600
Message-ID: <CAHCN7xKj83X5NB_sK1O8dLAvocfLX+mHsD3SAbRGR7Wm4cRRrw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI
To: Liu Ying <victor.liu@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000f3e68305f4bcfe17"
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sandor.yu@nxp.com,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f3e68305f4bcfe17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 17, 2022 at 2:30 AM Liu Ying <victor.liu@nxp.com> wrote:

> On Fri, 2022-12-16 at 22:07 +0100, Lucas Stach wrote:
> > Add a simple wrapper driver for the DWC HDMI bridge driver that
> > implements the few bits that are necessary to abstract the i.MX8MP
> > SoC integration.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Tested-by: Marek Vasut <marex@denx.de>
>

Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon


> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig       |   9 ++
> >  drivers/gpu/drm/bridge/imx/Makefile      |   2 +
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c | 140
> > +++++++++++++++++++++++
> >  3 files changed, 151 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
> >
>
> Can you please provide a changelog since this is v2?
>
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > b/drivers/gpu/drm/bridge/imx/Kconfig
> > index 608f47f41bcd..d828d8bfd893 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -44,4 +44,13 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
> >         Choose this to enable pixel link to display pixel
> > interface(PXL2DPI)
> >         found in Freescale i.MX8qxp processor.
> >
> > +config DRM_IMX8MP_DW_HDMI_BRIDGE
>
> Sort the config names alphabetically please.
>
> > +     tristate "i.MX8MP HDMI bridge support"
>
> To show the prompts in this Kconfig file in a consistent fashion,
> please add 'Freescale' before 'i.MX8MP'.
>
> > +     depends on OF
> > +     depends on COMMON_CLK
> > +     select DRM_DW_HDMI
> > +     help
> > +       Choose this to enable support for the internal HDMI encoder
> > found
> > +       on the i.MX8MP SoC.
> > +
> >  endif # ARCH_MXC || COMPILE_TEST
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile
> > b/drivers/gpu/drm/bridge/imx/Makefile
> > index aa90ec8d5433..03b0074ae538 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -7,3 +7,5 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-combiner.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi.o
> > +
> > +obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) +=3D imx8mp-hdmi.o
>
> Sort the config names alphabetically.
>
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
> > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
> > new file mode 100644
> > index 000000000000..06849b817aed
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
> > @@ -0,0 +1,140 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Copyright (C) 2022 Pengutronix, Lucas Stach <
> > kernel@pengutronix.de>
> > + */
> > +
> > +#include <drm/bridge/dw_hdmi.h>
> > +#include <drm/drm_modes.h>
> > +#include <linux/clk.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> Header files in linux/ come before those in drm/.
>
> > +
> > +struct imx8mp_hdmi {
> > +     struct dw_hdmi_plat_data plat_data;
> > +     struct dw_hdmi *dw_hdmi;
> > +     struct clk *pixclk;
> > +     struct clk *fdcc;
> > +};
> > +
> > +static enum drm_mode_status
> > +imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
> > +                    const struct drm_display_info *info,
> > +                    const struct drm_display_mode *mode)
> > +{
> > +     struct imx8mp_hdmi *hdmi =3D (struct imx8mp_hdmi *)data;
> > +
> > +     if (mode->clock < 13500)
> > +             return MODE_CLOCK_LOW;
> > +
> > +     if (mode->clock > 297000)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=3D
> > +         mode->clock * 1000)
> > +             return MODE_CLOCK_RANGE;
> > +
> > +     /* We don't support double-clocked and Interlaced modes */
> > +     if ((mode->flags & DRM_MODE_FLAG_DBLCLK) ||
> > +         (mode->flags & DRM_MODE_FLAG_INTERLACE))
> > +             return MODE_BAD;
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static int imx8mp_hdmi_phy_init(struct dw_hdmi *dw_hdmi, void *data,
> > +                             const struct drm_display_info *display,
> > +                             const struct drm_display_mode *mode)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void imx8mp_hdmi_phy_disable(struct dw_hdmi *dw_hdmi, void
> > *data)
> > +{
> > +}
> > +
> > +static void im8mp_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void
> > *data)
> > +{
> > +     /*
> > +      * Just release PHY core from reset, all other power management
> > is done
> > +      * by the PHY driver.
> > +      */
> > +     dw_hdmi_phy_gen1_reset(hdmi);
> > +
> > +     dw_hdmi_phy_setup_hpd(hdmi, data);
> > +}
> > +
> > +static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops =3D {
> > +     .init           =3D imx8mp_hdmi_phy_init,
> > +     .disable        =3D imx8mp_hdmi_phy_disable,
> > +     .setup_hpd      =3D im8mp_hdmi_phy_setup_hpd,
> > +     .read_hpd       =3D dw_hdmi_phy_read_hpd,
> > +     .update_hpd     =3D dw_hdmi_phy_update_hpd,
> > +};
> > +
> > +static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct dw_hdmi_plat_data *plat_data;
> > +     struct imx8mp_hdmi *hdmi;
> > +     int ret;
>
> Please fix this build warning:
>
> drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c: In function
> =E2=80=98imx8mp_dw_hdmi_probe=E2=80=99:
> drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c:80:13: warning: unused
> variable =E2=80=98ret=E2=80=99 [-Wunused-variable]
>    80 |         int ret;
>       |             ^~~
>
> > +
> > +     hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> > +     if (!hdmi)
> > +             return -ENOMEM;
> > +
> > +     plat_data =3D &hdmi->plat_data;
> > +
> > +     hdmi->pixclk =3D devm_clk_get(dev, "pix");
> > +     if (IS_ERR(hdmi->pixclk))
> > +             return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
> > +                                  "Unable to get pixel clock\n");
> > +
> > +     hdmi->fdcc =3D devm_clk_get_enabled(dev, "fdcc");
> > +     if (IS_ERR(hdmi->fdcc))
> > +             return dev_err_probe(dev, PTR_ERR(hdmi->fdcc),
> > +                                  "Unable to get FDCC clock\n");
>
> Similar to Laurent's comment on v1 here, why does fdcc clock need to be
> always enabled?
>
> > +
> > +     plat_data->mode_valid =3D imx8mp_hdmi_mode_valid;
> > +     plat_data->phy_ops =3D &imx8mp_hdmi_phy_ops;
> > +     plat_data->phy_name =3D "SAMSUNG HDMI TX PHY";
> > +     plat_data->priv_data =3D hdmi;
>
> Need to set plat_data->phy_force_vendor to be true? Or, you rely on
> reading the HDMI_CONFIG2_ID register to determine the phy type?
>
> > +
> > +     hdmi->dw_hdmi =3D dw_hdmi_probe(pdev, plat_data);
> > +     if (IS_ERR(hdmi->dw_hdmi))
> > +             return PTR_ERR(hdmi->dw_hdmi);
> > +
> > +     platform_set_drvdata(pdev, hdmi);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx8mp_dw_hdmi_remove(struct platform_device *pdev)
> > +{
> > +     struct imx8mp_hdmi *hdmi =3D platform_get_drvdata(pdev);
> > +
> > +     dw_hdmi_remove(hdmi->dw_hdmi);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id imx8mp_dw_hdmi_of_table[] =3D {
> > +     { .compatible =3D "fsl,imx8mp-hdmi" },
> > +     { /* Sentinel */ },
>
> Nitpick: ',' after the sentinel is not needed since it's the last one.
>
> Regards,
> Liu Ying
>
> > +};
> > +MODULE_DEVICE_TABLE(of, imx8mp_dw_hdmi_of_table);
> > +
> > +static struct platform_driver imx8mp_dw_hdmi_platform_driver =3D {
> > +     .probe          =3D imx8mp_dw_hdmi_probe,
> > +     .remove         =3D imx8mp_dw_hdmi_remove,
> > +     .driver         =3D {
> > +             .name   =3D "imx8mp-dw-hdmi",
> > +             .of_match_table =3D imx8mp_dw_hdmi_of_table,
> > +     },
> > +};
> > +
> > +module_platform_driver(imx8mp_dw_hdmi_platform_driver);
> > +
> > +MODULE_DESCRIPTION("i.MX8MP HDMI encoder driver");
> > +MODULE_LICENSE("GPL");
>
>

--000000000000f3e68305f4bcfe17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 17, 2022 at 2:30 AM Liu Y=
ing &lt;<a href=3D"mailto:victor.liu@nxp.com">victor.liu@nxp.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 202=
2-12-16 at 22:07 +0100, Lucas Stach wrote:<br>
&gt; Add a simple wrapper driver for the DWC HDMI bridge driver that<br>
&gt; implements the few bits that are necessary to abstract the i.MX8MP<br>
&gt; SoC integration.<br>
&gt; <br>
&gt; Signed-off-by: Lucas Stach &lt;<a href=3D"mailto:l.stach@pengutronix.d=
e" target=3D"_blank">l.stach@pengutronix.de</a>&gt;<br>
&gt; Reviewed-by: Laurent Pinchart &lt;<a href=3D"mailto:laurent.pinchart@i=
deasonboard.com" target=3D"_blank">laurent.pinchart@ideasonboard.com</a>&gt=
;<br>
&gt; Tested-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"=
_blank">marex@denx.de</a>&gt;<br></blockquote><div><br></div><div>Tested-by=
: Adam Ford &lt;<a href=3D"mailto:aford173@gmail.com">aford173@gmail.com</a=
>&gt; #imx8mp-beacon</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/imx/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A09 ++<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/imx/Makefile=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c | 140<br>
&gt; +++++++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 151 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c<br>
&gt; <br>
<br>
Can you please provide a changelog since this is v2?<br>
<br>
&gt; diff --git a/drivers/gpu/drm/bridge/imx/Kconfig<br>
&gt; b/drivers/gpu/drm/bridge/imx/Kconfig<br>
&gt; index 608f47f41bcd..d828d8bfd893 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/imx/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/bridge/imx/Kconfig<br>
&gt; @@ -44,4 +44,13 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this to enable pixel link to d=
isplay pixel<br>
&gt; interface(PXL2DPI)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found in Freescale i.MX8qxp processor=
.<br>
&gt;=C2=A0 <br>
&gt; +config DRM_IMX8MP_DW_HDMI_BRIDGE<br>
<br>
Sort the config names alphabetically please.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;i.MX8MP HDMI bridge support&quot;<=
br>
<br>
To show the prompts in this Kconfig file in a consistent fashion,<br>
please add &#39;Freescale&#39; before &#39;i.MX8MP&#39;.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on COMMON_CLK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_DW_HDMI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this to enable support for the inte=
rnal HDMI encoder<br>
&gt; found<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0on the i.MX8MP SoC.<br>
&gt; +<br>
&gt;=C2=A0 endif # ARCH_MXC || COMPILE_TEST<br>
&gt; diff --git a/drivers/gpu/drm/bridge/imx/Makefile<br>
&gt; b/drivers/gpu/drm/bridge/imx/Makefile<br>
&gt; index aa90ec8d5433..03b0074ae538 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/imx/Makefile<br>
&gt; +++ b/drivers/gpu/drm/bridge/imx/Makefile<br>
&gt; @@ -7,3 +7,5 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-comb=
iner.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o<b=
r>
&gt;=C2=A0 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi=
.o<br>
&gt; +<br>
&gt; +obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) +=3D imx8mp-hdmi.o<br>
<br>
Sort the config names alphabetically.<br>
<br>
&gt; diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c<br>
&gt; b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..06849b817aed<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c<br>
&gt; @@ -0,0 +1,140 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0+<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2022 Pengutronix, Lucas Stach &lt;<br>
&gt; <a href=3D"mailto:kernel@pengutronix.de" target=3D"_blank">kernel@peng=
utronix.de</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;drm/bridge/dw_hdmi.h&gt;<br>
&gt; +#include &lt;drm/drm_modes.h&gt;<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/mod_devicetable.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
<br>
Header files in linux/ come before those in drm/.<br>
<br>
&gt; +<br>
&gt; +struct imx8mp_hdmi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dw_hdmi_plat_data plat_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dw_hdmi *dw_hdmi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk *pixclk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk *fdcc;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static enum drm_mode_status<br>
&gt; +imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 const struct drm_display_info *info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 const struct drm_display_mode *mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct imx8mp_hdmi *hdmi =3D (struct imx8mp_hdmi =
*)data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mode-&gt;clock &lt; 13500)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_CLOCK_LOW=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mode-&gt;clock &gt; 297000)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_CLOCK_HIG=
H;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (clk_round_rate(hdmi-&gt;pixclk, mode-&gt;cloc=
k * 1000) !=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode-&gt;clock * 1000)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_CLOCK_RAN=
GE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* We don&#39;t support double-clocked and Interl=
aced modes */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((mode-&gt;flags &amp; DRM_MODE_FLAG_DBLCLK) |=
|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mode-&gt;flags &amp; DRM_MODE_FLAG=
_INTERLACE))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_BAD;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int imx8mp_hdmi_phy_init(struct dw_hdmi *dw_hdmi, void *data,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_info *display,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_mode *mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void imx8mp_hdmi_phy_disable(struct dw_hdmi *dw_hdmi, void<br>
&gt; *data)<br>
&gt; +{<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void im8mp_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void<br>
&gt; *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Just release PHY core from reset, all other po=
wer management<br>
&gt; is done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * by the PHY driver.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dw_hdmi_phy_gen1_reset(hdmi);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dw_hdmi_phy_setup_hpd(hdmi, data);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 imx8mp_hdmi_phy_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.disable=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D imx8mp_hd=
mi_phy_disable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.setup_hpd=C2=A0 =C2=A0 =C2=A0 =3D im8mp_hdmi_phy=
_setup_hpd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.read_hpd=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D dw_hdmi_p=
hy_read_hpd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.update_hpd=C2=A0 =C2=A0 =C2=A0=3D dw_hdmi_phy_up=
date_hpd,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dw_hdmi_plat_data *plat_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct imx8mp_hdmi *hdmi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
Please fix this build warning:<br>
<br>
drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c: In function<br>
=E2=80=98imx8mp_dw_hdmi_probe=E2=80=99:<br>
drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c:80:13: warning: unused<br>
variable =E2=80=98ret=E2=80=99 [-Wunused-variable]<br>
=C2=A0 =C2=A080 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<b=
r>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KER=
NEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!hdmi)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0plat_data =3D &amp;hdmi-&gt;plat_data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hdmi-&gt;pixclk =3D devm_clk_get(dev, &quot;pix&q=
uot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(hdmi-&gt;pixclk))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev_err_probe(=
dev, PTR_ERR(hdmi-&gt;pixclk),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unable to get pixel=
 clock\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hdmi-&gt;fdcc =3D devm_clk_get_enabled(dev, &quot=
;fdcc&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(hdmi-&gt;fdcc))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev_err_probe(=
dev, PTR_ERR(hdmi-&gt;fdcc),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unable to get FDCC =
clock\n&quot;);<br>
<br>
Similar to Laurent&#39;s comment on v1 here, why does fdcc clock need to be=
<br>
always enabled? <br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0plat_data-&gt;mode_valid =3D imx8mp_hdmi_mode_val=
id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0plat_data-&gt;phy_ops =3D &amp;imx8mp_hdmi_phy_op=
s;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0plat_data-&gt;phy_name =3D &quot;SAMSUNG HDMI TX =
PHY&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0plat_data-&gt;priv_data =3D hdmi;<br>
<br>
Need to set plat_data-&gt;phy_force_vendor to be true? Or, you rely on<br>
reading the HDMI_CONFIG2_ID register to determine the phy type?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hdmi-&gt;dw_hdmi =3D dw_hdmi_probe(pdev, plat_dat=
a);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(hdmi-&gt;dw_hdmi))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(hdmi-&=
gt;dw_hdmi);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, hdmi);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int imx8mp_dw_hdmi_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct imx8mp_hdmi *hdmi =3D platform_get_drvdata=
(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dw_hdmi_remove(hdmi-&gt;dw_hdmi);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id imx8mp_dw_hdmi_of_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;fsl,imx8mp-hdmi&quot; },<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ /* Sentinel */ },<br>
<br>
Nitpick: &#39;,&#39; after the sentinel is not needed since it&#39;s the la=
st one.<br>
<br>
Regards,<br>
Liu Ying<br>
<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, imx8mp_dw_hdmi_of_table);<br>
&gt; +<br>
&gt; +static struct platform_driver imx8mp_dw_hdmi_platform_driver =3D {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D imx8=
mp_dw_hdmi_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D imx8=
mp_dw_hdmi_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0=3D=
 &quot;imx8mp-dw-hdmi&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D i=
mx8mp_dw_hdmi_of_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +module_platform_driver(imx8mp_dw_hdmi_platform_driver);<br>
&gt; +<br>
&gt; +MODULE_DESCRIPTION(&quot;i.MX8MP HDMI encoder driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
<br>
</blockquote></div></div>

--000000000000f3e68305f4bcfe17--
