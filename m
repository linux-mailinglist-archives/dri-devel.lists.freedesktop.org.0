Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33F618C0DC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 20:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAC16EA2B;
	Thu, 19 Mar 2020 19:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA76E091;
 Thu, 19 Mar 2020 19:54:56 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id l36so1470849pjb.3;
 Thu, 19 Mar 2020 12:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=50MpA/RokyDYyXnH/noecTREYyWpedib1yxrl72x3K8=;
 b=sWa5KJ1cN3JFZ9O2uSVv7a3IeaeFHDib77GHdxs+M1f4jeyW6Zmh1yRcM0RT5u7mOs
 YZ1JW1mgOSvqyHT7zjMcEgPWzPf6Ml9yHhZfFghtepZEn3SaELwZhJPbWe1gaY+RreWS
 r3zcQBhMIVARNNUmTSNQgofpRUld4iZMtrdAZTfB1i586D0ZHHvHmgimckWMBuuH8zcf
 hSRsGhOLuJwmZVDcFTdsNZ0hrFDjDKCOzq+9EhO+tV8/rpuZeCcRM3tCIHvEapTcwu2D
 iQyxvfsRwpovSsrgn9T+F5RhUTipJoR31C/JoryhCN5OoEEMDndlKVHvPAkb0F4I1ML1
 qk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=50MpA/RokyDYyXnH/noecTREYyWpedib1yxrl72x3K8=;
 b=kP9Qi3/xNnUKXXt959F0djIy/W40bECCwtWkaa7TF4C7Tj4twIpsBmWkBY6ZebpZ5V
 H+JG86TX0o7cBR1ElwAfBr+QXxoTkCdxmOJNpycKsOVsZ/uzNgvDluqnEj5nRPpGpW2p
 EjrE9bR7sVWAu9TC0dC6JGigSGA2M4A3gINmbalvAL4pQuJHTSTCLVn+yFW0ktN5+oE7
 QP4ICC2g30iJBLEQkEn5g3kI4LFz+fzH4TuF0YAA+o99J8PqmS8jV3O3nIkgvjYdiAXe
 zT+/s9OZmrPhhRi91RTR4YpsDgGBt0kk2JQkJmawKyE+c4OSbgiVvRx7EzjE98bh/Iu1
 S2Lg==
X-Gm-Message-State: ANhLgQ2bpdVjLl5IP1pQYRHyDKD1kBFXFSv9Z9UerZgOeDESAezRdt0E
 aTsarV/3ZzFaUS3EE9HcnAE101TOcHXqA8VxkrE=
X-Google-Smtp-Source: ADFU+vs2X/SuybYBU06+WKKlcaHOeEU/pHq/s1X5kFoKl735hqgVDgS+0byGmiVzIJ924I5SMQVNBqUhwvVRrYWm1uo=
X-Received: by 2002:a17:90a:d585:: with SMTP id v5mr5596611pju.4.1584647696131; 
 Thu, 19 Mar 2020 12:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
 <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
 <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
 <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
 <20200319105129.GF2363188@phenom.ffwll.local>
In-Reply-To: <20200319105129.GF2363188@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 19 Mar 2020 15:54:43 -0400
Message-ID: <CAAxE2A4-YocvFctj7x4mHe=hMx4Q6DBzjPBisbi+Tmh1UMjCpg@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0823201907=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0823201907==
Content-Type: multipart/alternative; boundary="00000000000005abdd05a13a8b75"

