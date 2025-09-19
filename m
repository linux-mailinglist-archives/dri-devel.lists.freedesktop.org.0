Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4FB884B7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 09:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84A810E951;
	Fri, 19 Sep 2025 07:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FlKtfwLf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FE610E951
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:58:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso12506235e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758268696; x=1758873496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=splF+8JlyOtgaVr9dc9noPOlUZyomVcWNQU3cuIJgKU=;
 b=FlKtfwLfliKRofFzJhbbdzRqC+urcNM7CtiY6lzMSK4jDWqn0TzbhSkj5WgKgi0wId
 6hF/PzeDd+h2ZEO7QMoyvtfbuFfHJdljBEQvtH7KVURybWEe96Zu5Pfh47nLqc2v6jK4
 dAS1svB+/skPOrd9n5cVKbnGfnY7tZD/IvHCWZgNkmYV5zZQNK+v09U2Ec1L17tFEsWy
 zXnLXdV0GU9PSj87PQ69dMQ6xtjDNN5TXFZ6ju0dpV/1eXPTSeyBORjs8OKR9cQH0nCC
 XGDPVhZsz7qFzCG200Gn5GM4MrqGLENAk5J234cvPWhnQouFeoEJSmtl5K3J/FWZVJiD
 yV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268696; x=1758873496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=splF+8JlyOtgaVr9dc9noPOlUZyomVcWNQU3cuIJgKU=;
 b=QNh7ZOM0FIVWO4PQCavQTeAOvfezLy6NA0+RC8QdtsTHdW35cBT0xLV5FiQCVH1HpA
 8R2gsHZZkz3620gp1UGiFgg+csj/A2Js5G9YuZchmgLni65R2pPAvCE2ImIdnv5w6BRz
 Yb/C4+F+f0NerNZe+KltdibhS95hMF8SsRU8kGRLJc8bzodZCvguolGBVnFC3Fn1hTC2
 iBbkxMci0KviU8ukwe+pkPCRVn4tq1QEKbPCWdeJJxYWZFSiNG86DzxaONPSSS28LP09
 F3OjS6UQ8QWuHwSq6fTnd2LKN+d1+yIrMFpKXgiTnS3k++FwwCzAUc8R4rUw9son4Qi/
 M9mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdLONG9ps2NZSdZ6OFNpqXtUjo8i+L4aiMlXlNKy5HhKSs9WJmVV3qj/OX2SCwp7HCYrazuZvnj/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX2syKJjJS5n4b8258k7GDMYYA0NegSd3URmivzZEfIJ1r2rvu
 YwhS+mxjrj17FI5SFOsXHQ+OgloKvbpUzMy9YncYuMK0ZLdgeaLHwNLq/tuAWgMOmBzGa7mapLY
 7AwxMTdj8fRYgEDAZmOEPhMmm+lbW1hY=
X-Gm-Gg: ASbGncuQWxDReH+UXtkHdNfKPcpaczvcKddJjl5Jm3mlGMdnllhW/yFKx6a4ZBQYaWj
 8G0B4QJzZ0vziAeNyGjnEn2Xd/M82oKt4WHRxW9uXtVrSzVArYKJCsU1QNvNcH4n+PAbSAfLBot
 UjcQqqjxUDv6cfnjwef5vdD1qHmyxfmBTM1MJJAfGklAmNesSEfAUjT0RaFhFoEA8MTiJgYuiHp
 SBzEHIn
X-Google-Smtp-Source: AGHT+IHppvRGOigsb83+csm47sXpTHqrPSMQZfRTamYHWe7WmHrKSq19JNVz1P8bdI7gcaP501nlOyxD1WZiEO9qsDo=
X-Received: by 2002:a05:600c:a4c:b0:45f:2c7c:c1ed with SMTP id
 5b1f17b1804b1-467ebe9db02mr17555735e9.2.1758268695912; Fri, 19 Sep 2025
 00:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-10-clamor95@gmail.com>
 <4792993.1IzOArtZ34@senjougahara>
