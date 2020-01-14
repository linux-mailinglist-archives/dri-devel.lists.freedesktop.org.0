Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DEB13BADB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153426E87A;
	Wed, 15 Jan 2020 08:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9912E6E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 14:06:16 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c16so12150958qko.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 06:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UEsaEz7Zw63ZfdcgUg9vGRUewjWKPR/YtPwu9rqvjE0=;
 b=AXM0UABzvmwBeysqdrhGbofTH8ChFNXjZpWOW+HvIkxetChBdui7OrZxwFt676BZaw
 0uWN75bf3iaABpd4obZ5rIlRzxRWxHY8jfG5NuX5+eszAKWLvVzTzLKeERIFelALHzQ/
 xnMvgys1x1Kc1ljwgY6e70UMTuNEfSBazpKCzHwSTdJi7dyRAaOVG+DUMTWmxGHcha2L
 SU/w7aHygVzhqKuh2/XKM51oRAbETC8pBpLwb0aQoX8ippoH1411yrFY79fljz47vvKm
 7fiTceY4up4rFjWMMsF9KhlFJW8BkE7AnNr7FIizVOg1fS1MIwi8F6rS5Mo2hmVpNAee
 Dh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UEsaEz7Zw63ZfdcgUg9vGRUewjWKPR/YtPwu9rqvjE0=;
 b=jLMpjOPJ/JWqmpyxZw1owx+/X8SLwsAE8o7lp81NyimxhrFQdG5nTN46KH+1MBYeDI
 M7BWsGnUORVgRoRfrNyC526R2Xr5u4G9ktBszv21Vr8sMMK9xG68sKu01h8HI0yC8npw
 Rp1DTVDR+u5FTs16toAXhFSZA0EUFtA0yKQfo3R+yPoeZYA6dHgXqMhhJWgXZGEJIid2
 /cJEDS903UlIED6sTAjKJE6pNel31S5gHD3sQEd81JU5Kj6VUCsnZhG2eZvuMA4lffhI
 Szg1EurDSu+xjCT+SMvaXWXCWQ0y6h7DrsOiu05XjHM4VhRz1/Wci997E/U4lADfQsUS
 tkmw==
X-Gm-Message-State: APjAAAVaa8ByatG0aitOCetpddNbqabz2yCtnoPfTjPvwb9uNNTLPB1K
 PWBoowX56nVnZYXKi9igIPCYi5VW3kzrdg/JsW8=
X-Google-Smtp-Source: APXvYqwkm7Y+Uf7VFj/sURbqBlQHK1j1u4XYyQqM8dBEVED+qDVIC+ByOgj1OXQfDBLJJWgK/xSDPUD1VmjzJOJMHng=
X-Received: by 2002:a05:620a:669:: with SMTP id
 a9mr22087136qkh.266.1579010775509; 
 Tue, 14 Jan 2020 06:06:15 -0800 (PST)
MIME-Version: 1.0
References: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
 <1576496419-12409-3-git-send-email-kevin3.tang@gmail.com>
 <f540df4e-5869-8a7d-612a-49b57dc44efc@suse.de>
 <CAFPSGXbNqZ+GmSdfDnzobxYAx8yQaw+S1N3R3wAQF+GFNTcjZg@mail.gmail.com>
 <208ae136-e0f9-20d6-f92a-03639ee4d380@suse.de>
In-Reply-To: <208ae136-e0f9-20d6-f92a-03639ee4d380@suse.de>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Tue, 14 Jan 2020 22:05:53 +0800
Message-ID: <CAFPSGXbiP=FE2Eej1=z9++-WhTJ2gvu_BOU5uHSNyoSxD3EgNw@mail.gmail.com>
Subject: Re: [PATCH RFC v1 2/6] drm/sprd: add Unisoc's drm kms master
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1635999276=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1635999276==
Content-Type: multipart/alternative; boundary="0000000000005eef65059c1a182c"

--0000000000005eef65059c1a182c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1) Convert to generic CMA handlers and submit. You'd want the least
amount of code in your patches, so they go in quickly and easily.
Ok, I will follow this suggestion=EF=BC=8C thank you very much!

On Tue, Jan 7, 2020 at 8:22 PM Thomas Zimmermann <tzimmermann@suse.de>
wrote:

> Hi
>
> Am 07.01.20 um 12:36 schrieb tang pengchuan:
> > Hi Thomas,
> > Our soc needs to support both cma and iommu, but our iommu is not ready
> > for upload, so i remove it from sprd_gem.c
> > So can i upload the cma code first=EF=BC=9F and add iommu support later
>
> This might be possible, but I cannot make the decision. I'd suggest a
> different strategy.
>
>  1) Convert to generic CMA handlers and submit. You'd want the least
> amount of code in your patches, so they go in quickly and easily.
>
>  2) Duplicate CMA handlers into your driver and add IOMMU support.
> Submit this patchset at a later point when it's ready.
>
> Just an untested idea: Is it a generic IOMMU or a GART? With a generic
> IOMMU it could be possible to implement dma_map_ops for your platform.
> CMA helpers will use the IOMMU in their call to dma_alloc_wc(). [1] If
> this works, you would not have to maintain you own GEM code and can
> merge IOMMU support at any time.
>
> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/kernel/dma/mapping.c#L298
>
>
> >
> > On Mon, Jan 6, 2020 at 6:11 PM Thomas Zimmermann <tzimmermann@suse.de
> > <mailto:tzimmermann@suse.de>> wrote:
> >
> >     Hi Kevin
> >
> >     Am 16.12.19 um 12:40 schrieb Kevin Tang:
> >     > From: Kevin Tang <kevin.tang@unisoc.com
> >     <mailto:kevin.tang@unisoc.com>>
> >     >
> >     > Adds drm support for the Unisoc's display subsystem.
> >     >
> >     > This is drm device and gem driver. This driver provides support
> >     for the
> >     > Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher=
.
> >     >
> >     > Cc: Orson Zhai <orsonzhai@gmail.com <mailto:orsonzhai@gmail.com>>
> >     > Cc: Baolin Wang <baolin.wang@linaro.org
> >     <mailto:baolin.wang@linaro.org>>
> >     > Cc: Chunyan Zhang <zhang.lyra@gmail.com <mailto:
> zhang.lyra@gmail.com>>
> >     > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com
> >     <mailto:kevin.tang@unisoc.com>>
> >     > ---
> >     >  drivers/gpu/drm/Kconfig         |   2 +
> >     >  drivers/gpu/drm/Makefile        |   1 +
> >     >  drivers/gpu/drm/sprd/Kconfig    |  14 ++
> >     >  drivers/gpu/drm/sprd/Makefile   |   8 ++
> >     >  drivers/gpu/drm/sprd/sprd_drm.c | 286
> >     ++++++++++++++++++++++++++++++++++++++++
> >     >  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
> >     >  drivers/gpu/drm/sprd/sprd_gem.c | 178 +++++++++++++++++++++++++
> >     >  drivers/gpu/drm/sprd/sprd_gem.h |  30 +++++
> >     >  8 files changed, 535 insertions(+)
> >     >  create mode 100644 drivers/gpu/drm/sprd/Kconfig
> >     >  create mode 100644 drivers/gpu/drm/sprd/Makefile
> >     >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
> >     >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> >     >  create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c
> >     >  create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h
> >     >
> >     > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >     > index bfdadc3..cead12c 100644
> >     > --- a/drivers/gpu/drm/Kconfig
> >     > +++ b/drivers/gpu/drm/Kconfig
> >     > @@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
> >     >
> >     >  source "drivers/gpu/drm/mcde/Kconfig"
> >     >
> >     > +source "drivers/gpu/drm/sprd/Kconfig"
> >     > +
> >     >  # Keep legacy drivers last
> >     >
> >     >  menuconfig DRM_LEGACY
> >     > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> >     > index 9f1c7c4..85ca211 100644
> >     > --- a/drivers/gpu/drm/Makefile
> >     > +++ b/drivers/gpu/drm/Makefile
> >     > @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  +=3D lima/
> >     >  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/
> >     >  obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
> >     >  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
> >     > +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> >     > diff --git a/drivers/gpu/drm/sprd/Kconfig
> >     b/drivers/gpu/drm/sprd/Kconfig
> >     > new file mode 100644
> >     > index 0000000..79f286b
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/Kconfig
> >     > @@ -0,0 +1,14 @@
> >     > +config DRM_SPRD
> >     > +     tristate "DRM Support for Unisoc SoCs Platform"
> >     > +     depends on ARCH_SPRD
> >     > +     depends on DRM && OF
> >     > +     select DRM_KMS_HELPER
> >     > +     select DRM_GEM_CMA_HELPER
> >     > +     select DRM_KMS_CMA_HELPER
> >     > +     select DRM_MIPI_DSI
> >     > +     select DRM_PANEL
> >     > +     select VIDEOMODE_HELPERS
> >     > +     select BACKLIGHT_CLASS_DEVICE
> >     > +     help
> >     > +       Choose this option if you have a Unisoc chipsets.
> >     > +       If M is selected the module will be called sprd-drm.
> >     > \ No newline at end of file
> >     > diff --git a/drivers/gpu/drm/sprd/Makefile
> >     b/drivers/gpu/drm/sprd/Makefile
> >     > new file mode 100644
> >     > index 0000000..df0b316
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/Makefile
> >     > @@ -0,0 +1,8 @@
> >     > +# SPDX-License-Identifier: GPL-2.0
> >     > +
> >     > +ccflags-y +=3D -Iinclude/drm
> >     > +
> >     > +subdir-ccflags-y +=3D -I$(src)
> >     > +
> >     > +obj-y :=3D sprd_drm.o \
> >     > +     sprd_gem.o
> >     > \ No newline at end of file
> >     > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> >     b/drivers/gpu/drm/sprd/sprd_drm.c
> >     > new file mode 100644
> >     > index 0000000..4aee25fa4
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> >     > @@ -0,0 +1,286 @@
> >     > +// SPDX-License-Identifier: GPL-2.0
> >     > +/*
> >     > + * Copyright (C) 2019 Unisoc Inc.
> >     > + */
> >     > +
> >     > +#include <linux/component.h>
> >     > +#include <linux/dma-mapping.h>
> >     > +#include <linux/module.h>
> >     > +#include <linux/mutex.h>
> >     > +#include <linux/of_graph.h>
> >     > +#include <linux/of_platform.h>
> >     > +
> >     > +#include <drm/drm_atomic_helper.h>
> >     > +#include <drm/drm_crtc_helper.h>
> >     > +#include <drm/drm_drv.h>
> >     > +#include <drm/drm_gem_cma_helper.h>
> >     > +#include <drm/drm_gem_framebuffer_helper.h>
> >     > +#include <drm/drm_probe_helper.h>
> >     > +#include <drm/drm_vblank.h>
> >     > +
> >     > +#include "sprd_drm.h"
> >     > +#include "sprd_gem.h"
> >     > +
> >     > +#define DRIVER_NAME  "sprd"
> >     > +#define DRIVER_DESC  "Spreadtrum SoCs' DRM Driver"
> >     > +#define DRIVER_DATE  "20191101"
> >     > +#define DRIVER_MAJOR 1
> >     > +#define DRIVER_MINOR 0
> >     > +
> >     > +static const struct drm_mode_config_helper_funcs
> >     sprd_drm_mode_config_helper =3D {
> >     > +     .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> >     > +};
> >     > +
> >     > +static const struct drm_mode_config_funcs
> >     sprd_drm_mode_config_funcs =3D {
> >     > +     .fb_create =3D drm_gem_fb_create,
> >     > +     .atomic_check =3D drm_atomic_helper_check,
> >     > +     .atomic_commit =3D drm_atomic_helper_commit,
> >     > +};
> >     > +
> >     > +static void sprd_drm_mode_config_init(struct drm_device *drm)
> >     > +{
> >     > +     drm_mode_config_init(drm);
> >     > +
> >     > +     drm->mode_config.min_width =3D 0;
> >     > +     drm->mode_config.min_height =3D 0;
> >     > +     drm->mode_config.max_width =3D 8192;
> >     > +     drm->mode_config.max_height =3D 8192;
> >     > +     drm->mode_config.allow_fb_modifiers =3D true;
> >     > +
> >     > +     drm->mode_config.funcs =3D &sprd_drm_mode_config_funcs;
> >     > +     drm->mode_config.helper_private =3D
> &sprd_drm_mode_config_helper;
> >     > +}
> >     > +
> >     > +static const struct file_operations sprd_drm_fops =3D {
> >     > +     .owner          =3D THIS_MODULE,
> >     > +     .open           =3D drm_open,
> >     > +     .release        =3D drm_release,
> >     > +     .unlocked_ioctl =3D drm_ioctl,
> >     > +     .compat_ioctl   =3D drm_compat_ioctl,
> >     > +     .poll           =3D drm_poll,
> >     > +     .read           =3D drm_read,
> >     > +     .llseek         =3D no_llseek,
> >     > +     .mmap           =3D sprd_gem_mmap,
> >     > +};
> >     > +
> >     > +static struct drm_driver sprd_drm_drv =3D {
> >     > +     .driver_features        =3D DRIVER_GEM | DRIVER_ATOMIC,
> >     > +     .fops                   =3D &sprd_drm_fops,
> >     > +     .gem_vm_ops             =3D &drm_gem_cma_vm_ops,
> >     > +     .gem_free_object_unlocked       =3D sprd_gem_free_object,
> >     > +     .dumb_create            =3D sprd_gem_dumb_create,
> >     > +     .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
> >     > +     .gem_prime_import       =3D drm_gem_prime_import,
> >     > +     .gem_prime_import_sg_table =3D sprd_gem_prime_import_sg_tab=
le,
> >     > +
> >     > +     .name                   =3D DRIVER_NAME,
> >     > +     .desc                   =3D DRIVER_DESC,
> >     > +     .date                   =3D DRIVER_DATE,
> >     > +     .major                  =3D DRIVER_MAJOR,
> >     > +     .minor                  =3D DRIVER_MINOR,
> >     > +};
> >     > +
> >     > +static int sprd_drm_bind(struct device *dev)
> >     > +{
> >     > +     struct drm_device *drm;
> >     > +     struct sprd_drm *sprd;
> >     > +     int err;
> >     > +
> >     > +     drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
> >     > +     if (IS_ERR(drm))
> >     > +             return PTR_ERR(drm);
> >     > +
> >     > +     dev_set_drvdata(dev, drm);
> >     > +
> >     > +     sprd =3D devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> >     > +     if (!sprd) {
> >     > +             err =3D -ENOMEM;
> >     > +             goto err_free_drm;
> >     > +     }
> >     > +     drm->dev_private =3D sprd;
> >     > +
> >     > +     sprd_drm_mode_config_init(drm);
> >     > +
> >     > +     /* bind and init sub drivers */
> >     > +     err =3D component_bind_all(drm->dev, drm);
> >     > +     if (err) {
> >     > +             DRM_ERROR("failed to bind all component.\n");
> >     > +             goto err_dc_cleanup;
> >     > +     }
> >     > +
> >     > +     /* vblank init */
> >     > +     err =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> >     > +     if (err) {
> >     > +             DRM_ERROR("failed to initialize vblank.\n");
> >     > +             goto err_unbind_all;
> >     > +     }
> >     > +     /* with irq_enabled =3D true, we can use the vblank feature=
. */
> >     > +     drm->irq_enabled =3D true;
> >     > +
> >     > +     /* reset all the states of crtc/plane/encoder/connector */
> >     > +     drm_mode_config_reset(drm);
> >     > +
> >     > +     /* init kms poll for handling hpd */
> >     > +     drm_kms_helper_poll_init(drm);
> >     > +
> >     > +     err =3D drm_dev_register(drm, 0);
> >     > +     if (err < 0)
> >     > +             goto err_kms_helper_poll_fini;
> >     > +
> >     > +     return 0;
> >     > +
> >     > +err_kms_helper_poll_fini:
> >     > +     drm_kms_helper_poll_fini(drm);
> >     > +err_unbind_all:
> >     > +     component_unbind_all(drm->dev, drm);
> >     > +err_dc_cleanup:
> >     > +     drm_mode_config_cleanup(drm);
> >     > +err_free_drm:
> >     > +     drm_dev_put(drm);
> >     > +     return err;
> >     > +}
> >     > +
> >     > +static void sprd_drm_unbind(struct device *dev)
> >     > +{
> >     > +     drm_put_dev(dev_get_drvdata(dev));
> >     > +}
> >     > +
> >     > +static const struct component_master_ops sprd_drm_component_ops =
=3D
> {
> >     > +     .bind =3D sprd_drm_bind,
> >     > +     .unbind =3D sprd_drm_unbind,
> >     > +};
> >     > +
> >     > +static int compare_of(struct device *dev, void *data)
> >     > +{
> >     > +     struct device_node *np =3D data;
> >     > +
> >     > +     DRM_DEBUG("compare %s\n", np->full_name);
> >     > +
> >     > +     return dev->of_node =3D=3D np;
> >     > +}
> >     > +
> >     > +static int sprd_drm_component_probe(struct device *dev,
> >     > +                        const struct component_master_ops *m_ops=
)
> >     > +{
> >     > +     struct device_node *ep, *port, *remote;
> >     > +     struct component_match *match =3D NULL;
> >     > +     int i;
> >     > +
> >     > +     if (!dev->of_node)
> >     > +             return -EINVAL;
> >     > +
> >     > +     /*
> >     > +      * Bind the crtc's ports first, so that
> >     drm_of_find_possible_crtcs()
> >     > +      * called from encoder's .bind callbacks works as expected
> >     > +      */
> >     > +     for (i =3D 0; ; i++) {
> >     > +             port =3D of_parse_phandle(dev->of_node, "ports", i)=
;
> >     > +             if (!port)
> >     > +                     break;
> >     > +
> >     > +             if (!of_device_is_available(port->parent)) {
> >     > +                     of_node_put(port);
> >     > +                     continue;
> >     > +             }
> >     > +
> >     > +             component_match_add(dev, &match, compare_of,
> >     port->parent);
> >     > +             of_node_put(port);
> >     > +     }
> >     > +
> >     > +     if (i =3D=3D 0) {
> >     > +             dev_err(dev, "missing 'ports' property\n");
> >     > +             return -ENODEV;
> >     > +     }
> >     > +
> >     > +     if (!match) {
> >     > +             dev_err(dev, "no available port\n");
> >     > +             return -ENODEV;
> >     > +     }
> >     > +
> >     > +     /*
> >     > +      * For bound crtcs, bind the encoders attached to their
> >     remote endpoint
> >     > +      */
> >     > +     for (i =3D 0; ; i++) {
> >     > +             port =3D of_parse_phandle(dev->of_node, "ports", i)=
;
> >     > +             if (!port)
> >     > +                     break;
> >     > +
> >     > +             if (!of_device_is_available(port->parent)) {
> >     > +                     of_node_put(port);
> >     > +                     continue;
> >     > +             }
> >     > +
> >     > +             for_each_child_of_node(port, ep) {
> >     > +                     remote =3D of_graph_get_remote_port_parent(=
ep);
> >     > +                     if (!remote ||
> >     !of_device_is_available(remote)) {
> >     > +                             of_node_put(remote);
> >     > +                             continue;
> >     > +                     } else if
> >     (!of_device_is_available(remote->parent)) {
> >     > +                             dev_warn(dev, "parent device of %s
> >     is not available\n",
> >     > +                                      remote->full_name);
> >     > +                             of_node_put(remote);
> >     > +                             continue;
> >     > +                     }
> >     > +
> >     > +                     component_match_add(dev, &match, compare_of=
,
> >     remote);
> >     > +                     of_node_put(remote);
> >     > +             }
> >     > +             of_node_put(port);
> >     > +     }
> >     > +
> >     > +     return component_master_add_with_match(dev, m_ops, match);
> >     > +}
> >     > +
> >     > +static int sprd_drm_probe(struct platform_device *pdev)
> >     > +{
> >     > +     int ret;
> >     > +
> >     > +     ret =3D dma_set_mask_and_coherent(&pdev->dev, ~0);
> >     > +     if (ret) {
> >     > +             DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n"=
,
> >     ret);
> >     > +             return ret;
> >     > +     }
> >     > +
> >     > +     return sprd_drm_component_probe(&pdev->dev,
> >     &sprd_drm_component_ops);
> >     > +}
> >     > +
> >     > +static int sprd_drm_remove(struct platform_device *pdev)
> >     > +{
> >     > +     component_master_del(&pdev->dev, &sprd_drm_component_ops);
> >     > +     return 0;
> >     > +}
> >     > +
> >     > +static void sprd_drm_shutdown(struct platform_device *pdev)
> >     > +{
> >     > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> >     > +
> >     > +     if (!drm) {
> >     > +             DRM_WARN("drm device is not available, no
> shutdown\n");
> >     > +             return;
> >     > +     }
> >     > +
> >     > +     drm_atomic_helper_shutdown(drm);
> >     > +}
> >     > +
> >     > +static const struct of_device_id sprd_drm_match_table[] =3D {
> >     > +     { .compatible =3D "sprd,display-subsystem",},
> >     > +     {},
> >     > +};
> >     > +MODULE_DEVICE_TABLE(of, sprd_drm_match_table);
> >     > +
> >     > +static struct platform_driver sprd_drm_driver =3D {
> >     > +     .probe =3D sprd_drm_probe,
> >     > +     .remove =3D sprd_drm_remove,
> >     > +     .shutdown =3D sprd_drm_shutdown,
> >     > +     .driver =3D {
> >     > +             .name =3D "sprd-drm-drv",
> >     > +             .of_match_table =3D sprd_drm_match_table,
> >     > +     },
> >     > +};
> >     > +
> >     > +module_platform_driver(sprd_drm_driver);
> >     > +
> >     > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com
> >     <mailto:leon.he@unisoc.com>>");
> >     > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com
> >     <mailto:kevin.tang@unisoc.com>>");
> >     > +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> >     > +MODULE_LICENSE("GPL v2");
> >     > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> >     b/drivers/gpu/drm/sprd/sprd_drm.h
> >     > new file mode 100644
> >     > index 0000000..137cb27
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> >     > @@ -0,0 +1,16 @@
> >     > +/* SPDX-License-Identifier: GPL-2.0 */
> >     > +/*
> >     > + * Copyright (C) 2019 Unisoc Inc.
> >     > + */
> >     > +
> >     > +#ifndef _SPRD_DRM_H_
> >     > +#define _SPRD_DRM_H_
> >     > +
> >     > +#include <drm/drm_atomic.h>
> >     > +#include <drm/drm_print.h>
> >     > +
> >     > +struct sprd_drm {
> >     > +     struct drm_device *drm;
> >     > +};
> >     > +
> >     > +#endif /* _SPRD_DRM_H_ */
> >     > diff --git a/drivers/gpu/drm/sprd/sprd_gem.c
> >     b/drivers/gpu/drm/sprd/sprd_gem.c
> >     > new file mode 100644
> >     > index 0000000..9aec78e
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/sprd_gem.c
> >     > @@ -0,0 +1,178 @@
> >     > +// SPDX-License-Identifier: GPL-2.0
> >     > +/*
> >     > + * Copyright (C) 2019 Unisoc Inc.
> >     > + */
> >     > +
> >     > +#include <linux/dma-buf.h>
> >     > +#include <linux/pm_runtime.h>
> >     > +
> >     > +#include <drm/drm_prime.h>
> >     > +
> >     > +#include "sprd_drm.h"
> >     > +#include "sprd_gem.h"
> >     > +
> >     > +static struct sprd_gem_obj *sprd_gem_obj_create(struct drm_devic=
e
> >     *drm,
> >     > +                                             unsigned long size)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem;
> >     > +     int ret;
> >     > +
> >     > +     sprd_gem =3D kzalloc(sizeof(*sprd_gem), GFP_KERNEL);
> >     > +     if (!sprd_gem)
> >     > +             return ERR_PTR(-ENOMEM);
> >     > +
> >     > +     ret =3D drm_gem_object_init(drm, &sprd_gem->base, size);
> >     > +     if (ret < 0) {
> >     > +             DRM_ERROR("failed to initialize gem object\n");
> >     > +             goto error;
> >     > +     }
> >     > +
> >     > +     ret =3D drm_gem_create_mmap_offset(&sprd_gem->base);
> >     > +     if (ret) {
> >     > +             drm_gem_object_release(&sprd_gem->base);
> >     > +             goto error;
> >     > +     }
> >     > +
> >     > +     return sprd_gem;
> >     > +
> >     > +error:
> >     > +     kfree(sprd_gem);
> >     > +     return ERR_PTR(ret);
> >     > +}
> >     > +
> >     > +void sprd_gem_free_object(struct drm_gem_object *obj)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> >     > +
> >     > +     DRM_DEBUG("gem =3D %p\n", obj);
> >     > +
> >     > +     if (sprd_gem->vaddr)
> >     > +             dma_free_wc(obj->dev->dev, obj->size,
> >     > +                     sprd_gem->vaddr, sprd_gem->dma_addr);
> >     > +     else if (sprd_gem->sgtb)
> >     > +             drm_prime_gem_destroy(obj, sprd_gem->sgtb);
> >     > +
> >     > +     drm_gem_object_release(obj);
> >     > +
> >     > +     kfree(sprd_gem);
> >     > +}
> >     > +
> >     > +int sprd_gem_dumb_create(struct drm_file *file_priv, struct
> >     drm_device *drm,
> >     > +                         struct drm_mode_create_dumb *args)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem;
> >     > +     int ret;
> >     > +
> >     > +     args->pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> >     > +     args->size =3D round_up(args->pitch * args->height, PAGE_SI=
ZE);
> >     > +
> >     > +     sprd_gem =3D sprd_gem_obj_create(drm, args->size);
> >     > +     if (IS_ERR(sprd_gem))
> >     > +             return PTR_ERR(sprd_gem);
> >     > +
> >     > +     sprd_gem->vaddr =3D dma_alloc_wc(drm->dev, args->size,
> >     > +                     &sprd_gem->dma_addr, GFP_KERNEL |
> >     __GFP_NOWARN | GFP_DMA);
> >
> >     I might be missing something, but I still don't understand why all
> this
> >     GEM code is necessary. I quickly compared with the CMA helpers and
> the
> >     only meaningful difference is the use of the GFP_DMA flag.
> >
> >     Rather than duplicating the CMA code, it's better to change the CMA
> >     helpers to provide a way of setting this flag.
> >
> >     Best regards
> >     Thomas
> >
> >     > +     if (!sprd_gem->vaddr) {
> >     > +             DRM_ERROR("failed to allocate buffer with size
> %llu\n",
> >     > +                       args->size);
> >     > +             ret =3D -ENOMEM;
> >     > +             goto error;
> >     > +     }
> >     > +
> >     > +     ret =3D drm_gem_handle_create(file_priv, &sprd_gem->base,
> >     &args->handle);
> >     > +     if (ret)
> >     > +             goto error;
> >     > +
> >     > +     drm_gem_object_put_unlocked(&sprd_gem->base);
> >     > +
> >     > +     return 0;
> >     > +
> >     > +error:
> >     > +     sprd_gem_free_object(&sprd_gem->base);
> >     > +     return ret;
> >     > +}
> >     > +
> >     > +static int sprd_gem_object_mmap(struct drm_gem_object *obj,
> >     > +                                struct vm_area_struct *vma)
> >     > +
> >     > +{
> >     > +     int ret;
> >     > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> >     > +
> >     > +     vma->vm_flags &=3D ~VM_PFNMAP;
> >     > +     vma->vm_pgoff =3D 0;
> >     > +
> >     > +     ret =3D dma_mmap_wc(obj->dev->dev, vma,
> >     > +                                 sprd_gem->vaddr,
> sprd_gem->dma_addr,
> >     > +                                 vma->vm_end - vma->vm_start);
> >     > +     if (ret)
> >     > +             drm_gem_vm_close(vma);
> >     > +
> >     > +     return ret;
> >     > +}
> >     > +
> >     > +int sprd_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> >     > +{
> >     > +     struct drm_gem_object *obj;
> >     > +     int ret;
> >     > +
> >     > +     ret =3D drm_gem_mmap(filp, vma);
> >     > +     if (ret)
> >     > +             return ret;
> >     > +
> >     > +     obj =3D vma->vm_private_data;
> >     > +
> >     > +     return sprd_gem_object_mmap(obj, vma);
> >     > +}
> >     > +
> >     > +int sprd_gem_prime_mmap(struct drm_gem_object *obj,
> >     > +                         struct vm_area_struct *vma)
> >     > +{
> >     > +     int ret;
> >     > +
> >     > +     ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> >     > +     if (ret)
> >     > +             return ret;
> >     > +
> >     > +     return sprd_gem_object_mmap(obj, vma);
> >     > +}
> >     > +
> >     > +struct sg_table *sprd_gem_prime_get_sg_table(struct
> >     drm_gem_object *obj)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem =3D to_sprd_gem_obj(obj);
> >     > +     struct sg_table *sgtb;
> >     > +     int ret;
> >     > +
> >     > +     sgtb =3D kzalloc(sizeof(*sgtb), GFP_KERNEL);
> >     > +     if (!sgtb)
> >     > +             return ERR_PTR(-ENOMEM);
> >     > +
> >     > +     ret =3D dma_get_sgtable(obj->dev->dev, sgtb, sprd_gem->vadd=
r,
> >     > +                           sprd_gem->dma_addr, obj->size);
> >     > +     if (ret) {
> >     > +             DRM_ERROR("failed to allocate sg_table, %d\n", ret)=
;
> >     > +             kfree(sgtb);
> >     > +             return ERR_PTR(ret);
> >     > +     }
> >     > +
> >     > +     return sgtb;
> >     > +}
> >     > +
> >     > +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct
> >     drm_device *drm,
> >     > +             struct dma_buf_attachment *attach, struct sg_table
> >     *sgtb)
> >     > +{
> >     > +     struct sprd_gem_obj *sprd_gem;
> >     > +
> >     > +     sprd_gem =3D sprd_gem_obj_create(drm, attach->dmabuf->size)=
;
> >     > +     if (IS_ERR(sprd_gem))
> >     > +             return ERR_CAST(sprd_gem);
> >     > +
> >     > +     DRM_DEBUG("gem =3D %p\n", &sprd_gem->base);
> >     > +
> >     > +     if (sgtb->nents =3D=3D 1)
> >     > +             sprd_gem->dma_addr =3D sg_dma_address(sgtb->sgl);
> >     > +
> >     > +     sprd_gem->sgtb =3D sgtb;
> >     > +
> >     > +     return &sprd_gem->base;
> >     > +}
> >     > diff --git a/drivers/gpu/drm/sprd/sprd_gem.h
> >     b/drivers/gpu/drm/sprd/sprd_gem.h
> >     > new file mode 100644
> >     > index 0000000..b6740bd
> >     > --- /dev/null
> >     > +++ b/drivers/gpu/drm/sprd/sprd_gem.h
> >     > @@ -0,0 +1,30 @@
> >     > +/* SPDX-License-Identifier: GPL-2.0 */
> >     > +/*
> >     > + * Copyright (C) 2019 Unisoc Inc.
> >     > + */
> >     > +
> >     > +#ifndef _SPRD_GEM_H_
> >     > +#define _SPRD_GEM_H_
> >     > +
> >     > +#include <drm/drm_gem.h>
> >     > +
> >     > +struct sprd_gem_obj {
> >     > +     struct drm_gem_object   base;
> >     > +     dma_addr_t              dma_addr;
> >     > +     struct sg_table         *sgtb;
> >     > +     void                    *vaddr;
> >     > +};
> >     > +
> >     > +#define to_sprd_gem_obj(x)   container_of(x, struct sprd_gem_obj=
,
> >     base)
> >     > +
> >     > +void sprd_gem_free_object(struct drm_gem_object *gem);
> >     > +int sprd_gem_dumb_create(struct drm_file *file_priv, struct
> >     drm_device *dev,
> >     > +                         struct drm_mode_create_dumb *args);
> >     > +int sprd_gem_mmap(struct file *filp, struct vm_area_struct *vma)=
;
> >     > +int sprd_gem_prime_mmap(struct drm_gem_object *obj,
> >     > +                      struct vm_area_struct *vma);
> >     > +struct sg_table *sprd_gem_prime_get_sg_table(struct
> >     drm_gem_object *obj);
> >     > +struct drm_gem_object *sprd_gem_prime_import_sg_table(struct
> >     drm_device *dev,
> >     > +             struct dma_buf_attachment *attach, struct sg_table
> >     *sgtb);
> >     > +
> >     > +#endif
> >     >
> >
> >     --
> >     Thomas Zimmermann
> >     Graphics Driver Developer
> >     SUSE Software Solutions Germany GmbH
> >     Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >     (HRB 36809, AG N=C3=BCrnberg)
> >     Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
>

