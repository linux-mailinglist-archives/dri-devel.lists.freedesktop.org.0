Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B6053E53A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F142610FBBB;
	Mon,  6 Jun 2022 15:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5079A10FB3C;
 Mon,  6 Jun 2022 15:00:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id o10so19194005edi.1;
 Mon, 06 Jun 2022 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4brwVq972U5Cy5SArwJ+3RcY5BE7XJcKiLcZM5bXIg=;
 b=ebFb6iqNJFZiPZiWnmKDO7dEP68cK+FoW8vXzrP5Fks5IjVYQ5KD7xcjVGogrp1jaK
 tSTzUP+/ElsJCotyF7jOKZSs/ErxzErYTeTKBoyDUVifknmBzs3LEpH++LChHUyw8RFW
 kg2rLfXhL2CUSTb6yPjk0GxgqyqEIE+1EMegj2gmO7JcNw92PI60fXqUktgfshLjZNqz
 t6osXqlL17LYEgWsnrNrX5ikm15/pWjw7m8Z5TgVMLxcYeD7NnmHuRZcpQ5h2truhj54
 LTCCwvcQIpR335afRgDDx1Yt9+IEhEOxCLCXYhjoG5bov+j38Bs4PqefbVaiNjRjfn09
 5Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4brwVq972U5Cy5SArwJ+3RcY5BE7XJcKiLcZM5bXIg=;
 b=od0xkI8hddwfYFz2C2a48ZkrGEIHr8ECxTFzDrJDpjJY9y4i7Ok8KoLJqkDjzBwv4B
 XArUdtDFs1b9T24DTPYXuprgH3Bi/dbt2ODWKnjoOnHNK6u6vQTxTxWqUEGGgbGKJ/ul
 l2zW9DvZunNENQxOJ7sVX9UuMJkoxJyfq2tlt/Kx/tW1H0iIqS3UUnk+JTWyiUpDSuKw
 ixpHMe/nk8PuqM2aTU5MpMSMnbuzkjZLUUdA2SekSjjkJN/YreGMzX3gQfqWxbQmZHac
 iKXnjCztmD6QoS1GIz8vVqk1jrlrhL6ST0JwQM5VwO9czR7jVx2x7IW3ZyWIogesREXG
 kYng==
X-Gm-Message-State: AOAM5322fFzXgoQHHyVNRyolJUQJlx0oDd/Mv5cwgJnJZnJygfFZ/+Oj
 2MDAucW7D37WIy1a+zy6tWctFSYKJP7DrcGN82c=
X-Google-Smtp-Source: ABdhPJzLti6TUUZHJfMec1JUrCsTmwoizRibw8eAdJaxg3bN0xJ9XMOJVeqNHpQGX5I05TWYbejuSINHWA3H0CyqbSM=
X-Received: by 2002:aa7:c846:0:b0:431:6c7b:26af with SMTP id
 g6-20020aa7c846000000b004316c7b26afmr3720487edt.123.1654527603550; Mon, 06
 Jun 2022 08:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
 <Yo5FFMbNG1Viirj1@phenom.ffwll.local>
In-Reply-To: <Yo5FFMbNG1Viirj1@phenom.ffwll.local>
From: jim.cromie@gmail.com
Date: Mon, 6 Jun 2022 08:59:36 -0600
Message-ID: <CAJfuBxzQPeYvpzd_=WkQasKJceHrUYK8umG6gWbTmoAUfApJ8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/27] DRM.debug on DYNAMIC_DEBUG, add trace events
To: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>, 
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, 
 Sean Paul <seanpaul@chromium.org>, robdclark@gmail.com, 
 Steven Rostedt <rostedt@goodmis.org>, mathieu.desnoyers@efficios.com, 
 quic_saipraka@quicinc.com, Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, quic_psodagud@quicinc.com, 
 Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, David Airlie <airlied@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/alternative; boundary="00000000000014abc905e0c8ba93"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000014abc905e0c8ba93
Content-Type: text/plain; charset="UTF-8"

