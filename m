Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3592399C6C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F0A6E0F0;
	Thu,  3 Jun 2021 08:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CC16E0EA;
 Thu,  3 Jun 2021 08:20:55 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id c13so2519949plz.0;
 Thu, 03 Jun 2021 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R98p/vMQB4GdGxSkc2FOFtr0afLJ+AZfN9xNoibniUs=;
 b=ZGXl9cjRZRLHIf9rp+1wY9aJA3e3tyXGiI2qcJm57xbuwznOCETxhdjxbhV6E3dXSP
 QQMYVPRr0Pc82F+4oTsgjrTVQ2qm0fPCFxXsh0+079YGFM2sT49OSLpbmkTffs4YVEZb
 JcribCoj8LI+bz1ZBNWKwRheAtvxFgxyMRM9IMq0Fb/JTmPFfPPFiYvuyMy+T+QLREEr
 ZgxF0JnuKFjYSjpP2XeboAYDOC2/pj3fht/3X+MBKAMZwyDjB95nsZISDGVivWayQLjB
 bdbYaQYJqpFDN2hvakRDRYGid2I310ltjX+92KioxToJJyPqY8ahEchybPXBeNjD2XgO
 Cp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R98p/vMQB4GdGxSkc2FOFtr0afLJ+AZfN9xNoibniUs=;
 b=qOU6MKT7dow0L5ml/a9EhnqJuYjStglwMjjxwxCRUHwviRwlKY6s3QwVebv9RdMd6H
 uo0vw5yZNLfGwyIOaWFSC+BJnhaFcpVOaHRqAsBmtAmP5DU8rkjMUuBLB6JLAgADdyI0
 t99qdvlh4gUlkL/Sa5Cm8xtpAS/IBmBJDIiEgkefx4mOxi5Q+gZJQh8EvTOSy1NuiJlV
 oQIccsNSeyzgf3K1GT2UQoCQg/gqggIkdF3DFlOkbC7ohIZgddmlzHGNf4EFFLwa5Wlt
 pfbnbd9C8wF0Z+OPPEX1uLXRaHkd4du1ePO2QsgRlCGYqUIAnUogqi+ZtF0RKkCwD2Iw
 30kQ==
X-Gm-Message-State: AOAM532OObxlflE/9wPr4dKQqYPEpKr0AEY1cBq8ERG6emn6VJICqHNE
 zdmlxXWsZ8oUYBuVBQZUxytwKj+oiKolQV6Zg3s=
X-Google-Smtp-Source: ABdhPJxRkTvFA92DdJv1YAMjjlCc0wa0gBYRflL9y1KXuGkpwM7boT7oTObHmay01u7dzEaLxF6RAuR9NSTrAILLfhA=
X-Received: by 2002:a17:902:db0f:b029:f3:e5f4:87f1 with SMTP id
 m15-20020a170902db0fb02900f3e5f487f1mr34039388plx.26.1622708454897; Thu, 03
 Jun 2021 01:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <CAAxE2A7uK7zumDiaU1XpEi_RNv8Q+QQHU-dLB0HrES2BkdP-cw@mail.gmail.com>
 <YLiJFdcaxzXsstt6@phenom.ffwll.local>
