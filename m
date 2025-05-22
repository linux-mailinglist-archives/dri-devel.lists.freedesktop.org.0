Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E626AAC0EA4
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32D210E9DB;
	Thu, 22 May 2025 14:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e14xcmIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583A610EE0C;
 Thu, 22 May 2025 14:47:30 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3db6ddcef4eso69835735ab.2; 
 Thu, 22 May 2025 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747925249; x=1748530049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PPbDH3f6x3vtoaDskORYKv70NDHQV/hQjQjyBt3PCHg=;
 b=e14xcmIwUzl1MwY6W9r6JtcIWt/wcSRSkb+mo4TlbKFQYxPVXf9BsqAGvs+krfqcQ2
 xjVJ93D9CbwWXD0obi7bPyZ+nSP74BYaoRsuZXpIi5B4XgAnu1LJptI8POG5KWz8s+WW
 Y7aV8RVaZ6QhYjdZtQZtEMME71N2i/KPh1ohgbLj26p9bk8zwJ1Li++Y8G3no5pkMU0z
 GFC1MdpItINB58fH8/R3HNpxOp/IlqOH/QMtQpFRna1LEKBZBdyRsLB96MJ543ussutN
 jswR975zsdxeHvV5JCXEYWPLJy7udZkxo8m+acislJBkLHxhR6J/UApwTHeiyxjF2iOX
 zt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747925249; x=1748530049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPbDH3f6x3vtoaDskORYKv70NDHQV/hQjQjyBt3PCHg=;
 b=XRy0urgmlzjj8HmOqXAY8KpfGCaXRNQ42ja+54bcBBjcOBirJNazRKPzK8e5gwHwp1
 Hu1ii5IeTLfPShwvBSJntfuX/nIaafD5P4nDhiFkJt+t5HMXeRp7FTEjp4013r53zFpU
 csvPZJuSO9ETZFXAYUwV9rxXRqz9aQKa6CvrH+ojwuA5hdPJQ09l0+BGFdBj3lchI99O
 Luc3z4OrN7EBJ2V8CVZVYkqHJS61MF7Xc1xW8TzeKrVwufhZmvT4JsUWndw6daaxh+wR
 p1HLKLL93cMIM9RAJ7n0awyrohepTppIhmF4xWXdN0L4o/t+TXMjEB17pb8MEFyrC4Zy
 292g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0LgevhZqYsDhlXve3Hd3/6n0MOAogl4gXUk34mAZ4y2hn1bcW9tqToPZT0znloBBPql/tkDbOLVAt@lists.freedesktop.org,
 AJvYcCVYksEIk1GWPvgNP4VZFQLQptaU1wgtG6uQ/UEgUhX4cPfYzG7LhLsHelcz/s1s4jKot1cvNV6EP3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWkIWNkf+BPQ6kZqxrIpfNJbzlJr8LtHpMyPzn3n1hbj+TssZE
 1h7akpuX7clD6Y3ElYmoUMD46n6tqaZkijQxrQSP+Kmtg2gUZzFX57BR2gi72YZka62CO9dBF+P
 TLv+VL96xE/Ral1ZkLb/oJbqxEokd/80=
X-Gm-Gg: ASbGncsC9FFeRljlo8L4SVWi3hj2wYUDS4Xd64nebL1sD9A+YMHY80fAa6p4AJfqp9a
 7Yea7n/TtVtmbYmNamEa/pSZftfIq6F2cbRsmqFmJhSVEN1a0OetRFFvdmbfSrpCN1F9Yky6jpa
 hcHzgUt+QaYGg6hYRO5Yqc3EWiAA7hmvnIxCch/IzxgTt/2NNwyhoNxsnLFPtxOYQ=
X-Google-Smtp-Source: AGHT+IEarmDYe4t8X7TSNIy1n4puTKWpnIYwdtvdbi84YGnpxT6zLK1A0SzYuTIp9sqHj9wsknEjHcHutbq3FYUqlv4=
X-Received: by 2002:a05:6e02:2501:b0:3dc:8423:543e with SMTP id
 e9e14a558f8ab-3dc842356c2mr71268665ab.17.1747925249377; Thu, 22 May 2025
 07:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
 <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
 <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
 <aC8Dzgufa9E2MD6t@pollux>
