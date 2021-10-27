Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB23643C60B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 11:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2758977A;
	Wed, 27 Oct 2021 09:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00848977A;
 Wed, 27 Oct 2021 09:04:18 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id g25so306175qvf.13;
 Wed, 27 Oct 2021 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U6Jns1s4Pdbqq1IwyYAlfaismi2SHUC81oP3a/meF70=;
 b=TtYOxwNwrrsu2FTfALKA41XBU3DsqekAFVqeB9YmYTVg9mcM4wVjbHSDCLyCkTxk37
 7jzrgu+4uixSHJW3iZPTgVJy85kBFeaUsTUS+eBSxDsuwxDn8in9CD6Oas7B9QimxrYZ
 eYforCsGyI61kWlUtLYS5iXB67zH5zlFBx1FOv4okkPfb0gyyHj/IAXcXlMC0kqFYi8p
 XK1CNFXAvHTyxlouI2Ki9bD1V9BEEwnStj3ctmIC687XRxaU7FYThLIJGD3wlBP0IDk/
 U9/DvKDSs6CXeQB4FmyqP7gbqMP7DoRpSYh4WSHLm5QeVtMrEuZzhjHX4R0sDRo6zpLa
 TUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U6Jns1s4Pdbqq1IwyYAlfaismi2SHUC81oP3a/meF70=;
 b=Tr92fBLmsihbm5cZNEGRAHkrVd6bvLF26QDlClUFssdT7Gth6ZqBafmekcwKxp3kEh
 pTmFIDBmpsNrHREKtoo0jhI0ndsNulEgyWJRowQoWmFjyxUWHzhZI6Ln/5KTF7W8FH71
 g3RKr894xoNwPJRWsydVazi+diZ+H49C00bYK0OpELo6lrfwqvWoViwC+PayFu7WIHNJ
 VzgMIgVFyZCvVgTehbLot8rprjjyladellaL3sbHGmUkkvSAkJ8kZElsI10T2KRrLcCm
 c1IfWdiDNKBTmpm5cJdczq/7BzLROWo/1zlXrK52wGhuSakBZSb0KWLypcIRi5FyLprG
 j08A==
X-Gm-Message-State: AOAM533djGizbomCzZyfqlwSz80eQMZx04/pDoIFudUfJW6Sd9x3gETy
 uxYlmiYKnRaNfJ/a1yXVnPADrrFvyn9kmHgi5OA=
X-Google-Smtp-Source: ABdhPJzvGnLIjWR75ncLXDJzX95Inr6fC4TRQ4/4QhlgnrByq+NLWCypMQzTc+V9Kl4QLHgxW4++gF7n/sQxbj79he8=
X-Received: by 2002:a05:6214:8c2:: with SMTP id
 da2mr5871801qvb.18.1635325456733; 
 Wed, 27 Oct 2021 02:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211021125332.2455288-1-matthew.auld@intel.com>
 <CAM0jSHNig=n9cw0CCNhWHnLn5hLPYFFQR4D9OgZ-QavgyJGJpg@mail.gmail.com>
 <87k0hyj13f.fsf@intel.com>
In-Reply-To: <87k0hyj13f.fsf@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 27 Oct 2021 10:03:49 +0100
Message-ID: <CAM0jSHOCn120_-WZCJHa2+NzPrB_pErHPT3hA2BGarM-ZDw-Cg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/dmabuf: fix broken build
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

On Wed, 27 Oct 2021 at 09:58, Jani Nikula <jani.nikula@linux.intel.com> wro=
te:
>
> On Wed, 27 Oct 2021, Matthew Auld <matthew.william.auld@gmail.com> wrote:
> > On Thu, 21 Oct 2021 at 13:54, Matthew Auld <matthew.auld@intel.com> wro=
te:
> >>
> >> wbinvd_on_all_cpus() is only defined on x86 it seems, plus we need to
> >> include asm/smp.h here.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >
> > Jani, would it make sense to cherry-pick this to -fixes? The offending
> > commit is in drm-next, and there have been a few reports around this.
> >
> > Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire")
>
> If the Fixes: tag is in place, our tooling will cherry-pick it where it
> belongs. (In this case, drm-intel-next-fixes, not drm-intel-fixes.)

Yeah, I forgot to add the fixes tag here unfortunately.

>
> Cc: Rodrigo who covers drm-intel-next-fixes atm.
>
> BR,
> Jani.
>
>
>
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
> >> +#endif
> >> +
> >>  I915_SELFTEST_DECLARE(static bool force_different_devices;)
> >>
> >>  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf=
)
> >> --
> >> 2.26.3
> >>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
