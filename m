Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D97D15A341
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEF66F48E;
	Wed, 12 Feb 2020 08:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8772E6EA5B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 13:02:38 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id e21so3821154qtp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 05:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KY7bw/+lnelZMQ6wtLiTfXg/iQuYYTpOeaWSM4cRk0w=;
 b=NcYd20idlCXy8vXHtAkOXYlCGbm0OR8jM5EZeFVcHhPLNlbmbC1CcKmVwLTUt8AjLg
 HUOhDJBbrRctfEZo8hUVXD92c97mSv+4EU4al7ZSC1JD58f8OOeT68kwDQaIKNaSMVi0
 nTdWIFNb1Un7d95uKjCHODy9HUA3+1DuR6UDwQz3Wi6ucR/XMte8jZJ8nZBtwWuRqi7o
 rqH25ufO3P0Hfh+PPbaktkTH0XFtLdlpxQ2vR8DYQW4vx5HKkRIKXJEdOfChQqLl/TBX
 rVZZq8GJ+pkueacMrQhRZMUD3vDYeO/05eJIHskpf7W5p1VXyUir7La3UhtZkhum3LZC
 Px7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KY7bw/+lnelZMQ6wtLiTfXg/iQuYYTpOeaWSM4cRk0w=;
 b=kbqCxXu8QxEpxEXG8PxMlrQjKgyTwn+JrFHM8b24ridy2vgk1EyEg1FKftDjsc8C8i
 FrQEAsZHxLmMqNRMQwaI+cudJHrMy/kT1R3ooBMYKIus1J4pzSJRhytqtiz3RpI804tA
 KvkC+6pzmGPL6yfEGXFleMB6e4FP1V/ouKEqKxoqawNL8xNH8pG0ZjDpGAiucgFa+bTa
 b44M6pD7LgCKYmOFrfGb7ipCiJ5OOjmKH49qQTQNgiggR5CIJkFEwuV5VTxuNVqjULTR
 O7rVFfJ54t01YDEEWw8R24/9YpoCl3P2Xhoj4H6CMAxjzXK9Xs0QuZ8zXFGPWL8rreTe
 2uIQ==
X-Gm-Message-State: APjAAAUZYGu5Z4lhKTn2bCmVuPJMqAtW0fLzrJ5n6bRAPjrsWwYi+2Kj
 Mlg2bKAYPQq8Wq0jFRJNJcLh4ZJywORjZ/j+vYQ=
X-Google-Smtp-Source: APXvYqyTcgL5/oy/Mxx/w+kn2L+dfNcTHhDJDkQcE5vm0dMVvjmH/lxFwBjmiXSHm3XJR6sK1ESdXpedVzzyMsxwaQw=
X-Received: by 2002:aed:2050:: with SMTP id 74mr2248481qta.217.1581426156687; 
 Tue, 11 Feb 2020 05:02:36 -0800 (PST)
MIME-Version: 1.0
References: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
 <1579596662-15466-3-git-send-email-kevin3.tang@gmail.com>
 <d9d614c6-607a-6889-318d-e64c3a2c8671@suse.de>
In-Reply-To: <d9d614c6-607a-6889-318d-e64c3a2c8671@suse.de>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Tue, 11 Feb 2020 21:02:04 +0800
Message-ID: <CAFPSGXZmxF1hdfZ=Zw4Dd62njeuq2wq0oDcvBy5qSzi5MyHSFA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/6] drm/sprd: add Unisoc's drm kms master
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Content-Type: multipart/mixed; boundary="===============1716865022=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1716865022==
Content-Type: multipart/related; boundary="0000000000004faf0a059e4c7871"

--0000000000004faf0a059e4c7871
Content-Type: multipart/alternative; boundary="0000000000004faf09059e4c7870"

--0000000000004faf09059e4c7870
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,
Sorry for leaving so long because of chinese new year

On Thu, Jan 23, 2020 at 5:13 PM Thomas Zimmermann <tzimmermann@suse.de>
wrote:

> Hi,
>
> thank you for replacing for GEM code with the generic CMA
> implementation. Once it's needed, we can add specialized memory
> management to you driver.
>
> I've looked throught your submission and think you may want to
> reconsider the current design. AFAICT, you have some a driver with
> generic code and the individual hardware as sub-devices. That's not
> strictly wrong or a roadblocker for merging the driver, but it is likely
> to become a problem in long-term maintainence.
>
> Please read below for some details and let me know what you think.
>
 We have multi display controller(dpu), there will be some differences in
the hardware.
So add KMS to manage multiple dpu, like this:
[image: 1.png]
dpu0 and dpu1 all maybe have multi ip version, so ip core driver is
hardware interface,dpu0 and dpu1 driver call ip core interface.
Our crtcs maybe have different designs like clock/power/controller
register. But crtc plane have the same design.

>
> Am 21.01.20 um 09:50 schrieb Kevin Tang:
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
> >  drivers/gpu/drm/Kconfig           |   2 +
> >  drivers/gpu/drm/Makefile          |   1 +
> >  drivers/gpu/drm/sprd/Kconfig      |  14 ++
> >  drivers/gpu/drm/sprd/Makefile     |   9 +
> >  drivers/gpu/drm/sprd/sprd_crtc.c  | 212 ++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_crtc.h  |  98 ++++++++++
> >  drivers/gpu/drm/sprd/sprd_drm.c   | 305 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_drm.h   |  16 ++
> >  drivers/gpu/drm/sprd/sprd_plane.c | 393
> ++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_plane.h |  36 ++++
> >  10 files changed, 1086 insertions(+)
> >  create mode 100644 drivers/gpu/drm/sprd/Kconfig
> >  create mode 100644 drivers/gpu/drm/sprd/Makefile
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.h
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_plane.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_plane.h
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
> > @@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  +=3D lima/
> >  obj-$(CONFIG_DRM_PANFROST) +=3D panfrost/
> >  obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
> >  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
> > +obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> > new file mode 100644
> > index 0000000..79f286b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -0,0 +1,14 @@
> > +config DRM_SPRD
> > +     tristate "DRM Support for Unisoc SoCs Platform"
> > +     depends on ARCH_SPRD
> > +     depends on DRM && OF
> > +     select DRM_KMS_HELPER
> > +     select DRM_GEM_CMA_HELPER
> > +     select DRM_KMS_CMA_HELPER
> > +     select DRM_MIPI_DSI
> > +     select DRM_PANEL
> > +     select VIDEOMODE_HELPERS
> > +     select BACKLIGHT_CLASS_DEVICE
> > +     help
> > +       Choose this option if you have a Unisoc chipsets.
> > +       If M is selected the module will be called sprd-drm.
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > new file mode 100644
> > index 0000000..8a21c23
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +ccflags-y +=3D -Iinclude/drm
> > +
> > +subdir-ccflags-y +=3D -I$(src)
> > +
> > +obj-y :=3D sprd_drm.o \
> > +     sprd_crtc.o \
> > +     sprd_plane.o
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/sprd/sprd_crtc.c
> b/drivers/gpu/drm/sprd/sprd_crtc.c
> > new file mode 100644
> > index 0000000..4a35281
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_crtc.c
> > @@ -0,0 +1,212 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#include <linux/dma-buf.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_plane_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "sprd_drm.h"
> > +#include "sprd_crtc.h"
> > +
> > +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     if (sprd_crtc->ops->mode_set_nofb)
> > +             return sprd_crtc->ops->mode_set_nofb(sprd_crtc);
> > +}
> > +
> > +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc=
,
> > +     const struct drm_display_mode *mode)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     if (sprd_crtc->ops->mode_valid)
> > +             return sprd_crtc->ops->mode_valid(sprd_crtc, mode);
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static int sprd_crtc_atomic_check(struct drm_crtc *crtc,
> > +                                  struct drm_crtc_state *state)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     if (!state->enable)
> > +             return 0;
> > +
> > +     if (sprd_crtc->ops->atomic_check)
> > +             return sprd_crtc->ops->atomic_check(sprd_crtc, state);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_crtc_atomic_begin(struct drm_crtc *crtc,
> > +                                  struct drm_crtc_state *old_crtc_stat=
e)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     if (sprd_crtc->ops->atomic_begin)
> > +             sprd_crtc->ops->atomic_begin(sprd_crtc);
> > +}
> > +
> > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > +                                       struct drm_crtc_state *old_stat=
e)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     if (sprd_crtc->ops->atomic_enable)
> > +             sprd_crtc->ops->atomic_enable(sprd_crtc);
> > +
> > +     drm_crtc_vblank_on(crtc);
> > +}
> > +
> > +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
> > +                                        struct drm_crtc_state
> *old_state)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     drm_crtc_vblank_off(crtc);
> > +
> > +     if (sprd_crtc->ops->atomic_disable)
> > +             sprd_crtc->ops->atomic_disable(sprd_crtc);
> > +
> > +     if (crtc->state->event && !crtc->state->active) {
> > +             spin_lock_irq(&crtc->dev->event_lock);
> > +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +             spin_unlock_irq(&crtc->dev->event_lock);
> > +
> > +             crtc->state->event =3D NULL;
> > +     }
> > +}
> > +
> > +static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
> > +                                  struct drm_crtc_state *old_crtc_stat=
e)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     if (sprd_crtc->ops->atomic_flush)
> > +             sprd_crtc->ops->atomic_flush(sprd_crtc);
> > +
> > +     spin_lock_irq(&crtc->dev->event_lock);
> > +     if (crtc->state->event) {
> > +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +             crtc->state->event =3D NULL;
> > +     }
> > +     spin_unlock_irq(&crtc->dev->event_lock);
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D {
> > +     .mode_set_nofb  =3D sprd_crtc_mode_set_nofb,
> > +     .mode_valid     =3D sprd_crtc_mode_valid,
> > +     .atomic_check   =3D sprd_crtc_atomic_check,
> > +     .atomic_begin   =3D sprd_crtc_atomic_begin,
> > +     .atomic_enable  =3D sprd_crtc_atomic_enable,
> > +     .atomic_disable =3D sprd_crtc_atomic_disable,
> > +     .atomic_flush   =3D sprd_crtc_atomic_flush,
> > +};
>
> This is just boilerplate resulting from the current design. Instead of
> having struct sprd_crtc_ops and these mid-layer functions, simply give
> each hardware device its own instance of drm_crtc_helper_funcs. If
> hardware can share some of the implementation, put it into a common
> helper function.
>
The current design, I refer to exynos design. i think it's also a good idea=
.
"It is likely to become a problem in long-term maintainence", how to
understand it?


