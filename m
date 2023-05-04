Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E0D6F6292
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 03:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DE988BE3;
	Thu,  4 May 2023 01:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8418F88BE3;
 Thu,  4 May 2023 01:13:42 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9659c5b14d8so83404866b.3; 
 Wed, 03 May 2023 18:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683162819; x=1685754819;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ye7wkrgcg8l/SDUOJ9GooWEpBzS3G2hvmwEu3cEvh7w=;
 b=XIckTYMo11u6OJi/ppLwdUBypcE3adBlWVrHuoQtEDMgcaXmDHTGnLJmyqo9Jcl2rX
 VqAmR8g7JWfL4rptEgeY9dmbq+hZgQWplHhpZ0wa+ncm4ZK9jXcgkSsQOdfDwwzryp+e
 b9Xt5vokwlAnbooxB+40szDDrTJxYcdSOCxCceXHrOh0+2rWw0MxScb+rxkcgtHHYnEf
 Gh4ALwdWdI9pNHkfoJuntRdpYp/ExJ68JoW7RDWJjdWiX+OmdgrCi/+DGMEQUeHicZ7Y
 /SMkUgNYLZ9JiW4aWisKKCGPtJJEB0idmib7lw4k7mNz1pinHAyF6mh6WsYzW6s2uwtK
 VzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683162819; x=1685754819;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ye7wkrgcg8l/SDUOJ9GooWEpBzS3G2hvmwEu3cEvh7w=;
 b=Lsk+BGNADKXE80CHKuhDwvAjW5UkC89HWHVFjgXkHAPGI6HsEqgd8jbl6BX67gUD0R
 mx2+xKi7IH8pd8j3/DsuKR+2tcrPUE9xV1UXwtv1TYlgzEqDFWFIaro+8Vi5LkIpAWp6
 JSnwo2jhNue/stm1SBO1LzDAMvV/vG1u3Pv7DEdmUu+/vrH2Xeb5v6IQw3Z39na+LAgs
 qenCwtxDgeXxcdNbTV5p8zxnR8lxKZSRft/PifINs7nqKBgmKW57SqlrjwgQvXr0rTS5
 8f8eP/hEfhTDAO2AhjLnDiBjaxNX6FhVIrp99vE04xnnPkan4e13XZ3nd6fnBHXV2koB
 TK7Q==
X-Gm-Message-State: AC+VfDxiW9mIWgJSdxq0CtcwXWtHt4jsjN6q+xaz0jPxrMuVEf/g4X1n
 c77Z1VoUyn4bHC9JdlGmHarlHQtg2zsJxQ4ObMU=
X-Google-Smtp-Source: ACHHUZ74MT68/sxAWWdSeOmKJWnRG9CEVDwn4SkwplcSfDXRlCyZj2VP6Qr11YPT2JrIpnG2qwuysliRmLjVqQfOmk8=
X-Received: by 2002:a17:907:368d:b0:94e:ea6d:fa98 with SMTP id
 bi13-20020a170907368d00b0094eea6dfa98mr4476909ejc.28.1683162819112; Wed, 03
 May 2023 18:13:39 -0700 (PDT)
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
 <CAAxE2A7wzrt9m0LifB=vPFr7aEtwyh9zzDDh9DkZJux2A4kKqw@mail.gmail.com>
 <4c0ed590-4237-435d-40b3-21dffa9f9f00@igalia.com>
In-Reply-To: <4c0ed590-4237-435d-40b3-21dffa9f9f00@igalia.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 3 May 2023 21:13:26 -0400
Message-ID: <CAAxE2A7mqGOxZ2BZDBGUh5uDYqiFuKPRu2hqpiDG5KZ_jdHFcA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Content-Type: multipart/alternative; boundary="000000000000eeb14805fad3e197"
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000eeb14805fad3e197
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 3, 2023, 14:53 Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrot=
e:

> Em 03/05/2023 14:08, Marek Ol=C5=A1=C3=A1k escreveu:
> > GPU hangs are pretty common post-bringup. They are not common per user,
> > but if we gather all hangs from all users, we can have lots and lots of
> > them.
> >
> > GPU hangs are indeed not very debuggable. There are however some things
> > we can do:
> > - Identify the hanging IB by its VA (the kernel should know it)
>
> How can the kernel tell which VA range is being executed? I only found
> that information at mmCP_IB1_BASE_ regs, but as stated in this thread by
> Christian this is not reliable to be read.
>

The kernel receives the VA and the size via the CS ioctl. When user queues
are enabled, the kernel will no longer receive them.


> > - Read and parse the IB to detect memory corruption.
> > - Print active waves with shader disassembly if SQ isn't hung (often
> > it's not).
> >
> > Determining which packet the CP is stuck on is tricky. The CP has 2
> > engines (one frontend and one backend) that work on the same command
> > buffer. The frontend engine runs ahead, executes some packets and
> > forwards others to the backend engine. Only the frontend engine has the
> > command buffer VA somewhere. The backend engine only receives packets
> > from the frontend engine via a FIFO, so it might not be possible to tel=
l
> > where it's stuck if it's stuck.
>
> Do they run at the same asynchronously or does the front end waits the
> back end to execute?
>

They run asynchronously and should run asynchronously for performance, but
they can be synchronized using a special packet (PFP_SYNC_ME).

Marek


