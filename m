Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2DE30FCE7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706BE6EE43;
	Thu,  4 Feb 2021 19:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A655C898BF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 17:03:45 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id o12so4044799ote.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 09:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iAz72nqC9puWBAguJHrYm6a65OlmdLh4AWlbHQhaOKE=;
 b=Iq2gn4fPDx24oAzV3rFYxoCqvgCzD9y78JgGAX/zpsjSsaqXMnvghm3O5n6c3/bssl
 K1Mx64UID6qA/iNK+nfyNGToGjZgqyTe9rU5+fFEk12dBR1gc2P+AHx7gR9cctLlTXwJ
 t72AlQWKAmsLfrWREXr5ZakxKr56RDIfhf28uZTjVe/Wweo6HRer4qwiUXE0YGICJeeT
 6wNVs9EUYeqUL7EFcBiBrl4eAKBr997UIh1WAtB+j3oGIIncH2IzZrOlpjED3m/cF+z2
 5cGx6Vxg1zFVzBD1DFVOhGlRIRwRP7HqMdbfReshXqJqOu+5YjcsvjKIvYU8AsZVwkn/
 iHUQ==
X-Gm-Message-State: AOAM533PHgMfx7dpSmbwhugImr5zkeItXPGI2dkQWzzQxIg/RhqbZGCF
 QJXCn6Raz1Cu0bYaF+Feih/MCnjLtwY4LvTl
X-Google-Smtp-Source: ABdhPJw1Hu3qG8qyMqZzF9Whn613CgXcvCQpYaG4WdNBHa0D96tidSgimlqyGJtZzHrEnOavxZ1aUg==
X-Received: by 2002:a05:6830:15:: with SMTP id
 c21mr234170otp.244.1612458224973; 
 Thu, 04 Feb 2021 09:03:44 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
 [209.85.167.173])
 by smtp.gmail.com with ESMTPSA id n93sm1213727ota.37.2021.02.04.09.03.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:03:44 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id w8so4443859oie.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 09:03:44 -0800 (PST)
X-Received: by 2002:aca:ac10:: with SMTP id v16mr253825oie.133.1612458224171; 
 Thu, 04 Feb 2021 09:03:44 -0800 (PST)
MIME-Version: 1.0
References: <CAM+GfYH16EhimL6pYpgD1jutMoL6Ai2dAWQs=j71GqXbrm9J=A@mail.gmail.com>
 <YBwQpjdpzHy6ImxQ@phenom.ffwll.local>
 <CAM+GfYHyMCsGGJ7bMyjX4eGOCaC=euYMxVdUcLherj6v-t227w@mail.gmail.com>
 <CAKMK7uFkVvwDaqD5uYJ2vDHu7Ooz6zZ8xuGEuKod-f4GqnTGAQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFkVvwDaqD5uYJ2vDHu7Ooz6zZ8xuGEuKod-f4GqnTGAQ@mail.gmail.com>
From: Toni Spets <toni.spets@iki.fi>
Date: Thu, 4 Feb 2021 19:03:33 +0200
X-Gmail-Original-Message-ID: <CAM+GfYENhx8nP9_cXNLS=R+mvtscHNoKVTZEZLUxgTSWRfL=tg@mail.gmail.com>
Message-ID: <CAM+GfYENhx8nP9_cXNLS=R+mvtscHNoKVTZEZLUxgTSWRfL=tg@mail.gmail.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1289775796=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1289775796==
Content-Type: multipart/alternative; boundary="000000000000aabf7605ba85af03"