> > +
> > +static void sprd_crtc_cleanup(struct drm_crtc *crtc)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     drm_crtc_cleanup(crtc);
> > +     kfree(sprd_crtc);
> > +}
> > +
> > +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     if (sprd_crtc->ops->enable_vblank)
> > +             return sprd_crtc->ops->enable_vblank(sprd_crtc);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
> > +{
> > +     struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc);
> > +
> > +     if (sprd_crtc->ops->disable_vblank)
> > +             sprd_crtc->ops->disable_vblank(sprd_crtc);
> > +}
> > +
> > +static const struct drm_crtc_funcs sprd_crtc_funcs =3D {
> > +     .destroy        =3D sprd_crtc_cleanup,
> > +     .set_config     =3D drm_atomic_helper_set_config,
> > +     .page_flip      =3D drm_atomic_helper_page_flip,
> > +     .reset          =3D drm_atomic_helper_crtc_reset,
> > +     .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_stat=
e,
> > +     .atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_state,
> > +     .enable_vblank  =3D sprd_crtc_enable_vblank,
> > +     .disable_vblank =3D sprd_crtc_disable_vblank,
> > +};
>
> Same as with the CRTC helper functions.
>
> > +
> > +struct sprd_crtc *sprd_crtc_init(struct drm_device *drm,
> > +                                     struct drm_plane *plane,
> > +                                     enum sprd_crtc_output_type type,
> > +                                     const struct sprd_crtc_ops *ops,
>
> Rather hand-in the hardware's crtc and crtc-helper instances.
>
> > +                                     void *dpu)
> > +{
> > +     struct sprd_crtc *sprd_crtc;
> > +     int ret;
> > +
> > +     sprd_crtc =3D kzalloc(sizeof(*sprd_crtc), GFP_KERNEL);
> > +     if (!sprd_crtc)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     sprd_crtc->type =3D type;
> > +     sprd_crtc->ops =3D ops;
> > +     sprd_crtc->dpu =3D dpu;
> > +
> > +     ret =3D drm_crtc_init_with_planes(drm, &sprd_crtc->base, plane, N=
ULL,
> > +                                     &sprd_crtc_funcs, NULL);
> > +     if (ret < 0) {
> > +             DRM_ERROR("failed to init crtc.\n");
> > +             goto err_crtc;
> > +     }
> > +
> > +     drm_mode_crtc_set_gamma_size(&sprd_crtc->base, 256);
> > +
> > +     drm_crtc_helper_add(&sprd_crtc->base, &sprd_crtc_helper_funcs);
> > +
> > +     return sprd_crtc;
> > +
> > +err_crtc:
> > +     plane->funcs->destroy(plane);
> > +     kfree(sprd_crtc);
> > +     return ERR_PTR(ret);
> > +}
> > +
> > +struct sprd_crtc *sprd_crtc_get_by_type(struct drm_device *drm,
> > +                                    enum sprd_crtc_output_type out_typ=
e)
> > +{
> > +     struct drm_crtc *crtc;
> > +
> > +     drm_for_each_crtc(crtc, drm)
> > +             if (to_sprd_crtc(crtc)->type =3D=3D out_type)
> > +                     return to_sprd_crtc(crtc);
> > +
> > +     return ERR_PTR(-EPERM);
> > +}
> > +
> > +int sprd_drm_set_possible_crtcs(struct drm_encoder *encoder,
> > +             enum sprd_crtc_output_type out_type)
> > +{
> > +     struct sprd_crtc *crtc =3D sprd_crtc_get_by_type(encoder->dev,
> > +                                             out_type);
> > +
> > +     if (IS_ERR(crtc))
> > +             return PTR_ERR(crtc);
> > +
> > +     encoder->possible_crtcs =3D drm_crtc_mask(&crtc->base);
> > +
> > +     return 0;
> > +}
> > diff --git a/drivers/gpu/drm/sprd/sprd_crtc.h
> b/drivers/gpu/drm/sprd/sprd_crtc.h
> > new file mode 100644
> > index 0000000..9dbb2eb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_crtc.h
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#ifndef __SPRD_CRTC_H__
> > +#define __SPRD_CRTC_H__
> > +
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_encoder.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_plane.h>
> > +#include <drm/drm_print.h>
> > +
> > +#define to_sprd_crtc(x)                      container_of(x, struct
> sprd_crtc, base)
> > +
> > +enum sprd_crtc_output_type {
> > +     SPRD_DISPLAY_TYPE_NONE,
> > +     /* RGB or CPU Interface */
> > +     SPRD_DISPLAY_TYPE_LCD,
> > +     /* DisplayPort Interface */
> > +     SPRD_DISPLAY_TYPE_DP,
> > +     /* HDMI Interface */
> > +     SPRD_DISPLAY_TYPE_HDMI,
> > +};
> > +
> > +struct dpu_capability {
> > +     u32 max_layers;
> > +     const u32 *fmts_ptr;
> > +     u32 fmts_cnt;
> > +};
> > +
> > +struct sprd_dpu_layer {
> > +     u8 index;
> > +     u8 planes;
> > +     u32 addr[4];
> > +     u32 pitch[4];
> > +     s16 src_x;
> > +     s16 src_y;
> > +     s16 src_w;
> > +     s16 src_h;
> > +     s16 dst_x;
> > +     s16 dst_y;
> > +     u16 dst_w;
> > +     u16 dst_h;
> > +     u32 format;
> > +     u32 alpha;
> > +     u32 blending;
> > +     u32 rotation;
> > +     u32 xfbc;
> > +     u32 height;
> > +     u32 header_size_r;
> > +     u32 header_size_y;
> > +     u32 header_size_uv;
> > +     u32 y2r_coef;
> > +     u8 pallete_en;
> > +     u32 pallete_color;
> > +};
> > +
> > +struct sprd_crtc {
> > +     struct drm_crtc base;
> > +     enum sprd_crtc_output_type type;
> > +     const struct sprd_crtc_ops *ops;
> > +     struct sprd_dpu_layer *layers;
> > +     u8 pending_planes;
> > +     void *dpu;
> > +};
> > +
> > +struct sprd_crtc_ops {
> > +     void (*atomic_enable)(struct sprd_crtc *crtc);
> > +     void (*atomic_disable)(struct sprd_crtc *crtc);
> > +     int (*enable_vblank)(struct sprd_crtc *crtc);
> > +     void (*disable_vblank)(struct sprd_crtc *crtc);
> > +     enum drm_mode_status (*mode_valid)(struct sprd_crtc *crtc,
> > +             const struct drm_display_mode *mode);
> > +     void (*mode_set_nofb)(struct sprd_crtc *crtc);
> > +     int (*atomic_check)(struct sprd_crtc *crtc,
> > +                         struct drm_crtc_state *state);
> > +     void (*atomic_begin)(struct sprd_crtc *crtc);
> > +     void (*atomic_flush)(struct sprd_crtc *crtc);
> > +
> > +     int (*prepare_fb)(struct sprd_crtc *crtc,
> > +                       struct drm_plane_state *new_state);
> > +     void (*cleanup_fb)(struct sprd_crtc *crtc,
> > +                        struct drm_plane_state *old_state);
> > +     void (*atomic_update)(struct sprd_crtc *crtc,
> > +                          struct drm_plane *plane);
> > +};
> > +
> > +struct sprd_crtc *sprd_crtc_init(struct drm_device *drm,
> > +                                     struct drm_plane *plane,
> > +                                     enum sprd_crtc_output_type type,
> > +                                     const struct sprd_crtc_ops *ops,
> > +                                     void *dpu);
> > +int sprd_drm_set_possible_crtcs(struct drm_encoder *encoder,
> > +             enum sprd_crtc_output_type out_type);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > new file mode 100644
> > index 0000000..d63b7e3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -0,0 +1,305 @@
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
> > +#define DRIVER_NAME  "sprd"
> > +#define DRIVER_DESC  "Spreadtrum SoCs' DRM Driver"
> > +#define DRIVER_DATE  "20191101"
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
> > +     drm_mode_config_init(drm);
> > +
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
> > +static const struct file_operations sprd_drm_fops =3D {
> > +     .owner          =3D THIS_MODULE,
> > +     .open           =3D drm_open,
> > +     .release        =3D drm_release,
> > +     .unlocked_ioctl =3D drm_ioctl,
> > +     .compat_ioctl   =3D drm_compat_ioctl,
> > +     .poll           =3D drm_poll,
> > +     .read           =3D drm_read,
> > +     .llseek         =3D no_llseek,
> > +     .mmap           =3D drm_gem_cma_mmap,
> > +};
> > +
> > +static struct drm_driver sprd_drm_drv =3D {
> > +     .driver_features        =3D DRIVER_GEM | DRIVER_ATOMIC,
> > +     .fops                   =3D &sprd_drm_fops,
> > +     .gem_vm_ops             =3D &drm_gem_cma_vm_ops,
> > +     .gem_free_object_unlocked       =3D drm_gem_cma_free_object,
> > +     .dumb_create            =3D drm_gem_cma_dumb_create,
> > +     .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
> > +     .gem_prime_import       =3D drm_gem_prime_import,
> > +     .gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
>
> Rather set these pointers with DRM_GEM_CMA_VMAP_DRIVER_OPS.
>
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
> > +     struct drm_device *drm;
> > +     struct sprd_drm *sprd;
> > +     int err;
> > +
> > +     drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
> > +     if (IS_ERR(drm))
> > +             return PTR_ERR(drm);
> > +
> > +     dev_set_drvdata(dev, drm);
> > +
> > +     sprd =3D devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> > +     if (!sprd) {
> > +             err =3D -ENOMEM;
> > +             goto err_free_drm;
> > +     }
> > +     drm->dev_private =3D sprd;
> > +
> > +     sprd_drm_mode_config_init(drm);
> > +
> > +     /* bind and init sub drivers */
> > +     err =3D component_bind_all(drm->dev, drm);
> > +     if (err) {
> > +             DRM_ERROR("failed to bind all component.\n");
> > +             goto err_dc_cleanup;
> > +     }
> > +
> > +     /* vblank init */
> > +     err =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +     if (err) {
> > +             DRM_ERROR("failed to initialize vblank.\n");
> > +             goto err_unbind_all;
> > +     }
> > +     /* with irq_enabled =3D true, we can use the vblank feature. */
> > +     drm->irq_enabled =3D true;
>
> This line indicates the problem's design. The irq is initialized in the
> sub-device code, but the device state is set here. Instead both should
> be set in the same place.
>
Everyone seems to use it like this, so why can't follow others?

>
> > +
> > +     /* reset all the states of crtc/plane/encoder/connector */
> > +     drm_mode_config_reset(drm);
> > +
> > +     /* init kms poll for handling hpd */
> > +     drm_kms_helper_poll_init(drm);
>
> Most of this function's code should be moved into the sub-device bind
> function.
>
> Here, maybe do:
>
>  * allocate device structures
>  * call component_bind_all()
>  * on success, register device
>
> The sub-device function should then do
>
>  * init modesetting, crtc, planes, etc.
>  * do drm_mode_config_reset()
>  * init vblanking
>  * init the irq
>  * do drm_kms_helper_poll_init()
>
> roughtly in that order. It makes sense to call drm_vblank_init() after
> drm_mode_config_reset(), as vblanking uses some of the mode-config fields=
.
>
> > +
> > +     err =3D drm_dev_register(drm, 0);
> > +     if (err < 0)
> > +             goto err_kms_helper_poll_fini;
>
> You don't need/want an fbdev console?
>
Yes, fbdev is not supported, maybe support later for LoT(?)

>
> Best regards
> Thomas
>
> > +
> > +     return 0;
> > +
> > +err_kms_helper_poll_fini:
> > +     drm_kms_helper_poll_fini(drm);
> > +err_unbind_all:
> > +     component_unbind_all(drm->dev, drm);
> > +err_dc_cleanup:
> > +     drm_mode_config_cleanup(drm);
> > +err_free_drm:
> > +     drm_dev_put(drm);
> > +     return err;
> > +}
> > +
> > +static void sprd_drm_unbind(struct device *dev)
> > +{
> > +     drm_put_dev(dev_get_drvdata(dev));
> > +}
> > +
> > +static const struct component_master_ops drm_component_ops =3D {
> > +     .bind =3D sprd_drm_bind,
> > +     .unbind =3D sprd_drm_unbind,
> > +};
> > +
> > +static int compare_of(struct device *dev, void *data)
> > +{
> > +     struct device_node *np =3D data;
> > +
> > +     DRM_DEBUG("compare %s\n", np->full_name);
> > +
> > +     return dev->of_node =3D=3D np;
> > +}
> > +
> > +static int sprd_drm_component_probe(struct device *dev,
> > +                        const struct component_master_ops *m_ops)
> > +{
> > +     struct device_node *ep, *port, *remote;
> > +     struct component_match *match =3D NULL;
> > +     int i;
> > +
> > +     if (!dev->of_node)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Bind the crtc's ports first, so that
> drm_of_find_possible_crtcs()
> > +      * called from encoder's .bind callbacks works as expected
> > +      */
> > +     for (i =3D 0; ; i++) {
> > +             port =3D of_parse_phandle(dev->of_node, "ports", i);
> > +             if (!port)
> > +                     break;
> > +
> > +             if (!of_device_is_available(port->parent)) {
> > +                     of_node_put(port);
> > +                     continue;
> > +             }
> > +
> > +             component_match_add(dev, &match, compare_of, port->parent=
);
> > +             of_node_put(port);
> > +     }
> > +
> > +     if (i =3D=3D 0) {
> > +             dev_err(dev, "missing 'ports' property\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     if (!match) {
> > +             dev_err(dev, "no available port\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     /*
> > +      * For bound crtcs, bind the encoders attached to their remote
> endpoint
> > +      */
> > +     for (i =3D 0; ; i++) {
> > +             port =3D of_parse_phandle(dev->of_node, "ports", i);
> > +             if (!port)
> > +                     break;
> > +
> > +             if (!of_device_is_available(port->parent)) {
> > +                     of_node_put(port);
> > +                     continue;
> > +             }
> > +
> > +             for_each_child_of_node(port, ep) {
> > +                     remote =3D of_graph_get_remote_port_parent(ep);
> > +                     if (!remote || !of_device_is_available(remote)) {
> > +                             of_node_put(remote);
> > +                             continue;
> > +                     } else if
> (!of_device_is_available(remote->parent)) {
> > +                             dev_warn(dev, "parent device of %s is not
> available\n",
> > +                                      remote->full_name);
> > +                             of_node_put(remote);
> > +                             continue;
> > +                     }
> > +
> > +                     component_match_add(dev, &match, compare_of,
> remote);
> > +                     of_node_put(remote);
> > +             }
> > +             of_node_put(port);
> > +     }
> > +
> > +     return component_master_add_with_match(dev, m_ops, match);
> > +}
> > +
> > +static int sprd_drm_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +
> > +     ret =3D dma_set_mask_and_coherent(&pdev->dev, ~0);
> > +     if (ret) {
> > +             DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret)=
;
> > +             return ret;
> > +     }
> > +
> > +     return sprd_drm_component_probe(&pdev->dev, &drm_component_ops);
> > +}
> > +
> > +static int sprd_drm_remove(struct platform_device *pdev)
> > +{
> > +     component_master_del(&pdev->dev, &drm_component_ops);
> > +     return 0;
> > +}
> > +
> > +static void sprd_drm_shutdown(struct platform_device *pdev)
> > +{
> > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> > +
> > +     if (!drm) {
> > +             DRM_WARN("drm device is not available, no shutdown\n");
> > +             return;
> > +     }
> > +
> > +     drm_atomic_helper_shutdown(drm);
> > +}
> > +
> > +static const struct of_device_id drm_match_table[] =3D {
> > +     { .compatible =3D "sprd,display-subsystem", },
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, drm_match_table);
> > +
> > +static struct platform_driver sprd_drm_driver =3D {
> > +     .probe =3D sprd_drm_probe,
> > +     .remove =3D sprd_drm_remove,
> > +     .shutdown =3D sprd_drm_shutdown,
> > +     .driver =3D {
> > +             .name =3D "sprd-drm-drv",
> > +             .of_match_table =3D drm_match_table,
> > +     },
> > +};
> > +
> > +static struct platform_driver *sprd_drm_drivers[]  =3D {
> > +     &sprd_drm_driver,
> > +};
> > +
> > +static int __init sprd_drm_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret =3D platform_register_drivers(sprd_drm_drivers,
> > +                                     ARRAY_SIZE(sprd_drm_drivers));
> > +     return ret;
> > +}
> > +
> > +static void __exit sprd_drm_exit(void)
> > +{
> > +     platform_unregister_drivers(sprd_drm_drivers,
> > +                                 ARRAY_SIZE(sprd_drm_drivers));
> > +}
> > +
> > +module_init(sprd_drm_init);
> > +module_exit(sprd_drm_exit);
> > +
> > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> > +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> b/drivers/gpu/drm/sprd/sprd_drm.h
> > new file mode 100644
> > index 0000000..137cb27
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#ifndef _SPRD_DRM_H_
> > +#define _SPRD_DRM_H_
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_print.h>
> > +
> > +struct sprd_drm {
> > +     struct drm_device *drm;
> > +};
> > +
> > +#endif /* _SPRD_DRM_H_ */
> > diff --git a/drivers/gpu/drm/sprd/sprd_plane.c
> b/drivers/gpu/drm/sprd/sprd_plane.c
> > new file mode 100644
> > index 0000000..15ebb97
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_plane.c
> > @@ -0,0 +1,393 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#include <linux/dma-buf.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_plane_helper.h>
> > +
> > +#include "sprd_crtc.h"
> > +#include "sprd_drm.h"
> > +#include "sprd_plane.h"
> > +
> > +static int sprd_plane_prepare_fb(struct drm_plane *plane,
> > +                             struct drm_plane_state *new_state)
> > +{
> > +     struct drm_plane_state *curr_state =3D plane->state;
> > +     struct sprd_crtc *crtc =3D to_sprd_crtc(new_state->crtc);
> > +
> > +     if ((curr_state->fb =3D=3D new_state->fb) || !new_state->fb)
> > +             return 0;
> > +
> > +     if (crtc->ops->prepare_fb)
> > +             crtc->ops->prepare_fb(crtc, new_state);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_plane_cleanup_fb(struct drm_plane *plane,
> > +                             struct drm_plane_state *old_state)
> > +{
> > +     struct drm_plane_state *curr_state =3D plane->state;
> > +     struct sprd_crtc *crtc =3D to_sprd_crtc(old_state->crtc);
> > +
> > +     if ((curr_state->fb =3D=3D old_state->fb) || !old_state->fb)
> > +             return;
> > +
> > +     if (crtc->ops->cleanup_fb)
> > +             crtc->ops->cleanup_fb(crtc, old_state);
> > +}
> > +
> > +static void sprd_plane_atomic_update(struct drm_plane *plane,
> > +                                 struct drm_plane_state *old_state)
> > +{
> > +     struct drm_plane_state *state =3D plane->state;
> > +     struct drm_framebuffer *fb =3D plane->state->fb;
> > +     struct drm_gem_cma_object *cma_obj;
> > +     struct sprd_crtc *crtc =3D to_sprd_crtc(plane->state->crtc);
> > +     struct sprd_plane *p =3D to_sprd_plane(plane);
> > +     struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> > +     struct sprd_dpu_layer *layer =3D &crtc->layers[p->index];
> > +     int i;
> > +
> > +     if (plane->state->crtc->state->active_changed) {
> > +             DRM_DEBUG("resume or suspend, no need to update plane\n")=
;
> > +             return;
> > +     }
> > +
> > +     if (s->pallete_en) {
> > +             layer->index =3D p->index;
> > +             layer->dst_x =3D state->crtc_x;
> > +             layer->dst_y =3D state->crtc_y;
> > +             layer->dst_w =3D state->crtc_w;
> > +             layer->dst_h =3D state->crtc_h;
> > +             layer->alpha =3D state->alpha;
> > +             layer->blending =3D state->pixel_blend_mode;
> > +             layer->pallete_en =3D s->pallete_en;
> > +             layer->pallete_color =3D s->pallete_color;
> > +             crtc->pending_planes++;
> > +             DRM_DEBUG("%s() pallete_color =3D %u, index =3D %u\n",
> > +                     __func__, layer->pallete_color, layer->index);
> > +             return;
> > +     }
> > +
> > +     layer->index =3D p->index;
> > +     layer->src_x =3D state->src_x >> 16;
> > +     layer->src_y =3D state->src_y >> 16;
> > +     layer->src_w =3D state->src_w >> 16;
> > +     layer->src_h =3D state->src_h >> 16;
> > +     layer->dst_x =3D state->crtc_x;
> > +     layer->dst_y =3D state->crtc_y;
> > +     layer->dst_w =3D state->crtc_w;
> > +     layer->dst_h =3D state->crtc_h;
> > +     layer->rotation =3D state->rotation;
> > +     layer->blending =3D state->pixel_blend_mode;
> > +     layer->rotation =3D state->rotation;
> > +     layer->planes =3D fb->format->num_planes;
> > +     layer->format =3D fb->format->format;
> > +     layer->xfbc =3D fb->modifier;
> > +     layer->header_size_r =3D s->fbc_hsize_r;
> > +     layer->header_size_y =3D s->fbc_hsize_y;
> > +     layer->header_size_uv =3D s->fbc_hsize_uv;
> > +     layer->y2r_coef =3D s->y2r_coef;
> > +     layer->pallete_en =3D s->pallete_en;
> > +     layer->pallete_color =3D s->pallete_color;
> > +
> > +     DRM_DEBUG("%s() alpha =3D %u, blending =3D %u, rotation =3D %u, y=
2r_coef
> =3D %u\n",
> > +               __func__, layer->alpha, layer->blending,
> layer->rotation, s->y2r_coef);
> > +
> > +     DRM_DEBUG("%s() xfbc =3D %u, hsize_r =3D %u, hsize_y =3D %u, hsiz=
e_uv =3D
> %u\n",
> > +               __func__, layer->xfbc, layer->header_size_r,
> > +               layer->header_size_y, layer->header_size_uv);
> > +
> > +     for (i =3D 0; i < layer->planes; i++) {
> > +             cma_obj =3D drm_fb_cma_get_gem_obj(fb, i);
> > +             layer->addr[i] =3D cma_obj->paddr + fb->offsets[i];
> > +             layer->pitch[i] =3D fb->pitches[i];
> > +     }
> > +
> > +     crtc->pending_planes++;
> > +}
> > +
> > +static int sprd_plane_atomic_check(struct drm_plane *plane,
> > +                               struct drm_plane_state *state)
> > +{
> > +     DRM_DEBUG("%s()\n", __func__);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_plane_atomic_disable(struct drm_plane *plane,
> > +                                  struct drm_plane_state *old_state)
> > +{
> > +     struct sprd_plane *p =3D to_sprd_plane(plane);
> > +
> > +     /*
> > +      * NOTE:
> > +      * The dpu->core->flip() will disable all the planes each time.
> > +      * So there is no need to impliment the atomic_disable() function=
.
> > +      * But this function can not be removed, because it will change
> > +      * to call atomic_update() callback instead. Which will cause
> > +      * kernel panic in sprd_plane_atomic_update().
> > +      *
> > +      * We do nothing here but just print a debug log.
> > +      */
> > +     DRM_DEBUG("%s() layer_id =3D %u\n", __func__, p->index);
> > +}
> > +
> > +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =3D=
 {
> > +     .prepare_fb =3D sprd_plane_prepare_fb,
> > +     .cleanup_fb =3D sprd_plane_cleanup_fb,
> > +     .atomic_check =3D sprd_plane_atomic_check,
> > +     .atomic_update =3D sprd_plane_atomic_update,
> > +     .atomic_disable =3D sprd_plane_atomic_disable,
> > +};
> > +
> > +static void sprd_plane_reset(struct drm_plane *plane)
> > +{
> > +     struct sprd_plane *p =3D to_sprd_plane(plane);
> > +     struct sprd_plane_state *s;
> > +
> > +     DRM_INFO("%s()\n", __func__);
> > +
> > +     if (plane->state) {
> > +             __drm_atomic_helper_plane_destroy_state(plane->state);
> > +
> > +             s =3D to_sprd_plane_state(plane->state);
> > +             memset(s, 0, sizeof(*s));
> > +     } else {
> > +             s =3D kzalloc(sizeof(*s), GFP_KERNEL);
> > +             if (!s)
> > +                     return;
> > +             plane->state =3D &s->state;
> > +     }
> > +
> > +     s->state.plane =3D plane;
> > +     s->state.zpos =3D p->index;
> > +     s->state.alpha =3D 255;
> > +     s->state.pixel_blend_mode =3D DRM_MODE_BLEND_PIXEL_NONE;
> > +}
> > +
> > +static struct drm_plane_state *
> > +sprd_plane_atomic_duplicate_state(struct drm_plane *plane)
> > +{
> > +     struct sprd_plane_state *s;
> > +     struct sprd_plane_state *old_state =3D
> to_sprd_plane_state(plane->state);
> > +
> > +     DRM_DEBUG("%s()\n", __func__);
> > +
> > +     s =3D kzalloc(sizeof(*s), GFP_KERNEL);
> > +     if (!s)
> > +             return NULL;
> > +
> > +     __drm_atomic_helper_plane_duplicate_state(plane, &s->state);
> > +
> > +     WARN_ON(s->state.plane !=3D plane);
> > +
> > +     s->fbc_hsize_r =3D old_state->fbc_hsize_r;
> > +     s->fbc_hsize_y =3D old_state->fbc_hsize_y;
> > +     s->fbc_hsize_uv =3D old_state->fbc_hsize_uv;
> > +     s->y2r_coef =3D old_state->y2r_coef;
> > +     s->pallete_en =3D old_state->pallete_en;
> > +     s->pallete_color =3D old_state->pallete_color;
> > +
> > +     return &s->state;
> > +}
> > +
> > +static void sprd_plane_atomic_destroy_state(struct drm_plane *plane,
> > +                                         struct drm_plane_state *state=
)
> > +{
> > +     DRM_DEBUG("%s()\n", __func__);
> > +
> > +     __drm_atomic_helper_plane_destroy_state(state);
> > +     kfree(to_sprd_plane_state(state));
> > +}
> > +
> > +static int sprd_plane_atomic_set_property(struct drm_plane *plane,
> > +                                       struct drm_plane_state *state,
> > +                                       struct drm_property *property,
> > +                                       u64 val)
> > +{
> > +     struct sprd_plane *p =3D to_sprd_plane(plane);
> > +     struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> > +
> > +     DRM_DEBUG("%s() name =3D %s, val =3D %llu\n",
> > +               __func__, property->name, val);
> > +
> > +     if (property =3D=3D p->fbc_hsize_r_property)
> > +             s->fbc_hsize_r =3D val;
> > +     else if (property =3D=3D p->fbc_hsize_y_property)
> > +             s->fbc_hsize_y =3D val;
> > +     else if (property =3D=3D p->fbc_hsize_uv_property)
> > +             s->fbc_hsize_uv =3D val;
> > +     else if (property =3D=3D p->y2r_coef_property)
> > +             s->y2r_coef =3D val;
> > +     else if (property =3D=3D p->pallete_en_property)
> > +             s->pallete_en =3D val;
> > +     else if (property =3D=3D p->pallete_color_property)
> > +             s->pallete_color =3D val;
> > +     else {
> > +             DRM_ERROR("property %s is invalid\n", property->name);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int sprd_plane_atomic_get_property(struct drm_plane *plane,
> > +                                       const struct drm_plane_state
> *state,
> > +                                       struct drm_property *property,
> > +                                       u64 *val)
> > +{
> > +     struct sprd_plane *p =3D to_sprd_plane(plane);
> > +     const struct sprd_plane_state *s =3D to_sprd_plane_state(state);
> > +
> > +     DRM_DEBUG("%s() name =3D %s\n", __func__, property->name);
> > +
> > +     if (property =3D=3D p->fbc_hsize_r_property)
> > +             *val =3D s->fbc_hsize_r;
> > +     else if (property =3D=3D p->fbc_hsize_y_property)
> > +             *val =3D s->fbc_hsize_y;
> > +     else if (property =3D=3D p->fbc_hsize_uv_property)
> > +             *val =3D s->fbc_hsize_uv;
> > +     else if (property =3D=3D p->y2r_coef_property)
> > +             *val =3D s->y2r_coef;
> > +     else if (property =3D=3D p->pallete_en_property)
> > +             *val =3D s->pallete_en;
> > +     else if (property =3D=3D p->pallete_color_property)
> > +             *val =3D s->pallete_color;
> > +     else {
> > +             DRM_ERROR("property %s is invalid\n", property->name);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct drm_plane_funcs sprd_plane_funcs =3D {
> > +     .update_plane =3D drm_atomic_helper_update_plane,
> > +     .disable_plane  =3D drm_atomic_helper_disable_plane,
> > +     .destroy =3D drm_plane_cleanup,
> > +     .reset =3D sprd_plane_reset,
> > +     .atomic_duplicate_state =3D sprd_plane_atomic_duplicate_state,
> > +     .atomic_destroy_state =3D sprd_plane_atomic_destroy_state,
> > +     .atomic_set_property =3D sprd_plane_atomic_set_property,
> > +     .atomic_get_property =3D sprd_plane_atomic_get_property,
> > +};
> > +
> > +static int sprd_plane_create_properties(struct sprd_plane *p, int inde=
x)
> > +{
> > +     struct drm_property *prop;
> > +     unsigned int supported_modes =3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > +                                    BIT(DRM_MODE_BLEND_PREMULTI) |
> > +                                    BIT(DRM_MODE_BLEND_COVERAGE);
> > +
> > +     /* create rotation property */
> > +     drm_plane_create_rotation_property(&p->plane,
> > +                                        DRM_MODE_ROTATE_0,
> > +                                        DRM_MODE_ROTATE_MASK |
> > +                                        DRM_MODE_REFLECT_MASK);
> > +
> > +     /* create alpha property */
> > +     drm_plane_create_alpha_property(&p->plane);
> > +
> > +     /* create blend mode property */
> > +     drm_plane_create_blend_mode_property(&p->plane, supported_modes);
> > +
> > +     /* create zpos property */
> > +     drm_plane_create_zpos_immutable_property(&p->plane, index);
> > +
> > +     /* create fbc header size property */
> > +     prop =3D drm_property_create_range(p->plane.dev, 0,
> > +                     "FBC header size RGB", 0, UINT_MAX);
> > +     if (!prop)
> > +             return -ENOMEM;
> > +     drm_object_attach_property(&p->plane.base, prop, 0);
> > +     p->fbc_hsize_r_property =3D prop;
> > +
> > +     prop =3D drm_property_create_range(p->plane.dev, 0,
> > +                     "FBC header size Y", 0, UINT_MAX);
> > +     if (!prop)
> > +             return -ENOMEM;
> > +     drm_object_attach_property(&p->plane.base, prop, 0);
> > +     p->fbc_hsize_y_property =3D prop;
> > +
> > +     prop =3D drm_property_create_range(p->plane.dev, 0,
> > +                     "FBC header size UV", 0, UINT_MAX);
> > +     if (!prop)
> > +             return -ENOMEM;
> > +     drm_object_attach_property(&p->plane.base, prop, 0);
> > +     p->fbc_hsize_uv_property =3D prop;
> > +
> > +     /* create y2r coef property */
> > +     prop =3D drm_property_create_range(p->plane.dev, 0,
> > +                     "YUV2RGB coef", 0, UINT_MAX);
> > +     if (!prop)
> > +             return -ENOMEM;
> > +     drm_object_attach_property(&p->plane.base, prop, 0);
> > +     p->y2r_coef_property =3D prop;
> > +
> > +     /* create pallete enable property */
> > +     prop =3D drm_property_create_range(p->plane.dev, 0,
> > +                     "pallete enable", 0, UINT_MAX);
> > +     if (!prop)
> > +             return -ENOMEM;
> > +     drm_object_attach_property(&p->plane.base, prop, 0);
> > +     p->pallete_en_property =3D prop;
> > +
> > +     /* create pallete color property */
> > +     prop =3D drm_property_create_range(p->plane.dev, 0,
> > +                     "pallete color", 0, UINT_MAX);
> > +     if (!prop)
> > +             return -ENOMEM;
> > +     drm_object_attach_property(&p->plane.base, prop, 0);
> > +     p->pallete_color_property =3D prop;
> > +
> > +     return 0;
> > +}
> > +
> > +struct drm_plane *sprd_plane_init(struct drm_device *drm,
> > +                                     struct dpu_capability *cap,
> > +                                     enum drm_plane_type type)
> > +{
> > +     struct drm_plane *primary =3D NULL;
> > +     struct sprd_plane *p =3D NULL;
> > +     int err, i;
> > +
> > +     for (i =3D 0; i < cap->max_layers; i++) {
> > +
> > +             p =3D devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
> > +             if (!p)
> > +                     return ERR_PTR(-ENOMEM);
> > +
> > +             err =3D drm_universal_plane_init(drm, &p->plane,
> > +                                            1 <<
> drm->mode_config.num_crtc,
> > +                                            &sprd_plane_funcs,
> cap->fmts_ptr,
> > +                                            cap->fmts_cnt, NULL,
> > +                                            type, NULL);
> > +             if (err) {
> > +                     DRM_ERROR("fail to init primary plane\n");
> > +                     return ERR_PTR(err);
> > +             }
> > +
> > +             drm_plane_helper_add(&p->plane, &sprd_plane_helper_funcs)=
;
> > +
> > +             sprd_plane_create_properties(p, i);
> > +
> > +             p->index =3D i;
> > +             if (i =3D=3D 0)
> > +                     primary =3D &p->plane;
> > +     }
> > +
> > +     if (p)
> > +             DRM_INFO("dpu plane init ok\n");
> > +
> > +     return primary;
> > +}
> > diff --git a/drivers/gpu/drm/sprd/sprd_plane.h
> b/drivers/gpu/drm/sprd/sprd_plane.h
> > new file mode 100644
> > index 0000000..f63776a8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_plane.h
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
> > + */
> > +
> > +#ifndef __SPRD_PLANE_H__
> > +#define __SPRD_PLANE_H__
> > +
> > +#define to_sprd_plane(x)             container_of(x, struct sprd_plane=
,
> plane)
> > +#define to_sprd_plane_state(x)       container_of(x, struct
> sprd_plane_state, state)
> > +
> > +struct sprd_plane_state {
> > +     struct drm_plane_state state;
> > +     u32 fbc_hsize_r;
> > +     u32 fbc_hsize_y;
> > +     u32 fbc_hsize_uv;
> > +     u32 y2r_coef;
> > +     u32 pallete_en;
> > +     u32 pallete_color;
> > +};
> > +
> > +struct sprd_plane {
> > +     struct drm_plane plane;
> > +     struct drm_property *fbc_hsize_r_property;
> > +     struct drm_property *fbc_hsize_y_property;
> > +     struct drm_property *fbc_hsize_uv_property;
> > +     struct drm_property *y2r_coef_property;
> > +     struct drm_property *pallete_en_property;
> > +     struct drm_property *pallete_color_property;
> > +     u32 index;
> > +};
> > +
> > +struct drm_plane *sprd_plane_init(struct drm_device *dev,
> > +                                     struct dpu_capability *cap,
> > +                                     enum drm_plane_type type);
> > +#endif
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

--0000000000004faf09059e4c7870
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,<div>Sorry for leaving so long =
because of chinese new year<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 23, 2020 at 5:13 PM Thomas=
 Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i,<br>
<br>
thank you for replacing for GEM code with the generic CMA<br>
implementation. Once it&#39;s needed, we can add specialized memory<br>
management to you driver.<br>
<br>
I&#39;ve looked throught your submission and think you may want to<br>
reconsider the current design. AFAICT, you have some a driver with<br>
generic code and the individual hardware as sub-devices. That&#39;s not<br>
strictly wrong or a roadblocker for merging the driver, but it is likely<br=
>
to become a problem in long-term maintainence.<br>
<br>
Please read below for some details and let me know what you think.<br></blo=
ckquote><div>=C2=A0We have multi display controller(dpu), there will be som=
e differences in the hardware.</div><div>So add KMS to manage multiple dpu,=
 like this:</div><div><div><img src=3D"cid:ii_k6ht5w8a0" alt=3D"1.png" widt=
h=3D"562" height=3D"268"><br></div></div><div>dpu0 and dpu1 all maybe have =
multi ip version, so ip core driver is hardware interface,dpu0 and dpu1 dri=
ver call ip core interface.</div><div>Our crtcs maybe have different design=
s like clock/power/controller register. But crtc plane have the same design=
.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Am 21.01.20 um 09:50 schrieb Kevin Tang:<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; Adds drm support for the Unisoc&#39;s display subsystem.<br>
&gt; <br>
&gt; This is drm device and gem driver. This driver provides support for th=
e<br>
&gt; Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.<br>
&gt; <br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Baolin Wang &lt;<a href=3D"mailto:baolin.wang@linaro.org" target=
=3D"_blank">baolin.wang@linaro.org</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 drivers/gpu/drm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 ++<b=
r>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09=
 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_crtc.c=C2=A0 | 212 +++++++++++++++++++=
+<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_crtc.h=C2=A0 |=C2=A0 98 ++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c=C2=A0 =C2=A0| 305 ++++++++++++++=
+++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h=C2=A0 =C2=A0|=C2=A0 16 ++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_plane.c | 393 ++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_plane.h |=C2=A0 36 ++++<br>
&gt;=C2=A0 10 files changed, 1086 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Kconfig<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.h<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_plane.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_plane.h<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig<br>
&gt; index bfdadc3..cead12c 100644<br>
&gt; --- a/drivers/gpu/drm/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/Kconfig<br>
&gt; @@ -387,6 +387,8 @@ source &quot;drivers/gpu/drm/aspeed/Kconfig&quot;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 source &quot;drivers/gpu/drm/mcde/Kconfig&quot;<br>
&gt;=C2=A0 <br>
&gt; +source &quot;drivers/gpu/drm/sprd/Kconfig&quot;<br>
&gt; +<br>
&gt;=C2=A0 # Keep legacy drivers last<br>
&gt;=C2=A0 <br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;DRM Support for Unisoc SoCs Platfo=
rm&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_SPRD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on DRM &amp;&amp; OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_GEM_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_KMS_CMA_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select DRM_PANEL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select VIDEOMODE_HELPERS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BACKLIGHT_CLASS_DEVICE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Choose this option if you have a Unisoc ch=
ipsets.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If M is selected the module will be called=
 sprd-drm.<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; new file mode 100644<br>
&gt; index 0000000..8a21c23<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -0,0 +1,9 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +ccflags-y +=3D -Iinclude/drm<br>
&gt; +<br>
&gt; +subdir-ccflags-y +=3D -I$(src)<br>
&gt; +<br>
&gt; +obj-y :=3D sprd_drm.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_crtc.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_plane.o<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_crtc.c b/drivers/gpu/drm/sprd/s=
prd_crtc.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4a35281<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_crtc.c<br>
&gt; @@ -0,0 +1,212 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/dma-buf.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_plane_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_vblank.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +#include &quot;sprd_crtc.h&quot;<br>
&gt; +<br>
&gt; +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;mode_set_nofb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sprd_crtc-&gt;=
ops-&gt;mode_set_nofb(sprd_crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crt=
c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct drm_display_mode *mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;mode_valid)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sprd_crtc-&gt;=
ops-&gt;mode_valid(sprd_crtc, mode);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_crtc_atomic_check(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *st=
ate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!state-&gt;enable)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;atomic_check)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sprd_crtc-&gt;=
ops-&gt;atomic_check(sprd_crtc, state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_begin(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *ol=
d_crtc_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;atomic_begin)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_crtc-&gt;ops-&gt=
;atomic_begin(sprd_crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t drm_crtc_state *old_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;atomic_enable)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_crtc-&gt;ops-&gt=
;atomic_enable(sprd_crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_crtc_vblank_on(crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct drm_crtc_state *old_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_crtc_vblank_off(crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;atomic_disable)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_crtc-&gt;ops-&gt=
;atomic_disable(sprd_crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (crtc-&gt;state-&gt;event &amp;&amp; !crtc-&gt=
;state-&gt;active) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irq(&amp;cr=
tc-&gt;dev-&gt;event_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_send_vblank_=
event(crtc, crtc-&gt;state-&gt;event);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irq(&amp;=
crtc-&gt;dev-&gt;event_lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;state-&gt;ev=
ent =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *ol=
d_crtc_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;atomic_flush)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_crtc-&gt;ops-&gt=
;atomic_flush(sprd_crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irq(&amp;crtc-&gt;dev-&gt;event_lock);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (crtc-&gt;state-&gt;event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_send_vblank_=
event(crtc, crtc-&gt;state-&gt;event);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;state-&gt;ev=
ent =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irq(&amp;crtc-&gt;dev-&gt;event_lock)=
;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_set_nofb=C2=A0 =3D sprd_crtc_mode_set_nofb,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_valid=C2=A0 =C2=A0 =C2=A0=3D sprd_crtc_mode=
_valid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_check=C2=A0 =C2=A0=3D sprd_crtc_atomic_ch=
eck,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_begin=C2=A0 =C2=A0=3D sprd_crtc_atomic_be=
gin,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_enable=C2=A0 =3D sprd_crtc_atomic_enable,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_disable =3D sprd_crtc_atomic_disable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_flush=C2=A0 =C2=A0=3D sprd_crtc_atomic_fl=
ush,<br>
&gt; +};<br>
<br>
This is just boilerplate resulting from the current design. Instead of<br>
having struct sprd_crtc_ops and these mid-layer functions, simply give<br>
each hardware device its own instance of drm_crtc_helper_funcs. If<br>
hardware can share some of the implementation, put it into a common<br>
helper function.<br></blockquote><div>The current design, I refer to exynos=
=C2=A0design. i think it&#39;s also a good idea.</div><div>&quot;It is like=
ly to become a problem in long-term maintainence&quot;, how to understand i=
t?<br></div><div><br></div></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +static void sprd_crtc_cleanup(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_crtc_cleanup(crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(sprd_crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;enable_vblank)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sprd_crtc-&gt;=
ops-&gt;enable_vblank(sprd_crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc =3D to_sprd_crtc(crtc=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sprd_crtc-&gt;ops-&gt;disable_vblank)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_crtc-&gt;ops-&gt=
;disable_vblank(sprd_crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_crtc_funcs sprd_crtc_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.destroy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sprd_crtc=
_cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.set_config=C2=A0 =C2=A0 =C2=A0=3D drm_atomic_hel=
per_set_config,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.page_flip=C2=A0 =C2=A0 =C2=A0 =3D drm_atomic_hel=
per_page_flip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D drm_=
atomic_helper_crtc_reset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_helper_crt=
c_duplicate_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_destroy_state=C2=A0 =C2=A0=3D drm_atomic_=
helper_crtc_destroy_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.enable_vblank=C2=A0 =3D sprd_crtc_enable_vblank,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.disable_vblank =3D sprd_crtc_disable_vblank,<br>
&gt; +};<br>
<br>
Same as with the CRTC helper functions.<br>
<br>
&gt; +<br>
&gt; +struct sprd_crtc *sprd_crtc_init(struct drm_device *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_p=
lane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum sprd_cr=
tc_output_type type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct=
 sprd_crtc_ops *ops,<br>
<br>
Rather hand-in the hardware&#39;s crtc and crtc-helper instances.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *dpu)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *sprd_crtc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_crtc =3D kzalloc(sizeof(*sprd_crtc), GFP_KER=
NEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sprd_crtc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_crtc-&gt;type =3D type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_crtc-&gt;ops =3D ops;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_crtc-&gt;dpu =3D dpu;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_crtc_init_with_planes(drm, &amp;sprd_=
crtc-&gt;base, plane, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sprd_cr=
tc_funcs, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to init crtc.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_crtc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_crtc_set_gamma_size(&amp;sprd_crtc-&gt;b=
ase, 256);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_crtc_helper_add(&amp;sprd_crtc-&gt;base, &amp=
;sprd_crtc_helper_funcs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprd_crtc;<br>
&gt; +<br>
&gt; +err_crtc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0plane-&gt;funcs-&gt;destroy(plane);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(sprd_crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ERR_PTR(ret);<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct sprd_crtc *sprd_crtc_get_by_type(struct drm_device *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum sprd_crtc_out=
put_type out_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_for_each_crtc(crtc, drm)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (to_sprd_crtc(crtc=
)-&gt;type =3D=3D out_type)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return to_sprd_crtc(crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EPERM);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int sprd_drm_set_possible_crtcs(struct drm_encoder *encoder,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum sprd_crtc_output=
_type out_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *crtc =3D sprd_crtc_get_by_type(=
encoder-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0out_type);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(crtc))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(crtc);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0encoder-&gt;possible_crtcs =3D drm_crtc_mask(&amp=
;crtc-&gt;base);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_crtc.h b/drivers/gpu/drm/sprd/s=
prd_crtc.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..9dbb2eb<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_crtc.h<br>
&gt; @@ -0,0 +1,98 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __SPRD_CRTC_H__<br>
&gt; +#define __SPRD_CRTC_H__<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_crtc.h&gt;<br>
&gt; +#include &lt;drm/drm_encoder.h&gt;<br>
&gt; +#include &lt;drm/drm_fourcc.h&gt;<br>
&gt; +#include &lt;drm/drm_plane.h&gt;<br>
&gt; +#include &lt;drm/drm_print.h&gt;<br>
&gt; +<br>
&gt; +#define to_sprd_crtc(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 container_of(x, struct sprd_crtc, base)<br>
&gt; +<br>
&gt; +enum sprd_crtc_output_type {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SPRD_DISPLAY_TYPE_NONE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* RGB or CPU Interface */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SPRD_DISPLAY_TYPE_LCD,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* DisplayPort Interface */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SPRD_DISPLAY_TYPE_DP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* HDMI Interface */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SPRD_DISPLAY_TYPE_HDMI,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dpu_capability {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 max_layers;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const u32 *fmts_ptr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 fmts_cnt;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_dpu_layer {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 index;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 planes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 addr[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 pitch[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s16 src_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s16 src_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s16 src_w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s16 src_h;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s16 dst_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s16 dst_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 dst_w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 dst_h;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 alpha;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 blending;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 rotation;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 xfbc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 height;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 header_size_r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 header_size_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 header_size_uv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 y2r_coef;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 pallete_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 pallete_color;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_crtc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_crtc base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum sprd_crtc_output_type type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct sprd_crtc_ops *ops;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu_layer *layers;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 pending_planes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *dpu;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_crtc_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*atomic_enable)(struct sprd_crtc *crtc);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*atomic_disable)(struct sprd_crtc *crtc);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*enable_vblank)(struct sprd_crtc *crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*disable_vblank)(struct sprd_crtc *crtc);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0enum drm_mode_status (*mode_valid)(struct sprd_cr=
tc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_disp=
lay_mode *mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*mode_set_nofb)(struct sprd_crtc *crtc);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*atomic_check)(struct sprd_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_state *state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*atomic_begin)(struct sprd_crtc *crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*atomic_flush)(struct sprd_crtc *crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*prepare_fb)(struct sprd_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct drm_plane_state *new_state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*cleanup_fb)(struct sprd_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 struct drm_plane_state *old_state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*atomic_update)(struct sprd_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct drm_plane *plane);<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_crtc *sprd_crtc_init(struct drm_device *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_p=
lane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum sprd_cr=
tc_output_type type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct=
 sprd_crtc_ops *ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *dpu);<=
br>
&gt; +int sprd_drm_set_possible_crtcs(struct drm_encoder *encoder,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum sprd_crtc_output=
_type out_type);<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d63b7e3<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -0,0 +1,305 @@<br>
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
&gt; +#define DRIVER_NAME=C2=A0 &quot;sprd&quot;<br>
&gt; +#define DRIVER_DESC=C2=A0 &quot;Spreadtrum SoCs&#39; DRM Driver&quot;=
<br>
&gt; +#define DRIVER_DATE=C2=A0 &quot;20191101&quot;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_init(drm);<br>
&gt; +<br>
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
&gt; +static const struct file_operations sprd_drm_fops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D THIS=
_MODULE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 drm_open,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D drm_relea=
se,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unlocked_ioctl =3D drm_ioctl,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.compat_ioctl=C2=A0 =C2=A0=3D drm_compat_ioctl,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0.poll=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 drm_poll,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 drm_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.llseek=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D no_l=
lseek,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 drm_gem_cma_mmap,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct drm_driver sprd_drm_drv =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D D=
RIVER_GEM | DRIVER_ATOMIC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;sprd_drm_fops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.gem_vm_ops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &amp;drm_gem_cma_vm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.gem_free_object_unlocked=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D drm_gem_cma_free_object,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dumb_create=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D drm_gem_cma_dumb_create,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.prime_fd_to_handle=C2=A0 =C2=A0 =C2=A0=3D drm_ge=
m_prime_fd_to_handle,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.gem_prime_import=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D d=
rm_gem_prime_import,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.gem_prime_import_sg_table =3D drm_gem_cma_prime_=
import_sg_table,<br>
<br>
Rather set these pointers with DRM_GEM_CMA_VMAP_DRIVER_OPS.<br>
<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm =3D drm_dev_alloc(&amp;sprd_drm_drv, dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(drm))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(drm);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_set_drvdata(dev, drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd =3D devm_kzalloc(drm-&gt;dev, sizeof(*sprd),=
 GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sprd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_free_drm;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;dev_private =3D sprd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D component_bind_all(drm-&gt;dev, drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to bind all component.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dc_cleanup;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* vblank init */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D drm_vblank_init(drm, drm-&gt;mode_config.=
num_crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to initialize vblank.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_unbind_all;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can use the vbla=
nk feature. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;irq_enabled =3D true;<br>
<br>
This line indicates the problem&#39;s design. The irq is initialized in the=
<br>
sub-device code, but the device state is set here. Instead both should<br>
be set in the same place.<br></blockquote><div>Everyone seems to use it lik=
e this, so why can&#39;t follow others?</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* reset all the states of crtc/plane/encoder/con=
nector */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_reset(drm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* init kms poll for handling hpd */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm);<br>
<br>
Most of this function&#39;s code should be moved into the sub-device bind<b=
r>
function.<br>
<br>
Here, maybe do:<br>
<br>
=C2=A0* allocate device structures<br>
=C2=A0* call component_bind_all()<br>
=C2=A0* on success, register device<br>
<br>
The sub-device function should then do<br>
<br>
=C2=A0* init modesetting, crtc, planes, etc.<br>
=C2=A0* do drm_mode_config_reset()<br>
=C2=A0* init vblanking<br>
=C2=A0* init the irq<br>
=C2=A0* do drm_kms_helper_poll_init()<br>
<br>
roughtly in that order. It makes sense to call drm_vblank_init() after<br>
drm_mode_config_reset(), as vblanking uses some of the mode-config fields.<=
br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D drm_dev_register(drm, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kms_helper_p=
oll_fini;<br>
<br>
You don&#39;t need/want an fbdev console?<br></blockquote><div>Yes, fbdev i=
s not supported, maybe support later for LoT(?)</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Best regards<br>
Thomas<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_kms_helper_poll_fini:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_fini(drm);<br>
&gt; +err_unbind_all:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_unbind_all(drm-&gt;dev, drm);<br>
&gt; +err_dc_cleanup:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_cleanup(drm);<br>
&gt; +err_free_drm:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dev_put(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_unbind(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_put_dev(dev_get_drvdata(dev));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_master_ops drm_component_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bind =3D sprd_drm_bind,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_drm_unbind,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int compare_of(struct device *dev, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;compare %s\n&quot;, np-&gt;full_n=
ame);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return dev-&gt;of_node =3D=3D np;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_component_probe(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 const struct component_master_ops *m_ops)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *ep, *port, *remote;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct component_match *match =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dev-&gt;of_node)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Bind the crtc&#39;s ports first, so that drm_o=
f_find_possible_crtcs()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * called from encoder&#39;s .bind callbacks work=
s as expected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; ; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_parse_pha=
ndle(dev-&gt;of_node, &quot;ports&quot;, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_device_is_ava=
ilable(port-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0of_node_put(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0component_match_add(d=
ev, &amp;match, compare_of, port-&gt;parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(port);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;mi=
ssing &#39;ports&#39; property\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!match) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;no=
 available port\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * For bound crtcs, bind the encoders attached to=
 their remote endpoint<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; ; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_parse_pha=
ndle(dev-&gt;of_node, &quot;ports&quot;, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_device_is_ava=
ilable(port-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0of_node_put(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_child_of_nod=
e(port, ep) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0remote =3D of_graph_get_remote_port_parent(ep);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!remote || !of_device_is_available(remote)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} else if (!of_device_is_available(remote-&gt;parent)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot;parent device of %s =
is not available\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remote-&gt;=
full_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0component_match_add(dev, &amp;match, compare_of, remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0of_node_put(remote);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(port);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return component_master_add_with_match(dev, m_ops=
, match);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_set_mask_and_coherent(&amp;pdev-&gt;d=
ev, ~0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;dma_s=
et_mask_and_coherent failed (%d)\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprd_drm_component_probe(&amp;pdev-&gt;dev=
, &amp;drm_component_ops);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_drm_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_master_del(&amp;pdev-&gt;dev, &amp;drm_=
component_ops);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_drm_shutdown(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D platform_get_drvdata(p=
dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!drm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_WARN(&quot;drm de=
vice is not available, no shutdown\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_atomic_helper_shutdown(drm);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id drm_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sprd,display-subsystem&qu=
ot;, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, drm_match_table);<br>
&gt; +<br>
&gt; +static struct platform_driver sprd_drm_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D sprd_drm_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D sprd_drm_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.shutdown =3D sprd_drm_shutdown,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;sprd-=
drm-drv&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D d=
rm_match_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct platform_driver *sprd_drm_drivers[]=C2=A0 =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;sprd_drm_driver,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init sprd_drm_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D platform_register_drivers(sprd_drm_driver=
s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(s=
prd_drm_drivers));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void __exit sprd_drm_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_unregister_drivers(sprd_drm_drivers,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(sprd_drm_driver=
s));<br>
&gt; +}<br>
&gt; +<br>
&gt; +module_init(sprd_drm_init);<br>
&gt; +module_exit(sprd_drm_exit);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Leon He &lt;<a href=3D"mailto:leon.he@unisoc.com"=
 target=3D"_blank">leon.he@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Kevin Tang &lt;<a href=3D"mailto:kevin.tang@uniso=
c.com" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Unisoc DRM KMS Master Driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sp=
rd_drm.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..137cb27<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef _SPRD_DRM_H_<br>
&gt; +#define _SPRD_DRM_H_<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic.h&gt;<br>
&gt; +#include &lt;drm/drm_print.h&gt;<br>
&gt; +<br>
&gt; +struct sprd_drm {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#endif /* _SPRD_DRM_H_ */<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_plane.c b/drivers/gpu/drm/sprd/=
sprd_plane.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..15ebb97<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_plane.c<br>
&gt; @@ -0,0 +1,393 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/dma-buf.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_fb_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_fourcc.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_plane_helper.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_crtc.h&quot;<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +#include &quot;sprd_plane.h&quot;<br>
&gt; +<br>
&gt; +static int sprd_plane_prepare_fb(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *new_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane_state *curr_state =3D plane-&gt;=
state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *crtc =3D to_sprd_crtc(new_state=
-&gt;crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((curr_state-&gt;fb =3D=3D new_state-&gt;fb) |=
| !new_state-&gt;fb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (crtc-&gt;ops-&gt;prepare_fb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;ops-&gt;prep=
are_fb(crtc, new_state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_cleanup_fb(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *old_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane_state *curr_state =3D plane-&gt;=
state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *crtc =3D to_sprd_crtc(old_state=
-&gt;crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((curr_state-&gt;fb =3D=3D old_state-&gt;fb) |=
| !old_state-&gt;fb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (crtc-&gt;ops-&gt;cleanup_fb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;ops-&gt;clea=
nup_fb(crtc, old_state);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_atomic_update(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *ol=
d_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane_state *state =3D plane-&gt;state=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb =3D plane-&gt;state-&g=
t;fb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_gem_cma_object *cma_obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_crtc *crtc =3D to_sprd_crtc(plane-&gt=
;state-&gt;crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(plane);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane_state *s =3D to_sprd_plane_stat=
e(state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu_layer *layer =3D &amp;crtc-&gt;la=
yers[p-&gt;index];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (plane-&gt;state-&gt;crtc-&gt;state-&gt;active=
_changed) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;resum=
e or suspend, no need to update plane\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (s-&gt;pallete_en) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;index =3D p=
-&gt;index;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;dst_x =3D s=
tate-&gt;crtc_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;dst_y =3D s=
tate-&gt;crtc_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;dst_w =3D s=
tate-&gt;crtc_w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;dst_h =3D s=
tate-&gt;crtc_h;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;alpha =3D s=
tate-&gt;alpha;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;blending =
=3D state-&gt;pixel_blend_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pallete_en =
=3D s-&gt;pallete_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pallete_col=
or =3D s-&gt;pallete_color;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;pending_plan=
es++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() =
pallete_color =3D %u, index =3D %u\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0__func__, layer-&gt;pallete_color, layer-&gt;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;index =3D p-&gt;index;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;src_x =3D state-&gt;src_x &gt;&gt; 16;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;src_y =3D state-&gt;src_y &gt;&gt; 16;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;src_w =3D state-&gt;src_w &gt;&gt; 16;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;src_h =3D state-&gt;src_h &gt;&gt; 16;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;dst_x =3D state-&gt;crtc_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;dst_y =3D state-&gt;crtc_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;dst_w =3D state-&gt;crtc_w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;dst_h =3D state-&gt;crtc_h;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;rotation =3D state-&gt;rotation;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;blending =3D state-&gt;pixel_blend_mode=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;rotation =3D state-&gt;rotation;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;planes =3D fb-&gt;format-&gt;num_planes=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;format =3D fb-&gt;format-&gt;format;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;xfbc =3D fb-&gt;modifier;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;header_size_r =3D s-&gt;fbc_hsize_r;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;header_size_y =3D s-&gt;fbc_hsize_y;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;header_size_uv =3D s-&gt;fbc_hsize_uv;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;y2r_coef =3D s-&gt;y2r_coef;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;pallete_en =3D s-&gt;pallete_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer-&gt;pallete_color =3D s-&gt;pallete_color;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() alpha =3D %u, blending =3D %=
u, rotation =3D %u, y2r_coef =3D %u\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, laye=
r-&gt;alpha, layer-&gt;blending, layer-&gt;rotation, s-&gt;y2r_coef);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() xfbc =3D %u, hsize_r =3D %u,=
 hsize_y =3D %u, hsize_uv =3D %u\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, laye=
r-&gt;xfbc, layer-&gt;header_size_r,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;head=
er_size_y, layer-&gt;header_size_uv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; layer-&gt;planes; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cma_obj =3D drm_fb_cm=
a_get_gem_obj(fb, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;addr[i] =3D=
 cma_obj-&gt;paddr + fb-&gt;offsets[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pitch[i] =
=3D fb-&gt;pitches[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0crtc-&gt;pending_planes++;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_atomic_check(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *state)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_atomic_disable(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_plane_state *o=
ld_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(plane);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * NOTE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The dpu-&gt;core-&gt;flip() will disable all t=
he planes each time.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * So there is no need to impliment the atomic_di=
sable() function.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * But this function can not be removed, because =
it will change<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * to call atomic_update() callback instead. Whic=
h will cause<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * kernel panic in sprd_plane_atomic_update().<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * We do nothing here but just print a debug log.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() layer_id =3D %u\n&quot;, __f=
unc__, p-&gt;index);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.prepare_fb =3D sprd_plane_prepare_fb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cleanup_fb =3D sprd_plane_cleanup_fb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_check =3D sprd_plane_atomic_check,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_update =3D sprd_plane_atomic_update,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_disable =3D sprd_plane_atomic_disable,<br=
>
&gt; +};<br>
&gt; +<br>
&gt; +static void sprd_plane_reset(struct drm_plane *plane)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(plane);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane_state *s;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s()\n&quot;, __func__);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (plane-&gt;state) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__drm_atomic_helper_p=
lane_destroy_state(plane-&gt;state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D to_sprd_plane_s=
tate(plane-&gt;state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(s, 0, sizeof(*=
s));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D kzalloc(sizeof(=
*s), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plane-&gt;state =3D &=
amp;s-&gt;state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;state.plane =3D plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;state.zpos =3D p-&gt;index;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;state.alpha =3D 255;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;state.pixel_blend_mode =3D DRM_MODE_BLEND_P=
IXEL_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct drm_plane_state *<br>
&gt; +sprd_plane_atomic_duplicate_state(struct drm_plane *plane)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane_state *s;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane_state *old_state =3D to_sprd_pl=
ane_state(plane-&gt;state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s =3D kzalloc(sizeof(*s), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!s)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__drm_atomic_helper_plane_duplicate_state(plane, =
&amp;s-&gt;state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WARN_ON(s-&gt;state.plane !=3D plane);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;fbc_hsize_r =3D old_state-&gt;fbc_hsize_r;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;fbc_hsize_y =3D old_state-&gt;fbc_hsize_y;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;fbc_hsize_uv =3D old_state-&gt;fbc_hsize_uv=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;y2r_coef =3D old_state-&gt;y2r_coef;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;pallete_en =3D old_state-&gt;pallete_en;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0s-&gt;pallete_color =3D old_state-&gt;pallete_col=
or;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &amp;s-&gt;state;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_atomic_destroy_state(struct drm_plane *plane,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct drm_plane_state *state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__drm_atomic_helper_plane_destroy_state(state);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(to_sprd_plane_state(state));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_atomic_set_property(struct drm_plane *plane,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t drm_plane_state *state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t drm_property *property,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 v=
al)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(plane);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane_state *s =3D to_sprd_plane_stat=
e(state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() name =3D %s, val =3D %llu\n&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, prop=
erty-&gt;name, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (property =3D=3D p-&gt;fbc_hsize_r_property)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;fbc_hsize_r =3D=
 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;fbc_hsize_y_proper=
ty)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;fbc_hsize_y =3D=
 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;fbc_hsize_uv_prope=
rty)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;fbc_hsize_uv =
=3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;y2r_coef_property)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;y2r_coef =3D va=
l;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;pallete_en_propert=
y)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;pallete_en =3D =
val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;pallete_color_prop=
erty)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;pallete_color =
=3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;prope=
rty %s is invalid\n&quot;, property-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_atomic_get_property(struct drm_plane *plane,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const=
 struct drm_plane_state *state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t drm_property *property,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 *=
val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(plane);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct sprd_plane_state *s =3D to_sprd_plan=
e_state(state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() name =3D %s\n&quot;, __func_=
_, property-&gt;name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (property =3D=3D p-&gt;fbc_hsize_r_property)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D s-&gt;fbc_hs=
ize_r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;fbc_hsize_y_proper=
ty)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D s-&gt;fbc_hs=
ize_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;fbc_hsize_uv_prope=
rty)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D s-&gt;fbc_hs=
ize_uv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;y2r_coef_property)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D s-&gt;y2r_co=
ef;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;pallete_en_propert=
y)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D s-&gt;pallet=
e_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (property =3D=3D p-&gt;pallete_color_prop=
erty)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D s-&gt;pallet=
e_color;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;prope=
rty %s is invalid\n&quot;, property-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_plane_funcs sprd_plane_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.update_plane =3D drm_atomic_helper_update_plane,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.disable_plane=C2=A0 =3D drm_atomic_helper_disabl=
e_plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.destroy =3D drm_plane_cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reset =3D sprd_plane_reset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D sprd_plane_atomic_dup=
licate_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_destroy_state =3D sprd_plane_atomic_destr=
oy_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_set_property =3D sprd_plane_atomic_set_pr=
operty,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_get_property =3D sprd_plane_atomic_get_pr=
operty,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_plane_create_properties(struct sprd_plane *p, int ind=
ex)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_property *prop;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int supported_modes =3D BIT(DRM_MODE_BLE=
ND_PIXEL_NONE) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(DRM_MODE_BLEND=
_PREMULTI) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(DRM_MODE_BLEND=
_COVERAGE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create rotation property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_plane_create_rotation_property(&amp;p-&gt;pla=
ne,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_=
MODE_ROTATE_0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_=
MODE_ROTATE_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_=
MODE_REFLECT_MASK);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create alpha property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_plane_create_alpha_property(&amp;p-&gt;plane)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create blend mode property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_plane_create_blend_mode_property(&amp;p-&gt;p=
lane, supported_modes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create zpos property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_plane_create_zpos_immutable_property(&amp;p-&=
gt;plane, index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create fbc header size property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create_range(p-&gt;<a href=
=3D"http://plane.dev" rel=3D"noreferrer" target=3D"_blank">plane.dev</a>, 0=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;FBC header size RGB&quot;, 0, UINT_MAX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!prop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_object_attach_property(&amp;p-&gt;plane.base,=
 prop, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0p-&gt;fbc_hsize_r_property =3D prop;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create_range(p-&gt;<a href=
=3D"http://plane.dev" rel=3D"noreferrer" target=3D"_blank">plane.dev</a>, 0=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;FBC header size Y&quot;, 0, UINT_MAX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!prop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_object_attach_property(&amp;p-&gt;plane.base,=
 prop, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0p-&gt;fbc_hsize_y_property =3D prop;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create_range(p-&gt;<a href=
=3D"http://plane.dev" rel=3D"noreferrer" target=3D"_blank">plane.dev</a>, 0=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;FBC header size UV&quot;, 0, UINT_MAX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!prop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_object_attach_property(&amp;p-&gt;plane.base,=
 prop, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0p-&gt;fbc_hsize_uv_property =3D prop;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create y2r coef property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create_range(p-&gt;<a href=
=3D"http://plane.dev" rel=3D"noreferrer" target=3D"_blank">plane.dev</a>, 0=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;YUV2RGB coef&quot;, 0, UINT_MAX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!prop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_object_attach_property(&amp;p-&gt;plane.base,=
 prop, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0p-&gt;y2r_coef_property =3D prop;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create pallete enable property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create_range(p-&gt;<a href=
=3D"http://plane.dev" rel=3D"noreferrer" target=3D"_blank">plane.dev</a>, 0=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;pallete enable&quot;, 0, UINT_MAX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!prop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_object_attach_property(&amp;p-&gt;plane.base,=
 prop, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0p-&gt;pallete_en_property =3D prop;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create pallete color property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create_range(p-&gt;<a href=
=3D"http://plane.dev" rel=3D"noreferrer" target=3D"_blank">plane.dev</a>, 0=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;pallete color&quot;, 0, UINT_MAX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!prop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_object_attach_property(&amp;p-&gt;plane.base,=
 prop, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0p-&gt;pallete_color_property =3D prop;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct drm_plane *sprd_plane_init(struct drm_device *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_c=
apability *cap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum drm_pla=
ne_type type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane *primary =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; cap-&gt;max_layers; i++) {<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D devm_kzalloc(dr=
m-&gt;dev, sizeof(*p), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-ENOMEM);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_universal=
_plane_init(drm, &amp;p-&gt;plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1 &lt;&lt; drm-&gt;mode_config.num_crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;sprd_plane_funcs, cap-&gt;fmts_ptr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cap-&gt;fmts_cnt, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 type, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_ERROR(&quot;fail to init primary plane\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_helper_add(=
&amp;p-&gt;plane, &amp;sprd_plane_helper_funcs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_plane_create_pro=
perties(p, i);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;index =3D i;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0primary =3D &amp;p-&gt;plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;dpu pl=
ane init ok\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return primary;<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_plane.h b/drivers/gpu/drm/sprd/=
sprd_plane.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f63776a8<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_plane.h<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __SPRD_PLANE_H__<br>
&gt; +#define __SPRD_PLANE_H__<br>
&gt; +<br>
&gt; +#define to_sprd_plane(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0container_of(x, struct sprd_plane, plane)<br>
&gt; +#define to_sprd_plane_state(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0container_of=
(x, struct sprd_plane_state, state)<br>
&gt; +<br>
&gt; +struct sprd_plane_state {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane_state state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 fbc_hsize_r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 fbc_hsize_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 fbc_hsize_uv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 y2r_coef;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 pallete_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 pallete_color;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_plane {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_property *fbc_hsize_r_property;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_property *fbc_hsize_y_property;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_property *fbc_hsize_uv_property;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_property *y2r_coef_property;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_property *pallete_en_property;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_property *pallete_color_property;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 index;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_plane *sprd_plane_init(struct drm_device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_c=
apability *cap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum drm_pla=
ne_type type);<br>
&gt; +#endif<br>
&gt; <br>
<br>
-- <br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany<br>
(HRB 36809, AG N=C3=BCrnberg)<br>
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer<br>
<br>
</blockquote></div></div>

--0000000000004faf09059e4c7870--

--0000000000004faf0a059e4c7871
Content-Type: image/png; name="1.png"
Content-Disposition: inline; filename="1.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_k6ht5w8a0>
X-Attachment-Id: ii_k6ht5w8a0

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
UxRXxWEC6eWRXh7p5ZFeHunlkV4e6eWRXh7p5ZFeHunlKYqr4jCB9PJIL4/08kgvj/TySC+P9PJI
L4/08kgvj/TyFMVVcZhAenmkl0d6eaSXR3p5pJdHenmkl0d6eaSXR3p5iuKqOEwgvTzSyyO9PNLL
I7080ssjvTwaXx7p5ZFeHunlKYp7Dg50wSA+tr+vJr39NumtZvv27ZP1zGLj3HbT+u23SW+/TXr7
bdI7vemdwwTSyyO9PNLL48e1gkJ0H784rErX53NZpJdHenmkl0d6eaSXp216VRwmkF4e6eWRXh4/
rorD/qDisDzSyyO9PNLLI7080svTNr0qDhNIL4/08iyq3oceesg9lsGPq+KwP6g4LI/08kgvj/Ty
SC+P9PK0Ta+KwwTSyyO9PIuq9/LLLx8VBbD9+/dnhw4dyu677z53PIYf1/zaxvr6ujPBY2PZ5flc
BenlkV4e6eWRXh7p5emTXhWHCaSXR3p5FlVvWBwWGYrGN77xjdmdd96ZPffcc84X2PG24ReHm5ub
2draWnbmzJlRf1dWVrLt7W13PMbOzo7zsfY4h7GxsTHaD8O2YbFOnTo1dgz7rf3S0lK2tbXl9rcJ
61+X53MVpJdHenmkl0d6eaSXp096VRwmkF4e6eXpkl57ET9Pu/jii7PbbrtttN02wuIwLAZRnC0v
L0eLNCvwUCD6wB/n8QtF4LcPY1mR6ReQOLa6utq6AtHGUuuXR3p5pJdHenmkl0d6edqmV8VhAunl
kV6eLumt40W86U29c/imN70pu+eee7Jf/OIXrj3w41q7thF759Av9lCYoUCLvXuIQm6a4tD3jRWH
bcXGsun5bNQxn6sgvTzSyyO9PNLLI708fdKr4jCB9PJIL0+X9NbxIt70ojh81atelV1xxRXZyZMn
3b4UflzrS9uIFYf2UU+YHSvCCkFr7xeEKPRsf3gsLA4N3yd8F7MtWP+ans9GHfO5CtLLI7080ssj
vTzSy9MnvSoOE0gvj/TydElvHS/i69JrfWkzRQWbGKeOeTUvX92veKSXR3p5pJdHenmkd4iKwwTS
yyO9PF3SW8eL+Lr0Wl9E96ljXs3LV/crHunlkV4e6eWRXh7pHaLiMIH08kgvT5f01vEivi691hfR
feqYV/Py1f2KR3p5pJdHenmkl0d6h6g4TCC9PNLL0yW9dbyIr0vv8ePHR/2Rdd8wnk3PZ6MN87ks
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
rkJggg==
--0000000000004faf0a059e4c7871--

--===============1716865022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1716865022==--
