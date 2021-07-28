Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD96B3D977A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 23:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0D96E0E9;
	Wed, 28 Jul 2021 21:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6130D6E0E8;
 Wed, 28 Jul 2021 21:22:34 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id 79so1653698uau.9;
 Wed, 28 Jul 2021 14:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pba/v/pyxUDOSp5lyoyUOTseU+hbcR6eHrbJSQhcDNo=;
 b=OX2Ll+qZEh8EzkHBpN58N6m5UZ7zpcB8pqdnelJW79ffuTnBWlvXeUKHD0K7fKWCtf
 fZIm4SxNkewzqyCLflb3lDl8zMw7VTftE2SF1Nv4a330tM4TcHu2mL9ksdAl0W4WErVQ
 0uiH9LW593kZ0JE5NRb8ospfzXBq0NqSWgDHaLYjx73FdgtFQr1q9RAfQje8KBf5tdgJ
 v0202XL7HIA0PpESTiqCJ0pVMPZ0begoP/2fVFV9UX7cNbBh4LjoFBo4NibdCOMfrjZ3
 qv1rxZ/NIVk3SHTdVF/1wBdQNrCxhtanL2aYeDs1eXaYS0Pp9dGUgB3t42ifEZtT+UPv
 zS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pba/v/pyxUDOSp5lyoyUOTseU+hbcR6eHrbJSQhcDNo=;
 b=HT1C14hpf6wrwMXBrX9vDDzjpQ7ZxECde5INJSVfZf4OclPsxB/JrfJIj1vKjecDSU
 2PolMTv7oQ7OzT3tieVfWANEuEu6XPyQcCSn2BR0E/hWQJfeZGpFHgkvnEWqpNTgblnC
 RYwPgh6qotw6+tpbIgGayGyWi0A5RI3b4PnIfqL7BnX3LEiQkdUl96NVZGkiEhCvcXOW
 Jghccx2VJGAE5q9cm0uskMSeDM+gn2xRRbb5oGqnAnCwSeMet5QT9kuhsrJMwhAMACcC
 xy821rRRqCjWRKq2B1mKvqu03D3FWokKqEgWs9lBzxPm9QGlOy3A2qxyfJC00CZuu1SI
 /2PA==
X-Gm-Message-State: AOAM530sltaFXXIDRW676qjKY8SV1wj1+td8S8nkkvnbrLwnLmJbaraf
 L59K4ekPhYGDf6+YKRQWlk1VvyJGrjm7RyflHJw=
X-Google-Smtp-Source: ABdhPJzAs0yzTvXgxxOSYq066tXaCYS7v0MJu/JjRrJc1rFT9MLivrodw5GzOitrZ6U79sZapq5zEdsxvZ2jG4UjJIY=
X-Received: by 2002:ab0:6dcb:: with SMTP id r11mr2267037uaf.128.1627507353294; 
 Wed, 28 Jul 2021 14:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210714175138.319514-1-jim.cromie@gmail.com>
 <20210714175138.319514-4-jim.cromie@gmail.com>
 <YPbPvm/xcBlTK1wq@phenom.ffwll.local> <20210722152009.GZ22946@art_vandelay>
 <CAMavQKJ-ULhqn8BiGu8iMEwXe9whLGVf5Y7D6dcYnwbn1b08cQ@mail.gmail.com>
In-Reply-To: <CAMavQKJ-ULhqn8BiGu8iMEwXe9whLGVf5Y7D6dcYnwbn1b08cQ@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Wed, 28 Jul 2021 17:22:07 -0400
Message-ID: <CAJfuBxxGg+b4ePkNXRz=OeUd4xQWSv8cJOV6XWRhy57hSx_ftA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 3/5] drm/print: RFC add choice to use
 dynamic debug in drm-debug
