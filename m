Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4190ABE1C0
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 19:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C38D10E5A6;
	Tue, 20 May 2025 17:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XKorYT9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8043410E59E;
 Tue, 20 May 2025 17:23:07 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-86a052d7897so393788439f.0; 
 Tue, 20 May 2025 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747761786; x=1748366586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v/1eH7FjHnXuwS8GNeCtTiHpwIYDozegXN0D5gLrtdM=;
 b=XKorYT9sFJsxo357Ot3nl8hU+HB5TYmKvLzXCWVCjyYorq+W9SNZQ4DtXmaKVvAmgD
 IVbh95qKObuqOm4aWU6iW/vNHkEoVRdwUI94Rcl+T4UBjlk6Qgt/033DSiXTN1P3NbV9
 D8hND40oVfn26CIAG+utijKo0vyE9s02u+LNZW8MwCFTbONEp5IwBBQf+ZGUAOh0sWh8
 wjc81/xhc8aRmNId4lkWgUqXyvMSOeF9qXgGLLGgYm+M9t9de1T/nAL4wVsO4y0XwQCO
 f38rszCLQN+7adAsAAgbmAfU7E9SBF2wxP2304f0/maWztTxRuIR+aV35614P+rv0RPF
 n9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747761786; x=1748366586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v/1eH7FjHnXuwS8GNeCtTiHpwIYDozegXN0D5gLrtdM=;
 b=OdhZVMRi3qeV6WtWo9jE2cOkNsfmHsGvtW+Q1Dow4Z6rHUJqu86caMkgjqIcV1qo4o
 J5J7n7NaUHNqp2zgi0PVNaCqIW59QkevCDr0GsuULO4CtH/c//pEMvoeTCRVcr0HJ1kf
 uz18ItzN3YTKp+HbyYPeGUAm6lXptHKsZauHUGIaXUAdJgB4saAqIg03CAh9MZQ5ExXi
 tcFYhh1I246Snn3UL/NmQImNcnkSJe80x6tElj8EuMUglwaM57VdXWoE5FuF9Ro2RDbv
 KQaAKqtEAYLx21DZ5Goj6rxyJWL1pC4SrEd8V+GRC0ZNmHZig8m0c3g3SaYnvAd6vECY
 22aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAFOQLAlwr3R9T1rQLyTBYWPBQqyoinQi73Z4qSa/dOHE9mGmUdEO5tae4pOfF/VxXYX/ylZi6hDlJ@lists.freedesktop.org,
 AJvYcCVHHkrY1SxFA2ZHAvo00ZSSNIm76v6RrO/+Dssr376QHr2ZLVtmdEF4NEuQq1pP0wHZTms00na9hD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnozEOJ4ViIBe7S+ZAV7NAi5p0LGNqHPTj9Tqp1ZT7IqX41mee
 UxQVpKapEB/aOB+daJHzxrbr59TamVGqmBwYCcXabeAlDsweUQhYIbrPmezChOGNHpbNMTdJD5Q
 ZujqcP1ntwkHkukEmCwTnOWoOuM1zmws=
X-Gm-Gg: ASbGnct3AJdEz6B91WAtur1kk5GaEE39b/EFOej7gJ6Z6Z5S0m3KskqZs1qLNsT3yXN
 Insa8UYFdqSe3oohqbgWLRwZyDf7AVxB2geESG+2d/vxf7ELouO/92+4gRDCyeT9WzPtOdGEuvI
 jfV2xlOfvNX8PPgNtrdREXqVGQHs5NZHBStM1+Z68+Aihkf2Sb/Um/t5jvCJXTeBOsiQNz0Iu/Q
 A==
X-Google-Smtp-Source: AGHT+IHpQA08tYTT02U2iTROdpr5ReReyZy/jVFOO0KEV8Wa4oUzzDHXqMwq9idWIskV4i26glWc97QtN/cPQ9E+S6o=
X-Received: by 2002:a05:6e02:23c8:b0:3dc:76ad:e3a8 with SMTP id
 e9e14a558f8ab-3dc76ade94dmr62670085ab.11.1747761786345; Tue, 20 May 2025
 10:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
 <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
In-Reply-To: <aCyzyAPbQ1SYbo4q@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 May 2025 10:22:54 -0700
X-Gm-Features: AX0GCFssom0OIu9t5oGBdb8b5O6J5LNG6iWic-G7BUb-iO0A4ra9weO2FuUipaU
Message-ID: <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
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

On Tue, May 20, 2025 at 9:54=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > On Tue, May 20, 2025 at 12:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > >
> > > On Thu, May 15, 2025 at 12:56:38PM -0700, Rob Clark wrote:
> > > > On Thu, May 15, 2025 at 11:56=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > >
> > > > > On Thu, May 15, 2025 at 10:40:15AM -0700, Rob Clark wrote:
> > > > > > On Thu, May 15, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > >
> > > > > > > (Cc: Boris)
> > > > > > >
> > > > > > > On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote=
:
> > > > > > > > For some context, other drivers have the concept of a "sync=
hronous"
> > > > > > > > VM_BIND ioctl which completes immediately, and drivers impl=
ement it by
> > > > > > > > waiting for the whole thing to finish before returning.
> > > > > > >
> > > > > > > Nouveau implements sync by issuing a normal async VM_BIND and=
 subsequently
