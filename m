Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8D32CD0FE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E7D6E9AE;
	Thu,  3 Dec 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E8A6EB23
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 01:24:55 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id x26so396154vsq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 17:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+yxhhPrMEBdL5xRvAmFZ0mDRr0SdyYp+fnZaYiPyrk4=;
 b=EhyEzdfsVYWWAAC+D72PnOnPSSe0TV6DrvSrkDTN0eJj6AnV/Oww2btyDfdgwgx7An
 yGBzX6e/zcZ9Hs+WPQZro6+2y5uoDp1vHZWNDln+PSKnhmjBRrRGgCmQbg1bRGwsaSB1
 IeJG4rfZoMe+xq/fQDxb0dX+MqorBAalsTqnWXD5bJi3MR+dnsTtIugSouIzF4IgtKyp
 tz0o58nw4WcMkLT+SEK4/WZKC1JY+8hUxJfn5rtEB+TYhW6nsHuFyNtzWttC7B0+Itcy
 nH5O9w/QWAoh0UdhRHlqkE5A1pNYRrxm8CTOEndO03IoCDWJYQSa69kMrZl06WkXvk1s
 us+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+yxhhPrMEBdL5xRvAmFZ0mDRr0SdyYp+fnZaYiPyrk4=;
 b=Mlg6zFeXTExC6iXx+A2w7vnHnc4UF8Er+F3zMEXFwr3KaCTdYzVW5fd0gkDaqp1JZn
 uoGTjpeDecGAMrV/Ong1XPWQgMSRP6kEjaTk7iQqadLAcul5Skyh947l3I7dSkaAvDHo
 mKvQxzpvYymnDb5Ze6i+9Zs+m0aRpnI+NDVkKIt9y/dlOuLbOV3+EVsI0mAbcoRVjUlQ
 sxOtv7fUjuwkOhwtGZ5hWuXu4UEyIL0dmWWRVDkSk7BL6hLwW0DWOGr+3zC+89bIzDPe
 A1Lj14O2bgqhGujtNmd9ewCGLTlMGkfSovZtlMem+qBpL4SmsEa8N3M8jo9N8rujXNqm
 LEuw==
X-Gm-Message-State: AOAM5319lmjiYVsANfKuISdXkr+RQzHGYnqpMB3WjXQE0G18JhquTRzS
 aqWEFn4vf02mweG87jxiPzMUnT/TkpF4P0u5xU9ap2JpbMePAHr1
X-Google-Smtp-Source: ABdhPJypgBdNT6iBivbqeE77XzRHE8GP0ug9A196oWKrx1MbKgubZhrF25WkVcvJwfIj3bOpmKeheKpdPuIY8UqeWQQ=
X-Received: by 2002:a05:6102:30aa:: with SMTP id
 y10mr751871vsd.45.1606958694783; 
 Wed, 02 Dec 2020 17:24:54 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <CAKMK7uFQcyKRb90FiWFGf3pqotMmLvsTDf9yc7m1Or1tYkdOOA@mail.gmail.com>
In-Reply-To: <CAKMK7uFQcyKRb90FiWFGf3pqotMmLvsTDf9yc7m1Or1tYkdOOA@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Wed, 2 Dec 2020 17:24:10 -0800
Message-ID: <CABjik9cQpjYNiuihLZUtJfHDtjrhuAmaXMXj5uo_4Ay5iuKnZw@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1053128531=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1053128531==
Content-Type: multipart/alternative; boundary="0000000000002bf05a05b5853a61"

--0000000000002bf05a05b5853a61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If the definitions in drm_fourcc.h make sense to live there, and we can't
remove drm.h from that header for backward compatibility, and the code that
I'm trying to compile on Windows needs the definitions in drm_fourcc.h,
then doesn't it make sense to adjust drm.h?

The patch that I'm proposing doesn't change very much. It might be easier
to read here:
https://github.com/jpark37/linux/commit/648e9281824ddc943c3ea6b34d6d6c15471=
7a0a3

Thanks,
James