To: Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Baron <jbaron@akamai.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 10:03 AM Sean Paul <sean@poorly.run> wrote:
>
> On Thu, Jul 22, 2021 at 11:20 AM Sean Paul <sean@poorly.run> wrote:
> >
>
> Reply-all fail. Adding everyone else back to my response.
>
> > On Tue, Jul 20, 2021 at 03:29:34PM +0200, Daniel Vetter wrote:
> > > On Wed, Jul 14, 2021 at 11:51:36AM -0600, Jim Cromie wrote:
> > > > drm's debug system uses distinct categories of debug messages, encoded
> > > > in an enum (DRM_UT_<CATEGORY>), which are mapped to bits in drm.debug.
> > > > drm_debug_enabled() does a lot of unlikely bit-mask checks on
> > > > drm.debug; we can use dynamic debug instead, and get all that
> > > > static_key/jump_label goodness.
> >
> > Hi Jim,
> > Thanks for your patches! Daniel pointed me at them in response to my drm_trace
> > patchset (https://patchwork.freedesktop.org/series/78133/). I'd love to get your
> > input on it. I think the 2 sets are mostly compatible, we'd just need to keep
> > drm_dev_dbg and do the CONFIG check in the function beside the trace_enabled
> > checks.
> >
> > > >
> > > > Dynamic debug has no concept of category, but we can map the DRM_UT_*
> > > > to a set of distinct prefixes; "drm:core:", "drm:kms:" etc, and
> > > > prepend them to the given formats.
> > > >
> > > > Then we can use:
> > > >   `echo module drm format ^drm:core: +p > control`
> > > >
> > > > to enable every such "prefixed" pr_debug with one query.  This new
> > > > prefix changes pr_debug's output, so is user visible, but it seems
> > > > unlikely to cause trouble for log watchers; they're not relying on the
> > > > absence of class prefix strings.
> > > >
> > > > This conversion yields ~2100 new callsites on my i7/i915 laptop:
> > > >
> > > >   dyndbg: 195 debug prints in module drm_kms_helper
> > > >   dyndbg: 298 debug prints in module drm
> > > >   dyndbg: 1630 debug prints in module i915
> > > >
> > > > CONFIG_DRM_USE_DYNAMIC_DEBUG enables this, and is available if
> > > > CONFIG_DYNAMIC_DEBUG or CONFIG_DYNAMIC_DEBUG_CORE is chosen, and if
> > > > CONFIG_JUMP_LABEL is enabled; this because its required to get the
> > > > promised optimizations.
> > > >
> > > > The indirection/switchover is layered into the macro scheme:
> > > >
> > > > 0. A new callback on drm.debug which calls dynamic_debug_exec_queries
> > > >    to map those bits to specific query/commands
> > > >    dynamic_debug_exec_queries("format ^drm:kms: +p", "drm*");
> > > >    here for POC, this should be in dynamic_debug.c
> > > >    with a MODULE_PARAM_DEBUG_BITMAP(__drm_debug, { "prefix-1", "desc-1" }+)
> > >
> > > This is really awesome.
> >
> >
> > Agreed, this is a very clever way of merging the 2 worlds!
> >
> >
> > > For merging I think we need to discuss with dyn
> > > debug folks whether they're all ok with this, but it's exported already
> > > should should be fine.
> >
> > I wonder if this is a good time to reconsider our drm categories. IMO they're
> > overly broad and it's hard to get the right information without subscribing to
> > the firehose. It seems like dyndbg might be a good opportunity to unlock
> > subcategories of log messages.
> >
> > More concretely, on CrOS we can't subscribe to atomic or state categories since
> > they're too noisy. However if there was a "fail" subcategory which dumped
> > state/atomic logs on check failures, that would be really compelling. Something
> > like:
> >
> >         drm:atomic:fail vs. drm:atomic
> >

YES

> > Both would be picked up if (drm.debug & DRM_DBG_ATOMIC), however it would allow
> > dyndbg-aware clients to get better logs without having a huge table of
> > individual log signatures.
> >
> > I'm not sure how tightly we'd want to control the subcategories. It could be
> > strict like the categories spelled out in drm_print.h, or an open prefix arg to
> > drm_dev_dbg. I suspect we'd want the former, but would want to be careful to
> > provide enough flexibility to properly

formalizing categories and subcategories is where the
practical selectivity of format ^prefix is determined.

While endless bikeshedding is a possible downside,
there are a few subtleties to note,  so we can pick a harmonious 3-color scheme:

"drm:kms: " and "drm:kms:" are different  (2nd, w/o trailing space,
allows subcats)
"drm:kms"  is also different  (includes "drm:kmsmart", whatever that would be)
"drm.kms"  again.   dot names anyone ?

ASIDE(s):

"drm:kms"  and  "drm:kms*" are different,
the latter does not work as you might reasonably expect.
This is because

commit 578b1e0701af34f9ef69daabda4431f1e8501109
Author: Changbin Du <changbin.du@intel.com>
Date:   Thu Jan 23 15:54:14 2014 -0800

    dynamic_debug: add wildcard support to filter files/functions/modules

    Add wildcard '*'(matches zero or more characters) and '?' (matches one
    character) support when qurying debug flags.

specifically left format out of the wildcarded query terms.
And that was rational since the format search was already special
(floating substring, not exact match or basename match)
and format foobar  should work analogously to grep foobar, ie w/o wildcards.
while an implied "format *foobar*" is possible, I dont like the
regex-iness implied in that 1st '*'

(2)

dyndbg is extremely agnostic about prefixes used by authors/subsystems

"1:", "2:", "3:" is a lot like the original: void dev_printk(const
char *level, ..).
w/o the trailing colon, even more so (I will be checking what it does!)
"Lo:", "Mid:", "Hi:" was proposed in a patchset once, and is usable today.

some unification of explicit wildcard chars * & ? and format floating
substr seems practical,
with it, prefix matching could handle complicated error message regimes.
Specifically, http return codes like 100, 200, 400, 404 etc would work.

/ASIDE


In any case, lets not try to over-control the categories & optional
subcategories,
at least not with lots of structure. Afterall, only code review will
prevent something like:

   pr_debug("%s: blah blah\n", hex(sha1))
(queries on it are highly selective, but not organized)

IMO, its potentially useful to be able to add ad-hoc categories,
review and taste can moderate the ad-hockery,
"drm:misc:" seems a reasonable catch-all, esp with 3rd level
selectivity possible

Consider Sean's example: "drm:atomic:fail", and variations:

"drm:atomic:ok" - not as useful, unless we wanted a counter.
I dont think we need to rule it out.
to the extent that theres a traceable event here (success)
theres some utility to be able to put something of a label on it.

"drm:atomic:fail-%s"   - we could have a dictionary of reasons,
(with open dictionary, neologisms allowed, any reason not to?)


> >
> > Of course, none of this needs to be decided to land this initial support, it can
> > be bolted on later easily enough (I think).
> >

I think so too,  one such revisit...

Eventually, the "drm:" part of the prefix may become sufficiently unnecessary
that we could drop it in the name of log brevity.
The selectivity lost to "format ^prefix" is recovered by adding
"module drm*" or similar,
so somemod.foobar's use of pr_debug("atomic: blabla") would be excluded,

Or a flag-day, where we swap over to drm.dot.naming.
Doing so modestly improves the use of ':' for a log-entry field separator.
(though probably not a material improvement, structured logs are
better for this)
