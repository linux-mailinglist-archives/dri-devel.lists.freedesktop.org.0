Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAopC5piqmlZQgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:14:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4D21BA89
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414DC10E34A;
	Fri,  6 Mar 2026 05:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nbQYGjds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com
 [74.125.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6B510E34A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 05:13:56 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-64c9707fc11so6628766d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 21:13:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772774035; cv=none;
 d=google.com; s=arc-20240605;
 b=lLwEjRLz2W8TXXYscioMcQKFKmYTlorIuWo0SxJgEZ24PGkErHQob3zPt3Wkjd4J9k
 vDS4yTrx23AOu+A2ZqGvPKZgXOEX/2wx1LLw9C9+FobfyJU+vRwiYInZMRCC5EmJLTzs
 xgPnJ3Nb+TwU4N7a1hVTukebb7xHdLEJb592//GVcrgfIhF7Qs2BUNkL5rz7fOVCM/Sk
 JN2nTsbe18GIc3IupYzkP9ygE99MFAC/A7G8f0MFIhAnrUSvXM8hVThRji7Rf3W99vFb
 pf/ogmRuW5BkM+bxK9Mw7yB2P1+gH00vg9zS6K7t+zWSzpX2x+1u7WYbVhmNyjYeDqo1
 2ljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Aeg81OAdBIECWrvoahs6hoKf8VftrdXMvcYbwTs9CXg=;
 fh=Y8tW4mIrdAtXLLAEfhPDK1mNKE5hh6XxhhExiN2UW5M=;
 b=OqFrTjMuN3vhioeNqh1yf8QEFM+1oXxkJqpKOMnKKzFPp6qPPpqDb3Kq5H7Hrep3Db
 29l1fvyCcWxElTkMFILx6h8RgmSdWPGQyYwwDEipLlIpisNkAc3W6Js8RttAWnnMampF
 jmWJzfyVRlJG88R3xiORWy5+k/VtVmfHu+6ZcQoUc40KRw533o5h4+UKzf9MlKgbLHGm
 x+qY9OSVI52b5UbZXEfLGiol71c13tc+RW/54UysDljIKeOGLX09ilf8y3ZMJSFJrVUk
 Xxz3JnQuKQwj5JR5gE0sobU5ntJSGo4Hv4CAfHH4HHFitHszK5EsYuryB/JnALbpq2pU
 im7Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772774035; x=1773378835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aeg81OAdBIECWrvoahs6hoKf8VftrdXMvcYbwTs9CXg=;
 b=nbQYGjdswfFPa0IMfXao+5iitlVC102xs4elWdF/P6qdRMJpNgAy7HWNj8+6aR+7Km
 QSzU1AbS2xiuKs3LvS/KED19a4yqsqe0NiMUmXEWh5Ma6s1TIzXtRXWc7uz20VjftmiV
 Ibk4hM86lxotHvyCc/xfKJAVq4KxxQg/qlK3QexwjfxLiMqb9soQCgl9QPPRaqaQ5hcQ
 GvkFXonVBV2+hhqc0V1/M/EnKtPrAywYXQLLxox4sCvu57x/MfcKK/od5+NP4EmQlXFj
 LHHR2FpGIbvbwEaOYYWvrFi5wg9rffhdZdWN6kKQcgrGfSflgX9FrpHCVJYGII2qGcqk
 to4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772774035; x=1773378835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Aeg81OAdBIECWrvoahs6hoKf8VftrdXMvcYbwTs9CXg=;
 b=b8+97irL9DH/WI0DHznmpA0ozO5SncmGeWhUfwPi9d+r2tq+xqBBb7cpuRdsPbA17y
 f5KSN/jwX29m9LScLgpzk9KdzsJK13J4FEGhqigTj0BsVcwXgvNa6ohAXVgFCFP/Zk5A
 tt20ljxCeGwOJboTW9XhwNu1UNnjJLYO0TWpscVVvU5tXsZl5jCKXlv671/8eRs6QrS3
 /aaHm3Btyli7ltOr3wQqt3uYRFgQBfX29IHv8Gr7HVRo70yGZx2ww6pwVCHTJ2o1cDQc
 dSl3cANXIacro1wiVXUUrNTBTStpIeIr1f/Sls90ceDFR9pcxYSu13nthAi4UEkQkoaw
 rj4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ5S9ayy2L+N0z+v8LOuihqU2SYhWdBEfinRR+vzqf0qTn9o3bQi6GkFZqXFQsq4tx9fcxIex99do=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoxnyiVJHsvPy/ui72QLSt4ift6jWyP0PHJSQW8iZStsaycXzH
 d7Jm+3ojIv2TfXdQbxjh/dsj1yrU7JMwwzSpnQ1XjAktjPks5a3fI0Xh295z+Q63r9GW9/k2FTl
 V1r7jrNXp3tKWh/q4iMX0qzED/cRPm9g=
X-Gm-Gg: ATEYQzzImdA1Gn8MghhJ0WKV8r7haG68LkXpnHNkAdK7n3SkeoV2Uchyjgd1q+Mz1Sk
 wHdf8Jlz3N2U9XETPXV+ZWjjr5Xbsyj+jl5fhhdbq66REy0NJ5nhG/PLxSkZ0ZN8Nbjmw7feDgX
 ihxDo6gjkNmjJ9Qs5l7BkguPDcxJssboB9HKKidc1mwDCdttzhvQmsjdDYfGHBKDJVm20Eou05w
 RGvmJV7TynyQEcFXFq8RGktmJnkGaeN7ixa+oL+ioY67t/qPUFq0w6xjkF9dBit3eUP1w1QAw89
 XJorXs+bvf2CzBgbYKy672UNwK5FsJjFBwSlW1HVnzygIvLZYpLQOW84gk4PmNSqSyePCdQX
X-Received: by 2002:a53:e194:0:b0:64a:d6eb:6e with SMTP id
 956f58d0204a3-64d1436ec4fmr661372d50.80.1772774035461; 
 Thu, 05 Mar 2026 21:13:55 -0800 (PST)
MIME-Version: 1.0
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com> <20260305092711.20069ca1@fedora>
 <aalWTOZSNYcKpvdd@lstrano-desk.jf.intel.com> <20260305115201.6fb044f0@fedora>
 <aans5SMXDbwhpqY8@lstrano-desk.jf.intel.com>
In-Reply-To: <aans5SMXDbwhpqY8@lstrano-desk.jf.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 5 Mar 2026 21:13:44 -0800
X-Gm-Features: AaiRm50Ava_52GoNBjmjZmWYjMucAtvsQvpabz93ob-KeH2kqNS05-Ap8VySKB0
Message-ID: <CAPaKu7SXsCv=G+O38unCsdrUNeeOmbopRdBpjqP+Qxp+EP9JtA@mail.gmail.com>
Subject: Re: drm_sched run_job and scheduling latency
To: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, intel-xe@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>,
 tj@kernel.org
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
X-Rspamd-Queue-Id: 89E4D21BA89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:boris.brezillon@collabora.com,m:intel-xe@lists.freedesktop.org,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 12:52=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> On Thu, Mar 05, 2026 at 11:52:01AM +0100, Boris Brezillon wrote:
> > On Thu, 5 Mar 2026 02:09:16 -0800
> > Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > > On Thu, Mar 05, 2026 at 09:27:11AM +0100, Boris Brezillon wrote:
> > >
> > > I addressed most of your comments in a chained reply to Phillip, but =
I
> > > guess he dropped some of your email and thus missed those. Responding
> > > below.
> > >
> > > > Hi Matthew,
> > > >
> > > > On Wed, 4 Mar 2026 18:04:25 -0800
> > > > Matthew Brost <matthew.brost@intel.com> wrote:
> > > >
> > > > > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > > > > > Hi,
> > > > > >
> > > > > > Our system compositor (surfaceflinger on android) submits gpu j=
obs
> > > > > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > > > > workqueue threads are SCHED_NORMAL, the scheduling latency from=
 submit
> > > > > > to run_job can sometimes cause frame misses. We are seeing this=
 on
> > > > > > panthor and xe, but the issue should be common to all drm_sched=
 users.
> > > > > >
> > > > >
> > > > > I'm going to assume that since this is a compositor, you do not p=
ass
> > > > > input dependencies to the page-flip job. Is that correct?
> > > > >
> > > > > If so, I believe we could fairly easily build an opt-in DRM sched=
 path
> > > > > that directly calls run_job in the exec IOCTL context (I assume t=
his is
> > > > > SCHED_FIFO) if the job has no dependencies.
> > > >
> > > > I guess by ::run_job() you mean something slightly more involved th=
at
> > > > checks if:
> > > >
> > > > - other jobs are pending
> > > > - enough credits (AKA ringbuf space) is available
> > > > - and probably other stuff I forgot about
> > > >
> > > > >
> > > > > This would likely break some of Xe=E2=80=99s submission-backend a=
ssumptions
> > > > > around mutual exclusion and ordering based on the workqueue, but =
that
> > > > > seems workable. I don=E2=80=99t know how the Panthor code is stru=
ctured or
> > > > > whether they have similar issues.
> > > >
> > > > Honestly, I'm not thrilled by this fast-path/call-run_job-directly =
idea
> > > > you're describing. There's just so many things we can forget that w=
ould
> > > > lead to races/ordering issues that will end up being hard to trigge=
r and
> > > > debug. Besides, it doesn't solve the problem where your gfx pipelin=
e is
> > > > fully stuffed and the kernel has to dequeue things asynchronously. =
I do
> > > > believe we want RT-prio support in that case too.
> > > >
> > >
> > > My understanding of SurfaceFlinger is that it never waits on input
> > > dependencies from rendering applications, since those may not signal =
in
> > > time for a page flip. Because of that, you can=E2=80=99t have the job=
(s) that
> > > draw to the screen accept input dependencies. Maybe I have that
> > > wrong=E2=80=94but I've spoken to the Google team several times about =
issues with
> > > SurfaceFlinger, and that was my takeaway.
> > >
> > > So I don't think the kernel should ever have to dequeue things
> > > asynchronously, at least for SurfaceFlinger.
> >
> > There's still the contention coming from the ring buffer size, which ca=
n
> > prevent jobs from being queued directly to the HW, though, admittedly,
> > if the HW is not capable of compositing the frame faster than the
> > refresh rate, and guarantee an almost always empty ringbuffer, fixing
> > the scheduling prio is probably pointless.
> >
> > > If there is another RT use
> > > case that requires input dependencies plus the kernel dequeuing thing=
s
> > > asynchronously, I agree this wouldn=E2=80=99t help=E2=80=94but my sug=
gestion also isn=E2=80=99t
> > > mutually exclusive with other RT rework either.
> >
> > Yeah, dunno. It just feels like another hack on top of the already quit=
e
> > convoluted design that drm_sched has become.
> >
>
> I agree we wouldn't want this to become some wild hack.
>
> I could actually see this helping in other very timing-sensitive
> paths=E2=80=94for example, page-fault paths where a copy job needs to be =
issued
> as part of the fault resolution to a dedicated kernel queue. I=E2=80=99ve=
 seen
> noise in fault profiling caused by delays in the scheduler workqueue,
> which needs to program the job to the device. In paths like this, every
> microsecond matters, as even minor improvements have real-world impacts
> on performance numbers. This will become even more noticeable as
> CPU<->GPU bus speeds increase. In this case, typically copy jobs have
> no input dependencies, thus the desire is to program the ring as quickly
> as possible.
>
> > >
> > > > >
> > > > > I can try to hack together a quick PoC to see what this would loo=
k like
> > > > > and give you something to test.
> > > > >
> > > > > > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and=
 won't
> > > > > > meet future android requirements). It seems either workqueue ne=
eds to
> > > > > > gain RT support, or drm_sched needs to support kthread_worker.
> > > > >
> > > > > +Tejun to see if RT workqueue is in the plans.
> > > >
> > > > Dunno how feasible that is, but that would be my preferred option.
> > > >
> > > > >
> > > > > >
> > > > > > I know drm_sched switched from kthread_worker to workqueue for =
better
> > > > > > scaling when xe was introduced. But if drm_sched can support ei=
ther
> > > > > > workqueue or kthread_worker during drm_sched_init, drivers can
> > > > > > selectively use kthread_worker only for RT gpu queues. And beca=
use
> > > > > > drivers require CAP_SYS_NICE for RT gpu queues, this should not=
 cause