In-Reply-To: <YLiJFdcaxzXsstt6@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 3 Jun 2021 04:20:18 -0400
Message-ID: <CAAxE2A4VPYMrjbq1W9z3pNXHP_Msn9HCFMPew9jf2h72rfK3dA@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="00000000000007430205c3d841b7"
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000007430205c3d841b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Ol=C5=A1=C3=A1k wrote:
> > On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=A1=C3=A1k wrote=
:
> > > > On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.=
com> wrote:
> > > >
> > > > > Yes, we can't break anything because we don't want to complicate
> things
> > > > > for us. It's pretty much all NAK'd already. We are trying to gath=
er
> > > more
> > > > > knowledge and then make better decisions.
> > > > >
> > > > > The idea we are considering is that we'll expose memory-based syn=
c
> > > objects
> > > > > to userspace for read only, and the kernel or hw will strictly
> control
> > > the
> > > > > memory writes to those sync objects. The hole in that idea is tha=
t
> > > > > userspace can decide not to signal a job, so even if userspace
> can't
> > > > > overwrite memory-based sync object states arbitrarily, it can sti=
ll
> > > decide
> > > > > not to signal them, and then a future fence is born.
> > > > >
> > > >
> > > > This would actually be treated as a GPU hang caused by that context=
,
> so
> > > it
> > > > should be fine.
> > >
> > > This is practically what I proposed already, except your not doing it
> with
> > > dma_fence. And on the memory fence side this also doesn't actually gi=
ve
> > > what you want for that compute model.
> > >
> > > This seems like a bit a worst of both worlds approach to me? Tons of
> work
> > > in the kernel to hide these not-dma_fence-but-almost, and still pain =
to
> > > actually drive the hardware like it should be for compute or direct
> > > display.
> > >
> > > Also maybe I've missed it, but I didn't see any replies to my
> suggestion
> > > how to fake the entire dma_fence stuff on top of new hw. Would be
> > > interesting to know what doesn't work there instead of amd folks goin=
g
> of
> > > into internal again and then coming back with another rfc from out of
> > > nowhere :-)
> > >
> >
> > Going internal again is probably a good idea to spare you the long
> > discussions and not waste your time, but we haven't talked about the
> > dma_fence stuff internally other than acknowledging that it can be
> solved.
> >
> > The compute use case already uses the hw as-is with no inter-process
> > sharing, which mostly keeps the kernel out of the picture. It uses
> glFinish
> > to sync with GL.
> >
> > The gfx use case needs new hardware logic to support implicit and
> explicit
> > sync. When we propose a solution, it's usually torn apart the next day =
by
> > ourselves.
> >
> > Since we are talking about next hw or next next hw, preemption should b=
e
> > better.
> >
> > user queue =3D user-mapped ring buffer
> >
> > For implicit sync, we will only let userspace lock access to a buffer
> via a
> > user queue, which waits for the per-buffer sequence counter in memory t=
o
> be
> > >=3D the number assigned by the kernel, and later unlock the access wit=
h
> > another command, which increments the per-buffer sequence counter in
> memory
> > with atomic_inc regardless of the number assigned by the kernel. The
> kernel
> > counter and the counter in memory can be out-of-sync, and I'll explain
> why
> > it's OK. If a process increments the kernel counter but not the memory
> > counter, that's its problem and it's the same as a GPU hang caused by
> that
> > process. If a process increments the memory counter but not the kernel
> > counter, the ">=3D" condition alongside atomic_inc guarantee that
> signaling n
> > will signal n+1, so it will never deadlock but also it will effectively
> > disable synchronization. This method of disabling synchronization is
> > similar to a process corrupting the buffer, which should be fine. Can y=
ou
> > find any flaw in it? I can't find any.
>
> Hm maybe I misunderstood what exactly you wanted to do earlier. That kind
> of "we let userspace free-wheel whatever it wants, kernel ensures
> correctness of the resulting chain of dma_fence with reset the entire
> context" is what I proposed too.
>
> Like you say, userspace is allowed to render garbage already.
>
> > The explicit submit can be done by userspace (if there is no
> > synchronization), but we plan to use the kernel to do it for implicit
> sync.
> > Essentially, the kernel will receive a buffer list and addresses of wai=
t
> > commands in the user queue. It will assign new sequence numbers to all
> > buffers and write those numbers into the wait commands, and ring the hw
> > doorbell to start execution of that queue.
>
> Yeah for implicit sync I think kernel and using drm/scheduler to sort out
> the dma_fence dependencies is probably best. Since you can filter out
> which dma_fence you hand to the scheduler for dependency tracking you can
> filter out your own ones and let the hw handle those directly (depending
> how much your hw can do an all that). On i915 we might do that to be able
> to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw scheduler.
>
> For buffer tracking with implicit sync I think cleanest is probably to
> still keep them wrapped as dma_fence and stuffed into dma_resv, but
> conceptually it's the same. If we let every driver reinvent their own
> buffer tracking just because the hw works a bit different it'll be a mess=
.
>
> Wrt wait commands: I'm honestly not sure why you'd do that. Userspace get=
s
> to keep the pieces if it gets it wrong. You do still need to handle
> external dma_fence though, hence drm/scheduler frontend to sort these out=
.
>

