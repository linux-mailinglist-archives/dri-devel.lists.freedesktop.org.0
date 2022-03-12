Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E324D6B96
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 02:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6633F10EACE;
	Sat, 12 Mar 2022 01:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732F810EACA;
 Sat, 12 Mar 2022 01:06:50 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id d64so11284416vsd.12;
 Fri, 11 Mar 2022 17:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkBzOD5kXamvl32ms4kNuI+lMMUv3cbsqxvCZOqs4ps=;
 b=ojap0oZIPxY16caJFWsB3W+x2rpzYqdSBOjbl/nXiNnEF0sL7/kEU7K2YklGWS1FC3
 c0T5kX8j+TGEJPhOTUAIYcYZzu9tYmyuPWZ87ANId/ieUPxZpyFyqpFi6Ot6NuW6Cxkn
 X3EFwq2ny2Skuh4Fi/LWmJG/Av2m143/ZBylzCH4e8WPx1Rn2VuvOhda3VTm4FJ+W257
 /rOO7GjUb7ciESKlWi4PRCc6oq5ZoMTPqAit5bEH/N4XOlHWC92IWEim4eZS8dAkUX1Y
 7FHBqiCUj3KUgiA/Z0ieP8R+yYPtyTJ1v5vaZe2bX5yNVz+gDOScjWaeaZgngzjQfxgH
 IdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkBzOD5kXamvl32ms4kNuI+lMMUv3cbsqxvCZOqs4ps=;
 b=dd3bODIwghZmraxyOAvBLHM/QW7huogIfnjUD6r/BdrtPpaHndlj96jjoBIb2Pn3d0
 FvKZTf2i3Kajb4fHFW6KSpcmeK5eIYmp4MxsbAbHm89rxBa/J0lVWve5CH9hj3QGJwAb
 4Fu+z6WwfWqzBiKw4+YGUIyU36ggkxNHDKMzBS4J6Ma20KUS3vOdvKm8CRwVEzamjGZy
 LYPwOYVmYrVquLhttrFv7bN62NYpuabqyZPG+oUVrN+IqlU6WzfiXLI/9DU8qFXQyOdj
 ca2axKHjI1ivHf/bJcN1unz8hOC4cssIy1gecRKP0RYBoT/LxYmoYB9VIpPzwndcc5eZ
 J3kw==
X-Gm-Message-State: AOAM531SOpS3YVQoRAUSdJjjr4AIyHevGBw2TlcQb/msUGTvnCbZ15W/
 VlNlV1quIoZcj8d0P0mDY9QGUn7MXvTFcP8Cscg=
X-Google-Smtp-Source: ABdhPJwGhvbonuC/P97c6nQlE0HGhOZ0fRC/TzjQb3cG3j9xkiatm+D8DXnO7llyil8SCj2NwuzGnTPiEMn+Xc00Ki4=
X-Received: by 2002:a05:6102:c02:b0:320:9e52:4856 with SMTP id
 x2-20020a0561020c0200b003209e524856mr6041498vss.20.1647047209151; Fri, 11 Mar
 2022 17:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20220311044756.425777-1-jim.cromie@gmail.com>
 <20220311044756.425777-3-jim.cromie@gmail.com>
 <823e51e6-2af4-7854-9428-697a2af12488@akamai.com>
In-Reply-To: <823e51e6-2af4-7854-9428-697a2af12488@akamai.com>
From: jim.cromie@gmail.com
Date: Fri, 11 Mar 2022 18:06:23 -0700
Message-ID: <CAJfuBxxVti_pa1YPmas=Ub28yWUFFGeR13wxveLvPCYS61NxuA@mail.gmail.com>
Subject: Re: [PATCH 2/5] dyndbg: add class_id field and query support
To: Jason Baron <jbaron@akamai.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Joe Perches <joe@perches.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 12:06 PM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 3/10/22 23:47, Jim Cromie wrote:
> > DRM defines/uses 10 enum drm_debug_category's to create exclusive
> > classes of debug messages.  To support this directly in dynamic-debug,
> > add the following:
> >
> > - struct _ddebug.class_id:4 - 4 bits is enough
> > - define _DPRINTK_SITE_UNCLASSED 15 - see below
> >
> > and the query support:
> > - struct _ddebug_query.class_id
> > - ddebug_parse_query  - looks for "class" keyword, then calls..
> > - parse_class         - accepts uint: 0-15, sets query.class_id and marker
> > - vpr_info_dq         - displays new field
> > - ddebug_proc_show    - append column with "cls:%d" if !UNCLASSED
> >
> > With the patch, one can enable current/unclassed callsites by:
> >
> >   #> echo drm class 15 +p > /proc/dynamic_debug/control
> >
>
> To me, this is hard to read, what the heck is '15'? I have to go look it
> up in the control file and it's not descriptive. I think that using
> classes/categories makes sense but I'm wondering if it can be a bit more
> user friendly? Perhaps, we can pass an array of strings that is indexed
> by the class id to each pr_debug() site that wants to use class. So
> something like:
>

