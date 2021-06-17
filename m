Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC5B3ABBD0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 20:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC206E97F;
	Thu, 17 Jun 2021 18:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756876E120;
 Thu, 17 Jun 2021 18:28:43 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id z26so5699269pfj.5;
 Thu, 17 Jun 2021 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xp/s8eBBtXoZ5gW9nyzWQSCJ06d7ccV+8Q2YVLMAHRQ=;
 b=AD/F/N79gQ3PrZfldcmCftJMeDhXgX5WSWoh2cxiy8IME5okXLTERws/8DNxDj897U
 VthLLcxqOaQrCjlVCfIlArjOInmN5N9D3B8kc/b0LTy8VKHDlw4FVmjZP08xaPgM9rVe
 V6TnIi3lFqJLNlTiIxacZM2AnGm3H3T2mjkQvJIVX5KD8g09mbgRzQ72yXjzKfLfaYvq
 9dNCTFN4/7I6mrBxzLGVnc7iK+A44zOFl2xbC72HXokyW8v01tHe0zWDwtF493XqgUPi
 WVN/pKmnKg+ormJRx8RePBe+tR/S/DWPS8uNpjRleIkCHDqE15+Y40/0OlAUv8TTdJ9+
 TH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xp/s8eBBtXoZ5gW9nyzWQSCJ06d7ccV+8Q2YVLMAHRQ=;
 b=PFip/isJimKYetfjpM6w6xzUqC6CjXTL7cgH5IlPc+Ed/dxxmIwEQFOKYxy3UyKvjX
 pzlAydVVFNWIdFUsJWWms0z8u367ZOHjvwR6Ok3a+IQY7j23sEVqsLZELy4pJpX6w90+
 ibgOK1xtdxPF4gp9ov1jqAGZzUZFfWPjmaMIR0l4mIruQkesjbUTB3qEbNgRx8cFgq5e
 IGScEugMdFLawAwf45i0g6cXWmTiJvAaALK11JmRudhqW11pM7Bu48Tq3dWJLVys7+6S
 0LwOrqnJXjxfSqXDt67OVQTuhHaXifiBxeZX2pf0ng2aRRacTVhU9AREaWxutaKhS8LF
 UczQ==
X-Gm-Message-State: AOAM531qnClXB5ProyH1RlR/ghkmWaIPwZajl/qtV+WMv+vt6uwKKGKq
 FxR8kiJ+IIRcTOzK99CxQtXxxM334FF6vXlbXFU=
X-Google-Smtp-Source: ABdhPJyJlbGexaFM/me1myIQBqFdyuQjqKMrpZmfK4uu8rpopmcp5xeh03i7K2wbPsEByr1EKMfXutfBLX5Q11kqRIo=
X-Received: by 2002:a63:f817:: with SMTP id n23mr6196972pgh.208.1623954523086; 
 Thu, 17 Jun 2021 11:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <0fbb1197-fa88-c474-09db-6daec13d3004@gmail.com>
 <YLnq6Vuf4amZld3n@phenom.ffwll.local>
 <586edeb3-73df-3da2-4925-1829712cba8b@gmail.com>
 <YMC/4IhCePCu57HU@phenom.ffwll.local>
 <1478737b-88aa-a24a-d2d7-cd3716df0cb0@gmail.com>
 <YMEI8pcXpt22gi3D@phenom.ffwll.local>
 <CAAxE2A6zwCHPaP5NnRETVe_BOsoVQK1T=h8gqRnUtP4sRFBkrw@mail.gmail.com>
 <eadcb7ee-f6fa-c8c9-a8c4-ac42571871cf@gmail.com>
 <CAAxE2A7vhWB6QbejJLLkfk5J8361DPtA9Dtxd9FWDzND8F_diA@mail.gmail.com>
 <ebeabd65-9d8e-d364-a084-62bcdd7aa439@gmail.com>
 <YMt83HMgDqvep9cN@phenom.ffwll.local>
