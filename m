Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE6FAC1A12
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 04:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A0E10E139;
	Fri, 23 May 2025 02:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zq+xA9U6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5B510E139;
 Fri, 23 May 2025 02:31:41 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-86135d11760so669987739f.2; 
 Thu, 22 May 2025 19:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747967500; x=1748572300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v50Axd90kyfqH9mwJmj3TPd2cL5HaAzM6IzM1l9YKSU=;
 b=Zq+xA9U6eNSa+kLoMOhfzw6x353g+NeauOevl2oAs3u66fSF0B+4MZtHfsmJt01Q+W
 sG4M+uMMfG4/3ki4Ty4L7BUkzmP6ScYtb+i8rzJS0aJVCyzzIe6oUW36eh5Cn7QWBFj4
 p5T7x3GWV0DUBKpsFkEyax7djOQam7fm/xl+PQG6fbwF0Ilg6BTpAyzyzghrCSZFPRJA
 R0q19gfU+wmbV01tcXVhS9wHa6bYLReuMUgqQbsyBHiVvEy+QGHmViq3iZSm6dASKCOH
 4K3dGBLaF3UTdh+ndo9HEjK3xYA48TxZteRCkrHc77Tz9Z5UqcK7cxxWso61JaPkLaih
 N4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747967500; x=1748572300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v50Axd90kyfqH9mwJmj3TPd2cL5HaAzM6IzM1l9YKSU=;
 b=Tyt8fRzWH/NJ1pX3dHYC+ots9eyjveXlX1HdJpTzxxZMXd9s13jFCb6X/dwv1SKx6T
 igSncS+iI+qmuSZGoXU+Dyg/iOBkwYNh0bY3unGYuEHUVguwjlxvyFw5NkfwdgwHj5f/
 nFM11T9yNvcLZ2uOwcgGIoMWpjUme5vzhs79FbdoJ3qwIdA3QjgFz/+GqffTivcSldPT
 YVzkuf+YD/fVybglYZA8td/VUw32GWZ1f2vxJI/XFBd0+1D51njau6clQae8osEMaxOI
 m/Ux62xPITlbVDVmPQ8JTthXI4CoScwK0SGu1dA0jcEv/+meAq7M5FBj+uz5GTSs7xR9
 fjTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKT3FSc6TiT73mp11Twjsmv7+VbM2+GvJombcGWAvkCHjNEF3XTDdrcoynjbo50qqc6Ips1/weuXmW@lists.freedesktop.org,
 AJvYcCX4/HQ2iigoMe8AB+GX5ZN/qg4Q9D8i0uyFqpu9dcKsA+PQPLzby3eedrjxh1y3Ou+5HreWuaxzRmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhFPXu6g0k7pxkkjxToM5t9SuEvpU++qEBcKi9Hud5riy1fGbP
 GiYg3ehvNPe1mtQURTx5v20fkiJ+3OPhQzK4ETxjBxVClGL9q4SFgcP6QPPr9JshzIZimrlLqRD
 nDq3/HKB6jLBPSX/3v1pZvvQjU+f3M9Q=
X-Gm-Gg: ASbGncuMowO1OY59yzxGEHH/euwgjk0AWntKnZllYaP1KQcChCu1vmvmhFqH47WTxdM
 7/wUSynnDFia/OZOr0QhgFy7hKPc6BuiWLM8JOOhxQD7xFYpauRhortTs1FhZQwm7xpSpWnxJgw
 3vJr0mu/fUEF9zp3oyxqvOfDudajclYN+ZNVqAYajilqAk5LsNlnBGu9gxkTiNpekN
X-Google-Smtp-Source: AGHT+IEaJK0kE9SEAYYnpJd6uzCGrAqsmkLSUrMUnq8m5hUhwbfMok+9DiOmcNxk+puC6/eGlHTtg9rkqjOTtXuzEd4=
X-Received: by 2002:a05:6602:6a87:b0:86a:24fe:c51f with SMTP id
 ca18e2360f4ac-86caf092e03mr197060839f.7.1747967500384; Thu, 22 May 2025
 19:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
 <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
 <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
 <aC8Dzgufa9E2MD6t@pollux>
 <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>
 <aC9Iih1KN6xb9LrK@cassiopeiae>
