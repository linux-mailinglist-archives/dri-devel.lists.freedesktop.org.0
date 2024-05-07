Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827628BEDF4
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 22:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E420110F4F1;
	Tue,  7 May 2024 20:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R/CCQ6Lh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB9910F4F1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 20:19:29 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7928c5be3deso281777685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 13:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715113168; x=1715717968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=es6kOeqxgl2y45OhjVGBF/iXix85aXMFVxnvsRCztrQ=;
 b=R/CCQ6LhlNLcSW/4WlQDY+RtLNzVis4uRr6Dutqrg5t/z4qovps063Cldl8cGkxegt
 ROu7rOIM/jdorBvNd7b0vIlYXfUgNBM1wQt/7h+hmT7bcRqPfxjAxhxy8N0J3s0kqRik
 ERWXZ0tYO9452XnThDFnbfLMmfchrRW3vO+qUsy7zcI6g5d5SKP1uc1RO6LYGCUZGNRq
 J5Y47vubEc6gNtz3mS8b31oLdKbAv53yrNbEKq8FLd7hQCjO7K19U35bwTzxmvchb3q/
 QYk2Cca8uPG6FPfLnvV3FId3u2nmQ2GhFyNPDNPse+k3iaG+m1LwppeiyYARb/bejm0l
 q1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715113168; x=1715717968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=es6kOeqxgl2y45OhjVGBF/iXix85aXMFVxnvsRCztrQ=;
 b=JQE9ZZs82xTgccrydY3AnInA0IHJL8jz7rN7J+G6y7NO7ha8UubjvC4iwNBWYGhzeI
 2h9se+jUEwt5sNnx05nyf8EOyJuwYbAiUXih9XlnYwe8kBHQ9fSPDlN0udJgIhoVvOR0
 vU7i4JON0FQKgOQxcr9x4oPmmWFwPhSm/i/Oag93aYyNUU84c+LrG8Qnmn1O7xY7FouO
 6VL4wwOujGEPmcasp3zNL44HSmohqDhqehC1+3kAuXadQRNSkDU3Afnoro7qqMNufLvN
 1YkK6Au1pM6vTJcrJGWLJXpA5nGsx/ybILoBfjDWt0NZyQt6m8kurEiwcd1sBOsyS6Cc
 LxTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIKDwPX9P4g49YGNeOVEt2VOvJlnwh1oPYRMmlWPCim+i2ly23YEKDCCwzTYF99dGCbbqmW7U1827ui1Mpo1lgtENQXJ61sbFaNe13mBVw
X-Gm-Message-State: AOJu0YzZ5xwa/RQvd8ysuFM6/3x3bI0d/4RPapkD6oyo120Ptb/U73Ka
 l0/2rF8s5ytIGiJjYBZ3DjG+2/EaXxotAINx2mYlTCPSS5OXwF6AGymZlsO3DUpVVPAaRdauFKa
 dPgaYuw/OAnX51qTKqULRvKRWLnE=
X-Google-Smtp-Source: AGHT+IGjQYEmujwDqITllarXLP0VSc4Xwa06HzUYmRdr1deTa3vLo/f8zZvGJuZm3wydGhy1EMQyC+TW2MVkAkeMlMU=
X-Received: by 2002:a05:622a:2990:b0:43a:e248:12d3 with SMTP id
 d75a77b69052e-43dbec0da59mr11066911cf.14.1715113168226; Tue, 07 May 2024
 13:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
 <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
 <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
 <ZjovD5WaWjknd-qv@phenom.ffwll.local>
 <44b08793-cf44-4cbd-a3bb-583af351ab9e@amd.com>
 <CABdmKX3SpOk4BQU6i31r8jHc1f-o8sz7rXgtRyhTQZ4GJYHH=Q@mail.gmail.com>
In-Reply-To: <CABdmKX3SpOk4BQU6i31r8jHc1f-o8sz7rXgtRyhTQZ4GJYHH=Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 May 2024 13:19:15 -0700
Message-ID: <CAF6AEGvZTc10nfjEZHWXXYa5AVSNQCOgXsY4H05fcsFkTsdzFg@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Charan Teja Kalla <quic_charante@quicinc.com>,
 zhiguojiang <justinjiang@vivo.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 7, 2024 at 11:17=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Tue, May 7, 2024 at 7:04=E2=80=AFAM Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:
> >
> > Am 07.05.24 um 15:39 schrieb Daniel Vetter:
> > > On Tue, May 07, 2024 at 12:10:07PM +0200, Christian K=C3=B6nig wrote:
> > >> Am 06.05.24 um 21:04 schrieb T.J. Mercier:
> > >>> On Mon, May 6, 2024 at 2:30=E2=80=AFAM Charan Teja Kalla
> > >>> <quic_charante@quicinc.com> wrote:
> > >>>> Hi TJ,
> > >>>>
> > >>>> Seems I have got answers from [1], where it is agreed upon epoll()=
 is
> > >>>> the source of issue.
> > >>>>
> > >>>> Thanks a lot for the discussion.
> > >>>>
> > >>>> [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@goog=
le.com/
> > >>>>
> > >>>> Thanks
> > >>>> Charan
> > >>> Oh man, quite a set of threads on this over the weekend. Thanks for=
 the link.
> > >> Yeah and it also has some interesting side conclusion: We should pro=
bably
> > >> tell people to stop using DMA-buf with epoll.
> > >>
> > >> The background is that the mutex approach epoll uses to make files d=
isappear
> > >> from the interest list on close results in the fact that each file c=
an only
> > >> be part of a single epoll at a time.
> > >>
> > >> Now since DMA-buf is build around the idea that we share the buffer
> > >> representation as file between processes it means that only one proc=
ess at a
> > >> time can use epoll with each DMA-buf.
> > >>
> > >> So for example if a window manager uses epoll everything is fine. If=
 a
> > >> client is using epoll everything is fine as well. But if *both* use =
epoll at
> > >> the same time it won't work.
> > >>
> > >> This can lead to rather funny and hard to debug combinations of fail=
ures and
> > >> I think we need to document this limitation and explicitly point it =
out.
> > > Ok, I tested this with a small C program, and you're mixing things up=
.
> > > Here's what I got
> > >
> > > - You cannot add a file twice to the same epoll file/fd. So that part=
 is
> > >    correct, and also my understanding from reading the kernel code.
> > >
> > > - You can add the same file to two different epoll file instaces. Whi=
ch
> > >    means it's totally fine to use epoll on a dma_buf in different pro=
cesses
> > >    like both in the compositor and in clients.
> >
> > Ah! Than I misunderstood that comment in the discussion. Thanks for
> > clarifying that.
> >
> > >
> > > - Substantially more entertaining, you can nest epoll instances, and =
e.g.
> > >    add a 2nd epoll file as an event to the first one. That way you ca=
n add
> > >    the same file to both epoll fds, and so end up with the same file
> > >    essentially being added twice to the top-level epoll file. So even
> > >    within one application there's no real issue when e.g. different
> > >    userspace drivers all want to use epoll on the same fd, because yo=
u can
> > >    just throw in another level of epoll and it's fine again and you w=
on't
> > >    get an EEXISTS on EPOLL_CTL_ADD.
> > >
> > >    But I also don't think we have this issue right now anywhere, sinc=
e it's
> > >    kinda a general epoll issue that happens with any duplicated file.
> >
> > I actually have been telling people to (ab)use the epoll behavior to
> > check if two file descriptors point to the same underlying file when
> > KCMP isn't available.
> >
> > Some environments (Android?) disable KCMP because they see it as
> > security problem.
> >
> Didn't know about this so I checked. Our kernel has CONFIG_KCMP, but
> seccomp does look like it's blocking kcmp for apps.
> https://cs.android.com/android/platform/superproject/main/+/main:bionic/l=
ibc/SYSCALLS.TXT

Getting a bit off the original topic, but fwiw this is what CrOS did
for CONFIG_KCMP:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/=
3501193

Ie. allow the kcmp syscall, but block type =3D=3D KCMP_SYSVSEM, which was
the more specific thing that android wanted to block.

BR,
-R
