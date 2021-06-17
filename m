Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE83ABCA0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EA16E2C0;
	Thu, 17 Jun 2021 19:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8A56E288;
 Thu, 17 Jun 2021 19:23:38 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so1630872pji.0; 
 Thu, 17 Jun 2021 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=db+/LhnMSNLP3T89x5vD9HdEG5iszyWpYNb6OaMSuRA=;
 b=Ryy1MauTEZNp9JE/FhXYH+AVc8Cw/eTzFDdzVldtKUj/9KjYyOH2c4X0dsPKo9fhDz
 h1EcA/0p1ot4agp0i6xWFhri9Cnpjk16FfYak/Sk6hXl3FZuTYWeDAo5vDczy+PJi/Cw
 bj5zunuEqCJseVP7UfBSqWQY1l+vSYQw9Y0HdixZXfZOnCgGVseKV9LYlUjcxGEWTYZf
 t4HXubRASXqP1iePUDL/AWB1t0xWm/hOJg7CkRtNRGIxekxTzAU7BXjeL/ExSHnH2icT
 CjN9WBqMwcOndmoGdkogxh8YApu5tgCOGZdGkEBusxS7qj/Wfs8wrgMXL9o+Q6yA1YMG
 xq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=db+/LhnMSNLP3T89x5vD9HdEG5iszyWpYNb6OaMSuRA=;
 b=f3W4DL4q8U4Hj1hzZmWtZDV57H4AVB62ILkl8+5DcHCTA3fHmiJEEELP0NcNjeh4sV
 31CLBr5rlaUoW4ByVo1VHzXyhVrqUUqdyL5IeDy0w1Gvga44tOABavma4OioNv0sKFd3
 cpT7wHRAW0U7bTWyYsDmgp/GO7r1B0gezBkBC4TqGA9+vZdNxAa13K9ZGA4Xes9lkoOJ
 nG/FJmlLI/vNnfBcc8S69tjmO5AeEFxbQk6oT4zaggP2kp/ZpyK4uqQtu+1ROoIWEaMe
 mT/FZDF/fSjeUg8EMB67kcE1T8zSoi56SEZURfdiEVCIj2AmfpA4Z7bgpvxIZpS31+Gt
 jtOg==
X-Gm-Message-State: AOAM530ptc5czWbiVO6S959QnGI9dsfwrq5LihpBFDyB3dgZc5Vtijca
 GQ3F8fuhQTRTOTzfTVNh+oRrZn4RVsyeGi4E6go=
X-Google-Smtp-Source: ABdhPJx5kxkScUG4Z1GxBEV0wvhMQWupUIof+VC8r/02pjKEx2i6ExC37wAxZdUCRVH74VpMjOHTriEvz3bHzzeuzqk=
X-Received: by 2002:a17:90b:45d5:: with SMTP id
 jt21mr5582991pjb.75.1623957817993; 
 Thu, 17 Jun 2021 12:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <586edeb3-73df-3da2-4925-1829712cba8b@gmail.com>
 <YMC/4IhCePCu57HU@phenom.ffwll.local>
 <1478737b-88aa-a24a-d2d7-cd3716df0cb0@gmail.com>
 <YMEI8pcXpt22gi3D@phenom.ffwll.local>
 <CAAxE2A6zwCHPaP5NnRETVe_BOsoVQK1T=h8gqRnUtP4sRFBkrw@mail.gmail.com>
 <eadcb7ee-f6fa-c8c9-a8c4-ac42571871cf@gmail.com>
 <CAAxE2A7vhWB6QbejJLLkfk5J8361DPtA9Dtxd9FWDzND8F_diA@mail.gmail.com>
 <ebeabd65-9d8e-d364-a084-62bcdd7aa439@gmail.com>
 <YMt83HMgDqvep9cN@phenom.ffwll.local>
 <CAAxE2A4mAsHt6_s_Ou1a+DvLU-6eobdM32r17HQt5Lo5iTZ6BQ@mail.gmail.com>
 <YMucqjsBxKdg2u2B@phenom.ffwll.local>
