Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4FF370930
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 00:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED506E10C;
	Sat,  1 May 2021 22:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7D66E10C;
 Sat,  1 May 2021 22:27:54 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id d10so1042390pgf.12;
 Sat, 01 May 2021 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kXuRaUGpGVOGsrh7llZsXXv2xB/TCoqp2uCVmvs2J9M=;
 b=t+nu2H1ZG7yVinF4Ljth33K0LVSbJ9sUu8VMFfLCxktWTYMszF1QiC8uZRGshHQnUA
 xdIyGdXWIpSbIMmdOF3zr/bijBbFWPIVvm2FysnXZIXimDma+5FSUYoyv3Kjos5nnEDd
 8YRTp6bP7UIciTMtTDBUtLed9JrM/GXIYEvqWoOm8zouAGN84mqfOCYiSd8miq6jQMoN
 hSzjumpVkazAi2h21BIQbE/GRwdOYAeZKCO9Vf/jjcBj6hS042trBZcouBMKzbp7R0YX
 kuGzki+7XnTsGJAuA6a8PdCzpV8mwSxILqd7NzjY3bbsowVjROfTNrR0vha6xMYja+8w
 BNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kXuRaUGpGVOGsrh7llZsXXv2xB/TCoqp2uCVmvs2J9M=;
 b=Gw/AmJBoM3+Bj6PNeyUNok7k0sj+RqWyYFHWT4XfjAfTX25u5w5DYfZdlfBzuSgA6l
 9myHJPXsuv51BAqFRA03iXCBwRrMQLszeXSaLVYTFcD7LQ3P/9HYy2UK8DiIl9A30l/D
 jQXTPTFxxPB1OWH6OkJBF00dJ1KMPCxdKFvUMkCaW8F57+dR85j67K5HoqPRdIxVK2Lb
 ktOgvINqmVgNNY5+tKdeU4O2donSfNuK2VFAQ1iCwwEkP7it4xrsKAl9/7E6VKAa2xoV
 hGH3NdJQKiO7vLC+iPxKUu11v92+65QAe19HCbciaUI73WNqhG1G11z3Ui4R7/WdHaAU
 f5QQ==
X-Gm-Message-State: AOAM5310S0vW32KjqX5oR+b+n+CJvg3eXcNrqROl/fRkH8Fm+LBcAUwK
 KwhEk2m8jojEIpiQ7Tc6js/toBkXkZvtMNW0914=
X-Google-Smtp-Source: ABdhPJwGElwySGTKsOZrR7H2r4HWMgI0SnB9PG3vVw8gAr/7iYNlhvYTsSrv55QEUisfebLclwztv7ww+uHw4Ap2L4s=
X-Received: by 2002:a63:8f17:: with SMTP id n23mr3115990pgd.82.1619908074602; 
 Sat, 01 May 2021 15:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
 <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
 <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
 <d6fbc1a3-ee69-d53e-0a60-9a313be19cac@daenzer.net>
In-Reply-To: <d6fbc1a3-ee69-d53e-0a60-9a313be19cac@daenzer.net>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Sat, 1 May 2021 18:27:18 -0400
Message-ID: <CAAxE2A5V2YPRnPSue6cjsMWiWHoabmBiFEAsPXykO5-CCyunwQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0093185052=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0093185052==
Content-Type: multipart/alternative; boundary="0000000000005b01f905c14c3d7d"

--0000000000005b01f905c14c3d7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 5:07 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:

> On 2021-04-28 8:59 a.m., Christian K=C3=B6nig wrote:
> > Hi Dave,
> >
> > Am 27.04.21 um 21:23 schrieb Marek Ol=C5=A1=C3=A1k:
> >> Supporting interop with any device is always possible. It depends on
> which drivers we need to interoperate with and update them. We've already
> found the path forward for amdgpu. We just need to find out how many othe=
r
> drivers need to be updated and evaluate the cost/benefit aspect.
> >>
> >> Marek
> >>
> >> On Tue, Apr 27, 2021 at 2:38 PM Dave Airlie <airlied@gmail.com <mailto=
:
> airlied@gmail.com>> wrote:
> >>
> >>     On Tue, 27 Apr 2021 at 22:06, Christian K=C3=B6nig
> >>     <ckoenig.leichtzumerken@gmail.com <mailto:
> ckoenig.leichtzumerken@gmail.com>> wrote:
> >>     >
> >>     > Correct, we wouldn't have synchronization between device with an=
d
> without user queues any more.
> >>     >
> >>     > That could only be a problem for A+I Laptops.
> >>
> >>     Since I think you mentioned you'd only be enabling this on newer
> >>     chipsets, won't it be a problem for A+A where one A is a generatio=
n
> >>     behind the other?
> >>
> >
> > Crap, that is a good point as well.
> >
> >>
> >>     I'm not really liking where this is going btw, seems like a ill
> >>     thought out concept, if AMD is really going down the road of
> designing
> >>     hw that is currently Linux incompatible, you are going to have to
> >>     accept a big part of the burden in bringing this support in to mor=
e
> >>     than just amd drivers for upcoming generations of gpu.
> >>
> >
> > Well we don't really like that either, but we have no other option as
> far as I can see.
>
> I don't really understand what "future hw may remove support for kernel
> queues" means exactly. While the per-context queues can be mapped to
> userspace directly, they don't *have* to be, do they? I.e. the kernel
> driver should be able to either intercept userspace access to the queues,
> or in the worst case do it all itself, and provide the existing
> synchronization semantics as needed?
>
> Surely there are resource limits for the per-context queues, so the kerne=
l
> driver needs to do some kind of virtualization / multi-plexing anyway, or
> we'll get sad user faces when there's no queue available for <current hot
> game>.
>
> I'm probably missing something though, awaiting enlightenment. :)
>

