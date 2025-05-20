Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4255CABDFF9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF0A10E011;
	Tue, 20 May 2025 16:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GZMOJ1kd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C3210E011;
 Tue, 20 May 2025 16:07:18 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8f8so559037139f.1; 
 Tue, 20 May 2025 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747757238; x=1748362038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIlNhHqv93GvQWrqGB3ZPQbb3QiLFh5pTwSkFYPcNvg=;
 b=GZMOJ1kdF6ETlWZMba42S/KqGO8cnCsMkEpXBF4Tf0UAXQQ4IyOLVsVvyvK+rNs9rm
 MkJ1Ea592U4SgAqZOaPEhOUl1WKOfIaviuxe1Z59i+nETrQdZugh/dMx7n4FZiPUCzeZ
 MN4QGj+VnJ8lVM5QC51/0MBEnFohKS1xiHPH9+qkOhlnMNdmpCV/vvA4HJluvMgaYPNZ
 yI2NTH9JkFtZlxXenTU5TmoLbnXJxEByCe5SWSY/vthqfaPvPhDznO+X2LyqsU1tNBxC
 +MZ9+tpcCUxxPHcBaniRnzyNdHM+B4DHyRElVvUgnKBapIq5+mU1NTh1+za4396rSQBM
 SJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747757238; x=1748362038;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lIlNhHqv93GvQWrqGB3ZPQbb3QiLFh5pTwSkFYPcNvg=;
 b=O7zjBH2qho1TLUTT2PqPYWTEsuYRBgbS+XHlHUPVSUtxT8q6QuDD7qxIqniMubs3/A
 ZGNtJvUaaArUwhFGA2qJfu7M1RnyaflX2BvdWRLvsV4GaMaIQBU7jG3HPC9ZYFZ1E766
 0FuBRrrnk12sSfM6LLfahsdwey2CU6lLEp/Hv2zyf3II8HbvoM1QT4C5OHnvrPQg9UMW
 z6xWT3FXAsm1ToF7nm+zTVL7Kdpl01GgzoXuiSMSoYzJvdILSDd+WD1Fdd622TIr0C4B
 u7Yy1xSqWjrj/9/Fxu/QlbYyUW18QuZ1f3VpKdPHeJf3yKYc8PRJCyKrVi2kRrncEF7/
 8fhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkSBf/ZF8mCIVCL6dVxATsQ2rEkirRZawesJYrx8DKSvSpA6dzEMu4yWEx+FmiwTEy3yFQax0hMlM=@lists.freedesktop.org,
 AJvYcCWxgjENP1BZUtM5F8RPwWBpY/Om3DGXhF6/hrQNdEQ0iBWesIu7wiS7p2A1cyE3Rdxji/c3za03ASDG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRPI6qE40PcF+uIoZtqjfodR6awT6IhwXm8WoX+HFx1MtRjJDC
 v+YIKYMBbUgf6iZ9YvylhrhDWzxLB1PBkGZGwXgPNQbbx8Q8zZhY8Kf4Dr++4dPIjjeG8AjoA+w
 19tWn0PmOnvtE4WxZA5OyIfVViGlhxsQ=
X-Gm-Gg: ASbGncsdG+8s5fUPaluNapwFGlHEgW25LGgIJabnpyNACdt8IdW4QsI6oRcgTyq7y9o
 T+ZS+xyAaP3gS0so2Sw0MGo1BB+j/MLFFgc9kKw/m4o10d+5PbwO1xcJzdFi012DLpGv0zLxnA0
 rHVoqYKJiaQUtqQ95V9J2idsJJGifkf4orevpUJxdmvjDxtPXvNqPJcBJ2N6EiMlA=
X-Google-Smtp-Source: AGHT+IFKjqLjdxKN137jXayMzSnHUHC3u3SlHWSxPDUnqzAx/6aHZ9mgDTFP7BV1sTPkWNww7XgabgYxTfCrrozjj6s=
X-Received: by 2002:a05:6602:4186:b0:85c:c7f9:9a1c with SMTP id
 ca18e2360f4ac-86a23283c78mr2385708639f.13.1747757237853; Tue, 20 May 2025
 09:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
In-Reply-To: <aCwqAGLLCC2ZLSBK@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 09:07:05 -0700
X-Gm-Features: AX0GCFuJB8HyZPWl9Jg_jf4wMyFY6rVV8-Xlv-hqm4CZrVysg_4nnA4WGO4qoKc
Message-ID: <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 phasta@kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
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