In-Reply-To: <YMucqjsBxKdg2u2B@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 17 Jun 2021 15:23:01 -0400
Message-ID: <CAAxE2A5cn_2Zk29oC5kqXymQgLG41RhN8pxbOF6H1xgZx0-wkQ@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000df2e0c05c4fb2436"
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

--000000000000df2e0c05c4fb2436
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Timeline semaphore waits (polling on memory) will be unmonitored and as
fast as the roundtrip to memory. Semaphore writes will be slower because
the copy of those write requests will also be forwarded to the kernel.
Arbitrary writes are not protected by the hw but the kernel will take
action against such behavior because it will receive them too.

I don't know if that would work with dma_fence.

Marek


On Thu, Jun 17, 2021 at 3:04 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jun 17, 2021 at 02:28:06PM -0400, Marek Ol=C5=A1=C3=A1k wrote:
> > The kernel will know who should touch the implicit-sync semaphore next,
> and
> > at the same time, the copy of all write requests to the implicit-sync
> > semaphore will be forwarded to the kernel for monitoring and bo_wait.
> >
> > Syncobjs could either use the same monitored access as implicit sync or
> be
> > completely unmonitored. We haven't decided yet.
> >
> > Syncfiles could either use one of the above or wait for a syncobj to go
> > idle before converting to a syncfile.
>
> Hm this sounds all like you're planning to completely rewrap everything
> ... I'm assuming the plan is still that this is going to be largely
> wrapped in dma_fence? Maybe with timeline objects being a bit more
> optimized, but I'm not sure how much you can optimize without breaking th=
e
> interfaces.
> -Daniel
>
> >
> > Marek
> >
> >
> >
> > On Thu, Jun 17, 2021 at 12:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Mon, Jun 14, 2021 at 07:13:00PM +0200, Christian K=C3=B6nig wrote:
> > > > As long as we can figure out who touched to a certain sync object
> last
> > > that
> > > > would indeed work, yes.
> > >
> > > Don't you need to know who will touch it next, i.e. who is holding up
> your
> > > fence? Or maybe I'm just again totally confused.
> > > -Daniel
> > >
> > > >
> > > > Christian.
> > > >
> > > > Am 14.06.21 um 19:10 schrieb Marek Ol=C5=A1=C3=A1k:
> > > > > The call to the hw scheduler has a limitation on the size of all
> > > > > parameters combined. I think we can only pass a 32-bit sequence
> number
> > > > > and a ~16-bit global (per-GPU) syncobj handle in one call and not
> much
> > > > > else.
> > > > >
> > > > > The syncobj handle can be an element index in a global (per-GPU)
> > > syncobj
> > > > > table and it's read only for all processes with the exception of
> the
> > > > > signal command. Syncobjs can either have per VMID write access
> flags
> > > for
> > > > > the signal command (slow), or any process can write to any
> syncobjs and
> > > > > only rely on the kernel checking the write log (fast).
> > > > >
> > > > > In any case, we can execute the memory write in the queue engine
> and
> > > > > only use the hw scheduler for logging, which would be perfect.
> > > > >
> > > > > Marek
> > > > >
> > > > > On Thu, Jun 10, 2021 at 12:33 PM Christian K=C3=B6nig
> > > > > <ckoenig.leichtzumerken@gmail.com
> > > > > <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
> > > > >
> > > > >     Hi guys,
> > > > >
> > > > >     maybe soften that a bit. Reading from the shared memory of th=
e
> > > > >     user fence is ok for everybody. What we need to take more car=
e
> of
> > > > >     is the writing side.
> > > > >
> > > > >     So my current thinking is that we allow read only access, but
> > > > >     writing a new sequence value needs to go through the
> > > scheduler/kernel.
> > > > >
> > > > >     So when the CPU wants to signal a timeline fence it needs to
> call
> > > > >     an IOCTL. When the GPU wants to signal the timeline fence it
> needs
> > > > >     to hand that of to the hardware scheduler.
> > > > >
> > > > >     If we lockup the kernel can check with the hardware who did t=
he
> > > > >     last write and what value was written.
> > > > >
> > > > >     That together with an IOCTL to give out sequence number for
> > > > >     implicit sync to applications should be sufficient for the
> kernel
> > > > >     to track who is responsible if something bad happens.
> > > > >
> > > > >     In other words when the hardware says that the shader wrote
> stuff
> > > > >     like 0xdeadbeef 0x0 or 0xffffffff into memory we kill the
> process
> > > > >     who did that.
> > > > >
> > > > >     If the hardware says that seq - 1 was written fine, but seq i=
s
> > > > >     missing then the kernel blames whoever was supposed to write
> seq.
> > > > >
> > > > >     Just pieping the write through a privileged instance should b=
e
> > > > >     fine to make sure that we don't run into issues.
> > > > >
> > > > >     Christian.
> > > > >
> > > > >     Am 10.06.21 um 17:59 schrieb Marek Ol=C5=A1=C3=A1k:
> > > > > >     Hi Daniel,
> > > > > >
> > > > > >     We just talked about this whole topic internally and we cam=
e
> up
> > > > > >     to the conclusion that the hardware needs to understand syn=
c
> > > > > >     object handles and have high-level wait and signal
> operations in
> > > > > >     the command stream. Sync objects will be backed by memory,
> but
> > > > > >     they won't be readable or writable by processes directly. T=
he
> > > > > >     hardware will log all accesses to sync objects and will sen=
d
> the
> > > > > >     log to the kernel periodically. The kernel will identify
> > > > > >     malicious behavior.
> > > > > >
> > > > > >     Example of a hardware command stream:
> > > > > >     ...
> > > > > >     ImplicitSyncWait(syncObjHandle, sequenceNumber); // the
> sequence
> > > > > >     number is assigned by the kernel
> > > > > >     Draw();
> > > > > >     ImplicitSyncSignalWhenDone(syncObjHandle);
> > > > > >     ...
> > > > > >
> > > > > >     I'm afraid we have no other choice because of the TLB
> > > > > >     invalidation overhead.
> > > > > >
> > > > > >     Marek
> > > > > >
> > > > > >
> > > > > >     On Wed, Jun 9, 2021 at 2:31 PM Daniel Vetter <
> daniel@ffwll.ch
> > > > > >     <mailto:daniel@ffwll.ch>> wrote:
> > > > > >
> > > > > >         On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian K=
=C3=B6nig
> > > wrote:
> > > > > >         > Am 09.06.21 um 15:19 schrieb Daniel Vetter:
> > > > > >         > > [SNIP]
> > > > > >         > > > Yeah, we call this the lightweight and the
> heavyweight
> > > > > >         tlb flush.
> > > > > >         > > >
> > > > > >         > > > The lighweight can be used when you are sure that
> you
> > > > > >         don't have any of the
> > > > > >         > > > PTEs currently in flight in the 3D/DMA engine and
> you
> > > > > >         just need to
> > > > > >         > > > invalidate the TLB.
> > > > > >         > > >
> > > > > >         > > > The heavyweight must be used when you need to
> > > > > >         invalidate the TLB *AND* make
> > > > > >         > > > sure that no concurrently operation moves new stu=
ff
> > > > > >         into the TLB.
> > > > > >         > > >
> > > > > >         > > > The problem is for this use case we have to use t=
he
> > > > > >         heavyweight one.
> > > > > >         > > Just for my own curiosity: So the lightweight flush
> is
> > > > > >         only for in-between
> > > > > >         > > CS when you know access is idle? Or does that also
> not
> > > > > >         work if userspace
> > > > > >         > > has a CS on a dma engine going at the same time
> because
> > > > > >         the tlb aren't
> > > > > >         > > isolated enough between engines?
> > > > > >         >
> > > > > >         > More or less correct, yes.
> > > > > >         >
> > > > > >         > The problem is a lightweight flush only invalidates t=
he
> > > > > >         TLB, but doesn't
> > > > > >         > take care of entries which have been handed out to th=
e
> > > > > >         different engines.
> > > > > >         >
> > > > > >         > In other words what can happen is the following:
> > > > > >         >
> > > > > >         > 1. Shader asks TLB to resolve address X.
> > > > > >         > 2. TLB looks into its cache and can't find address X
> so it
> > > > > >         asks the walker
> > > > > >         > to resolve.
> > > > > >         > 3. Walker comes back with result for address X and TL=
B
> puts
> > > > > >         that into its
> > > > > >         > cache and gives it to Shader.
> > > > > >         > 4. Shader starts doing some operation using result fo=
r
> > > > > >         address X.
> > > > > >         > 5. You send lightweight TLB invalidate and TLB throws
> away
> > > > > >         cached values for
> > > > > >         > address X.
> > > > > >         > 6. Shader happily still uses whatever the TLB gave to
> it in
> > > > > >         step 3 to
> > > > > >         > accesses address X
> > > > > >         >
> > > > > >         > See it like the shader has their own 1 entry L0 TLB
> cache
> > > > > >         which is not
> > > > > >         > affected by the lightweight flush.
> > > > > >         >
> > > > > >         > The heavyweight flush on the other hand sends out a
> > > > > >         broadcast signal to
> > > > > >         > everybody and only comes back when we are sure that a=
n
> > > > > >         address is not in use
> > > > > >         > any more.
> > > > > >
> > > > > >         Ah makes sense. On intel the shaders only operate in VA=
,
> > > > > >         everything goes
> > > > > >         around as explicit async messages to IO blocks. So we
> don't
> > > > > >         have this, the
> > > > > >         only difference in tlb flushes is between tlb flush in
> the IB
> > > > > >         and an mmio
> > > > > >         one which is independent for anything currently being
> > > > > >         executed on an
> > > > > >         egine.
> > > > > >         -Daniel
> > > > > >         --         Daniel Vetter
> > > > > >         Software Engineer, Intel Corporation
> > > > > >         http://blog.ffwll.ch <http://blog.ffwll.ch>
> > > > > >
> > > > >
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000df2e0c05c4fb2436
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Timeline semaphore waits (polling on memory) will be =
unmonitored and as fast as the roundtrip to memory. Semaphore writes will b=
e slower because the copy of those write requests will also be forwarded to=
 the kernel. Arbitrary writes are not protected by the hw but the kernel wi=