The reason is to disallow lower-privileged process to deadlock/hang a
higher-privileged process where the kernel can't tell who did it. If the
implicit-sync sequence counter is read only to userspace and only
incrementable by the unlock-signal command after the lock-wait command
appeared in the same queue (both together forming a critical section),
userspace can't manipulate it arbitrarily and we get almost the exact same
behavior as implicit sync has today. That means any implicitly-sync'd
buffer from any process can be fully trusted by a compositor to signal in a
finite time, and possibly even trusted by the kernel. The only thing that's
different is that a malicious process can disable implicit sync for a
buffer in all processes/kernel, but it can't hang other processes/kernel
(it can only hang itself and the kernel will be notified). So I'm a happy
panda now. :)

Marek

--00000000000007430205c3d841b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter &lt;<a href=3D"mailto:d=
aniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jun 02, 2021 at 11=
:16:39PM -0400, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter &lt;<a href=3D"mailto:dan=
iel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=A1=C3=A1k w=
rote:<br>
&gt; &gt; &gt; On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k &lt;<a =
href=3D"mailto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Yes, we can&#39;t break anything because we don&#39;t w=
ant to complicate things<br>
&gt; &gt; &gt; &gt; for us. It&#39;s pretty much all NAK&#39;d already. We =
are trying to gather<br>
&gt; &gt; more<br>
&gt; &gt; &gt; &gt; knowledge and then make better decisions.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The idea we are considering is that we&#39;ll expose me=
mory-based sync<br>
&gt; &gt; objects<br>
&gt; &gt; &gt; &gt; to userspace for read only, and the kernel or hw will s=
trictly control<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; memory writes to those sync objects. The hole in that i=
dea is that<br>
&gt; &gt; &gt; &gt; userspace can decide not to signal a job, so even if us=
erspace can&#39;t<br>
&gt; &gt; &gt; &gt; overwrite memory-based sync object states arbitrarily, =
it can still<br>
&gt; &gt; decide<br>
&gt; &gt; &gt; &gt; not to signal them, and then a future fence is born.<br=
>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This would actually be treated as a GPU hang caused by that =
context, so<br>
&gt; &gt; it<br>
&gt; &gt; &gt; should be fine.<br>
&gt; &gt;<br>
&gt; &gt; This is practically what I proposed already, except your not doin=
g it with<br>
&gt; &gt; dma_fence. And on the memory fence side this also doesn&#39;t act=
ually give<br>
&gt; &gt; what you want for that compute model.<br>
&gt; &gt;<br>
&gt; &gt; This seems like a bit a worst of both worlds approach to me? Tons=
 of work<br>
&gt; &gt; in the kernel to hide these not-dma_fence-but-almost, and still p=
ain to<br>
&gt; &gt; actually drive the hardware like it should be for compute or dire=
ct<br>
&gt; &gt; display.<br>
&gt; &gt;<br>
&gt; &gt; Also maybe I&#39;ve missed it, but I didn&#39;t see any replies t=
o my suggestion<br>
&gt; &gt; how to fake the entire dma_fence stuff on top of new hw. Would be=
<br>
&gt; &gt; interesting to know what doesn&#39;t work there instead of amd fo=
lks going of<br>
&gt; &gt; into internal again and then coming back with another rfc from ou=
t of<br>
&gt; &gt; nowhere :-)<br>
&gt; &gt;<br>
&gt; <br>
&gt; Going internal again is probably a good idea to spare you the long<br>
&gt; discussions and not waste your time, but we haven&#39;t talked about t=
he<br>
&gt; dma_fence stuff internally other than acknowledging that it can be sol=
ved.<br>
&gt; <br>
&gt; The compute use case already uses the hw as-is with no inter-process<b=
r>
&gt; sharing, which mostly keeps the kernel out of the picture. It uses glF=
inish<br>
&gt; to sync with GL.<br>
&gt; <br>
&gt; The gfx use case needs new hardware logic to support implicit and expl=
icit<br>
&gt; sync. When we propose a solution, it&#39;s usually torn apart the next=
 day by<br>
