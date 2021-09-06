Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91685401F4C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 19:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F1D8993B;
	Mon,  6 Sep 2021 17:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BEE897AC;
 Mon,  6 Sep 2021 17:42:14 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id e20so638087uam.11;
 Mon, 06 Sep 2021 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xb1RRKBrihRAbWsvTSrPqTS344LUaeD0ur8JecL/ZVs=;
 b=neYBLjlz1SfLbWGviUoVfiyhOT13XuYZMJaJEf89/UCsP9ym56JeZIn0fm+ISHEPCa
 iM1W6pAsj/LzxcpAyTQhWe2JytHbPBmAKgTLDpRrTiKwW+Wcni9BiC15bsz/25zT+y76
 xfPXgu33X2OC3RJONzxOW7XMOXwQ0lYA0zPzdpFyxZ9h9/2BlhIQjXMH2QbT4EijJLbV
 bHWRgZmTDt9kNJHHs/s612KHHu4Vq1HiiIYSriB/wU5U3mlivYc2/UstFphZ3+Kj/b/O
 u2w4V3ehCwxoOiyG5rEJzIdxUogzdrfboGPqdjNaQVve3WuUPWp40PbRZvYm90D9IF4I
 xfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xb1RRKBrihRAbWsvTSrPqTS344LUaeD0ur8JecL/ZVs=;
 b=E3qRxaEVRprOlvbD0hpMGmhIS+kNH5eAbCFSOqEHAPzmXJb6a/J6f0Gh4pXAJ2z8iT
 lcXF/kPUvP/odxPwLmb6sTiBtwREMwtoksILDmeJctoKhcrDgs/VH8YMQZLQtUAdzWUU
 o9/vEu6WwWbDU21NveypJ5khLKBdk/rtI7rerOetMr6gYiAXCdm4FEoxz+7zFOleG4BZ
 O7/+7dscsbU+8FV7OkYN4pZwyhPB1lkeG5GhoEpkmi8q8UMaohFBUOQFsayGnJMS7o3k
 0U4TBFaQpoG5yVQ3RMepzkUHsLrUrq9q8tZ8xdGKgg1W7pYpWmGx+goChzVpkRXs55uH
 j35A==
X-Gm-Message-State: AOAM533j11nQ8LW0AWnVTHWqupw6+bhmBsygFpSQ8KxT0e/6NHnR6NiJ
 geLhIho2EFFJ6Rmab4Yy+vfoCtSEbqAMhm0jvgo=
X-Google-Smtp-Source: ABdhPJzaZ5VyPa8E+HWSqH5kvV1sen7OH0Z5KgDumkxGBY7J5H8NfHkNyiwDc4gMa/YR+YvWyz72TmaW2m0zEgPNXGY=
X-Received: by 2002:ab0:778c:: with SMTP id x12mr6417234uar.121.1630950132847; 
 Mon, 06 Sep 2021 10:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-4-jim.cromie@gmail.com>
 <9fe5e962-e65e-6844-269a-058cce944a89@linux.intel.com>
 <CAJfuBxz+cZyyDSBrDR0+Rf7K9fqpmeAfcWb1x2MkwD0P9LuDcQ@mail.gmail.com>
 <2bfbd75c-8f7f-e756-05c3-13dff41264e4@linux.intel.com>
In-Reply-To: <2bfbd75c-8f7f-e756-05c3-13dff41264e4@linux.intel.com>
From: jim.cromie@gmail.com
Date: Mon, 6 Sep 2021 11:41:46 -0600
Message-ID: <CAJfuBxymoFx79kQzGw_Gxv1vk7kVaTN-V0Hn694C6kT=kP7u2A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 3/8] i915/gvt: use
 DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:" etc categories
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, 
 Jason Baron <jbaron@akamai.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="0000000000005099b905cb572b8f"
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

