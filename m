Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECFB3D7466
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137B66E84D;
	Tue, 27 Jul 2021 11:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B42F6E840
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:34:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so2107382wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 04:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DUUoGyz/3Y1HOyrfiKk2YwE9wcmCcIK4Fto/Lzq65Ws=;
 b=hhGTU67zU1T4DLiTOyuXcUjJF1VwLjTWkuryv3ThwBRGz0TVQotOKrLk3fvlU1S2Mp
 JBdFooxzglnTRJotrEZxTq/aMDkB+MhcGvCKy/NruUxeX0Nowob2h8PYnJB0UAtCUCA9
 LSBy4DUbSq9DrNCNjYYDv1NPRqDJAgUQcocYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DUUoGyz/3Y1HOyrfiKk2YwE9wcmCcIK4Fto/Lzq65Ws=;
 b=KbMwD43Z73hFpX53Lxy8SepRLL80oiHbwMFfLhAkuksmhykN5bPGk/zkaturiITHrn
 pVgNv/obm6D9+kvUS0tdZdpA9xcmvf21Rb3NeNwYSaHcIqbvv0GBjd4Bf3rlXzdZmJN3
 tSSuxw1wLzLuMrtw8qQ27mpAgJhq5C4KjL92ZwPvKg99bxA/J1W6xWS6scgBCbV7wF3R
 xwy7iVgUIiucv4vvY+z1yBVU/OG6R+tRuuUR20DZ5KN8UypKrAIuAhPsxPYU9dSnfGF7
 St/6fFj5aDT6oe1IpcCjdUTbMuGR/lrqMcq+7w3tL958GEYkUtClLid7NCvEUvIvR1N6
 k51w==
X-Gm-Message-State: AOAM533bVtl4oMGue+jv7sAUSSsbzbgN76utfPscatoScuouzaLxrlfN
 fdpH+gv0TNGm5P5iDtfnXxVrNxFYPeZMNQ==
X-Google-Smtp-Source: ABdhPJw+x5+y4DMHk3BGL+C/BqDpPgw5LbYiG6PmU1Lpf5+4A/hK7S/JFHC4i/9ZjgMEgmCY0rFXEg==
X-Received: by 2002:a1c:1f8b:: with SMTP id f133mr9721519wmf.21.1627385653161; 
 Tue, 27 Jul 2021 04:34:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k24sm3068356wrh.30.2021.07.27.04.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:34:12 -0700 (PDT)
Date: Tue, 27 Jul 2021 13:34:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 10/10] drm/i915: Remove i915_globals
Message-ID: <YP/vMkTM/xBbMASm@phenom.ffwll.local>
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-10-daniel.vetter@ffwll.ch>
 <CAOFGe956Y1j-WcvfYCaTTLfT8VGBSede9W_xXXyRcyMYejn+EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe956Y1j-WcvfYCaTTLfT8VGBSede9W_xXXyRcyMYejn+EQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Jul 26, 2021 at 10:51:26AM -0500, Jason Ekstrand wrote:
> On Fri, Jul 23, 2021 at 2:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > No longer used.
> >
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> 
> But, also, tvrtko is right that dumping all that stuff in i915_pci.c
> isn't great.  Mind typing a quick follow-on that moves i915_init/exit
> to i915_drv.c?

I think if we want it a new i915_module.c for the module stuff makes more
sense. And leaving the pci driver in i915_pci.c. At least imo i915_drv is
about the drm_driver instance ...

I'll see what it looks like for v2.
-Daniel