In-Reply-To: <aC8Dzgufa9E2MD6t@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 May 2025 07:47:17 -0700
X-Gm-Features: AX0GCFtxJW9BGpIGgy7w8A5mMXB_NlWAv7wuxAT1kInixMl7peXcsXdNONmduSE
Message-ID: <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>
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

On Thu, May 22, 2025 at 4:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 10:22:54AM -0700, Rob Clark wrote:
> > On Tue, May 20, 2025 at 9:54=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > > On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > > > On Tue, May 20, 2025 at 12:06=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > > But let's assume we agree that we want to avoid that userspace ca=
n ever OOM itself
> > > > > through async VM_BIND, then the proposed solution seems wrong:
> > > > >
> > > > > Do we really want the driver developer to set an arbitrary bounda=
ry of a number
> > > > > of jobs that can be submitted before *async* VM_BIND blocks and b=
ecomes
> > > > > semi-sync?
> > > > >
> > > > > How do we choose this number of jobs? A very small number to be s=
afe, which
> > > > > scales badly on powerful machines? A large number that scales wel=
l on powerful
> > > > > machines, but OOMs on weaker ones?
> > > >
> > > > The way I am using it in msm, the credit amount and limit are in un=
its
> > > > of pre-allocated pages in-flight.  I set the enqueue_credit_limit t=
o
> > > > 1024 pages, once there are jobs queued up exceeding that limit, the=
y
> > > > start blocking.
> > > >
> > > > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in=
 flight.
> > >
> > > That doesn't make a difference for my question. How do you know 1024 =
pages is a
> > > good value? How do we scale for different machines with different cap=
abilities?
> > >
> > > If you have a powerful machine with lots of memory, we might throttle=
 userspace
> > > for no reason, no?
> > >
> > > If the machine has very limited resources, it might already be too mu=
ch?
> >
> > It may be a bit arbitrary, but then again I'm not sure that userspace
> > is in any better position to pick an appropriate limit.
> >
> > 4MB of in-flight pages isn't going to be too much for anything that is
> > capable enough to run vk, but still allows for a lot of in-flight
> > maps.
>
> Ok, but what about the other way around? What's the performance impact if=
 the
> limit is chosen rather small, but we're running on a very powerful machin=
e?
>
> Since you already have the implementation for hardware you have access to=
, can
> you please check if and how performance degrades when you use a very smal=
l
> threshold?

I mean, considering that some drivers (asahi, at least), _only_
implement synchronous VM_BIND, I guess blocking in extreme cases isn't
so bad.  But I think you are overthinking this.  4MB of pagetables is
enough to map ~8GB of buffers.

Perhaps drivers would want to set their limit based on the amount of
memory the GPU could map, which might land them on a # larger than
1024, but still not an order of magnitude more.

I don't really have a good setup for testing games that use this, atm,
fex-emu isn't working for me atm.  But I think Connor has a setup with
proton working?

But, flip it around.  It is pretty simple to create a test program
that submits a flood of 4k (or whatever your min page size is)
VM_BINDs, and see how prealloc memory usage blows up.  This is really
the thing this patch is trying to protect against.

> Also, I think we should probably put this throttle mechanism in a separat=
e
> component, that just wraps a counter of bytes or rather pages that can be
> increased and decreased through an API and the increase just blocks at a =
certain
> threshold.

Maybe?  I don't see why we need to explicitly define the units for the
credit.  This wasn't done for the existing credit mechanism.. which,
seems like if you used some extra fences could also have been
implemented externally.

> This component can then be called by a driver from the job submit IOCTL a=
nd the
> corresponding place where the pre-allocated memory is actually used / fre=
ed.
>
> Depending on the driver, this might not necessarily be in the scheduler's
> run_job() callback.
>
> We could call the component something like drm_throttle or drm_submit_thr=
ottle.

Maybe?  This still has the same complaint I had about just
implementing this in msm.. it would have to reach in and use the
scheduler's job_scheduled wait-queue.  Which, to me at least, seems
like more of an internal detail about how the scheduler works.

BR,
-R