On Tue, May 20, 2025 at 12:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 12:56:38PM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 11:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > >
> > > On Thu, May 15, 2025 at 10:40:15AM -0700, Rob Clark wrote:
> > > > On Thu, May 15, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > >
> > > > > (Cc: Boris)
> > > > >
> > > > > On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> > > > > > For some context, other drivers have the concept of a "synchron=
ous"
> > > > > > VM_BIND ioctl which completes immediately, and drivers implemen=
t it by
> > > > > > waiting for the whole thing to finish before returning.
> > > > >
> > > > > Nouveau implements sync by issuing a normal async VM_BIND and sub=
sequently
> > > > > waits for the out-fence synchronously.
> > > >
> > > > As Connor mentioned, we'd prefer it to be async rather than blockin=
g,
> > > > in normal cases, otherwise with drm native context for using native
> > > > UMD in guest VM, you'd be blocking the single host/VMM virglrender
> > > > thread.
> > > >
> > > > The key is we want to keep it async in the normal cases, and not ha=
ve
> > > > weird edge case CTS tests blow up from being _too_ async ;-)
> > >
> > > I really wonder why they don't blow up in Nouveau, which also support=
 full
> > > asynchronous VM_BIND. Mind sharing which tests blow up? :)
> >
> > Maybe it was dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buff=
er_size_2_24,
>
> The test above is part of the smoke testing I do for nouveau, but I haven=
't seen
> such issues yet for nouveau.

nouveau is probably not using async binds for everything?  Or maybe
I'm just pointing to the wrong test.

> > but I might be mixing that up, I'd have to back out this patch and see
> > where things blow up, which would take many hours.
>
> Well, you said that you never had this issue with "real" workloads, but o=
nly
> with VK CTS, so I really think we should know what we are trying to fix h=
ere.
>
> We can't just add new generic infrastructure without reasonable and *well
> understood* justification.

What is not well understood about this?  We need to pre-allocate
memory that we likely don't need for pagetables.

In the worst case, a large # of async PAGE_SIZE binds, you end up
needing to pre-allocate 3 pgtable pages (4 lvl pgtable) per one page
of mapping.  Queue up enough of those and you can explode your memory
usage.

> > There definitely was one where I was seeing >5k VM_BIND jobs pile up,
> > so absolutely throttling like this is needed.
>
> I still don't understand why the kernel must throttle this? If userspace =
uses
> async VM_BIND, it obviously can't spam the kernel infinitely without runn=
ing
> into an OOM case.

It is a valid question about whether the kernel or userspace should be
the one to do the throttling.

I went for doing it in the kernel because the kernel has better
knowledge of how much it needs to pre-allocate.

(There is also the side point, that this pre-allocated memory is not
charged to the calling process from a PoV of memory accounting.  So
with that in mind it seems like a good idea for the kernel to throttle
memory usage.)

> But let's assume we agree that we want to avoid that userspace can ever O=
OM itself
> through async VM_BIND, then the proposed solution seems wrong:
>
> Do we really want the driver developer to set an arbitrary boundary of a =
number
> of jobs that can be submitted before *async* VM_BIND blocks and becomes
> semi-sync?
>
> How do we choose this number of jobs? A very small number to be safe, whi=
ch
> scales badly on powerful machines? A large number that scales well on pow=
erful
> machines, but OOMs on weaker ones?

The way I am using it in msm, the credit amount and limit are in units
of pre-allocated pages in-flight.  I set the enqueue_credit_limit to
1024 pages, once there are jobs queued up exceeding that limit, they
start blocking.

The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in flight.

> I really think, this isn't the correct solution, but more a workaround.
>
> > Part of the VM_BIND for msm series adds some tracepoints for amount of
> > memory preallocated vs used for each job.  That plus scheduler
> > tracepoints should let you see how much memory is tied up in
> > prealloc'd pgtables.  You might not be noticing only because you are
> > running on a big desktop with lots of RAM ;-)
> >
> > > > > > But this
> > > > > > doesn't work for native context, where everything has to be
> > > > > > asynchronous, so we're trying a new approach where we instead s=
ubmit
> > > > > > an asynchronous bind for "normal" (non-sparse/driver internal)
> > > > > > allocations and only attach its out-fence to the in-fence of
> > > > > > subsequent submits to other queues.
> > > > >
> > > > > This is what nouveau does and I think other drivers like Xe and p=
anthor do this
> > > > > as well.
> > > >
> > > > No one has added native context support for these drivers yet
> > >
> > > Huh? What exactly do you mean with "native context" then?
> >
> > It is a way to use native usermode driver in a guest VM, by remoting
> > at the UAPI level, as opposed to the vk or gl API level.  You can
> > generally get equal to native performance, but the guest/host boundary
> > strongly encourages asynchronous to hide the guest->host latency.
>
> For the context we're discussing this isn't different to other drivers su=
pporing
> async VM_BIND utilizing it from the host, rather than from a guest.
>
> So, my original statement about nouveau, Xe, panthor doing the same thing
> without running into trouble should be valid.

Probably the difference is that we don't do any _synchronous_ binds.
And that is partially motivated by the virtual machine case.

BR,
-R