In-Reply-To: <4792993.1IzOArtZ34@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 19 Sep 2025 10:58:04 +0300
X-Gm-Features: AS18NWAXr1wNXHHzdM2gbB4uz2mpmdR1MF94EvKfyDbqthbpxnE_0eGctbJvCYQ
Message-ID: <CAPVz0n2BpSeZkoT1YV9q5bkOCkjSvOwAXNVGgM4wPUqV3jyxgg@mail.gmail.com>
Subject: Re: [PATCH v2 09/23] gpu: host1x: convert MIPI to use operations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D0=BF=D1=82, 19 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:47 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > This commit converts the existing MIPI code to use operations, which is=
 a
> > necessary step for the Tegra20/Tegra30 SoCs. Additionally, it creates a
> > dedicated header file, tegra-mipi-cal.h, to contain the MIPI calibratio=
n
> > functions, improving code organization and readability.
>
> I'd write out "operation function pointers", at least the first time. Jus=
t "operations" isn't clear to me.
>
> Please write the commit message in imperative mood (like you've done in o=
ther patches).
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dsi.c             |   1 +
> >  drivers/gpu/host1x/mipi.c               |  40 +++------
> >  drivers/staging/media/tegra-video/csi.c |   1 +
> >  include/linux/host1x.h                  |  10 ---
> >  include/linux/tegra-mipi-cal.h          | 111 ++++++++++++++++++++++++
> >  5 files changed, 126 insertions(+), 37 deletions(-)
> >  create mode 100644 include/linux/tegra-mipi-cal.h
> >
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 64f12a85a9dd..278bf2c85524 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/reset.h>
> > +#include <linux/tegra-mipi-cal.h>
> >
> >  #include <video/mipi_display.h>
> >
> > diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> > index e51b43dd15a3..2fa339a428f3 100644
> > --- a/drivers/gpu/host1x/mipi.c
> > +++ b/drivers/gpu/host1x/mipi.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> > +#include <linux/tegra-mipi-cal.h>
> >
> >  #include "dev.h"
> >
> > @@ -116,23 +117,6 @@ struct tegra_mipi_soc {
> >       u8 hsclkpuos;
> >  };
> >
> > -struct tegra_mipi {
> > -     const struct tegra_mipi_soc *soc;
> > -     struct device *dev;
> > -     void __iomem *regs;
> > -     struct mutex lock;
> > -     struct clk *clk;
> > -
> > -     unsigned long usage_count;
> > -};
> > -
> > -struct tegra_mipi_device {
> > -     struct platform_device *pdev;
> > -     struct tegra_mipi *mipi;
> > -     struct device *device;
> > -     unsigned long pads;
> > -};
> > -
> >  static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> >                                  unsigned long offset)
> >  {
> > @@ -261,7 +245,7 @@ void tegra_mipi_free(struct tegra_mipi_device *devi=
ce)
> >  }
> >  EXPORT_SYMBOL(tegra_mipi_free);
> >
> > -int tegra_mipi_enable(struct tegra_mipi_device *dev)
> > +static int tegra114_mipi_enable(struct tegra_mipi_device *dev)
> >  {
> >       int err =3D 0;
> >
> > @@ -273,11 +257,9 @@ int tegra_mipi_enable(struct tegra_mipi_device *de=
v)
> >       mutex_unlock(&dev->mipi->lock);
> >
> >       return err;
> > -
> >  }
> > -EXPORT_SYMBOL(tegra_mipi_enable);
> >
> > -int tegra_mipi_disable(struct tegra_mipi_device *dev)
> > +static int tegra114_mipi_disable(struct tegra_mipi_device *dev)
> >  {
> >       int err =3D 0;
> >
> > @@ -289,11 +271,9 @@ int tegra_mipi_disable(struct tegra_mipi_device *d=
ev)
> >       mutex_unlock(&dev->mipi->lock);
> >
> >       return err;
> > -
> >  }
> > -EXPORT_SYMBOL(tegra_mipi_disable);
> >
> > -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> > +static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *=
device)
> >  {
> >       struct tegra_mipi *mipi =3D device->mipi;
> >       void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> > @@ -309,9 +289,8 @@ int tegra_mipi_finish_calibration(struct tegra_mipi=
_device *device)
> >
> >       return err;
> >  }
> > -EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> >
> > -int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
> > +static int tegra114_mipi_start_calibration(struct tegra_mipi_device *d=
evice)
> >  {
> >       const struct tegra_mipi_soc *soc =3D device->mipi->soc;
> >       unsigned int i;
> > @@ -384,7 +363,13 @@ int tegra_mipi_start_calibration(struct tegra_mipi=
_device *device)
> >
> >       return 0;
> >  }
> > -EXPORT_SYMBOL(tegra_mipi_start_calibration);
> > +
> > +static const struct tegra_mipi_ops tegra114_mipi_ops =3D {
> > +     .tegra_mipi_enable =3D tegra114_mipi_enable,
> > +     .tegra_mipi_disable =3D tegra114_mipi_disable,
> > +     .tegra_mipi_start_calibration =3D tegra114_mipi_start_calibration=
,
> > +     .tegra_mipi_finish_calibration =3D tegra114_mipi_finish_calibrati=
on,
> > +};
> >
> >  static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
> >       { .data =3D MIPI_CAL_CONFIG_CSIA },
> > @@ -512,6 +497,7 @@ static int tegra_mipi_probe(struct platform_device =
*pdev)
> >
> >       mipi->soc =3D match->data;
> >       mipi->dev =3D &pdev->dev;
> > +     mipi->ops =3D &tegra114_mipi_ops;
> >
> >       mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NU=
LL);
> >       if (IS_ERR(mipi->regs))
> > diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/=
media/tegra-video/csi.c
> > index 74c92db1032f..9e3bd6109781 100644
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/tegra-mipi-cal.h>
> >
> >  #include <media/v4l2-fwnode.h>
> >
> > diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> > index 9fa9c30a34e6..b1c6514859d3 100644
> > --- a/include/linux/host1x.h
> > +++ b/include/linux/host1x.h
> > @@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client=
 *client);