--000000000000aabf7605ba85af03
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021, 18:18 Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Feb 4, 2021 at 5:03 PM Toni Spets <toni.spets@iki.fi> wrote:
> >
> >
> >
> > On Thu, Feb 4, 2021, 17:20 Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Wed, Feb 03, 2021 at 09:53:40PM +0200, Toni Spets wrote:
> >> > The blocking implementation of the dirtyfb ioctl is extremely slow
> when
> >> > used for damage tracking on RK3399. If this implementation is in
> place Xorg
> >> > will default to using it and will slow down considerably when doing a
> lot
> >> > of small draws. This is most apparent with the fvwm window manager on
> >> > startup where it will almost lock up for many seconds seconds on
> RK3399.
> >> >
> >> > Removing this implementation did not cause any visible issues on
> RK3399 but
> >> > it did fix the performance issues on Xorg as it will disable damage
> >> > tracking when the ioctl returns it's not supported.
> >>
> >> Then you don't have a manual update panel.
> >>
> >> Iirc there were patches to make this faster in recent kernels, on what
> >> kernels did you try this?
> >
> >
> > Latest was 5.10.12. If there are fixes for this in later kernels I will
> definitely try it out.
>
> Hm I thought it landed already. But checking it the optimization was
> for fbdev to batch up updates more (because that one doesn't even
> try), not direct X usage. So your X should work faster if you use
> fbdev as backend (just as an experiment).
>

Yeah, I used fbdev to test before which got me down this path to look up
what's wrong with the modesetting driver.

Fbdev runs flawlessly but then we lose panfrost for other acceleration so
it's unfortunately not a silver bullet.


> >> Also X should only call this in the blocker handler, not all the time.
> >
> >
> > It does but fvwm is an example that forces it to be called a lot and
> it's slow enough to cause significant issues.
> >
> >>
> >> So yeah we need to make this faster, not break manual update panels.
> >
> >
> > Pardon my ignorance but while making this operation faster will indeed
> make it better wouldn't the correct behavior be to know if a panel requires
> this or not?
>
> Not impossible, but there's a pile of layers in the way. And generally
> frontbuffer rendering doesn't see a lot of love, since aside from
> bootloaders and old sckool X window systems without compositors,
> they're not really seeing any use. Everything Wayland or composited
> desktops is double-buffered and fast.
>

It's not this black and white, unfortunately. Compositing even on Xorg is
slower than not using it at all at least on Xfce where currently this
hardware gets the best results with this patch applied and compositor off.
Maybe the implementation is just bad on Xfce?


> For fbdev we're also doing the dirty tracking now at a driver level
> (using the helpers), unconditionally whether the given hw actually
> needs it or not.
>
> More pragmatic approach would be to throw a kernel thread at this
> problem. Will be tricky since we need to make sure that from
> userspace's pov nothing breaks, which is always a bit an issue when
> making things more asynchronous. Specifically we need to make sure
> that userspace doesn't get ahead of the kernel, so might need to
> require that we only batch up updates for the same framebuffer object,
> but stall when we switch.
>
> The locking for this will get interesting.
>

Sounds like an awful lot of work for a niche use. Although if Wayland ends
up calling this even every now and then it may prove to be useful.

I haven't done any testing or benchmarking on Wayland so I have no
knowledge if this makes any difference there.

Maybe this could solved in Xorg by having an option to disable damage
tracking manually, though ideally no manual setup would be needed and I
doubt anyone wants new options for the modesetting driver for an edge case
like this.

Don't really know where to go from here. Wouldn't want to carry this patch
manually just to get a well working X either.

Thanks for the insight and I'm happy to test any solution if something
comes up!


