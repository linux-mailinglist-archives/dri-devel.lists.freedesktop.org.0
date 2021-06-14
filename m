Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E73A6CD3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 19:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2276289C84;
	Mon, 14 Jun 2021 17:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E7889C84;
 Mon, 14 Jun 2021 17:11:02 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso400757pjb.4; 
 Mon, 14 Jun 2021 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xbKhFjQhf/h0ATZwxZCeTTbw7yK7XKrMdCTz+WJNkI=;
 b=mgyZKuxcUBID6tIAz7fI1pr2sNj2A0rQcPAwthio3q775r1vtfrld87O6qBcNBndlU
 Zt2wvqdwzzMDIfRGB3FsmTM+gOsphfPcQ4hxOT2ptno8modAy1wRv6750IDrryBGc3Nv
 sq6ikdcP6PZ9UQo655qC5BruFxeDoIB8e7AKmw+at+Gq3qgp6/jhHKynJwoiU7GwSltO
 3oJPxBVEsBYnb/hxL0YUPjbbPlvnjBqjmBK8Q8ToNNQfN1S2yvq9Uome2YplvulSkooj
 9qYpDEj9mcsTSpEInYOxjUjtB99EZfJGegIEA8VJJBT4wF+nHEhynpPK1jeLV0Om+8DP
 tybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xbKhFjQhf/h0ATZwxZCeTTbw7yK7XKrMdCTz+WJNkI=;
 b=KiN1KU8Sv9j/77zM8LmsPQcMn3SzXXKpOCXc/Oi+UfJCFoFcoGckM5Jyvfwf2pbyhS
 HxQgT3LUP3UM5pRUvSmLGm5H70vlG0aEWwU6eFNF7qIcajKvRFwQnVFZF7wxkk3LmnSz
 nsmDLGPsQ5HPsYb/EzKv595SGapxNe0vxRPajtNu/vFCqw/70SIZ7gjU5QlXKE4Y0qkB
 HcjvJwvyDrBF85j8sWfmIwfr0aJRm2STVtR/xFi42FJRh6QqxKDsa7Bm11Mli+Cz2k80
 6rnYUeFbMSMyVQzdOerBTKLIukNv/LUtiAcLMpuQXtYM2q+HsYTQOX9rhXBWMKaH996v
 nEtA==
X-Gm-Message-State: AOAM5314iRXYA/EGc6ZnxJ6W1cDCXu4lnj0taouTHfQEZDGUYiYkeeui
 +/f28WDs/oFGeuyNfoR/GvpKwkb8Z42n/En8Nck=
X-Google-Smtp-Source: ABdhPJwe1BOvwQ4bMaRCep3XgsE0cthCWXDUIeXq6Cob3uxaW6lxn8STBIuIRgR1oyeoXySWAAcYTTwhu09WEf6ndJw=
X-Received: by 2002:a17:90a:e2c6:: with SMTP id
 fr6mr141500pjb.198.1623690662304; 
 Mon, 14 Jun 2021 10:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <a43f81f6-fe41-a6db-442e-83eb163124b9@gmail.com>
 <YLfZq5lAaR/RiFV8@phenom.ffwll.local>
 <0fbb1197-fa88-c474-09db-6daec13d3004@gmail.com>
 <YLnq6Vuf4amZld3n@phenom.ffwll.local>
 <586edeb3-73df-3da2-4925-1829712cba8b@gmail.com>
 <YMC/4IhCePCu57HU@phenom.ffwll.local>
 <1478737b-88aa-a24a-d2d7-cd3716df0cb0@gmail.com>
 <YMEI8pcXpt22gi3D@phenom.ffwll.local>
 <CAAxE2A6zwCHPaP5NnRETVe_BOsoVQK1T=h8gqRnUtP4sRFBkrw@mail.gmail.com>
 <eadcb7ee-f6fa-c8c9-a8c4-ac42571871cf@gmail.com>