In-Reply-To: <YMt83HMgDqvep9cN@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 17 Jun 2021 14:28:06 -0400
Message-ID: <CAAxE2A4mAsHt6_s_Ou1a+DvLU-6eobdM32r17HQt5Lo5iTZ6BQ@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000007ae2c505c4fa604d"
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

--0000000000007ae2c505c4fa604d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The kernel will know who should touch the implicit-sync semaphore next, and
at the same time, the copy of all write requests to the implicit-sync
semaphore will be forwarded to the kernel for monitoring and bo_wait.

Syncobjs could either use the same monitored access as implicit sync or be
completely unmonitored. We haven't decided yet.

Syncfiles could either use one of the above or wait for a syncobj to go
idle before converting to a syncfile.

Marek



On Thu, Jun 17, 2021 at 12:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Jun 14, 2021 at 07:13:00PM +0200, Christian K=C3=B6nig wrote:
> > As long as we can figure out who touched to a certain sync object last
> that
> > would indeed work, yes.
>
> Don't you need to know who will touch it next, i.e. who is holding up you=
r
> fence? Or maybe I'm just again totally confused.
> -Daniel
>
> >
> > Christian.
> >
> > Am 14.06.21 um 19:10 schrieb Marek Ol=C5=A1=C3=A1k:
> > > The call to the hw scheduler has a limitation on the size of all
> > > parameters combined. I think we can only pass a 32-bit sequence numbe=
r
> > > and a ~16-bit global (per-GPU) syncobj handle in one call and not muc=
h
> > > else.
> > >
> > > The syncobj handle can be an element index in a global (per-GPU)
> syncobj
> > > table and it's read only for all processes with the exception of the
> > > signal command. Syncobjs can either have per VMID write access flags
> for
> > > the signal command (slow), or any process can write to any syncobjs a=
nd
> > > only rely on the kernel checking the write log (fast).
> > >
> > > In any case, we can execute the memory write in the queue engine and
> > > only use the hw scheduler for logging, which would be perfect.
> > >
> > > Marek
> > >
> > > On Thu, Jun 10, 2021 at 12:33 PM Christian K=C3=B6nig
> > > <ckoenig.leichtzumerken@gmail.com
> > > <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
> > >
> > >     Hi guys,
> > >
> > >     maybe soften that a bit. Reading from the shared memory of the
> > >     user fence is ok for everybody. What we need to take more care of
> > >     is the writing side.
> > >
> > >     So my current thinking is that we allow read only access, but
> > >     writing a new sequence value needs to go through the
> scheduler/kernel.
> > >
> > >     So when the CPU wants to signal a timeline fence it needs to call
> > >     an IOCTL. When the GPU wants to signal the timeline fence it need=
s
> > >     to hand that of to the hardware scheduler.
> > >
> > >     If we lockup the kernel can check with the hardware who did the
> > >     last write and what value was written.
> > >
> > >     That together with an IOCTL to give out sequence number for
> > >     implicit sync to applications should be sufficient for the kernel
> > >     to track who is responsible if something bad happens.
> > >
> > >     In other words when the hardware says that the shader wrote stuff
> > >     like 0xdeadbeef 0x0 or 0xffffffff into memory we kill the process
> > >     who did that.
> > >
> > >     If the hardware says that seq - 1 was written fine, but seq is
> > >     missing then the kernel blames whoever was supposed to write seq.
> > >
> > >     Just pieping the write through a privileged instance should be
> > >     fine to make sure that we don't run into issues.
> > >
> > >     Christian.
> > >
> > >     Am 10.06.21 um 17:59 schrieb Marek Ol=C5=A1=C3=A1k:
> > > >     Hi Daniel,
> > > >
> > > >     We just talked about this whole topic internally and we came up
> > > >     to the conclusion that the hardware needs to understand sync
> > > >     object handles and have high-level wait and signal operations i=
n
> > > >     the command stream. Sync objects will be backed by memory, but
> > > >     they won't be readable or writable by processes directly. The
> > > >     hardware will log all accesses to sync objects and will send th=
e
> > > >     log to the kernel periodically. The kernel will identify
> > > >     malicious behavior.
> > > >
> > > >     Example of a hardware command stream:
> > > >     ...
> > > >     ImplicitSyncWait(syncObjHandle, sequenceNumber); // the sequenc=
e
> > > >     number is assigned by the kernel
> > > >     Draw();
> > > >     ImplicitSyncSignalWhenDone(syncObjHandle);
> > > >     ...
> > > >
> > > >     I'm afraid we have no other choice because of the TLB
> > > >     invalidation overhead.
> > > >
> > > >     Marek
> > > >
> > > >
> > > >     On Wed, Jun 9, 2021 at 2:31 PM Daniel Vetter <daniel@ffwll.ch
> > > >     <mailto:daniel@ffwll.ch>> wrote:
> > > >
> > > >         On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian K=C3=B6=
nig
> wrote:
> > > >         > Am 09.06.21 um 15:19 schrieb Daniel Vetter:
> > > >         > > [SNIP]
> > > >         > > > Yeah, we call this the lightweight and the heavyweigh=
t
> > > >         tlb flush.
> > > >         > > >
> > > >         > > > The lighweight can be used when you are sure that you
> > > >         don't have any of the
> > > >         > > > PTEs currently in flight in the 3D/DMA engine and you
> > > >         just need to
> > > >         > > > invalidate the TLB.
> > > >         > > >
> > > >         > > > The heavyweight must be used when you need to
> > > >         invalidate the TLB *AND* make
> > > >         > > > sure that no concurrently operation moves new stuff
> > > >         into the TLB.
> > > >         > > >
> > > >         > > > The problem is for this use case we have to use the
> > > >         heavyweight one.
> > > >         > > Just for my own curiosity: So the lightweight flush is
> > > >         only for in-between
> > > >         > > CS when you know access is idle? Or does that also not
> > > >         work if userspace
> > > >         > > has a CS on a dma engine going at the same time because
> > > >         the tlb aren't
> > > >         > > isolated enough between engines?
> > > >         >
> > > >         > More or less correct, yes.
> > > >         >
> > > >         > The problem is a lightweight flush only invalidates the
> > > >         TLB, but doesn't
> > > >         > take care of entries which have been handed out to the
> > > >         different engines.
> > > >         >
> > > >         > In other words what can happen is the following:
> > > >         >
> > > >         > 1. Shader asks TLB to resolve address X.
> > > >         > 2. TLB looks into its cache and can't find address X so i=
t
> > > >         asks the walker
> > > >         > to resolve.
> > > >         > 3. Walker comes back with result for address X and TLB pu=
ts
> > > >         that into its
> > > >         > cache and gives it to Shader.
> > > >         > 4. Shader starts doing some operation using result for
> > > >         address X.
> > > >         > 5. You send lightweight TLB invalidate and TLB throws awa=
y
> > > >         cached values for
> > > >         > address X.
> > > >         > 6. Shader happily still uses whatever the TLB gave to it =
in
> > > >         step 3 to
> > > >         > accesses address X
> > > >         >
> > > >         > See it like the shader has their own 1 entry L0 TLB cache
> > > >         which is not
> > > >         > affected by the lightweight flush.
> > > >         >
> > > >         > The heavyweight flush on the other hand sends out a
> > > >         broadcast signal to
> > > >         > everybody and only comes back when we are sure that an
> > > >         address is not in use
> > > >         > any more.
> > > >
> > > >         Ah makes sense. On intel the shaders only operate in VA,
> > > >         everything goes
> > > >         around as explicit async messages to IO blocks. So we don't
> > > >         have this, the
> > > >         only difference in tlb flushes is between tlb flush in the =
IB
> > > >         and an mmio
> > > >         one which is independent for anything currently being
> > > >         executed on an
> > > >         egine.
> > > >         -Daniel
> > > >         --         Daniel Vetter
> > > >         Software Engineer, Intel Corporation
> > > >         http://blog.ffwll.ch <http://blog.ffwll.ch>
> > > >
> > >
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000007ae2c505c4fa604d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The kernel will know who should touch the implicit-sy=
nc semaphore next, and at the same time, the copy of all write requests to =
the implicit-sync semaphore will be forwarded to the kernel for monitoring =
and bo_wait.</div><div><br></div><div>Syncobjs could either use the same mo=
nitored access as implicit sync or be completely unmonitored. We haven&#39;=
t decided yet.</div><div><br></div><div>Syncfiles could either use one of t=
he above or wait for a syncobj to go idle before converting to a syncfile.<=
/div><div><br></div><div>Marek<br></div><div><br></div><div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Jun 17, 2021 at 12:48 PM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwl=
l.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Mon, Jun 14, 2021 at 07:13:00PM +0200, Christian K=
=C3=B6nig wrote:<br>
&gt; As long as we can figure out who touched to a certain sync object last=
 that<br>
