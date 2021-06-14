Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19533A6CD8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 19:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A286E088;
	Mon, 14 Jun 2021 17:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246746E051;
 Mon, 14 Jun 2021 17:13:04 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l1so17792564ejb.6;
 Mon, 14 Jun 2021 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=fyxfjCjKDWIqc12tfK8FYLke30AvfEYD34ONjlwtB+c=;
 b=bihOnxWCTpA80KJK0r0YhwOmkNZz5a57eK80dQLbVmWuXMGxGzUV+GaGe33X/oTG4X
 Zc18rJtmGTuj5PiLJO29YHJvxQaovpsvs0Vl5ARtKnqpjQ44sEFNCMT5S+rNZ5h4JVMp
 zd2CFyrgjhKYGu2PjXXdmi6xbK6xvt3BwjiPzKojtIAoRwHepWMcnQ30+czprmLcfntI
 Wc5IQnyIYgHZ0PAl8ObCv8rJzgVqMJCcvhXfqrcXWm9QSOgYLcVAlJiAtOFKgnHoI/on
 VXtF17Mv/eBduoElgwBJYPNhb3iiJfnXvNfVnuehWE54ceAvOPgxTH+XSGcHvtniSLLX
 hT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=fyxfjCjKDWIqc12tfK8FYLke30AvfEYD34ONjlwtB+c=;
 b=etFOlUMkWanpaok1Vo4ypzy9d0T5JAXEp5zYDRHHslaGjaojnIwGD5uzu0ztrrtPVe
 0DgVF0cxtUvDaDv1thtxInM44ppFinfCBxsJ0brKQJ7nmBIS5kH+dp4XnDmnaogTFlMq
 S/xWjx47AXZ+Zb7vop7jQBjLUGE+/v6UrE5zgmCogZMquaZHF9nzbHeC1e6VWK7INHqk
 G/eKxpigm4e07GijzjnD4FBDTA8AotwTYTDHQt9es8KAO60zT0ZeRaJOLxacNigoFFZ1
 d37nkboz1L8EmbWQFXCPTc8SSYndhvMNcXSREJNFpXUjGm0B89tmLtV1bL6RAZJBLY6E
 0PYA==
X-Gm-Message-State: AOAM533CI3u36zQJwZsbz1uIEvYWuCOuAk+tN23b7ZpmsVWLmImmZIKz
 A/wHYIq0+kjQV1+SallcTbzIhtfaOsE=
X-Google-Smtp-Source: ABdhPJzbZL4OwJZKg1bmswosLdKv3tF29MdBZ3r+nOLqSouZZRd1eEF2BOfRTuDbPw5TG7G934U7gQ==
X-Received: by 2002:a17:906:e2d3:: with SMTP id
 gr19mr15848567ejb.525.1623690782666; 
 Mon, 14 Jun 2021 10:13:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e8cf:b51d:4c59:9c81?
 ([2a02:908:1252:fb60:e8cf:b51d:4c59:9c81])
 by smtp.gmail.com with ESMTPSA id b14sm9352383edz.21.2021.06.14.10.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 10:13:01 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
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
 <CAAxE2A7vhWB6QbejJLLkfk5J8361DPtA9Dtxd9FWDzND8F_diA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ebeabd65-9d8e-d364-a084-62bcdd7aa439@gmail.com>
Date: Mon, 14 Jun 2021 19:13:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A7vhWB6QbejJLLkfk5J8361DPtA9Dtxd9FWDzND8F_diA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------EA5CCAFBA95FBA813D281B12"
Content-Language: en-US
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------EA5CCAFBA95FBA813D281B12
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

As long as we can figure out who touched to a certain sync object last 
that would indeed work, yes.

Christian.

