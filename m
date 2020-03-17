Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E37D188BD4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 18:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675746E5C6;
	Tue, 17 Mar 2020 17:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7836E5C1;
 Tue, 17 Mar 2020 17:13:36 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id q16so145628pje.1;
 Tue, 17 Mar 2020 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1qMDA0z5nbIODUb7Pwz016ch/4OWaMpBoMI+4oFO3Aw=;
 b=dhIjs+Oa8sELelQCMp30Zq11NosW5tfRvfBvKIe+MWGbNdE1DNrTMAGX7h0yrcZLe+
 Juqe5RCw+fNKtnqQH1Vlg52Q+OobKrAjBoyqoAVJi8HVTaijNgHM2WE5qAh9yFl73CyI
 kWfbipCzug5Rh81Wb2UXLZBpveDnZVxNVgXiCF5thcaNLBFFs+JJLm7KT+Pyyps+BYeU
 8s/XHzj1lYa1b7T2tcOaSupXkQ6B5+zCH8h6hAdKyDzzM0CE8rBPXIu8cYtuord+jwcs
 akmTe6Ytjc7h1H+GxMzwEyuEnvlzYOUtQpq+9ic0FS3bmgk+X0mMeCfKUM7ufXipYYQy
 R2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1qMDA0z5nbIODUb7Pwz016ch/4OWaMpBoMI+4oFO3Aw=;
 b=PwgFo75iuhfvmu5+EgyKbgZoia9e4wydDgbxj3MKA4rOxoIGWtzLcIz9EB4C7R0t3P
 YM/+7VVPd9cLPvuul/zXlE5zQEklyJKL9q47aqihFLeiIazhONGAJrwHytUktR182Atn
 yDkDI6HmMpmRMZaqQpVdABbx9rNsUy0pIAsgME76Kkm07n4cH6Bbj6bvUsS7Cq5YG/LS
 VcFON6Qp5QqIeUY0gVXd1bPZLm5CxcVmt//gkwCXo8udEP6mu0I8H2aqq3LjUZs9ZoJA
 U1dc6PuxEucHZm5t+2G68p8ElxKnrRonS/f4SCpn338p2hZNXJPZ8sVAUO5ek+tq7xmG
 HQfQ==
X-Gm-Message-State: ANhLgQ01W3oxWmTH5s6tQewhyjDwH1Z5IKCZ17NtTi7U6bTwdOGBUWB6
 i8ybI5yNJrNZDxOSu4B0VPp0Vw1EqXhHFMlfyy0=
X-Google-Smtp-Source: ADFU+vsclagzX/qtexJGNM4YjehC885UyWiX0M+GY3Um7qRXrDCvQTMm1+BqBbVnRypekxH1gTVWHlLnpsYjxUnDmXA=
X-Received: by 2002:a17:902:d202:: with SMTP id t2mr5447676ply.5.1584465215702; 
 Tue, 17 Mar 2020 10:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
 <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
 <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
 <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
In-Reply-To: <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 17 Mar 2020 13:13:22 -0400
Message-ID: <CAAxE2A6v8NLY+=WDhfZKT3uu5GZkdHiXqKEJtAOaQAE_YzL86g@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0621417444=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0621417444==
Content-Type: multipart/alternative; boundary="000000000000574cae05a1100e6c"

--000000000000574cae05a1100e6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue., Mar. 17, 2020, 06:02 Michel D=C3=A4nzer, <michel@daenzer.net> wrot=
e:

> On 2020-03-16 7:33 p.m., Marek Ol=C5=A1=C3=A1k wrote:
> > On Mon, Mar 16, 2020 at 5:57 AM Michel D=C3=A4nzer <michel@daenzer.net>
> wrote:
> >> On 2020-03-16 4:50 a.m., Marek Ol=C5=A1=C3=A1k wrote:
> >>> The synchronization works because the Mesa driver waits for idle
> (drains
> >>> the GFX pipeline) at the end of command buffers and there is only 1
> >>> graphics queue, so everything is ordered.
> >>>
> >>> The GFX pipeline runs asynchronously to the command buffer, meaning t=
he
> >>> command buffer only starts draws and doesn't wait for completion. If
> the
> >>> Mesa driver didn't wait at the end of the command buffer, the command
> >>> buffer would finish and a different process could start execution of
> its
> >>> own command buffer while shaders of the previous process are still
> >> running.
> >>>
> >>> If the Mesa driver submits a command buffer internally (because it's
> >> full),
> >>> it doesn't wait, so the GFX pipeline doesn't notice that a command
> buffer
> >>> ended and a new one started.
> >>>
> >>> The waiting at the end of command buffers happens only when the flush
> is
> >>> external (Swap buffers, glFlush).
> >>>
> >>> It's a performance problem, because the GFX queue is blocked until th=
e
> >> GFX
> >>> pipeline is drained at the end of every frame at least.
> >>>
> >>> So explicit fences for SwapBuffers would help.
> >>
> >> Not sure what difference it would make, since the same thing needs to =
be
> >> done for explicit fences as well, doesn't it?
> >
> > No. Explicit fences don't require userspace to wait for idle in the
> command
> > buffer. Fences are signalled when the last draw is complete and caches
> are
> > flushed. Before that happens, any command buffer that is not dependent =
on
> > the fence can start execution. There is never a need for the GPU to be
> idle
> > if there is enough independent work to do.
>
> I don't think explicit fences in the context of this discussion imply
> using that different fence signalling mechanism though. My understanding
> is that the API proposed by Jason allows implicit fences to be used as
> explicit ones and vice versa, so presumably they have to use the same
> signalling mechanism.
>
>
> Anyway, maybe the different fence signalling mechanism you describe
> could be used by the amdgpu kernel driver in general, then Mesa could
> drop the waits for idle and get the benefits with implicit sync as well?
>