On Wed, May 25, 2022 at 9:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 16, 2022 at 04:56:13PM -0600, Jim Cromie wrote:
> > DRM.debug API is 23 macros, issuing 10 exclusive categories of debug
> > messages.  By rough count, they are used 5140 times in the kernel.
> > These all call drm_dbg or drm_devdbg, which call drm_debug_enabled(),
> > which checks bits in global __drm_debug.  Some of these are page-flips
> > and vblanks, and get called often.
> >
> > DYNAMIC_DEBUG (with CONFIG_JUMP_LABEL) is built to avoid this kind of
> > work, with NOOPd jump/callsites.
> >
> > This patchset is RFC because:
> > - it touches 2.5 subsystems: dyndbg, drm, tracefs (new events)
> > - dyndbg class support is built for drm, needs it for validation
> > - new api, used by drm
> > - big memory impact, with 5100 new pr-debug callsites.
> > - drm class bikeshedding opportunities
> > - others, names etc.
>
> Thanks a lot for keeping on pushing this!


> >
> > DYNAMIC_DEBUG:
> >



> > RFC:
> >
> > dynamic_debug_register_classes() cannot act early enough to be in
> > effect at module-load.  So this will not work as you'd reasonably
> > expect:
> >
> >   modprobe test_dynamic_debug dyndbg='+pfm; class FOO +pfmlt'
> >
> > The 1st query:+pfm will be enabled during load, but in the 2nd query,
> > "class FOO" will be unknown at load time.  Early class enablement
> > would be nice.  DYNAMIC_DEBUG_CLASSES is a static initializer, which
> > is certainly early enough, but Im missing a trick, suggestions?
>
> So maybe I'm just totally overloading this work here so feel free to
> ignore or postpone, but: Could we do the dynamic_debug_register_classes()
> automatically at module load as a new special section? And then throw in a
> bit of kbuild so that in a given subsystem every driver gets the same
> class names by default and everything would just work, without having to
> sprinkle calls to dynamic_debug_register_classes() all over the place?
>

This is now done; Ive added __dyndbg_classes section.
load_module() now grabs it from the .ko
and ddebug_add_module() attaches it to the module's ddebug_table record.
for builtins, dynamic_debug_init feeds the builtin class-maps to
ddebug_add_module

bash-5.1# modprobe test_dynamic_debug dyndbg="class FOO +p"
[   88.374722] dyndbg: class[0]: nm:test_dynamic_debug base:20 len:7 ty:1
[   88.375158] dyndbg:  0: EMERG
[   88.375345] dyndbg:  1: DANGER
[   88.375540] dyndbg:  2: ERROR
[   88.375726] dyndbg:  3: WARNING
[   88.375930] dyndbg:  4: NOTICE
[   88.376130] dyndbg:  5: INFO
[   88.376310] dyndbg:  6: DEBUG
[   88.376499] dyndbg: class[1]: nm:test_dynamic_debug base:12 len:3 ty:1
[   88.376903] dyndbg:  0: ONE
[   88.377079] dyndbg:  1: TWO
[   88.377253] dyndbg:  2: THREE
[   88.377441] dyndbg: class[2]: nm:test_dynamic_debug base:8 len:3 ty:0
[   88.377837] dyndbg:  0: bing
[   88.378022] dyndbg:  1: bong
[   88.378203] dyndbg:  2: boom
[   88.378387] dyndbg: class[3]: nm:test_dynamic_debug base:4 len:3 ty:0
[   88.378800] dyndbg:  0: Foo
[   88.378986] dyndbg:  1: Bar
[   88.379167] dyndbg:  2: Buzz
[   88.379348] dyndbg: class[4]: nm:test_dynamic_debug base:0 len:3 ty:0
[   88.379757] dyndbg:  0: FOO
[   88.379938] dyndbg:  1: BAR
[   88.380136] dyndbg:  2: BUZZ
[   88.380410] dyndbg: module:test_dynamic_debug attached 5 classes
[   88.380881] dyndbg:  24 debug prints in module test_dynamic_debug
[   88.381315] dyndbg: module: test_dynamic_debug dyndbg="class FOO +p"
[   88.381714] dyndbg: query 0: "class FOO +p" mod:test_dynamic_debug
[   88.382109] dyndbg: split into words: "class" "FOO" "+p"
[   88.382445] dyndbg: op='+'
[   88.382616] dyndbg: flags=0x1
[   88.382802] dyndbg: *flagsp=0x1 *maskp=0xffffffff
[   88.383101] dyndbg: parsed: func="" file="" module="test_dynamic_debug"
format="" lineno=0-0 class=FOO
[   88.383740] dyndbg: applied: func="" file="" module="test_dynamic_debug"
format="" lineno=0-0 class=FOO
[   88.384324] dyndbg: processed 1 queries, with 2 matches, 0 errs
bash-5.1#