> >  int host1x_client_suspend(struct host1x_client *client);
> >  int host1x_client_resume(struct host1x_client *client);
> >
> > -struct tegra_mipi_device;
> > -
> > -struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> > -                                          struct device_node *np);
> > -void tegra_mipi_free(struct tegra_mipi_device *device);
> > -int tegra_mipi_enable(struct tegra_mipi_device *device);
> > -int tegra_mipi_disable(struct tegra_mipi_device *device);
> > -int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> > -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> > -
> >  /* host1x memory contexts */
> >
> >  struct host1x_memory_context {
> > diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-=
cal.h
> > new file mode 100644
> > index 000000000000..2bfdbfd3cb77
> > --- /dev/null
> > +++ b/include/linux/tegra-mipi-cal.h
> > @@ -0,0 +1,111 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef __TEGRA_MIPI_CAL_H_
> > +#define __TEGRA_MIPI_CAL_H_
> > +
> > +struct tegra_mipi {
> > +     const struct tegra_mipi_soc *soc;
> > +     const struct tegra_mipi_ops *ops;
> > +     struct device *dev;
> > +     void __iomem *regs;
> > +     struct mutex lock;
> > +     struct clk *clk;
> > +
> > +     unsigned long usage_count;
> > +};
> > +
> > +struct tegra_mipi_device {
> > +     struct platform_device *pdev;
> > +     struct tegra_mipi *mipi;
> > +     struct device *device;
> > +     unsigned long pads;
> > +};
>
> We should avoid putting implementation details / chip-specific things in =
the public header. Here's a sketch of what I'm thinking about:
>
> --- tegra-mipi-cal.h:
>
> struct tegra_mipi_device;
>
> struct tegra_mipi_ops {
>         // ...
> };
>
> int tegra_mipi_add_provider(struct device_node *np, struct tegra_mipi_ops=
 *ops);
>
> int tegra_mipi_enable(...);
> // ...
>
> --- host1x/mipi.c:
>
> // move tegra114-mipi specific stuff to a new file, e.g. host1x/tegra114-=
mipi.c
>
> struct tegra_mipi_device {
>         struct tegra_mipi_ops *ops;
>         struct platform_device *pdev;
> };
>
> /* only need to support one provider */
> static struct {
>         struct device_node *np;
>         struct tegra_mipi_ops *ops;
> } provider;
>
> int tegra_mipi_add_provider(struct device_node *np, struct tegra_mipi_ops=
 *ops)
> {
>         if (provider.np)
>                 return -EBUSY;
>
>         provider.np =3D np;
>         provider.ops =3D ops;
>
>         return 0;
> }
>
> struct tegra_mipi_device *tegra_mipi_request(struct *device, struct devic=
e_node *np)
> {
>         struct device_node *phandle_np =3D /* ... */;
>         struct platform_device *pdev;
>         struct tegra_mipi_device *mipidev;
>
>         if (provider.np !=3D phandle_np)
>                 return -ENODEV;
>
>         pdev =3D /* ... */;
>
>         mipidev =3D kzalloc(...);
>         mipidev->ops =3D provider.ops;
>         mipidev->pdev =3D pdev;
>         mipidev->cells =3D phandle_cells;
>
>         return mipidev;
> }
>
> int tegra_mipi_enable(struct tegra_mipi_device *device)
> {
>         return device->ops->enable(platform_get_drvdata(device->pdev), de=
vice->cells);
> }
>
> > +
> > +/**
> > + * Operations for Tegra MIPI calibration device
> > + */
> > +struct tegra_mipi_ops {
> > +     /**
> > +      * @tegra_mipi_enable:
> > +      *
> > +      * Enable MIPI calibration device
> > +      */
> > +     int (*tegra_mipi_enable)(struct tegra_mipi_device *device);
>
> The tegra_mipi_ prefix should be dropped for the field names.
>
> > +
> > +     /**
> > +      * @tegra_mipi_disable:
> > +      *
> > +      * Disable MIPI calibration device
> > +      */
> > +     int (*tegra_mipi_disable)(struct tegra_mipi_device *device);
> > +
> > +     /**
> > +      * @tegra_mipi_start_calibration:
> > +      *
> > +      * Start MIPI calibration
> > +      */
> > +     int (*tegra_mipi_start_calibration)(struct tegra_mipi_device *dev=
ice);
> > +
> > +     /**
> > +      * @tegra_mipi_finish_calibration:
> > +      *
> > +      * Finish MIPI calibration
> > +      */
> > +     int (*tegra_mipi_finish_calibration)(struct tegra_mipi_device *de=
vice);
> > +};
> > +
> > +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> > +                                          struct device_node *np);
> > +
> > +void tegra_mipi_free(struct tegra_mipi_device *device);
> > +
> > +static inline int tegra_mipi_enable(struct tegra_mipi_device *device)
> > +{
> > +     /* Tegra114+ has a dedicated MIPI calibration block */
> > +     if (device->mipi) {
> > +             if (!device->mipi->ops->tegra_mipi_enable)
> > +                     return 0;
> > +
> > +             return device->mipi->ops->tegra_mipi_enable(device);
> > +     }
> > +
> > +     return -ENOSYS;
> > +}
> > +
> > +static inline int tegra_mipi_disable(struct tegra_mipi_device *device)
> > +{
> > +     if (device->mipi) {
> > +             if (!device->mipi->ops->tegra_mipi_disable)
> > +                     return 0;
> > +
> > +             return device->mipi->ops->tegra_mipi_disable(device);
> > +     }
> > +
> > +     return -ENOSYS;
> > +}
> > +
> > +static inline int tegra_mipi_start_calibration(struct tegra_mipi_devic=
e *device)
> > +{
> > +     if (device->mipi) {
> > +             if (!device->mipi->ops->tegra_mipi_start_calibration)
> > +                     return 0;
> > +
> > +             return device->mipi->ops->tegra_mipi_start_calibration(de=
vice);
> > +     }
> > +
> > +     return -ENOSYS;
> > +}
> > +
> > +static inline int tegra_mipi_finish_calibration(struct tegra_mipi_devi=
ce *device)
> > +{
> > +     if (device->mipi) {
> > +             if (!device->mipi->ops->tegra_mipi_finish_calibration)
> > +                     return 0;
> > +
> > +             return device->mipi->ops->tegra_mipi_finish_calibration(d=
evice);
> > +     }
> > +
> > +     return -ENOSYS;
> > +}
> > +
> > +#endif /* __TEGRA_MIPI_CAL_H_ */
> >
>

All this is good, but how to include into this CSI? Adding support for
CSI is why I am even touching this at the first place.