ll take action against such behavior because it will receive them too.<br><=
/div><div><br></div><div>I don&#39;t know if that would work with dma_fence=
.<br></div><div><br></div><div>Marek</div><div><br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 17, 20=
21 at 3:04 PM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@f=
fwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Thu, Jun 17, 2021 at 02:28:06PM -0400, Marek Ol=C5=A1=C3=A1k wrot=
e:<br>
&gt; The kernel will know who should touch the implicit-sync semaphore next=
, and<br>
&gt; at the same time, the copy of all write requests to the implicit-sync<=
br>
&gt; semaphore will be forwarded to the kernel for monitoring and bo_wait.<=
br>
&gt; <br>
&gt; Syncobjs could either use the same monitored access as implicit sync o=
r be<br>
&gt; completely unmonitored. We haven&#39;t decided yet.<br>
&gt; <br>
&gt; Syncfiles could either use one of the above or wait for a syncobj to g=
o<br>
&gt; idle before converting to a syncfile.<br>
<br>
Hm this sounds all like you&#39;re planning to completely rewrap everything=
<br>
... I&#39;m assuming the plan is still that this is going to be largely<br>
wrapped in dma_fence? Maybe with timeline objects being a bit more<br>
optimized, but I&#39;m not sure how much you can optimize without breaking =
the<br>
interfaces.<br>
-Daniel<br>
<br>
&gt; <br>
&gt; Marek<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Thu, Jun 17, 2021 at 12:48 PM Daniel Vetter &lt;<a href=3D"mailto:d=
aniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, Jun 14, 2021 at 07:13:00PM +0200, Christian K=C3=B6nig wr=
ote:<br>
&gt; &gt; &gt; As long as we can figure out who touched to a certain sync o=
bject last<br>
&gt; &gt; that<br>
&gt; &gt; &gt; would indeed work, yes.<br>
&gt; &gt;<br>
&gt; &gt; Don&#39;t you need to know who will touch it next, i.e. who is ho=
lding up your<br>
&gt; &gt; fence? Or maybe I&#39;m just again totally confused.<br>
&gt; &gt; -Daniel<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Christian.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Am 14.06.21 um 19:10 schrieb Marek Ol=C5=A1=C3=A1k:<br>
&gt; &gt; &gt; &gt; The call to the hw scheduler has a limitation on the si=
ze of all<br>
&gt; &gt; &gt; &gt; parameters combined. I think we can only pass a 32-bit =
sequence number<br>
&gt; &gt; &gt; &gt; and a ~16-bit global (per-GPU) syncobj handle in one ca=
ll and not much<br>
&gt; &gt; &gt; &gt; else.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The syncobj handle can be an element index in a global =
(per-GPU)<br>
&gt; &gt; syncobj<br>
&gt; &gt; &gt; &gt; table and it&#39;s read only for all processes with the=
 exception of the<br>
