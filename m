Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4E402DB6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CF56E09C;
	Tue,  7 Sep 2021 17:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B743E6E08E;
 Tue,  7 Sep 2021 17:27:13 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id o124so7403vsc.6;
 Tue, 07 Sep 2021 10:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LC0TnzBIm7kldlTZWFwbiNFGUzVHexmW80QmHFbf/JU=;
 b=ieHN2db3PcG2jtfXnwvh5b+FuSokYOFRS4Bi5bNwo/Z73PjPuSJEFj4ZLW7XIknwuC
 TiTmzJrjhhRJ5OJCtt/7v5DCkahiBnjQJKRMb3ALmxd3D060+9+SM4SJdR1DSg/3fFfj
 mmGXn6SyYYiLLaFdYzGcPjUQB5Qu/M0R8Wj7Yj15g9AlGxEGf0vw568pD3pSmbpW1Roa
 3axeG1NxT+h01zgukfg/Bq4TvnnvxRf7SOgzBtAoVp/4F/tyiymCy1+ogrQ+uyKijiaa
 nQJ9rDDl46PTGRJbXnqhRfQzDiWfRVs3goMpzDvb4A2e/3MdLX0AtE1PQOZSVe8rhshR
 VQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LC0TnzBIm7kldlTZWFwbiNFGUzVHexmW80QmHFbf/JU=;
 b=EqyJMR2PF5O2ZXerxgLH5535X7yRqO/w1JzW8SkVmHpLXgy425S+UZJr40TEKC/Uin
 QrU37hgVrjJyquR++KAsKvzHsCDLyWq4qApzd7HlFrQuUkKRxhsyrbflVxjO2oEMPMsa
 YAY2KIiaw0tjADDISFBQUNRudxWdnGehDoobIUE0OCPsM0Un13apfWTAfEMt96bbVY5t
 iR6p4BJ9zmRQfuRJgYj9N13M9UEQELt0r/GoBX+pIwFoZN4bJMfYNTG+ioIqU9jgD6bR
 XVUaLRzqtD4T2Yl+c2Z+aSynfJQYZIuCOTIKCWjHensR0WcSMKqCZdxXdTxilvcZ0tTA
 PUOw==
X-Gm-Message-State: AOAM530KuxfCyfGZeoDndsojQs0/qkwSAYG9qX98p+iRWV5nEF2HrVM1
 kUsyAgeA93nCOEyERL1asBYZJF4S9L4swUu7yVw=
X-Google-Smtp-Source: ABdhPJzw9KOkfNVmNb05rNdw1aVHB0qlmxd5gveD+2sJgFMYTfpkNnRkyVTydMqT9KrWCacjCgcqkNXw7ntoGqAT19Q=
X-Received: by 2002:a67:d098:: with SMTP id s24mr9651450vsi.23.1631035632569; 
 Tue, 07 Sep 2021 10:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-4-jim.cromie@gmail.com>
 <9fe5e962-e65e-6844-269a-058cce944a89@linux.intel.com>
 <CAJfuBxz+cZyyDSBrDR0+Rf7K9fqpmeAfcWb1x2MkwD0P9LuDcQ@mail.gmail.com>
 <2bfbd75c-8f7f-e756-05c3-13dff41264e4@linux.intel.com>
 <CAJfuBxymoFx79kQzGw_Gxv1vk7kVaTN-V0Hn694C6kT=kP7u2A@mail.gmail.com>
 <92c7639b-c8f4-cfa4-f9ca-82c0a06e0337@linux.intel.com>
In-Reply-To: <92c7639b-c8f4-cfa4-f9ca-82c0a06e0337@linux.intel.com>
From: jim.cromie@gmail.com
Date: Tue, 7 Sep 2021 11:26:46 -0600
Message-ID: <CAJfuBxxeG0-bijXvoExRyh6Zv5o8PSz42cWam6m0aVCUKPMZ+Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 3/8] i915/gvt: use
 DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:" etc categories
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Sean Paul <seanpaul@chromium.org>, Jason Baron <jbaron@akamai.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
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