> > > > > > > waits for the out-fence synchronously.
> > > > > >
> > > > > > As Connor mentioned, we'd prefer it to be async rather than blo=
cking,
> > > > > > in normal cases, otherwise with drm native context for using na=
tive
> > > > > > UMD in guest VM, you'd be blocking the single host/VMM virglren=
der
> > > > > > thread.
> > > > > >
> > > > > > The key is we want to keep it async in the normal cases, and no=
t have
> > > > > > weird edge case CTS tests blow up from being _too_ async ;-)
> > > > >
> > > > > I really wonder why they don't blow up in Nouveau, which also sup=
port full
> > > > > asynchronous VM_BIND. Mind sharing which tests blow up? :)
> > > >
> > > > Maybe it was dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.=
buffer_size_2_24,
> > >
> > > The test above is part of the smoke testing I do for nouveau, but I h=
aven't seen
> > > such issues yet for nouveau.
> >
> > nouveau is probably not using async binds for everything?  Or maybe
> > I'm just pointing to the wrong test.
>
> Let me double check later on.
>
> > > > but I might be mixing that up, I'd have to back out this patch and =
see
> > > > where things blow up, which would take many hours.
> > >
> > > Well, you said that you never had this issue with "real" workloads, b=
ut only
> > > with VK CTS, so I really think we should know what we are trying to f=
ix here.
> > >
> > > We can't just add new generic infrastructure without reasonable and *=
well
> > > understood* justification.
> >
> > What is not well understood about this?  We need to pre-allocate
> > memory that we likely don't need for pagetables.
> >
> > In the worst case, a large # of async PAGE_SIZE binds, you end up
> > needing to pre-allocate 3 pgtable pages (4 lvl pgtable) per one page
> > of mapping.  Queue up enough of those and you can explode your memory
> > usage.
>
> Well, the general principle how this can OOM is well understood, sure. Wh=
at's
> not well understood is how we run in this case. I think we should also
> understand what test causes the issue and why other drivers are not affec=
ted
> (yet).
>
> > > > There definitely was one where I was seeing >5k VM_BIND jobs pile u=
p,
> > > > so absolutely throttling like this is needed.
> > >
> > > I still don't understand why the kernel must throttle this? If usersp=
ace uses
> > > async VM_BIND, it obviously can't spam the kernel infinitely without =
running
> > > into an OOM case.
> >
> > It is a valid question about whether the kernel or userspace should be
> > the one to do the throttling.
> >
> > I went for doing it in the kernel because the kernel has better
> > knowledge of how much it needs to pre-allocate.
> >
> > (There is also the side point, that this pre-allocated memory is not
> > charged to the calling process from a PoV of memory accounting.  So
> > with that in mind it seems like a good idea for the kernel to throttle
> > memory usage.)
>
> That's a very valid point, maybe we should investigate in the direction o=
f
> addressing this, rather than trying to work around it in the scheduler, w=
here we
> can only set an arbitrary credit limit.

Perhaps.. but that seems like a bigger can of worms

> > > But let's assume we agree that we want to avoid that userspace can ev=
er OOM itself
> > > through async VM_BIND, then the proposed solution seems wrong:
> > >
> > > Do we really want the driver developer to set an arbitrary boundary o=
f a number
> > > of jobs that can be submitted before *async* VM_BIND blocks and becom=
es
> > > semi-sync?
> > >
> > > How do we choose this number of jobs? A very small number to be safe,=
 which
> > > scales badly on powerful machines? A large number that scales well on=
 powerful
> > > machines, but OOMs on weaker ones?
> >
> > The way I am using it in msm, the credit amount and limit are in units
> > of pre-allocated pages in-flight.  I set the enqueue_credit_limit to
> > 1024 pages, once there are jobs queued up exceeding that limit, they
> > start blocking.
> >
> > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in fli=
ght.
>
> That doesn't make a difference for my question. How do you know 1024 page=
s is a
> good value? How do we scale for different machines with different capabil=
ities?
>
> If you have a powerful machine with lots of memory, we might throttle use=
rspace
> for no reason, no?
>
> If the machine has very limited resources, it might already be too much?

It may be a bit arbitrary, but then again I'm not sure that userspace
is in any better position to pick an appropriate limit.

4MB of in-flight pages isn't going to be too much for anything that is
capable enough to run vk, but still allows for a lot of in-flight
maps.  As I mentioned before, I don't expect anyone to hit this case
normally, unless they are just trying to poke the driver in weird
ways.  Having the kernel guard against that doesn't seem unreasonable.

BR,
-R
