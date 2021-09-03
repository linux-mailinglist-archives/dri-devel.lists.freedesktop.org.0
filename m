Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861BD4005C7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 21:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F136E8D3;
	Fri,  3 Sep 2021 19:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A096E8D3;
 Fri,  3 Sep 2021 19:22:46 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id u1so184032vsq.10;
 Fri, 03 Sep 2021 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MdMXgAi9xhJwsQRjrZfawPYCwx2RDb+dIjCSNtGUvMY=;
 b=eRN7yapVLK9w0fTrKsOyuiL9ebnqz8i3ECnJpUPuFrJ3o34wrGJDXLLjvLGCusaaTF
 svGKU/62fC5Zm2uqiy7Gq2ciKhqmOguTZ9FEkM5mo7jRj243b9S7FqxD2SVsj2Afxq+H
 8mBXAdpz40WYkdoZvSMISp7sOv8pbaSUTfWJZ3an0fJEkPJK6gCxMzkeQE9xeZUYKMCD
 QSk49iiJyshVJXVZTl89B/B+Th2Rq/jsW+uaN8kobzX39AqQ4uJxZMfCh3cVWJnAuKZN
 L8O9SwyFxwcPYX+rs7/TjTl6PtxzSuSEHL24cKcIJeBWRPOO6m3840HNeZQ2vBSva3Wt
 gvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MdMXgAi9xhJwsQRjrZfawPYCwx2RDb+dIjCSNtGUvMY=;
 b=B1uftDNyGENAzlt4xmJ0RI02yBz2LNptZik84baVJXzPkc6cB+O+a06G2q4AMRdMxB
 Cv8C2dhyoivw9bYL45yx4l30wQei9DbsHcFZ181ig4T2Jew80qvuWX37DqfzUzIJzlgV
 n9kM4Gd4pr5/nPVmKgWlRah+VBNmovYBkOvfO1mdGhCaejRILDv8dQQg8xMaNwb/q0LE
 YBPHyQ55eSyTuUfGG7j064bnnDcbwFO3Gfzmb4RKN8ByJosL7KZXELrFSr6C+lgr6wXA
 VwxIyHh6vUXLFtQEwrnuXklKDali0uttCfff71oYnNn1me3tS1e7BSYXm94p1UAGXHtu
 4V8Q==
X-Gm-Message-State: AOAM533891Kh831SPDhrfynFS8bmYqy4Dqyj+HBqcGRpXFNaJ4X94HaB
 DYCyRSEwu83F20Np8c0pO1W7WXXgL1vgsObZ8zI=
X-Google-Smtp-Source: ABdhPJyQhdlOGNgq/F67sNH2Ya6oqz77IfwN3oOH0tdgX3ely67VRTOYdk1XXyJBjQA9XVI9iCsDo6AHhdLYWYjHmdc=
X-Received: by 2002:a67:401:: with SMTP id 1mr508836vse.48.1630696965751; Fri,
 03 Sep 2021 12:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-4-jim.cromie@gmail.com>
 <9fe5e962-e65e-6844-269a-058cce944a89@linux.intel.com>
In-Reply-To: <9fe5e962-e65e-6844-269a-058cce944a89@linux.intel.com>
From: jim.cromie@gmail.com
Date: Fri, 3 Sep 2021 13:22:19 -0600
Message-ID: <CAJfuBxz+cZyyDSBrDR0+Rf7K9fqpmeAfcWb1x2MkwD0P9LuDcQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 3/8] i915/gvt: use
 DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:" etc categories
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jason Baron <jbaron@akamai.com>, Greg KH <gregkh@linuxfoundation.org>, 
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 3, 2021 at 5:07 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 31/08/2021 21:21, Jim Cromie wrote:
> > The gvt component of this driver has ~120 pr_debugs, in 9 categories
> > quite similar to those in DRM.  Following the interface model of
> > drm.debug, add a parameter to map bits to these categorizations.
> >
> > DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> >       "dyndbg bitmap desc",
> >       { "gvt:cmd: ",  "command processing" },
> >       { "gvt:core: ", "core help" },
> >       { "gvt:dpy: ",  "display help" },
> >       { "gvt:el: ",   "help" },
> >       { "gvt:irq: ",  "help" },
> >       { "gvt:mm: ",   "help" },
> >       { "gvt:mmio: ", "help" },
> >       { "gvt:render: ", "help" },
> >       { "gvt:sched: " "help" });
> >

BTW, Ive dropped the help field, its already handled, dont need to clutter.