&gt; would indeed work, yes.<br>
<br>
Don&#39;t you need to know who will touch it next, i.e. who is holding up y=
our<br>
fence? Or maybe I&#39;m just again totally confused.<br>
-Daniel<br>
<br>
&gt; <br>
&gt; Christian.<br>
&gt; <br>
&gt; Am 14.06.21 um 19:10 schrieb Marek Ol=C5=A1=C3=A1k:<br>
&gt; &gt; The call to the hw scheduler has a limitation on the size of all<=
br>
&gt; &gt; parameters combined. I think we can only pass a 32-bit sequence n=
umber<br>
&gt; &gt; and a ~16-bit global (per-GPU) syncobj handle in one call and not=
 much<br>
&gt; &gt; else.<br>
&gt; &gt; <br>
&gt; &gt; The syncobj handle can be an element index in a global (per-GPU) =
syncobj<br>
&gt; &gt; table and it&#39;s read only for all processes with the exception=
 of the<br>
&gt; &gt; signal command. Syncobjs can either have per VMID write access fl=
ags for<br>
&gt; &gt; the signal command (slow), or any process can write to any syncob=
js and<br>
&gt; &gt; only rely on the kernel checking the write log (fast).<br>
&gt; &gt; <br>
&gt; &gt; In any case, we can execute the memory write in the queue engine =
and<br>
&gt; &gt; only use the hw scheduler for logging, which would be perfect.<br=
>
&gt; &gt; <br>
&gt; &gt; Marek<br>
&gt; &gt; <br>
&gt; &gt; On Thu, Jun 10, 2021 at 12:33 PM Christian K=C3=B6nig<br>
&gt; &gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D=
"_blank">ckoenig.leichtzumerken@gmail.com</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" ta=
rget=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi guys,<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0maybe soften that a bit. Reading from the shar=
ed memory of the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0user fence is ok for everybody. What we need t=
o take more care of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0is the writing side.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0So my current thinking is that we allow read o=
nly access, but<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0writing a new sequence value needs to go throu=
gh the scheduler/kernel.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0So when the CPU wants to signal a timeline fen=
ce it needs to call<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0an IOCTL. When the GPU wants to signal the tim=
eline fence it needs<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0to hand that of to the hardware scheduler.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0If we lockup the kernel can check with the har=
dware who did the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0last write and what value was written.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0That together with an IOCTL to give out sequen=
ce number for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0implicit sync to applications should be suffic=
ient for the kernel<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0to track who is responsible if something bad h=
appens.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0In other words when the hardware says that the=
 shader wrote stuff<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0like 0xdeadbeef 0x0 or 0xffffffff into memory =