> >
> > When the gfx pipeline hangs outside of shaders, making a scandump seems
> > to be the only way to have a chance at finding out what's going wrong,
> > and only AMD-internal versions of hw can be scanned.
> >
> > Marek
> >
> > On Wed, May 3, 2023 at 11:23=E2=80=AFAM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com
> > <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
> >
> >     Am 03.05.23 um 17:08 schrieb Felix Kuehling:
> >      > Am 2023-05-03 um 03:59 schrieb Christian K=C3=B6nig:
> >      >> Am 02.05.23 um 20:41 schrieb Alex Deucher:
> >      >>> On Tue, May 2, 2023 at 11:22=E2=80=AFAM Timur Krist=C3=B3f
> >      >>> <timur.kristof@gmail.com <mailto:timur.kristof@gmail.com>>
> wrote:
> >      >>>> [SNIP]
> >      >>>>>>>> In my opinion, the correct solution to those problems
> would be
> >      >>>>>>>> if
> >      >>>>>>>> the kernel could give userspace the necessary information
> >     about
> >      >>>>>>>> a
> >      >>>>>>>> GPU hang before a GPU reset.
> >      >>>>>>>>
> >      >>>>>>>   The fundamental problem here is that the kernel doesn't
> have
> >      >>>>>>> that
> >      >>>>>>> information either. We know which IB timed out and can
> >      >>>>>>> potentially do
> >      >>>>>>> a devcoredump when that happens, but that's it.
> >      >>>>>>
> >      >>>>>> Is it really not possible to know such a fundamental thing
> >     as what
> >      >>>>>> the
> >      >>>>>> GPU was doing when it hung? How are we supposed to do any
> >     kind of
> >      >>>>>> debugging without knowing that?
> >      >>
> >      >> Yes, that's indeed something at least I try to figure out for
> years
> >      >> as well.
> >      >>
> >      >> Basically there are two major problems:
> >      >> 1. When the ASIC is hung you can't talk to the firmware engines
> any
> >      >> more and most state is not exposed directly, but just through
> some
> >      >> fw/hw interface.
> >      >>     Just take a look at how umr reads the shader state from the
> SQ.
> >      >> When that block is hung you can't do that any more and basicall=
y
> >     have
> >      >> no chance at all to figure out why it's hung.
> >      >>
> >      >>     Same for other engines, I remember once spending a week
> >     figuring
> >      >> out why the UVD block is hung during suspend. Turned out to be =
a
> >      >> debugging nightmare because any time you touch any register of
> that
> >      >> block the whole system would hang.
> >      >>
> >      >> 2. There are tons of things going on in a pipeline fashion or
> even
> >      >> completely in parallel. For example the CP is just the beginnin=
g
> >     of a
> >      >> rather long pipeline which at the end produces a bunch of pixel=
s.
> >      >>     In almost all cases I've seen you ran into a problem
> somewhere
> >      >> deep in the pipeline and only very rarely at the beginning.
> >      >>
> >      >>>>>>
> >      >>>>>> I wonder what AMD's Windows driver team is doing with this
> >     problem,
> >      >>>>>> surely they must have better tools to deal with GPU hangs?
> >      >>>>> For better or worse, most teams internally rely on scan dump=
s
> via
> >      >>>>> JTAG
> >      >>>>> which sort of limits the usefulness outside of AMD, but also
> >     gives
> >      >>>>> you
> >      >>>>> the exact state of the hardware when it's hung so the
> >     hardware teams
> >      >>>>> prefer it.
> >      >>>>>
> >      >>>> How does this approach scale? It's not something we can ask
> >     users to
> >      >>>> do, and even if all of us in the radv team had a JTAG device,
> we
> >      >>>> wouldn't be able to play every game that users experience
> >     random hangs
> >      >>>> with.
> >      >>> It doesn't scale or lend itself particularly well to external
> >      >>> development, but that's the current state of affairs.
> >      >>
> >      >> The usual approach seems to be to reproduce a problem in a lab
> and
> >      >> have a JTAG attached to give the hw guys a scan dump and they c=
an
> >      >> then tell you why something didn't worked as expected.
> >      >
> >      > That's the worst-case scenario where you're debugging HW or FW
> >     issues.
> >      > Those should be pretty rare post-bringup. But are there hangs
> caused
> >      > by user mode driver or application bugs that are easier to debug
> and
> >      > probably don't even require a GPU reset? For example most VM
> faults
> >      > can be handled without hanging the GPU. Similarly, a shader in a=
n
> >      > endless loop should not require a full GPU reset. In the KFD
> compute
> >      > case, that's still preemptible and the offending process can be
> >     killed
> >      > with Ctrl-C or debugged with rocm-gdb.
> >
> >     We also have infinite loop in shader abort for gfx and page faults
> are
> >     pretty rare with OpenGL (a bit more often with Vulkan) and can be
> >     handled gracefully on modern hw (they just spam the logs).
> >
> >     The majority of the problems is unfortunately that we really get ha=
rd
> >     hangs because of some hw issues. That can be caused by unlucky
> timing,
> >     power management or doing things in an order the hw doesn't expecte=
d.
> >
> >     Regards,
> >     Christian.
> >
> >      >
> >      > It's more complicated for graphics because of the more complex
> >      > pipeline and the lack of CWSR. But it should still be possible t=
o
> do
> >      > some debugging without JTAG if the problem is in SW and not HW o=
r
> >     FW.
> >      > It's probably worth improving that debugability without getting
> >      > hung-up on the worst case.
> >      >
> >      > Maybe user mode graphics queues will offer a better way of
> >     recovering
> >      > from these kinds of bugs, if the graphics pipeline can be unstuc=
k
> >      > without a GPU reset, just by killing the offending user mode
> queue.
> >      >
> >      > Regards,
> >      >   Felix
> >      >
> >      >
> >      >>
> >      >> And yes that absolutely doesn't scale.
> >      >>
> >      >> Christian.
> >      >>
> >      >>>
> >      >>> Alex
> >      >>
> >
>

--000000000000eeb14805fad3e197
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, May 3, 2023, 14:53 Andr=C3=A9 Almeida &lt;<a href=3D"m=
ailto:andrealmeid@igalia.com">andrealmeid@igalia.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Em 03/05/2023 14:08, Marek Ol=C5=A1=C3=A1k=
 escreveu:<br>