Im not at all averse to nice names, but as something added on.

1st, the interface to make friendlier is DRM's

echo 0x04 > /sys/module/drm/parameters/debug   # which category ?

parm:           debug:Enable debug output, where each bit enables a
debug category.
Bit 0 (0x01)  will enable CORE messages (drm core code)
Bit 1 (0x02)  will enable DRIVER messages (drm controller code)
Bit 2 (0x04)  will enable KMS messages (modesetting code)

echo DRM_UT_DRIVER,DRM_UT_KMS > /sys/module/drm/parameters/debug   #
now its pretty clear

If that works, its cuz DEFINE_DYNAMIC_DEBUG_CLASSBITS()
plucks class symbols out of its __VA_ARGS__, and #stringifes them.
So that macro could then build the 1-per-module static constant string array
and (only) the callbacks would be able to use it.

from there, it shouldnt be hard to ref that from the module's ddebug_table,
so parse_query could validate class args against the module given (or
fail if none given)

Speaking strictly, theres a gap:
   echo module * class DRM_UT_KMS +p > control
is nonsense for * other than drm + drivers,
but its fair/safe to just disallow wildcards on modname for this purpose.

it does however imply that module foo must exist for FOO_CAT_1 to be usable.
thats not currently the case:
bash-5.1# echo module foo +p > /proc/dynamic_debug/control
[   15.403749] dyndbg: read 14 bytes from userspace
[   15.405413] dyndbg: query 0: "module foo +p" mod:*
[   15.406486] dyndbg: split into words: "module" "foo" "+p"
[   15.407070] dyndbg: op='+'
[   15.407388] dyndbg: flags=0x1
[   15.407809] dyndbg: *flagsp=0x1 *maskp=0xffffffff
[   15.408300] dyndbg: parsed: func="" file="" module="foo" format=""
lineno=0-0 class=15
[   15.409151] dyndbg: no matches for query
[   15.409591] dyndbg: no-match: func="" file="" module="foo"
format="" lineno=0-0 class=15
[   15.410524] dyndbg: processed 1 queries, with 0 matches, 0 errs
bash-5.1#

ISTM we can keep that "0 errs" response for that case, but still reject this:

   echo module foo class FOO_NOT_HERE +p > /proc/dynamic_debug/control


> enum levels {
>         LOW,
>         MEDIUM,
>         HIGH
> };

I want to steer clear of "level" anything,
since 2>1 implies non independence of the categories



>
> static const char * const level_to_strings[] = {
>         [LOW] = "low",
>         [MEDIUM] = "medium",
>         [HIGH] = "high",
> };
>
> And then you'd have a wrapper macros in your driver:
>
> #define module_foo_pr_debug_class(level, fmt, args...)
>         pr_debug_class(level, level_to_strings, fmt, args);
>
> Such that call sites look like:
>
> module_foo_pr_debug_class(LOW, fmt, args...);
>

That macro, minus the "module_foo_" prefix,
could go into dynamic_debug.h

I didnt do that, for 2 reasons:

DRM didnt need it - it had an enum var,
and a set of macros to encapsulate the categories.

-  the "prototype" looks like this might be ok:
    define LOW "low"
    pr_debug_class(LOW, "mumble about something %p %p\n", foo, bar)
ok thats a stretch, but...

Basically, I didnt want to deal with creating a new interface. KIS

> Such that you're not always passing the strings array around. Now, this
> does mean another pointer for struct _ddebug and most wouldn't have it.
> Maybe we could just add another linker section for these so as to save
> space.

From a space consideration, adding DRM users means adding
thousands of callsites ~2k for i915, ~4k for amdgpu
Also increasing per/callsite memory seems counterproductive.

see DEFINE_DYNAMIC_DEBUG_CLASSBITS for the way forward.

