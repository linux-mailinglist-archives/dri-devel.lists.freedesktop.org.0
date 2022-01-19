Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E755649373D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFA910EA5B;
	Wed, 19 Jan 2022 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936F510EA57;
 Wed, 19 Jan 2022 09:28:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id a18so8275912edj.7;
 Wed, 19 Jan 2022 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZpjZiXge5MmLdeZ7sq62ywqFLlshFcV242w1B1ga8fE=;
 b=alYODJFwKJyRXVgjCth6glBQ83blPbhgQGo/sKN3ZZ0kWO417f3L/4pJ1/SlzdDTQq
 AJVy81nkYez2Ys3CVjm1fbAxTB8ZcvAYVd+6RVN+SrL0rvyOGW32FmMybkLPe45Mbf9a
 pGZ4YJK3/fRPLNPN+sq34WAQ2CgLGNTGklvMvonBXMMTAR3AW6G3X90zQjDK7/wAjUVn
 QYsMUALvP7okIJOrrrKojdwdK43064rtKD0qOJYWFoaS7b0dXKKrsST0V9+tK3txvYpC
 kmNr04dKaaYql3IJC++NcRucl1mR3xKBl/kMl6b5lwcWXoHvV4P65C99RUDI94OWPDUI
 SRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZpjZiXge5MmLdeZ7sq62ywqFLlshFcV242w1B1ga8fE=;
 b=MHxui0Rqslv26nmOqdPP6N0fCONTz/6mxVILBWPWJcGbNmvhDVPYfIPE1Wj5yq4reS
 Qy7+NlACz8ivFy8/6dDFiuT1bNcSKpZwUy/xxXE0Gsmwz6RkBmPe9h6MRwLtdT8l0caD
 JWX9V8AW8QRUAV5Vvc3DCZj/g4MQVv7cnwck9Dj+56hELs+RHus024ePSpR+I7LBwBMK
 3LUqJLo5B1qI0YKEdJqbCBPwv7WqtjzwwpPZ053lh6+mVCWUvUwLx9yUthzTlX6tjswg
 mlsIxBJDT6tMVVP8ACC+g/BJllPH6izvXo9ZcSKQ9NQ4BANgg4fqh4GFQqyGbqsN6bmB
 zpiA==
X-Gm-Message-State: AOAM532rzf71edgVnO3a2f1Nd6RrEGO50Q73tt4tzatIoEMFEWdXKah+
 NADEHDfGNr82cNjoRTkCgASp3erpTYPwhbSfvWg=
X-Google-Smtp-Source: ABdhPJx0+0PoGb9LmeItG8Oe9e0LaAcBBxz4OlRtPZtJuTrjHgW+G57PsDi+wgXkupxxYhfKxWl20N+4+hMdKmpgkJk=
X-Received: by 2002:a05:6402:4c5:: with SMTP id
 n5mr29750107edw.122.1642584481124; 
 Wed, 19 Jan 2022 01:28:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:9713:0:0:0:0 with HTTP; Wed, 19 Jan 2022 01:28:00
 -0800 (PST)
In-Reply-To: <20220119072450.2890107-1-lucas.demarchi@intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Jan 2022 11:28:00 +0200
Message-ID: <CAHp75Veu+b48FiEwvPy1v2LUw9ytk7Hj9w06B8nTHFOddefMSA@mail.gmail.com>
Subject: Re: [PATCH 0/3] lib/string_helpers: Add a few string helpers
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: multipart/alternative; boundary="00000000000082d4da05d5ec006a"
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Mikita Lipski <mikita.lipski@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Raju Rangoju <rajur@chelsio.com>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Eryk Brol <eryk.brol@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000082d4da05d5ec006a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday, January 19, 2022, Lucas De Marchi <lucas.demarchi@intel.com>
wrote:

> Add some helpers under lib/string_helpers.h so they can be used
> throughout the kernel. When I started doing this there were 2 other
> previous attempts I know of, not counting the iterations each of them
> had:
>
> 1) https://lore.kernel.org/all/20191023131308.9420-1-jani.
> nikula@intel.com/
> 2) https://lore.kernel.org/all/20210215142137.64476-1-andriy.
> shevchenko@linux.intel.com/#t
>
> Going through the comments I tried to find some common ground and
> justification for what is in here, addressing some of the concerns
> raised.
>
> a. This version should be a drop-in replacement for what is currently in
>    the tree, with no change in behavior or binary size. For binary
>    size what I checked wat that the linked objects in the end have the
>    same size (gcc 11). From comments in the previous attempts this seems
>    also the case for earlier compiler versions
>
> b. I didn't change the function name to choice_* as suggested by Andrew
>    Morton in 20191023155619.43e0013f0c8c673a5c508c1e@linux-foundation.org
>    because other people argumented in favor of shorter names for these
>    simple helpers - if they are long and people simply not use due to
>    that, we failed
>
> c. Use string_helper.h for these helpers - pulling string.h in the
>    compilations units was one of the concerns and I think re-using this
>    already existing header is better than creating a new string-choice.h
>
> d. This doesn't bring onoff() helper as there are some places in the
>    kernel with onoff as variable - another name is probably needed for
>    this function in order not to shadow the variable, or those variables
>    could be renamed.  Or if people wanting  <someprefix>
>    try to find a short one
>
> e. One alternative to all of this suggested by Christian K=C3=B6nig
>    (43456ba7-c372-84cc-4949-dcb817188e21@amd.com) would be to add a
>    printk format. But besides the comment, he also seemed to like
>    the common function. This brought the argument from others that the
>    simple yesno()/enabledisable() already used in the code is easier to
>    remember and use than e.g. %py[DOY]
>
> Last patch also has some additional conversion of open coded cases. I
> preferred starting with drm/ since this is "closer to home".
>
> I hope this is a good summary of the previous attempts and a way we can
> move forward.
>
> Andrew Morton, Petr Mladek, Andy Shevchenko: if this is accepted, my
> proposal is to take first 2 patches either through mm tree or maybe
> vsprintf. Last patch can be taken later through drm.



I believe the best if we go via drm-misc with the entire series.

I have couple of comments, after addressing them:

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> thanks
> Lucas De Marchi
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Eryk Brol <eryk.brol@amd.com>
> Cc: Francis Laniel <laniel_francis@privacyrequired.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Cc: Kentaro Takeda <takedakn@nttdata.co.jp>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
> Cc: Raju Rangoju <rajur@chelsio.com>
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Vishal Kulkarni <vishal@chelsio.com>
>
> Lucas De Marchi (3):
>   lib/string_helpers: Consolidate yesno() implementation
>   lib/string_helpers: Add helpers for enable[d]/disable[d]
>   drm: Convert open yes/no strings to yesno()
>
>  drivers/gpu/drm/amd/amdgpu/atom.c              |  3 ++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  6 +-----
>  drivers/gpu/drm/drm_client_modeset.c           |  3 ++-
>  drivers/gpu/drm/drm_dp_helper.c                |  3 ++-
>  drivers/gpu/drm/drm_gem.c                      |  3 ++-
>  drivers/gpu/drm/i915/i915_utils.h              | 15 ---------------
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c  |  4 +++-
>  drivers/gpu/drm/radeon/atom.c                  |  3 ++-
>  drivers/gpu/drm/v3d/v3d_debugfs.c              | 11 ++++++-----
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c       |  3 ++-
>  .../net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c | 11 -----------
>  include/linux/string_helpers.h                 |  4 ++++
>  security/tomoyo/audit.c                        |  2 +-
>  security/tomoyo/common.c                       | 18 ++++--------------
>  security/tomoyo/common.h                       |  1 -
>  15 files changed, 31 insertions(+), 59 deletions(-)
>
> --
> 2.34.1
>
>

--=20
With Best Regards,
Andy Shevchenko

