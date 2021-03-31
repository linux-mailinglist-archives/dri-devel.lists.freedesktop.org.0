Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0514134FC84
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345BF6EA22;
	Wed, 31 Mar 2021 09:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455F46EA22
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:20:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f26so23000737ljp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 02:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+OIv1gO6uxY8WzaB5fR8uUBJwOnLPfnfU8H+iSXLOg=;
 b=mgDLiRUtAzAGz/BZpi3FLaTEK4Ocd0y2SH0iMbnXL+AIUUlxibIuaGV5nlZRGr2NWf
 RV5+9j6CSSUOUv+aX1LYjdSJ43aTick8TJuoobVCBHgYK4SbB5zbX6rEnGlmgzqe7zyw
 rNrY1S5imiHicXlkuX3I1zrutEgMKOSO7UfhURLXiKdRkqwVjfpFP78slW5rSelSCaTq
 X2oWIdfTtKGoZLtsrNe0III21QOiwrKTiFsTe/VGPjrOH3+MBdGayIHuN7QQidlmjOsc
 Xc81TGwFrWwiAkLC3qJrR1KDKbfCUcsy5FwCgWpKh7/07dEOo4JM6mdwv4VNOjjvvsf8
 UikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+OIv1gO6uxY8WzaB5fR8uUBJwOnLPfnfU8H+iSXLOg=;
 b=ue5ISnxcN6Ji2Faw2HSFa06L1i/EQbEu4Mz66vodP3n29qdz1RcBr7uQ8/DxWBHjGb
 BcGQd3gTpW2rm34b4xo3vIgVrRlhMAf43iz81Zok0Qt7dOTvIP8HYN0wtWWqh555/8Tm
 YJOcztPT3glQI0F2nZPljf0s5AYY2wXJNitVi2I6WNOJI0c7w9NClP66ysaIR95PmHZv
 aJ9GsR720+qJyguzgwPy+7tiU27pg2ai3DjttE3GqVcZPtICuZRsFYrvi2qkfhUc4cy3
 DDO7HU38RURnDrbpBGMthfQSrorqkpSMBIr8lKnUJvwBM2POPX0A8zFGZGgQS39w7uED
 2iyA==
X-Gm-Message-State: AOAM533zSZqG60DJzwFf/Nmf3UBW+/9H8+16AUMFI65OUohQgerkCWiP
 fl/R2YfgSPm07yf3KhBciMoG6n5ePGwlfi7cG8o=
X-Google-Smtp-Source: ABdhPJxESvzvROQLc5SGNj9Uq8DMq1WXwZ7D2bEaYF7z1iwCL/YkfoZXFZ7p/6Ujo9+w4bK50dX/7p1bTXLwfOkEPgs=
X-Received: by 2002:a2e:868b:: with SMTP id l11mr1501555lji.332.1617182435635; 
 Wed, 31 Mar 2021 02:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
 <20210324105334.7pnrco53akhzjjjw@gilmour>
In-Reply-To: <20210324105334.7pnrco53akhzjjjw@gilmour>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Wed, 31 Mar 2021 09:20:02 +0800
Message-ID: <CAFPSGXY8mOEKGhMnozn5g_jCVuv+z3v1SMQcuJoAV_6Rm45Rqw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1705757445=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1705757445==
Content-Type: multipart/alternative; boundary="0000000000009cf6a705bed1a08c"

--0000000000009cf6a705bed1a08c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:53=E5=86=99=E9=81=93=EF=BC=9A