&gt; GPU hangs are pretty common post-bringup. They are not common per user=
, <br>
&gt; but if we gather all hangs from all users, we can have lots and lots o=
f <br>
&gt; them.<br>
&gt; <br>
&gt; GPU hangs are indeed not very debuggable. There are however some thing=
s <br>
&gt; we can do:<br>
&gt; - Identify the hanging IB by its VA (the kernel should know it)<br>
<br>
How can the kernel tell which VA range is being executed? I only found <br>
that information at mmCP_IB1_BASE_ regs, but as stated in this thread by <b=
r>
Christian this is not reliable to be read.<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">The kernel receives the VA and th=
e size via the CS ioctl. When user queues are enabled, the kernel will no l=
onger receive them.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; - Read and parse the IB to detect memory corruption.<br>
&gt; - Print active waves with shader disassembly if SQ isn&#39;t hung (oft=
en <br>
&gt; it&#39;s not).<br>
&gt; <br>
&gt; Determining which packet the CP is stuck on is tricky. The CP has 2 <b=
r>
&gt; engines (one frontend and one backend) that work on the same command <=
br>
&gt; buffer. The frontend engine runs ahead, executes some packets and <br>
&gt; forwards others to the backend engine. Only the frontend engine has th=
e <br>
&gt; command buffer VA somewhere. The backend engine only receives packets =
<br>
&gt; from the frontend engine via a FIFO, so it might not be possible to te=
ll <br>
&gt; where it&#39;s stuck if it&#39;s stuck.<br>
<br>
Do they run at the same asynchronously or does the front end waits the <br>
back end to execute?<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">They run asynchronously and should run asynchronously f=
or performance, but they can be synchronized using a special packet (PFP_SY=
NC_ME).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Marek</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
&gt; <br>
&gt; When the gfx pipeline hangs outside of shaders, making a scandump seem=
s <br>
&gt; to be the only way to have a chance at finding out what&#39;s going wr=
ong, <br>
&gt; and only AMD-internal versions of hw can be scanned.<br>
&gt; <br>
&gt; Marek<br>
&gt; <br>
&gt; On Wed, May 3, 2023 at 11:23=E2=80=AFAM Christian K=C3=B6nig <br>
&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">ckoenig.leichtzumerken@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">ckoenig.leichtzumerken@gmail.com</a>&gt;&gt;=
 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Am 03.05.23 um 17:08 schrieb Felix Kuehling:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Am 2023-05-03 um 03:59 schrieb Christian K=C3=
=B6nig:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Am 02.05.23 um 20:41 schrieb Alex Deucher=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; On Tue, May 2, 2023 at 11:22=E2=80=AF=
AM Timur Krist=C3=B3f<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &lt;<a href=3D"mailto:timur.kristof@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">timur.kristof@gmail.com</a> =
&lt;mailto:<a href=3D"mailto:timur.kristof@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">timur.kristof@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; [SNIP]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; In my opinion, th=
e correct solution to those problems would be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; if<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the kernel could =
give userspace the necessary information<br>
&gt;=C2=A0 =C2=A0 =C2=A0about<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; GPU hang before a=
 GPU reset.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0 The fundamenta=
l problem here is that the kernel doesn&#39;t have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt; that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt; information either. W=
e know which IB timed out and can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt; potentially do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;&gt; a devcoredump when th=
at happens, but that&#39;s it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt; Is it really not possible=
 to know such a fundamental thing<br>
&gt;=C2=A0 =C2=A0 =C2=A0as what<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt; the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt; GPU was doing when it hun=
g? How are we supposed to do any<br>
&gt;=C2=A0 =C2=A0 =C2=A0kind of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt; debugging without knowing=
 that?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Yes, that&#39;s indeed something at least=
 I try to figure out for years<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; as well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Basically there are two major problems:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 1. When the ASIC is hung you can&#39;t ta=
lk to the firmware engines any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; more and most state is not exposed direct=
ly, but just through some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; fw/hw interface.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 Just take a look at ho=
w umr reads the shader state from the SQ.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; When that block is hung you can&#39;t do =
that any more and basically<br>
&gt;=C2=A0 =C2=A0 =C2=A0have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; no chance at all to figure out why it&#39=
;s hung.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 Same for other engines=
, I remember once spending a week<br>
&gt;=C2=A0 =C2=A0 =C2=A0figuring<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; out why the UVD block is hung during susp=
end. Turned out to be a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; debugging nightmare because any time you =
touch any register of that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; block the whole system would hang.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 2. There are tons of things going on in a=
 pipeline fashion or even<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; completely in parallel. For example the C=