The hw interface for userspace is that the ring buffer is mapped to the
process address space alongside a doorbell aperture (4K page) that isn't
real memory, but when the CPU writes into it, it tells the hw scheduler
that there are new GPU commands in the ring buffer. Userspace inserts all
the wait, draw, and signal commands into the ring buffer and then "rings"
the doorbell. It's my understanding that the ring buffer and the doorbell
are always mapped in the same GPU address space as the process, which makes
it very difficult to emulate the current protected ring buffers in the
kernel. The VMID of the ring buffer is also not changeable.

The hw scheduler doesn't do any synchronization and it doesn't see any
dependencies. It only chooses which queue to execute, so it's really just a
simple queue manager handling the virtualization aspect and not much else.

Marek

--0000000000005b01f905c14c3d7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Apr 28, 2021 at 5:07 AM Michel D=C3=A4nzer &lt;<a href=3D"ma=
ilto:michel@daenzer.net" target=3D"_blank">michel@daenzer.net</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2021-04-28 =
8:59 a.m., Christian K=C3=B6nig wrote:<br>
&gt; Hi Dave,<br>
&gt; <br>
&gt; Am 27.04.21 um 21:23 schrieb Marek Ol=C5=A1=C3=A1k:<br>
&gt;&gt; Supporting interop with any device is always possible. It depends =
on which drivers we need to interoperate with and update them. We&#39;ve al=
ready found the path forward for amdgpu. We just need to find out how many =
other drivers need to be updated and evaluate the cost/benefit aspect.<br>
&gt;&gt;<br>
&gt;&gt; Marek<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Apr 27, 2021 at 2:38 PM Dave Airlie &lt;<a href=3D"mailto:=
airlied@gmail.com" target=3D"_blank">airlied@gmail.com</a> &lt;mailto:<a hr=
ef=3D"mailto:airlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt;=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 27 Apr 2021 at 22:06, Christian K=C3=B6=
nig<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:ckoenig.leichtzumerken@gm=
ail.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a> &lt;mailto:=
<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank">ckoen=
ig.leichtzumerken@gmail.com</a>&gt;&gt; wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Correct, we wouldn&#39;t have synchronizat=
ion between device with and without user queues any more.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; That could only be a problem for A+I Lapto=
ps.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Since I think you mentioned you&#39;d only be e=
nabling this on newer<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0chipsets, won&#39;t it be a problem for A+A whe=
re one A is a generation<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0behind the other?<br>
&gt;&gt;<br>
&gt; <br>
&gt; Crap, that is a good point as well.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m not really liking where this is going b=
tw, seems like a ill<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0thought out concept, if AMD is really going dow=
n the road of designing<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0hw that is currently Linux incompatible, you ar=
e going to have to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0accept a big part of the burden in bringing thi=
s support in to more<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0than just amd drivers for upcoming generations =
of gpu.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Well we don&#39;t really like that either, but we have no other option=
 as far as I can see.<br>
<br>
I don&#39;t really understand what &quot;future hw may remove support for k=
ernel queues&quot; means exactly. While the per-context queues can be mappe=
d to userspace directly, they don&#39;t *have* to be, do they? I.e. the ker=
nel driver should be able to either intercept userspace access to the queue=
s, or in the worst case do it all itself, and provide the existing synchron=
ization semantics as needed?<br>
<br>
Surely there are resource limits for the per-context queues, so the kernel =
driver needs to do some kind of virtualization / multi-plexing anyway, or w=
e&#39;ll get sad user faces when there&#39;s no queue available for &lt;cur=
rent hot game&gt;.<br>
<br>
I&#39;m probably missing something though, awaiting enlightenment. :)<br></=
blockquote><div><br></div>The hw interface for userspace is that the ring b=
uffer is mapped to the process address space alongside a doorbell aperture =
(4K page) that isn&#39;t real memory, but when the CPU writes into it, it t=
ells the hw scheduler that there are new GPU commands in the ring buffer. U=
serspace inserts all the wait, draw, and signal commands into the ring buff=
er and then &quot;rings&quot; the doorbell. It&#39;s my understanding that =
the ring buffer and the doorbell are always mapped in the same GPU address =
space as the process, which makes it very difficult to emulate the current =
protected ring buffers in the kernel. The VMID of the ring buffer is also n=
ot changeable.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"=
gmail_quote">The hw scheduler doesn&#39;t do any synchronization and it doe=
sn&#39;t see any dependencies. It only chooses which queue to execute, so i=
t&#39;s really just a simple queue manager handling the virtualization aspe=
ct and not much else.<br></div><div class=3D"gmail_quote"></div><br><div cl=
ass=3D"gmail_quote">Marek<br></div></div>

--0000000000005b01f905c14c3d7d--

--===============0093185052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0093185052==--
