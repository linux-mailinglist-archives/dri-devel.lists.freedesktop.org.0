Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909F3D7D57
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEC16EA63;
	Tue, 27 Jul 2021 18:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1776E854
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 18:25:38 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id w17so22147144ybl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rUE7LeW2i/MXeJ7BpjRroFZaGRlXaZd9UAdi1TEb5vU=;
 b=XPQG9tQIL3bGsXLl6bVbclwtB+pR147q9OJYJ+zjBURwhwbfYIb89IZXqNitQfMlJw
 NsAc6WI7rLtpAqgQD6DVnEEYJ5IibZW3g6WgfF1W8CjOOzuj8/ZGDhp90zTavnjv/KaG
 pg5tBkRL43nqr0raUdaXwcUwFIKiz13GhMkyT7S7ikFr7FV2DPFszKCoP5uwTOgT1h2i
 veisQxhroIpWgm2QqsUg4X7EL3tLjDkj820/l3Hl1LPQ/SlIz9Pr02fBJG/aJ5YcpZ+X
 0sz0pe4puLzjXJ14y9fxxOhENsbe7hyEkiLnd7kPqdCNve7gQUAalkOH2T0RAVfbJdGr
 hONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rUE7LeW2i/MXeJ7BpjRroFZaGRlXaZd9UAdi1TEb5vU=;
 b=uRYfXZ0m9/RCYpbjA7lXvHpZIae2ClItqL6M2CFE3pP6S21QZPvc6c1qMo+AxNVRya
 7nlLM3+oW0eVC9SSqMcwVFv4y9D4OOCrXyJZsfqjl+er0Z/knxX3BB2z+kk5+da+lTYz
 64BiwrqoUG6pGE1Y92HZ28XxlvBMwOKMAP3GeZ/lSiGrPc0RKoHgC6RWWE94aWvDmpk+
 iGh7rvhGY1n5YdmIEhOOttfGVPPEcwjKhKrH/X4U/GIiT82WWD50oXzFgB5HI+nDNVh3
 oiz6qZDLQsIP+Z3bTKAJyKPeZcUIwa5gex7vxJEGDHlhleC20jR/izZvZLAmI3YT0+eR
 OkUg==
X-Gm-Message-State: AOAM533fTIwHCl+WgI6Gb4zhKesEsdiWmg7h9MXFqY5xrALMwbFAqpKv
 uoPBnpRJnjOifdFeVvRJw4wLA+p3U818ro5pM8KGOA==
X-Google-Smtp-Source: ABdhPJxtF/qqMJstgN51H+0kJbmM2b6hbXVt5OJPZJnQz2goSSS9By3iC/eFG7qBK7J2z6w9nS0vwNwHY9hRkDKKCcU=
X-Received: by 2002:a25:5584:: with SMTP id
 j126mr33410119ybb.323.1627410337518; 
 Tue, 27 Jul 2021 11:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
 <20210727121037.2041102-11-daniel.vetter@ffwll.ch>
 <f3b20f36-a76d-032a-3fb7-1a7c3e839478@linux.intel.com>
In-Reply-To: <f3b20f36-a76d-032a-3fb7-1a7c3e839478@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 27 Jul 2021 13:25:26 -0500
Message-ID: <CAOFGe96pq0ximhgudK4zbgK44Pp0609nUQk1aAkB=W1ZQhVxeg@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] drm/i915: Extract i915_module.c
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 9:44 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 27/07/2021 13:10, Daniel Vetter wrote:
> > The module init code is somewhat misplaced in i915_pci.c, since it
> > needs to pull in init/exit functions from every part of the driver and
> > pollutes the include list a lot.
> >
> > Extract an i915_module.c file which pulls all the bits together, and
> > allows us to massively trim the include list of i915_pci.c.
> >
> > The downside is that have to drop the error path check Jason added to
> > catch when we set up the pci driver too early. I think that risk is
> > acceptable for this pretty nice include.
>
> i915_module.c is an improvement and the rest for me is not extremely
> objectionable by the end of this incarnation, but I also do not see it
> as an improvement really.