so its working at module-load time.


> For the entire class approach, did you spot another subsystem that could
> benefit from this and maybe make a more solid case that this is something
> good?
>

I had been working on the premise that ~4k drm*dbg callsites was a good
case.

verbosity-levels - with x<y logic instead of x==y is what's currently
missing.

the next revision adds something, which "kinda works".
But I think I'll rip it out, and do this simpler approach instead:

implement a verbose/levels  param & callback, which takes

   echo 3 > /sys/module/foo/parameters/debug_verbosity

and effectively does

  echo <<EOQRY  > /proc/dynamic_debug/control
module foo class V1 +p
module foo class V2 +p
module foo class V3 +p
module foo class V4 -p
module foo class V5 -p
module foo class V6 -p
module foo class V7 -p
module foo class V8 -p
EOQRY

since only real +/-p changes incur kernel-patching costs,
the remaining overheads are minimal.


> RFC for DRM:
>
> - decoration flags "fmlt" do not work on drm_*dbg().
>   (drm_*dbg() dont use pr_debug, they *become* one flavor of them)
>   this could (should?) be added, and maybe tailored for drm.
>   some of the device prefixes are very long, a "d" flag could optionalize
them.

I'm lost what the fmlt decoration flags are?


The flags are::

  p    enables the pr_debug() callsite.
  f    Include the function name in the printed message
  l    Include line number in the printed message
  m    Include module name in the printed message
  t    Include thread ID in messages not generated from interrupt context
  _    No flags are set. (Or'd with others on input)


the fmlt flags add a "decoration" prefix to enabled/printed log messages


> - api use needs review wrt drm life-cycle.
> >   enum drm_debug_category and DYNAMIC_DEBUG_CLASSES could be together?
>
> Hm if they're tied to module lifetime we should be good? Not sure what
> could go wrong here.
>
>
with the new __section, "life-cycle" doesnt really pertain.
the new issue is how the class-maps are shared across the subsystem;
the current class-maps list for each module will probably break;
a list item cannot be on N different lists of different modules.
Altering the list-items to ref the class-map (not contain it) should solve
the problem.




> > - class-names could stand review, perhaps extension
> >   "drm:core:" etc have appeared (maybe just from me)
> >   or a "plan" to look at it later
>
> Yeah it's been a bit sprawling. I'm kinda hoping that by firmly
> establishing dyndbg as the drm debug approach we can cut down for the need
> for ad-hoc flags a bit.
>
> yeah thats why I kept the DRM_UT_* names.
OTOH - the symbolic names patch exposes the choices,
which locks the names as API ??



> > - i915 & amdgpu have pr_debugs (DC_LOG_*, gvt_dbg_*) that have
> > class-ish prefixes that are separate from, but similar to DRM_UT_*,
> > and could stand review and possible unification with reformed or
> > extended drm categories.
>
> Yeah drm is not entirely consistent with how exactly driver debug printing
> should be done. Another reason why I'm hoping that the kitchen sync with
> everything approach you're doing here could help unify things.
>


the decoration flags can help here; they loosely/precisely describe
the elements of most/all the current debug format-prefix variations.
So case by case, the ad-hoc variations should map onto these flags,

The flags allow selectively dropping the prefix info from some of the log
entries,
after you've seen the module name and function a dozen times,
it's helpful to reduce screen clutter.

It might make sense to add a new flag for device,
so that dev_dbg() flavors can shorten-or-skip the longer device strings,
maybe some drm specific flavors.



>
> > - the change to enum drm_debug_category from bitmask values to 0..31
> >   means that we foreclose this possiblility:
> >
> >    drm_dbg(DRM_UT_CORE|DRM_UT_KMS, "wierd double-cat experiment");
>
> Yeah no, that doesn't make much sense to me :-)
>
> no chuckles for the schrodinger's cat joke ?
(maybe "yeah no" is the artful superpositional reply, I just caught :)


> > - nouveau has very few drm.debug calls,
> >   has NV_DEBUG, VMM_DEBUG, nvkm_printk_, I havent looked deeply.
>
>
nouveau has like levels, man ..
test_dynamic_debug implements its priority-style names as a POC

patch 18 converts nvkm_debug/trace to use dev_dbg instead of dev_info
it probably could adapt to use drm_devdbg




> Yeah see above. There's a pile more drivers (more on the armsoc side of
> things) which are quite big on the raw debug call approach.
>
>
LOW, MID, HI has been proposed at least once wrt dyndbg.
that probably fits well with current disjoint classes.
level/verbose classes should be practical too, as described above.