--00000000000082d4da05d5ec006a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, January 19, 2022, Lucas De Marchi &lt;<a href=3D"mail=
to:lucas.demarchi@intel.com">lucas.demarchi@intel.com</a>&gt; wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Add some helpers under lib/string_helpers.h so =
they can be used<br>
throughout the kernel. When I started doing this there were 2 other<br>
previous attempts I know of, not counting the iterations each of them<br>
had:<br>
<br>
1) <a href=3D"https://lore.kernel.org/all/20191023131308.9420-1-jani.nikula=
@intel.com/" target=3D"_blank">https://lore.kernel.org/all/<wbr>20191023131=
308.9420-1-jani.<wbr>nikula@intel.com/</a><br>
2) <a href=3D"https://lore.kernel.org/all/20210215142137.64476-1-andriy.she=
vchenko@linux.intel.com/#t" target=3D"_blank">https://lore.kernel.org/all/<=
wbr>20210215142137.64476-1-andriy.<wbr>shevchenko@linux.intel.com/#t</a><br=
>
<br>
Going through the comments I tried to find some common ground and<br>
justification for what is in here, addressing some of the concerns<br>
raised.<br>
<br>
a. This version should be a drop-in replacement for what is currently in<br=
>
=C2=A0 =C2=A0the tree, with no change in behavior or binary size. For binar=
y<br>
=C2=A0 =C2=A0size what I checked wat that the linked objects in the end hav=
e the<br>
=C2=A0 =C2=A0same size (gcc 11). From comments in the previous attempts thi=
s seems<br>
=C2=A0 =C2=A0also the case for earlier compiler versions<br>
<br>
b. I didn&#39;t change the function name to choice_* as suggested by Andrew=
<br>
=C2=A0 =C2=A0Morton in <a href=3D"mailto:20191023155619.43e0013f0c8c673a5c5=
08c1e@linux-foundation.org">20191023155619.<wbr>43e0013f0c8c673a5c508c1e@<w=
br>linux-foundation.org</a><br>
=C2=A0 =C2=A0because other people argumented in favor of shorter names for =
these<br>
=C2=A0 =C2=A0simple helpers - if they are long and people simply not use du=
e to<br>
=C2=A0 =C2=A0that, we failed<br>
<br>
c. Use string_helper.h for these helpers - pulling string.h in the<br>
=C2=A0 =C2=A0compilations units was one of the concerns and I think re-usin=
g this<br>
=C2=A0 =C2=A0already existing header is better than creating a new string-c=
hoice.h<br>
<br>
d. This doesn&#39;t bring onoff() helper as there are some places in the<br=
>
=C2=A0 =C2=A0kernel with onoff as variable - another name is probably neede=
d for<br>
=C2=A0 =C2=A0this function in order not to shadow the variable, or those va=
riables<br>
=C2=A0 =C2=A0could be renamed.=C2=A0 Or if people wanting=C2=A0 &lt;somepre=
fix&gt;<br>
=C2=A0 =C2=A0try to find a short one<br>
<br>
e. One alternative to all of this suggested by Christian K=C3=B6nig<br>
=C2=A0 =C2=A0(<a href=3D"mailto:43456ba7-c372-84cc-4949-dcb817188e21@amd.co=
m">43456ba7-c372-84cc-4949-<wbr>dcb817188e21@amd.com</a>) would be to add a=
<br>
=C2=A0 =C2=A0printk format. But besides the comment, he also seemed to like=
<br>
=C2=A0 =C2=A0the common function. This brought the argument from others tha=
t the<br>
=C2=A0 =C2=A0simple yesno()/enabledisable() already used in the code is eas=
ier to<br>
=C2=A0 =C2=A0remember and use than e.g. %py[DOY]<br>
<br>
Last patch also has some additional conversion of open coded cases. I<br>
preferred starting with drm/ since this is &quot;closer to home&quot;.<br>
<br>
I hope this is a good summary of the previous attempts and a way we can<br>
move forward.<br>
<br>
Andrew Morton, Petr Mladek, Andy Shevchenko: if this is accepted, my<br>
proposal is to take first 2 patches either through mm tree or maybe<br>
vsprintf. Last patch can be taken later through drm.</blockquote><div><br><=
/div><div><br></div><div>I believe the best if we go via drm-misc with the =
entire series.</div><div><br></div><div>I have couple of comments, after ad=
dressing them:</div><div><br></div><div>Reviewed-by: Andy Shevchenko &lt;<a=
 href=3D"mailto:andy.shevchenko@gmail.com">andy.shevchenko@gmail.com</a>&gt=
;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
thanks<br>
Lucas De Marchi<br>
<br>
Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com">alexander=
.deucher@amd.com</a>&gt;<br>
Cc: Andrew Morton &lt;<a href=3D"mailto:akpm@linux-foundation.org">akpm@lin=
ux-foundation.org</a>&gt;<br>
Cc: Andy Shevchenko &lt;<a href=3D"mailto:andriy.shevchenko@linux.intel.com=
">andriy.shevchenko@linux.<wbr>intel.com</a>&gt;<br>
Cc: Andy Shevchenko &lt;<a href=3D"mailto:andy.shevchenko@gmail.com">andy.s=
hevchenko@gmail.com</a>&gt;<br>
Cc: Ben Skeggs &lt;<a href=3D"mailto:bskeggs@redhat.com">bskeggs@redhat.com=
</a>&gt;<br>
Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com">ch=
ristian.koenig@amd.com</a>&gt;<br>
Cc: Chris Wilson &lt;<a href=3D"mailto:chris@chris-wilson.co.uk">chris@chri=
s-wilson.co.uk</a>&gt;<br>
Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a=
>&gt;<br>
Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie">airlied@linux.ie</=
a>&gt;<br>
Cc: David S. Miller &lt;<a href=3D"mailto:davem@davemloft.net">davem@daveml=
oft.net</a>&gt;<br>
Cc: Emma Anholt &lt;<a href=3D"mailto:emma@anholt.net">emma@anholt.net</a>&=
gt;<br>
Cc: Eryk Brol &lt;<a href=3D"mailto:eryk.brol@amd.com">eryk.brol@amd.com</a=
>&gt;<br>
Cc: Francis Laniel &lt;<a href=3D"mailto:laniel_francis@privacyrequired.com=
">laniel_francis@<wbr>privacyrequired.com</a>&gt;<br>
Cc: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gr=
egkh@linuxfoundation.org</a>&gt;<br>
Cc: Harry Wentland &lt;<a href=3D"mailto:harry.wentland@amd.com">harry.went=
land@amd.com</a>&gt;<br>
Cc: Jakub Kicinski &lt;<a href=3D"mailto:kuba@kernel.org">kuba@kernel.org</=
a>&gt;<br>
Cc: Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com">jani.nik=
ula@linux.intel.com</a>&gt;<br>
Cc: Joonas Lahtinen &lt;<a href=3D"mailto:joonas.lahtinen@linux.intel.com">=
joonas.lahtinen@linux.intel.<wbr>com</a>&gt;<br>
Cc: Julia Lawall &lt;<a href=3D"mailto:julia.lawall@lip6.fr">julia.lawall@l=
ip6.fr</a>&gt;<br>
Cc: Kentaro Takeda &lt;<a href=3D"mailto:takedakn@nttdata.co.jp">takedakn@n=
ttdata.co.jp</a>&gt;<br>
Cc: Leo Li &lt;<a href=3D"mailto:sunpeng.li@amd.com">sunpeng.li@amd.com</a>=
&gt;<br>
Cc: Mikita Lipski &lt;<a href=3D"mailto:mikita.lipski@amd.com">mikita.lipsk=
i@amd.com</a>&gt;<br>
Cc: Petr Mladek &lt;<a href=3D"mailto:pmladek@suse.com">pmladek@suse.com</a=
>&gt;<br>
Cc: Rahul Lakkireddy &lt;<a href=3D"mailto:rahul.lakkireddy@chelsio.com">ra=
hul.lakkireddy@chelsio.com</a>&gt;<br>
Cc: Raju Rangoju &lt;<a href=3D"mailto:rajur@chelsio.com">rajur@chelsio.com=
</a>&gt;<br>
Cc: Rasmus Villemoes &lt;<a href=3D"mailto:linux@rasmusvillemoes.dk">linux@=
rasmusvillemoes.dk</a>&gt;<br>
Cc: Rodrigo Vivi &lt;<a href=3D"mailto:rodrigo.vivi@intel.com">rodrigo.vivi=
@intel.com</a>&gt;<br>
Cc: Sakari Ailus &lt;<a href=3D"mailto:sakari.ailus@linux.intel.com">sakari=
.ailus@linux.intel.com</a>&gt;<br>
Cc: Sergey Senozhatsky &lt;<a href=3D"mailto:sergey.senozhatsky@gmail.com">=
sergey.senozhatsky@gmail.com</a>&gt;<br>
Cc: Steven Rostedt &lt;<a href=3D"mailto:rostedt@goodmis.org">rostedt@goodm=
is.org</a>&gt;<br>
Cc: Vishal Kulkarni &lt;<a href=3D"mailto:vishal@chelsio.com">vishal@chelsi=
o.com</a>&gt;<br>
<br>
Lucas De Marchi (3):<br>
=C2=A0 lib/string_helpers: Consolidate yesno() implementation<br>
=C2=A0 lib/string_helpers: Add helpers for enable[d]/disable[d]<br>
=C2=A0 drm: Convert open yes/no strings to yesno()<br>
<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/<wbr>atom.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0.../amd/display/amdgpu_dm/<wbr>amdgpu_dm_debugfs.c=C2=A0 |=C2=A0 6 +-=
----<br>
=C2=A0drivers/gpu/drm/drm_client_<wbr>modeset.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0drivers/gpu/drm/drm_dp_helper.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0drivers/gpu/drm/drm_gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0drivers/gpu/drm/i915/i915_<wbr>utils.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 15 ---------------<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/i2c/aux.c=C2=A0 |=C2=A0 4 ++=
+-<br>
=C2=A0drivers/gpu/drm/radeon/atom.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0drivers/gpu/drm/v3d/v3d_<wbr>debugfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 11 ++++++-----<br>
=C2=A0drivers/gpu/drm/virtio/<wbr>virtgpu_debugfs.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 ++-<br>
=C2=A0.../net/ethernet/chelsio/<wbr>cxgb4/cxgb4_debugfs.c | 11 -----------<=
br>
=C2=A0include/linux/string_helpers.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
=C2=A0security/tomoyo/audit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0security/tomoyo/common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++--------------<br>
=C2=A0security/tomoyo/common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A015 files changed, 31 insertions(+), 59 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--00000000000082d4da05d5ec006a--