&gt; &gt; &gt; &gt; signal command. Syncobjs can either have per VMID write=
 access flags<br>
&gt; &gt; for<br>
&gt; &gt; &gt; &gt; the signal command (slow), or any process can write to =
any syncobjs and<br>
&gt; &gt; &gt; &gt; only rely on the kernel checking the write log (fast).<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; In any case, we can execute the memory write in the que=
ue engine and<br>
&gt; &gt; &gt; &gt; only use the hw scheduler for logging, which would be p=
erfect.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Marek<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Jun 10, 2021 at 12:33 PM Christian K=C3=B6nig<b=
r>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com"=
 target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a><br>
&gt; &gt; &gt; &gt; &lt;mailto:<a href=3D"mailto:ckoenig.leichtzumerken@gma=
il.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt;&gt; wrot=
e:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi guys,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0maybe soften that a bit. Reading fro=
m the shared memory of the<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0user fence is ok for everybody. What=
 we need to take more care of<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0is the writing side.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0So my current thinking is that we al=
low read only access, but<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0writing a new sequence value needs t=
o go through the<br>
&gt; &gt; scheduler/kernel.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0So when the CPU wants to signal a ti=
meline fence it needs to call<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0an IOCTL. When the GPU wants to sign=
al the timeline fence it needs<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to hand that of to the hardware sche=
duler.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0If we lockup the kernel can check wi=
th the hardware who did the<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0last write and what value was writte=
n.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0That together with an IOCTL to give =
out sequence number for<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0implicit sync to applications should=
 be sufficient for the kernel<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to track who is responsible if somet=
