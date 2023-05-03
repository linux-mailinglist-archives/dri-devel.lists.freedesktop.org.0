Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF66F5CB9
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 19:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064EF10E31B;
	Wed,  3 May 2023 17:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF2C10E012;
 Wed,  3 May 2023 17:09:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94f910ea993so894170666b.3; 
 Wed, 03 May 2023 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683133763; x=1685725763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QfrsQP/ikOqgrJewjhj8voQfxGZ5ZbgHv6TQvu1DUz0=;
 b=X0rc5IPpCTAaC/7DxwhyJcmlj6B0v33g6QgJ1whRGgsG39Mo16UN5L7SO2NXkpXwnX
 Wo6SWVnXXa03bDyB1mVrExDpxVuVciT8WFKzjDsOkwLUe30ns2tV3h6XoeLD4ZPBySVB
 ETkLkBP00S9JaC8CRqa0di1ieGDYHHZ02saDm9LydKir5jz2xqqUy79p72bYUp64LPlh
 2NVhS3scCG+FjtAx2ERVJq/8LJrkprViRoNKZE3W7tF0K/qOkg8nu0b3+3HKMOnBHcyz
 xqM6wpmiYkU4DbJuYTkSQKk0Dbgc76lTJnx/ZyDdY1IGg3n0Q07pZf4TZDgarvTAUbun
 iT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683133763; x=1685725763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QfrsQP/ikOqgrJewjhj8voQfxGZ5ZbgHv6TQvu1DUz0=;
 b=I/UQ8uZQ/qLLRLoSqbwMT8eGBg3OQlMLO8cOntvBedY3JHz7pJgOOH2cUvSzt6pQqi
 +Bb8vyjD5S0mOrxbAnwFDKTH+CisWZ0kyPBuIYeVPd6IR+pDgbUmdYBw1FB+kDGTV1z/
 le+CBCQ/f9LYqN2mRBwZjFEBkjABrogeQs1skswd/laBH75yG5NjmLVnCrCM7pUlzXFw
 FBoDplQZJQgqotb56CuozgkKFqb8jjThlP6Xw2HZ1TFRQvHz7Xr7TDoEC7Y5+p3l8fHV
 pW6sDybxzAJCIWk6iKAvfC/d2Y8D8zeNRdgRZIws3QnxUS6Inx6d5v00Nkpw+qPpxbsK
 kEBg==
X-Gm-Message-State: AC+VfDwjJ00YIXrGzH5JBk07Ag5wWR37Q1KaTeUwG6TnkRkOwQPq0mZk
 9sFtq2PBjSVnoT8dsx+pYqY5HQdXU4nmrb8AY1Ch288f
X-Google-Smtp-Source: ACHHUZ4pSAmHT9sBzj02KdsO2hoKgB08DR1N7DEBk/xoKE2GhomyD+mLAZj1P1nz5pWmVR64p39Uy6P5turtNTAlpGY=
X-Received: by 2002:a17:907:1c8f:b0:94a:5a9e:9da0 with SMTP id
 nb15-20020a1709071c8f00b0094a5a9e9da0mr4050289ejc.77.1683133763343; Wed, 03
 May 2023 10:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
 <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
 <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
 <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
 <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
 <76bd16ac-9251-c71f-8da3-4c4c14d3bdcf@gmail.com>
In-Reply-To: <76bd16ac-9251-c71f-8da3-4c4c14d3bdcf@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 3 May 2023 13:08:46 -0400
Message-ID: <CAAxE2A7wzrt9m0LifB=vPFr7aEtwyh9zzDDh9DkZJux2A4kKqw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000012d9b805facd1e9a"
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 michel.daenzer@mailbox.org, Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000012d9b805facd1e9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

GPU hangs are pretty common post-bringup. They are not common per user, but
if we gather all hangs from all users, we can have lots and lots of them.

GPU hangs are indeed not very debuggable. There are however some things we
can do:
- Identify the hanging IB by its VA (the kernel should know it)
- Read and parse the IB to detect memory corruption.
- Print active waves with shader disassembly if SQ isn't hung (often it's
not).

Determining which packet the CP is stuck on is tricky. The CP has 2 engines
(one frontend and one backend) that work on the same command buffer. The
frontend engine runs ahead, executes some packets and forwards others to
the backend engine. Only the frontend engine has the command buffer VA
somewhere. The backend engine only receives packets from the frontend
engine via a FIFO, so it might not be possible to tell where it's stuck if
it's stuck.

