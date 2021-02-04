Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4611D30FCDF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624F96EDFE;
	Thu,  4 Feb 2021 19:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5CE6E0D2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 16:03:36 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id v1so3846088ott.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 08:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ay2rh3d+tPs8UqX/e3z36CHF6c/+oS0d1u4qB+0mKbY=;
 b=hqB3AdXXXI8PZBusNHGjH8qymJKH+DP0cLwhNwcvx5CDdK0NEREp6Hjgv4ED2DFJ1B
 SaiNlsNLS0YJPo9uGaqCjAuZ4bDjVSoRjrnBWwSsp1R74fDC2sgtTg1VFmgzwu8CNSm0
 KbZG5qL9+3TDSQ2SrQhVwtaouGjJWTe2XG0TJWfbVhNUiDA1dAgLOtWFs8Gkb3L00Unp
 juwU6JqDyIZx2OGIB+MrG3jqJ3OfUGuQf+bmwVZw6pLEVNiXghO9ftcAVob+9GvNw3qR
 +RhJG2TkrPehQlvLKQzWSjJ/Qbe7eBxVqC3iRvyQNYZy8yALj4HBNGk/rwg1v8fhX7jL
 YrXQ==
X-Gm-Message-State: AOAM530ScE2EKvpTGGlUwqwIhRCDCfTgFhD6s72iNus/AcVVh2S4z6dq
 5YOyr2jFL39G+cG35wk1mKa39DXCtOv8xhxn
X-Google-Smtp-Source: ABdhPJyA5OykbetIFQWEqSC/fSybTKg3i6i61CY/x+/WRFngJfhpSFu6jJeXTWCPsX/vMXHFyvAhSw==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr17684otb.242.1612454615347;
 Thu, 04 Feb 2021 08:03:35 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id w11sm1191776otl.13.2021.02.04.08.03.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:03:35 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id e70so3835800ote.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 08:03:34 -0800 (PST)
X-Received: by 2002:a9d:866:: with SMTP id 93mr6240273oty.365.1612454614599;
 Thu, 04 Feb 2021 08:03:34 -0800 (PST)
MIME-Version: 1.0
References: <CAM+GfYH16EhimL6pYpgD1jutMoL6Ai2dAWQs=j71GqXbrm9J=A@mail.gmail.com>
 <YBwQpjdpzHy6ImxQ@phenom.ffwll.local>
In-Reply-To: <YBwQpjdpzHy6ImxQ@phenom.ffwll.local>
From: Toni Spets <toni.spets@iki.fi>
Date: Thu, 4 Feb 2021 18:03:24 +0200
X-Gmail-Original-Message-ID: <CAM+GfYHyMCsGGJ7bMyjX4eGOCaC=euYMxVdUcLherj6v-t227w@mail.gmail.com>
Message-ID: <CAM+GfYHyMCsGGJ7bMyjX4eGOCaC=euYMxVdUcLherj6v-t227w@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: remove atomic helper dirtyfb
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1502409869=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1502409869==
Content-Type: multipart/alternative; boundary="000000000000850e2d05ba84d8e1"

--000000000000850e2d05ba84d8e1
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021, 17:20 Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Feb 03, 2021 at 09:53:40PM +0200, Toni Spets wrote:
> > The blocking implementation of the dirtyfb ioctl is extremely slow when
> > used for damage tracking on RK3399. If this implementation is in place
> Xorg
> > will default to using it and will slow down considerably when doing a lot
> > of small draws. This is most apparent with the fvwm window manager on
> > startup where it will almost lock up for many seconds seconds on RK3399.
> >
> > Removing this implementation did not cause any visible issues on RK3399
> but
> > it did fix the performance issues on Xorg as it will disable damage
> > tracking when the ioctl returns it's not supported.
>
> Then you don't have a manual update panel.
>
> Iirc there were patches to make this faster in recent kernels, on what
> kernels did you try this?
>

Latest was 5.10.12. If there are fixes for this in later kernels I will
definitely try it out.


> Also X should only call this in the blocker handler, not all the time.
>

It does but fvwm is an example that forces it to be called a lot and it's
slow enough to cause significant issues.


> So yeah we need to make this faster, not break manual update panels.
>

Pardon my ignorance but while making this operation faster will indeed make
it better wouldn't the correct behavior be to know if a panel requires this
or not?

Making a low performance device wait any extra time for no reason doesn't
sound like the correct fix either.