NB: The symbolic names should also work

   echo +MID > /sys/module/foobar/parameters/debug_verbosity

though theres some ambiguity with

   echo -V3 > /sys/module/foobar/parameters/debug_verbosity

that should turn off V4,5,6,
but what about V1,2 ?
it could leave them alone (whatever their previous settings are)

anyway, lkp-robot and igt-trybot should be grinding on the latest patchset
soon,
I'll send it after I fix whatever breaks.



> Cheers, Daniel
>

thanks,
Jim

--00000000000014abc905e0c8ba93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 25, 2022 at 9:02 AM Danie=
l Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ff=
wll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, May 16, 2022 at 04:56:13PM -0600, Jim Cromie wrote:<br>
&gt; DRM.debug API is 23 macros, issuing 10 exclusive categories of debug<b=
r>
&gt; messages.=C2=A0 By rough count, they are used 5140 times in the kernel=
.<br>
&gt; These all call drm_dbg or drm_devdbg, which call drm_debug_enabled(),<=
br>
&gt; which checks bits in global __drm_debug.=C2=A0 Some of these are page-=
flips<br>
&gt; and vblanks, and get called often.<br>
&gt; <br>
&gt; DYNAMIC_DEBUG (with CONFIG_JUMP_LABEL) is built to avoid this kind of<=
br>
&gt; work, with NOOPd jump/callsites.<br>
&gt; <br>
&gt; This patchset is RFC because:<br>
&gt; - it touches 2.5 subsystems: dyndbg, drm, tracefs (new events)<br>
&gt; - dyndbg class support is built for drm, needs it for validation<br>
&gt; - new api, used by drm<br>
&gt; - big memory impact, with 5100 new pr-debug callsites.<br>
&gt; - drm class bikeshedding opportunities<br>
&gt; - others, names etc.<br>
<br>
Thanks a lot for keeping on pushing this!</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; DYNAMIC_DEBUG:<br>
&gt;</blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; RFC:<br>
&gt; <br>
&gt; dynamic_debug_register_classes() cannot act early enough to be in<br>
&gt; effect at module-load.=C2=A0 So this will not work as you&#39;d reason=
ably<br>
&gt; expect:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0modprobe test_dynamic_debug dyndbg=3D&#39;+pfm; class FOO =
+pfmlt&#39;<br>
&gt; <br>
&gt; The 1st query:+pfm will be enabled during load, but in the 2nd query,<=
br>
&gt; &quot;class FOO&quot; will be unknown at load time.=C2=A0 Early class =
enablement<br>
&gt; would be nice.=C2=A0 DYNAMIC_DEBUG_CLASSES is a static initializer, wh=
ich<br>
&gt; is certainly early enough, but Im missing a trick, suggestions?<br>
<br>
So maybe I&#39;m just totally overloading this work here so feel free to<br=
>
ignore or postpone, but: Could we do the dynamic_debug_register_classes()<b=
r>
automatically at module load as a new special section? And then throw in a<=
br>
bit of kbuild so that in a given subsystem every driver gets the same<br>
class names by default and everything would just work, without having to<br=
>
sprinkle calls to dynamic_debug_register_classes() all over the place?<br><=
/blockquote><div><br></div><div>This is now done; Ive added __dyndbg_classe=
s section.</div><div>load_module() now grabs it from the .ko</div><div>and =
ddebug_add_module() attaches it to the module&#39;s ddebug_table record.</d=
iv><div>for builtins, dynamic_debug_init feeds the builtin class-maps to dd=
ebug_add_module</div><div><br></div><div>bash-5.1# modprobe test_dynamic_de=
bug dyndbg=3D&quot;class FOO +p&quot;<br>[ =C2=A0 88.374722] dyndbg: class[=
0]: nm:test_dynamic_debug base:20 len:7 ty:1<br>[ =C2=A0 88.375158] dyndbg:=
 =C2=A00: EMERG<br>[ =C2=A0 88.375345] dyndbg: =C2=A01: DANGER<br>[ =C2=A0 =
88.375540] dyndbg: =C2=A02: ERROR<br>[ =C2=A0 88.375726] dyndbg: =C2=A03: W=
ARNING<br>[ =C2=A0 88.375930] dyndbg: =C2=A04: NOTICE<br>[ =C2=A0 88.376130=
] dyndbg: =C2=A05: INFO<br>[ =C2=A0 88.376310] dyndbg: =C2=A06: DEBUG<br>[ =
=C2=A0 88.376499] dyndbg: class[1]: nm:test_dynamic_debug base:12 len:3 ty:=
1<br>[ =C2=A0 88.376903] dyndbg: =C2=A00: ONE<br>[ =C2=A0 88.377079] dyndbg=
: =C2=A01: TWO<br>[ =C2=A0 88.377253] dyndbg: =C2=A02: THREE<br>[ =C2=A0 88=
.377441] dyndbg: class[2]: nm:test_dynamic_debug base:8 len:3 ty:0<br>[ =C2=
=A0 88.377837] dyndbg: =C2=A00: bing<br>[ =C2=A0 88.378022] dyndbg: =C2=A01=
: bong<br>[ =C2=A0 88.378203] dyndbg: =C2=A02: boom<br>[ =C2=A0 88.378387] =
dyndbg: class[3]: nm:test_dynamic_debug base:4 len:3 ty:0<br>[ =C2=A0 88.37=
8800] dyndbg: =C2=A00: Foo<br>[ =C2=A0 88.378986] dyndbg: =C2=A01: Bar<br>[=
 =C2=A0 88.379167] dyndbg: =C2=A02: Buzz<br>[ =C2=A0 88.379348] dyndbg: cla=