When the gfx pipeline hangs outside of shaders, making a scandump seems to
be the only way to have a chance at finding out what's going wrong, and
only AMD-internal versions of hw can be scanned.

Marek

On Wed, May 3, 2023 at 11:23=E2=80=AFAM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 03.05.23 um 17:08 schrieb Felix Kuehling:
> > Am 2023-05-03 um 03:59 schrieb Christian K=C3=B6nig:
> >> Am 02.05.23 um 20:41 schrieb Alex Deucher:
> >>> On Tue, May 2, 2023 at 11:22=E2=80=AFAM Timur Krist=C3=B3f
> >>> <timur.kristof@gmail.com> wrote:
> >>>> [SNIP]
> >>>>>>>> In my opinion, the correct solution to those problems would be
> >>>>>>>> if
> >>>>>>>> the kernel could give userspace the necessary information about
> >>>>>>>> a
> >>>>>>>> GPU hang before a GPU reset.
> >>>>>>>>
> >>>>>>>   The fundamental problem here is that the kernel doesn't have
> >>>>>>> that
> >>>>>>> information either. We know which IB timed out and can
> >>>>>>> potentially do
> >>>>>>> a devcoredump when that happens, but that's it.
> >>>>>>
> >>>>>> Is it really not possible to know such a fundamental thing as what
> >>>>>> the
> >>>>>> GPU was doing when it hung? How are we supposed to do any kind of
> >>>>>> debugging without knowing that?
> >>
> >> Yes, that's indeed something at least I try to figure out for years
> >> as well.
> >>
> >> Basically there are two major problems:
> >> 1. When the ASIC is hung you can't talk to the firmware engines any
> >> more and most state is not exposed directly, but just through some
> >> fw/hw interface.
> >>     Just take a look at how umr reads the shader state from the SQ.
> >> When that block is hung you can't do that any more and basically have
> >> no chance at all to figure out why it's hung.
> >>
> >>     Same for other engines, I remember once spending a week figuring
> >> out why the UVD block is hung during suspend. Turned out to be a
> >> debugging nightmare because any time you touch any register of that
> >> block the whole system would hang.
> >>
> >> 2. There are tons of things going on in a pipeline fashion or even
> >> completely in parallel. For example the CP is just the beginning of a
> >> rather long pipeline which at the end produces a bunch of pixels.
> >>     In almost all cases I've seen you ran into a problem somewhere
> >> deep in the pipeline and only very rarely at the beginning.
> >>
> >>>>>>
> >>>>>> I wonder what AMD's Windows driver team is doing with this problem=
,
> >>>>>> surely they must have better tools to deal with GPU hangs?
> >>>>> For better or worse, most teams internally rely on scan dumps via
> >>>>> JTAG
> >>>>> which sort of limits the usefulness outside of AMD, but also gives
> >>>>> you
> >>>>> the exact state of the hardware when it's hung so the hardware team=
s
> >>>>> prefer it.
> >>>>>
> >>>> How does this approach scale? It's not something we can ask users to
> >>>> do, and even if all of us in the radv team had a JTAG device, we
> >>>> wouldn't be able to play every game that users experience random han=
gs
> >>>> with.
> >>> It doesn't scale or lend itself particularly well to external
> >>> development, but that's the current state of affairs.
> >>
> >> The usual approach seems to be to reproduce a problem in a lab and
> >> have a JTAG attached to give the hw guys a scan dump and they can
> >> then tell you why something didn't worked as expected.
> >
> > That's the worst-case scenario where you're debugging HW or FW issues.
> > Those should be pretty rare post-bringup. But are there hangs caused
> > by user mode driver or application bugs that are easier to debug and
> > probably don't even require a GPU reset? For example most VM faults
> > can be handled without hanging the GPU. Similarly, a shader in an
> > endless loop should not require a full GPU reset. In the KFD compute
> > case, that's still preemptible and the offending process can be killed
> > with Ctrl-C or debugged with rocm-gdb.
>
> We also have infinite loop in shader abort for gfx and page faults are
> pretty rare with OpenGL (a bit more often with Vulkan) and can be
> handled gracefully on modern hw (they just spam the logs).
>
> The majority of the problems is unfortunately that we really get hard
> hangs because of some hw issues. That can be caused by unlucky timing,
> power management or doing things in an order the hw doesn't expected.
>
> Regards,
> Christian.
>
> >
> > It's more complicated for graphics because of the more complex
> > pipeline and the lack of CWSR. But it should still be possible to do
> > some debugging without JTAG if the problem is in SW and not HW or FW.
> > It's probably worth improving that debugability without getting
> > hung-up on the worst case.
> >
> > Maybe user mode graphics queues will offer a better way of recovering
> > from these kinds of bugs, if the graphics pipeline can be unstuck
> > without a GPU reset, just by killing the offending user mode queue.
> >
> > Regards,
> >   Felix
> >
> >
> >>
> >> And yes that absolutely doesn't scale.
> >>
> >> Christian.
> >>
> >>>
> >>> Alex
> >>
>
>

