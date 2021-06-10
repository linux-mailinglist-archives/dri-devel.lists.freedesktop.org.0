Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1823A30BA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327276E167;
	Thu, 10 Jun 2021 16:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4216688007;
 Thu, 10 Jun 2021 16:33:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id m3so1310012wms.4;
 Thu, 10 Jun 2021 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=pkzfPTfQHHN+SUxFVAv7BbBoNtVBMETtewFTRNl0qFQ=;
 b=efUoQf5krRdWgvelN4w0/LIsG+8DDfTB+YNzTwXrlJixrcSIQIAx1VxzgvjcEiyick
 faF/FiravGh6czpuOiMiNnpcBb37FF/cWkv9oSJgIcKcypPGAze7uCQc11BVWGCpScqQ
 pxmuqo3c4ciMkSyzAsdePRIZwSntVzuXjCxPIGFFlFHHr8kQyVBLXZPV+qaZKzcWxtDU
 gva/57BtU6b/DgxhztFu2fDIYPrlkAk2IDkH3otFHgmO2FllqT/mzCV/sMDMeeuQBtIE
 +ztOI9sYwlVci0PX4ZCXmYUCPPNkCkdwzfHIjw6awSmX5ipYhPPodCx03YhXUbvct3Yz
 zkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=pkzfPTfQHHN+SUxFVAv7BbBoNtVBMETtewFTRNl0qFQ=;
 b=sbB4XocjDxEj3G7XFuBzpx1uQxWDHQX6nJSFZZZLhAltAeVUQOJguJW1ucNKnBjcM6
 G4EZsucW11R29X8DoJmvxFhVtC1sqrgz7e6pRQerJOzBIBRFdPXAxlEZflKzgODczYoa
 wIG6a84+oDRBVj3uMv8/zd4Ymjf2sIO9Yt9+2/70szcckypRUablOvAcXPX0IUTPIb+e
 FozZGWPInybipv8HUOSVVosBvB8cQ9qZbrxfq6flqFt2Ha853W1U8JMI1ILjgwF4ofKB
 S15j7U2XKRZV9uTILJ6fcPJt9L4UhbM5KePFMPRgFk7VGHk1UOrpX9BkuCaLX5j5vBUr
 DBUA==
X-Gm-Message-State: AOAM533mLeLGZsKmVecfka3Ng6y6EuBANLjd9+C6rcQS/904iYBSCEGL
 A5NZhp5jN0bjA9UZMJvZYbaSZqbh0LQ=
X-Google-Smtp-Source: ABdhPJx8Q9XxMinQC2Ko+DMJ8YdFtydFwCje5DOnBPbP+Xeh7QjOPCw4dQmyYWm8/BYCfOGTKTnbBw==
X-Received: by 2002:a1c:9ac5:: with SMTP id c188mr15470102wme.17.1623342800880; 
 Thu, 10 Jun 2021 09:33:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e?
 ([2a02:908:1252:fb60:c285:5f9a:99f5:633e])
 by smtp.gmail.com with ESMTPSA id v17sm4894550wrp.36.2021.06.10.09.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 09:33:20 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <eadcb7ee-f6fa-c8c9-a8c4-ac42571871cf@gmail.com>
Date: Thu, 10 Jun 2021 18:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAxE2A6zwCHPaP5NnRETVe_BOsoVQK1T=h8gqRnUtP4sRFBkrw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------1B1C6A13BBC79B84EAA893AD"
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------1B1C6A13BBC79B84EAA893AD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi guys,

maybe soften that a bit. Reading from the shared memory of the user 
fence is ok for everybody. What we need to take more care of is the 
writing side.

So my current thinking is that we allow read only access, but writing a 
new sequence value needs to go through the scheduler/kernel.

So when the CPU wants to signal a timeline fence it needs to call an 
IOCTL. When the GPU wants to signal the timeline fence it needs to hand 
that of to the hardware scheduler.

If we lockup the kernel can check with the hardware who did the last 
write and what value was written.

That together with an IOCTL to give out sequence number for implicit 
sync to applications should be sufficient for the kernel to track who is 
responsible if something bad happens.

In other words when the hardware says that the shader wrote stuff like 
0xdeadbeef 0x0 or 0xffffffff into memory we kill the process who did that.

If the hardware says that seq - 1 was written fine, but seq is missing 
then the kernel blames whoever was supposed to write seq.

Just pieping the write through a privileged instance should be fine to 
make sure that we don't run into issues.

Christian.

