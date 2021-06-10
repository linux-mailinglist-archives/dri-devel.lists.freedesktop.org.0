Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA7D3A2FFD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 17:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B8B6ED7D;
	Thu, 10 Jun 2021 15:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0045C6ED7D;
 Thu, 10 Jun 2021 15:59:40 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id k5so3938377pjj.1;
 Thu, 10 Jun 2021 08:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5V9FxhzgFVA8Wrsw4ebRp82C6CexEEIPsx/NmzmzgFw=;
 b=kyuG0CbUq+YfmgGMb0UuuelzgI2dcCQ4i4MWLko1g5t23fk4BygxmeONAaVvN1Pyvn
 qZbMSwrqT6B9fbe/9sW7cgQYwJgUSNStL0aAQm213E40Kc7FO8msMARIzbIv1fxgLb6q
 sm/cMJT9/yB1oMbj2L7x3j89CPAXeuqfs6xiAdtZ9RiY/zXgxRHf/sNBpr0pFcCcZbex
 zrxj/kJDrVaZZ/Ghzk6fsYbYEBVcZJnu9G0NEU7g+52C6Ozokif2J7gCuUGIBIvFZv88
 rampCsgVn6o5czfvsHCVsWI5hW0g4S5b/3J1ov+o6KcNsqo/jSFvhY1Auz+8QHPfVmMh
 L8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5V9FxhzgFVA8Wrsw4ebRp82C6CexEEIPsx/NmzmzgFw=;
 b=Cz0Btpdm8LN6V0MQosLyVZWLd2Jv9i99NUuH/hkwO2hvmn33+6yzgRga8i6/CeIcEp
 D1K/EL1IY+uliLSRcRPY7tGWHiW58az76DGxZh6iGysnFnrEZDWrusbkAeiOk8/dDfHZ
 LNcTtl7Rg1LQvQ7ZlQEmjHJ7DLeJiln4VauxIpX1xSrrLKuYv1F8tnTRwyF/IyptXTor
 uSxgW2+NLeUsWWbtNtjxCqSCbuVMZQQolIoIzwNAvoFS1IxRuSpY3n94xH0xIeL/uyGQ
 j09YXv+ThnywYRpxyaFMltw3lvVG/kdl8W3C4CZGSs19qtOWwB52+NCW9ZSB7BePiMzt
 2ViQ==
X-Gm-Message-State: AOAM532SSSRhlZsSIF/ORXZPi4LAuDJY2P5b1hKIHuJ2ZMotFFtndo3b
 k1Fa04J30apjXS8JmcyaMJ4TS789p0kcH+gjTqY=
X-Google-Smtp-Source: ABdhPJx8dGDISD5S9kTT+wHthi1I6oL0jm+1GchCe0vtGFw9GxBKcZVkgc5KTewm7Lg85TgWxXjqY6la3HwnqS0H3xE=
X-Received: by 2002:a17:902:f24c:b029:10e:7d70:aadc with SMTP id
 j12-20020a170902f24cb029010e7d70aadcmr5607548plc.74.1623340780516; Thu, 10
 Jun 2021 08:59:40 -0700 (PDT)
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
In-Reply-To: <YMEI8pcXpt22gi3D@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 10 Jun 2021 11:59:04 -0400
Message-ID: <CAAxE2A6zwCHPaP5NnRETVe_BOsoVQK1T=h8gqRnUtP4sRFBkrw@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000927b5305c46b7af9"
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

--000000000000927b5305c46b7af9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

We just talked about this whole topic internally and we came up to the
conclusion that the hardware needs to understand sync object handles and
have high-level wait and signal operations in the command stream. Sync
objects will be backed by memory, but they won't be readable or writable by
processes directly. The hardware will log all accesses to sync objects and
will send the log to the kernel periodically. The kernel will identify
malicious behavior.

Example of a hardware command stream:
...
ImplicitSyncWait(syncObjHandle, sequenceNumber); // the sequence number is
assigned by the kernel
Draw();
ImplicitSyncSignalWhenDone(syncObjHandle);
...

I'm afraid we have no other choice because of the TLB invalidation overhead=
.

Marek