On Tue, Sep 7, 2021 at 9:14 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 06/09/2021 18:41, jim.cromie@gmail.com wrote:
> > On Mon, Sep 6, 2021 at 6:26 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com <mailto:tvrtko.ursulin@linux.intel.com>>
> > wrote:
> >  >
> >  >
> >  > On 03/09/2021 20:22, jim.cromie@gmail.com
> > <mailto:jim.cromie@gmail.com> wrote:
> >  > > On Fri, Sep 3, 2021 at 5:07 AM Tvrtko Ursulin
> >  > > <tvrtko.ursulin@linux.intel.com
> > <mailto:tvrtko.ursulin@linux.intel.com>> wrote:
> >  > >>
> >  > >>
> >  > >> On 31/08/2021 21:21, Jim Cromie wrote:
> >  > >>> The gvt component of this driver has ~120 pr_debugs, in 9 categories
> >  > >>> quite similar to those in DRM.  Following the interface model of
> >  > >>> drm.debug, add a parameter to map bits to these categorizations.
> >  > >>>
> >  > >>> DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> >  > >>>        "dyndbg bitmap desc",
> >  > >>>        { "gvt:cmd: ",  "command processing" },
> >
> >  > >>> v7:
> >  > >>> . move ccflags addition up to i915/Makefile from i915/gvt
> >  > >>> ---
> >  > >>>    drivers/gpu/drm/i915/Makefile      |  4 ++++
> >  > >>>    drivers/gpu/drm/i915/i915_params.c | 35
> > ++++++++++++++++++++++++++++++
> >  > >>
> >  > >> Can this work if put under gvt/ or at least intel_gvt.h|c?
> >
> > I tried this.
> > I moved the code block into gvt/debug.c (new file)
> > added it to Makefile GVT_SOURCES
> > dunno why it wont make.
> > frustratig basic err, Im not seeing.
> > It does seem proper placement, will resolve...
> >
> >
> >  > >>
> >  > >
> >  > > I thought it belonged here more, at least according to the name of the
> >  > > config.var
> >  >
> >  > Hmm bear with me please - the categories this patch creates are intended
> >  > to be used explicitly from the GVT "sub-module", or they somehow even
> >  > get automatically used with no further intervention to callers required?
> >  >
> >
> > 2009 - v5.9.0  the only users were admins reading/echoing
> > /proc/dynamic_debug/control
> > presumably cuz they wanted more info in the logs, episodically.
> > v5.9.0 exported dynamic_debug_exec_queries for in-kernel use,
> > reusing the stringy: echo $query_command > control  idiom.
> > My intention was to let in-kernel users roll their own drm.debug type
> > interface,
> > or whatever else they needed.  nobodys using it yet.
>
> What is 2009 referring to?
>
> I am still not quite following. In case of the GVT categories you added,
> in order for them to be used, would you or not also need to use some new
> logging macros?
>
> > patch 1/8 implements that drm.debug interface.
> > 5/8 is the primary use case
> > 3/8 (this patch) & 4/8 are patches of opportunity, test cases, proof of
> > function/utility.
> > its value as such is easier control of those pr-debugs than given by
> > echo > control
> >
> > Sean Paul seanpaul@chromium.org <mailto:seanpaul@chromium.org> worked up
> > a patchset to do runtime steering of drm-debug stream,
> > in particular watching for drm:atomic:fail: type activity (a subcategory
> > which doesnt exist yet).
> > 5/8 conflicts with his patchset, I have an rfc approach to that, so his
> > concerns are mine too.
>
> What kind of runtime steering is that - would you happen to have a link?

Sean's patches
https://patchwork.freedesktop.org/series/78133/

what I think might work better
https://lore.kernel.org/dri-devel/20210822222009.2035788-11-jim.cromie@gmail.com/

> One idea we in the GEM team have mentioned a few time is the ability of
> making the debug log stream per DRM client. That means opening
> "something" (socket, fd, etc), enabling debug, which would only show
> debug logs belonging to one client. That can sometimes be useful (and
> more secure) than enabling a lot of debug for the system as a whole. But
> of course there isn't much overlap with your dyndbg work. So just
> mentioning this since the word "runtime steering" reminded me of it.
>

my rfc patch above might help. it adds
   register_dyndbg_tracer ( selector_query, handler_callback)

I think you could write a single handler to further select / steer the
debug stream
according to your pr_debug arguments.