In-Reply-To: <eadcb7ee-f6fa-c8c9-a8c4-ac42571871cf@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 14 Jun 2021 13:10:26 -0400
Message-ID: <CAAxE2A7vhWB6QbejJLLkfk5J8361DPtA9Dtxd9FWDzND8F_diA@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000026df8105c4bcf141"
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000026df8105c4bcf141
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The call to the hw scheduler has a limitation on the size of all parameters
combined. I think we can only pass a 32-bit sequence number and a ~16-bit
global (per-GPU) syncobj handle in one call and not much else.

The syncobj handle can be an element index in a global (per-GPU) syncobj
table and it's read only for all processes with the exception of the signal
command. Syncobjs can either have per VMID write access flags for the
signal command (slow), or any process can write to any syncobjs and only
rely on the kernel checking the write log (fast).

In any case, we can execute the memory write in the queue engine and only
use the hw scheduler for logging, which would be perfect.

Marek

On Thu, Jun 10, 2021 at 12:33 PM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Hi guys,
>
> maybe soften that a bit. Reading from the shared memory of the user fence
> is ok for everybody. What we need to take more care of is the writing sid=
e.
>
> So my current thinking is that we allow read only access, but writing a
> new sequence value needs to go through the scheduler/kernel.
>
> So when the CPU wants to signal a timeline fence it needs to call an
> IOCTL. When the GPU wants to signal the timeline fence it needs to hand
> that of to the hardware scheduler.
>
> If we lockup the kernel can check with the hardware who did the last writ=
e
> and what value was written.
>
> That together with an IOCTL to give out sequence number for implicit sync
> to applications should be sufficient for the kernel to track who is
> responsible if something bad happens.
>
> In other words when the hardware says that the shader wrote stuff like
> 0xdeadbeef 0x0 or 0xffffffff into memory we kill the process who did that=
.
>
> If the hardware says that seq - 1 was written fine, but seq is missing
> then the kernel blames whoever was supposed to write seq.
>
> Just pieping the write through a privileged instance should be fine to
> make sure that we don't run into issues.
>
> Christian.
>
> Am 10.06.21 um 17:59 schrieb Marek Ol=C5=A1=C3=A1k:
>
> Hi Daniel,
>
> We just talked about this whole topic internally and we came up to the
> conclusion that the hardware needs to understand sync object handles and
> have high-level wait and signal operations in the command stream. Sync
> objects will be backed by memory, but they won't be readable or writable =
by
> processes directly. The hardware will log all accesses to sync objects an=
d
> will send the log to the kernel periodically. The kernel will identify
> malicious behavior.
>
> Example of a hardware command stream:
> ...
> ImplicitSyncWait(syncObjHandle, sequenceNumber); // the sequence number i=
s
> assigned by the kernel
> Draw();
> ImplicitSyncSignalWhenDone(syncObjHandle);
> ...
>
> I'm afraid we have no other choice because of the TLB invalidation
> overhead.
>
> Marek
>
>
> On Wed, Jun 9, 2021 at 2:31 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
>> On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian K=C3=B6nig wrote:
>> > Am 09.06.21 um 15:19 schrieb Daniel Vetter:
>> > > [SNIP]
>> > > > Yeah, we call this the lightweight and the heavyweight tlb flush.
>> > > >
>> > > > The lighweight can be used when you are sure that you don't have
>> any of the
>> > > > PTEs currently in flight in the 3D/DMA engine and you just need to
>> > > > invalidate the TLB.
>> > > >
>> > > > The heavyweight must be used when you need to invalidate the TLB
>> *AND* make
>> > > > sure that no concurrently operation moves new stuff into the TLB.
>> > > >
>> > > > The problem is for this use case we have to use the heavyweight on=
e.
>> > > Just for my own curiosity: So the lightweight flush is only for
>> in-between
>> > > CS when you know access is idle? Or does that also not work if
>> userspace
>> > > has a CS on a dma engine going at the same time because the tlb aren=
't
>> > > isolated enough between engines?
>> >
>> > More or less correct, yes.
>> >
>> > The problem is a lightweight flush only invalidates the TLB, but doesn=
't
>> > take care of entries which have been handed out to the different
>> engines.
>> >
>> > In other words what can happen is the following:
>> >
>> > 1. Shader asks TLB to resolve address X.
>> > 2. TLB looks into its cache and can't find address X so it asks the
>> walker
>> > to resolve.
>> > 3. Walker comes back with result for address X and TLB puts that into
>> its
>> > cache and gives it to Shader.
>> > 4. Shader starts doing some operation using result for address X.
>> > 5. You send lightweight TLB invalidate and TLB throws away cached
>> values for
>> > address X.
>> > 6. Shader happily still uses whatever the TLB gave to it in step 3 to
>> > accesses address X
>> >
>> > See it like the shader has their own 1 entry L0 TLB cache which is not
>> > affected by the lightweight flush.
>> >
>> > The heavyweight flush on the other hand sends out a broadcast signal t=
o
>> > everybody and only comes back when we are sure that an address is not
>> in use
>> > any more.
>>
>> Ah makes sense. On intel the shaders only operate in VA, everything goes
>> around as explicit async messages to IO blocks. So we don't have this, t=
he
>> only difference in tlb flushes is between tlb flush in the IB and an mmi=
o
>> one which is independent for anything currently being executed on an
>> egine.
>> -Daniel
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>>
>
>