--00000000000012d9b805facd1e9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>GPU hangs are pretty common post-bringup. They are no=
t common per user, but if we gather all hangs from all users, we can have l=
ots and lots of them.</div><div><br></div><div>GPU hangs are indeed not ver=
y debuggable. There are however some things we can do:</div><div>- Identify=
 the hanging IB by its VA (the kernel should know it)</div><div>- Read and =
parse the IB to detect memory corruption.<br></div><div>- Print active wave=
s with shader disassembly if SQ isn&#39;t hung (often it&#39;s not).<br></d=
iv><div><br></div><div>Determining which packet the CP is stuck on is trick=
y. The CP has 2 engines (one frontend and one backend) that work on the sam=
e command buffer. The frontend engine runs ahead, executes some packets and=
 forwards others to the backend engine. Only the frontend engine has the co=
mmand buffer VA somewhere. The backend engine only receives packets from th=
e frontend engine via a FIFO, so it might not be possible to tell where it&=
#39;s stuck if it&#39;s stuck.</div><div></div><div></div><div><br></div><d=
iv>When the gfx pipeline hangs outside of shaders, making a scandump seems =
to be the only way to have a chance at finding out what&#39;s going wrong, =
and only AMD-internal versions of hw can be scanned.<br></div><div><br></di=
v><div>Marek<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, May 3, 2023 at 11:23=E2=80=AFAM Christian K=
=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com">ckoenig.l=
eichtzumerken@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Am 03.05.23 um 17:08 schrieb Felix Kuehling:<br>
&gt; Am 2023-05-03 um 03:59 schrieb Christian K=C3=B6nig:<br>
&gt;&gt; Am 02.05.23 um 20:41 schrieb Alex Deucher:<br>
&gt;&gt;&gt; On Tue, May 2, 2023 at 11:22=E2=80=AFAM Timur Krist=C3=B3f <br=
>
&gt;&gt;&gt; &lt;<a href=3D"mailto:timur.kristof@gmail.com" target=3D"_blan=
k">timur.kristof@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; [SNIP]<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; In my opinion, the correct solution to tho=
se problems would be<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; if<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the kernel could give userspace the necess=
ary information about<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; GPU hang before a GPU reset.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0 The fundamental problem here is that th=
e kernel doesn&#39;t have<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; that<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; information either. We know which IB timed out=
 and can<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; potentially do<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; a devcoredump when that happens, but that&#39;=
s it.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Is it really not possible to know such a fundament=
al thing as what<br>
&gt;&gt;&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt;&gt; GPU was doing when it hung? How are we supposed to=
 do any kind of<br>
&gt;&gt;&gt;&gt;&gt;&gt; debugging without knowing that?<br>
&gt;&gt;<br>
&gt;&gt; Yes, that&#39;s indeed something at least I try to figure out for =
years <br>
&gt;&gt; as well.<br>
&gt;&gt;<br>
&gt;&gt; Basically there are two major problems:<br>
&gt;&gt; 1. When the ASIC is hung you can&#39;t talk to the firmware engine=
s any <br>
&gt;&gt; more and most state is not exposed directly, but just through some=
 <br>