hing bad happens.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0In other words when the hardware say=
s that the shader wrote stuff<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0like 0xdeadbeef 0x0 or 0xffffffff in=
to memory we kill the process<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0who did that.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0If the hardware says that seq - 1 wa=
s written fine, but seq is<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0missing then the kernel blames whoev=
er was supposed to write seq.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Just pieping the write through a pri=
vileged instance should be<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fine to make sure that we don&#39;t =
run into issues.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Christian.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Am 10.06.21 um 17:59 schrieb Marek O=
l=C5=A1=C3=A1k:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi Daniel,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0We just talked about this whole=
 topic internally and we came up<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to the conclusion that the hard=
ware needs to understand sync<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0object handles and have high-le=
vel wait and signal operations in<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0the command stream. Sync object=
s will be backed by memory, but<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0they won&#39;t be readable or w=
ritable by processes directly. The<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0hardware will log all accesses =
to sync objects and will send the<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0log to the kernel periodically.=
 The kernel will identify<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0malicious behavior.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Example of a hardware command s=
tream:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ImplicitSyncWait(syncObjHandle,=
 sequenceNumber); // the sequence<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0number is assigned by the kerne=
l<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Draw();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ImplicitSyncSignalWhenDone(sync=
ObjHandle);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0I&#39;m afraid we have no other=
 choice because of the TLB<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0invalidation overhead.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Marek<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0On Wed, Jun 9, 2021 at 2:31 PM =
Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">dani=
el@ffwll.ch</a><br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:da=
niel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, Jun 09, 2=
021 at 03:58:26PM +0200, Christian K=C3=B6nig<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Am 09.06.21 =
um 15:19 schrieb Daniel Vetter:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; [SNIP]<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; Ye=
ah, we call this the lightweight and the heavyweight<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tlb flush.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; Th=
e lighweight can be used when you are sure that you<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t have an=
y of the<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; PT=
Es currently in flight in the 3D/DMA engine and you<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0just need to<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; in=
validate the TLB.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; Th=
e heavyweight must be used when you need to<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0invalidate the TL=
B *AND* make<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; su=
re that no concurrently operation moves new stuff<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0into the TLB.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; Th=
e problem is for this use case we have to use the<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0heavyweight one.<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; Just fo=
r my own curiosity: So the lightweight flush is<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only for in-betwe=
en<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; CS when=
 you know access is idle? Or does that also not<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0work if userspace=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; has a C=