&gt; ourselves.<br>
&gt; <br>
&gt; Since we are talking about next hw or next next hw, preemption should =
be<br>
&gt; better.<br>
&gt; <br>
&gt; user queue =3D user-mapped ring buffer<br>
&gt; <br>
&gt; For implicit sync, we will only let userspace lock access to a buffer =
via a<br>
&gt; user queue, which waits for the per-buffer sequence counter in memory =
to be<br>
&gt; &gt;=3D the number assigned by the kernel, and later unlock the access=
 with<br>
&gt; another command, which increments the per-buffer sequence counter in m=
emory<br>
&gt; with atomic_inc regardless of the number assigned by the kernel. The k=
ernel<br>
&gt; counter and the counter in memory can be out-of-sync, and I&#39;ll exp=
lain why<br>
&gt; it&#39;s OK. If a process increments the kernel counter but not the me=
mory<br>
&gt; counter, that&#39;s its problem and it&#39;s the same as a GPU hang ca=
used by that<br>
&gt; process. If a process increments the memory counter but not the kernel=
<br>
&gt; counter, the &quot;&gt;=3D&quot; condition alongside atomic_inc guaran=
tee that signaling n<br>
&gt; will signal n+1, so it will never deadlock but also it will effectivel=
y<br>
&gt; disable synchronization. This method of disabling synchronization is<b=
r>
&gt; similar to a process corrupting the buffer, which should be fine. Can =
you<br>
&gt; find any flaw in it? I can&#39;t find any.<br>
<br>
Hm maybe I misunderstood what exactly you wanted to do earlier. That kind<b=
r>
of &quot;we let userspace free-wheel whatever it wants, kernel ensures<br>
correctness of the resulting chain of dma_fence with reset the entire<br>
context&quot; is what I proposed too.<br>
<br>
Like you say, userspace is allowed to render garbage already.<br>
<br>
&gt; The explicit submit can be done by userspace (if there is no<br>
&gt; synchronization), but we plan to use the kernel to do it for implicit =
sync.<br>
&gt; Essentially, the kernel will receive a buffer list and addresses of wa=
it<br>
&gt; commands in the user queue. It will assign new sequence numbers to all=
<br>
&gt; buffers and write those numbers into the wait commands, and ring the h=
w<br>
&gt; doorbell to start execution of that queue.<br>
<br>
Yeah for implicit sync I think kernel and using drm/scheduler to sort out<b=
r>
the dma_fence dependencies is probably best. Since you can filter out<br>
which dma_fence you hand to the scheduler for dependency tracking you can<b=
r>
filter out your own ones and let the hw handle those directly (depending<br=
>
how much your hw can do an all that). On i915 we might do that to be able<b=
r>
to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw scheduler.<b=
r>
<br>
For buffer tracking with implicit sync I think cleanest is probably to<br>
still keep them wrapped as dma_fence and stuffed into dma_resv, but<br>
conceptually it&#39;s the same. If we let every driver reinvent their own<b=
r>
buffer tracking just because the hw works a bit different it&#39;ll be a me=
ss.<br>
<br>
Wrt wait commands: I&#39;m honestly not sure why you&#39;d do that. Userspa=
ce gets<br>
to keep the pieces if it gets it wrong. You do still need to handle<br>
external dma_fence though, hence drm/scheduler frontend to sort these out.<=
br></blockquote><div><br></div>The reason is to disallow lower-privileged p=
rocess to deadlock/hang a higher-privileged process where the kernel can&#3=
9;t tell who did it. If the implicit-sync sequence counter is read only to =
userspace and only incrementable by the unlock-signal command after the loc=
k-wait command appeared in the same queue (both together forming a critical=
 section), userspace can&#39;t manipulate it arbitrarily and we get almost =
the exact same behavior as implicit sync has today. That means any implicit=
ly-sync&#39;d buffer from any process can be fully trusted by a compositor =
to signal in a finite time, and possibly even trusted by the kernel. The on=
ly thing that&#39;s different is that a malicious process can disable impli=
cit sync for a buffer in all processes/kernel, but it can&#39;t hang other =
processes/kernel (it can only hang itself and the kernel will be notified).=
 So I&#39;m a happy panda now. :)</div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">Marek<br></div></div>

--00000000000007430205c3d841b7--