--00000000000026df8105c4bcf141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The call to the hw scheduler has a limitation on the =
size of all parameters combined. I think we can only pass a 32-bit sequence=
 number and a ~16-bit global (per-GPU) syncobj handle in one call and not m=
uch else.</div><div><br></div><div>The syncobj handle can be an element ind=
ex in a global (per-GPU) syncobj table and it&#39;s read only for all proce=
sses with the exception of the signal command. Syncobjs can either have per=
 VMID write access flags for the signal command (slow), or any process can =
write to any syncobjs and only rely on the kernel checking the write log (f=
ast).</div><div><br></div><div>In any case, we can execute the memory write=
 in the queue engine and only use the hw scheduler for logging, which would=
 be perfect.</div><div><br></div><div>Marek<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 10, 2021=
 at 12:33 PM Christian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumer=
ken@gmail.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    Hi guys,<br>
    <br>
    maybe soften that a bit. Reading from the shared memory of the user
    fence is ok for everybody. What we need to take more care of is the
    writing side.<br>
    <br>
    So my current thinking is that we allow read only access, but
    writing a new sequence value needs to go through the
    scheduler/kernel.<br>
    <br>
    So when the CPU wants to signal a timeline fence it needs to call an
    IOCTL. When the GPU wants to signal the timeline fence it needs to
    hand that of to the hardware scheduler.<br>
    <br>
    If we lockup the kernel can check with the hardware who did the last
    write and what value was written.<br>
    <br>
    That together with an IOCTL to give out sequence number for implicit
    sync to applications should be sufficient for the kernel to track
    who is responsible if something bad happens.<br>
    <br>
    In other words when the hardware says that the shader wrote stuff
    like 0xdeadbeef 0x0 or 0xffffffff into memory we kill the process
    who did that.<br>
    <br>
    If the hardware says that seq - 1 was written fine, but seq is
    missing then the kernel blames whoever was supposed to write seq.<br>
    <br>
    Just pieping the write through a privileged instance should be fine
    to make sure that we don&#39;t run into issues. <br>
    <br>
    Christian.<br>
    <br>
    <div>Am 10.06.21 um 17:59 schrieb Marek
      Ol=C5=A1=C3=A1k:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Hi Daniel,</div>
        <div><br>
        </div>
        <div>We just talked about this whole topic internally and we
          came up to the conclusion that the hardware needs to
          understand sync object handles and have high-level wait and
          signal operations in the command stream. Sync objects will be
          backed by memory, but they won&#39;t be readable or writable by
          processes directly. The hardware will log all accesses to sync
          objects and will send the log to the kernel periodically. The
          kernel will identify malicious behavior.<br>
        </div>
        <div><br>
        </div>
        <div>Example of a hardware command stream:</div>
        <div>...</div>
        <div>ImplicitSyncWait(syncObjHandle, sequenceNumber); // the
          sequence number is assigned by the kernel<br>
        </div>
        <div>Draw();</div>
        <div>ImplicitSyncSignalWhenDone(syncObjHandle);</div>
        <div>...</div>
        <div><br>
        </div>
        <div>I&#39;m afraid we have no other choice because of the TLB
          invalidation overhead.</div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
        <div><br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 9, 2021 at 2:31 P=