> Cheers, Daniel
>
> > Making a low performance device wait any extra time for no reason
> doesn't sound like the correct fix either.
> >
> > I'm not defending the patch itself as I don't have enough understanding
> of the drm or kernel so if it's indeed definitely breaking something then
> of course it can't be used as is.
> >
> > Thanks.
> >
> >
> >> -Daniel
> >>
> >> >
> >> > --
> >> > Toni Spets
> >>
> >> > From 79984ee67c801f552e9eaf4d0cfb62101d1f0f2e Mon Sep 17 00:00:00 2001
> >> > From: Toni Spets <toni.spets@iki.fi>
> >> > Date: Wed, 3 Feb 2021 21:14:50 +0200
> >> > Subject: [PATCH] drm/rockchip: remove atomic helper dirtyfb
> >> >
> >> > ---
> >> >  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 1 -
> >> >  1 file changed, 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> >> > index 3aa37e177667..2554fd1c8aeb 100644
> >> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> >> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> >> > @@ -21,7 +21,6 @@
> >> >  static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
> >> >       .destroy       = drm_gem_fb_destroy,
> >> >       .create_handle = drm_gem_fb_create_handle,
> >> > -     .dirty         = drm_atomic_helper_dirtyfb,
> >> >  };
> >> >
> >> >  static struct drm_framebuffer *
> >> > --
> >> > 2.27.0
> >> >
> >>
> >> > _______________________________________________
> >> > dri-devel mailing list
> >> > dri-devel@lists.freedesktop.org
> >> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000aabf7605ba85af03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 4, 2021, 18:18 Daniel Vetter &lt;<a href=
=3D"mailto:daniel@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel@ffw=
ll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Feb 4,=
 2021 at 5:03 PM Toni Spets &lt;<a href=3D"mailto:toni.spets@iki.fi" rel=3D=
"noreferrer noreferrer" target=3D"_blank">toni.spets@iki.fi</a>&gt; wrote:<=
br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Feb 4, 2021, 17:20 Daniel Vetter &lt;<a href=3D"mailto:daniel@=
ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_blank">daniel@ffwll.ch</=
a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Feb 03, 2021 at 09:53:40PM +0200, Toni Spets wrote:<br>
&gt;&gt; &gt; The blocking implementation of the dirtyfb ioctl is extremely=
 slow when<br>
&gt;&gt; &gt; used for damage tracking on RK3399. If this implementation is=
 in place Xorg<br>
&gt;&gt; &gt; will default to using it and will slow down considerably when=
 doing a lot<br>
&gt;&gt; &gt; of small draws. This is most apparent with the fvwm window ma=
nager on<br>
&gt;&gt; &gt; startup where it will almost lock up for many seconds seconds=
 on RK3399.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Removing this implementation did not cause any visible issues=
 on RK3399 but<br>
&gt;&gt; &gt; it did fix the performance issues on Xorg as it will disable =
damage<br>
&gt;&gt; &gt; tracking when the ioctl returns it&#39;s not supported.<br>
&gt;&gt;<br>
&gt;&gt; Then you don&#39;t have a manual update panel.<br>
&gt;&gt;<br>
&gt;&gt; Iirc there were patches to make this faster in recent kernels, on =
what<br>
&gt;&gt; kernels did you try this?<br>
&gt;<br>
&gt;<br>
&gt; Latest was 5.10.12. If there are fixes for this in later kernels I wil=
l definitely try it out.<br>
<br>
Hm I thought it landed already. But checking it the optimization was<br>
for fbdev to batch up updates more (because that one doesn&#39;t even<br>
try), not direct X usage. So your X should work faster if you use<br>
fbdev as backend (just as an experiment).<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Yeah, I used fbdev to test before =
which got me down this path to look up what&#39;s wrong with the modesettin=
g driver.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Fbdev ru=
ns flawlessly but then we lose panfrost for other acceleration so it&#39;s =
unfortunately not a silver bullet.=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;&gt; Also X should only call this in the blocker handler, not all the t=
ime.<br>
&gt;<br>
&gt;<br>
&gt; It does but fvwm is an example that forces it to be called a lot and i=
t&#39;s slow enough to cause significant issues.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; So yeah we need to make this faster, not break manual update panel=
s.<br>
&gt;<br>
&gt;<br>
&gt; Pardon my ignorance but while making this operation faster will indeed=
 make it better wouldn&#39;t the correct behavior be to know if a panel req=
uires this or not?<br>
<br>
Not impossible, but there&#39;s a pile of layers in the way. And generally<=
br>
frontbuffer rendering doesn&#39;t see a lot of love, since aside from<br>
bootloaders and old sckool X window systems without compositors,<br>
they&#39;re not really seeing any use. Everything Wayland or composited<br>
desktops is double-buffered and fast.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It&#39;s not this black and white, un=
fortunately. Compositing even on Xorg is slower than not using it at all at=
 least on Xfce where currently this hardware gets the best results with thi=