Am 14.06.21 um 19:10 schrieb Marek Olšák:
> The call to the hw scheduler has a limitation on the size of all 
> parameters combined. I think we can only pass a 32-bit sequence number 
> and a ~16-bit global (per-GPU) syncobj handle in one call and not much 
> else.
>
> The syncobj handle can be an element index in a global (per-GPU) 
> syncobj table and it's read only for all processes with the exception 
> of the signal command. Syncobjs can either have per VMID write access 
> flags for the signal command (slow), or any process can write to any 
> syncobjs and only rely on the kernel checking the write log (fast).
>
> In any case, we can execute the memory write in the queue engine and 
> only use the hw scheduler for logging, which would be perfect.
>
> Marek
>
> On Thu, Jun 10, 2021 at 12:33 PM Christian König 
> <ckoenig.leichtzumerken@gmail.com 
> <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>
>     Hi guys,
>
>     maybe soften that a bit. Reading from the shared memory of the
>     user fence is ok for everybody. What we need to take more care of
>     is the writing side.
>
>     So my current thinking is that we allow read only access, but
>     writing a new sequence value needs to go through the scheduler/kernel.
>
>     So when the CPU wants to signal a timeline fence it needs to call
>     an IOCTL. When the GPU wants to signal the timeline fence it needs
>     to hand that of to the hardware scheduler.
>
>     If we lockup the kernel can check with the hardware who did the
>     last write and what value was written.
>
>     That together with an IOCTL to give out sequence number for
>     implicit sync to applications should be sufficient for the kernel
>     to track who is responsible if something bad happens.
>
>     In other words when the hardware says that the shader wrote stuff
>     like 0xdeadbeef 0x0 or 0xffffffff into memory we kill the process
>     who did that.
>
>     If the hardware says that seq - 1 was written fine, but seq is
>     missing then the kernel blames whoever was supposed to write seq.
>
>     Just pieping the write through a privileged instance should be
>     fine to make sure that we don't run into issues.
>
>     Christian.
>
>     Am 10.06.21 um 17:59 schrieb Marek Olšák:
>>     Hi Daniel,
>>
>>     We just talked about this whole topic internally and we came up
>>     to the conclusion that the hardware needs to understand sync
>>     object handles and have high-level wait and signal operations in
>>     the command stream. Sync objects will be backed by memory, but
>>     they won't be readable or writable by processes directly. The
>>     hardware will log all accesses to sync objects and will send the
>>     log to the kernel periodically. The kernel will identify
>>     malicious behavior.
>>
>>     Example of a hardware command stream:
>>     ...
>>     ImplicitSyncWait(syncObjHandle, sequenceNumber); // the sequence
>>     number is assigned by the kernel
>>     Draw();
>>     ImplicitSyncSignalWhenDone(syncObjHandle);
>>     ...
>>
>>     I'm afraid we have no other choice because of the TLB
>>     invalidation overhead.
>>
>>     Marek
>>
>>
>>     On Wed, Jun 9, 2021 at 2:31 PM Daniel Vetter <daniel@ffwll.ch
>>     <mailto:daniel@ffwll.ch>> wrote:
>>
>>         On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian König wrote:
>>         > Am 09.06.21 um 15:19 schrieb Daniel Vetter:
>>         > > [SNIP]
>>         > > > Yeah, we call this the lightweight and the heavyweight
>>         tlb flush.
>>         > > >
>>         > > > The lighweight can be used when you are sure that you
>>         don't have any of the
>>         > > > PTEs currently in flight in the 3D/DMA engine and you
>>         just need to
>>         > > > invalidate the TLB.
>>         > > >
>>         > > > The heavyweight must be used when you need to
>>         invalidate the TLB *AND* make
>>         > > > sure that no concurrently operation moves new stuff
>>         into the TLB.
>>         > > >
>>         > > > The problem is for this use case we have to use the
>>         heavyweight one.
>>         > > Just for my own curiosity: So the lightweight flush is
>>         only for in-between
>>         > > CS when you know access is idle? Or does that also not
>>         work if userspace
>>         > > has a CS on a dma engine going at the same time because
>>         the tlb aren't
>>         > > isolated enough between engines?
>>         >
>>         > More or less correct, yes.
>>         >
>>         > The problem is a lightweight flush only invalidates the
>>         TLB, but doesn't
>>         > take care of entries which have been handed out to the
>>         different engines.
>>         >
>>         > In other words what can happen is the following:
>>         >
>>         > 1. Shader asks TLB to resolve address X.
>>         > 2. TLB looks into its cache and can't find address X so it
>>         asks the walker
>>         > to resolve.
>>         > 3. Walker comes back with result for address X and TLB puts
>>         that into its
>>         > cache and gives it to Shader.
>>         > 4. Shader starts doing some operation using result for
>>         address X.
>>         > 5. You send lightweight TLB invalidate and TLB throws away
>>         cached values for
>>         > address X.
>>         > 6. Shader happily still uses whatever the TLB gave to it in
>>         step 3 to
>>         > accesses address X
>>         >
>>         > See it like the shader has their own 1 entry L0 TLB cache
>>         which is not
>>         > affected by the lightweight flush.
>>         >
>>         > The heavyweight flush on the other hand sends out a
>>         broadcast signal to
>>         > everybody and only comes back when we are sure that an
>>         address is not in use
>>         > any more.
>>
>>         Ah makes sense. On intel the shaders only operate in VA,
>>         everything goes
>>         around as explicit async messages to IO blocks. So we don't
>>         have this, the
>>         only difference in tlb flushes is between tlb flush in the IB
>>         and an mmio
>>         one which is independent for anything currently being
>>         executed on an
>>         egine.
>>         -Daniel
>>         -- 
>>         Daniel Vetter
>>         Software Engineer, Intel Corporation
>>         http://blog.ffwll.ch <http://blog.ffwll.ch>
>>
>