Yes. If there is any waiting, or should be done in the GPU scheduler, not
in the command buffer, so that independent command buffers can use the GFX
queue.

Marek


>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
>

--000000000000574cae05a1100e6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue., Mar. 17, 2020, 06:02 Michel D=C3=A4nzer, &lt;=
<a href=3D"mailto:michel@daenzer.net">michel@daenzer.net</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On 2020-03-16 7:33 p.m., Marek Ol=C5=
=A1=C3=A1k wrote:<br>
&gt; On Mon, Mar 16, 2020 at 5:57 AM Michel D=C3=A4nzer &lt;<a href=3D"mail=
to:michel@daenzer.net" target=3D"_blank" rel=3D"noreferrer">michel@daenzer.=
net</a>&gt; wrote:<br>
&gt;&gt; On 2020-03-16 4:50 a.m., Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt;&gt;&gt; The synchronization works because the Mesa driver waits for id=
le (drains<br>
&gt;&gt;&gt; the GFX pipeline) at the end of command buffers and there is o=
nly 1<br>
&gt;&gt;&gt; graphics queue, so everything is ordered.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The GFX pipeline runs asynchronously to the command buffer, me=
aning the<br>
&gt;&gt;&gt; command buffer only starts draws and doesn&#39;t wait for comp=
letion. If the<br>
&gt;&gt;&gt; Mesa driver didn&#39;t wait at the end of the command buffer, =
the command<br>
&gt;&gt;&gt; buffer would finish and a different process could start execut=
ion of its<br>
&gt;&gt;&gt; own command buffer while shaders of the previous process are s=
till<br>
&gt;&gt; running.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If the Mesa driver submits a command buffer internally (becaus=
e it&#39;s<br>
&gt;&gt; full),<br>
&gt;&gt;&gt; it doesn&#39;t wait, so the GFX pipeline doesn&#39;t notice th=
at a command buffer<br>
&gt;&gt;&gt; ended and a new one started.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The waiting at the end of command buffers happens only when th=
e flush is<br>
&gt;&gt;&gt; external (Swap buffers, glFlush).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It&#39;s a performance problem, because the GFX queue is block=
ed until the<br>
&gt;&gt; GFX<br>
&gt;&gt;&gt; pipeline is drained at the end of every frame at least.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So explicit fences for SwapBuffers would help.<br>
&gt;&gt;<br>
&gt;&gt; Not sure what difference it would make, since the same thing needs=
 to be<br>
&gt;&gt; done for explicit fences as well, doesn&#39;t it?<br>
&gt; <br>
&gt; No. Explicit fences don&#39;t require userspace to wait for idle in th=
e command<br>
&gt; buffer. Fences are signalled when the last draw is complete and caches=
 are<br>
&gt; flushed. Before that happens, any command buffer that is not dependent=
 on<br>
&gt; the fence can start execution. There is never a need for the GPU to be=
 idle<br>
&gt; if there is enough independent work to do.<br>
<br>
I don&#39;t think explicit fences in the context of this discussion imply<b=
r>
using that different fence signalling mechanism though. My understanding<br=
>
is that the API proposed by Jason allows implicit fences to be used as<br>
explicit ones and vice versa, so presumably they have to use the same<br>
signalling mechanism.<br>
<br>
<br>
Anyway, maybe the different fence signalling mechanism you describe<br>
could be used by the amdgpu kernel driver in general, then Mesa could<br>
drop the waits for idle and get the benefits with implicit sync as well?<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes=
. If there is any waiting, or should be done in the GPU scheduler, not in t=
he command buffer, so that independent command buffers can use the GFX queu=
e.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Marek</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://redhat.com</a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br>
</blockquote></div></div></div>

--000000000000574cae05a1100e6c--

--===============0621417444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0621417444==--