Am 10.06.21 um 17:59 schrieb Marek Olšák:
> Hi Daniel,
>
> We just talked about this whole topic internally and we came up to the 
> conclusion that the hardware needs to understand sync object handles 
> and have high-level wait and signal operations in the command stream. 
> Sync objects will be backed by memory, but they won't be readable or 
> writable by processes directly. The hardware will log all accesses to 
> sync objects and will send the log to the kernel periodically. The 
> kernel will identify malicious behavior.
>
> Example of a hardware command stream:
> ...
> ImplicitSyncWait(syncObjHandle, sequenceNumber); // the sequence 
> number is assigned by the kernel
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
> On Wed, Jun 9, 2021 at 2:31 PM Daniel Vetter <daniel@ffwll.ch 
> <mailto:daniel@ffwll.ch>> wrote:
>
>     On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian König wrote:
>     > Am 09.06.21 um 15:19 schrieb Daniel Vetter:
>     > > [SNIP]
>     > > > Yeah, we call this the lightweight and the heavyweight tlb
>     flush.
>     > > >
>     > > > The lighweight can be used when you are sure that you don't
>     have any of the
>     > > > PTEs currently in flight in the 3D/DMA engine and you just
>     need to
>     > > > invalidate the TLB.
>     > > >
>     > > > The heavyweight must be used when you need to invalidate the
>     TLB *AND* make
>     > > > sure that no concurrently operation moves new stuff into the
>     TLB.
>     > > >
>     > > > The problem is for this use case we have to use the
>     heavyweight one.
>     > > Just for my own curiosity: So the lightweight flush is only
>     for in-between
>     > > CS when you know access is idle? Or does that also not work if
>     userspace
>     > > has a CS on a dma engine going at the same time because the
>     tlb aren't
>     > > isolated enough between engines?
>     >
>     > More or less correct, yes.
>     >
>     > The problem is a lightweight flush only invalidates the TLB, but
>     doesn't
>     > take care of entries which have been handed out to the different
>     engines.
>     >
>     > In other words what can happen is the following:
>     >
>     > 1. Shader asks TLB to resolve address X.
>     > 2. TLB looks into its cache and can't find address X so it asks
>     the walker
>     > to resolve.
>     > 3. Walker comes back with result for address X and TLB puts that
>     into its
>     > cache and gives it to Shader.
>     > 4. Shader starts doing some operation using result for address X.
>     > 5. You send lightweight TLB invalidate and TLB throws away
>     cached values for
>     > address X.
>     > 6. Shader happily still uses whatever the TLB gave to it in step
>     3 to
>     > accesses address X
>     >
>     > See it like the shader has their own 1 entry L0 TLB cache which
>     is not
>     > affected by the lightweight flush.
>     >
>     > The heavyweight flush on the other hand sends out a broadcast
>     signal to
>     > everybody and only comes back when we are sure that an address
>     is not in use
>     > any more.
>
>     Ah makes sense. On intel the shaders only operate in VA,
>     everything goes
>     around as explicit async messages to IO blocks. So we don't have
>     this, the
>     only difference in tlb flushes is between tlb flush in the IB and
>     an mmio
>     one which is independent for anything currently being executed on an
>     egine.
>     -Daniel
>     -- 
>     Daniel Vetter
>     Software Engineer, Intel Corporation
>     http://blog.ffwll.ch <http://blog.ffwll.ch>
>


--------------1B1C6A13BBC79B84EAA893AD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
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
    to make sure that we don't run into issues. <br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 10.06.21 um 17:59 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A6zwCHPaP5NnRETVe_BOsoVQK1T=h8gqRnUtP4sRFBkrw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Hi Daniel,</div>
        <div><br>
        </div>
        <div>We just talked about this whole topic internally and we
          came up to the conclusion that the hardware needs to
          understand sync object handles and have high-level wait and
          signal operations in the command stream. Sync objects will be
          backed by memory, but they won't be readable or writable by
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
        <div>I'm afraid we have no other choice because of the TLB
          invalidation overhead.</div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
        <div><br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Jun 9, 2021 at 2:31 PM
          Daniel Vetter &lt;<a href="mailto:daniel@ffwll.ch"
            moz-do-not-send="true">daniel@ffwll.ch</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian König wrote:<br>
          &gt; Am 09.06.21 um 15:19 schrieb Daniel Vetter:<br>
          &gt; &gt; [SNIP]<br>
          &gt; &gt; &gt; Yeah, we call this the lightweight and the
          heavyweight tlb flush.<br>
          &gt; &gt; &gt; <br>
          &gt; &gt; &gt; The lighweight can be used when you are sure
          that you don't have any of the<br>
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
          because the tlb aren't<br>
          &gt; &gt; isolated enough between engines?<br>
          &gt; <br>
          &gt; More or less correct, yes.<br>
          &gt; <br>
          &gt; The problem is a lightweight flush only invalidates the
          TLB, but doesn't<br>
          &gt; take care of entries which have been handed out to the
          different engines.<br>
          &gt; <br>
          &gt; In other words what can happen is the following:<br>
          &gt; <br>
          &gt; 1. Shader asks TLB to resolve address X.<br>
          &gt; 2. TLB looks into its cache and can't find address X so
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
          around as explicit async messages to IO blocks. So we don't
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
          <a href="http://blog.ffwll.ch" rel="noreferrer"
            target="_blank" moz-do-not-send="true">http://blog.ffwll.ch</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------1B1C6A13BBC79B84EAA893AD--