--------------EA5CCAFBA95FBA813D281B12
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    As long as we can figure out who touched to a certain sync object
    last that would indeed work, yes.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 14.06.21 um 19:10 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A7vhWB6QbejJLLkfk5J8361DPtA9Dtxd9FWDzND8F_diA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>The call to the hw scheduler has a limitation on the size
          of all parameters combined. I think we can only pass a 32-bit
          sequence number and a ~16-bit global (per-GPU) syncobj handle
          in one call and not much else.</div>
        <div><br>
        </div>
        <div>The syncobj handle can be an element index in a global
          (per-GPU) syncobj table and it's read only for all processes
          with the exception of the signal command. Syncobjs can either
          have per VMID write access flags for the signal command
          (slow), or any process can write to any syncobjs and only rely
          on the kernel checking the write log (fast).</div>
        <div><br>
        </div>
        <div>In any case, we can execute the memory write in the queue
          engine and only use the hw scheduler for logging, which would
          be perfect.</div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Jun 10, 2021 at 12:33
          PM Christian König &lt;<a
            href="mailto:ckoenig.leichtzumerken@gmail.com"
            target="_blank" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div> Hi guys,<br>
            <br>
            maybe soften that a bit. Reading from the shared memory of
            the user fence is ok for everybody. What we need to take
            more care of is the writing side.<br>
            <br>
            So my current thinking is that we allow read only access,
            but writing a new sequence value needs to go through the
            scheduler/kernel.<br>
            <br>
            So when the CPU wants to signal a timeline fence it needs to
            call an IOCTL. When the GPU wants to signal the timeline
            fence it needs to hand that of to the hardware scheduler.<br>
            <br>
            If we lockup the kernel can check with the hardware who did
            the last write and what value was written.<br>
            <br>
            That together with an IOCTL to give out sequence number for
            implicit sync to applications should be sufficient for the
            kernel to track who is responsible if something bad happens.<br>
            <br>
            In other words when the hardware says that the shader wrote
            stuff like 0xdeadbeef 0x0 or 0xffffffff into memory we kill
            the process who did that.<br>
            <br>
            If the hardware says that seq - 1 was written fine, but seq
            is missing then the kernel blames whoever was supposed to
            write seq.<br>
            <br>
            Just pieping the write through a privileged instance should
            be fine to make sure that we don't run into issues. <br>
            <br>
            Christian.<br>
            <br>
            <div>Am 10.06.21 um 17:59 schrieb Marek Olšák:<br>
            </div>
            <blockquote type="cite">
              <div dir="ltr">
                <div>Hi Daniel,</div>
                <div><br>
                </div>
                <div>We just talked about this whole topic internally
                  and we came up to the conclusion that the hardware
                  needs to understand sync object handles and have
                  high-level wait and signal operations in the command
                  stream. Sync objects will be backed by memory, but
                  they won't be readable or writable by processes
                  directly. The hardware will log all accesses to sync
                  objects and will send the log to the kernel
                  periodically. The kernel will identify malicious
                  behavior.<br>
                </div>
                <div><br>
                </div>
                <div>Example of a hardware command stream:</div>
                <div>...</div>
                <div>ImplicitSyncWait(syncObjHandle, sequenceNumber); //
                  the sequence number is assigned by the kernel<br>
                </div>
                <div>Draw();</div>
                <div>ImplicitSyncSignalWhenDone(syncObjHandle);</div>
                <div>...</div>
                <div><br>
                </div>
                <div>I'm afraid we have no other choice because of the
                  TLB invalidation overhead.</div>
                <div><br>
                </div>
                <div>Marek<br>
                </div>
                <div><br>
                </div>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Wed, Jun 9, 2021 at
                  2:31 PM Daniel Vetter &lt;<a
                    href="mailto:daniel@ffwll.ch" target="_blank"
                    moz-do-not-send="true">daniel@ffwll.ch</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">On Wed, Jun 09,
                  2021 at 03:58:26PM +0200, Christian König wrote:<br>
                  &gt; Am 09.06.21 um 15:19 schrieb Daniel Vetter:<br>
                  &gt; &gt; [SNIP]<br>
                  &gt; &gt; &gt; Yeah, we call this the lightweight and
                  the heavyweight tlb flush.<br>
                  &gt; &gt; &gt; <br>
                  &gt; &gt; &gt; The lighweight can be used when you are
                  sure that you don't have any of the<br>
                  &gt; &gt; &gt; PTEs currently in flight in the 3D/DMA
                  engine and you just need to<br>
                  &gt; &gt; &gt; invalidate the TLB.<br>
                  &gt; &gt; &gt; <br>
                  &gt; &gt; &gt; The heavyweight must be used when you
                  need to invalidate the TLB *AND* make<br>
                  &gt; &gt; &gt; sure that no concurrently operation
                  moves new stuff into the TLB.<br>
                  &gt; &gt; &gt; <br>
                  &gt; &gt; &gt; The problem is for this use case we
                  have to use the heavyweight one.<br>
                  &gt; &gt; Just for my own curiosity: So the
                  lightweight flush is only for in-between<br>
                  &gt; &gt; CS when you know access is idle? Or does
                  that also not work if userspace<br>
                  &gt; &gt; has a CS on a dma engine going at the same
                  time because the tlb aren't<br>
                  &gt; &gt; isolated enough between engines?<br>
                  &gt; <br>
                  &gt; More or less correct, yes.<br>
                  &gt; <br>
                  &gt; The problem is a lightweight flush only
                  invalidates the TLB, but doesn't<br>
                  &gt; take care of entries which have been handed out
                  to the different engines.<br>
                  &gt; <br>
                  &gt; In other words what can happen is the following:<br>
                  &gt; <br>
                  &gt; 1. Shader asks TLB to resolve address X.<br>
                  &gt; 2. TLB looks into its cache and can't find
                  address X so it asks the walker<br>
                  &gt; to resolve.<br>
                  &gt; 3. Walker comes back with result for address X
                  and TLB puts that into its<br>
                  &gt; cache and gives it to Shader.<br>
                  &gt; 4. Shader starts doing some operation using
                  result for address X.<br>
                  &gt; 5. You send lightweight TLB invalidate and TLB
                  throws away cached values for<br>
                  &gt; address X.<br>
                  &gt; 6. Shader happily still uses whatever the TLB
                  gave to it in step 3 to<br>
                  &gt; accesses address X<br>
                  &gt; <br>
                  &gt; See it like the shader has their own 1 entry L0
                  TLB cache which is not<br>
                  &gt; affected by the lightweight flush.<br>
                  &gt; <br>
                  &gt; The heavyweight flush on the other hand sends out
                  a broadcast signal to<br>
                  &gt; everybody and only comes back when we are sure
                  that an address is not in use<br>
                  &gt; any more.<br>
                  <br>
                  Ah makes sense. On intel the shaders only operate in
                  VA, everything goes<br>
                  around as explicit async messages to IO blocks. So we
                  don't have this, the<br>
                  only difference in tlb flushes is between tlb flush in
                  the IB and an mmio<br>
                  one which is independent for anything currently being
                  executed on an<br>
                  egine.<br>
                  -Daniel<br>
                  -- <br>
                  Daniel Vetter<br>
                  Software Engineer, Intel Corporation<br>
                  <a href="http://blog.ffwll.ch" rel="noreferrer"
                    target="_blank" moz-do-not-send="true">http://blog.ffwll.ch</a><br>
                </blockquote>
              </div>
            </blockquote>
            <br>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------EA5CCAFBA95FBA813D281B12--