we kill the process<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0who did that.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0If the hardware says that seq - 1 was written =
fine, but seq is<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0missing then the kernel blames whoever was sup=
posed to write seq.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Just pieping the write through a privileged in=
stance should be<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0fine to make sure that we don&#39;t run into i=
ssues.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Christian.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Am 10.06.21 um 17:59 schrieb Marek Ol=C5=A1=C3=
=A1k:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi Daniel,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0We just talked about this whole topic int=
ernally and we came up<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to the conclusion that the hardware needs=
 to understand sync<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0object handles and have high-level wait a=
nd signal operations in<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0the command stream. Sync objects will be =
backed by memory, but<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0they won&#39;t be readable or writable by=
 processes directly. The<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0hardware will log all accesses to sync ob=
jects and will send the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0log to the kernel periodically. The kerne=
l will identify<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0malicious behavior.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Example of a hardware command stream:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ImplicitSyncWait(syncObjHandle, sequenceN=
umber); // the sequence<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0number is assigned by the kernel<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Draw();<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ImplicitSyncSignalWhenDone(syncObjHandle)=
;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0I&#39;m afraid we have no other choice be=
cause of the TLB<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0invalidation overhead.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Marek<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0On Wed, Jun 9, 2021 at 2:31 PM Daniel Vet=
ter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.c=
h</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:daniel@ffwll=
.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, Jun 09, 2021 at 03:=
58:26PM +0200, Christian K=C3=B6nig wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Am 09.06.21 um 15:19 s=
chrieb Daniel Vetter:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; [SNIP]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; Yeah, we cal=
l this the lightweight and the heavyweight<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tlb flush.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; The lighweig=
ht can be used when you are sure that you<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t have any of the<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; PTEs current=
ly in flight in the 3D/DMA engine and you<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0just need to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; invalidate t=
he TLB.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; The heavywei=
ght must be used when you need to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0invalidate the TLB *AND* ma=
ke<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; sure that no=
 concurrently operation moves new stuff<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0into the TLB.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; The problem =