--0000000000005099b905cb572b8f
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 6:26 AM Tvrtko Ursulin <
tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 03/09/2021 20:22, jim.cromie@gmail.com wrote:
> > On Fri, Sep 3, 2021 at 5:07 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 31/08/2021 21:21, Jim Cromie wrote:
> >>> The gvt component of this driver has ~120 pr_debugs, in 9 categories
> >>> quite similar to those in DRM.  Following the interface model of
> >>> drm.debug, add a parameter to map bits to these categorizations.
> >>>
> >>> DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> >>>        "dyndbg bitmap desc",
> >>>        { "gvt:cmd: ",  "command processing" },

> >>> v7:
> >>> . move ccflags addition up to i915/Makefile from i915/gvt
> >>> ---
> >>>    drivers/gpu/drm/i915/Makefile      |  4 ++++
> >>>    drivers/gpu/drm/i915/i915_params.c | 35
++++++++++++++++++++++++++++++
> >>
> >> Can this work if put under gvt/ or at least intel_gvt.h|c?

I tried this.
I moved the code block into gvt/debug.c (new file)
added it to Makefile GVT_SOURCES
dunno why it wont make.
frustratig basic err, Im not seeing.
It does seem proper placement, will resolve...


> >>
> >
> > I thought it belonged here more, at least according to the name of the
> > config.var
>
> Hmm bear with me please - the categories this patch creates are intended
> to be used explicitly from the GVT "sub-module", or they somehow even
> get automatically used with no further intervention to callers required?
>

2009 - v5.9.0  the only users were admins reading/echoing
/proc/dynamic_debug/control
presumably cuz they wanted more info in the logs, episodically.
v5.9.0 exported dynamic_debug_exec_queries for in-kernel use,
reusing the stringy: echo $query_command > control  idiom.
My intention was to let in-kernel users roll their own drm.debug type
interface,
or whatever else they needed.  nobodys using it yet.

patch 1/8 implements that drm.debug interface.
5/8 is the primary use case
3/8 (this patch) & 4/8 are patches of opportunity, test cases, proof of
function/utility.
its value as such is easier control of those pr-debugs than given by echo >
control

Sean Paul  seanpaul@chromium.org worked up a patchset to do runtime
steering of drm-debug stream,
in particular watching for drm:atomic:fail: type activity (a subcategory
which doesnt exist yet).
5/8 conflicts with his patchset, I have an rfc approach to that, so his
concerns are mine too.


note:  if this patchset goes in, we dont *really* need the export anymore,
since the main use case is covered.  We could un-export, and re-add later
if its needed for a different use case.  Further, it seems likely that the
callbacks
(refactored) would be a better basis for new in-kernel users.
If not that, then full exposure of struct ddebug_query to in-kernel use


not quite sure how we got 2 chunks, but theres 1 more q below.

On Mon, Sep 6, 2021 at 6:26 AM Tvrtko Ursulin <
tvrtko.ursulin@linux.intel.com> wrote:

>
> On 03/09/2021 20:22, jim.cromie@gmail.com wrote:
> > On Fri, Sep 3, 2021 at 5:07 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 31/08/2021 21:21, Jim Cromie wrote:
> >>> The gvt component of this driver has ~120 pr_debugs, in 9 categories
> >>> quite similar to those in DRM.  Following the interface model of
> >>> drm.debug, add a parameter to map bits to these categorizations.
> >>>
> >>> DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> >>>        "dyndbg bitmap desc",
> >>>        { "gvt:cmd: ",  "command processing" },
> >>>        { "gvt:core: ", "core help" },
> >>>        { "gvt:dpy: ",  "display help" },
> >>>        { "gvt:el: ",   "help" },
> >>>        { "gvt:irq: ",  "help" },
> >>>        { "gvt:mm: ",   "help" },
> >>>        { "gvt:mmio: ", "help" },
> >>>        { "gvt:render: ", "help" },
> >>>        { "gvt:sched: " "help" });
> >>>
> >
> > BTW, Ive dropped the help field, its already handled, dont need to
> clutter.
> >
> >
> >>> The actual patch has a few details different, cmd_help() macro emits
> >>> the initialization construct.
> >>>
> >>> if CONFIG_DRM_USE_DYNAMIC_DEBUG, then -DDYNAMIC_DEBUG_MODULE is added
> >>> cflags, by gvt/Makefile.
> >>>
> >>> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> >>> ---
> >>> v5:
> >>> . static decl of vector of bit->class descriptors - Emil.V
> >>> . relocate gvt-makefile chunk from elsewhere
> >>> v7:
> >>> . move ccflags addition up to i915/Makefile from i915/gvt
> >>> ---
> >>>    drivers/gpu/drm/i915/Makefile      |  4 ++++
> >>>    drivers/gpu/drm/i915/i915_params.c | 35
> ++++++++++++++++++++++++++++++
> >>
> >> Can this work if put under gvt/ or at least intel_gvt.h|c?
> >>
> >
> > I thought it belonged here more, at least according to the name of the
> > config.var
>
> Hmm bear with me please - the categories this patch creates are intended
> to be used explicitly from the GVT "sub-module", or they somehow even
> get automatically used with no further intervention to callers required?
>
> > CONFIG_DRM_USE_DYNAMIC_DEBUG.
> >
> > I suppose its not a great name, its narrow purpose is to swap
> > drm-debug api to use dyndbg.   drm-evrything already "uses"
> > dyndbg if CONFIG_DYNAMIC_DEBUG=y, those gvt/pr_debugs in particular.
> >
> > Theres also CONFIG_DYNAMIC_DEBUG_CORE=y,
> > which drm basically ignores currently.
> >
> > So with the name CONFIG_DRM_USE_DYNAMIC_DEBUG
> > it seemed proper to arrange for that  to be true on DD-CORE=y builds,
> > by adding -DDYNAMIC_DEBUG_MODULE
> >
> > Does that make some sense ?
> > How to best resolve the frictions ?
> > new CONFIG names ?
> >
> >>>    2 files changed, 39 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/Makefile
> b/drivers/gpu/drm/i915/Makefile
> >>> index 4f22cac1c49b..5a4e371a3ec2 100644
> >>> --- a/drivers/gpu/drm/i915/Makefile
> >>> +++ b/drivers/gpu/drm/i915/Makefile
> >>> @@ -30,6 +30,10 @@ CFLAGS_display/intel_fbdev.o = $(call
> cc-disable-warning, override-init)
> >>>
> >>>    subdir-ccflags-y += -I$(srctree)/$(src)
> >>>
> >>> +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
> >>> +ccflags-y += -DDYNAMIC_DEBUG_MODULE
> >>> +#endif
> >>
> >> Ignores whether CONFIG_DRM_I915_GVT is enabled or not?
> >>
> >
> > not intentionally.
> > I think theres 2 things youre noting:
> >
> > 1 - make frag into gvt/Makefile
> > I had it there earlier, not sure why I moved it up.
> > maybe some confusion on proper scope of the flag.
> >
> >
> > 2 - move new declaration code in i915-param.c inside the gvt ifdef
> >
> > Im good with that.
> > I'll probably copy the ifdef wrapper down rather than move the decl up.
> > ie:
> >
> > #if __and(IS_ENABLED(CONFIG_DRM_I915_GVT),
> >    IS_ENABLED(CONFIG_DRM_USE_DYNAMIC_DEBUG))
> >
> > unsigned long __gvt_debug;
> > EXPORT_SYMBOL(__gvt_debug);
> >
> >
> >>> +
> >>>    # Please keep these build lists sorted!
> >>>
> >>>    # core driver code
> >>> diff --git a/drivers/gpu/drm/i915/i915_params.c
> b/drivers/gpu/drm/i915/i915_params.c
> >>> index e07f4cfea63a..e645e149485e 100644
> >>> --- a/drivers/gpu/drm/i915/i915_params.c
> >>> +++ b/drivers/gpu/drm/i915/i915_params.c
> >>> @@ -265,3 +265,38 @@ void i915_params_free(struct i915_params *params)
> >>> +                             _DD_cat_("gvt:mmio:"),
> >>> +                             _DD_cat_("gvt:render:"),
> >>> +                             _DD_cat_("gvt:sched:"));
> >>> +
> >>> +#endif
> >>
> >> So just the foundation - no actual use sites I mean? How would these be
> >> used from the code?
> >>
> >
> > there are 120 pr_debug "users" :-)
> >
> > no users per se, but anyone using drm.debug
> > /sys/module/drm/parameters/debug
> > might use this too.
> > its a bit easier than composing queries for >/proc/dyamic_debug/control
>
> Same as my previous question, perhaps I am not up to speed with this
> yet.. Even if pr_debug is used inside GVT - are the categories and
> debug_gvt global as of this patch (or series)?
>
>
they are already global in the sense that if kernel is built with
DYNAMIC_DEBUG,
the admin can turn those pr_debugs on and off, and change their decorations
in the log (mod,func.line).
Nor are modules protected from each other; drm-core could use
dd-exec-queries to enable/disable
pr-debugs in i915 etc

