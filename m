Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC862CD0EF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A196E99A;
	Thu,  3 Dec 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118BF6EA9E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 19:48:46 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id t15so865047ual.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 11:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zeaG5Vv3nN3pm8uY5xDl8GWDCSTrk8TATzToI8vUTaY=;
 b=eJar/XbUckhOoytNhD4G1kX/iwQlG6CFdaBXjqeBbB6kTQBBIyinHEH9N7N1IZJ4FG
 U+sz+zODdFXD4WepR2dkp6DVKZl2zcvdrcAixlUuNLY3zTcv4mrMt2nmAYEwlADuteBP
 5FnkezaNGvZ2jy0ScSz3aMfaF1hanD+w9Cl/qPGBuRxYmV29yjJmStt52LVJgnb4k52R
 OxyIYueUcNs+RbQe+Scm7185bxSRNqxZVulIY0FxtxXimy9O9zTUapexENo7KN8gDs20
 UdHs+HcRSqHijypwwXeSAHMXknDljz5DGXn/d+OVWg1dFDbVKIdsN/VDbq0qu7f9fgNL
 8SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zeaG5Vv3nN3pm8uY5xDl8GWDCSTrk8TATzToI8vUTaY=;
 b=hY7OSQ9ke5uJZtCOPIzYqh897sUKcYcbzZ5tpt0rIcYZiD1ihuaUPT13rT26RvY0lZ
 XBxboQx7AKXcd/wp7mmrHNBZi72v4OtTmRV9qllUmCMyutdELqBYdgM/Rz5TS2Eh4IsM
 rzzfIQTFfVa/k2UiuxvsljtuwfEVLM9x08CsEiDbXMzDRlmGJ0ahOLD00iUMucL/ON9z
 ibPVR2y4A0zD5YEfWaiCTqUGqLoo/6vWvt14Be39AuVFiGA0ikD0lFfmW5SIc1Cnv8Q2
 OXLgEcwiMFRcRZ8m6Q5cGlaEKBp6LU9wG00q1Os/A3pVQWlApDpyb/lqxkC/3tCpuQtF
 1Oag==
X-Gm-Message-State: AOAM531QFXDEWlzuupr/Ayjy0A04BfPODSvZ3sNLkIxLuEJLJxfZEreF
 38lziRiFlg5RrwvqK94Qr+UO+I9+122q6l5x4jcfsw==
X-Google-Smtp-Source: ABdhPJxKUsGh+SzDhaMe3E4YH5TmL4tCNqqHJ5uL6Ij+0YoTVXc8PVKDqJHPn4oGLB7DbH68u9iO1OFrjCWlkrhnOMc=
X-Received: by 2002:ab0:23cc:: with SMTP id c12mr2449239uan.89.1606938526057; 
 Wed, 02 Dec 2020 11:48:46 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
In-Reply-To: <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
From: James Park <james.park@lagfreegames.com>
Date: Wed, 2 Dec 2020 11:47:53 -0800
Message-ID: <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0831225976=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0831225976==
Content-Type: multipart/alternative; boundary="000000000000059d9f05b5808844"

--000000000000059d9f05b5808844
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can avoid modifying drm.h by doing this to drm_fourcc.h:

#ifdef _WIN32
#include <stdint.h>
typedef uint64_t __u64;
#else
#include "drm.h"
#endif

And this to amdgpu_drm.h:

#ifdef _WIN32
#include <stdint.h>
typedef int32_t  __s32;
typedef uint32_t __u32;
typedef uint64_t __u64;
#else
#include "drm.h"
#endif

But now I'm touching two files under drm-uapi instead of one, and weirdly.

If we're trying to cut ties with the drm-uapi folder entirely, the stuff
ac_surface.c need includes the AMD_FMT_MOD stuff in drm_fourcc.h,
and AMDGPU_TILING_* under amdgpu_drm.h. Is there a better spot for these
definitions?

Thanks,
James

On Wed, Dec 2, 2020 at 10:06 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:

> On 2020-12-02 1:46 p.m., Daniel Vetter wrote:
> > On Wed, Dec 2, 2020 at 12:43 PM Michel D=C3=A4nzer <michel@daenzer.net>
> wrote:
> >>
> >> On 2020-12-01 11:01 a.m., James Park wrote:
> >>> This will allow Mesa to port code to Windows more easily.
> >>
> >> As discussed in
> >>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6162#note_71277=
9
> >> , including drm.h makes no sense when building for Windows.
> >
> > Yeah I think it'd be cleanest if we can avoid this. If not I think the
> > right fix would be to split out the actually needed parts from drm.h
> > into a new header (still included by drm.h for backwards compat
> > reasons) which mesa can use. Since it looks like the problematic parts
> > are the legacy gunk, and not the new ioctl structures. Pulling out
> > drm_render.h for all the render stuff and mabe drm_vblank.h for the
> > vblank stuff (which would fit better in drm_mode.h but mistakes were
> > made, oops).
>
> If anything currently in drm.h is needed while building for Windows, it
> points to a broken abstraction somewhere in userspace. (Specifically,
> the Mesa Gallium/Vulkan winsys is supposed to abstract away platform
> details like these)
>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
>

--000000000000059d9f05b5808844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can avoid modifying drm.h by doing this to drm_fourcc.h:=
<div><br></div><div>#ifdef _WIN32<br>#include &lt;stdint.h&gt;<br>typedef u=
int64_t __u64;<br>#else<br>#include &quot;drm.h&quot;<br>#endif<br></div><d=
iv><br></div><div>And this to amdgpu_drm.h:</div><div><br></div><div>#ifdef=
 _WIN32<br>#include &lt;stdint.h&gt;<br>typedef int32_t =C2=A0__s32;<br>typ=
edef uint32_t __u32;<br>typedef uint64_t __u64;<br>#else<br>#include &quot;=
drm.h&quot;<br>#endif<br></div><div><br></div><div>But now I&#39;m touching=
 two files under drm-uapi instead of one, and weirdly.</div><div><br></div>=
<div>If we&#39;re trying to cut ties with the drm-uapi folder entirely, the=
 stuff ac_surface.c need includes the AMD_FMT_MOD stuff in drm_fourcc.h, an=
d=C2=A0AMDGPU_TILING_* under amdgpu_drm.h. Is there a better spot for these=
 definitions?</div><div><br></div><div>Thanks,</div><div>James</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Dec 2, 2020 at 10:06 AM Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel@da=
enzer.net" target=3D"_blank">michel@daenzer.net</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 2020-12-02 1:46 p.m., Dan=
iel Vetter wrote:<br>
&gt; On Wed, Dec 2, 2020 at 12:43 PM Michel D=C3=A4nzer &lt;<a href=3D"mail=
to:michel@daenzer.net" target=3D"_blank">michel@daenzer.net</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; On 2020-12-01 11:01 a.m., James Park wrote:<br>
&gt;&gt;&gt; This will allow Mesa to port code to Windows more easily.<br>
&gt;&gt;<br>
&gt;&gt; As discussed in<br>
&gt;&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_reques=
ts/6162#note_712779" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fr=
eedesktop.org/mesa/mesa/-/merge_requests/6162#note_712779</a><br>
&gt;&gt; , including drm.h makes no sense when building for Windows.<br>
&gt; <br>
&gt; Yeah I think it&#39;d be cleanest if we can avoid this. If not I think=
 the<br>
&gt; right fix would be to split out the actually needed parts from drm.h<b=
r>
&gt; into a new header (still included by drm.h for backwards compat<br>
&gt; reasons) which mesa can use. Since it looks like the problematic parts=
<br>
&gt; are the legacy gunk, and not the new ioctl structures. Pulling out<br>
&gt; drm_render.h for all the render stuff and mabe drm_vblank.h for the<br=
>
&gt; vblank stuff (which would fit better in drm_mode.h but mistakes were<b=
r>
&gt; made, oops).<br>
<br>
If anything currently in drm.h is needed while building for Windows, it <br=
>
points to a broken abstraction somewhere in userspace. (Specifically, <br>
the Mesa Gallium/Vulkan winsys is supposed to abstract away platform <br>
details like these)<br>
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat=
.com</a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br>
</blockquote></div>

--000000000000059d9f05b5808844--

--===============0831225976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0831225976==--