--0000000000005eef65059c1a182c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+MSkgQ29udmVydCB0byBnZW5lcmljIENNQSBoYW5kbGVycyBhbmQgc3Vi
bWl0LiBZb3UmIzM5O2Qgd2FudCB0aGUgbGVhc3Q8YnI+YW1vdW50IG9mIGNvZGUgaW4geW91ciBw
YXRjaGVzLCBzbyB0aGV5IGdvIGluIHF1aWNrbHkgYW5kIGVhc2lseS7CoDxkaXY+T2ssIEkgd2ls
bCBmb2xsb3cgdGhpcyBzdWdnZXN0aW9u77yMIHRoYW5rIHlvdSB2ZXJ5IG11Y2ghPGJyPjwvZGl2
PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9
ImdtYWlsX2F0dHIiPk9uIFR1ZSwgSmFuIDcsIDIwMjAgYXQgODoyMiBQTSBUaG9tYXMgWmltbWVy
bWFubiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnR6aW1tZXJtYW5uQHN1c2UuZGUiPnR6aW1tZXJtYW5u
QHN1c2UuZGU8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkhpPGJyPg0KPGJyPg0KQW0g
MDcuMDEuMjAgdW0gMTI6MzYgc2NocmllYiB0YW5nIHBlbmdjaHVhbjo8YnI+DQomZ3Q7IEhpIFRo
b21hcyw8YnI+DQomZ3Q7IE91ciBzb2MgbmVlZHMgdG8gc3VwcG9ydCBib3RoIGNtYSBhbmQgaW9t
bXUsIGJ1dCBvdXIgaW9tbXUgaXMgbm90IHJlYWR5PGJyPg0KJmd0OyBmb3IgdXBsb2FkLCBzbyBp
IHJlbW92ZSBpdCBmcm9tIHNwcmRfZ2VtLmM8YnI+DQomZ3Q7IFNvwqBjYW4gaSB1cGxvYWQgdGhl
IGNtYSBjb2RlIGZpcnN077yfIGFuZCBhZGQgaW9tbXUgc3VwcG9ydCBsYXRlcjxicj4NCjxicj4N
ClRoaXMgbWlnaHQgYmUgcG9zc2libGUsIGJ1dCBJIGNhbm5vdCBtYWtlIHRoZSBkZWNpc2lvbi4g
SSYjMzk7ZCBzdWdnZXN0IGE8YnI+DQpkaWZmZXJlbnQgc3RyYXRlZ3kuPGJyPg0KPGJyPg0KwqAx
KSBDb252ZXJ0IHRvIGdlbmVyaWMgQ01BIGhhbmRsZXJzIGFuZCBzdWJtaXQuIFlvdSYjMzk7ZCB3
YW50IHRoZSBsZWFzdDxicj4NCmFtb3VudCBvZiBjb2RlIGluIHlvdXIgcGF0Y2hlcywgc28gdGhl
eSBnbyBpbiBxdWlja2x5IGFuZCBlYXNpbHkuPGJyPg0KPGJyPg0KwqAyKSBEdXBsaWNhdGUgQ01B
IGhhbmRsZXJzIGludG8geW91ciBkcml2ZXIgYW5kIGFkZCBJT01NVSBzdXBwb3J0Ljxicj4NClN1
Ym1pdCB0aGlzIHBhdGNoc2V0IGF0IGEgbGF0ZXIgcG9pbnQgd2hlbiBpdCYjMzk7cyByZWFkeS48
YnI+DQo8YnI+DQpKdXN0IGFuIHVudGVzdGVkIGlkZWE6IElzIGl0IGEgZ2VuZXJpYyBJT01NVSBv
ciBhIEdBUlQ/IFdpdGggYSBnZW5lcmljPGJyPg0KSU9NTVUgaXQgY291bGQgYmUgcG9zc2libGUg
dG8gaW1wbGVtZW50IGRtYV9tYXBfb3BzIGZvciB5b3VyIHBsYXRmb3JtLjxicj4NCkNNQSBoZWxw
ZXJzIHdpbGwgdXNlIHRoZSBJT01NVSBpbiB0aGVpciBjYWxsIHRvIGRtYV9hbGxvY193YygpLiBb
MV0gSWY8YnI+DQp0aGlzIHdvcmtzLCB5b3Ugd291bGQgbm90IGhhdmUgdG8gbWFpbnRhaW4geW91
IG93biBHRU0gY29kZSBhbmQgY2FuPGJyPg0KbWVyZ2UgSU9NTVUgc3VwcG9ydCBhdCBhbnkgdGlt
ZS48YnI+DQo8YnI+DQpCZXN0IHJlZ2FyZHM8YnI+DQpUaG9tYXM8YnI+DQo8YnI+DQpbMV0gPGEg
aHJlZj0iaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9rZXJu
ZWwvZG1hL21hcHBpbmcuYyNMMjk4IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5o
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2tlcm5lbC9kbWEv
bWFwcGluZy5jI0wyOTg8L2E+PGJyPg0KPGJyPg0KPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IE9uIE1v
biwgSmFuIDYsIDIwMjAgYXQgNjoxMSBQTSBUaG9tYXMgWmltbWVybWFubiAmbHQ7PGEgaHJlZj0i
bWFpbHRvOnR6aW1tZXJtYW5uQHN1c2UuZGUiIHRhcmdldD0iX2JsYW5rIj50emltbWVybWFubkBz
dXNlLmRlPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHppbW1lcm1h
bm5Ac3VzZS5kZSIgdGFyZ2V0PSJfYmxhbmsiPnR6aW1tZXJtYW5uQHN1c2UuZGU8L2E+Jmd0OyZn
dDsgd3JvdGU6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBIaSBLZXZpbjxicj4NCiZndDsg
PGJyPg0KJmd0O8KgIMKgIMKgQW0gMTYuMTIuMTkgdW0gMTI6NDAgc2NocmllYiBLZXZpbiBUYW5n
Ojxicj4NCiZndDvCoCDCoCDCoCZndDsgRnJvbTogS2V2aW4gVGFuZyAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmtldmluLnRhbmdAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmtldmluLnRhbmdAdW5p
c29jLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpr
ZXZpbi50YW5nQHVuaXNvYy5jb20iIHRhcmdldD0iX2JsYW5rIj5rZXZpbi50YW5nQHVuaXNvYy5j
b208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyBBZGRzIGRybSBzdXBwb3J0IGZvciB0aGUgVW5pc29jJiMzOTtzIGRpc3BsYXkgc3Vic3lzdGVt
Ljxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFRoaXMgaXMgZHJt
IGRldmljZSBhbmQgZ2VtIGRyaXZlci4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgc3VwcG9ydDxicj4N
CiZndDvCoCDCoCDCoGZvciB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IERpcmVjdCBSZW5kZXJp
bmcgSW5mcmFzdHJ1Y3R1cmUgKERSSSkgaW4gWEZyZWU4NiA0LjEuMCBhbmQgaGlnaGVyLjxicj4N
CiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IENjOiBPcnNvbiBaaGFpICZs
dDs8YSBocmVmPSJtYWlsdG86b3Jzb256aGFpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm9y
c29uemhhaUBnbWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm9yc29uemhh
aUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5vcnNvbnpoYWlAZ21haWwuY29tPC9hPiZndDsm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBDYzogQmFvbGluIFdhbmcgJmx0OzxhIGhyZWY9Im1h
aWx0bzpiYW9saW4ud2FuZ0BsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+YmFvbGluLndhbmdA
bGluYXJvLm9yZzwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpiYW9saW4ud2FuZ0BsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+YmFvbGluLndhbmdAbGlu
YXJvLm9yZzwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgQ2M6IENodW55YW4gWmhh
bmcgJmx0OzxhIGhyZWY9Im1haWx0bzp6aGFuZy5seXJhQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPnpoYW5nLmx5cmFAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp6
aGFuZy5seXJhQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnpoYW5nLmx5cmFAZ21haWwuY29t
PC9hPiZndDsmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBU
YW5nICZsdDs8YSBocmVmPSJtYWlsdG86a2V2aW4udGFuZ0B1bmlzb2MuY29tIiB0YXJnZXQ9Il9i
bGFuayI+a2V2aW4udGFuZ0B1bmlzb2MuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmtldmluLnRhbmdAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmtldmluLnRhbmdAdW5pc29jLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsg
LS0tPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnwqAgwqAg
wqAgwqAgwqB8wqAgwqAyICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgZHJpdmVycy9ncHUvZHJt
L01ha2VmaWxlwqAgwqAgwqAgwqAgfMKgIMKgMSArPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIGRy
aXZlcnMvZ3B1L2RybS9zcHJkL0tjb25maWfCoCDCoCB8wqAgMTQgKys8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgZHJpdmVycy9ncHUvZHJtL3NwcmQvTWFrZWZpbGXCoCDCoHzCoCDCoDggKys8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYyB8IDI4
Njxicj4NCiZndDvCoCDCoCDCoCsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kys8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0u
aCB8wqAgMTYgKysrPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIGRyaXZlcnMvZ3B1L2RybS9zcHJk
L3NwcmRfZ2VtLmMgfCAxNzggKysrKysrKysrKysrKysrKysrKysrKysrKzxicj4NCiZndDvCoCDC
oCDCoCZndDvCoCBkcml2ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2dlbS5oIHzCoCAzMCArKysrKzxi
cj4NCiZndDvCoCDCoCDCoCZndDvCoCA4IGZpbGVzIGNoYW5nZWQsIDUzNSBpbnNlcnRpb25zKCsp
PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vc3ByZC9LY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vc3ByZC9NYWtlZmlsZTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYzxicj4NCiZn
dDvCoCDCoCDCoCZndDvCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3NwcmQv
c3ByZF9kcm0uaDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3NwcmQvc3ByZF9nZW0uYzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9nZW0uaDxicj4NCiZndDvC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyBpbmRleCBiZmRhZGMzLi5jZWFkMTJjIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCZndDsg
LS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBAQCAtMzg3LDYg
KzM4Nyw4IEBAIHNvdXJjZSAmcXVvdDtkcml2ZXJzL2dwdS9kcm0vYXNwZWVkL0tjb25maWcmcXVv
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgc291cmNl
ICZxdW90O2RyaXZlcnMvZ3B1L2RybS9tY2RlL0tjb25maWcmcXVvdDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzb3VyY2UgJnF1b3Q7ZHJpdmVycy9ncHUv
ZHJtL3NwcmQvS2NvbmZpZyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCAjIEtlZXAgbGVnYWN5IGRyaXZlcnMgbGFzdDxicj4NCiZndDvCoCDCoCDC
oCZndDvCoDxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBtZW51Y29uZmlnIERSTV9MRUdBQ1k8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUg
Yi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGluZGV4IDlm
MWM3YzQuLjg1Y2EyMTEgMTAwNjQ0PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vTWFrZWZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9NYWtlZmlsZTxicj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTEyMiwzICsxMjIsNCBAQCBv
YmotJChDT05GSUdfRFJNX0xJTUEpwqAgKz0gbGltYS88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
b2JqLSQoQ09ORklHX0RSTV9QQU5GUk9TVCkgKz0gcGFuZnJvc3QvPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIG9iai0kKENPTkZJR19EUk1fQVNQRUVEX0dGWCkgKz0gYXNwZWVkLzxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCBvYmotJChDT05GSUdfRFJNX01DREUpICs9IG1jZGUvPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArb2JqLSQoQ09ORklHX0RSTV9TUFJEKSArPSBzcHJkLzxicj4NCiZndDvCoCDC
oCDCoCZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zcHJkL0tjb25maWc8YnI+DQom
Z3Q7wqAgwqAgwqBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL0tjb25maWc8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBpbmRleCAw
MDAwMDAwLi43OWYyODZiPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAtLS0gL2Rldi9udWxsPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3ByZC9LY29uZmlnPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyBAQCAtMCwwICsxLDE0IEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
Y29uZmlnIERSTV9TUFJEPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB0cmlzdGF0ZSAm
cXVvdDtEUk0gU3VwcG9ydCBmb3IgVW5pc29jIFNvQ3MgUGxhdGZvcm0mcXVvdDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRlcGVuZHMgb24gQVJDSF9TUFJEPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqBkZXBlbmRzIG9uIERSTSAmYW1wOyZhbXA7IE9GPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqBzZWxlY3QgRFJNX0tNU19IRUxQRVI8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoHNlbGVjdCBEUk1fR0VNX0NNQV9IRUxQRVI8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoHNlbGVjdCBEUk1fS01TX0NNQV9IRUxQRVI8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoHNlbGVjdCBEUk1fTUlQSV9EU0k8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoHNlbGVjdCBEUk1fUEFORUw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oHNlbGVjdCBWSURFT01PREVfSEVMUEVSUzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
c2VsZWN0IEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0U8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoGhlbHA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoENob29zZSB0aGlzIG9w
dGlvbiBpZiB5b3UgaGF2ZSBhIFVuaXNvYyBjaGlwc2V0cy48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoCDCoElmIE0gaXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCBz
cHJkLWRybS48YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmls
ZTxicj4NCiZndDvCoCDCoCDCoCZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zcHJk
L01ha2VmaWxlPGJyPg0KJmd0O8KgIMKgIMKgYi9kcml2ZXJzL2dwdS9kcm0vc3ByZC9NYWtlZmls
ZTxicj4NCiZndDvCoCDCoCDCoCZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7IGluZGV4IDAwMDAwMDAuLmRmMGIzMTY8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0t
LSAvZGV2L251bGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
cHJkL01ha2VmaWxlPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBAQCAtMCwwICsxLDggQEA8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArY2NmbGFncy15ICs9IC1J
aW5jbHVkZS9kcm08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICtzdWJkaXItY2NmbGFncy15ICs9IC1JJChzcmMpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArb2JqLXkgOj0gc3ByZF9kcm0ubyBcPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqBzcHJkX2dlbS5vPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBcIE5vIG5l
d2xpbmUgYXQgZW5kIG9mIGZpbGU8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2RybS5jPGJyPg0KJmd0O8KgIMKgIMKgYi9kcml2ZXJz
L2dwdS9kcm0vc3ByZC9zcHJkX2RybS5jPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBuZXcgZmlsZSBt
b2RlIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCZndDsgaW5kZXggMDAwMDAwMC4uNGFlZTI1ZmE0
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAtLS0gL2Rldi9udWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2RybS5jPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyBAQCAtMCwwICsxLDI4NiBAQDxicj4NCiZndDvCoCDCoCDCoCZndDsgKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArLyo8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTkgVW5pc29jIEluYy48YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICsgKi88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7bGludXgvY29tcG9uZW50LmgmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2xpbnV4L2RtYS1tYXBwaW5nLmgmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArI2luY2x1ZGUgJmx0O2xpbnV4L21vZHVsZS5oJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtsaW51eC9tdXRleC5oJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDsgKyNpbmNsdWRlICZsdDtsaW51eC9vZl9ncmFwaC5oJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCZndDsgKyNpbmNsdWRlICZsdDtsaW51eC9vZl9wbGF0Zm9ybS5oJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtkcm0vZHJt
X2F0b21pY19oZWxwZXIuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7
ZHJtL2RybV9jcnRjX2hlbHBlci5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRl
ICZsdDtkcm0vZHJtX2Rydi5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZs
dDtkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2lu
Y2x1ZGUgJmx0O2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtkcm0vZHJtX3Byb2JlX2hlbHBlci5oJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtkcm0vZHJtX3ZibGFuay5oJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZxdW90
O3NwcmRfZHJtLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmcXVvdDtz
cHJkX2dlbS5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArI2RlZmluZSBEUklWRVJfTkFNRcKgICZxdW90O3NwcmQmcXVvdDs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICsjZGVmaW5lIERSSVZFUl9ERVNDwqAgJnF1b3Q7U3ByZWFkdHJ1bSBTb0NzJiMz
OTsgRFJNIERyaXZlciZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNkZWZpbmUgRFJJVkVS
X0RBVEXCoCAmcXVvdDsyMDE5MTEwMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNkZWZp
bmUgRFJJVkVSX01BSk9SIDE8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjZGVmaW5lIERSSVZFUl9N
SU5PUiAwPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfaGVscGVyX2Z1bmNzPGJyPg0KJmd0O8Kg
IMKgIMKgc3ByZF9kcm1fbW9kZV9jb25maWdfaGVscGVyID0gezxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgLmF0b21pY19jb21taXRfdGFpbCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1p
dF90YWlsX3JwbSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVf
Y29uZmlnX2Z1bmNzPGJyPg0KJmd0O8KgIMKgIMKgc3ByZF9kcm1fbW9kZV9jb25maWdfZnVuY3Mg
PSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAuZmJfY3JlYXRlID0gZHJtX2dlbV9m
Yl9jcmVhdGUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAuYXRvbWljX2NoZWNrID0g
ZHJtX2F0b21pY19oZWxwZXJfY2hlY2ssPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAu
YXRvbWljX2NvbW1pdCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCw8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICt9Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K3N0YXRpYyB2b2lkIHNwcmRfZHJtX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRybSk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqBkcm1fbW9kZV9jb25maWdfaW5pdChkcm0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtLSZndDttb2RlX2NvbmZpZy5taW5fd2lk
dGggPSAwOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtLSZndDttb2RlX2NvbmZp
Zy5taW5faGVpZ2h0ID0gMDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRybS0mZ3Q7
bW9kZV9jb25maWcubWF4X3dpZHRoID0gODE5Mjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoGRybS0mZ3Q7bW9kZV9jb25maWcubWF4X2hlaWdodCA9IDgxOTI7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0O21vZGVfY29uZmlnLmFsbG93X2ZiX21vZGlmaWVycyA9
IHRydWU7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqBkcm0tJmd0O21vZGVfY29uZmlnLmZ1bmNzID0gJmFtcDtzcHJkX2RybV9tb2RlX2NvbmZp
Z19mdW5jczs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRybS0mZ3Q7bW9kZV9jb25m
aWcuaGVscGVyX3ByaXZhdGUgPSAmYW1wO3NwcmRfZHJtX21vZGVfY29uZmlnX2hlbHBlcjs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgc3ByZF9kcm1f
Zm9wcyA9IHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5vd25lcsKgIMKgIMKgIMKg
IMKgID0gVEhJU19NT0RVTEUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAub3BlbsKg
IMKgIMKgIMKgIMKgIMKgPSBkcm1fb3Blbiw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oC5yZWxlYXNlwqAgwqAgwqAgwqAgPSBkcm1fcmVsZWFzZSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoC51bmxvY2tlZF9pb2N0bCA9IGRybV9pb2N0bCw8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoC5jb21wYXRfaW9jdGzCoCDCoD0gZHJtX2NvbXBhdF9pb2N0bCw8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5wb2xswqAgwqAgwqAgwqAgwqAgwqA9IGRybV9wb2xs
LDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLnJlYWTCoCDCoCDCoCDCoCDCoCDCoD0g
ZHJtX3JlYWQsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAubGxzZWVrwqAgwqAgwqAg
wqAgwqA9IG5vX2xsc2Vlayw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5tbWFwwqAg
wqAgwqAgwqAgwqAgwqA9IHNwcmRfZ2VtX21tYXAsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgc3Ry
dWN0IGRybV9kcml2ZXIgc3ByZF9kcm1fZHJ2ID0gezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgLmRyaXZlcl9mZWF0dXJlc8KgIMKgIMKgIMKgID0gRFJJVkVSX0dFTSB8IERSSVZFUl9B
VE9NSUMsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAuZm9wc8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgPSAmYW1wO3NwcmRfZHJtX2ZvcHMsPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqAuZ2VtX3ZtX29wc8KgIMKgIMKgIMKgIMKgIMKgIMKgPSAmYW1wO2RybV9nZW1f
Y21hX3ZtX29wcyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5nZW1fZnJlZV9vYmpl
Y3RfdW5sb2NrZWTCoCDCoCDCoCDCoD0gc3ByZF9nZW1fZnJlZV9vYmplY3QsPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqAuZHVtYl9jcmVhdGXCoCDCoCDCoCDCoCDCoCDCoCA9IHNwcmRf
Z2VtX2R1bWJfY3JlYXRlLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLnByaW1lX2Zk
X3RvX2hhbmRsZcKgIMKgIMKgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSw8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5nZW1fcHJpbWVfaW1wb3J0wqAgwqAgwqAgwqA9IGRybV9n
ZW1fcHJpbWVfaW1wb3J0LDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmdlbV9wcmlt
ZV9pbXBvcnRfc2dfdGFibGUgPSBzcHJkX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAubmFtZcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPSBEUklWRVJfTkFNRSw8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoC5kZXNjwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA9IERSSVZF
Ul9ERVNDLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgLmRhdGXCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoD0gRFJJVkVSX0RBVEUsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqAubWFqb3LCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA9IERSSVZFUl9NQUpPUiw8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5taW5vcsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgID0gRFJJVkVSX01JTk9SLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK307PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIGludCBzcHJkX2RybV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOzxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IHNwcmRfZHJtICpzcHJkOzxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgaW50IGVycjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRybSA9IGRybV9kZXZfYWxsb2MoJmFtcDtzcHJkX2Ry
bV9kcnYsIGRldik7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAoSVNfRVJSKGRy
bSkpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gUFRS
X0VSUihkcm0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgZGV2X3NldF9kcnZkYXRhKGRldiwgZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNwcmQgPSBkZXZtX2t6YWxsb2MoZHJt
LSZndDtkZXYsIHNpemVvZigqc3ByZCksIEdGUF9LRVJORUwpOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgaWYgKCFzcHJkKSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqBlcnIgPSAtRU5PTUVNOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgZ290byBlcnJfZnJlZV9kcm07PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0O2Rldl9wcml2YXRl
ID0gc3ByZDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoHNwcmRfZHJtX21vZGVfY29uZmlnX2luaXQoZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC8qIGJpbmQgYW5kIGluaXQgc3Vi
IGRyaXZlcnMgKi88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGVyciA9IGNvbXBvbmVu
dF9iaW5kX2FsbChkcm0tJmd0O2RldiwgZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoGlmIChlcnIpIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oERSTV9FUlJPUigmcXVvdDtmYWlsZWQgdG8gYmluZCBhbGwgY29tcG9uZW50LlxuJnF1b3Q7KTs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX2RjX2Ns
ZWFudXA7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAvKiB2YmxhbmsgaW5pdCAqLzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZXJyID0gZHJtX3ZibGFua19pbml0KGRybSwg
ZHJtLSZndDttb2RlX2NvbmZpZy5udW1fY3J0Yyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqBpZiAoZXJyKSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqBEUk1fRVJST1IoJnF1b3Q7ZmFpbGVkIHRvIGluaXRpYWxpemUgdmJsYW5rLlxuJnF1b3Q7KTs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyX3VuYmlu
ZF9hbGw7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAvKiB3aXRoIGlycV9lbmFibGVkID0gdHJ1ZSwgd2UgY2FuIHVzZSB0aGUg
dmJsYW5rIGZlYXR1cmUuICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm0tJmd0
O2lycV9lbmFibGVkID0gdHJ1ZTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoC8qIHJlc2V0IGFsbCB0aGUgc3RhdGVzIG9mIGNydGMvcGxhbmUv
ZW5jb2Rlci9jb25uZWN0b3IgKi88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGRybV9t
b2RlX2NvbmZpZ19yZXNldChkcm0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgLyogaW5pdCBrbXMgcG9sbCBmb3IgaGFuZGxpbmcgaHBkICov
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQo
ZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoGVyciA9IGRybV9kZXZfcmVnaXN0ZXIoZHJtLCAwKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoGlmIChlcnIgJmx0OyAwKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgZ290byBlcnJfa21zX2hlbHBlcl9wb2xsX2Zpbmk7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gMDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtlcnJfa21zX2hlbHBlcl9w
b2xsX2Zpbmk6PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm1fa21zX2hlbHBlcl9w
b2xsX2ZpbmkoZHJtKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtlcnJfdW5iaW5kX2FsbDo8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGNvbXBvbmVudF91bmJpbmRfYWxsKGRybS0mZ3Q7
ZGV2LCBkcm0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK2Vycl9kY19jbGVhbnVwOjxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtlcnJfZnJlZV9kcm06PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqBkcm1fZGV2X3B1dChkcm0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
cmV0dXJuIGVycjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIHZvaWQgc3ByZF9kcm1fdW5iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqBkcm1fcHV0X2RldihkZXZfZ2V0X2RydmRhdGEoZGV2KSk7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCZndDsgK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY29tcG9uZW50X21hc3Rlcl9vcHMgc3ByZF9k
cm1fY29tcG9uZW50X29wcyA9IHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC5iaW5k
ID0gc3ByZF9kcm1fYmluZCw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC51bmJpbmQg
PSBzcHJkX2RybV91bmJpbmQsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgaW50IGNvbXBhcmVfb2Yo
c3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK3s8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBk
YXRhOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgRFJNX0RFQlVHKCZxdW90O2NvbXBhcmUgJXNcbiZxdW90OywgbnAtJmd0O2Z1bGxfbmFtZSk7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBy
ZXR1cm4gZGV2LSZndDtvZl9ub2RlID09IG5wOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtzdGF0aWMgaW50IHNw
cmRfZHJtX2NvbXBvbmVudF9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29uc3Qgc3RydWN0
IGNvbXBvbmVudF9tYXN0ZXJfb3BzICptX29wcyk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKmVwLCAqcG9y
dCwgKnJlbW90ZTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBjb21wb25l
bnRfbWF0Y2ggKm1hdGNoID0gTlVMTDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlu
dCBpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgaWYgKCFkZXYtJmd0O29mX25vZGUpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm4gLUVJTlZBTDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoC8qPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqAgKiBCaW5kIHRoZSBjcnRjJiMzOTtzIHBvcnRzIGZpcnN0LCBzbyB0aGF0PGJyPg0KJmd0O8Kg
IMKgIMKgZHJtX29mX2ZpbmRfcG9zc2libGVfY3J0Y3MoKTxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgICogY2FsbGVkIGZyb20gZW5jb2RlciYjMzk7cyAuYmluZCBjYWxsYmFja3Mgd29y
a3MgYXMgZXhwZWN0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCAqLzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZm9yIChpID0gMDsgOyBpKyspIHs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBvcnQgPSBvZl9wYXJzZV9waGFuZGxlKGRl
di0mZ3Q7b2Zfbm9kZSwgJnF1b3Q7cG9ydHMmcXVvdDssIGkpOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFwb3J0KTxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIW9m
X2RldmljZV9pc19hdmFpbGFibGUocG9ydC0mZ3Q7cGFyZW50KSkgezxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb2Zfbm9kZV9wdXQocG9ydCk7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
b250aW51ZTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbXBvbmVudF9tYXRjaF9hZGQoZGV2LCAmYW1wO21hdGNoLCBjb21wYXJlX29mLDxi
cj4NCiZndDvCoCDCoCDCoHBvcnQtJmd0O3BhcmVudCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqBvZl9ub2RlX3B1dChwb3J0KTs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoGlmIChpID09IDApIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoGRldl9lcnIoZGV2LCAmcXVvdDttaXNzaW5nICYjMzk7cG9ydHMmIzM5OyBw
cm9wZXJ0eVxuJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoHJldHVybiAtRU5PREVWOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKCFt
YXRjaCkgezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X2Vy
cihkZXYsICZxdW90O25vIGF2YWlsYWJsZSBwb3J0XG4mcXVvdDspOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FTk9ERVY7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAvKjxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgICogRm9y
IGJvdW5kIGNydGNzLCBiaW5kIHRoZSBlbmNvZGVycyBhdHRhY2hlZCB0byB0aGVpcjxicj4NCiZn
dDvCoCDCoCDCoHJlbW90ZSBlbmRwb2ludDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
ICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBmb3IgKGkgPSAwOyA7IGkrKykgezxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcG9ydCA9IG9mX3BhcnNl
X3BoYW5kbGUoZGV2LSZndDtvZl9ub2RlLCAmcXVvdDtwb3J0cyZxdW90OywgaSk7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIXBvcnQpPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShwb3J0LSZndDtwYXJlbnQpKSB7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvZl9ub2Rl
X3B1dChwb3J0KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbnRpbnVlOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShwb3J0LCBlcCkgezxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVtb3Rl
ID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0X3BhcmVudChlcCk7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIXJlbW90ZSB8fDxicj4N
CiZndDvCoCDCoCDCoCFvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKHJlbW90ZSkpIHs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG9mX25vZGVfcHV0KHJlbW90ZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51ZTs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0gZWxzZSBpZjxicj4NCiZn
dDvCoCDCoCDCoCghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUtJmd0O3BhcmVudCkpIHs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGRldl93YXJuKGRldiwgJnF1b3Q7cGFyZW50IGRldmljZSBvZiAlczxicj4NCiZn
dDvCoCDCoCDCoGlzIG5vdCBhdmFpbGFibGVcbiZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCByZW1vdGUtJmd0O2Z1bGxfbmFtZSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvZl9ub2RlX3B1dChyZW1vdGUpOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29udGludWU7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wb25lbnRfbWF0Y2hf
YWRkKGRldiwgJmFtcDttYXRjaCwgY29tcGFyZV9vZiw8YnI+DQomZ3Q7wqAgwqAgwqByZW1vdGUp
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
b2Zfbm9kZV9wdXQocmVtb3RlKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoG9mX25v
ZGVfcHV0KHBvcnQpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxicj4NCiZndDvC
oCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIGNvbXBv
bmVudF9tYXN0ZXJfYWRkX3dpdGhfbWF0Y2goZGV2LCBtX29wcywgbWF0Y2gpOzxicj4NCiZndDvC
oCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICtzdGF0aWMgaW50IHNwcmRfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgaW50IHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoHJldCA9IGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoJmFtcDtwZGV2LSZndDtk
ZXYsIH4wKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoERSTV9FUlJPUigmcXVvdDtkbWFf
c2V0X21hc2tfYW5kX2NvaGVyZW50IGZhaWxlZCAoJWQpXG4mcXVvdDssPGJyPg0KJmd0O8KgIMKg
IMKgcmV0KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVy
biByZXQ7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gc3ByZF9kcm1fY29t
cG9uZW50X3Byb2JlKCZhbXA7cGRldi0mZ3Q7ZGV2LDxicj4NCiZndDvCoCDCoCDCoCZhbXA7c3By
ZF9kcm1fY29tcG9uZW50X29wcyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvC
oCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0YXRpYyBpbnQgc3ByZF9kcm1f
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgY29tcG9uZW50X21hc3Rlcl9kZWwo
JmFtcDtwZGV2LSZndDtkZXYsICZhbXA7c3ByZF9kcm1fY29tcG9uZW50X29wcyk7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gMDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIHZv
aWQgc3ByZF9kcm1fc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldik8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAoIWRybSkgezxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX1dBUk4oJnF1b3Q7
ZHJtIGRldmljZSBpcyBub3QgYXZhaWxhYmxlLCBubyBzaHV0ZG93blxuJnF1b3Q7KTs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICvCoCDCoCDCoGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRybSk7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCZndDsgK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNwcmRfZHJtX21hdGNo
X3RhYmxlW10gPSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB7IC5jb21wYXRpYmxl
ID0gJnF1b3Q7c3ByZCxkaXNwbGF5LXN1YnN5c3RlbSZxdW90Oyx9LDxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKge30sPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzcHJkX2RybV9tYXRjaF90YWJsZSk7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3ByZF9kcm1fZHJpdmVyID0gezxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgLnByb2JlID0gc3ByZF9kcm1fcHJvYmUsPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAucmVtb3ZlID0gc3ByZF9kcm1fcmVtb3ZlLDxicj4NCiZndDvCoCDCoCDC
oCZndDsgK8KgIMKgIMKgLnNodXRkb3duID0gc3ByZF9kcm1fc2h1dGRvd24sPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqAuZHJpdmVyID0gezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgLm5hbWUgPSAmcXVvdDtzcHJkLWRybS1kcnYmcXVvdDssPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAub2ZfbWF0Y2hfdGFibGUgPSBz
cHJkX2RybV9tYXRjaF90YWJsZSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH0sPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHNwcmRfZHJtX2RyaXZlcik7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArTU9EVUxFX0FVVEhP
UigmcXVvdDtMZW9uIEhlICZsdDs8YSBocmVmPSJtYWlsdG86bGVvbi5oZUB1bmlzb2MuY29tIiB0
YXJnZXQ9Il9ibGFuayI+bGVvbi5oZUB1bmlzb2MuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmxlb24uaGVAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmxlb24uaGVAdW5pc29jLmNvbTwvYT4mZ3Q7Jmd0OyZxdW90Oyk7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArTU9EVUxFX0FVVEhPUigmcXVvdDtLZXZpbiBUYW5nICZsdDs8YSBocmVmPSJtYWls
dG86a2V2aW4udGFuZ0B1bmlzb2MuY29tIiB0YXJnZXQ9Il9ibGFuayI+a2V2aW4udGFuZ0B1bmlz
b2MuY29tPC9hPjxicj4NCiZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmtl
dmluLnRhbmdAdW5pc29jLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmtldmluLnRhbmdAdW5pc29jLmNv
bTwvYT4mZ3Q7Jmd0OyZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArTU9EVUxFX0RFU0NS
SVBUSU9OKCZxdW90O1VuaXNvYyBEUk0gS01TIE1hc3RlciBEcml2ZXImcXVvdDspOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK01PRFVMRV9MSUNFTlNFKCZxdW90O0dQTCB2MiZxdW90Oyk7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9k
cm0uaDxicj4NCiZndDvCoCDCoCDCoGIvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uaDxi
cj4NCiZndDvCoCDCoCDCoCZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7IGluZGV4IDAwMDAwMDAuLjEzN2NiMjc8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0tLSAv
ZGV2L251bGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zcHJk
L3NwcmRfZHJtLmg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEBAIC0wLDAgKzEsMTYgQEA8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKy8qPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArICogQ29weXJp
Z2h0IChDKSAyMDE5IFVuaXNvYyBJbmMuPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArICovPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2lmbmRlZiBfU1BSRF9E
Uk1fSF88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjZGVmaW5lIF9TUFJEX0RSTV9IXzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtkcm0v
ZHJtX2F0b21pYy5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZsdDtkcm0v
ZHJtX3ByaW50LmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArc3RydWN0IHNwcmRfZHJtIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0
cnVjdCBkcm1fZGV2aWNlICpkcm07PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjZW5kaWYgLyogX1NQUkRfRFJN
X0hfICovPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3NwcmQvc3ByZF9nZW0uYzxicj4NCiZndDvCoCDCoCDCoGIvZHJpdmVycy9ncHUvZHJtL3NwcmQv
c3ByZF9nZW0uYzxicj4NCiZndDvCoCDCoCDCoCZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7IGluZGV4IDAwMDAwMDAuLjlhZWM3OGU8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7IC0tLSAvZGV2L251bGw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zcHJkL3NwcmRfZ2VtLmM8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEBAIC0wLDAgKzEs
MTc4IEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjA8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvKjxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyAqIENvcHlyaWdodCAoQykgMjAxOSBVbmlzb2MgSW5jLjxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNs
dWRlICZsdDtsaW51eC9kbWEtYnVmLmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2luY2x1
ZGUgJmx0O2xpbnV4L3BtX3J1bnRpbWUuaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHJtL2RybV9wcmltZS5oJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpbmNsdWRlICZxdW90
O3NwcmRfZHJtLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVkZSAmcXVvdDtz
cHJkX2dlbS5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArc3RhdGljIHN0cnVjdCBzcHJkX2dlbV9vYmogKnNwcmRfZ2VtX29ial9jcmVhdGUoc3Ry
dWN0IGRybV9kZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAqZHJtLDxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyBzaXplKTxicj4NCiZndDvCoCDCoCDCoCZndDsg
K3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBzcHJkX2dlbV9vYmogKnNw
cmRfZ2VtOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaW50IHJldDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNwcmRfZ2VtID0g
a3phbGxvYyhzaXplb2YoKnNwcmRfZ2VtKSwgR0ZQX0tFUk5FTCk7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqBpZiAoIXNwcmRfZ2VtKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXQgPSBkcm1fZ2VtX29iamVj
dF9pbml0KGRybSwgJmFtcDtzcHJkX2dlbS0mZ3Q7YmFzZSwgc2l6ZSk7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqBpZiAocmV0ICZsdDsgMCkgezxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX0VSUk9SKCZxdW90O2ZhaWxlZCB0byBpbml0aWFsaXpl
IGdlbSBvYmplY3RcbiZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqBnb3RvIGVycm9yOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgfTxicj4N
CiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0ID0g
ZHJtX2dlbV9jcmVhdGVfbW1hcF9vZmZzZXQoJmFtcDtzcHJkX2dlbS0mZ3Q7YmFzZSk7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1fZ2VtX29iamVjdF9yZWxlYXNlKCZhbXA7c3ByZF9n
ZW0tJmd0O2Jhc2UpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
Z290byBlcnJvcjs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAg
wqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiBzcHJkX2dl
bTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtlcnJvcjo8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGtmcmVlKHNwcmRfZ2VtKTs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiBFUlJfUFRSKHJldCk7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K3ZvaWQgc3ByZF9nZW1fZnJlZV9vYmplY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopPGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3Ry
dWN0IHNwcmRfZ2VtX29iaiAqc3ByZF9nZW0gPSB0b19zcHJkX2dlbV9vYmoob2JqKTs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoERSTV9ERUJV
RygmcXVvdDtnZW0gPSAlcFxuJnF1b3Q7LCBvYmopOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHNwcmRfZ2VtLSZndDt2YWRkcik8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGRtYV9mcmVlX3djKG9iai0m
Z3Q7ZGV2LSZndDtkZXYsIG9iai0mZ3Q7c2l6ZSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwcmRfZ2VtLSZndDt2YWRkciwgc3ByZF9nZW0t
Jmd0O2RtYV9hZGRyKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGVsc2UgaWYgKHNw
cmRfZ2VtLSZndDtzZ3RiKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgZHJtX3ByaW1lX2dlbV9kZXN0cm95KG9iaiwgc3ByZF9nZW0tJmd0O3NndGIpOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgZHJtX2dlbV9v
YmplY3RfcmVsZWFzZShvYmopOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKga2ZyZWUoc3ByZF9nZW0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtpbnQgc3By
ZF9nZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsIHN0cnVjdDxicj4N
CiZndDvCoCDCoCDCoGRybV9kZXZpY2UgKmRybSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVf
ZHVtYiAqYXJncyk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqBzdHJ1Y3Qgc3ByZF9nZW1fb2JqICpzcHJkX2dlbTs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoGludCByZXQ7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBhcmdzLSZndDtwaXRjaCA9IERJVl9ST1VORF9VUChhcmdz
LSZndDt3aWR0aCAqIGFyZ3MtJmd0O2JwcCwgOCk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAg
wqAgwqBhcmdzLSZndDtzaXplID0gcm91bmRfdXAoYXJncy0mZ3Q7cGl0Y2ggKiBhcmdzLSZndDto
ZWlnaHQsIFBBR0VfU0laRSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqBzcHJkX2dlbSA9IHNwcmRfZ2VtX29ial9jcmVhdGUoZHJtLCBhcmdz
LSZndDtzaXplKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChJU19FUlIoc3By
ZF9nZW0pKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJu
IFBUUl9FUlIoc3ByZF9nZW0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgc3ByZF9nZW0tJmd0O3ZhZGRyID0gZG1hX2FsbG9jX3djKGRybS0m
Z3Q7ZGV2LCBhcmdzLSZndDtzaXplLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmFtcDtzcHJkX2dlbS0mZ3Q7ZG1hX2FkZHIsIEdGUF9LRVJO
RUwgfDxicj4NCiZndDvCoCDCoCDCoF9fR0ZQX05PV0FSTiB8IEdGUF9ETUEpOzxicj4NCiZndDsg
PGJyPg0KJmd0O8KgIMKgIMKgSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IEkgc3Rp
bGwgZG9uJiMzOTt0IHVuZGVyc3RhbmQgd2h5IGFsbCB0aGlzPGJyPg0KJmd0O8KgIMKgIMKgR0VN
IGNvZGUgaXMgbmVjZXNzYXJ5LiBJIHF1aWNrbHkgY29tcGFyZWQgd2l0aCB0aGUgQ01BIGhlbHBl
cnMgYW5kIHRoZTxicj4NCiZndDvCoCDCoCDCoG9ubHkgbWVhbmluZ2Z1bCBkaWZmZXJlbmNlIGlz
IHRoZSB1c2Ugb2YgdGhlIEdGUF9ETUEgZmxhZy48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDC
oFJhdGhlciB0aGFuIGR1cGxpY2F0aW5nIHRoZSBDTUEgY29kZSwgaXQmIzM5O3MgYmV0dGVyIHRv
IGNoYW5nZSB0aGUgQ01BPGJyPg0KJmd0O8KgIMKgIMKgaGVscGVycyB0byBwcm92aWRlIGEgd2F5
IG9mIHNldHRpbmcgdGhpcyBmbGFnLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgQmVzdCBy
ZWdhcmRzPGJyPg0KJmd0O8KgIMKgIMKgVGhvbWFzPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoGlmICghc3ByZF9nZW0tJmd0O3ZhZGRyKSB7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBEUk1fRVJST1IoJnF1b3Q7ZmFpbGVkIHRvIGFs
bG9jYXRlIGJ1ZmZlciB3aXRoIHNpemUgJWxsdVxuJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXJncy0mZ3Q7c2l6ZSk7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSAtRU5PTUVNOzxi
cj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJvcjs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldCA9IGRybV9nZW1faGFuZGxlX2NyZWF0ZShm
aWxlX3ByaXYsICZhbXA7c3ByZF9nZW0tJmd0O2Jhc2UsPGJyPg0KJmd0O8KgIMKgIMKgJmFtcDth
cmdzLSZndDtoYW5kbGUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHJldCk8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdvdG8gZXJyb3I7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBkcm1f
Z2VtX29iamVjdF9wdXRfdW5sb2NrZWQoJmFtcDtzcHJkX2dlbS0mZ3Q7YmFzZSk7PGJyPg0KJmd0
O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqByZXR1cm4gMDs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtlcnJvcjo8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNwcmRfZ2VtX2ZyZWVfb2JqZWN0KCZhbXA7c3By
ZF9nZW0tJmd0O2Jhc2UpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIHJl
dDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArc3RhdGljIGludCBzcHJkX2dlbV9vYmplY3RfbW1hcChzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaiw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJy
Pg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpbnQgcmV0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgc3RydWN0IHNwcmRfZ2VtX29iaiAqc3ByZF9nZW0gPSB0b19zcHJkX2dlbV9v
Ymoob2JqKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoHZtYS0mZ3Q7dm1fZmxhZ3MgJmFtcDs9IH5WTV9QRk5NQVA7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqB2bWEtJmd0O3ZtX3Bnb2ZmID0gMDs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldCA9IGRtYV9tbWFwX3djKG9i
ai0mZ3Q7ZGV2LSZndDtkZXYsIHZtYSw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwcmRfZ2VtLSZndDt2YWRk
ciwgc3ByZF9nZW0tJmd0O2RtYV9hZGRyLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdm1hLSZndDt2bV9lbmQg
LSB2bWEtJmd0O3ZtX3N0YXJ0KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChy
ZXQpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBkcm1fZ2VtX3Zt
X2Nsb3NlKHZtYSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK308YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICtpbnQgc3ByZF9nZW1fbW1hcChz
dHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmo7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBpbnQgcmV0Ozxi
cj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0
ID0gZHJtX2dlbV9tbWFwKGZpbHAsIHZtYSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqBpZiAocmV0KTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIHJldDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvC
oCDCoCDCoG9iaiA9IHZtYS0mZ3Q7dm1fcHJpdmF0ZV9kYXRhOzxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIHNwcmRfZ2VtX29iamVj
dF9tbWFwKG9iaiwgdm1hKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRfZ2VtX3ByaW1lX21tYXAo
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSk8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAg
wqBpbnQgcmV0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgcmV0ID0gZHJtX2dlbV9tbWFwX29iaihvYmosIG9iai0mZ3Q7c2l6ZSwgdm1hKTs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoGlmIChyZXQpPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgcmV0dXJuIHNwcmRfZ2VtX29iamVj
dF9tbWFwKG9iaiwgdm1hKTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArc3RydWN0IHNnX3RhYmxlICpzcHJkX2dl
bV9wcmltZV9nZXRfc2dfdGFibGUoc3RydWN0PGJyPg0KJmd0O8KgIMKgIMKgZHJtX2dlbV9vYmpl
Y3QgKm9iaik8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqBzdHJ1Y3Qgc3ByZF9nZW1fb2JqICpzcHJkX2dlbSA9IHRvX3NwcmRfZ2VtX29iaihv
YmopOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3RydWN0IHNnX3RhYmxlICpzZ3Ri
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaW50IHJldDs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHNndGIgPSBremFsbG9jKHNp
emVvZigqc2d0YiksIEdGUF9LRVJORUwpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
aWYgKCFzZ3RiKTxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIEVSUl9QVFIoLUVOT01FTSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqByZXQgPSBkbWFfZ2V0X3NndGFibGUob2JqLSZndDtkZXYtJmd0
O2Rldiwgc2d0Yiwgc3ByZF9nZW0tJmd0O3ZhZGRyLDxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3ByZF9nZW0tJmd0O2RtYV9h
ZGRyLCBvYmotJmd0O3NpemUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHJl
dCkgezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX0VSUk9S
KCZxdW90O2ZhaWxlZCB0byBhbGxvY2F0ZSBzZ190YWJsZSwgJWRcbiZxdW90OywgcmV0KTs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGtmcmVlKHNndGIpOzxicj4N
CiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIEVSUl9QVFIocmV0
KTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHJldHVybiBzZ3RiOzxicj4NCiZndDvC
oCDCoCDCoCZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnNwcmRfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJs
ZShzdHJ1Y3Q8YnI+DQomZ3Q7wqAgwqAgwqBkcm1fZGV2aWNlICpkcm0sPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICph
dHRhY2gsIHN0cnVjdCBzZ190YWJsZTxicj4NCiZndDvCoCDCoCDCoCpzZ3RiKTxicj4NCiZndDvC
oCDCoCDCoCZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBzcHJk
X2dlbV9vYmogKnNwcmRfZ2VtOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgc3ByZF9nZW0gPSBzcHJkX2dlbV9vYmpfY3JlYXRlKGRybSwgYXR0
YWNoLSZndDtkbWFidWYtJmd0O3NpemUpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKg
aWYgKElTX0VSUihzcHJkX2dlbSkpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqByZXR1cm4gRVJSX0NBU1Qoc3ByZF9nZW0pOzxicj4NCiZndDvCoCDCoCDCoCZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgRFJNX0RFQlVHKCZxdW90O2dlbSA9ICVw
XG4mcXVvdDssICZhbXA7c3ByZF9nZW0tJmd0O2Jhc2UpOzxicj4NCiZndDvCoCDCoCDCoCZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgaWYgKHNndGItJmd0O25lbnRzID09IDEp
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzcHJkX2dlbS0mZ3Q7
ZG1hX2FkZHIgPSBzZ19kbWFfYWRkcmVzcyhzZ3RiLSZndDtzZ2wpOzxicj4NCiZndDvCoCDCoCDC
oCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3ByZF9nZW0tJmd0O3NndGIg
PSBzZ3RiOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgK8Kg
IMKgIMKgcmV0dXJuICZhbXA7c3ByZF9nZW0tJmd0O2Jhc2U7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArfTxicj4NCiZndDvCoCDCoCDCoCZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9z
cHJkL3NwcmRfZ2VtLmg8YnI+DQomZ3Q7wqAgwqAgwqBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL3Nw
cmRfZ2VtLmg8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyBpbmRleCAwMDAwMDAwLi5iNjc0MGJkPGJyPg0KJmd0O8KgIMKgIMKg
Jmd0OyAtLS0gL2Rldi9udWxsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArKysgYi9kcml2ZXJzL2dw
dS9kcm0vc3ByZC9zcHJkX2dlbS5oPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBAQCAtMCwwICsxLDMw
IEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAgKi88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsvKjxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyAqIENvcHlyaWdodCAoQykgMjAxOSBVbmlzb2MgSW5jLjxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyAqLzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDsgKyNpZm5k
ZWYgX1NQUkRfR0VNX0hfPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2RlZmluZSBfU1BSRF9HRU1f
SF88YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsjaW5jbHVk
ZSAmbHQ7ZHJtL2RybV9nZW0uaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7ICtzdHJ1Y3Qgc3ByZF9nZW1fb2JqIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
ICvCoCDCoCDCoHN0cnVjdCBkcm1fZ2VtX29iamVjdMKgIMKgYmFzZTs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoGRtYV9hZGRyX3TCoCDCoCDCoCDCoCDCoCDCoCDCoCBkbWFfYWRkcjs8
YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoHN0cnVjdCBzZ190YWJsZcKgIMKgIMKgIMKg
IMKgKnNndGI7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqB2b2lkwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKnZhZGRyOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK307PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArI2RlZmluZSB0b19zcHJk
X2dlbV9vYmooeCnCoCDCoGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3Qgc3ByZF9nZW1fb2JqLDxicj4N
CiZndDvCoCDCoCDCoGJhc2UpPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArdm9pZCBzcHJkX2dlbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
KmdlbSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRfZ2VtX2R1bWJfY3JlYXRlKHN0
cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LCBzdHJ1Y3Q8YnI+DQomZ3Q7wqAgwqAgwqBkcm1fZGV2
aWNlICpkZXYsPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1bWIgKmFyZ3MpOzxicj4NCiZn
dDvCoCDCoCDCoCZndDsgK2ludCBzcHJkX2dlbV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAraW50IHNwcmRf
Z2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0cnVjdCBzZ190YWJsZSAqc3By
ZF9nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlKHN0cnVjdDxicj4NCiZndDvCoCDCoCDCoGRybV9nZW1f
b2JqZWN0ICpvYmopOzxicj4NCiZndDvCoCDCoCDCoCZndDsgK3N0cnVjdCBkcm1fZ2VtX29iamVj
dCAqc3ByZF9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdDxicj4NCiZndDvCoCDCoCDC
oGRybV9kZXZpY2UgKmRldiw8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwgc3RydWN0IHNnX3RhYmxlPGJy
Pg0KJmd0O8KgIMKgIMKgKnNndGIpOzxicj4NCiZndDvCoCDCoCDCoCZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCZndDsgKyNlbmRpZjxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7IDxicj4N
CiZndDvCoCDCoCDCoC0tIDxicj4NCiZndDvCoCDCoCDCoFRob21hcyBaaW1tZXJtYW5uPGJyPg0K
Jmd0O8KgIMKgIMKgR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcjxicj4NCiZndDvCoCDCoCDCoFNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSDxicj4NCiZndDvCoCDCoCDCoE1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueTxicj4NCiZndDvCoCDCoCDCoChIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZyk8YnI+DQomZ3Q7wqAgwqAgwqBHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyPGJyPg0KJmd0OyA8YnI+DQo8YnI+DQotLSA8YnI+DQpUaG9tYXMg
WmltbWVybWFubjxicj4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXI8YnI+DQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkg8YnI+DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnk8YnI+DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpPGJyPg0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcjxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48
L2Rpdj4NCg==
--0000000000005eef65059c1a182c--

--===============1635999276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1635999276==--