S on a dma engine going at the same time because<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the tlb aren&#39;=
t<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; isolate=
d enough between engines?<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; More or less=
 correct, yes.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The problem =
is a lightweight flush only invalidates the<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TLB, but doesn&#3=
9;t<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; take care of=
 entries which have been handed out to the<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0different engines=
.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; In other wor=
ds what can happen is the following:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 1. Shader as=
ks TLB to resolve address X.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 2. TLB looks=
 into its cache and can&#39;t find address X so it<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asks the walker<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; to resolve.<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 3. Walker co=
mes back with result for address X and TLB puts<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that into its<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; cache and gi=
ves it to Shader.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 4. Shader st=
arts doing some operation using result for<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address X.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 5. You send =
lightweight TLB invalidate and TLB throws away<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cached values for=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; address X.<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 6. Shader ha=
ppily still uses whatever the TLB gave to it in<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0step 3 to<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; accesses add=
ress X<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; See it like =
the shader has their own 1 entry L0 TLB cache<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0which is not<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; affected by =
the lightweight flush.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The heavywei=
ght flush on the other hand sends out a<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0broadcast signal =
to<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; everybody an=
d only comes back when we are sure that an<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address is not in=
 use<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; any more.<br=
>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ah makes sense. O=
n intel the shaders only operate in VA,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0everything goes<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0around as explici=
t async messages to IO blocks. So we don&#39;t<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have this, the<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only difference i=
n tlb flushes is between tlb flush in the IB<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and an mmio<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0one which is inde=
pendent for anything currently being<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0executed on an<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0egine.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Daniel<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Daniel Vetter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Software Engineer=
, Intel Corporation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http:/=
/blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http://blog.ffwll.ch</=
a> &lt;<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank=
">http://blog.ffwll.ch</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Daniel Vetter<br>
&gt; &gt; Software Engineer, Intel Corporation<br>
&gt; &gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_bl=
ank">http://blog.ffwll.ch</a><br>
&gt; &gt;<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--000000000000df2e0c05c4fb2436--