In-Reply-To: <aC9Iih1KN6xb9LrK@cassiopeiae>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 May 2025 19:31:28 -0700
X-Gm-Features: AX0GCFun40Rc8pO0Ej4MXUSPpbpJxcZFCAbQh8QNhOuG0dSQLURQ6RgXeZ6gFMg
Message-ID: <CAF6AEGvp6BCN14_n+Ot5KQrPbnDprKXcHT0s0ZLC2-JDV7D3TQ@mail.gmail.com>
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

On Thu, May 22, 2025 at 8:53=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 22, 2025 at 07:47:17AM -0700, Rob Clark wrote:
> > On Thu, May 22, 2025 at 4:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > > On Tue, May 20, 2025 at 10:22:54AM -0700, Rob Clark wrote:
> > > > On Tue, May 20, 2025 at 9:54=E2=80=AFAM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > > On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > > > > > On Tue, May 20, 2025 at 12:06=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > > But let's assume we agree that we want to avoid that userspac=
e can ever OOM itself
> > > > > > > through async VM_BIND, then the proposed solution seems wrong=
:
> > > > > > >
> > > > > > > Do we really want the driver developer to set an arbitrary bo=
undary of a number
> > > > > > > of jobs that can be submitted before *async* VM_BIND blocks a=
nd becomes
> > > > > > > semi-sync?
> > > > > > >
> > > > > > > How do we choose this number of jobs? A very small number to =
be safe, which
> > > > > > > scales badly on powerful machines? A large number that scales=
 well on powerful
> > > > > > > machines, but OOMs on weaker ones?
> > > > > >
> > > > > > The way I am using it in msm, the credit amount and limit are i=
n units
> > > > > > of pre-allocated pages in-flight.  I set the enqueue_credit_lim=
it to
> > > > > > 1024 pages, once there are jobs queued up exceeding that limit,=
 they
> > > > > > start blocking.
> > > > > >
> > > > > > The number of _jobs_ is irrelevant, it is # of pre-alloc'd page=
s in flight.
> > > > >
> > > > > That doesn't make a difference for my question. How do you know 1=
024 pages is a
> > > > > good value? How do we scale for different machines with different=
 capabilities?
> > > > >
> > > > > If you have a powerful machine with lots of memory, we might thro=
ttle userspace
> > > > > for no reason, no?
> > > > >
> > > > > If the machine has very limited resources, it might already be to=
o much?
> > > >
> > > > It may be a bit arbitrary, but then again I'm not sure that userspa=
ce
> > > > is in any better position to pick an appropriate limit.
> > > >
> > > > 4MB of in-flight pages isn't going to be too much for anything that=
 is
> > > > capable enough to run vk, but still allows for a lot of in-flight
> > > > maps.
> > >
> > > Ok, but what about the other way around? What's the performance impac=
t if the
> > > limit is chosen rather small, but we're running on a very powerful ma=
chine?
> > >
> > > Since you already have the implementation for hardware you have acces=
s to, can
> > > you please check if and how performance degrades when you use a very =
small
> > > threshold?
> >
> > I mean, considering that some drivers (asahi, at least), _only_
> > implement synchronous VM_BIND, I guess blocking in extreme cases isn't
> > so bad.
>
> Which is not even upstream yet and eventually will support async VM_BIND =
too,
> AFAIK.

the uapi is upstream

> > But I think you are overthinking this.  4MB of pagetables is
> > enough to map ~8GB of buffers.
> >
> > Perhaps drivers would want to set their limit based on the amount of
> > memory the GPU could map, which might land them on a # larger than
> > 1024, but still not an order of magnitude more.
>
> Nouveau currently supports an address space width of 128TiB.
>
> In general, we have to cover the range of some small laptop or handheld d=
evices
> to huge datacenter machines.