--00000000000005abdd05a13a8b75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu., Mar. 19, 2020, 06:51 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Tue, Mar 17, 2020 at 11:01:57AM +0100, Michel D=C3=A4nzer wrote:
> > On 2020-03-16 7:33 p.m., Marek Ol=C5=A1=C3=A1k wrote:
> > > On Mon, Mar 16, 2020 at 5:57 AM Michel D=C3=A4nzer <michel@daenzer.ne=
t>
> wrote:
> > >> On 2020-03-16 4:50 a.m., Marek Ol=C5=A1=C3=A1k wrote:
> > >>> The synchronization works because the Mesa driver waits for idle
> (drains
> > >>> the GFX pipeline) at the end of command buffers and there is only 1
> > >>> graphics queue, so everything is ordered.
> > >>>
> > >>> The GFX pipeline runs asynchronously to the command buffer, meaning
> the
> > >>> command buffer only starts draws and doesn't wait for completion. I=
f
> the
> > >>> Mesa driver didn't wait at the end of the command buffer, the comma=
nd
> > >>> buffer would finish and a different process could start execution o=
f
> its
> > >>> own command buffer while shaders of the previous process are still
> > >> running.
> > >>>
> > >>> If the Mesa driver submits a command buffer internally (because it'=
s
> > >> full),
> > >>> it doesn't wait, so the GFX pipeline doesn't notice that a command
> buffer
> > >>> ended and a new one started.
> > >>>
> > >>> The waiting at the end of command buffers happens only when the
> flush is
> > >>> external (Swap buffers, glFlush).
> > >>>
> > >>> It's a performance problem, because the GFX queue is blocked until
> the
> > >> GFX
> > >>> pipeline is drained at the end of every frame at least.
> > >>>
> > >>> So explicit fences for SwapBuffers would help.
> > >>
> > >> Not sure what difference it would make, since the same thing needs t=
o
> be
> > >> done for explicit fences as well, doesn't it?
> > >
> > > No. Explicit fences don't require userspace to wait for idle in the
> command
> > > buffer. Fences are signalled when the last draw is complete and cache=
s
> are
> > > flushed. Before that happens, any command buffer that is not dependen=
t
> on
> > > the fence can start execution. There is never a need for the GPU to b=
e
> idle
> > > if there is enough independent work to do.
> >
> > I don't think explicit fences in the context of this discussion imply
> > using that different fence signalling mechanism though. My understandin=
g
> > is that the API proposed by Jason allows implicit fences to be used as
> > explicit ones and vice versa, so presumably they have to use the same
> > signalling mechanism.
> >
> >
> > Anyway, maybe the different fence signalling mechanism you describe
> > could be used by the amdgpu kernel driver in general, then Mesa could
> > drop the waits for idle and get the benefits with implicit sync as well=
?
>
> Yeah, this is entirely about the programming model visible to userspace.
> There shouldn't be any impact on the driver's choice of a top vs. bottom
> of the gpu pipeline used for synchronization, that's entirely up to what
> you're hw/driver/scheduler can pull off.
>
> Doing a full gfx pipeline flush for shared buffers, when your hw can do
> be, sounds like an issue to me that's not related to this here at all. It
> might be intertwined with amdgpu's special interpretation of dma_resv
> fences though, no idea. We might need to revamp all that. But for a
> userspace client that does nothing fancy (no multiple render buffer
> targets in one bo, or vk style "I write to everything all the time,
> perhaps" stuff) there should be 0 perf difference between implicit sync
> through dma_resv and explicit sync through sync_file/syncobj/dma_fence
> directly.
>
> If there is I'd consider that a bit a driver bug.
>

Last time I checked, there was no fence sync in gnome shell and compiz
after an app passes a buffer to it. So drivers have to invent hacks to work
around it and decrease performance. It's not a driver bug.

Implicit sync really means that apps and compositors don't sync, so the
driver has to guess when it should sync.

Marek


-Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--00000000000005abdd05a13a8b75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu., Mar. 19, 2020, 06:51 Daniel Vetter, &lt;<a hr=
ef=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Tue, Mar 17, 2020 at 11:01:57AM +0100, Michel =
D=C3=A4nzer wrote:<br>
&gt; On 2020-03-16 7:33 p.m., Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; &gt; On Mon, Mar 16, 2020 at 5:57 AM Michel D=C3=A4nzer &lt;<a href=3D=
"mailto:michel@daenzer.net" target=3D"_blank" rel=3D"noreferrer">michel@dae=
nzer.net</a>&gt; wrote:<br>
&gt; &gt;&gt; On 2020-03-16 4:50 a.m., Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; &gt;&gt;&gt; The synchronization works because the Mesa driver waits f=
or idle (drains<br>
&gt; &gt;&gt;&gt; the GFX pipeline) at the end of command buffers and there=
 is only 1<br>
&gt; &gt;&gt;&gt; graphics queue, so everything is ordered.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; The GFX pipeline runs asynchronously to the command buffe=
r, meaning the<br>
&gt; &gt;&gt;&gt; command buffer only starts draws and doesn&#39;t wait for=
 completion. If the<br>
&gt; &gt;&gt;&gt; Mesa driver didn&#39;t wait at the end of the command buf=
fer, the command<br>
&gt; &gt;&gt;&gt; buffer would finish and a different process could start e=
xecution of its<br>
&gt; &gt;&gt;&gt; own command buffer while shaders of the previous process =
are still<br>
&gt; &gt;&gt; running.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; If the Mesa driver submits a command buffer internally (b=
ecause it&#39;s<br>
&gt; &gt;&gt; full),<br>
&gt; &gt;&gt;&gt; it doesn&#39;t wait, so the GFX pipeline doesn&#39;t noti=
ce that a command buffer<br>
&gt; &gt;&gt;&gt; ended and a new one started.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; The waiting at the end of command buffers happens only wh=
en the flush is<br>
&gt; &gt;&gt;&gt; external (Swap buffers, glFlush).<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; It&#39;s a performance problem, because the GFX queue is =
blocked until the<br>
&gt; &gt;&gt; GFX<br>
&gt; &gt;&gt;&gt; pipeline is drained at the end of every frame at least.<b=
r>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; So explicit fences for SwapBuffers would help.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Not sure what difference it would make, since the same thing =
needs to be<br>
&gt; &gt;&gt; done for explicit fences as well, doesn&#39;t it?<br>
&gt; &gt; <br>
&gt; &gt; No. Explicit fences don&#39;t require userspace to wait for idle =
in the command<br>
&gt; &gt; buffer. Fences are signalled when the last draw is complete and c=
aches are<br>
&gt; &gt; flushed. Before that happens, any command buffer that is not depe=
ndent on<br>
&gt; &gt; the fence can start execution. There is never a need for the GPU =
to be idle<br>
&gt; &gt; if there is enough independent work to do.<br>
&gt; <br>
&gt; I don&#39;t think explicit fences in the context of this discussion im=
ply<br>
&gt; using that different fence signalling mechanism though. My understandi=
ng<br>
&gt; is that the API proposed by Jason allows implicit fences to be used as=
<br>
&gt; explicit ones and vice versa, so presumably they have to use the same<=
br>
&gt; signalling mechanism.<br>
&gt; <br>
&gt; <br>
&gt; Anyway, maybe the different fence signalling mechanism you describe<br=
>
&gt; could be used by the amdgpu kernel driver in general, then Mesa could<=
br>
&gt; drop the waits for idle and get the benefits with implicit sync as wel=
l?<br>
<br>
Yeah, this is entirely about the programming model visible to userspace.<br=
>
There shouldn&#39;t be any impact on the driver&#39;s choice of a top vs. b=
ottom<br>
of the gpu pipeline used for synchronization, that&#39;s entirely up to wha=
t<br>
you&#39;re hw/driver/scheduler can pull off.<br>
<br>
Doing a full gfx pipeline flush for shared buffers, when your hw can do<br>
be, sounds like an issue to me that&#39;s not related to this here at all. =
It<br>
might be intertwined with amdgpu&#39;s special interpretation of dma_resv<b=
r>
fences though, no idea. We might need to revamp all that. But for a<br>
userspace client that does nothing fancy (no multiple render buffer<br>
targets in one bo, or vk style &quot;I write to everything all the time,<br=
>
perhaps&quot; stuff) there should be 0 perf difference between implicit syn=
c<br>
through dma_resv and explicit sync through sync_file/syncobj/dma_fence<br>
directly.<br>
<br>
If there is I&#39;d consider that a bit a driver bug.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Last time I checked, t=
here was no fence sync in gnome shell and compiz after an app passes a buff=
er to it. So drivers have to invent hacks to work around it and decrease pe=
rformance. It&#39;s not a driver bug.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Implicit sync really means that apps and compositors don&#39;=
t sync, so the driver has to guess when it should sync.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Marek</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
-Daniel<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://blog.ffwll.ch</a><br>
</blockquote></div></div></div>

--00000000000005abdd05a13a8b75--

--===============0823201907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0823201907==--