On Wed, Jun 9, 2021 at 2:31 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian K=C3=B6nig wrote:
> > Am 09.06.21 um 15:19 schrieb Daniel Vetter:
> > > [SNIP]
> > > > Yeah, we call this the lightweight and the heavyweight tlb flush.
> > > >
> > > > The lighweight can be used when you are sure that you don't have an=
y
> of the
> > > > PTEs currently in flight in the 3D/DMA engine and you just need to
> > > > invalidate the TLB.
> > > >
> > > > The heavyweight must be used when you need to invalidate the TLB
> *AND* make
> > > > sure that no concurrently operation moves new stuff into the TLB.
> > > >
> > > > The problem is for this use case we have to use the heavyweight one=
.
> > > Just for my own curiosity: So the lightweight flush is only for
> in-between
> > > CS when you know access is idle? Or does that also not work if
> userspace
> > > has a CS on a dma engine going at the same time because the tlb aren'=
t
> > > isolated enough between engines?
> >
> > More or less correct, yes.
> >
> > The problem is a lightweight flush only invalidates the TLB, but doesn'=
t
> > take care of entries which have been handed out to the different engine=
s.
> >
> > In other words what can happen is the following:
> >
> > 1. Shader asks TLB to resolve address X.
> > 2. TLB looks into its cache and can't find address X so it asks the
> walker
> > to resolve.
> > 3. Walker comes back with result for address X and TLB puts that into i=
ts
> > cache and gives it to Shader.
> > 4. Shader starts doing some operation using result for address X.
> > 5. You send lightweight TLB invalidate and TLB throws away cached value=
s
> for
> > address X.
> > 6. Shader happily still uses whatever the TLB gave to it in step 3 to
> > accesses address X
> >
> > See it like the shader has their own 1 entry L0 TLB cache which is not
> > affected by the lightweight flush.
> >
> > The heavyweight flush on the other hand sends out a broadcast signal to
> > everybody and only comes back when we are sure that an address is not i=
n
> use
> > any more.
>
> Ah makes sense. On intel the shaders only operate in VA, everything goes
> around as explicit async messages to IO blocks. So we don't have this, th=
e
> only difference in tlb flushes is between tlb flush in the IB and an mmio
> one which is independent for anything currently being executed on an
> egine.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000927b5305c46b7af9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Daniel,</div><div><br></div><div>We just talked ab=
out this whole topic internally and we came up to the conclusion that the h=
ardware needs to understand sync object handles and have high-level wait an=
d signal operations in the command stream. Sync objects will be backed by m=
emory, but they won&#39;t be readable or writable by processes directly. Th=
e hardware will log all accesses to sync objects and will send the log to t=
he kernel periodically. The kernel will identify malicious behavior.<br></d=
iv><div><br></div><div>Example of a hardware command stream:</div><div>...<=
/div><div>ImplicitSyncWait(syncObjHandle, sequenceNumber); // the sequence =
number is assigned by the kernel<br></div><div>Draw();</div><div>ImplicitSy=
ncSignalWhenDone(syncObjHandle);</div><div>...</div><div><br></div><div>I&#=
39;m afraid we have no other choice because of the TLB invalidation overhea=
d.</div><div><br></div><div>Marek<br></div><div><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 9, 20=
21 at 2:31 PM Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@f=
fwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian K=C3=B6nig wrote=
:<br>
&gt; Am 09.06.21 um 15:19 schrieb Daniel Vetter:<br>
&gt; &gt; [SNIP]<br>
&gt; &gt; &gt; Yeah, we call this the lightweight and the heavyweight tlb f=
lush.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The lighweight can be used when you are sure that you don&#3=
9;t have any of the<br>
&gt; &gt; &gt; PTEs currently in flight in the 3D/DMA engine and you just n=
eed to<br>
&gt; &gt; &gt; invalidate the TLB.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The heavyweight must be used when you need to invalidate the=
 TLB *AND* make<br>
&gt; &gt; &gt; sure that no concurrently operation moves new stuff into the=
 TLB.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The problem is for this use case we have to use the heavywei=
ght one.<br>
&gt; &gt; Just for my own curiosity: So the lightweight flush is only for i=
n-between<br>
&gt; &gt; CS when you know access is idle? Or does that also not work if us=
erspace<br>
&gt; &gt; has a CS on a dma engine going at the same time because the tlb a=
ren&#39;t<br>
&gt; &gt; isolated enough between engines?<br>
&gt; <br>
&gt; More or less correct, yes.<br>
&gt; <br>
&gt; The problem is a lightweight flush only invalidates the TLB, but doesn=
&#39;t<br>
&gt; take care of entries which have been handed out to the different engin=
es.<br>
&gt; <br>
&gt; In other words what can happen is the following:<br>
&gt; <br>
&gt; 1. Shader asks TLB to resolve address X.<br>
&gt; 2. TLB looks into its cache and can&#39;t find address X so it asks th=
e walker<br>
&gt; to resolve.<br>
&gt; 3. Walker comes back with result for address X and TLB puts that into =
its<br>
&gt; cache and gives it to Shader.<br>
&gt; 4. Shader starts doing some operation using result for address X.<br>
&gt; 5. You send lightweight TLB invalidate and TLB throws away cached valu=
es for<br>
&gt; address X.<br>
&gt; 6. Shader happily still uses whatever the TLB gave to it in step 3 to<=
br>
&gt; accesses address X<br>
&gt; <br>
&gt; See it like the shader has their own 1 entry L0 TLB cache which is not=
<br>
&gt; affected by the lightweight flush.<br>
&gt; <br>
&gt; The heavyweight flush on the other hand sends out a broadcast signal t=
o<br>
&gt; everybody and only comes back when we are sure that an address is not =
in use<br>
&gt; any more.<br>
<br>
Ah makes sense. On intel the shaders only operate in VA, everything goes<br=
>
around as explicit async messages to IO blocks. So we don&#39;t have this, =
the<br>
only difference in tlb flushes is between tlb flush in the IB and an mmio<b=
r>
one which is independent for anything currently being executed on an<br>
egine.<br>
-Daniel<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--000000000000927b5305c46b7af9--