> > > > > > scaling issues.
> > > > > >
> > > > >
> > > > > I don=E2=80=99t think having two paths will ever be acceptable, n=
or do I think
> > > > > supporting a kthread would be all that easy. For example, in Xe w=
e queue
> > > > > additional work items outside of the scheduler on the queue for o=
rdering
> > > > > reasons =E2=80=94 we=E2=80=99d have to move all of that code down=
 into DRM sched or
> > > > > completely redesign our submission model to avoid this. I=E2=80=
=99m not sure if
> > > > > other drivers also do this, but it is allowed.
> > > >
> > > > Panthor doesn't rely on the serialization provided by the single-th=
read
> > > > workqueue, Panfrost might rely on it though (I don't remember). I a=
gree
> > > > that maintaining a thread and workqueue based scheduling is not ide=
al
> > > > though.
> > > >
> > > > >
> > > > > > Thoughts? Or perhaps this becomes less of an issue if all drm_s=
ched
> > > > > > users have concrete plans for userspace submissions..
> > > > >
> > > > > Maybe some day....
> > > >
> > > > I've yet to see a solution where no dma_fence-based signalization i=
s
> > > > involved in graphics workloads though (IIRC, Arm's solution still
> > > > needs the kernel for that). Until that happens, we'll still need th=
e
> > > > kernel to signal fences asynchronously when the job is done, which =
I
> > > > suspect will cause the same kind of latency issue...
> > > >
> > >
> > > I don't think that is the problem here. Doesn=E2=80=99t the job that =
draws the
> > > frame actually draw it, or does the display wait on the draw job=E2=
=80=99s fence
> > > to signal and then do something else?
> >
> > I know close to nothing about SurfaceFlinger and very little about
> > compositors in general, so I'll let Chia answer that one. What's sure
>
> I think Chia input would good, as if SurfaceFlinger jobs have input
> dependencies this entire suggestion doesn't make any sense.
>
> > is that, on regular page-flips (don't remember what async page-flips
> > do), the display drivers wait on the fences attached to the buffer to
> > signal before doing the flip.
>
> I think SurfaceFlinger is different compared to Wayland/X11 use cases,
> as maintaining a steady framerate is the priority above everything else
> (think phone screens, which never freeze, whereas desktops do all the
> time). So I believe SurfaceFlinger decides when it will submit the job
> to draw a frame, without directly passing in application dependencies
> into the buffer/job being drawn. Again, my understanding here may be
> incorrect...
That is correct. SurfaceFlinger only ever latches buffers whose
associated fences have signaled, and sends down the buffers to gpu for
composition or to the display for direct scanout. That might also be
how modern wayland compositors work nowadays? It sounds bad to let a
low fps app slow down system composition.

In theory, the gpu driver should not see input dependencies ever. I
will need to check if there are corner cases.


>
> >
> > > (Sorry=E2=80=94I know next to nothing
> > > about display.) Either way, fences should be signaled in IRQ handlers=
,
> >
> > In Panthor they are not, but that's probably something for us to
> > address.
Yeah, I am also looking into signaling fences from the (threaded) irq handl=
er.

> >
> > > which presumably don=E2=80=99t have the same latency issues as workqu=
eues, but I
> > > could be mistaken.
> >
> > Might have to do with the mental model I had of this "reconcile
> > Usermode queues with dma_fence signaling" model, where I was imagining
> > a SW job queue (based on drm_sched too) that would wait on HW fences to
> > be signal and would as a result signal the dma_fence attached to the
> > job. So the queueing/dequeuing of these jobs would still happen through
> > drm_sched, with the same scheduling prio issue. This being said, those
>
> Yes, if jobs have unmet dependencies, the bypass path doesn=E2=80=99t hel=
p with
> the DRM scheduler workqueue context switches being slow as that path
> needs to be taken in taken in this cases.
>
> Also, to bring up something insane we certainly wouldn=E2=80=99t want to =
do:
> calling run_job when dependencies are resolved in the fence callback,
> since we could be in an IRQ handler.
>
> Matt
>
> > jobs would likely be dependency less, so more likely to hit your
> > fast-path-run-job.