P is just the beginning<br>
&gt;=C2=A0 =C2=A0 =C2=A0of a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; rather long pipeline which at the end pro=
duces a bunch of pixels.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 In almost all cases I&=
#39;ve seen you ran into a problem somewhere<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; deep in the pipeline and only very rarely=
 at the beginning.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt; I wonder what AMD&#39;s W=
indows driver team is doing with this<br>
&gt;=C2=A0 =C2=A0 =C2=A0problem,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;&gt; surely they must have bet=
ter tools to deal with GPU hangs?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt; For better or worse, most tea=
ms internally rely on scan dumps via<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt; JTAG<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt; which sort of limits the usef=
ulness outside of AMD, but also<br>
&gt;=C2=A0 =C2=A0 =C2=A0gives<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt; you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt; the exact state of the hardwa=
re when it&#39;s hung so the<br>
&gt;=C2=A0 =C2=A0 =C2=A0hardware teams<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt; prefer it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; How does this approach scale? It&=
#39;s not something we can ask<br>
&gt;=C2=A0 =C2=A0 =C2=A0users to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; do, and even if all of us in the =
radv team had a JTAG device, we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; wouldn&#39;t be able to play ever=
y game that users experience<br>
&gt;=C2=A0 =C2=A0 =C2=A0random hangs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; It doesn&#39;t scale or lend itself p=
articularly well to external<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; development, but that&#39;s the curre=
nt state of affairs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; The usual approach seems to be to reprodu=
ce a problem in a lab and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; have a JTAG attached to give the hw guys =
a scan dump and they can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; then tell you why something didn&#39;t wo=
rked as expected.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; That&#39;s the worst-case scenario where you&=
#39;re debugging HW or FW<br>
&gt;=C2=A0 =C2=A0 =C2=A0issues.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Those should be pretty rare post-bringup. But=
 are there hangs caused<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; by user mode driver or application bugs that =
are easier to debug and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; probably don&#39;t even require a GPU reset? =
For example most VM faults<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; can be handled without hanging the GPU. Simil=
arly, a shader in an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; endless loop should not require a full GPU re=
set. In the KFD compute<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; case, that&#39;s still preemptible and the of=
fending process can be<br>
&gt;=C2=A0 =C2=A0 =C2=A0killed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; with Ctrl-C or debugged with rocm-gdb.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We also have infinite loop in shader abort for gfx =
and page faults are<br>
&gt;=C2=A0 =C2=A0 =C2=A0pretty rare with OpenGL (a bit more often with Vulk=
an) and can be<br>
&gt;=C2=A0 =C2=A0 =C2=A0handled gracefully on modern hw (they just spam the=
 logs).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The majority of the problems is unfortunately that =
we really get hard<br>
&gt;=C2=A0 =C2=A0 =C2=A0hangs because of some hw issues. That can be caused=
 by unlucky timing,<br>
&gt;=C2=A0 =C2=A0 =C2=A0power management or doing things in an order the hw=
 doesn&#39;t expected.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Christian.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; It&#39;s more complicated for graphics becaus=
e of the more complex<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; pipeline and the lack of CWSR. But it should =
still be possible to do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; some debugging without JTAG if the problem is=
 in SW and not HW or<br>
&gt;=C2=A0 =C2=A0 =C2=A0FW.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; It&#39;s probably worth improving that debuga=
bility without getting<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; hung-up on the worst case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Maybe user mode graphics queues will offer a =
better way of<br>
&gt;=C2=A0 =C2=A0 =C2=A0recovering<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; from these kinds of bugs, if the graphics pip=
eline can be unstuck<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; without a GPU reset, just by killing the offe=
nding user mode queue.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; =C2=A0 Felix<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; And yes that absolutely doesn&#39;t scale=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Christian.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Alex<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000eeb14805fad3e197--
