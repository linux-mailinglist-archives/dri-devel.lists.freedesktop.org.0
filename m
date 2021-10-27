Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326943CEAE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4376E7D5;
	Wed, 27 Oct 2021 16:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E9C6E7D0;
 Wed, 27 Oct 2021 16:24:27 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id d6so2147063qvb.3;
 Wed, 27 Oct 2021 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vmpGZBtee5zeMy7ZXKmCA4/DiT+/FUCxOeG55lmjPBo=;
 b=NCg0ezwJTfs48B0Na84dMRlbJ3G4sOR4CNG9aFHgRf8ZE/4AUQH6SVGUVEPieDlZvM
 /Opl1BDIkrz+Z3m6l7RJ7M07EFsVKetBKaKit39+AKGmzdAHaXNP47mhtWABGXdJ5gHG
 juodhCswbFW+eL4g62FpkNe/mkx2+R08QusyyYjONH03oawNZKWwNsdtECRmTGfkIQ6z
 E9lX8oajOY2LZQdBw/5VLN9LXvwAOT7Kfei7OTf5lj7Qvblh2jXedTovKhaHenA6Aa1S
 0a8wJyF1EajRZGqem3GUFggzGXzPfruKDzy5lzUg2ZS2x9cyUgjkRMuPk4Eff9CKjrbm
 LpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vmpGZBtee5zeMy7ZXKmCA4/DiT+/FUCxOeG55lmjPBo=;
 b=XCxlgG/r70YkqISVDEEtiZtDI/a/ERaa5Lm77Fs4lKwZp4mRfC8Z7LSqnFvO2V1Y99
 M+j8aKeWkIrJEtaeJXu4+cgS4KPFNt0Ff8FDCeZuw0dnFGytPvjoh+RepEtsUQfXTn+Z
 rr5f0oxsAzaPBEBi3NlKAgMjt4123YoCaCcn0Uo35xXnP69CJRRJFjUovZjoZwQT6tvj
 AHlq0E0ZAuLaCB+5E05SwOfQaJZmDsXwBhKiUMO4vr72+orD+cUCfYwAWLR76dPGoy5r
 m3nXiGtay11d+D46fX+s63wlMFB7Gooto7G3Lr7WMnGr3kjvwlWd0chq69i0z4TN7N/n
 dfDw==
X-Gm-Message-State: AOAM530pE43MxEOHq9ZuFcaEFK1qLPJvRJc2PHkP+lSkXpjZKR3ZIsNQ
 jjWdoCPRStg//2V/oWDeIZn/qwup1Q/ENniLtOHnyR5la96V+15d
X-Google-Smtp-Source: ABdhPJxJ2avg0JKo7AOn9hOWhvdmRYe4wdndt0u95dzYqPbRz7f4V/3UUJqed72k5EpYYFamzjQH6IZivu4jj0ViqEY=
X-Received: by 2002:a05:6214:2688:: with SMTP id
 gm8mr3693137qvb.19.1635351867008; 
 Wed, 27 Oct 2021 09:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211021125332.2455288-1-matthew.auld@intel.com>
 <CAM0jSHNig=n9cw0CCNhWHnLn5hLPYFFQR4D9OgZ-QavgyJGJpg@mail.gmail.com>
 <20211027145414.mrpikqvdmg7qsb7g@ldmartin-desk2>
In-Reply-To: <20211027145414.mrpikqvdmg7qsb7g@ldmartin-desk2>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 27 Oct 2021 17:23:59 +0100
Message-ID: <CAM0jSHMcnRCbXRud3K5wJERcww8urk7g1EDpMOEw7RW4LYPqMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/dmabuf: fix broken build
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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

On Wed, 27 Oct 2021 at 15:54, Lucas De Marchi <lucas.demarchi@intel.com> wr=
ote:
>
> On Wed, Oct 27, 2021 at 08:57:48AM +0100, Matthew Auld wrote:
> >On Thu, 21 Oct 2021 at 13:54, Matthew Auld <matthew.auld@intel.com> wrot=
e:
> >>
> >> wbinvd_on_all_cpus() is only defined on x86 it seems, plus we need to
> >> include asm/smp.h here.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >
> >Jani, would it make sense to cherry-pick this to -fixes? The offending
> >commit is in drm-next, and there have been a few reports around this.
> >
> >Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire")
> >
> >
> >> ---
> >>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/=
drm/i915/gem/i915_gem_dmabuf.c
> >> index 1adcd8e02d29..a45d0ec2c5b6 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >> @@ -12,6 +12,13 @@
> >>  #include "i915_gem_object.h"
> >>  #include "i915_scatterlist.h"
> >>
> >> +#if defined(CONFIG_X86)
> >> +#include <asm/smp.h>
> >> +#else
> >> +#define wbinvd_on_all_cpus() \
> >> +       pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
>
>
> not sure I understand why this is a fix. Sure, it's true, but right now
> this file can't be built on any other arch.
>
> For clflush, wbind, etc, I'd rather change the code to use things from
> drm_cache rather than ifdef it out locally. This is
> "Reported-by: kernel test robot <lkp@intel.com>", but what's the error?

I guess it depends on the kernel config, but it reported:
error: implicit declaration of function 'wbinvd_on_all_cpus'

AFAIK it's the missing <asm/smp.h>, the CONFIG_X86 thing is just for
good measure.

I didn't spot anything in drm_cache which just offers a simple wrapper
for wbinvd?

>
> Lucas De Marchi
>
> >> +#endif
> >> +
> >>  I915_SELFTEST_DECLARE(static bool force_different_devices;)
> >>
> >>  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf=
)
> >> --
> >> 2.26.3
> >>