On Wed, Dec 2, 2020 at 2:26 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Dec 2, 2020 at 8:48 PM James Park <james.park@lagfreegames.com>
> wrote:
> >
> > I can avoid modifying drm.h by doing this to drm_fourcc.h:
> >
> > #ifdef _WIN32
> > #include <stdint.h>
> > typedef uint64_t __u64;
> > #else
> > #include "drm.h"
> > #endif
> >
> > And this to amdgpu_drm.h:
> >
> > #ifdef _WIN32
> > #include <stdint.h>
> > typedef int32_t  __s32;
> > typedef uint32_t __u32;
> > typedef uint64_t __u64;
> > #else
> > #include "drm.h"
> > #endif
> >
> > But now I'm touching two files under drm-uapi instead of one, and
> weirdly.
> >
> > If we're trying to cut ties with the drm-uapi folder entirely, the stuf=
f
> ac_surface.c need includes the AMD_FMT_MOD stuff in drm_fourcc.h, and
> AMDGPU_TILING_* under amdgpu_drm.h. Is there a better spot for these
> definitions?
>
> The drm_fourcc.h maybe makes some sense (I think in some places mesa
> uses these internally, and many drivers use the modifiers directly in
> the main driver). But the amdgpu header should be all ioctl stuff,
> which should be all entirely in the winsys only.
>
> Also kinda disappointing that drm_fourcc.h includes drm.h and isn't
> standalone, but I guess that sailed (at least for linux).
> -Daniel
>
> > Thanks,
> > James
> >
> > On Wed, Dec 2, 2020 at 10:06 AM Michel D=C3=A4nzer <michel@daenzer.net>
> wrote:
> >>
> >> On 2020-12-02 1:46 p.m., Daniel Vetter wrote:
> >> > On Wed, Dec 2, 2020 at 12:43 PM Michel D=C3=A4nzer <michel@daenzer.n=
et>
> wrote:
> >> >>
> >> >> On 2020-12-01 11:01 a.m., James Park wrote:
> >> >>> This will allow Mesa to port code to Windows more easily.
> >> >>
> >> >> As discussed in
> >> >>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6162#note_71277=
9
> >> >> , including drm.h makes no sense when building for Windows.
> >> >
> >> > Yeah I think it'd be cleanest if we can avoid this. If not I think t=
he
> >> > right fix would be to split out the actually needed parts from drm.h
> >> > into a new header (still included by drm.h for backwards compat
> >> > reasons) which mesa can use. Since it looks like the problematic par=
ts
> >> > are the legacy gunk, and not the new ioctl structures. Pulling out
> >> > drm_render.h for all the render stuff and mabe drm_vblank.h for the
> >> > vblank stuff (which would fit better in drm_mode.h but mistakes were
> >> > made, oops).
> >>
> >> If anything currently in drm.h is needed while building for Windows, i=
t
> >> points to a broken abstraction somewhere in userspace. (Specifically,
> >> the Mesa Gallium/Vulkan winsys is supposed to abstract away platform
> >> details like these)
> >>
> >>
> >> --
> >> Earthling Michel D=C3=A4nzer               |
> https://redhat.com
> >> Libre software enthusiast             |             Mesa and X develop=
er
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000002bf05a05b5853a61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If the definitions in drm_fourcc.h make sense to live ther=
e, and we can&#39;t remove drm.h from that header for backward compatibilit=
y, and the code that I&#39;m trying to compile on Windows needs the definit=
ions in drm_fourcc.h, then doesn&#39;t it make sense to adjust drm.h?<div><=
br></div><div>The patch that I&#39;m proposing doesn&#39;t change very much=
. It might be easier to read here:</div><div><a href=3D"https://github.com/=
jpark37/linux/commit/648e9281824ddc943c3ea6b34d6d6c154717a0a3">https://gith=
ub.com/jpark37/linux/commit/648e9281824ddc943c3ea6b34d6d6c154717a0a3</a></d=
iv><div><br></div><div>Thanks,</div><div>James</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at =
2:26 PM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.c=
h</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, Dec 2, 2020 at 8:48 PM James Park &lt;<a href=3D"mailto:james.park=
@lagfreegames.com" target=3D"_blank">james.park@lagfreegames.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; I can avoid modifying drm.h by doing this to drm_fourcc.h:<br>
&gt;<br>
&gt; #ifdef _WIN32<br>
&gt; #include &lt;stdint.h&gt;<br>
&gt; typedef uint64_t __u64;<br>
&gt; #else<br>
&gt; #include &quot;drm.h&quot;<br>
&gt; #endif<br>
&gt;<br>
&gt; And this to amdgpu_drm.h:<br>
&gt;<br>
&gt; #ifdef _WIN32<br>
&gt; #include &lt;stdint.h&gt;<br>
&gt; typedef int32_t=C2=A0 __s32;<br>
&gt; typedef uint32_t __u32;<br>
&gt; typedef uint64_t __u64;<br>
&gt; #else<br>
&gt; #include &quot;drm.h&quot;<br>
&gt; #endif<br>
&gt;<br>
&gt; But now I&#39;m touching two files under drm-uapi instead of one, and =
weirdly.<br>
&gt;<br>
&gt; If we&#39;re trying to cut ties with the drm-uapi folder entirely, the=
 stuff ac_surface.c need includes the AMD_FMT_MOD stuff in drm_fourcc.h, an=
