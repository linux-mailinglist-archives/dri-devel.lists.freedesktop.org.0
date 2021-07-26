Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FE3D6693
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 20:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BEB6E98A;
	Mon, 26 Jul 2021 18:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E87F6E98A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 18:17:39 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id a93so16390628ybi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aitowXo2IU5kLwH3N7yRIyYuYE+oRRHIn2zaTk41DCs=;
 b=Sw2WAgXIDYEVnXkPBncqIvjMo2lnYBXMj9RKoDtvStPp/fPrliWruCmrZaL1PcgfBj
 XKveqlXupTEC22M+tL5rTIqQOuccTvCxLqEimaf8o2YK06xHeH00IijNCjq1lfOa7llw
 BffU7C2Z5lz9xoGAZfuLzUyKvvlQ4NqL4HqIDs5LmwLGmwEPL6R/VMn3FobbC8HifU8o
 h79/sq5VllE90cEKvbY+X1zFBx5Avb0d2XAsziU2xTjm/zNdCxuX85r4Jb34rtA+JGhB
 m5aCy4QLUc8Dr7QZ6VwVJF/hbGzRJhtCmvtpqD+sad8NQen3C6NntSsF/p+5N5NzITy3
 Ln0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aitowXo2IU5kLwH3N7yRIyYuYE+oRRHIn2zaTk41DCs=;
 b=oz6iK6K3uUhyOgPegg5uZPjsYmSmFh1fY/mK50JsPxWsZEehMpC8IZiblklquoYAx9
 NHu7u5mBZ63TvtJVX8U6qSFJ0o7hxWY+qos9VEwxLIWubtBkTrvSsorSXRVmaVhJnncr
 YjAfCMaalsTSili/NBkBhJd16faudAJ3yuv3i3MFcefXCqeLoQYvJ+o91wV5Fa8uMpak
 j++pYG8oupOjHVJuKOsN8GfH8GF9V3Xo21rSPtWyWZwFRyW1qRZkZKhFNBa2UbgJFBxd
 7qYJW+s79kymu41LugzkR6RahTWyXpmphWeo1GWKrZPBEkZe0zkS0VIW+nAMmwzapxrm
 VnjA==
X-Gm-Message-State: AOAM531yPfte5jyPvMfYYCMnvaa6Ig6jYkYc+Ad3gJV//CA6KreK/3Cz
 0bP/qLHFDYBCP5WpoigK5XLTnNqhBp0gJ2h6ukUGsw==
X-Google-Smtp-Source: ABdhPJw0Y74439Fl3IcsZlcYFcwsavuxEmaOLZ2KYSxqevhrTTPo44yUcRuCeJGc/UL0XUM/MDkva2OFShCx7PGIIJ0=
X-Received: by 2002:a25:d841:: with SMTP id p62mr3936305ybg.180.1627323458326; 
 Mon, 26 Jul 2021 11:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-4-daniel.vetter@ffwll.ch>
 <0edb5c4d-1faf-4b24-a21d-fd2e5be6591d@linux.intel.com>
 <CAOFGe96Da_O7VBaw85LsNTfMZhb2ycVg3WJ0fFe6xekB0m2NnA@mail.gmail.com>
 <CAOFGe96OBK3W_c8YU=4LHysumEOm3Y27KX_Mok=P686aa3c0Bw@mail.gmail.com>
 <031997ab-5568-9dbd-fcee-b4f820a32632@linux.intel.com>
 <CAOFGe95G3bYWxZ_EwPEFzxf10vf1T3Zdyez_fbh=imcDj+TSHw@mail.gmail.com>
 <87291107-0690-9804-08a3-309c23176f23@linux.intel.com>
