Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAF516BC89
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59B16EA75;
	Tue, 25 Feb 2020 08:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388936E8A1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 03:08:13 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id q9so5108450qvu.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 19:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XVf7kd6r7xHFB5py5oJnqcscb38CC042OwSdNMCXYM=;
 b=CHiORoDBVVy3+/xONvNKvDYTuSW8Qi22uzXnwCY9au//VWeKV9PHGYf8mASMnY88lq
 g31XOob/Jenz8e5ij3WwHEDh7gsI+5MwYQN8C1dNCsfvrnTnaWCbGHpzKhIVWB4lR92b
 ToQ3GhY8Sm6fusda9gpGN4a4T3h34kk/ReqHG9vD5BvdpOdJRLSXMzSneXR733fN3pyz
 BY53OrY6C/pSJ25tOHixlLcAlwij/gLnRpSfFX4YOuElJUrKz4pWMA711ZzooR89qvZn
 yPmpvPn3+rvW3XnF2746zPEq0EFC4lO/NSSCJt5hDWoujG8v7e8FuWiU+xC+boKhqimn
 EHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XVf7kd6r7xHFB5py5oJnqcscb38CC042OwSdNMCXYM=;
 b=Cxo5GeuYNIMbJCpPwAg+5lesXYOg27leCf4teMLdVTvchkqoJjG2AcJunnkBr6wBRz
 9M8SOmXifw8d3G20rupTNrsIW3FV2LAp6WDBXMHwewrMDRZq+lIj9gaF2ZCGJLx7MtUo
 AfBMVAvFMD5Shacw3e2LKFsDe4dREiHr00fapmY+oelNNfcb20BxxSFroKNe7J/USkTs
 sdnNf0fhlsfeTiAVV4okWk55ELIvQOEFip8RjLjLvhqIy239f5xMMesFB92yucfc0WZE
 NC7btS0R6qPFOLbBGD/aPeoBD8j8MwAjzah63rkYziApUMqMPcHags7/CUNRKAaP4M0N
 BlRg==
X-Gm-Message-State: APjAAAW0+Dv7CLDpp83NeV0l3SfVSNnMmgbDGPfunvR4Zto9zVA1rfO2
 UTwiD4xwycme75VyxLT2rDj74FZzEPYVqKVdUik=
X-Google-Smtp-Source: APXvYqy/FnpShfvAqcBis3PhbZ7KSszp+y/LVm6S4UfG72YMKdoevidM0H0XpJ5Sziorzam0xhmyOuzJGx7mzVcSURs=
X-Received: by 2002:a0c:b38a:: with SMTP id t10mr28397011qve.198.1582600092144; 
 Mon, 24 Feb 2020 19:08:12 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
 <CACvgo53vUwt2vrcFTYGQCx30pQ1+FsxsAX7OOC9J7YfgQz2Qfg@mail.gmail.com>
In-Reply-To: <CACvgo53vUwt2vrcFTYGQCx30pQ1+FsxsAX7OOC9J7YfgQz2Qfg@mail.gmail.com>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Tue, 25 Feb 2020 11:08:00 +0800
Message-ID: <CAFPSGXY2gamtWgn-d0FAAMC2aEAgsOFMpzrctuwDcHEm_Ot_GA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 Dave Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1019469001=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1019469001==
Content-Type: multipart/alternative; boundary="000000000000505a26059f5dcc1b"

--000000000000505a26059f5dcc1b
Content-Type: text/plain; charset="UTF-8"

Got it, thanks!

On Tue, Feb 25, 2020 at 12:43 AM Emil Velikov <emil.l.velikov@gmail.com>
wrote:

> Hi all,
>
> On Fri, 21 Feb 2020 at 11:15, Kevin Tang <kevin3.tang@gmail.com> wrote:
> >
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > Adds drm support for the Unisoc's display subsystem.
> >
> > This is drm device and gem driver. This driver provides support for the
> > Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Baolin Wang <baolin.wang@linaro.org>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  drivers/gpu/drm/Kconfig         |   2 +
> >  drivers/gpu/drm/Makefile        |   1 +
> >  drivers/gpu/drm/sprd/Kconfig    |  14 ++
> >  drivers/gpu/drm/sprd/Makefile   |   7 +
> >  drivers/gpu/drm/sprd/sprd_drm.c | 292
> ++++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
> >  6 files changed, 332 insertions(+)
> >  create mode 100644 drivers/gpu/drm/sprd/Kconfig
> >  create mode 100644 drivers/gpu/drm/sprd/Makefile
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index bfdadc3..cead12c 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
> >
> >  source "drivers/gpu/drm/mcde/Kconfig"
> >
> > +source "drivers/gpu/drm/sprd/Kconfig"
> > +
> >  # Keep legacy drivers last
> >
> >  menuconfig DRM_LEGACY
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 9f1c7c4..85ca211 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  += lima/
> >  obj-$(CONFIG_DRM_PANFROST) += panfrost/
> >  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
> >  obj-$(CONFIG_DRM_MCDE) += mcde/
> > +obj-$(CONFIG_DRM_SPRD) += sprd/
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> > new file mode 100644
> > index 0000000..79f286b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -0,0 +1,14 @@
> > +config DRM_SPRD
> > +       tristate "DRM Support for Unisoc SoCs Platform"
> > +       depends on ARCH_SPRD
> > +       depends on DRM && OF
> > +       select DRM_KMS_HELPER
> > +       select DRM_GEM_CMA_HELPER
> > +       select DRM_KMS_CMA_HELPER
> > +       select DRM_MIPI_DSI
> > +       select DRM_PANEL
> > +       select VIDEOMODE_HELPERS
> > +       select BACKLIGHT_CLASS_DEVICE
> > +       help
> > +         Choose this option if you have a Unisoc chipsets.
> > +         If M is selected the module will be called sprd-drm.
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > new file mode 100644
> > index 0000000..63b8751
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +ccflags-y += -Iinclude/drm
> > +
> > +subdir-ccflags-y += -I$(src)
> > +
> > +obj-y := sprd_drm.o
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > new file mode 100644
> > index 0000000..7cac098
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -0,0 +1,292 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
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
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "sprd_drm.h"
> > +
> > +#define DRIVER_NAME    "sprd"
> > +#define DRIVER_DESC    "Spreadtrum SoCs' DRM Driver"
> > +#define DRIVER_DATE    "20191101"
> > +#define DRIVER_MAJOR   1
> > +#define DRIVER_MINOR   0
> > +
> > +static const struct drm_mode_config_helper_funcs
> sprd_drm_mode_config_helper = {
> > +       .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> > +};
> > +
> > +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs = {
> > +       .fb_create = drm_gem_fb_create,
> > +       .atomic_check = drm_atomic_helper_check,
> > +       .atomic_commit = drm_atomic_helper_commit,
> > +};
> > +
> > +static void sprd_drm_mode_config_init(struct drm_device *drm)
> > +{
> > +       drm_mode_config_init(drm);
> > +
> > +       drm->mode_config.min_width = 0;
> > +       drm->mode_config.min_height = 0;
> > +       drm->mode_config.max_width = 8192;
> > +       drm->mode_config.max_height = 8192;
> > +       drm->mode_config.allow_fb_modifiers = true;
> > +
> > +       drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
> > +       drm->mode_config.helper_private = &sprd_drm_mode_config_helper;
> > +}
> > +
> > +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> > +
> > +static struct drm_driver sprd_drm_drv = {
> > +       .driver_features        = DRIVER_GEM | DRIVER_MODESET |
> DRIVER_ATOMIC,
> > +       .fops                   = &sprd_drm_fops,
> > +
> > +       /* GEM Operations */
> > +       DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +
> > +       .name                   = DRIVER_NAME,
> > +       .desc                   = DRIVER_DESC,
> > +       .date                   = DRIVER_DATE,
> > +       .major                  = DRIVER_MAJOR,
> > +       .minor                  = DRIVER_MINOR,
> > +};
> > +
> > +static int sprd_drm_bind(struct device *dev)
> > +{
> > +       struct drm_device *drm;
> > +       struct sprd_drm *sprd;
> > +       int err;
> > +
> > +       drm = drm_dev_alloc(&sprd_drm_drv, dev);
> > +       if (IS_ERR(drm))
> > +               return PTR_ERR(drm);
> > +
> > +       dev_set_drvdata(dev, drm);
> > +
> > +       sprd = devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> > +       if (!sprd) {
> > +               err = -ENOMEM;
> > +               goto err_free_drm;
> > +       }
> > +       drm->dev_private = sprd;
> > +
> > +       sprd_drm_mode_config_init(drm);
> > +
> > +       /* bind and init sub drivers */
> > +       err = component_bind_all(drm->dev, drm);
> > +       if (err) {
> > +               DRM_ERROR("failed to bind all component.\n");
> > +               goto err_dc_cleanup;
> > +       }
> > +
> > +       /* vblank init */
> > +       err = drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +       if (err) {
> > +               DRM_ERROR("failed to initialize vblank.\n");
> > +               goto err_unbind_all;
> > +       }
> > +       /* with irq_enabled = true, we can use the vblank feature. */
> > +       drm->irq_enabled = true;
> > +
> > +       /* reset all the states of crtc/plane/encoder/connector */
> > +       drm_mode_config_reset(drm);
> > +
> > +       /* init kms poll for handling hpd */
> > +       drm_kms_helper_poll_init(drm);
> > +
> > +       err = drm_dev_register(drm, 0);
> > +       if (err < 0)
> > +               goto err_kms_helper_poll_fini;
> > +
> > +       return 0;
> > +
> > +err_kms_helper_poll_fini:
> > +       drm_kms_helper_poll_fini(drm);
> > +err_unbind_all:
> > +       component_unbind_all(drm->dev, drm);
> > +err_dc_cleanup:
> > +       drm_mode_config_cleanup(drm);
> > +err_free_drm:
> > +       drm_dev_put(drm);
> > +       return err;
> > +}
> > +
> > +static void sprd_drm_unbind(struct device *dev)
> > +{
> > +       drm_put_dev(dev_get_drvdata(dev));
> > +}
> > +
> > +static const struct component_master_ops drm_component_ops = {
> > +       .bind = sprd_drm_bind,
> > +       .unbind = sprd_drm_unbind,
> > +};
> > +
> > +static int compare_of(struct device *dev, void *data)
> > +{
> > +       struct device_node *np = data;
> > +
> > +       DRM_DEBUG("compare %s\n", np->full_name);
> > +
> > +       return dev->of_node == np;
> > +}
> > +
> > +static int sprd_drm_component_probe(struct device *dev,
> > +                          const struct component_master_ops *m_ops)
> > +{
> > +       struct device_node *ep, *port, *remote;
> > +       struct component_match *match = NULL;
> > +       int i;
> > +
> > +       if (!dev->of_node)
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Bind the crtc's ports first, so that
> drm_of_find_possible_crtcs()
> > +        * called from encoder's .bind callbacks works as expected
> > +        */
> > +       for (i = 0; ; i++) {
> > +               port = of_parse_phandle(dev->of_node, "ports", i);
> > +               if (!port)
> > +                       break;
> > +
> > +               if (!of_device_is_available(port->parent)) {
> > +                       of_node_put(port);
> > +                       continue;
> > +               }
> > +
> > +               component_match_add(dev, &match, compare_of,
> port->parent);
> > +               of_node_put(port);
> > +       }
> > +
> > +       if (i == 0) {
> > +               dev_err(dev, "missing 'ports' property\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       if (!match) {
> > +               dev_err(dev, "no available port\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       /*
> > +        * For bound crtcs, bind the encoders attached to their remote
> endpoint
> > +        */
> > +       for (i = 0; ; i++) {
> > +               port = of_parse_phandle(dev->of_node, "ports", i);
> > +               if (!port)
> > +                       break;
> > +
> > +               if (!of_device_is_available(port->parent)) {
> > +                       of_node_put(port);
> > +                       continue;
> > +               }
> > +
> > +               for_each_child_of_node(port, ep) {
> > +                       remote = of_graph_get_remote_port_parent(ep);
> > +                       if (!remote || !of_device_is_available(remote)) {
> > +                               of_node_put(remote);
> > +                               continue;
> > +                       } else if
> (!of_device_is_available(remote->parent)) {
> > +                               dev_warn(dev, "parent device of %s is
> not available\n",
> > +                                        remote->full_name);
> > +                               of_node_put(remote);
> > +                               continue;
> > +                       }
> > +
> > +                       component_match_add(dev, &match, compare_of,
> remote);
> > +                       of_node_put(remote);
> > +               }
> > +               of_node_put(port);
> > +       }
> > +
> > +       return component_master_add_with_match(dev, m_ops, match);
>
> This whole function is effectively a copy of drm_of_component_probe().
> Reuse that instead.
>
> With that + comments from Sam addressed this patch is:
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
>
> -Emil
>

--000000000000505a26059f5dcc1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it, thanks! <br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 25, 2020 at 12:43 AM Emil =
Velikov &lt;<a href=3D"mailto:emil.l.velikov@gmail.com">emil.l.velikov@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi all,<br>
<br>
On Fri, 21 Feb 2020 at 11:15, Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@=
gmail.com" target=3D"_blank">kevin3.tang@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt;<br>
&gt; Adds drm support for the Unisoc&#39;s display subsystem.<br>
&gt;<br>
&gt; This is drm device and gem driver. This driver provides support for th=
e<br>
&gt; Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.<br>
&gt;<br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Baolin Wang &lt;<a href=3D"mailto:baolin.wang@linaro.org" target=
=3D"_blank">baolin.wang@linaro.org</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +<br>
&gt;=C2=A0 drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 |=C2=A0 14 ++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c | 292 ++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h |=C2=A0 16 +++<br>
&gt;=C2=A0 6 files changed, 332 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Kconfig<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig<br>
&gt; index bfdadc3..cead12c 100644<br>
&gt; --- a/drivers/gpu/drm/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/Kconfig<br>
&gt; @@ -387,6 +387,8 @@ source &quot;drivers/gpu/drm/aspeed/Kconfig&quot;<=
br>
&gt;<br>
&gt;=C2=A0 source &quot;drivers/gpu/drm/mcde/Kconfig&quot;<br>
&gt;<br>
&gt; +source &quot;drivers/gpu/drm/sprd/Kconfig&quot;<br>
&gt; +<br>
&gt;=C2=A0 # Keep legacy drivers last<br>
&gt;<br>
&gt;=C2=A0 menuconfig DRM_LEGACY<br>
&gt; diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile<br>
&gt; index 9f1c7c4..85ca211 100644<br>
&gt; --- a/drivers/gpu/drm/Makefile<br>
&gt; +++ b/drivers/gpu/drm/Makefile<br>
&gt; @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)=C2=A0 +=3D lima/<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_MCDE) +=3D mcde/<br>
&gt; +obj-$(CONFIG_DRM_SPRD) +=3D sprd/<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconf=
ig<br>
&gt; new file mode 100644<br>
&gt; index 0000000..79f286b<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Kconfig<br>
&gt; @@ -0,0 +1,14 @@<br>
&gt; +config DRM_SPRD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;DRM Support for Unisoc SoCs=
 Platform&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_SPRD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DRM &amp;&amp; OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_GEM_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_PANEL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select VIDEOMODE_HELPERS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BACKLIGHT_CLASS_DEVICE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this option if you have a Un=
isoc chipsets.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If M is selected the module will be=
 called sprd-drm.<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; new file mode 100644<br>
&gt; index 0000000..63b8751<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +ccflags-y +=3D -Iinclude/drm<br>
&gt; +<br>
&gt; +subdir-ccflags-y +=3D -I$(src)<br>
&gt; +<br>
&gt; +obj-y :=3D sprd_drm.o<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..7cac098<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -0,0 +1,292 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
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
&gt; +#include &lt;drm/drm_probe_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_vblank.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +<br>
&gt; +#define DRIVER_NAME=C2=A0 =C2=A0 &quot;sprd&quot;<br>
&gt; +#define DRIVER_DESC=C2=A0 =C2=A0 &quot;Spreadtrum SoCs&#39; DRM Drive=
r&quot;<br>
&gt; +#define DRIVER_DATE=C2=A0 =C2=A0 &quot;20191101&quot;<br>
&gt; +#define DRIVER_MAJOR=C2=A0 =C2=A01<br>
&gt; +#define DRIVER_MINOR=C2=A0 =C2=A00<br>
&gt; +<br>
&gt; +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config=
_helper =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_commit_tail =3D drm_atomic_helper_=
commit_tail_rpm,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.fb_create =3D drm_gem_fb_create,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_check =3D drm_atomic_helper_check,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_commit =3D drm_atomic_helper_commi=
t,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void sprd_drm_mode_config_init(struct drm_device *drm)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_config_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.min_width =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.min_height =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.max_width =3D 8192;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.max_height =3D 8192;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.allow_fb_modifiers =3D=
 true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.funcs =3D &amp;sprd_dr=
m_mode_config_funcs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;mode_config.helper_private =3D &am=
p;sprd_drm_mode_config_helper;<br>
&gt; +}<br>
&gt; +<br>
&gt; +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);<br>
&gt; +<br>
&gt; +static struct drm_driver sprd_drm_drv =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;sprd_drm_fops,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* GEM Operations */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_GEM_CMA_VMAP_DRIVER_OPS,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_NAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DESC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D DRIVER_DATE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.major=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MAJOR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.minor=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D DRIVER_MINOR,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_drm_bind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm =3D drm_dev_alloc(&amp;sprd_drm_drv, d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(drm))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_set_drvdata(dev, drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd =3D devm_kzalloc(drm-&gt;dev, sizeof(=
*sprd), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sprd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ENOME=
M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_free_=
drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;dev_private =3D sprd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D component_bind_all(drm-&gt;dev, dr=
m);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;failed to bind all component.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dc_cl=
eanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* vblank init */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_vblank_init(drm, drm-&gt;mode_=
config.num_crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;failed to initialize vblank.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_unbin=
d_all;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can use t=
he vblank feature. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm-&gt;irq_enabled =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* reset all the states of crtc/plane/enco=
der/connector */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_config_reset(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* init kms poll for handling hpd */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_dev_register(drm, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kms_h=
elper_poll_fini;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_kms_helper_poll_fini:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
&gt; +err_unbind_all:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br=
>
&gt; +err_dc_cleanup:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_config_cleanup(drm);<br>
&gt; +err_free_drm:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dev_put(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_unbind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_put_dev(dev_get_drvdata(dev));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_master_ops drm_component_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.bind =3D sprd_drm_bind,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_drm_unbind,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int compare_of(struct device *dev, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;compare %s\n&quot;, np-&gt=
;full_name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;of_node =3D=3D np;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_component_probe(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct component_master_ops *m_ops)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *ep, *port, *remote;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct component_match *match =3D NULL;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dev-&gt;of_node)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Bind the crtc&#39;s ports first, so tha=
t drm_of_find_possible_crtcs()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * called from encoder&#39;s .bind callbac=
ks works as expected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; ; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_pa=
rse_phandle(dev-&gt;of_node, &quot;ports&quot;, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_device=
_is_available(port-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0of_node_put(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0component_matc=
h_add(dev, &amp;match, compare_of, port-&gt;parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(po=
rt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;missing &#39;ports&#39; property\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!match) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;no available port\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For bound crtcs, bind the encoders atta=
ched to their remote endpoint<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; ; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_pa=
rse_phandle(dev-&gt;of_node, &quot;ports&quot;, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_device=
_is_available(port-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0of_node_put(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_child=
_of_node(port, ep) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0remote =3D of_graph_get_remote_port_parent(ep);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (!remote || !of_device_is_available(remote)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0} else if (!of_device_is_available(remote-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot;parent device=
 of %s is not available\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remo=
te-&gt;full_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0component_match_add(dev, &amp;match, compare_of, remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(po=
rt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return component_master_add_with_match(dev=
, m_ops, match);<br>
<br>
This whole function is effectively a copy of drm_of_component_probe().<br>
Reuse that instead.<br>
<br>
With that + comments from Sam addressed this patch is:<br>
Reviewed-by: Emil Velikov &lt;<a href=3D"mailto:emil.velikov@collabora.com"=
 target=3D"_blank">emil.velikov@collabora.com</a>&gt;<br>
<br>
-Emil<br>
</blockquote></div>

--000000000000505a26059f5dcc1b--

--===============1019469001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1019469001==--