sure.. and?  It is still up to the user of sched to set their own
limits, I'm not proposing that sched takes charge of that policy

Maybe msm doesn't have to scale up quite as much (yet).. but it has to
scale quite a bit further down (like watches).  In the end it is the
same.  And also not really the point here.

> > I don't really have a good setup for testing games that use this, atm,
> > fex-emu isn't working for me atm.  But I think Connor has a setup with
> > proton working?
>
> I just want to be sure that an arbitrary small limit doing the job for a =
small
> device to not fail VK CTS can't regress the performance on large machines=
.

why are we debating the limit I set outside of sched.. even that might
be subject to some tuning for devices that have more memory, but that
really outside the scope of this patch

> So, kindly try to prove that we're not prone to extreme performance regre=
ssion
> with a static value as you propose.
>
> > > Also, I think we should probably put this throttle mechanism in a sep=
arate
> > > component, that just wraps a counter of bytes or rather pages that ca=
n be
> > > increased and decreased through an API and the increase just blocks a=
t a certain
> > > threshold.
> >
> > Maybe?  I don't see why we need to explicitly define the units for the
> > credit.  This wasn't done for the existing credit mechanism.. which,
> > seems like if you used some extra fences could also have been
> > implemented externally.
>
> If you are referring to the credit mechanism in the scheduler for ring bu=
ffers,
> that's a different case. Drivers know the size of their ring buffers exac=
tly and
> the scheduler has the responsibility of when to submit tasks to the ring =
buffer.
> So the scheduler kind of owns the resource.
>
> However, the throttle mechanism you propose is independent from the sched=
uler,
> it depends on the available system memory, a resource the scheduler doesn=
't own.

it is a distinction that is perhaps a matter of opinion.  I don't see
such a big difference, it is all just a matter of managing physical
resource usage in different stages of a scheduled job's lifetime.

> I'm fine to make the unit credits as well, but in this case we really car=
e about
> the consumption of system memory, so we could just use an applicable unit=
.
>
> > > This component can then be called by a driver from the job submit IOC=
TL and the
> > > corresponding place where the pre-allocated memory is actually used /=
 freed.
> > >
> > > Depending on the driver, this might not necessarily be in the schedul=
er's
> > > run_job() callback.
> > >
> > > We could call the component something like drm_throttle or drm_submit=
_throttle.
> >
> > Maybe?  This still has the same complaint I had about just
> > implementing this in msm.. it would have to reach in and use the
> > scheduler's job_scheduled wait-queue.  Which, to me at least, seems
> > like more of an internal detail about how the scheduler works.
>
> Why? The component should use its own waitqueue. Subsequently, from your =
code
> that releases the pre-allocated memory, you can decrement the counter thr=
ough
> the drm_throttle API, which automatically kicks its the waitqueue.
>
> For instance from your VM_BIND IOCTL you can call
>
>         drm_throttle_inc(value)
>
> which blocks if the increment goes above the threshold. And when you rele=
ase the
> pre-allocated memory you call
>
>         drm_throttle_dec(value)
>
> which wakes the waitqueue and unblocks the drm_throttle_inc() call from y=
our
> VM_BIND IOCTL.

ok, sure, we could introduce another waitqueue, but with my proposal
that is not needed.  And like I said, the existing throttling could
also be implemented externally to the scheduler..  so I'm not seeing
any fundamental difference.

> Another advantage is that, if necessary, we can make drm_throttle
> (automatically) scale for the machines resources, which otherwise we'd ne=
ed to
> pollute the scheduler with.

How is this different from drivers being more sophisticated about
picking the limit we configure the scheduler with?

Sure, maybe just setting a hard coded limit of 1024 might not be the
final solution.. maybe we should take into consideration the size of
the device.  But this is also entirely outside of the scheduler and I
fail to understand why we are discussing this here?

BR,
-R