> 
> --Jason
> 
> > ---
> >  drivers/gpu/drm/i915/Makefile         |  1 -
> >  drivers/gpu/drm/i915/gt/intel_gt_pm.c |  1 -
> >  drivers/gpu/drm/i915/i915_globals.c   | 53 ---------------------------
> >  drivers/gpu/drm/i915/i915_globals.h   | 25 -------------
> >  drivers/gpu/drm/i915/i915_pci.c       |  2 -
> >  5 files changed, 82 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/i915/i915_globals.c
> >  delete mode 100644 drivers/gpu/drm/i915/i915_globals.h
> >
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > index 10b3bb6207ba..9022dc638ed6 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -166,7 +166,6 @@ i915-y += \
> >           i915_gem_gtt.o \
> >           i915_gem_ww.o \
> >           i915_gem.o \
> > -         i915_globals.o \
> >           i915_query.o \
> >           i915_request.o \
> >           i915_scheduler.o \
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > index d86825437516..943c1d416ec0 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > @@ -6,7 +6,6 @@
> >  #include <linux/suspend.h>
> >
> >  #include "i915_drv.h"
> > -#include "i915_globals.h"
> >  #include "i915_params.h"
> >  #include "intel_context.h"
> >  #include "intel_engine_pm.h"
> > diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> > deleted file mode 100644
> > index 04979789e7be..000000000000
> > --- a/drivers/gpu/drm/i915/i915_globals.c
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -/*
> > - * SPDX-License-Identifier: MIT
> > - *
> > - * Copyright © 2019 Intel Corporation
> > - */
> > -
> > -#include <linux/slab.h>
> > -#include <linux/workqueue.h>
> > -
> > -#include "i915_globals.h"
> > -#include "i915_drv.h"
> > -
> > -static LIST_HEAD(globals);
> > -
> > -void __init i915_global_register(struct i915_global *global)
> > -{
> > -       GEM_BUG_ON(!global->exit);
> > -
> > -       list_add_tail(&global->link, &globals);
> > -}
> > -
> > -static void __i915_globals_cleanup(void)
> > -{
> > -       struct i915_global *global, *next;
> > -
> > -       list_for_each_entry_safe_reverse(global, next, &globals, link)
> > -               global->exit();
> > -}
> > -
> > -static __initconst int (* const initfn[])(void) = {
> > -};
> > -
> > -int __init i915_globals_init(void)
> > -{
> > -       int i;
> > -
> > -       for (i = 0; i < ARRAY_SIZE(initfn); i++) {
> > -               int err;
> > -
> > -               err = initfn[i]();
> > -               if (err) {
> > -                       __i915_globals_cleanup();
> > -                       return err;
> > -               }
> > -       }
> > -
> > -       return 0;
> > -}
> > -
> > -void i915_globals_exit(void)
> > -{
> > -       __i915_globals_cleanup();
> > -}
> > diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
> > deleted file mode 100644
> > index 57d2998bba45..000000000000
> > --- a/drivers/gpu/drm/i915/i915_globals.h
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -/*
> > - * SPDX-License-Identifier: MIT
> > - *
> > - * Copyright © 2019 Intel Corporation
> > - */
> > -
> > -#ifndef _I915_GLOBALS_H_
> > -#define _I915_GLOBALS_H_
> > -
> > -#include <linux/types.h>
> > -
> > -typedef void (*i915_global_func_t)(void);
> > -
> > -struct i915_global {
> > -       struct list_head link;
> > -
> > -       i915_global_func_t exit;
> > -};
> > -
> > -void i915_global_register(struct i915_global *global);
> > -
> > -int i915_globals_init(void);
> > -void i915_globals_exit(void);
> > -
> > -#endif /* _I915_GLOBALS_H_ */
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index 0affcf33a211..ed72bcb58331 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -37,7 +37,6 @@
> >  #include "gem/i915_gem_object.h"
> >  #include "i915_request.h"
> >  #include "i915_perf.h"
> > -#include "i915_globals.h"
> >  #include "i915_selftest.h"
> >  #include "i915_scheduler.h"
> >  #include "i915_vma.h"
> > @@ -1308,7 +1307,6 @@ static const struct {
> >         { i915_request_module_init, i915_request_module_exit },
> >         { i915_scheduler_module_init, i915_scheduler_module_exit },
> >         { i915_vma_module_init, i915_vma_module_exit },
> > -       { i915_globals_init, i915_globals_exit },
> >         { i915_mock_selftests, NULL },
> >         { i915_pmu_init, i915_pmu_exit },
> >         { i915_register_pci_driver, i915_unregister_pci_driver },
> > --
> > 2.32.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