I'm not defending the patch itself as I don't have enough understanding of
the drm or kernel so if it's indeed definitely breaking something then of
course it can't be used as is.

Thanks.


-Daniel
>
> >
> > --
> > Toni Spets
>
> > From 79984ee67c801f552e9eaf4d0cfb62101d1f0f2e Mon Sep 17 00:00:00 2001
> > From: Toni Spets <toni.spets@iki.fi>
> > Date: Wed, 3 Feb 2021 21:14:50 +0200
> > Subject: [PATCH] drm/rockchip: remove atomic helper dirtyfb
> >
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> > index 3aa37e177667..2554fd1c8aeb 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> > @@ -21,7 +21,6 @@
> >  static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
> >       .destroy       = drm_gem_fb_destroy,
> >       .create_handle = drm_gem_fb_create_handle,
> > -     .dirty         = drm_atomic_helper_dirtyfb,
> >  };
> >
> >  static struct drm_framebuffer *
> > --
> > 2.27.0
> >
>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000850e2d05ba84d8e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 4, 2021, 17:20 Daniel Vetter &lt;<a href=
=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Wed, Feb 03, 2021 at 09:53:40PM +0200, Toni Spet=
s wrote:<br>
&gt; The blocking implementation of the dirtyfb ioctl is extremely slow whe=
n<br>
&gt; used for damage tracking on RK3399. If this implementation is in place=
 Xorg<br>
&gt; will default to using it and will slow down considerably when doing a =
lot<br>
&gt; of small draws. This is most apparent with the fvwm window manager on<=
br>
&gt; startup where it will almost lock up for many seconds seconds on RK339=
9.<br>
&gt; <br>
&gt; Removing this implementation did not cause any visible issues on RK339=
9 but<br>
&gt; it did fix the performance issues on Xorg as it will disable damage<br=
>
&gt; tracking when the ioctl returns it&#39;s not supported.<br>
<br>
Then you don&#39;t have a manual update panel.<br>
<br>
Iirc there were patches to make this faster in recent kernels, on what<br>
kernels did you try this?<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Latest was 5.10.12. If there are fixes for this in=
 later kernels I will definitely try it out.=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
Also X should only call this in the blocker handler, not all the time.<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It do=
es but fvwm is an example that forces it to be called a lot and it&#39;s sl=
ow enough to cause significant issues.=C2=A0</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
So yeah we need to make this faster, not break manual update panels.<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Pardon =
my ignorance but while making this operation faster will indeed make it bet=
ter wouldn&#39;t the correct behavior be to know if a panel requires this o=
r not?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Making a lo=
w performance device wait any extra time for no reason doesn&#39;t sound li=
ke the correct fix either.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I&#39;m not defending the patch itself as I don&#39;t have enough unders=
tanding of the drm or kernel so if it&#39;s indeed definitely breaking some=
thing then of course it can&#39;t be used as is.=C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Thanks.=C2=A0</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
-Daniel<br>
<br>
&gt; <br>
&gt; -- <br>
&gt; Toni Spets<br>
<br>
&gt; From 79984ee67c801f552e9eaf4d0cfb62101d1f0f2e Mon Sep 17 00:00:00 2001=
<br>
&gt; From: Toni Spets &lt;<a href=3D"mailto:toni.spets@iki.fi" target=3D"_b=
lank" rel=3D"noreferrer">toni.spets@iki.fi</a>&gt;<br>
&gt; Date: Wed, 3 Feb 2021 21:14:50 +0200<br>
&gt; Subject: [PATCH] drm/rockchip: remove atomic helper dirtyfb<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_fb.c<br>
&gt; index 3aa37e177667..2554fd1c8aeb 100644<br>
&gt; --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c<br>
&gt; +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c<br>
&gt; @@ -21,7 +21,6 @@<br>
&gt;=C2=A0 static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.destroy=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D drm_g=
em_fb_destroy,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.create_handle =3D drm_gem_fb_create_handle,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0.dirty=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D drm_a=
tomic_helper_dirtyfb,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static struct drm_framebuffer *<br>
&gt; -- <br>
&gt; 2.27.0<br>
&gt; <br>
<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank" r=
el=3D"noreferrer">dri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.or=
g/mailman/listinfo/dri-devel</a><br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://blog.ffwll.ch</a><br>
</blockquote></div></div></div>

--000000000000850e2d05ba84d8e1--

--===============1502409869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1502409869==--