> > parse_class() accepts 0 .. _DPRINTK_SITE_UNCLASSED, which allows the
> >> control interface to explicitly manipulate unclassed callsites.
> >
> > After parsing keywords, ddebug_parse_query() sets .class_id=15, iff it
> > wasnt explicitly set.  This allows future classed/categorized
> > callsites to be untouched by legacy (class unaware) queries.
> >
> > DEFINE_DYNAMIC_DEBUG_METADATA gets _CLS(cls,) suffix and arg, and
> > initializes the new .class_id=cls field.  The old name gets the default.
> >
> > Then, these _CLS(cls,...) modifications are repeated up through the
> > stack of *dynamic_func_call* macros that use the METADATA initializer,
> > so as to actually supply the category into it.
> >
> > NOTES:
> >
> > _DPRINTK_SITE_UNCLASSED: this symbol is used to initialize all
> > existing/unclassed pr-debug callsites.  Normally, the default would be
> > zero, but DRM_UT_CORE "uses" that value, in the sense that 0 is
> > exposed as a bit position in drm.debug.  Using 15 allows identity
> > mapping from category to class, avoiding fiddly offsets.
> >
> > Default .class_id = 15 means that ``echo +p > control`` no longer
> > toggles ALL the callsites, only the unclassed ones.  This was only
> > useful for static-branch toggle load testing anyway.
> >
>
> I think that # echo +p > control should continue to work as is, why
> should the introduction of classes change that ?

1st, its a good way to flood your syslog, forex if theres a serial driver built.
And this might get dramatically worse if DRM_VBLANK got lumped in.

but basically, it still affects the same universe of callsites
as before DRM popped/s into existence (which could double the callsites)

ISTM   ``echo "+p;-p" >control``
is primarily useful for work-load generation.
whether 1 cycle is 4k or 8k toggles is unimportant.