&gt;&gt; fw/hw interface.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Just take a look at how umr reads the shader st=
ate from the SQ. <br>
&gt;&gt; When that block is hung you can&#39;t do that any more and basical=
ly have <br>
&gt;&gt; no chance at all to figure out why it&#39;s hung.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Same for other engines, I remember once spendin=
g a week figuring <br>
&gt;&gt; out why the UVD block is hung during suspend. Turned out to be a <=
br>
&gt;&gt; debugging nightmare because any time you touch any register of tha=
t <br>
&gt;&gt; block the whole system would hang.<br>
&gt;&gt;<br>
&gt;&gt; 2. There are tons of things going on in a pipeline fashion or even=
 <br>
&gt;&gt; completely in parallel. For example the CP is just the beginning o=
f a <br>
&gt;&gt; rather long pipeline which at the end produces a bunch of pixels.<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 In almost all cases I&#39;ve seen you ran into =
a problem somewhere <br>
&gt;&gt; deep in the pipeline and only very rarely at the beginning.<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I wonder what AMD&#39;s Windows driver team is doi=
ng with this problem,<br>
&gt;&gt;&gt;&gt;&gt;&gt; surely they must have better tools to deal with GP=
U hangs?<br>
&gt;&gt;&gt;&gt;&gt; For better or worse, most teams internally rely on sca=
n dumps via<br>
&gt;&gt;&gt;&gt;&gt; JTAG<br>
&gt;&gt;&gt;&gt;&gt; which sort of limits the usefulness outside of AMD, bu=
t also gives<br>
&gt;&gt;&gt;&gt;&gt; you<br>
&gt;&gt;&gt;&gt;&gt; the exact state of the hardware when it&#39;s hung so =
the hardware teams<br>
&gt;&gt;&gt;&gt;&gt; prefer it.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; How does this approach scale? It&#39;s not something we ca=
n ask users to<br>
&gt;&gt;&gt;&gt; do, and even if all of us in the radv team had a JTAG devi=
ce, we<br>
&gt;&gt;&gt;&gt; wouldn&#39;t be able to play every game that users experie=
nce random hangs<br>
&gt;&gt;&gt;&gt; with.<br>
&gt;&gt;&gt; It doesn&#39;t scale or lend itself particularly well to exter=
nal<br>
&gt;&gt;&gt; development, but that&#39;s the current state of affairs.<br>
&gt;&gt;<br>
&gt;&gt; The usual approach seems to be to reproduce a problem in a lab and=
 <br>
&gt;&gt; have a JTAG attached to give the hw guys a scan dump and they can =
<br>
&gt;&gt; then tell you why something didn&#39;t worked as expected.<br>
&gt;<br>
&gt; That&#39;s the worst-case scenario where you&#39;re debugging HW or FW=
 issues. <br>
&gt; Those should be pretty rare post-bringup. But are there hangs caused <=
br>
&gt; by user mode driver or application bugs that are easier to debug and <=
br>
&gt; probably don&#39;t even require a GPU reset? For example most VM fault=
s <br>
&gt; can be handled without hanging the GPU. Similarly, a shader in an <br>
&gt; endless loop should not require a full GPU reset. In the KFD compute <=
br>
&gt; case, that&#39;s still preemptible and the offending process can be ki=
lled <br>
&gt; with Ctrl-C or debugged with rocm-gdb.<br>
<br>
We also have infinite loop in shader abort for gfx and page faults are <br>
pretty rare with OpenGL (a bit more often with Vulkan) and can be <br>
handled gracefully on modern hw (they just spam the logs).<br>
<br>
The majority of the problems is unfortunately that we really get hard <br>
hangs because of some hw issues. That can be caused by unlucky timing, <br>
power management or doing things in an order the hw doesn&#39;t expected.<b=
r>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; It&#39;s more complicated for graphics because of the more complex <br=
>
&gt; pipeline and the lack of CWSR. But it should still be possible to do <=
br>
&gt; some debugging without JTAG if the problem is in SW and not HW or FW. =
<br>
&gt; It&#39;s probably worth improving that debugability without getting <b=
r>
&gt; hung-up on the worst case.<br>
&gt;<br>
&gt; Maybe user mode graphics queues will offer a better way of recovering =
<br>
&gt; from these kinds of bugs, if the graphics pipeline can be unstuck <br>
&gt; without a GPU reset, just by killing the offending user mode queue.<br=
>
&gt;<br>
&gt; Regards,<br>
&gt; =C2=A0 Felix<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; And yes that absolutely doesn&#39;t scale.<br>
&gt;&gt;<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;<br>
<br>
</blockquote></div>

--00000000000012d9b805facd1e9a--