> Hi
>
> On Mon, Feb 22, 2021 at 09:28:18PM +0800, Kevin Tang wrote:
> > Adds drm support for the Unisoc's display subsystem.
> >
> > This is drm kms driver, this driver provides support for the
> > application framework in Android, Yocto and more.
> >
> > Application framework can access Unisoc's display internel
>
>                                                     ^ internal
>
> > peripherals through libdrm or libkms, it's test ok by modetest
> > (DRM/KMS test tool) and Android HWComposer.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> >
> > v4:
> >   - Move the devm_drm_dev_alloc to master_ops->bind function.
> >   - The managed drmm_mode_config_init() it is no longer necessary for
> drivers to explicitly call drm_mode_config_cleanup, so delete it.
> > ---
> >  drivers/gpu/drm/Kconfig         |   2 +
> >  drivers/gpu/drm/Makefile        |   1 +
> >  drivers/gpu/drm/sprd/Kconfig    |  12 ++
> >  drivers/gpu/drm/sprd/Makefile   |   5 +
> >  drivers/gpu/drm/sprd/sprd_drm.c | 217 ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
> >  6 files changed, 253 insertions(+)
> >  create mode 100644 drivers/gpu/drm/sprd/Kconfig
> >  create mode 100644 drivers/gpu/drm/sprd/Makefile
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 8bf103de1..9d6ce2867 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -382,6 +382,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
> >
> >  source "drivers/gpu/drm/xlnx/Kconfig"
> >
> > +source "drivers/gpu/drm/sprd/Kconfig"
> > +
> >  # Keep legacy drivers last
> >
> >  menuconfig DRM_LEGACY
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 02c229392..42d211d9c 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
> >  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
> >  obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
> >  obj-y                        +=3D xlnx/
> > +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> > new file mode 100644
> > index 000000000..6e80cc9f3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -0,0 +1,12 @@
> > +config DRM_SPRD
> > +     tristate "DRM Support for Unisoc SoCs Platform"
> > +     depends on ARCH_SPRD || COMPILE_TEST
> > +     depends on DRM && OF
> > +     select DRM_KMS_HELPER
> > +     select DRM_GEM_CMA_HELPER
> > +     select DRM_KMS_CMA_HELPER
> > +     select DRM_MIPI_DSI
>
> I guess this should rather be moved to your DSI introduction patch?
>
Thks, it's will be fixed on patch v5.

>
> > +     help
> > +       Choose this option if you have a Unisoc chipset.
> > +       If M is selected the module will be called sprd_drm.
> > +
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > new file mode 100644
> > index 000000000..86d95d93a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +subdir-ccflags-y +=3D -I$(srctree)/$(src)
>
> Is it really needed? I'm not seeing any header that aren't in the
> include path already.
>
Thks, it's will be fixed on patch v5.

>
> > +obj-y :=3D sprd_drm.o
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > new file mode 100644
> > index 000000000..a1d3ed655
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -0,0 +1,217 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "sprd_drm.h"
> > +
> > +#define DRIVER_NAME  "sprd"
> > +#define DRIVER_DESC  "Spreadtrum SoCs' DRM Driver"
> > +#define DRIVER_DATE  "20200201"
> > +#define DRIVER_MAJOR 1
> > +#define DRIVER_MINOR 0
> > +
> > +static const struct drm_mode_config_helper_funcs
> sprd_drm_mode_config_helper =3D {
> > +     .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> > +};
> > +
> > +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =
=3D {
> > +     .fb_create =3D drm_gem_fb_create,
> > +     .atomic_check =3D drm_atomic_helper_check,
> > +     .atomic_commit =3D drm_atomic_helper_commit,
> > +};
> > +
> > +static void sprd_drm_mode_config_init(struct drm_device *drm)
> > +{
> > +     drm->mode_config.min_width =3D 0;
> > +     drm->mode_config.min_height =3D 0;
> > +     drm->mode_config.max_width =3D 8192;
> > +     drm->mode_config.max_height =3D 8192;
> > +     drm->mode_config.allow_fb_modifiers =3D true;
> > +
> > +     drm->mode_config.funcs =3D &sprd_drm_mode_config_funcs;
> > +     drm->mode_config.helper_private =3D &sprd_drm_mode_config_helper;
> > +}
> > +
> > +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> > +
> > +static struct drm_driver sprd_drm_drv =3D {
> > +     .driver_features        =3D DRIVER_GEM | DRIVER_MODESET |
> DRIVER_ATOMIC,
> > +     .fops                   =3D &sprd_drm_fops,
> > +
> > +     /* GEM Operations */
> > +     DRM_GEM_CMA_DRIVER_OPS,
> > +
> > +     .name                   =3D DRIVER_NAME,
> > +     .desc                   =3D DRIVER_DESC,
> > +     .date                   =3D DRIVER_DATE,
> > +     .major                  =3D DRIVER_MAJOR,
> > +     .minor                  =3D DRIVER_MINOR,
> > +};
> > +
> > +static int sprd_drm_bind(struct device *dev)
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct drm_device *drm;
> > +     struct sprd_drm *sprd;
> > +     int ret;
> > +
> > +     sprd =3D devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm,
> drm);
> > +     if (IS_ERR(sprd))
> > +             return PTR_ERR(sprd);
> > +
> > +     drm =3D &sprd->drm;
> > +     platform_set_drvdata(pdev, drm);
> > +
> > +     ret =3D drmm_mode_config_init(drm);
> > +     if (ret)
> > +             return ret;
> > +
> > +     sprd_drm_mode_config_init(drm);
> > +
> > +     /* bind and init sub drivers */
> > +     ret =3D component_bind_all(drm->dev, drm);
> > +     if (ret) {
> > +             drm_err(drm, "failed to bind all component.\n");
> > +             return ret;
> > +     }
> > +
> > +     /* vblank init */
> > +     ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +     if (ret) {
> > +             drm_err(drm, "failed to initialize vblank.\n");
> > +             goto err_unbind_all;
> > +     }
> > +     /* with irq_enabled =3D true, we can use the vblank feature. */
> > +     drm->irq_enabled =3D true;
> > +
> > +     /* reset all the states of crtc/plane/encoder/connector */
> > +     drm_mode_config_reset(drm);
> > +
> > +     /* init kms poll for handling hpd */
> > +     drm_kms_helper_poll_init(drm);
> > +
> > +     ret =3D drm_dev_register(drm, 0);
> > +     if (ret < 0)
> > +             goto err_kms_helper_poll_fini;
> > +
> > +     return 0;
> > +
> > +err_kms_helper_poll_fini:
> > +     drm_kms_helper_poll_fini(drm);
> > +err_unbind_all:
> > +     component_unbind_all(drm->dev, drm);
> > +     return ret;
> > +}
> > +
> > +static void sprd_drm_unbind(struct device *dev)
> > +{
> > +     struct drm_device *drm =3D dev_get_drvdata(dev);
> > +
> > +     drm_dev_unregister(drm);
> > +
> > +     drm_kms_helper_poll_fini(drm);
> > +
> > +     component_unbind_all(drm->dev, drm);
> > +}
> > +
> > +static const struct component_master_ops drm_component_ops =3D {
> > +     .bind =3D sprd_drm_bind,
> > +     .unbind =3D sprd_drm_unbind,
> > +};
> > +
> > +static int compare_of(struct device *dev, void *data)
> > +{
> > +     return dev->of_node =3D=3D data;
> > +}
> > +
> > +static int sprd_drm_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     int ret;
> > +
> > +     ret =3D dma_set_mask_and_coherent(dev, ~0UL);
> > +     if (ret) {
> > +             dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
> ret);
> > +             return ret;
> > +     }
>
> It's not really clear to me what it's here for. Could you explain with a
> comment here?
>
Thks, it's will be fixed on patch v5.