>
> > RFC:
> >
> > The new _CLS macro flavor gets a warning from DRM/dri-devel's CI,
> > but not from checkpatch (on this subject).
> >
> > a8f6c71f283e dyndbg: add class_id field and query support
> > -:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
> > +#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {        \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
> > +     if (DYNAMIC_DEBUG_BRANCH(id))                           \
> > +             func(&id, ##__VA_ARGS__);                       \
> >  } while (0)
> >
> > I couldn't fix it with a ``typeof(id) _id = id`` construct.  I haven't
> > seen the warning myself, on the _CLS extended macro, nor the original.
> >
> > CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  .../admin-guide/dynamic-debug-howto.rst       |  7 +++
> >  include/linux/dynamic_debug.h                 | 54 ++++++++++++++-----
> >  lib/dynamic_debug.c                           | 48 ++++++++++++++---
> >  3 files changed, 88 insertions(+), 21 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> > index a89cfa083155..8ef8d7dcd140 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> > @@ -35,6 +35,7 @@ Dynamic debug has even more useful features:
> >     - line number (including ranges of line numbers)
> >     - module name
> >     - format string
> > +   - class number:0-15
> >
> >   * Provides a debugfs control file: ``<debugfs>/dynamic_debug/control``
> >     which can be read to display the complete list of known debug
> > @@ -143,6 +144,7 @@ against.  Possible keywords are:::
> >                'module' string |
> >                'format' string |
> >                'line' line-range
> > +              'class' integer:[0-15]
> >
> >    line-range ::= lineno |
> >                '-'lineno |
> > @@ -217,6 +219,11 @@ line
> >       line -1605          // the 1605 lines from line 1 to line 1605
> >       line 1600-          // all lines from line 1600 to the end of the file
> >
> > +class
> > +    This expects a single integer in range: 0-15.
> > +    15 is used/reserved for existing/unclassed callsites,
> > +    and is defaulted in unless specified to >control
> > +
> >  The flags specification comprises a change operation followed
> >  by one or more flag characters.  The change operation is one
> >  of the characters::
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> > index dce631e678dd..d4b48f3cc6e8 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -6,6 +6,8 @@
> >  #include <linux/jump_label.h>
> >  #endif
> >
> > +#include <linux/build_bug.h>
> > +
> >  /*
> >   * An instance of this structure is created in a special
> >   * ELF section at every dynamic debug callsite.  At runtime,
> > @@ -21,6 +23,9 @@ struct _ddebug {
> >       const char *filename;
> >       const char *format;
> >       unsigned int lineno:18;
> > +#define CLS_BITS 4
> > +     unsigned int class_id:CLS_BITS;
> > +#define _DPRINTK_SITE_UNCLASSED              ((1 << CLS_BITS) - 1)
> >       /*
> >        * The flags field controls the behaviour at the callsite.
> >        * The bits here are changed dynamically when the user
> > @@ -87,7 +92,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
> >                        const struct ib_device *ibdev,
> >                        const char *fmt, ...);
> >
> > -#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)             \
> > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)    \
> >       static struct _ddebug  __aligned(8)                     \
> >       __section("__dyndbg") name = {                          \
> >               .modname = KBUILD_MODNAME,                      \
> > @@ -96,8 +101,14 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
> >               .format = (fmt),                                \
> >               .lineno = __LINE__,                             \
> >               .flags = _DPRINTK_FLAGS_DEFAULT,                \
> > +             .class_id = cls,                                \
> >               _DPRINTK_KEY_INIT                               \
> > -     }
> > +     };                                                      \
> > +     BUILD_BUG_ON_MSG(cls > _DPRINTK_SITE_UNCLASSED,         \
> > +                      "classid value overflow")
> > +
> > +#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)             \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_SITE_UNCLASSED, fmt)
> >
> >  #ifdef CONFIG_JUMP_LABEL
> >
> > @@ -128,18 +139,26 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
> >
> >  #endif /* CONFIG_JUMP_LABEL */
> >
> > -#define __dynamic_func_call(id, fmt, func, ...) do { \
> > -     DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);         \
> > -     if (DYNAMIC_DEBUG_BRANCH(id))                   \
> > -             func(&id, ##__VA_ARGS__);               \
> > +#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {        \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
> > +     if (DYNAMIC_DEBUG_BRANCH(id))                           \
> > +             func(&id, ##__VA_ARGS__);                       \
> >  } while (0)
> >
> > -#define __dynamic_func_call_no_desc(id, fmt, func, ...) do { \
> > -     DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);                 \
> > -     if (DYNAMIC_DEBUG_BRANCH(id))                           \
> > -             func(__VA_ARGS__);                              \
> > +#define __dynamic_func_call_no_desc_cls(id, cls, fmt, func, ...) do {        \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);                \
> > +     if (DYNAMIC_DEBUG_BRANCH(id))                                   \
> > +             func(__VA_ARGS__);                                      \
> >  } while (0)
> >
> > +#define __dynamic_func_call(id, fmt, func, ...)                              \
> > +     __dynamic_func_call_cls(id, _DPRINTK_SITE_UNCLASSED,            \
> > +                             fmt, func, ##__VA_ARGS__)
> > +
> > +#define __dynamic_func_call_no_desc(id, fmt, func, ...)                      \
> > +     __dynamic_func_call_no_desc_cls(id, _DPRINTK_SITE_UNCLASSED,    \
> > +                                     fmt, func, ##__VA_ARGS__)
> > +
> >  /*
> >   * "Factory macro" for generating a call to func, guarded by a
> >   * DYNAMIC_DEBUG_BRANCH. The dynamic debug descriptor will be
> > @@ -148,15 +167,24 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
> >   * the varargs. Note that fmt is repeated in invocations of this
> >   * macro.
> >   */
> > +#define _dynamic_func_call_cls(cls, fmt, func, ...)                  \
> > +     __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
> >  #define _dynamic_func_call(fmt, func, ...)                           \
> > -     __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
> > +     _dynamic_func_call_cls(_DPRINTK_SITE_UNCLASSED, fmt, func, ##__VA_ARGS__)
> > +
> >  /*
> >   * A variant that does the same, except that the descriptor is not
> >   * passed as the first argument to the function; it is only called
> >   * with precisely the macro's varargs.
> >   */
> > -#define _dynamic_func_call_no_desc(fmt, func, ...)   \
> > -     __dynamic_func_call_no_desc(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
> > +#define _dynamic_func_call_no_desc_cls(fmt, cat, func, ...)          \
> > +     __dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug), cat,       \
> > +                                     fmt, func, ##__VA_ARGS__)
> > +
> > +#define _dynamic_func_call_no_desc(fmt, func, ...)                   \
> > +     __dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug),            \
> > +                                     _DPRINTK_SITE_UNCLASSED,        \
> > +                                     fmt, func, ##__VA_ARGS__)
> >
> >  #define dynamic_pr_debug(fmt, ...)                           \
> >       _dynamic_func_call(fmt, __dynamic_pr_debug,             \
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index a56c1286ffa4..ee2129becacc 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -55,6 +55,8 @@ struct ddebug_query {
> >       const char *function;
> >       const char *format;
> >       unsigned int first_lineno, last_lineno;
> > +     unsigned int class_id;
> > +     unsigned int class_marked:1;
> >  };
> >
> >

> >  /*
> > @@ -170,6 +172,10 @@ static int ddebug_change(const struct ddebug_query *query,
> >               for (i = 0; i < dt->num_ddebugs; i++) {
> >                       struct _ddebug *dp = &dt->ddebugs[i];
> >
> > +                     /* match against the class_id, either given or default */
> > +                     if (query->class_id != dp->class_id)
> > +                             continue;
> > +
>
> Could that instead be:
>
> if (query->class_id != _DPRINTK_SITE_UNCLASSED && query->class_id != dp->class_id)
>         continue;
>

I think that is the effect currently.

query construction adds in the default if the term wasnt specified.

> That way by default we fall through and enable callsites for queries that do not have
> the 'class' keyboard specified.

thats what I was avoiding - I suppose its a matter of perspective

all existing callsites are unclassified. - ie 15
to preserve the universe affected by old queries,
adding 15 by default comports with this.
then when class !=15 callsites are added,
they are immune from effects by existing queries.

classed queries are the alternate universe.
and need "class N" in >control to get there.
Id expect DRM would like the isolation,
at least against inadvertent changes.

that said,   ``echo +p >control`` can only affect 1 universe at a time.
ISTM this is fine,
the only thing lost is 1/2 the workload for
   while true do echo "+p ; -p" >control; done

> I think I would also disallow setting
> _DPRINTK_SITE_UNCLASSED explicitly since it would now mean 'class *', and what if
> we expand class_id size to greater than 15 at some point?

it doesnt mean class *, it means class OTHER than 0-14

earlier version of parse_class disallowed 15 explicitly,
I changed it to simplify testing.

re-adding that constraint could be argued,
but if class 15 is the default when unspecified,
its hard to explain why "class 15" could draw an errror.

we'd just increase bit-field size, class_id:5
and bump 15 to 31.
is there an appropriate *_MAX macro to use,
to add the right implications / connotations ?
theres something vaguely overflowy / rollover-y here.
What choice words would convey it succinctly ?

>
> >                       /* match against the source filename */
> >                       if (query->filename &&
> >                           !match_wildcard(query->filename, dp->filename) &&
> > @@ -308,6 +314,21 @@ static inline int parse_lineno(const char *str, unsigned int *val)
> >       return 0;
> >  }
> >
> > +static inline int parse_class(struct ddebug_query *query, const char *str)
> > +{
> > +     int rc;
> > +     unsigned int val;
> > +
> > +     rc = kstrtouint(str, 10, &val);
> > +     if (rc < 0 || val > _DPRINTK_SITE_UNCLASSED) {
> > +             pr_err("expecting class:[0-%d], not %s\n", _DPRINTK_SITE_UNCLASSED, str);
> > +             return -EINVAL;
> > +     }
> > +     query->class_id = val;
> > +     query->class_marked = 1;
> > +     return 0;
> > +}
> > +
> >  static int parse_linerange(struct ddebug_query *query, const char *first)
> >  {
> >       char *last = strchr(first, '-');
> > @@ -421,6 +442,9 @@ static int ddebug_parse_query(char *words[], int nwords,
> >               } else if (!strcmp(keyword, "line")) {
> >                       if (parse_linerange(query, arg))
> >                               return -EINVAL;
> > +             } else if (!strcmp(keyword, "class")) {
> > +                     if (parse_class(query, arg))
> > +                             return -EINVAL;
> >               } else {
> >                       pr_err("unknown keyword \"%s\"\n", keyword);
> >                       return -EINVAL;
> > @@ -428,6 +452,10 @@ static int ddebug_parse_query(char *words[], int nwords,
> >               if (rc)
> >                       return rc;
> >       }
> > +     /* post-validate the query, set default */
> > +     if (!query->class_marked)
> > +             query->class_id = _DPRINTK_SITE_UNCLASSED;
> > +
> >       vpr_info_dq(query, "parsed");
> >       return 0;
> >  }
> > @@ -900,7 +928,11 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
> >                  iter->table->mod_name, dp->function,
> >                  ddebug_describe_flags(dp->flags, &flags));
> >       seq_escape(m, dp->format, "\t\r\n\"");
> > -     seq_puts(m, "\"\n");
> > +     seq_puts(m, "\"");
> > +
> > +     if (dp->class_id != _DPRINTK_SITE_UNCLASSED)
> > +             seq_printf(m, " cls:%u", dp->class_id);
> > +     seq_puts(m, "\n");
> >
> >       return 0;
> >  }
