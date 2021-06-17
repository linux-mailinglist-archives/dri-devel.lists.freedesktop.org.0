Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A813ABC4A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076AC6E1E9;
	Thu, 17 Jun 2021 19:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6196E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:04:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id m3so4097986wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uAfQ7c8HZ0u2RmNDOfmgwDmbkDzHvA4FjDseKGey9UI=;
 b=jk1yJIbSl9oNT4+ATxuC0XTLOwiSZiyk+ovGUQxW9GHalMCwXUzURsFYOMsX9n+5pR
 adgJSZ8Td7DW0Cbe5EIesDqeis10/O4Ph0SOOijhu6rApxRPr7oK+ZhzYcZnDazUpane
 cmbMlNvugnkxk6wk0emet1Typ83Hrk/D0DjQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uAfQ7c8HZ0u2RmNDOfmgwDmbkDzHvA4FjDseKGey9UI=;
 b=NwXRYhDJk8mKlj/1DtcN7yGSPteHfEO6nHs36RNfaGcWhI1f5ptMD3M3UnKjSxNUtP
 WTilmnkhIGb6aa/kV38Uy3dvH1d3lkyl/u9mOHZhcwJz4lJXVTA/JYn79tQh013FvFA8
 Nd01fkI7jyyMv6FmAHrz3/ra4ioM7mcoxhMT90cfJMzV21Po65QSxtcHCYO/OyqPtqAw
 r51z8as9FZN4KRiGv3r+wknPjgM4Ud0BCCiQxu8xTuek1iD9Pv9jBXyoXH9d3E9M3pTO
 2uokscsqXuhX6wsLCrJ4MZ+qu98GnkWP5bXY4loX5mYcxpNlgwdf33oXp5vykZC9mRBd
 KLiA==
X-Gm-Message-State: AOAM530kCA1BqyYRkN1AAFrBVtP7dCj2WRyiYvFRm+L1e3JhVpGQvVZE
 HilEuwsBo/6sdnOGiujnEKcKyQ==
X-Google-Smtp-Source: ABdhPJwyUd4JMfdEQXTTmTEkOru0DoaLcMIJPWx1CZEQ5GA7FtxoeCA6PEbKTT0ivogQ2dDNIGJBiw==
X-Received: by 2002:a05:600c:47c4:: with SMTP id
 l4mr6749417wmo.145.1623956652904; 
 Thu, 17 Jun 2021 12:04:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm5436299wmq.8.2021.06.17.12.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:04:12 -0700 (PDT)
Date: Thu, 17 Jun 2021 21:04:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
Message-ID: <YMucqjsBxKdg2u2B@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A4mAsHt6_s_Ou1a+DvLU-6eobdM32r17HQt5Lo5iTZ6BQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 02:28:06PM -0400, Marek Olšák wrote:
> The kernel will know who should touch the implicit-sync semaphore next, and
> at the same time, the copy of all write requests to the implicit-sync
> semaphore will be forwarded to the kernel for monitoring and bo_wait.
> 
> Syncobjs could either use the same monitored access as implicit sync or be
> completely unmonitored. We haven't decided yet.
> 
> Syncfiles could either use one of the above or wait for a syncobj to go
> idle before converting to a syncfile.

Hm this sounds all like you're planning to completely rewrap everything
... I'm assuming the plan is still that this is going to be largely
wrapped in dma_fence? Maybe with timeline objects being a bit more
optimized, but I'm not sure how much you can optimize without breaking the
interfaces.
-Daniel