>
> >      > unsigned long __gvt_debug;
> >      > EXPORT_SYMBOL(__gvt_debug);
> >      >
> >      >
> >      >>> +
> >      >>>    # Please keep these build lists sorted!
> >      >>>
> >      >>>    # core driver code
> >      >>> diff --git a/drivers/gpu/drm/i915/i915_params.c
> >     b/drivers/gpu/drm/i915/i915_params.c
> >      >>> index e07f4cfea63a..e645e149485e 100644
> >      >>> --- a/drivers/gpu/drm/i915/i915_params.c
> >      >>> +++ b/drivers/gpu/drm/i915/i915_params.c
> >      >>> @@ -265,3 +265,38 @@ void i915_params_free(struct i915_params
> >     *params)
> >      >>> +                             _DD_cat_("gvt:mmio:"),
> >      >>> +                             _DD_cat_("gvt:render:"),
> >      >>> +                             _DD_cat_("gvt:sched:"));
> >      >>> +
> >      >>> +#endif
> >      >>
> >      >> So just the foundation - no actual use sites I mean? How would
> >     these be
> >      >> used from the code?
> >      >>
> >      >
> >      > there are 120 pr_debug "users" :-)
> >      >
> >      > no users per se, but anyone using drm.debug
> >      > /sys/module/drm/parameters/debug
> >      > might use this too.
> >      > its a bit easier than composing queries for
> >      >/proc/dyamic_debug/control
> >
> >     Same as my previous question, perhaps I am not up to speed with this
> >     yet.. Even if pr_debug is used inside GVT - are the categories and
> >     debug_gvt global as of this patch (or series)?
> >
> >
> > they are already global in the sense that if kernel is built with
> > DYNAMIC_DEBUG,
> > the admin can turn those pr_debugs on and off, and change their
> > decorations in the log (mod,func.line).
> > Nor are modules protected from each other; drm-core could use
> > dd-exec-queries to enable/disable
> > pr-debugs in i915 etc
> >
> > This patch just adds a gvt-debug knob like drm-debug. using the existing
> > format prefixes to categorize them.
> > Whether those prefixes should be bent towards consistency with the rest
> > of drm-debug
> > or adapted towards some gvt community need I couldnt say.
> >
> > Its no save-the-world feature, but its pretty cheap.
> >
> > Id expect the same users as those who play with drm.debug, for similar
> > reasons.
> >
> > does this clarify ?
>
> Not yet I'm afraid. :)

heh - 2 blind dudes describing their side of the elephant !

When you say "using the existing format
> prefixes", but it is not using __drm_debug but __gvt_debug (which isn't
> a modparam). So I am lost as to what is __gvt_debug for and how does it
> tie to existing DRM categories.
>

we have 2 kinds of "categories":
1- proper drm categories - one of 10
2- ad-hoc categories - these are systematized - using small set of
format-prefixes
i915 has 120 of these in GVT, with 9 different prefixes, touched in patches 2,3
i915 also has ~1500 uses of drm-debug API  (with proper drm category enums)
amdgpu also has lots of both kinds of debug; 13 kinds of prefixes.

Ive probably created some confusion by stealing the "category" name,
it could have been "class", but I thought we didnt need new vocabulary with
subtle and ambiguous differences from the original term.

Long term, maybe those ad-hoc prefixes can be aligned better with proper drm
categories, but thats a separate discussion.

But we can control them now, using a well oiled idiom, a drm.debug
"style" bitmap.
Its like drm.debug's little sisters, __gvt_debug & __debug_dc.  not
identical, but related.

Anyway, patches 2,3,4 work the ad-hoc prefix categorizations so theyre
controllable.

5/8 adapts DRM-debug itself - obsoleting enum category for most of drm-debug api
this is where dyndbg's data table gets bigger - core & drivers! have
many drm-debug uses,
rivaling all builtin prdebugs in size.

Then, we have a unified foundation on dyndbg, using glorified prefix strings
for both formal DRM_DBG_CAT_* categories, and for similar existing uses.

Then we could evolve / extend / bikeshed the categories (spelling,
separator char '.' is nice too)

Sean has already suggested "drm:atomic:fail:" sub-category.
I agree - it is using the new stringy flexibility to significant
expressive benefit.
dyndbg makes new categories actionable.

istm "*:fail:" is maybe a meta-sub-category (dont read that too closely;)
maybe "*:warn:" "*:err:" ( what about warning, error ? here lies
bikeshed madness !!)

> Regards,
>
> Tvrtko

thanks
JIm