> > The actual patch has a few details different, cmd_help() macro emits
> > the initialization construct.
> >
> > if CONFIG_DRM_USE_DYNAMIC_DEBUG, then -DDYNAMIC_DEBUG_MODULE is added
> > cflags, by gvt/Makefile.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > v5:
> > . static decl of vector of bit->class descriptors - Emil.V
> > . relocate gvt-makefile chunk from elsewhere
> > v7:
> > . move ccflags addition up to i915/Makefile from i915/gvt
> > ---
> >   drivers/gpu/drm/i915/Makefile      |  4 ++++
> >   drivers/gpu/drm/i915/i915_params.c | 35 ++++++++++++++++++++++++++++++
>
> Can this work if put under gvt/ or at least intel_gvt.h|c?
>

I thought it belonged here more, at least according to the name of the
config.var

CONFIG_DRM_USE_DYNAMIC_DEBUG.

I suppose its not a great name, its narrow purpose is to swap
drm-debug api to use dyndbg.   drm-evrything already "uses"
dyndbg if CONFIG_DYNAMIC_DEBUG=y, those gvt/pr_debugs in particular.

Theres also CONFIG_DYNAMIC_DEBUG_CORE=y,
which drm basically ignores currently.

So with the name CONFIG_DRM_USE_DYNAMIC_DEBUG
it seemed proper to arrange for that  to be true on DD-CORE=y builds,
by adding -DDYNAMIC_DEBUG_MODULE

Does that make some sense ?
How to best resolve the frictions ?
new CONFIG names ?

> >   2 files changed, 39 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > index 4f22cac1c49b..5a4e371a3ec2 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -30,6 +30,10 @@ CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> >
> >   subdir-ccflags-y += -I$(srctree)/$(src)
> >
> > +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
> > +ccflags-y += -DDYNAMIC_DEBUG_MODULE
> > +#endif
>
> Ignores whether CONFIG_DRM_I915_GVT is enabled or not?
>

not intentionally.
I think theres 2 things youre noting:

1 - make frag into gvt/Makefile
I had it there earlier, not sure why I moved it up.
maybe some confusion on proper scope of the flag.


2 - move new declaration code in i915-param.c inside the gvt ifdef

Im good with that.
I'll probably copy the ifdef wrapper down rather than move the decl up.
ie:

#if __and(IS_ENABLED(CONFIG_DRM_I915_GVT),
  IS_ENABLED(CONFIG_DRM_USE_DYNAMIC_DEBUG))

unsigned long __gvt_debug;
EXPORT_SYMBOL(__gvt_debug);


> > +
> >   # Please keep these build lists sorted!
> >
> >   # core driver code
> > diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> > index e07f4cfea63a..e645e149485e 100644
> > --- a/drivers/gpu/drm/i915/i915_params.c
> > +++ b/drivers/gpu/drm/i915/i915_params.c
> > @@ -265,3 +265,38 @@ void i915_params_free(struct i915_params *params)
> >       I915_PARAMS_FOR_EACH(FREE);
> >   #undef FREE
> >   }
> > +
> > +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
> > +/* todo: needs DYNAMIC_DEBUG_MODULE in some cases */
> > +
> > +unsigned long __gvt_debug;
> > +EXPORT_SYMBOL(__gvt_debug);
> > +
> > +#define _help(key)   "\t    \"" key "\"\t: help for " key "\n"
> > +
> > +#define I915_GVT_CATEGORIES(name) \
> > +     " Enable debug output via /sys/module/i915/parameters/" #name   \
> > +     ", where each bit enables a debug category.\n"                  \
> > +     _help("gvt:cmd:")                                               \
> > +     _help("gvt:core:")                                              \
> > +     _help("gvt:dpy:")                                               \
> > +     _help("gvt:el:")                                                \
> > +     _help("gvt:irq:")                                               \
> > +     _help("gvt:mm:")                                                \
> > +     _help("gvt:mmio:")                                              \
> > +     _help("gvt:render:")                                            \
> > +     _help("gvt:sched:")
> > +
> > +DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> > +                             I915_GVT_CATEGORIES(debug_gvt),
> > +                             _DD_cat_("gvt:cmd:"),
> > +                             _DD_cat_("gvt:core:"),
> > +                             _DD_cat_("gvt:dpy:"),
> > +                             _DD_cat_("gvt:el:"),
> > +                             _DD_cat_("gvt:irq:"),
> > +                             _DD_cat_("gvt:mm:"),
> > +                             _DD_cat_("gvt:mmio:"),
> > +                             _DD_cat_("gvt:render:"),
> > +                             _DD_cat_("gvt:sched:"));
> > +
> > +#endif
>
> So just the foundation - no actual use sites I mean? How would these be
> used from the code?
>

there are 120 pr_debug "users" :-)

no users per se, but anyone using drm.debug
/sys/module/drm/parameters/debug
might use this too.
its a bit easier than composing queries for >/proc/dyamic_debug/control




> Regards,
>
> Tvrtko