> 
> Marek
> 
> 
> 
> On Thu, Jun 17, 2021 at 12:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Mon, Jun 14, 2021 at 07:13:00PM +0200, Christian König wrote:
> > > As long as we can figure out who touched to a certain sync object last
> > that
> > > would indeed work, yes.
> >
> > Don't you need to know who will touch it next, i.e. who is holding up your
> > fence? Or maybe I'm just again totally confused.
> > -Daniel
> >
> > >
> > > Christian.
> > >
> > > Am 14.06.21 um 19:10 schrieb Marek Olšák:
> > > > The call to the hw scheduler has a limitation on the size of all
> > > > parameters combined. I think we can only pass a 32-bit sequence number
> > > > and a ~16-bit global (per-GPU) syncobj handle in one call and not much
> > > > else.
> > > >
> > > > The syncobj handle can be an element index in a global (per-GPU)
> > syncobj
> > > > table and it's read only for all processes with the exception of the
> > > > signal command. Syncobjs can either have per VMID write access flags
> > for
> > > > the signal command (slow), or any process can write to any syncobjs and
> > > > only rely on the kernel checking the write log (fast).
> > > >
> > > > In any case, we can execute the memory write in the queue engine and
> > > > only use the hw scheduler for logging, which would be perfect.
> > > >
> > > > Marek
> > > >
> > > > On Thu, Jun 10, 2021 at 12:33 PM Christian König
> > > > <ckoenig.leichtzumerken@gmail.com
> > > > <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
> > > >
> > > >     Hi guys,
> > > >
> > > >     maybe soften that a bit. Reading from the shared memory of the
> > > >     user fence is ok for everybody. What we need to take more care of
> > > >     is the writing side.
> > > >
> > > >     So my current thinking is that we allow read only access, but
> > > >     writing a new sequence value needs to go through the
> > scheduler/kernel.
> > > >
> > > >     So when the CPU wants to signal a timeline fence it needs to call
> > > >     an IOCTL. When the GPU wants to signal the timeline fence it needs
> > > >     to hand that of to the hardware scheduler.
> > > >
> > > >     If we lockup the kernel can check with the hardware who did the
> > > >     last write and what value was written.
> > > >
> > > >     That together with an IOCTL to give out sequence number for
> > > >     implicit sync to applications should be sufficient for the kernel
> > > >     to track who is responsible if something bad happens.
> > > >
> > > >     In other words when the hardware says that the shader wrote stuff
> > > >     like 0xdeadbeef 0x0 or 0xffffffff into memory we kill the process
> > > >     who did that.
> > > >
> > > >     If the hardware says that seq - 1 was written fine, but seq is
> > > >     missing then the kernel blames whoever was supposed to write seq.
> > > >
> > > >     Just pieping the write through a privileged instance should be
> > > >     fine to make sure that we don't run into issues.
> > > >
> > > >     Christian.
> > > >
> > > >     Am 10.06.21 um 17:59 schrieb Marek Olšák:
> > > > >     Hi Daniel,
> > > > >
> > > > >     We just talked about this whole topic internally and we came up
> > > > >     to the conclusion that the hardware needs to understand sync
> > > > >     object handles and have high-level wait and signal operations in
> > > > >     the command stream. Sync objects will be backed by memory, but
> > > > >     they won't be readable or writable by processes directly. The
> > > > >     hardware will log all accesses to sync objects and will send the
> > > > >     log to the kernel periodically. The kernel will identify
> > > > >     malicious behavior.
> > > > >
> > > > >     Example of a hardware command stream:
> > > > >     ...
> > > > >     ImplicitSyncWait(syncObjHandle, sequenceNumber); // the sequence
> > > > >     number is assigned by the kernel
> > > > >     Draw();
> > > > >     ImplicitSyncSignalWhenDone(syncObjHandle);
> > > > >     ...
> > > > >
> > > > >     I'm afraid we have no other choice because of the TLB
> > > > >     invalidation overhead.
> > > > >
> > > > >     Marek
> > > > >
> > > > >
> > > > >     On Wed, Jun 9, 2021 at 2:31 PM Daniel Vetter <daniel@ffwll.ch
> > > > >     <mailto:daniel@ffwll.ch>> wrote:
> > > > >
> > > > >         On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian König
> > wrote:
> > > > >         > Am 09.06.21 um 15:19 schrieb Daniel Vetter:
> > > > >         > > [SNIP]
> > > > >         > > > Yeah, we call this the lightweight and the heavyweight
> > > > >         tlb flush.
> > > > >         > > >
> > > > >         > > > The lighweight can be used when you are sure that you
> > > > >         don't have any of the
> > > > >         > > > PTEs currently in flight in the 3D/DMA engine and you
> > > > >         just need to
> > > > >         > > > invalidate the TLB.
> > > > >         > > >
> > > > >         > > > The heavyweight must be used when you need to
> > > > >         invalidate the TLB *AND* make
> > > > >         > > > sure that no concurrently operation moves new stuff
> > > > >         into the TLB.
> > > > >         > > >
> > > > >         > > > The problem is for this use case we have to use the
> > > > >         heavyweight one.
> > > > >         > > Just for my own curiosity: So the lightweight flush is
> > > > >         only for in-between
> > > > >         > > CS when you know access is idle? Or does that also not
> > > > >         work if userspace
> > > > >         > > has a CS on a dma engine going at the same time because
> > > > >         the tlb aren't
> > > > >         > > isolated enough between engines?
> > > > >         >
> > > > >         > More or less correct, yes.
> > > > >         >
> > > > >         > The problem is a lightweight flush only invalidates the
> > > > >         TLB, but doesn't
> > > > >         > take care of entries which have been handed out to the
> > > > >         different engines.
> > > > >         >
> > > > >         > In other words what can happen is the following:
> > > > >         >
> > > > >         > 1. Shader asks TLB to resolve address X.
> > > > >         > 2. TLB looks into its cache and can't find address X so it
> > > > >         asks the walker
> > > > >         > to resolve.
> > > > >         > 3. Walker comes back with result for address X and TLB puts
> > > > >         that into its
> > > > >         > cache and gives it to Shader.
> > > > >         > 4. Shader starts doing some operation using result for
> > > > >         address X.
> > > > >         > 5. You send lightweight TLB invalidate and TLB throws away
> > > > >         cached values for
> > > > >         > address X.
> > > > >         > 6. Shader happily still uses whatever the TLB gave to it in
> > > > >         step 3 to
> > > > >         > accesses address X
> > > > >         >
> > > > >         > See it like the shader has their own 1 entry L0 TLB cache
> > > > >         which is not
> > > > >         > affected by the lightweight flush.
> > > > >         >
> > > > >         > The heavyweight flush on the other hand sends out a
> > > > >         broadcast signal to
> > > > >         > everybody and only comes back when we are sure that an
> > > > >         address is not in use
> > > > >         > any more.
> > > > >
> > > > >         Ah makes sense. On intel the shaders only operate in VA,
> > > > >         everything goes
> > > > >         around as explicit async messages to IO blocks. So we don't
> > > > >         have this, the
> > > > >         only difference in tlb flushes is between tlb flush in the IB
> > > > >         and an mmio
> > > > >         one which is independent for anything currently being
> > > > >         executed on an
> > > > >         egine.
> > > > >         -Daniel
> > > > >         --         Daniel Vetter
> > > > >         Software Engineer, Intel Corporation
> > > > >         http://blog.ffwll.ch <http://blog.ffwll.ch>
> > > > >
> > > >
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