ss[4]: nm:test_dynamic_debug base:0 len:3 ty:0<br>[ =C2=A0 88.379757] dyndb=
g: =C2=A00: FOO<br>[ =C2=A0 88.379938] dyndbg: =C2=A01: BAR<br>[ =C2=A0 88.=
380136] dyndbg: =C2=A02: BUZZ<br>[ =C2=A0 88.380410] dyndbg: module:test_dy=
namic_debug attached 5 classes<br>[ =C2=A0 88.380881] dyndbg: =C2=A024 debu=
g prints in module test_dynamic_debug<br>[ =C2=A0 88.381315] dyndbg: module=
: test_dynamic_debug dyndbg=3D&quot;class FOO +p&quot;<br>[ =C2=A0 88.38171=
4] dyndbg: query 0: &quot;class FOO +p&quot; mod:test_dynamic_debug<br>[ =
=C2=A0 88.382109] dyndbg: split into words: &quot;class&quot; &quot;FOO&quo=
t; &quot;+p&quot;<br>[ =C2=A0 88.382445] dyndbg: op=3D&#39;+&#39;<br>[ =C2=
=A0 88.382616] dyndbg: flags=3D0x1<br>[ =C2=A0 88.382802] dyndbg: *flagsp=
=3D0x1 *maskp=3D0xffffffff<br>[ =C2=A0 88.383101] dyndbg: parsed: func=3D&q=
uot;&quot; file=3D&quot;&quot; module=3D&quot;test_dynamic_debug&quot; form=
at=3D&quot;&quot; lineno=3D0-0 class=3DFOO<br>[ =C2=A0 88.383740] dyndbg: a=
pplied: func=3D&quot;&quot; file=3D&quot;&quot; module=3D&quot;test_dynamic=
_debug&quot; format=3D&quot;&quot; lineno=3D0-0 class=3DFOO<br>[ =C2=A0 88.=
384324] dyndbg: processed 1 queries, with 2 matches, 0 errs<br>bash-5.1#=C2=
=A0<br></div><div><br></div><div>so its working at module-load time.</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
For the entire class approach, did you spot another subsystem that could<br=
>
benefit from this and maybe make a more solid case that this is something<b=
r>
good?<br></blockquote><div><br></div><div>I had been working on the premise=
 that ~4k drm*dbg callsites was a good case.</div><div><br></div><div>verbo=
