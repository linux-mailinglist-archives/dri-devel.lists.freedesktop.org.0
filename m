Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553043C6C7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 11:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4816E87F;
	Wed, 27 Oct 2021 09:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC04C6E87F;
 Wed, 27 Oct 2021 09:48:31 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id bl14so1842382qkb.4;
 Wed, 27 Oct 2021 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UMgCr5h5dLtzA1yiIwm7EshjuW5tSW2Zw/W86auLHek=;
 b=euk20K6ykoqvYZShOmhjVpjIO4NcLbfwHcva4lDVJYUKbyCn2xpPM4fdPqRsJ9J4VQ
 akq+rBvrrqKYwWeOOO8ZsMfoO3T+952D8U3orcvlGnxhOS2kUitGLgt3CrB8detaQLNe
 KB8qfjL+1d6t8+ZF0Cs7WH6aspCl7XxII1up91+9GS05dkCHsQAw5Pt1jyzdzW1U7bvL
 rfTGIPMu0QE2oACdzr0i5wN1E5sP4wYv3nx+XhGaPyYynR4NN6W61/UP4py+KsmnJmi2
 tK4BrXl6Fqex+oYiefowwTNbDtn9oKsobgWqMc5jHeB0rutmdy5eJRYbbkcHdKcBW7VG
 JEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UMgCr5h5dLtzA1yiIwm7EshjuW5tSW2Zw/W86auLHek=;
 b=qsfyUxB5nwZeP20xk0XwP1muuvm+B8lfhg+G7YIsmQNcdclF1Mx/E0UE6CaufjqXba
 ae3pByzeDTjvqOHasSwgC+M1b6tMh8F758ii8lh9Ic1evmfCzrPNQHlcepzxHXGf651w
 k4Zp+7dsuKVj8YsJ0NjIDzGVC6siXEDIr0jj3O3SROGMVDbHJNyvwCNPU2XsjAIFt/J2
 cdzaQsCBwAA5RlhDbIcadVhpUOz6I3HcE41cA8eZWCPxlbJsVe54OlRdZchctyDCETDt
 Vm8HeALaNPBEwqv9SKmihhdoz6Jnc+mbiiBkfxZYYUgNmTv8kqI5h3+OgUJrxC7V51nO
 YuUw==
X-Gm-Message-State: AOAM531LqgtaqeU4Wb7HCHpj8yMMGhvpCoJHH4PqYOp7qmp4c3WPelvL
 pb5enS5VZ6+Ukio1OsfF1n/MU6RSknxz6yisi+Io+bk0sHstBw==
X-Google-Smtp-Source: ABdhPJy53xyC2cukuUWwF300yJ9Zhhj7aeW0lL1iPA66xlOH1Z3aqTAs/fefOV3VqARGpNzM6YVp1ii4sX1HUj09J+M=
X-Received: by 2002:a37:a87:: with SMTP id 129mr23154681qkk.107.1635328110896; 
 Wed, 27 Oct 2021 02:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211021125332.2455288-1-matthew.auld@intel.com>
 <CAM0jSHNig=n9cw0CCNhWHnLn5hLPYFFQR4D9OgZ-QavgyJGJpg@mail.gmail.com>
 <87k0hyj13f.fsf@intel.com>
 <CAM0jSHOCn120_-WZCJHa2+NzPrB_pErHPT3hA2BGarM-ZDw-Cg@mail.gmail.com>
 <87cznqiyzg.fsf@intel.com>
In-Reply-To: <87cznqiyzg.fsf@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 27 Oct 2021 10:48:03 +0100
Message-ID: <CAM0jSHN4oYq=DRnpKiMXjVKUFQ5kttobWpuJLEi6eFzMwjP5-g@mail.gmail.com>
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

On Wed, 27 Oct 2021 at 10:44, Jani Nikula <jani.nikula@linux.intel.com> wro=
te:
>
> On Wed, 27 Oct 2021, Matthew Auld <matthew.william.auld@gmail.com> wrote:
> > On Wed, 27 Oct 2021 at 09:58, Jani Nikula <jani.nikula@linux.intel.com>=
 wrote:
> >>
> >> On Wed, 27 Oct 2021, Matthew Auld <matthew.william.auld@gmail.com> wro=
te:
> >> > On Thu, 21 Oct 2021 at 13:54, Matthew Auld <matthew.auld@intel.com> =
wrote:
> >> >>
> >> >> wbinvd_on_all_cpus() is only defined on x86 it seems, plus we need =
to
> >> >> include asm/smp.h here.
> >> >>
> >> >> Reported-by: kernel test robot <lkp@intel.com>
> >> >> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >> >> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >> >
> >> > Jani, would it make sense to cherry-pick this to -fixes? The offendi=
ng
> >> > commit is in drm-next, and there have been a few reports around this=
.
> >> >
> >> > Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire=
")
> >>
> >> If the Fixes: tag is in place, our tooling will cherry-pick it where i=
t
> >> belongs. (In this case, drm-intel-next-fixes, not drm-intel-fixes.)
> >
> > Yeah, I forgot to add the fixes tag here unfortunately.
>
> Already merged? What's the commit id to be cherry-picked? Rodrigo can do
> it manually.

Yeah, it was merged to gt-next:

777226dac058 ("drm/i915/dmabuf: fix broken build")

>
> Note to self, we should set up some way to check which maintainer is
> responsible for which branches and when.
>
> BR,
> Jani.
>
> >
> >>
> >> Cc: Rodrigo who covers drm-intel-next-fixes atm.
> >>
> >> BR,
> >> Jani.
> >>
> >>
> >>
> >> >
> >> >
> >> >> ---
> >> >>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 +++++++
> >> >>  1 file changed, 7 insertions(+)
> >> >>
> >> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/g=
pu/drm/i915/gem/i915_gem_dmabuf.c
> >> >> index 1adcd8e02d29..a45d0ec2c5b6 100644
> >> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >> >> @@ -12,6 +12,13 @@
> >> >>  #include "i915_gem_object.h"
> >> >>  #include "i915_scatterlist.h"
> >> >>
> >> >> +#if defined(CONFIG_X86)
> >> >> +#include <asm/smp.h>
> >> >> +#else
> >> >> +#define wbinvd_on_all_cpus() \
> >> >> +       pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func=
__)
> >> >> +#endif
> >> >> +
> >> >>  I915_SELFTEST_DECLARE(static bool force_different_devices;)
> >> >>
> >> >>  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *=
buf)
> >> >> --
> >> >> 2.26.3
> >> >>
> >>
> >> --
> >> Jani Nikula, Intel Open Source Graphics Center
>
> --
> Jani Nikula, Intel Open Source Graphics Center