M
          Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_b=
lank">daniel@ffwll.ch</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian K=C3=B6nig wrote=
:<br>
          &gt; Am 09.06.21 um 15:19 schrieb Daniel Vetter:<br>
          &gt; &gt; [SNIP]<br>
          &gt; &gt; &gt; Yeah, we call this the lightweight and the
          heavyweight tlb flush.<br>
          &gt; &gt; &gt; <br>
          &gt; &gt; &gt; The lighweight can be used when you are sure
          that you don&#39;t have any of the<br>
          &gt; &gt; &gt; PTEs currently in flight in the 3D/DMA engine
          and you just need to<br>
          &gt; &gt; &gt; invalidate the TLB.<br>
          &gt; &gt; &gt; <br>
          &gt; &gt; &gt; The heavyweight must be used when you need to
          invalidate the TLB *AND* make<br>
          &gt; &gt; &gt; sure that no concurrently operation moves new
          stuff into the TLB.<br>
          &gt; &gt; &gt; <br>
          &gt; &gt; &gt; The problem is for this use case we have to use
          the heavyweight one.<br>
          &gt; &gt; Just for my own curiosity: So the lightweight flush
          is only for in-between<br>
          &gt; &gt; CS when you know access is idle? Or does that also
          not work if userspace<br>
          &gt; &gt; has a CS on a dma engine going at the same time
          because the tlb aren&#39;t<br>
          &gt; &gt; isolated enough between engines?<br>
          &gt; <br>
          &gt; More or less correct, yes.<br>
          &gt; <br>
          &gt; The problem is a lightweight flush only invalidates the
          TLB, but doesn&#39;t<br>
          &gt; take care of entries which have been handed out to the
          different engines.<br>
          &gt; <br>
          &gt; In other words what can happen is the following:<br>
          &gt; <br>
          &gt; 1. Shader asks TLB to resolve address X.<br>
          &gt; 2. TLB looks into its cache and can&#39;t find address X so
          it asks the walker<br>
          &gt; to resolve.<br>
          &gt; 3. Walker comes back with result for address X and TLB
          puts that into its<br>
          &gt; cache and gives it to Shader.<br>
          &gt; 4. Shader starts doing some operation using result for
          address X.<br>
          &gt; 5. You send lightweight TLB invalidate and TLB throws
          away cached values for<br>
          &gt; address X.<br>
          &gt; 6. Shader happily still uses whatever the TLB gave to it
          in step 3 to<br>
          &gt; accesses address X<br>
          &gt; <br>
          &gt; See it like the shader has their own 1 entry L0 TLB cache
          which is not<br>
          &gt; affected by the lightweight flush.<br>
          &gt; <br>
          &gt; The heavyweight flush on the other hand sends out a
          broadcast signal to<br>
          &gt; everybody and only comes back when we are sure that an
          address is not in use<br>
          &gt; any more.<br>
          <br>
          Ah makes sense. On intel the shaders only operate in VA,
          everything goes<br>
          around as explicit async messages to IO blocks. So we don&#39;t
          have this, the<br>
          only difference in tlb flushes is between tlb flush in the IB
          and an mmio<br>
          one which is independent for anything currently being executed
          on an<br>
          egine.<br>
          -Daniel<br>
          -- <br>
          Daniel Vetter<br>
          Software Engineer, Intel Corporation<br>
          <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_bl=
ank">http://blog.ffwll.ch</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--00000000000026df8105c4bcf141--