>
> Thanks
> Maxime
>

--0000000000009cf6a705bed1a08c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Maxime Ripard &lt;maxime@cerno.tech&g=
t; =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=
=E5=8D=886:53=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi<br>
<br>
On Mon, Feb 22, 2021 at 09:28:18PM +0800, Kevin Tang wrote:<br>
&gt; Adds drm support for the Unisoc&#39;s display subsystem.<br>
&gt; <br>
&gt; This is drm kms driver, this driver provides support for the<br>
&gt; application framework in Android, Yocto and more.<br>
&gt; <br>
&gt; Application framework can access Unisoc&#39;s display internel<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ internal<br>
<br>
&gt; peripherals through libdrm or libkms, it&#39;s test ok by modetest<br>
&gt; (DRM/KMS test tool) and Android HWComposer.<br>
&gt; <br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; v4:<br>
&gt;=C2=A0 =C2=A0- Move the devm_drm_dev_alloc to master_ops-&gt;bind funct=
ion.<br>
&gt;=C2=A0 =C2=A0- The managed drmm_mode_config_init() it is no longer nece=
ssary for drivers to explicitly call drm_mode_config_cleanup, so delete it.=
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +<br>
&gt;=C2=A0 drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 |=C2=A0 12 ++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c | 217 ++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h |=C2=A0 16 +++<br>
&gt;=C2=A0 6 files changed, 253 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Kconfig<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig<br>
&gt; index 8bf103de1..9d6ce2867 100644<br>
&gt; --- a/drivers/gpu/drm/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/Kconfig<br>
&gt; @@ -382,6 +382,8 @@ source &quot;drivers/gpu/drm/tidss/Kconfig&quot;<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 source &quot;drivers/gpu/drm/xlnx/Kconfig&quot;<br>
&gt;=C2=A0 <br>
&gt; +source &quot;drivers/gpu/drm/sprd/Kconfig&quot;<br>
&gt; +<br>
&gt;=C2=A0 # Keep legacy drivers last<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 menuconfig DRM_LEGACY<br>
&gt; diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile<br>
&gt; index 02c229392..42d211d9c 100644<br>
&gt; --- a/drivers/gpu/drm/Makefile<br>
&gt; +++ b/drivers/gpu/drm/Makefile<br>
&gt; @@ -126,3 +126,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_MCDE) +=3D mcde/<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_TIDSS) +=3D tidss/<br>
&gt;=C2=A0 obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 +=3D xlnx/<br>
&gt; +obj-$(CONFIG_DRM_SPRD) +=3D sprd/<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconf=
ig<br>
&gt; new file mode 100644<br>
&gt; index 000000000..6e80cc9f3<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Kconfig<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +config DRM_SPRD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;DRM Support for Unisoc SoCs Platfo=
rm&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_SPRD || COMPILE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on DRM &amp;&amp; OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_GEM_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
<br>
I guess this should rather be moved to your DSI introduction patch?<br></bl=
ockquote><div>Thks, it&#39;s will be fixed on patch v5.=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this option if you have a Unisoc ch=
ipset.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If M is selected the module will be called=
 sprd_drm.<br>