sity-levels - with x&lt;y logic instead=C2=A0of=C2=A0x=3D=3Dy is what&#39;s=
=C2=A0currently missing.</div><div><br></div><div>the next revision adds so=
mething, which &quot;kinda works&quot;.</div><div>But I think I&#39;ll rip =
it out, and do this simpler approach instead:</div><div><br></div><div>impl=
ement a verbose/levels=C2=A0 param &amp; callback, which takes</div><div><b=
r></div><div>=C2=A0 =C2=A0echo 3 &gt; /sys/module/foo/parameters/debug_verb=
osity</div><div><br></div><div>and effectively does</div><div><br></div><di=
v>=C2=A0 echo &lt;&lt;EOQRY=C2=A0 &gt; /proc/dynamic_debug/control</div><di=
v>module foo class V1 +p</div><div><div>module foo class V2 +p</div><div><d=
iv>module foo class V3 +p</div><div><div>module foo class V4 -p</div><div><=
div>module foo class V5 -p</div><div><div>module foo class V6 -p</div><div>=
<div>module foo class V7 -p</div><div><div>module foo class V8 -p</div><div=
>EOQRY</div></div></div></div></div></div></div></div><div><br></div><div>s=
ince only real=C2=A0+/-p changes incur=C2=A0kernel-patching costs,</div><di=
v>the remaining overheads are minimal.</div><div><br></div><div> <br>
&gt; RFC for DRM:<br>
&gt; <br>
&gt; - decoration flags &quot;fmlt&quot; do not work on drm_*dbg().<br>
&gt;=C2=A0 =C2=A0(drm_*dbg() dont use pr_debug, they *become* one flavor of=
 them)<br>
&gt;=C2=A0 =C2=A0this could (should?) be added, and maybe tailored for drm.=
<br>
&gt;=C2=A0 =C2=A0some of the device prefixes are very long, a &quot;d&quot;=
 flag could optionalize them.<br>
<br>
I&#39;m lost what the fmlt decoration flags are?<br>
<br></div><br>The flags are::<br><br>=C2=A0 p =C2=A0 =C2=A0enables the pr_d=
ebug() callsite.<br>=C2=A0 f =C2=A0 =C2=A0Include the function name in the =
printed message<br>=C2=A0 l =C2=A0 =C2=A0Include line number in the printed=
 message<br>=C2=A0 m =C2=A0 =C2=A0Include module name in the printed messag=
e<br>=C2=A0 t =C2=A0 =C2=A0Include thread ID in messages not generated from=
 interrupt context<br>=C2=A0 _ =C2=A0 =C2=A0No flags are set. (Or&#39;d wit=
h others on input)<br><div><br></div><div><br></div><div>the fmlt flags add=
 a &quot;decoration&quot; prefix to enabled/printed log messages</div><div>=
<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; - api use needs review wrt drm life-cycle.<br>
&gt;=C2=A0 =C2=A0enum drm_debug_category and DYNAMIC_DEBUG_CLASSES could be=
 together?<br>