It's not a big improvement to be sure, but I think there are a few
ways this is nicer:

 1. One less level of indirection to sort through.
 2. The init/exit table is generally simpler than the i915_global interface=
.
 3. It's easy to forget i915_global_register but forgetting to put an
_exit function in the module init table is a lot more obvious.

None of those are deal-breakers but they're kind-of nice.  Anyway,
this one is also

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

--Jason

> There was a bug to fix relating to mock tests, but that is where the
> exercise should have stopped for now. After that it IMHO spiraled out of
> control, not least the unjustifiably expedited removal of cache
> shrinking. On balance for me it is too churny and boils down to two
> extremely capable people spending time on kind of really unimportant
> side fiddles. And I do not intend to prescribe you what to do, just
> expressing my bewilderment. FWIW... I can only say my opinion as it, not
> that it matters a lot.
>
> Regards,
>
> Tvrtko
>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >   drivers/gpu/drm/i915/Makefile      |   1 +
> >   drivers/gpu/drm/i915/i915_module.c | 113 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/i915/i915_pci.c    | 117 +---------------------------=
-
> >   drivers/gpu/drm/i915/i915_pci.h    |   8 ++
> >   4 files changed, 125 insertions(+), 114 deletions(-)
> >   create mode 100644 drivers/gpu/drm/i915/i915_module.c
> >   create mode 100644 drivers/gpu/drm/i915/i915_pci.h
> >
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makef=
ile
> > index 9022dc638ed6..4ebd9f417ddb 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -38,6 +38,7 @@ i915-y +=3D i915_drv.o \
> >         i915_irq.o \
> >         i915_getparam.o \
> >         i915_mitigations.o \
> > +       i915_module.o \
> >         i915_params.o \
> >         i915_pci.o \
> >         i915_scatterlist.o \
> > diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/=
i915_module.c
> > new file mode 100644
> > index 000000000000..c578ea8f56a0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/i915_module.c
> > @@ -0,0 +1,113 @@
> > +/*
> > + * SPDX-License-Identifier: MIT
> > + *
> > + * Copyright =C2=A9 2021 Intel Corporation
> > + */
> > +
> > +#include <linux/console.h>
> > +
> > +#include "gem/i915_gem_context.h"
> > +#include "gem/i915_gem_object.h"
> > +#include "i915_active.h"
> > +#include "i915_buddy.h"
> > +#include "i915_params.h"
> > +#include "i915_pci.h"
> > +#include "i915_perf.h"
> > +#include "i915_request.h"
> > +#include "i915_scheduler.h"
> > +#include "i915_selftest.h"
> > +#include "i915_vma.h"
> > +
> > +static int i915_check_nomodeset(void)
> > +{
> > +     bool use_kms =3D true;
> > +
> > +     /*
> > +      * Enable KMS by default, unless explicitly overriden by
> > +      * either the i915.modeset prarameter or by the
> > +      * vga_text_mode_force boot option.
> > +      */
> > +
> > +     if (i915_modparams.modeset =3D=3D 0)
> > +             use_kms =3D false;
> > +
> > +     if (vgacon_text_force() && i915_modparams.modeset =3D=3D -1)
> > +             use_kms =3D false;
> > +
> > +     if (!use_kms) {
> > +             /* Silently fail loading to not upset userspace. */
> > +             DRM_DEBUG_DRIVER("KMS disabled.\n");
> > +             return 1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct {
> > +   int (*init)(void);
> > +   void (*exit)(void);
> > +} init_funcs[] =3D {
> > +     { i915_check_nomodeset, NULL },
> > +     { i915_active_module_init, i915_active_module_exit },
> > +     { i915_buddy_module_init, i915_buddy_module_exit },
> > +     { i915_context_module_init, i915_context_module_exit },
> > +     { i915_gem_context_module_init, i915_gem_context_module_exit },
> > +     { i915_objects_module_init, i915_objects_module_exit },
> > +     { i915_request_module_init, i915_request_module_exit },
> > +     { i915_scheduler_module_init, i915_scheduler_module_exit },
> > +     { i915_vma_module_init, i915_vma_module_exit },
> > +     { i915_mock_selftests, NULL },
> > +     { i915_pmu_init, i915_pmu_exit },
> > +     { i915_register_pci_driver, i915_unregister_pci_driver },
> > +     { i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> > +};
> > +static int init_progress;
> > +
> > +static int __init i915_init(void)
> > +{
> > +     int err, i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(init_funcs); i++) {
> > +             err =3D init_funcs[i].init();
> > +             if (err < 0) {
> > +                     while (i--) {
> > +                             if (init_funcs[i].exit)
> > +                                     init_funcs[i].exit();
> > +                     }
> > +                     return err;
> > +             } else if (err > 0) {
> > +                     /*
> > +                      * Early-exit success is reserved for things whic=
h
> > +                      * don't have an exit() function because we have =
no
> > +                      * idea how far they got or how to partially tear
> > +                      * them down.
> > +                      */
> > +                     WARN_ON(init_funcs[i].exit);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     init_progress =3D i;
> > +
> > +     return 0;
> > +}
> > +
> > +static void __exit i915_exit(void)
> > +{
> > +     int i;
> > +
> > +     for (i =3D init_progress - 1; i >=3D 0; i--) {
> > +             GEM_BUG_ON(i >=3D ARRAY_SIZE(init_funcs));
> > +             if (init_funcs[i].exit)
> > +                     init_funcs[i].exit();
> > +     }
> > +}
> > +
> > +module_init(i915_init);
> > +module_exit(i915_exit);
> > +
> > +MODULE_AUTHOR("Tungsten Graphics, Inc.");
> > +MODULE_AUTHOR("Intel Corporation");
> > +
> > +MODULE_DESCRIPTION(DRIVER_DESC);
> > +MODULE_LICENSE("GPL and additional rights");
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index b4f5e88aaae6..08651ca03478 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -22,24 +22,13 @@
> >    *
> >    */
> >
> > -#include <linux/console.h>
> >   #include <linux/vga_switcheroo.h>
> >
> >   #include <drm/drm_drv.h>
> >   #include <drm/i915_pciids.h>
> >
> > -#include "display/intel_fbdev.h"
> > -
> > -#include "i915_active.h"
> > -#include "i915_buddy.h"
> >   #include "i915_drv.h"
> > -#include "gem/i915_gem_context.h"
> > -#include "gem/i915_gem_object.h"
> > -#include "i915_request.h"
> > -#include "i915_perf.h"
> > -#include "i915_selftest.h"
> > -#include "i915_scheduler.h"
> > -#include "i915_vma.h"
> > +#include "i915_pci.h"
> >
> >   #define PLATFORM(x) .platform =3D (x)
> >   #define GEN(x) \
> > @@ -1251,31 +1240,6 @@ static void i915_pci_shutdown(struct pci_dev *pd=
ev)
> >       i915_driver_shutdown(i915);
> >   }
> >
> > -static int i915_check_nomodeset(void)
> > -{
> > -     bool use_kms =3D true;
> > -
> > -     /*
> > -      * Enable KMS by default, unless explicitly overriden by
> > -      * either the i915.modeset prarameter or by the
> > -      * vga_text_mode_force boot option.
> > -      */
> > -
> > -     if (i915_modparams.modeset =3D=3D 0)
> > -             use_kms =3D false;
> > -
> > -     if (vgacon_text_force() && i915_modparams.modeset =3D=3D -1)
> > -             use_kms =3D false;
> > -
> > -     if (!use_kms) {
> > -             /* Silently fail loading to not upset userspace. */
> > -             DRM_DEBUG_DRIVER("KMS disabled.\n");
> > -             return 1;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> >   static struct pci_driver i915_pci_driver =3D {
> >       .name =3D DRIVER_NAME,
> >       .id_table =3D pciidlist,
> > @@ -1285,87 +1249,12 @@ static struct pci_driver i915_pci_driver =3D {
> >       .driver.pm =3D &i915_pm_ops,
> >   };
> >
> > -static int i915_register_pci_driver(void)
> > +int i915_register_pci_driver(void)
> >   {
> >       return pci_register_driver(&i915_pci_driver);
> >   }
> >
> > -static void i915_unregister_pci_driver(void)
> > +void i915_unregister_pci_driver(void)
> >   {
> >       pci_unregister_driver(&i915_pci_driver);
> >   }
> > -
> > -static const struct {
> > -   int (*init)(void);
> > -   void (*exit)(void);
> > -} init_funcs[] =3D {
> > -     { i915_check_nomodeset, NULL },
> > -     { i915_active_module_init, i915_active_module_exit },
> > -     { i915_buddy_module_init, i915_buddy_module_exit },
> > -     { i915_context_module_init, i915_context_module_exit },
> > -     { i915_gem_context_module_init, i915_gem_context_module_exit },
> > -     { i915_objects_module_init, i915_objects_module_exit },
> > -     { i915_request_module_init, i915_request_module_exit },
> > -     { i915_scheduler_module_init, i915_scheduler_module_exit },
> > -     { i915_vma_module_init, i915_vma_module_exit },
> > -     { i915_mock_selftests, NULL },
> > -     { i915_pmu_init, i915_pmu_exit },
> > -     { i915_register_pci_driver, i915_unregister_pci_driver },
> > -     { i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> > -};
> > -static int init_progress;
> > -
> > -static int __init i915_init(void)
> > -{
> > -     int err, i;
> > -
> > -     for (i =3D 0; i < ARRAY_SIZE(init_funcs); i++) {
> > -             err =3D init_funcs[i].init();
> > -             if (err < 0) {
> > -                     while (i--) {
> > -                             if (init_funcs[i].exit)
> > -                                     init_funcs[i].exit();
> > -                     }
> > -                     return err;
> > -             } else if (err > 0) {
> > -                     /*
> > -                      * Early-exit success is reserved for things whic=
h
> > -                      * don't have an exit() function because we have =
no
> > -                      * idea how far they got or how to partially tear
> > -                      * them down.
> > -                      */
> > -                     WARN_ON(init_funcs[i].exit);
> > -
> > -                     /*
> > -                      * We don't want to advertise devices with an onl=
y
> > -                      * partially initialized driver.
> > -                      */
> > -                     WARN_ON(i915_pci_driver.driver.owner);
> > -                     break;
> > -             }
> > -     }
> > -
> > -     init_progress =3D i;
> > -
> > -     return 0;
> > -}
> > -
> > -static void __exit i915_exit(void)
> > -{
> > -     int i;
> > -
> > -     for (i =3D init_progress - 1; i >=3D 0; i--) {
> > -             GEM_BUG_ON(i >=3D ARRAY_SIZE(init_funcs));
> > -             if (init_funcs[i].exit)
> > -                     init_funcs[i].exit();
> > -     }
> > -}
> > -
> > -module_init(i915_init);
> > -module_exit(i915_exit);
> > -
> > -MODULE_AUTHOR("Tungsten Graphics, Inc.");
> > -MODULE_AUTHOR("Intel Corporation");
> > -
> > -MODULE_DESCRIPTION(DRIVER_DESC);
> > -MODULE_LICENSE("GPL and additional rights");
> > diff --git a/drivers/gpu/drm/i915/i915_pci.h b/drivers/gpu/drm/i915/i91=
5_pci.h
> > new file mode 100644
> > index 000000000000..b386f319f52e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/i915_pci.h
> > @@ -0,0 +1,8 @@
> > +/*
> > + * SPDX-License-Identifier: MIT
> > + *
> > + * Copyright =C2=A9 2021 Intel Corporation
> > + */
> > +
> > +int i915_register_pci_driver(void);
> > +void i915_unregister_pci_driver(void);
> >