&gt; +<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; new file mode 100644<br>
&gt; index 000000000..86d95d93a<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +subdir-ccflags-y +=3D -I$(srctree)/$(src)<br>
<br>
Is it really needed? I&#39;m not seeing any header that aren&#39;t in the<b=
r>
include path already.<br></blockquote><div>

Thks, it&#39;s will be fixed on patch v5.=C2=A0

=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +obj-y :=3D sprd_drm.o<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a1d3ed655<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -0,0 +1,217 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/component.h&gt;<br>
&gt; +#include &lt;linux/dma-mapping.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/of_graph.h&gt;<br>
&gt; +#include &lt;linux/of_platform.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_drv.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_of.h&gt;<br>
&gt; +#include &lt;drm/drm_probe_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_vblank.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +<br>
&gt; +#define DRIVER_NAME=C2=A0 &quot;sprd&quot;<br>
&gt; +#define DRIVER_DESC=C2=A0 &quot;Spreadtrum SoCs&#39; DRM Driver&quot;=
<br>
&gt; +#define DRIVER_DATE=C2=A0 &quot;20200201&quot;<br>
&gt; +#define DRIVER_MAJOR 1<br>
&gt; +#define DRIVER_MINOR 0<br>
&gt; +<br>
&gt; +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config=
_helper =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_commit_tail =3D drm_atomic_helper_commit_=
tail_rpm,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.fb_create =3D drm_gem_fb_create,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_check =3D drm_atomic_helper_check,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_commit =3D drm_atomic_helper_commit,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void sprd_drm_mode_config_init(struct drm_device *drm)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.min_width =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.min_height =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.max_width =3D 8192;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.max_height =3D 8192;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.allow_fb_modifiers =3D true;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.funcs =3D &amp;sprd_drm_mode_=
config_funcs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.helper_private =3D &amp;sprd_=
drm_mode_config_helper;<br>
&gt; +}<br>
&gt; +<br>
&gt; +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);<br>
&gt; +<br>
&gt; +static struct drm_driver sprd_drm_drv =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D D=
RIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;sprd_drm_fops,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* GEM Operations */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_GEM_CMA_DRIVER_OPS,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_NAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DESC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DATE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.major=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MAJOR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.minor=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MINOR,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_drm_bind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd =3D devm_drm_dev_alloc(dev, &amp;sprd_drm_dr=
v, struct sprd_drm, drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(sprd))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sprd);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm =3D &amp;sprd-&gt;drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drmm_mode_config_init(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D component_bind_all(drm-&gt;dev, drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to bind all component.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* vblank init */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_vblank_init(drm, drm-&gt;mode_config.=
num_crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to initialize vblank.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_unbind_all;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can use the vbla=
nk feature. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;irq_enabled =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* reset all the states of crtc/plane/encoder/con=
nector */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_reset(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* init kms poll for handling hpd */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_dev_register(drm, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kms_helper_p=
oll_fini;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_kms_helper_poll_fini:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
&gt; +err_unbind_all:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_unbind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dev_get_drvdata(dev);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dev_unregister(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_master_ops drm_component_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bind =3D sprd_drm_bind,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_drm_unbind,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int compare_of(struct device *dev, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return dev-&gt;of_node =3D=3D data;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_set_mask_and_coherent(dev, ~0UL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;dm=
a_set_mask_and_coherent failed (%d)\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
It&#39;s not really clear to me what it&#39;s here for. Could you explain w=
ith a<br>
comment here?<br></blockquote><div>

Thks, it&#39;s will be fixed on patch v5.=C2=A0

=C2=A0

=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks<br>
Maxime<br>
</blockquote></div></div>

--0000000000009cf6a705bed1a08c--

--===============1705757445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1705757445==--
