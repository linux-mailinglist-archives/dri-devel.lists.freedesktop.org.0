Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8583D5E82
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4758D6EC29;
	Mon, 26 Jul 2021 15:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5386EC29
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:51:38 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id k65so10914999yba.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MxUQ1cpOk1/C9p9H/Nnk3DiB/4g8TOaRq0ghLPBQWPY=;
 b=RawFyhq9DvKvSMbXKIt57ZhC8dRO56vUnVXnKc4ZKI3COTSIfCTPoiqNACU/ct0UoE
 1kV/aJ0beHuPjWWtRPnPE2BpnVCbRnfl+QJaRuitO4tCHEuceCnpE594ejsx1MEKrTUE
 RCqHfIaxNxQINeOsw5I6H657hsuPE+A3OHxkSLn9ieEPt4pO5w74MQm3xdjM7Jh8TAeK
 IWIrLDcGVb+5OWOezV6uvFFs+Nm7dnN3OFJLokze7FlIJSDMXc8yl41RsDZk4WGPVb0L
 4/lgoa3aC6YDL+nPQVFehkh0L5OyRrzvklfIflA3KvTPkiwaFHX1J987b0z45oIN2SqT
 XKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MxUQ1cpOk1/C9p9H/Nnk3DiB/4g8TOaRq0ghLPBQWPY=;
 b=YENpYaRIcqjKnEgo6+OVkccYo3x7DAiKAYXBdDZBBauClDWyRWYsrqORhGQOeuTDsK
 Gl3+AsWWbkEhfAlxTPTtCrg9FpyHI1Qc/65sVlH8+F6xaikVz2mboEt89BKh1QOjgFbt
 UFef2VZy5wofQM2CkqBZ2d4LMSbPGdLpy8gfLGLCn3d7C03+1sja1Flg5aZFR5XKxpHD
 Hu4wJoB2Nod4sWdvW6C5tOO7uURcRWlK+68CDz2wTDUZNqhtgSiaCcM5EiC+hYHHW29/
 OOqUs4cGu8ZfhFHq0dYmJ6iH/haDyi0rMFqrQ1bLfbcazPq1/d4fXaYcznonvRFoFYOm
 6pkA==
X-Gm-Message-State: AOAM533H5jh21DIeUAgUbSjj/79r6oC4QYe3dECayzr8Y/l98iza66XT
 GVAdvj9YL4r/AGd+jDUqI0A/Yd6AzDwywPGJ8kJoKw==
X-Google-Smtp-Source: ABdhPJx916aR1URzkf6NPLfkbgVcN/KLDIhVc/qpNa8TZOpQdLedlpbtpmrhS0t/A674cEhKo2CMixltatlbx9JojY4=
X-Received: by 2002:a25:d841:: with SMTP id p62mr3059709ybg.180.1627314697620; 
 Mon, 26 Jul 2021 08:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-10-daniel.vetter@ffwll.ch>
In-Reply-To: <20210723192934.1004427-10-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:51:26 -0500
Message-ID: <CAOFGe956Y1j-WcvfYCaTTLfT8VGBSede9W_xXXyRcyMYejn+EQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] drm/i915: Remove i915_globals
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 2:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> No longer used.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

But, also, tvrtko is right that dumping all that stuff in i915_pci.c
isn't great.  Mind typing a quick follow-on that moves i915_init/exit
to i915_drv.c?

--Jason

> ---
>  drivers/gpu/drm/i915/Makefile         |  1 -
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c |  1 -
>  drivers/gpu/drm/i915/i915_globals.c   | 53 ---------------------------
>  drivers/gpu/drm/i915/i915_globals.h   | 25 -------------
>  drivers/gpu/drm/i915/i915_pci.c       |  2 -
>  5 files changed, 82 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/i915_globals.c
>  delete mode 100644 drivers/gpu/drm/i915/i915_globals.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index 10b3bb6207ba..9022dc638ed6 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -166,7 +166,6 @@ i915-y +=3D \
>           i915_gem_gtt.o \
>           i915_gem_ww.o \
>           i915_gem.o \
> -         i915_globals.o \
>           i915_query.o \
>           i915_request.o \
>           i915_scheduler.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915=
/gt/intel_gt_pm.c
> index d86825437516..943c1d416ec0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -6,7 +6,6 @@
>  #include <linux/suspend.h>
>
>  #include "i915_drv.h"
> -#include "i915_globals.h"
>  #include "i915_params.h"
>  #include "intel_context.h"
>  #include "intel_engine_pm.h"
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i=
915_globals.c
> deleted file mode 100644
> index 04979789e7be..000000000000
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -/*
> - * SPDX-License-Identifier: MIT
> - *
> - * Copyright =C2=A9 2019 Intel Corporation
> - */
> -
> -#include <linux/slab.h>
> -#include <linux/workqueue.h>
> -
> -#include "i915_globals.h"
> -#include "i915_drv.h"
> -
> -static LIST_HEAD(globals);
> -
> -void __init i915_global_register(struct i915_global *global)
> -{
> -       GEM_BUG_ON(!global->exit);
> -
> -       list_add_tail(&global->link, &globals);
> -}
> -
> -static void __i915_globals_cleanup(void)
> -{
> -       struct i915_global *global, *next;
> -
> -       list_for_each_entry_safe_reverse(global, next, &globals, link)
> -               global->exit();
> -}
> -
> -static __initconst int (* const initfn[])(void) =3D {
> -};
> -
> -int __init i915_globals_init(void)
> -{
> -       int i;
> -
> -       for (i =3D 0; i < ARRAY_SIZE(initfn); i++) {
> -               int err;
> -
> -               err =3D initfn[i]();
> -               if (err) {
> -                       __i915_globals_cleanup();
> -                       return err;
> -               }
> -       }
> -
> -       return 0;
> -}
> -
> -void i915_globals_exit(void)
> -{
> -       __i915_globals_cleanup();
> -}
> diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i=
915_globals.h
> deleted file mode 100644
> index 57d2998bba45..000000000000
> --- a/drivers/gpu/drm/i915/i915_globals.h
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * SPDX-License-Identifier: MIT
> - *
> - * Copyright =C2=A9 2019 Intel Corporation
> - */
> -
> -#ifndef _I915_GLOBALS_H_
> -#define _I915_GLOBALS_H_
> -
> -#include <linux/types.h>
> -
> -typedef void (*i915_global_func_t)(void);
> -
> -struct i915_global {
> -       struct list_head link;
> -
> -       i915_global_func_t exit;
> -};
> -
> -void i915_global_register(struct i915_global *global);
> -
> -int i915_globals_init(void);
> -void i915_globals_exit(void);
> -
> -#endif /* _I915_GLOBALS_H_ */
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index 0affcf33a211..ed72bcb58331 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -37,7 +37,6 @@
>  #include "gem/i915_gem_object.h"
>  #include "i915_request.h"
>  #include "i915_perf.h"
> -#include "i915_globals.h"
>  #include "i915_selftest.h"
>  #include "i915_scheduler.h"
>  #include "i915_vma.h"
> @@ -1308,7 +1307,6 @@ static const struct {
>         { i915_request_module_init, i915_request_module_exit },
>         { i915_scheduler_module_init, i915_scheduler_module_exit },
>         { i915_vma_module_init, i915_vma_module_exit },
> -       { i915_globals_init, i915_globals_exit },
>         { i915_mock_selftests, NULL },
>         { i915_pmu_init, i915_pmu_exit },
>         { i915_register_pci_driver, i915_unregister_pci_driver },
> --
> 2.32.0
>