This patch just adds a gvt-debug knob like drm-debug. using the existing
format prefixes to categorize them.
Whether those prefixes should be bent towards consistency with the rest of
drm-debug
or adapted towards some gvt community need I couldnt say.

Its no save-the-world feature, but its pretty cheap.

Id expect the same users as those who play with drm.debug, for similar
reasons.

does this clarify ?


> Regards,
>
> Tvrtko
>

thanks,
Jim

--0000000000005099b905cb572b8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><br>On Mon, Sep 6, 2021 at 6:26 AM Tv=
rtko Ursulin &lt;<a href=3D"mailto:tvrtko.ursulin@linux.intel.com">tvrtko.u=
rsulin@linux.intel.com</a>&gt; wrote:<br>&gt;<br>&gt;<br>&gt; On 03/09/2021=
 20:22, <a href=3D"mailto:jim.cromie@gmail.com">jim.cromie@gmail.com</a> wr=
ote:<br>&gt; &gt; On Fri, Sep 3, 2021 at 5:07 AM Tvrtko Ursulin<br>&gt; &gt=
; &lt;<a href=3D"mailto:tvrtko.ursulin@linux.intel.com">tvrtko.ursulin@linu=
x.intel.com</a>&gt; wrote:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt;<br>&gt; &gt;&g=
t; On 31/08/2021 21:21, Jim Cromie wrote:<br>&gt; &gt;&gt;&gt; The gvt comp=
onent of this driver has ~120 pr_debugs, in 9 categories<br>&gt; &gt;&gt;&g=
t; quite similar to those in DRM.=C2=A0 Following the interface model of<br=
>&gt; &gt;&gt;&gt; drm.debug, add a parameter to map bits to these categori=
zations.<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; DEFINE_DYNAMIC_DEBUG_CAT=
EGORIES(debug_gvt, __gvt_debug,<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;dyndbg bitmap desc&quot;,<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0{ &quot;gvt:cmd: &quot;, =C2=A0&quot;command processing&quot; =
},<br><br>&gt; &gt;&gt;&gt; v7:<br>&gt; &gt;&gt;&gt; . move ccflags additio=
n up to i915/Makefile from i915/gvt<br>&gt; &gt;&gt;&gt; ---<br>&gt; &gt;&g=
t;&gt; =C2=A0 =C2=A0drivers/gpu/drm/i915/Makefile =C2=A0 =C2=A0 =C2=A0| =C2=
=A04 ++++<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0drivers/gpu/drm/i915/i915_param=
s.c | 35 ++++++++++++++++++++++++++++++<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; C=
an this work if put under gvt/ or at least intel_gvt.h|c?<br><br>I tried th=
is.<br>I moved the code block into gvt/debug.c (new file)<br>added it to Ma=
kefile GVT_SOURCES<br>dunno why it wont make.<br>frustratig basic err, Im n=
ot seeing.<br>It does seem proper placement, will resolve...<br><br><br>&gt=
; &gt;&gt;<br>&gt; &gt;<br>&gt; &gt; I thought it belonged here more, at le=
ast according to the name of the<br>&gt; &gt; config.var<br>&gt;<br>&gt; Hm=
m bear with me please - the categories this patch creates are intended<br>&=
gt; to be used explicitly from the GVT &quot;sub-module&quot;, or they some=
how even<br>&gt; get automatically used with no further intervention to cal=
lers required?<br>&gt;<br><br>2009 - v5.9.0 =C2=A0the only users were admin=
s reading/echoing /proc/dynamic_debug/control<br>presumably cuz they wanted=
 more info in the logs, episodically.<br>v5.9.0 exported dynamic_debug_exec=
_queries for in-kernel use,<br>reusing the stringy: echo $query_command &gt=
; control =C2=A0idiom.<br>My intention was to let in-kernel users roll thei=
r own drm.debug type interface,<br>or whatever else they needed.=C2=A0 nobo=
dys using it yet.<br><br>patch 1/8 implements that drm.debug interface.<br>=
5/8 is the primary use case<br>3/8 (this patch) &amp; 4/8 are patches of op=
portunity, test cases, proof of function/utility.<br>its value as such is e=
asier control of those pr-debugs than given by echo &gt; control<br><br>Sea=
n Paul=C2=A0 <a href=3D"mailto:seanpaul@chromium.org">seanpaul@chromium.org=
</a> worked up a patchset to do runtime steering of drm-debug stream,</div>=
<div>in particular watching for drm:atomic:fail: type activity (a subcatego=
ry which doesnt exist yet).</div><div>5/8 conflicts with his patchset, I ha=
ve an rfc approach to that, so his concerns are mine too.</div><div dir=3D"=
ltr"><br></div><div dir=3D"ltr"><br>note: =C2=A0if this patchset goes in, w=
e dont *really* need the export anymore,<br>since the main use case is cove=
red.=C2=A0 We could un-export, and re-add later<br>if its needed for a diff=
erent use case.=C2=A0 Further, it seems likely that the callbacks<br>(refac=
tored) would be a better basis for new in-kernel users.<br>If not that, the=
n full exposure of struct ddebug_query to in-kernel use<br><br></div><div><=
br></div>not quite sure how we got 2 chunks, but theres=C2=A01 more q below=
.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Sep 6, 2021 at 6:26 AM Tvrtko Ursulin &lt;<a href=3D"mailto:tvrtko.u=
rsulin@linux.intel.com">tvrtko.ursulin@linux.intel.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 03/09/2021 20:22, <a href=3D"mailto:jim.cromie@gmail.com" target=3D"_bla=
nk">jim.cromie@gmail.com</a> wrote:<br>
&gt; On Fri, Sep 3, 2021 at 5:07 AM Tvrtko Ursulin<br>
&gt; &lt;<a href=3D"mailto:tvrtko.ursulin@linux.intel.com" target=3D"_blank=
">tvrtko.ursulin@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 31/08/2021 21:21, Jim Cromie wrote:<br>
&gt;&gt;&gt; The gvt component of this driver has ~120 pr_debugs, in 9 cate=
gories<br>
&gt;&gt;&gt; quite similar to those in DRM.=C2=A0 Following the interface m=
odel of<br>
&gt;&gt;&gt; drm.debug, add a parameter to map bits to these categorization=
s.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dyndbg bitmap desc&quot;,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:cmd: &quot;,=C2=A0 &quo=
t;command processing&quot; },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:core: &quot;, &quot;cor=
e help&quot; },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:dpy: &quot;,=C2=A0 &quo=
t;display help&quot; },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:el: &quot;,=C2=A0 =C2=
=A0&quot;help&quot; },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:irq: &quot;,=C2=A0 &quo=
t;help&quot; },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:mm: &quot;,=C2=A0 =C2=
=A0&quot;help&quot; },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:mmio: &quot;, &quot;hel=
p&quot; },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:render: &quot;, &quot;h=
elp&quot; },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;gvt:sched: &quot; &quot;hel=
p&quot; });<br>
&gt;&gt;&gt;<br>
&gt; <br>
&gt; BTW, Ive dropped the help field, its already handled, dont need to clu=
tter.<br>
&gt; <br>
&gt; <br>
&gt;&gt;&gt; The actual patch has a few details different, cmd_help() macro=
 emits<br>