In-Reply-To: <87291107-0690-9804-08a3-309c23176f23@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 13:17:27 -0500
Message-ID: <CAOFGe96KwQe5-GuJ5Yc3w0X0F+EK5r2-dCne8-WqUD6qo=zOHw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 04/10] drm/i915: move intel_context slab to
 direct module init/exit
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Jul 26, 2021 at 11:31 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 26/07/2021 17:20, Jason Ekstrand wrote:
> > On Mon, Jul 26, 2021 at 11:08 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >> On 26/07/2021 16:42, Jason Ekstrand wrote:
> >>> On Mon, Jul 26, 2021 at 10:30 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >>>>
> >>>> On Mon, Jul 26, 2021 at 3:35 AM Tvrtko Ursulin
> >>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>
> >>>>>
> >>>>> On 23/07/2021 20:29, Daniel Vetter wrote:
> >>>>>> With the global kmem_cache shrink infrastructure gone there's nothing
> >>>>>> special and we can convert them over.
> >>>>>>
> >>>>>> I'm doing this split up into each patch because there's quite a bit of
> >>>>>> noise with removing the static global.slab_ce to just a
> >>>>>> slab_ce.
> >>>>>>
> >>>>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
> >>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/i915/gt/intel_context.c | 25 ++++++++-----------------
> >>>>>>     drivers/gpu/drm/i915/gt/intel_context.h |  3 +++
> >>>>>>     drivers/gpu/drm/i915/i915_globals.c     |  2 --
> >>>>>>     drivers/gpu/drm/i915/i915_globals.h     |  1 -
> >>>>>>     drivers/gpu/drm/i915/i915_pci.c         |  2 ++
> >>>>>>     5 files changed, 13 insertions(+), 20 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> >>>>>> index baa05fddd690..283382549a6f 100644
> >>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> >>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> >>>>>> @@ -7,7 +7,6 @@
> >>>>>>     #include "gem/i915_gem_pm.h"
> >>>>>>
> >>>>>>     #include "i915_drv.h"
> >>>>>> -#include "i915_globals.h"
> >>>>>>     #include "i915_trace.h"
> >>>>>>
> >>>>>>     #include "intel_context.h"
> >>>>>> @@ -15,14 +14,11 @@
> >>>>>>     #include "intel_engine_pm.h"
> >>>>>>     #include "intel_ring.h"
> >>>>>>
> >>>>>> -static struct i915_global_context {
> >>>>>> -     struct i915_global base;
> >>>>>> -     struct kmem_cache *slab_ce;
> >>>>>> -} global;
> >>>>>> +struct kmem_cache *slab_ce;
> >>>>
> >>>> Static?  With that,
> >>>>
> >>>> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> >>>>
> >>>>>>
> >>>>>>     static struct intel_context *intel_context_alloc(void)
> >>>>>>     {
> >>>>>> -     return kmem_cache_zalloc(global.slab_ce, GFP_KERNEL);
> >>>>>> +     return kmem_cache_zalloc(slab_ce, GFP_KERNEL);
> >>>>>>     }
> >>>>>>
> >>>>>>     static void rcu_context_free(struct rcu_head *rcu)
> >>>>>> @@ -30,7 +26,7 @@ static void rcu_context_free(struct rcu_head *rcu)
> >>>>>>         struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
> >>>>>>
> >>>>>>         trace_intel_context_free(ce);
> >>>>>> -     kmem_cache_free(global.slab_ce, ce);
> >>>>>> +     kmem_cache_free(slab_ce, ce);
> >>>>>>     }
> >>>>>>
> >>>>>>     void intel_context_free(struct intel_context *ce)
> >>>>>> @@ -410,22 +406,17 @@ void intel_context_fini(struct intel_context *ce)
> >>>>>>         i915_active_fini(&ce->active);
> >>>>>>     }
> >>>>>>
> >>>>>> -static void i915_global_context_exit(void)
> >>>>>> +void i915_context_module_exit(void)
> >>>>>>     {
> >>>>>> -     kmem_cache_destroy(global.slab_ce);
> >>>>>> +     kmem_cache_destroy(slab_ce);
> >>>>>>     }
> >>>>>>
> >>>>>> -static struct i915_global_context global = { {
> >>>>>> -     .exit = i915_global_context_exit,
> >>>>>> -} };
> >>>>>> -
> >>>>>> -int __init i915_global_context_init(void)
> >>>>>> +int __init i915_context_module_init(void)
> >>>>>>     {
> >>>>>> -     global.slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
> >>>>>> -     if (!global.slab_ce)
> >>>>>> +     slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
> >>>>>> +     if (!slab_ce)
> >>>>>>                 return -ENOMEM;
> >>>>>>
> >>>>>> -     i915_global_register(&global.base);
> >>>>>>         return 0;
> >>>>>>     }
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> >>>>>> index 974ef85320c2..a0ca82e3c40d 100644
> >>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> >>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> >>>>>> @@ -30,6 +30,9 @@ void intel_context_init(struct intel_context *ce,
> >>>>>>                         struct intel_engine_cs *engine);
> >>>>>>     void intel_context_fini(struct intel_context *ce);
> >>>>>>
> >>>>>> +void i915_context_module_exit(void);
> >>>>>> +int i915_context_module_init(void);
> >>>>>> +
> >>>>>>     struct intel_context *
> >>>>>>     intel_context_create(struct intel_engine_cs *engine);
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> >>>>>> index 3de7cf22ec76..d36eb7dc40aa 100644
> >>>>>> --- a/drivers/gpu/drm/i915/i915_globals.c
> >>>>>> +++ b/drivers/gpu/drm/i915/i915_globals.c
> >>>>>> @@ -7,7 +7,6 @@
> >>>>>>     #include <linux/slab.h>
> >>>>>>     #include <linux/workqueue.h>
> >>>>>>
> >>>>>> -#include "gem/i915_gem_context.h"
> >>>>>>     #include "gem/i915_gem_object.h"
> >>>>>>     #include "i915_globals.h"
> >>>>>>     #include "i915_request.h"
> >>>>>> @@ -32,7 +31,6 @@ static void __i915_globals_cleanup(void)
> >>>>>>     }
> >>>>>>
> >>>>>>     static __initconst int (* const initfn[])(void) = {
> >>>>>> -     i915_global_context_init,
> >>>>>>         i915_global_gem_context_init,
> >>>>>>         i915_global_objects_init,
> >>>>>>         i915_global_request_init,
> >>>>>> diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
> >>>>>> index d80901ba75e3..60daa738a188 100644
> >>>>>> --- a/drivers/gpu/drm/i915/i915_globals.h
> >>>>>> +++ b/drivers/gpu/drm/i915/i915_globals.h
> >>>>>> @@ -23,7 +23,6 @@ int i915_globals_init(void);
> >>>>>>     void i915_globals_exit(void);
> >>>>>>
> >>>>>>     /* constructors */
> >>>>>> -int i915_global_context_init(void);
> >>>>>>     int i915_global_gem_context_init(void);
> >>>>>>     int i915_global_objects_init(void);
> >>>>>>     int i915_global_request_init(void);
> >>>>>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> >>>>>> index f9527269e30a..266618157775 100644
> >>>>>> --- a/drivers/gpu/drm/i915/i915_pci.c
> >>>>>> +++ b/drivers/gpu/drm/i915/i915_pci.c
> >>>>>> @@ -33,6 +33,7 @@
> >>>>>>     #include "i915_active.h"
> >>>>>>     #include "i915_buddy.h"
> >>>>>>     #include "i915_drv.h"
> >>>>>> +#include "gem/i915_gem_context.h"
> >>>>>
> >>>>> It's a bit ugly to go to a design where i915_pci.c has to include so
> >>>>> many random parts of i915. IMO for a complex driver like i915,
> >>>>> compartmentalizing so much knowledge about the internals was better
> >>>>> inside the globals layer.
> >>>>
> >>>> I agree that i915_pci feels like the wrong place to put this but I
> >>>> don't think that's so much because globals don't belong in i915_pci
> >>>> but because i915_init/exit don't belong there.  Maybe, once this is
> >>>> all said and done (or at the start of the series), we should move
> >>>> i915_init/exit to i915_drv.c?  Of course, there's a bunch of PCI
> >>>> probing stuff in i915_drv.c so..... yeah.... our organization is
> >>>> pretty busted.
> >>>
> >>> To put a finer point on this, the new "design" is really to have a
> >>> single flat list instead of two, one nested inside the other.  There's
> >>> nothing wrong with that at all.  The fact that all this stuff now
> >>> lives in i915_pci.c is ugly.  But, as I said, that's kind-of an
> >>> accident of history because that's where i915_init() and i915_exit()
> >>> currently live.  We should just move the lot to i915_drv.c.
> >>
> >> Hmm.. on one hand it does sounds better to move to i915_drv.c, but is it
> >> just because all these new include directive are so visibly out of place
> >> in i915_pci.c?
> >>
> >> Perhaps we need i915_module.c and then i915_globals is a completely fine
> >> concept. Desired IMO even since we have to avoid globals in general
> >> (multi-gpu) so it sticks out nicely that all that is allowed to be
> >> global has a special place.
> >>
> >> And i915_drv.c can remain being about a driver instance as bound to one GPU.
> >
> > Is i915_drv.c about a single instance bound to a single GPU?  If so,
>
> Yep, all functions there either take drm_dev, pdev or dev_priv as
> argument, or return/initialize dev_priv.
>
> > then, yeah, maybe not the right place.  Maybe a i915_module.c would be
> > better.  It's all different shades of shed paint.
>
> Hm not really just different shades IMO. Because I argue the patch
> series as is is a retrograde step in the above discussed respect.
>
> I think i915_globals is cleaner code organisation. Because even if we
> add i915_module.c, then that can be made initialize globals and register
> with pci in cleanly separated steps without the need to include many
> driver internals.

Ok, so maybe I'm missing something in what you're saying.  I was under
the impression that your primary concern was separating PCI setup from
per-device from per-module stuff.  If so, moving it all to an
i915_module.c fixes that.

Are you arguing that a flat list of module init steps is bad?  And
that having globals be its own sub-list is good?  If so, then I have
to disagree.  I don't think splitting the calling of misc "set up my
slabs" functions from the final "register with PCI" at the end gains
us anything.  What it does do is give more files to search through,
more layers to think about when understanding the code, and more
infrastructure to maintain.

If, on the other hand, we had a globals infrastructure that actually
gained us something in terms of code simplicity, I might be able to
get behind that.  For instance, I could imagine something like this:

I915_DECL_SLAB(foo);

   /* Someone allocates something */
   kmem_cache_alloc(foo.slab);

where we somehow automagically declare the slab, initialize it on
module load, and tear it down on module exit.  That would add real
value.  As is, all i915_globals.c adds is extra layers.

--Jason


> I see r-b are accumulating but I hope reasonable objections will be
> considered.
>
> Regards,
>
> Tvrtko
>
> >
> > --Jason
> >
> >> That feels like the best of both worlds to me.
> >>
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>>
> >>>> --Jason
> >>>>
> >>>>> Maybe add a cover letter to explain the perceived pros and cons and
> >>>>> thinking in general?
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>> Tvrtko
> >>>>>
> >>>>>>     #include "i915_perf.h"
> >>>>>>     #include "i915_globals.h"
> >>>>>>     #include "i915_selftest.h"
> >>>>>> @@ -1297,6 +1298,7 @@ static const struct {
> >>>>>>         { i915_check_nomodeset, NULL },
> >>>>>>         { i915_active_module_init, i915_active_module_exit },
> >>>>>>         { i915_buddy_module_init, i915_buddy_module_exit },
> >>>>>> +     { i915_context_module_init, i915_context_module_exit },
> >>>>>>         { i915_globals_init, i915_globals_exit },
> >>>>>>         { i915_mock_selftests, NULL },
> >>>>>>         { i915_pmu_init, i915_pmu_exit },
> >>>>>>
> >>>>> _______________________________________________
> >>>>> Intel-gfx mailing list
> >>>>> Intel-gfx@lists.freedesktop.org
> >>>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