is for this use case we have to use the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0heavyweight one.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; Just for my own c=
uriosity: So the lightweight flush is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only for in-between<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; CS when you know =
access is idle? Or does that also not<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0work if userspace<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; has a CS on a dma=
 engine going at the same time because<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the tlb aren&#39;t<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; isolated enough b=
etween engines?<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; More or less correct, =
yes.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The problem is a light=
weight flush only invalidates the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TLB, but doesn&#39;t<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; take care of entries w=
hich have been handed out to the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0different engines.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; In other words what ca=
n happen is the following:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 1. Shader asks TLB to =
resolve address X.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 2. TLB looks into its =
cache and can&#39;t find address X so it<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asks the walker<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; to resolve.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 3. Walker comes back w=
ith result for address X and TLB puts<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that into its<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; cache and gives it to =
Shader.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 4. Shader starts doing=
 some operation using result for<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address X.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 5. You send lightweigh=
t TLB invalidate and TLB throws away<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cached values for<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; address X.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 6. Shader happily stil=
l uses whatever the TLB gave to it in<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0step 3 to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; accesses address X<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; See it like the shader=
 has their own 1 entry L0 TLB cache<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0which is not<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; affected by the lightw=
eight flush.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The heavyweight flush =
on the other hand sends out a<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0broadcast signal to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; everybody and only com=
es back when we are sure that an<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address is not in use<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; any more.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ah makes sense. On intel th=
e shaders only operate in VA,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0everything goes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0around as explicit async me=
ssages to IO blocks. So we don&#39;t<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have this, the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only difference in tlb flus=
hes is between tlb flush in the IB<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and an mmio<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0one which is independent fo=
r anything currently being<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0executed on an<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0egine.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Daniel<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Daniel Vetter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Software Engineer, Intel Co=
rporation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://blog.ffwl=
l.ch" rel=3D"noreferrer" target=3D"_blank">http://blog.ffwll.ch</a> &lt;<a =
href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http://b=
log.ffwll.ch</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000007ae2c505c4fa604d--