d AMDGPU_TILING_* under amdgpu_drm.h. Is there a better spot for these defi=
nitions?<br>
<br>
The drm_fourcc.h maybe makes some sense (I think in some places mesa<br>
uses these internally, and many drivers use the modifiers directly in<br>
the main driver). But the amdgpu header should be all ioctl stuff,<br>
which should be all entirely in the winsys only.<br>
<br>
Also kinda disappointing that drm_fourcc.h includes drm.h and isn&#39;t<br>
standalone, but I guess that sailed (at least for linux).<br>
-Daniel<br>
<br>
&gt; Thanks,<br>
&gt; James<br>
&gt;<br>
&gt; On Wed, Dec 2, 2020 at 10:06 AM Michel D=C3=A4nzer &lt;<a href=3D"mail=
to:michel@daenzer.net" target=3D"_blank">michel@daenzer.net</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; On 2020-12-02 1:46 p.m., Daniel Vetter wrote:<br>
&gt;&gt; &gt; On Wed, Dec 2, 2020 at 12:43 PM Michel D=C3=A4nzer &lt;<a hre=
f=3D"mailto:michel@daenzer.net" target=3D"_blank">michel@daenzer.net</a>&gt=
; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On 2020-12-01 11:01 a.m., James Park wrote:<br>
&gt;&gt; &gt;&gt;&gt; This will allow Mesa to port code to Windows more eas=
ily.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; As discussed in<br>
&gt;&gt; &gt;&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/mer=
ge_requests/6162#note_712779" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6162#note_712779</a><br>
&gt;&gt; &gt;&gt; , including drm.h makes no sense when building for Window=
s.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Yeah I think it&#39;d be cleanest if we can avoid this. If no=
t I think the<br>
&gt;&gt; &gt; right fix would be to split out the actually needed parts fro=
m drm.h<br>
&gt;&gt; &gt; into a new header (still included by drm.h for backwards comp=
at<br>
&gt;&gt; &gt; reasons) which mesa can use. Since it looks like the problema=
tic parts<br>
&gt;&gt; &gt; are the legacy gunk, and not the new ioctl structures. Pullin=
g out<br>
&gt;&gt; &gt; drm_render.h for all the render stuff and mabe drm_vblank.h f=
or the<br>
&gt;&gt; &gt; vblank stuff (which would fit better in drm_mode.h but mistak=
es were<br>
&gt;&gt; &gt; made, oops).<br>
&gt;&gt;<br>
&gt;&gt; If anything currently in drm.h is needed while building for Window=
s, it<br>
&gt;&gt; points to a broken abstraction somewhere in userspace. (Specifical=
ly,<br>
&gt;&gt; the Mesa Gallium/Vulkan winsys is supposed to abstract away platfo=
rm<br>
&gt;&gt; details like these)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://r=
edhat.com</a><br>
&gt;&gt; Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X develope=
r<br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000002bf05a05b5853a61--

--===============1053128531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1053128531==--
