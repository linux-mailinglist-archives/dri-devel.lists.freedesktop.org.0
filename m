Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58742B25EB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 21:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115186E836;
	Fri, 13 Nov 2020 20:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0EA6E836
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 20:53:53 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t21so1746185pgl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 12:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=yYHsETleoJ6nLBMkr+b/OFbCmKpkrkLqAMLEkyAhVxs=;
 b=K2vdT0vA4B4uv0HhKmbkSG6rU1Ofc5VVT3S+T7xtscSS3MHsKzX4p09BZ9mJsA0jgr
 5uPHjRrlbnf6Yf5uimnKz48hI/DZFIJ6kFU+BC0J0WfXhuNT9+WTTlwFJQqebqx3FUrn
 KirOVbJlc3wduv71NvHYeK+IDdm+F8oQimT6UkgFFrWlZ3irihZJ0K0HoaNEGesxFssD
 xNbK/egCvGb0mpcbiambzQNuB6lKWC4PgxRzv3GPIl6Ax+V8kmKI9CXG2hBwQK8BnBxw
 LJV//LOaFYDcwgoGt7jUZqwMZgPB+iS2ZNnBzVo3FVQ0CS5n3V7eXQrBl2VcBc5HWJK+
 Jaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=yYHsETleoJ6nLBMkr+b/OFbCmKpkrkLqAMLEkyAhVxs=;
 b=XeS8KgStnzrI9PJSWz55HLZp7wq+2KyOwavwfswNyk4k0pznC7ZNfC3AG6boGPCxDy
 6Khkv2QoblXBjzn5WgAwlWPvwnC9AQmw3ogE9r6DlPAR3cx+XePe+PSnY0Ex/PeEHZIQ
 /IcCshqdHgV8PwU3wZ9jl4Edq703qBJxO01aVBGY/6s8CiC5NBTHM9/bk/liWs9+FbFA
 LRDKk1tQvTILJ9cl57GHSYZ83pU4AXQFIDZrT8lf2MUifLmZ/UiS0DePqYRCirPgO06p
 GfwE1IAZsi651ZSjjT4EXxV+gSud7n+XXLTHbZbK3UcXpNHAgQT33xtulV+oCz94AqdQ
 rofA==
X-Gm-Message-State: AOAM531e5E75rZ0nUEpH/0hmDZh1R8GChP/qMQVMsfc0kYPcpoEnVH2k
 JAoh59A5iT5E/ANQK+ELaxjvcpyrJUB7MAN5aIYCNw==
X-Google-Smtp-Source: ABdhPJxjeYXLz0BntfFcg3qyCo1jOn+GBhHZy30X+v0LPEXkf6uwXLkrB95JVVaTo3YGU/cjTOr7SvLuz0AeX08q+LE=
X-Received: by 2002:a17:90b:3844:: with SMTP id
 nl4mr4757163pjb.93.1605300833524; 
 Fri, 13 Nov 2020 12:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
 <20201113204959.GW401619@phenom.ffwll.local>
In-Reply-To: <20201113204959.GW401619@phenom.ffwll.local>
From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 13 Nov 2020 20:53:47 +0000
Message-ID: <CAF2Aj3j6+fEFS66qg-a-0Z1XtNQ7EAEnu4ECZ9gLiH7buH=PLw@mail.gmail.com>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
To: Sam Ravnborg <sam@ravnborg.org>, Lee Jones <lee.jones@linaro.org>, 
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============1001638411=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1001638411==
Content-Type: multipart/alternative; boundary="000000000000f0b8a105b4033998"

--000000000000f0b8a105b4033998
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Nov 2020, 20:50 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Thu, Nov 12, 2020 at 09:25:16PM +0100, Sam Ravnborg wrote:
> > Hi Lee,
> >
> > On Thu, Nov 12, 2020 at 07:00:11PM +0000, Lee Jones wrote:
> > > The precedent has already been set by other macros in the same file.
> > >
> > > Fixes the following W=3D1 kernel build warning(s):
> > >
> > >  drivers/gpu/drm/vkms/vkms_drv.c:55:19: warning: variable =E2=80=98cr=
tc=E2=80=99 set
> but not used [-Wunused-but-set-variable]
> > >  55 | struct drm_crtc *crtc;
> > >  | ^~~~
> > >
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >
> > Also applied to drm-misc-next.
> > This was the last patch from this batch I will process.
> > The others are left for the maintainers to pick up.
>
> btw for patches that maintainers don't pick up, the usual process is that
> we give them 2 weeks, then just mass apply. Now you're producing a lot of
> patches, too much for me to keep track, so please just ping me with a
> resend for those that expired and I'll go through and pick them all up.
>

That's great Daniel. Thanks for your support.

I can do one better than that.

Would a pull-request suit you?

>

--000000000000f0b8a105b4033998
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 13 Nov 2020, 20:50 Daniel Vetter, &lt;<a href=
=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Thu, Nov 12, 2020 at 09:25:16PM +0100, Sam Ravnb=
org wrote:<br>
&gt; Hi Lee,<br>
&gt; <br>
&gt; On Thu, Nov 12, 2020 at 07:00:11PM +0000, Lee Jones wrote:<br>
&gt; &gt; The precedent has already been set by other macros in the same fi=
le.<br>
&gt; &gt; <br>
&gt; &gt; Fixes the following W=3D1 kernel build warning(s):<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 drivers/gpu/drm/vkms/vkms_drv.c:55:19: warning: variable =
=E2=80=98crtc=E2=80=99 set but not used [-Wunused-but-set-variable]<br>
&gt; &gt;=C2=A0 55 | struct drm_crtc *crtc;<br>
&gt; &gt;=C2=A0 | ^~~~<br>
&gt; &gt; <br>
&gt; &gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@lin=
ux.intel.com" target=3D"_blank" rel=3D"noreferrer">maarten.lankhorst@linux.=
intel.com</a>&gt;<br>
&gt; &gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" targe=
t=3D"_blank" rel=3D"noreferrer">mripard@kernel.org</a>&gt;<br>
&gt; &gt; Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" =
target=3D"_blank" rel=3D"noreferrer">tzimmermann@suse.de</a>&gt;<br>
&gt; &gt; Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=
=3D"_blank" rel=3D"noreferrer">airlied@linux.ie</a>&gt;<br>
&gt; &gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&gt;<br>
&gt; &gt; Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">robdclark@gmail.com</a>&gt;<br>
&gt; &gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"=
_blank" rel=3D"noreferrer">dri-devel@lists.freedesktop.org</a><br>
&gt; &gt; Signed-off-by: Lee Jones &lt;<a href=3D"mailto:lee.jones@linaro.o=
rg" target=3D"_blank" rel=3D"noreferrer">lee.jones@linaro.org</a>&gt;<br>
&gt; <br>
&gt; Also applied to drm-misc-next.<br>
&gt; This was the last patch from this batch I will process.<br>
&gt; The others are left for the maintainers to pick up.<br>
<br>
btw for patches that maintainers don&#39;t pick up, the usual process is th=
at<br>
we give them 2 weeks, then just mass apply. Now you&#39;re producing a lot =
of<br>
patches, too much for me to keep track, so please just ping me with a<br>
resend for those that expired and I&#39;ll go through and pick them all up.=
<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
That&#39;s great Daniel. Thanks for your support.=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">I can do one better than that.=C2=A0</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Would a pull-request suit you?=
=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
</blockquote></div></div></div>

--000000000000f0b8a105b4033998--

--===============1001638411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1001638411==--
