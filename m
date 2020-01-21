Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C0143FFB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 15:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774126ED35;
	Tue, 21 Jan 2020 14:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc36.google.com (mail-yw1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163746ED35;
 Tue, 21 Jan 2020 14:51:29 +0000 (UTC)
Received: by mail-yw1-xc36.google.com with SMTP id h126so1539296ywc.6;
 Tue, 21 Jan 2020 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uBqgMRgO6P9463HPate0j07VF8BsjL/cZx+am8tulrE=;
 b=CXchmKg2PODdm3bl3fHjH1fAoCCuwjZ+dRJs/yAqH98ue8HsiDTBJHFP/ro1gdnnTe
 nca2DhSMkRomtIUUByNQde36vmpY86B5y7koN9V070d48MvPQ4L99J7CbgoCEy5DdrQW
 6OXc2SV81svFzBEMlllgQzTzh+nDImKyy6M66OLPaOTZ1UvmsNSp64yIJ/5yyMKUlXo8
 33TBdlCyZbd4cw/m1M8EGn7YzvZ7vhHNe9PyeH0HU0/irgzcx11P4LJbShmWrLQZqX9C
 ksXKTAqlXj77WoPUHdjb/y0kiLw9lT+pTPA9AP6U8dFYKFDtN5NMA+B+yQ9Lw6h/ja0N
 i8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uBqgMRgO6P9463HPate0j07VF8BsjL/cZx+am8tulrE=;
 b=P1OeG/o7NWEjZ6+GAZguJ3w9JbTQGbPIv91FE6hj1dU/h3iBSAMcApfhOyHY7Brhak
 akJe0OrHiY5uLA0LEKigLjgW7Gn7vir9Br6XR43Tt1Z8cgmQJUCjgj9bXmNVShw7X2UQ
 AUuGc4PGzYnDQ4ZGs+vL2NrIYYsA5N34z6Yk4UWOnsatdr43N84L5y9ZGDOdMpB8v/Ft
 vx+WpVKXAQEK0/DOD2r18HF0HBmy0WVVb700x23+Km/vMQA4UEuEyukIR2gk/EaZ5I0H
 h3Hak18u8LbOZegyQxsTvPEHQiVFFJyeYOGSwDN+ldl3Z7nspCx9aFfGkbic/a2x4Sh4
 l8cw==
X-Gm-Message-State: APjAAAV93Vkc6TApRh8Xduh3xPLQ5va1I4U66fS/E/K5Ch2DEvQH6odc
 D+s9wgtW5yxvUzm/iRJg5wDOMFH8n8FPK0DEbYc=
X-Google-Smtp-Source: APXvYqxxO+nkuCluwS1X0mwTgpHheJ3pXi/A09ZAsp2pUmNo9DzisbbRWYqaIjn2DMK3SEN26IesOJgLYgX39Atsa4A=
X-Received: by 2002:a81:1a15:: with SMTP id a21mr3858835ywa.134.1579618288186; 
 Tue, 21 Jan 2020 06:51:28 -0800 (PST)
MIME-Version: 1.0
References: <CAJgxT3-cJu54Rn-9CstjaRHHtaJB_WK+R0RzKsDoK4TttDNFOg@mail.gmail.com>
 <20200120105812.20c56b65@eldfell.localdomain>
In-Reply-To: <20200120105812.20c56b65@eldfell.localdomain>
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Tue, 21 Jan 2020 08:51:26 -0600
Message-ID: <CAJgxT3-XVipi_k8LDaEjJjCj6ReBNLUyjF=xhkK1v0vceP_t6w@mail.gmail.com>
Subject: Re: backend-drm and scanning really large resolutions
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1348760689=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1348760689==
Content-Type: multipart/alternative; boundary="000000000000f2bb33059ca78a58"

--000000000000f2bb33059ca78a58
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 20, 2020 at 2:58 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Fri, 17 Jan 2020 10:51:45 -0600
> Matt Hoosier <matt.hoosier@gmail.com> wrote:
>
> > Hi all,
> >
> > I'm confronting a situation where the hardware with which I work is
> capable
> > of driving connectors at 4K or 8K, but doing so requires bonding the
> > scanning of multiple planes together.
> >
> > The scenario is that you'd have a big primary framebuffer whose size is
> too
> > large for an individual hardware scanning pipeline on the display
> > controller to traverse within its maximum allowed clock rate.
> >
> > The hardware supplier's approach is to assign multiple planes, which in
> the
> > KMS driver map to hardware scanning pipelines, to each be responsible for
> > scanning a smaller section of the framebuffer. The planes are all
> assigned
> > to the same CRTC, and in concert with each other they cover the whole
> area
> > of the framebuffer and CRTC.
> >
> > This sounds a little bit wild to me. I hadn't been aware it's even legal
> to
> > have more than one plane treated a the source of scanout for a single
> > framebuffer. Maybe that distinction isn't really relevant nowadays with
> > universal plane support.
> >
> > I'm wondering if anybody here knows whether this a legit approach for a
> > compositor's DRM backend to take?
>

Hi Pekka; thanks for the reply.


>
> Hi,
>
> I was aware of tiled monitors that need two connectors driven by two
> CRTCs to cover the whole display, but that sounds new to me.
> Libweston/DRM still doesn't support tiled monitors.
>
> What a compositor's DRM-backend can or should do must be generic. It
> cannot be driver or hardware dependent, so handling your case specially
> in userspace would need KMS UAPI to communicate the need in the first
> place. (There is no shared library for "KMS userspace drivers", yet at
> least.)
>
> I am not aware of any KMS UAPI that would indicate the need to use two
> primary planes in a specific configuration for a specific video mode.
> I'm saying two primary planes, because that is the only way I can see
> this situation even hinted at userspace with the current UAPI. I also
> don't know if multiple primary planes is allowed, but it certainly is
> not expected by userspace, so userspace can't make use of it as is.
>

Just to double-check: I think we're still talking here about
universal-plane mode, so we only mean "primary plane" in an informal sense?
This problem would crop up on any attempt to attach a huge framebuffer to a
single plane (whether it happened to be the bottom z-sorted one or a
something used as an overlay).


>
> The idea that comes to my mind is to hide all the details in the
> driver. Expose just one primary plane as usual, and if the video mode
> and FB actually need two scanout units, then steal one under the hood
> in the driver. If that makes another KMS plane (exposed to userspace)
> unusable, that is fine. Userspace with atomic modesetting needs to be
> checking with TEST_ONLY to see if a configuration is possible, and will
> fall back to something else.
>

I think that's about the only approach that would make sense. Who would be
a good person to sanity-check that with? Daniel V? Daniel S?

I suppose in principle that if this is a valid corner-case of the KMS api,
then maybe it wouldn't be wrong to enhance compositors DRM backends to
progressively attempt attaching more and more planes to scan a framebuffer
if the drmModeAtomicCommit(DRM_MODE_ATOMIC_TEST_ONLY) fails for the base
case. But whether anybody in the Weston world would want that patch is
probably another story...


>
> For legacy modesetting I guess you would need to pick between
> supporting the really large video modes vs. exposing all planes. But
> that's a no-brainer, since the legacy API for planes is practically
> unusable. Then again, I don't know if the kernel DRM core allows you to
> make such distinction.
>
> Btw. AFAIK there is nothing wrong with using the exact same FB on
> multiple planes simultaneously.
>
>
> Thanks,
> pq
>

--000000000000f2bb33059ca78a58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 20, 2020 at 2:58 AM Pekka Paa=
lanen &lt;<a href=3D"mailto:ppaalanen@gmail.com">ppaalanen@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Fri, 17 Jan 2020 10:51:45 -0600<br>
Matt Hoosier &lt;<a href=3D"mailto:matt.hoosier@gmail.com" target=3D"_blank=
">matt.hoosier@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I&#39;m confronting a situation where the hardware with which I work i=
s capable<br>
&gt; of driving connectors at 4K or 8K, but doing so requires bonding the<b=
r>
&gt; scanning of multiple planes together.<br>
&gt; <br>
&gt; The scenario is that you&#39;d have a big primary framebuffer whose si=
ze is too<br>
&gt; large for an individual hardware scanning pipeline on the display<br>
&gt; controller to traverse within its maximum allowed clock rate.<br>
&gt; <br>
&gt; The hardware supplier&#39;s approach is to assign multiple planes, whi=
ch in the<br>
&gt; KMS driver map to hardware scanning pipelines, to each be responsible =
for<br>
&gt; scanning a smaller section of the framebuffer. The planes are all assi=
gned<br>
&gt; to the same CRTC, and in concert with each other they cover the whole =
area<br>
&gt; of the framebuffer and CRTC.<br>
&gt; <br>
&gt; This sounds a little bit wild to me. I hadn&#39;t been aware it&#39;s =
even legal to<br>
&gt; have more than one plane treated a the source of scanout for a single<=
br>
&gt; framebuffer. Maybe that distinction isn&#39;t really relevant nowadays=
 with<br>
&gt; universal plane support.<br>
&gt; <br>
&gt; I&#39;m wondering if anybody here knows whether this a legit approach =
for a<br>
&gt; compositor&#39;s DRM backend to take?<br></blockquote><div><br></div><=
div>Hi Pekka; thanks for the reply.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Hi,<br>
<br>
I was aware of tiled monitors that need two connectors driven by two<br>
CRTCs to cover the whole display, but that sounds new to me.<br>
Libweston/DRM still doesn&#39;t support tiled monitors.<br>
<br>
What a compositor&#39;s DRM-backend can or should do must be generic. It<br=
>
cannot be driver or hardware dependent, so handling your case specially<br>
in userspace would need KMS UAPI to communicate the need in the first<br>
place. (There is no shared library for &quot;KMS userspace drivers&quot;, y=
et at<br>
least.)<br>
<br>
I am not aware of any KMS UAPI that would indicate the need to use two<br>
primary planes in a specific configuration for a specific video mode.<br>
I&#39;m saying two primary planes, because that is the only way I can see<b=
r>
this situation even hinted at userspace with the current UAPI. I also<br>
don&#39;t know if multiple primary planes is allowed, but it certainly is<b=
r>
not expected by userspace, so userspace can&#39;t make use of it as is.<br>=
</blockquote><div><br></div><div>Just to double-check: I think we&#39;re st=
ill talking here about universal-plane mode, so we only mean &quot;primary =
plane&quot; in an informal sense? This problem would crop up on any attempt=
 to attach a huge framebuffer to a single plane (whether it happened to be =
the bottom z-sorted one or a something used as an overlay).=C2=A0</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The idea that comes to my mind is to hide all the details in the<br>
driver. Expose just one primary plane as usual, and if the video mode<br>
and FB actually need two scanout units, then steal one under the hood<br>
in the driver. If that makes another KMS plane (exposed to userspace)<br>
unusable, that is fine. Userspace with atomic modesetting needs to be<br>
checking with TEST_ONLY to see if a configuration is possible, and will<br>
fall back to something else.<br></blockquote><div><br></div><div>I think th=
at&#39;s about the only approach that would make sense. Who would be a good=
 person to sanity-check that with? Daniel V? Daniel S?</div><div><br></div>=
<div>I suppose in principle that if this is a valid corner-case of the KMS =
api, then maybe it wouldn&#39;t be wrong to enhance compositors DRM backend=
s to progressively attempt attaching more and more planes to scan a framebu=
ffer if the drmModeAtomicCommit(<span style=3D"color:rgb(60,64,67);font-fam=
ily:Roboto,arial,sans-serif;font-size:14px">DRM_MODE_ATOMIC_TEST_ONLY) fail=
s for the base case. But whether anybody in the Weston world would want tha=
t patch is probably another story...</span></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
For legacy modesetting I guess you would need to pick between<br>
supporting the really large video modes vs. exposing all planes. But<br>
that&#39;s a no-brainer, since the legacy API for planes is practically<br>
unusable. Then again, I don&#39;t know if the kernel DRM core allows you to=
<br>
make such distinction.<br>
<br>
Btw. AFAIK there is nothing wrong with using the exact same FB on<br>
multiple planes simultaneously.<br>
<br>
<br>
Thanks,<br>
pq<br>
</blockquote></div></div>

--000000000000f2bb33059ca78a58--

--===============1348760689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1348760689==--