s patch applied and compositor off. Maybe the implementation is just bad on=
 Xfce?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
For fbdev we&#39;re also doing the dirty tracking now at a driver level<br>
(using the helpers), unconditionally whether the given hw actually<br>
needs it or not.<br>
<br>
More pragmatic approach would be to throw a kernel thread at this<br>
problem. Will be tricky since we need to make sure that from<br>
userspace&#39;s pov nothing breaks, which is always a bit an issue when<br>
making things more asynchronous. Specifically we need to make sure<br>
that userspace doesn&#39;t get ahead of the kernel, so might need to<br>
require that we only batch up updates for the same framebuffer object,<br>
but stall when we switch.<br>
<br>
The locking for this will get interesting.<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Sounds like an awful lot of work =
for a niche use. Although if Wayland ends up calling this even every now an=
d then it may prove to be useful.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I haven&#39;t done any testing or benchmarking on Wayland so I ha=
ve no knowledge if this makes any difference there.=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Maybe this could solved in Xorg by having=
 an option to disable damage tracking manually, though ideally no manual se=
tup would be needed and I doubt anyone wants new options for the modesettin=
g driver for an edge case like this.=C2=A0</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Don&#39;t really know where to go from here. Wouldn&#39;=
t want to carry this patch manually just to get a well working X either.=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for the insig=
ht and I&#39;m happy to test any solution if something comes up!=C2=A0</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
Cheers, Daniel<br>
<br>
&gt; Making a low performance device wait any extra time for no reason does=
n&#39;t sound like the correct fix either.<br>
&gt;<br>
&gt; I&#39;m not defending the patch itself as I don&#39;t have enough unde=
rstanding of the drm or kernel so if it&#39;s indeed definitely breaking so=
mething then of course it can&#39;t be used as is.<br>
&gt;<br>
&gt; Thanks.<br>
&gt;<br>
&gt;<br>
&gt;&gt; -Daniel<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Toni Spets<br>
&gt;&gt;<br>
&gt;&gt; &gt; From 79984ee67c801f552e9eaf4d0cfb62101d1f0f2e Mon Sep 17 00:0=
0:00 2001<br>
&gt;&gt; &gt; From: Toni Spets &lt;<a href=3D"mailto:toni.spets@iki.fi" rel=
=3D"noreferrer noreferrer" target=3D"_blank">toni.spets@iki.fi</a>&gt;<br>
&gt;&gt; &gt; Date: Wed, 3 Feb 2021 21:14:50 +0200<br>
&gt;&gt; &gt; Subject: [PATCH] drm/rockchip: remove atomic helper dirtyfb<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 1 -<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/dri=
vers/gpu/drm/rockchip/rockchip_drm_fb.c<br>
&gt;&gt; &gt; index 3aa37e177667..2554fd1c8aeb 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c<br>
&gt;&gt; &gt; @@ -21,7 +21,6 @@<br>
&gt;&gt; &gt;=C2=A0 static const struct drm_framebuffer_funcs rockchip_drm_=
fb_funcs =3D {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.destroy=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D drm_gem_fb_destroy,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.create_handle =3D drm_gem_fb_creat=
e_handle,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0.dirty=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D drm_atomic_helper_dirtyfb,<br>
&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 static struct drm_framebuffer *<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.27.0<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; dri-devel mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">dri-devel@lists.freedesktop.org</a><b=
r>
&gt;&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri=
-devel" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Daniel Vetter<br>
&gt;&gt; Software Engineer, Intel Corporation<br>
&gt;&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">http://blog.ffwll.ch</a><br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">http://blog.ffwll.ch</a><br>
</blockquote></div></div></div>

--000000000000aabf7605ba85af03--

--===============1289775796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1289775796==--