<br>
Hm if they&#39;re tied to module lifetime we should be good? Not sure what<=
br>
could go wrong here.<br>
<br></blockquote><div><br></div><div>with the new __section, &quot;life-cyc=
le&quot; doesnt really pertain.</div><div>the new issue is how the class-ma=
ps are shared across the subsystem;</div><div>the current class-maps list f=
or each module will probably break;</div><div>a list item cannot be on N di=
fferent lists of different modules.</div><div>Altering the list-items to re=
f the class-map (not contain it) should solve the problem.</div><div><br></=
div><div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt; - class-names could stand review, perhaps extension<br>
&gt;=C2=A0 =C2=A0&quot;drm:core:&quot; etc have appeared (maybe just from m=
e)<br>
&gt;=C2=A0 =C2=A0or a &quot;plan&quot; to look at it later<br>
<br>
Yeah it&#39;s been a bit sprawling. I&#39;m kinda hoping that by firmly<br>
establishing dyndbg as the drm debug approach we can cut down for the need<=
br>
for ad-hoc flags a bit.<br>
<br></blockquote><div>yeah thats why I kept the DRM_UT_* names.</div><div>O=
TOH - the symbolic names patch exposes the choices,</div><div>which locks t=
he names as API ??</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; - i915 &amp; amdgpu have pr_debugs (DC_LOG_*, gvt_dbg_*) that have<br>
&gt; class-ish prefixes that are separate from, but similar to DRM_UT_*,<br=
>
&gt; and could stand review and possible unification with reformed or<br>
&gt; extended drm categories.<br>
<br>
Yeah drm is not entirely consistent with how exactly driver debug printing<=
br>
should be done. Another reason why I&#39;m hoping that the kitchen sync wit=
h<br>
everything approach you&#39;re doing here could help unify things.<br></blo=
ckquote><div><br></div><div><br></div><div>the decoration flags can help he=
re; they loosely/precisely describe</div><div>the elements of most/all the =
current debug format-prefix variations.</div><div>So case by case, the ad-h=
oc variations should map onto these flags,</div><div><br></div><div>The fla=
gs allow selectively dropping the prefix info from some of the log entries,=
</div><div>after you&#39;ve=C2=A0seen the module name and function a dozen =
times,=C2=A0</div><div>it&#39;s helpful to reduce screen clutter.</div><div=
><br></div><div>It might make sense to add a new flag for device,</div><div=
>so that dev_dbg() flavors can shorten-or-skip the longer device strings,=
=C2=A0</div><div>maybe some drm specific flavors.</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; - the change to enum drm_debug_category from bitmask values to 0..31<b=
r>
&gt;=C2=A0 =C2=A0means that we foreclose this possiblility:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 drm_dbg(DRM_UT_CORE|DRM_UT_KMS, &quot;wierd double-cat ex=
periment&quot;);<br>
<br>
Yeah no, that doesn&#39;t make much sense to me :-)<br>
<br></blockquote><div>no chuckles for the schrodinger&#39;s cat joke ?</div=
><div>(maybe &quot;yeah no&quot; is the artful superpositional reply, I jus=
t caught :)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; - nouveau has very few drm.debug calls,<br>
&gt;=C2=A0 =C2=A0has NV_DEBUG, VMM_DEBUG, nvkm_printk_, I havent looked dee=
ply.<br>
<br></blockquote><div><br></div><div>nouveau has like levels, man ..</div><=
div>test_dynamic_debug implements its priority-style names as a POC</div><d=
iv><br></div><div>patch 18 converts nvkm_debug/trace to use dev_dbg instead=
 of dev_info<br></div><div>it probably could adapt to use drm_devdbg</div><=
div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Yeah see above. There&#39;s a pile more drivers (more on the armsoc side of=
<br>
things) which are quite big on the raw debug call approach.<br>
<br></blockquote><div><br></div><div><div>LOW, MID, HI has been proposed at=
 least once wrt dyndbg.</div><div>that probably fits well with current disj=
oint classes.</div><div>level/verbose classes should be practical too, as d=
escribed above.</div><div><br></div><div>NB: The symbolic names should also=
 work=C2=A0</div><div><br></div><div>=C2=A0 =C2=A0echo +MID &gt; /sys/modul=
e/foobar/parameters/debug_verbosity</div><div>=C2=A0</div></div><div>though=
 theres some ambiguity with</div><div><br></div><div><div>=C2=A0 =C2=A0echo=
 -V3 &gt; /sys/module/foobar/parameters/debug_verbosity</div><br class=3D"g=
mail-Apple-interchange-newline"></div><div>that should turn off V4,5,6,=C2=
=A0</div><div>but what about V1,2 ?</div><div>it could leave them alone (wh=
atever their previous settings are)</div><div><br></div><div>anyway, lkp-ro=
bot and igt-trybot should be grinding on the latest patchset soon,</div><di=
v>I&#39;ll send it after I fix whatever breaks.</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers, Daniel<br></blockquote><div><br></div><div>thanks,=C2=A0</div><div>=
Jim=C2=A0</div></div></div>

--00000000000014abc905e0c8ba93--