&gt;&gt;&gt; the initialization construct.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; if CONFIG_DRM_USE_DYNAMIC_DEBUG, then -DDYNAMIC_DEBUG_MODULE i=
s added<br>
&gt;&gt;&gt; cflags, by gvt/Makefile.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Jim Cromie &lt;<a href=3D"mailto:jim.cromie@gma=
il.com" target=3D"_blank">jim.cromie@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; v5:<br>
&gt;&gt;&gt; . static decl of vector of bit-&gt;class descriptors - Emil.V<=
br>
&gt;&gt;&gt; . relocate gvt-makefile chunk from elsewhere<br>
&gt;&gt;&gt; v7:<br>
&gt;&gt;&gt; . move ccflags addition up to i915/Makefile from i915/gvt<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/gpu/drm/i915/Makefile=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 4 ++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/gpu/drm/i915/i915_params.c | 35 +++++++++=
+++++++++++++++++++++<br>
&gt;&gt;<br>
&gt;&gt; Can this work if put under gvt/ or at least intel_gvt.h|c?<br>
&gt;&gt;<br>
&gt; <br>
&gt; I thought it belonged here more, at least according to the name of the=
<br>
&gt; config.var<br>
<br>
Hmm bear with me please - the categories this patch creates are intended <b=
r>
to be used explicitly from the GVT &quot;sub-module&quot;, or they somehow =
even <br>
get automatically used with no further intervention to callers required?<br=
>
<br>
&gt; CONFIG_DRM_USE_DYNAMIC_DEBUG.<br>
&gt; <br>
&gt; I suppose its not a great name, its narrow purpose is to swap<br>
&gt; drm-debug api to use dyndbg.=C2=A0 =C2=A0drm-evrything already &quot;u=
ses&quot;<br>
&gt; dyndbg if CONFIG_DYNAMIC_DEBUG=3Dy, those gvt/pr_debugs in particular.=
<br>
&gt; <br>
&gt; Theres also CONFIG_DYNAMIC_DEBUG_CORE=3Dy,<br>
&gt; which drm basically ignores currently.<br>
&gt; <br>
&gt; So with the name CONFIG_DRM_USE_DYNAMIC_DEBUG<br>
&gt; it seemed proper to arrange for that=C2=A0 to be true on DD-CORE=3Dy b=
uilds,<br>
&gt; by adding -DDYNAMIC_DEBUG_MODULE<br>
&gt; <br>
&gt; Does that make some sense ?<br>
&gt; How to best resolve the frictions ?<br>
&gt; new CONFIG names ?<br>
&gt; <br>
&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 39 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i=
915/Makefile<br>
&gt;&gt;&gt; index 4f22cac1c49b..5a4e371a3ec2 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/Makefile<br>
&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/Makefile<br>
&gt;&gt;&gt; @@ -30,6 +30,10 @@ CFLAGS_display/intel_fbdev.o =3D $(call cc-=
disable-warning, override-init)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 subdir-ccflags-y +=3D -I$(srctree)/$(src)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG<br>
&gt;&gt;&gt; +ccflags-y +=3D -DDYNAMIC_DEBUG_MODULE<br>
&gt;&gt;&gt; +#endif<br>
&gt;&gt;<br>
&gt;&gt; Ignores whether CONFIG_DRM_I915_GVT is enabled or not?<br>
&gt;&gt;<br>
&gt; <br>
&gt; not intentionally.<br>
&gt; I think theres 2 things youre noting:<br>
&gt; <br>
&gt; 1 - make frag into gvt/Makefile<br>
&gt; I had it there earlier, not sure why I moved it up.<br>
&gt; maybe some confusion on proper scope of the flag.<br>
&gt; <br>
&gt; <br>
&gt; 2 - move new declaration code in i915-param.c inside the gvt ifdef<br>
&gt; <br>
&gt; Im good with that.<br>
&gt; I&#39;ll probably copy the ifdef wrapper down rather than move the dec=
l up.<br>
&gt; ie:<br>
&gt; <br>
&gt; #if __and(IS_ENABLED(CONFIG_DRM_I915_GVT),<br>
&gt;=C2=A0 =C2=A0 IS_ENABLED(CONFIG_DRM_USE_DYNAMIC_DEBUG))<br>
&gt; <br>
&gt; unsigned long __gvt_debug;<br>
&gt; EXPORT_SYMBOL(__gvt_debug);<br>
&gt; <br>
&gt; <br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 # Please keep these build lists sorted!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 # core driver code<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/=
drm/i915/i915_params.c<br>
&gt;&gt;&gt; index e07f4cfea63a..e645e149485e 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/i915_params.c<br>
&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_params.c<br>
&gt;&gt;&gt; @@ -265,3 +265,38 @@ void i915_params_free(struct i915_params =
*params)<br>&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_DD_cat_(&quot;gvt:m=
mio:&quot;),<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_DD_cat_(&quot;gvt:render:&quo=
t;),<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_DD_cat_(&quot;gvt:sched:&quot=
;));<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +#endif<br>
&gt;&gt;<br>
&gt;&gt; So just the foundation - no actual use sites I mean? How would the=
se be<br>
&gt;&gt; used from the code?<br>
&gt;&gt;<br>
&gt; <br>
&gt; there are 120 pr_debug &quot;users&quot; :-)<br>
&gt; <br>
&gt; no users per se, but anyone using drm.debug<br>
&gt; /sys/module/drm/parameters/debug<br>
&gt; might use this too.<br>
&gt; its a bit easier than composing queries for &gt;/proc/dyamic_debug/con=
trol<br>
<br>
Same as my previous question, perhaps I am not up to speed with this <br>
yet.. Even if pr_debug is used inside GVT - are the categories and <br>
debug_gvt global as of this patch (or series)?<br>
<br></blockquote><div><br></div><div>they are already global in the sense t=
hat if kernel is built with DYNAMIC_DEBUG,</div><div>the admin can turn tho=
se pr_debugs on and off,=C2=A0and change their decorations in=C2=A0the=C2=
=A0log (mod,func.line).</div><div>Nor are modules protected from each other=
; drm-core could use dd-exec-queries to enable/disable</div><div>pr-debugs =
in i915 etc</div><div><br></div><div>This patch just adds a gvt-debug knob =
like drm-debug. using the existing format prefixes to categorize them.</div=
><div>Whether those prefixes should be bent towards consistency with the re=
st of drm-debug</div><div>or adapted towards some gvt community need I coul=
dnt say.</div><div><br></div><div>Its no save-the-world feature, but its pr=
etty cheap.</div><div><br></div><div>Id expect the same users as those who =
play with drm.debug, for similar reasons.</div><div><br></div><div>does thi=
s clarify ?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Regards,<br>
<br>
Tvrtko<br></blockquote><div><br></div><div>thanks,</div><div>Jim=C2=A0</div=
></div></div>

--0000000000005099b905cb572b8f--
