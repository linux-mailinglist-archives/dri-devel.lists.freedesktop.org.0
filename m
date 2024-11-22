Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A79D622B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986D510EC01;
	Fri, 22 Nov 2024 16:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BjtdZyV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994D710EC01
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732292648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ehs1/m4+pBhtvI744bGi+xjlGrO7Dq+WbR4w4Q9aW0=;
 b=BjtdZyV94CJQJKApjAVBLtxN6WtcsBmM1ZJMK7CqFe7d8CpGSBAIkG7R1SB0YRQejYIqqo
 3XAFsWpWgqo5Nm12aIUvAZobpkBa9wKU9NkwLaR/mGODhif+jWjg2Ar4GCEFTyuf1Ef1U2
 UVCqtagGbuwdw34oMhFS06d8EqDJldA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-QpjmrOsMMROui19pBpblmg-1; Fri, 22 Nov 2024 11:24:07 -0500
X-MC-Unique: QpjmrOsMMROui19pBpblmg-1
X-Mimecast-MFC-AGG-ID: QpjmrOsMMROui19pBpblmg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-431673032e6so14699355e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 08:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732292646; x=1732897446;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ehs1/m4+pBhtvI744bGi+xjlGrO7Dq+WbR4w4Q9aW0=;
 b=cCF0XLu5jTo6hM6Mi89RukNjSxZajvyQNI/Mkh1yaOUoOpKsYM7Dh/jK29lU1MRtuv
 kOm7Q8qni/TD4OhIi8D+S/UOpECYbgQf8nBU1MeO2/e7f+XR1UZWBe8v+Yw9STDEeyKc
 dcqKTNfdT9BSx3NiI6ZMhqWKQSNqLnQyh3Sr41QQ1d8EUgosItLnAZ9uVm6/jA4VjXkW
 6TZhYrQs2i+XoWmHAx5/+6XcPixfNVLZ6V/uXKWblGUirRs1K4EGn24GGo7muC4QLeiG
 6hV8CKQyDywlzdLi1hWRt9YZ8q6Toc9nBc9CWkgPVN/n0C3LL4FFz2j+jZtH2o0k0VI0
 AONQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Qf2WnmdJuUI3NaZjqqGTLZtAz52oZGiFY1MQJ0dFP2niD/NZQU1lNnoUtX0EA9RhzbP8yNhyMLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxnc4IsyEVXmeYWVycDCYMharwgegYJWTjOY7WhQlUUlPEBeHA1
 m0zNPqnGLnk7jqoeCBX/P2SyAXOu0fyk/liBKx5Lufc5IOvDpSIpy+zfdD0azlL8l9nQ24wYkW5
 z+tbFfVZWJMf9srfGLmq8VVGNS9+5VJkDqnHDhWxoex8nW+hJunO2DgI1LTCYcL4f4g==
X-Gm-Gg: ASbGncvlxzY/Fm2Gbg2LYTjCpuoInf12C15/0h/hEu8LDTCkzqIAqRgfSIXM3bUSiH9
 r5R/5Edvsq9BCGtOCtmgPro7fghKKxFIffi5KFan6iSr6TXMpzm7FdkeBqd/RsMDrpLp2Zs4hm8
 PL6dOdjRknt5RTANiA1l0Dz4OvbaG7KofLWLnya+5q9+c8gfRK7S6aInbN9kWcrGb5d51IPdIar
 zWhCwVPsvBOiEPtHrf1HBIVTKNYnHgDQg3gFEDUovo/twJtroNJU1aoSINSlPriwwYIyB1BdXeq
 9jxn3EDrbNVDFbeOgtH+Lq89FvgEmXYuXJRU+hNUdGjsAHfLQOEnXkNIOH1nxXej5DTI+SGX9rL
 gCBE=
X-Received: by 2002:a5d:64cc:0:b0:382:4bdc:2be2 with SMTP id
 ffacd0b85a97d-38260bce4c8mr2918915f8f.40.1732292645731; 
 Fri, 22 Nov 2024 08:24:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3CGXRqkkyUh+Zeuu4o7wzXDrbEB4Rd+r9TZYPGl1yPlIwHGzA3jTqZAbsYS6NCJpGOAywDw==
X-Received: by 2002:a5d:64cc:0:b0:382:4bdc:2be2 with SMTP id
 ffacd0b85a97d-38260bce4c8mr2918887f8f.40.1732292645163; 
 Fri, 22 Nov 2024 08:24:05 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d53:300:d213:3ec2:54be:d22?
 (200116b82d530300d2133ec254be0d22.dip.versatel-1u1.de.
 [2001:16b8:2d53:300:d213:3ec2:54be:d22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde0db3csm32377115e9.10.2024.11.22.08.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 08:24:04 -0800 (PST)
Message-ID: <1004fc81aff1de302582caa873a52e6e39b33215.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Date: Fri, 22 Nov 2024 17:24:03 +0100
In-Reply-To: <Zz92bqXBCZ0Ccrz6@lstrano-desk.jf.intel.com>
References: <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
 <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
 <a2ef4cdfeb31ad95de9311274de73a51cdc54a97.camel@redhat.com>
 <64c478a7-0afb-4b9b-8a7a-6e204a79cc20@gmail.com> <Zw0xHB_UNOvRq0L7@pollux>
 <6b656a2e199d1fa1d33684572a93e327cba0ae83.camel@redhat.com>
 <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
 <Zz92bqXBCZ0Ccrz6@lstrano-desk.jf.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m203Q62J-LMN_ncPxPMW6jkF0VNUU_r4Cb_lPPsTcf4_1732292646
X-Mimecast-Originator: redhat.com
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

On Thu, 2024-11-21 at 10:05 -0800, Matthew Brost wrote:
> On Tue, Oct 29, 2024 at 08:22:22AM +0100, Philipp Stanner wrote:
> > Christian, Sima?
> >=20
> > Matthew? (+CC)
> >=20
>=20
> Sorry catching up here. Internally in Xe we ref count the scheduler
> as
> the scheduler is embedded into our user queue structure
> (xe_exec_queue).
> Jobs ref the queue once they are armed. Upon queue killing we set TDR
> to
> zero which will flush out all jobs / signal all the job's fences.
> Once
> the ref count of queue is zero we do hardware / firmware teardown of
> the
> queue and then finally call drm_sched_fini before freeing the queues
> memory (and thus the scheduler).
>=20
> This flow seems to work pretty well but largely bypasses the
> scheduler
> functions to implement this. Not sure if this flow could be
> normalized
> at all but I would expect usage models of a 1 to 1 relationship
> between
> queue and scheduler to something similar to Xe's flow.

One of the solution I proposed basically does the same: jobs added to
gpu_scheduler.pending_list refcount the scheduler.

If we'd go for that solution I assume the separate refcounting could be
removed from Xe. For exmaple.


>  Maybe we could
> write this done as design guideline so other drivers don't have to
> figure this out - this took me a bit to land on this.

I already improved the documentation a while ago [1], but didn't detail
how drivers are supposed to solve this. The reason is that I don't want
to encourage more separate solutions while we're working on solving it
centrally.

> With that, in general I agree with Christian's patch here complaining
> about pending jobs if drm_sched_fini is called.

Yes, firing a WARN_ON there is also fine from my POV.

P.


[1] https://lore.kernel.org/dri-devel/20241105143137.71893-2-pstanner@redha=
t.com/


>=20
> > Opinions on the below?
> >=20
> > tl;dr:
> > I still think it's a good thing to detectably block in
> > drm_sched_fini(), or at the very least drm_sched_flush(), because
> > then
>=20
> See above. I don't think drm_sched_fini should block rather just
> complain this patch does which says 'go fix your driver'.
>=20
> Matt
>=20
> > you'll find out that the driver is broken and can repair it.
> >=20
> > P.
> >=20
> >=20
> > On Fri, 2024-10-18 at 14:07 +0200, Philipp Stanner wrote:
> > > On Mon, 2024-10-14 at 16:56 +0200, Danilo Krummrich wrote:
> > > > On Fri, Sep 27, 2024 at 11:04:48AM +0200, Christian K=C3=B6nig
> > > > wrote:
> > > > > Am 25.09.24 um 16:53 schrieb Philipp Stanner:
> > > > > > On Tue, 2024-09-24 at 13:18 +0200, Simona Vetter wrote:
> > > > > > > On Mon, Sep 23, 2024 at 05:24:10PM +0200, Christian K=C3=B6ni=
g
> > > > > > > wrote:
> > > > > > > > Am 20.09.24 um 15:26 schrieb Philipp Stanner:
> > > > > > > > > On Fri, 2024-09-20 at 12:33 +0200, Christian K=C3=B6nig
> > > > > > > > > wrote:
> > > > > > > > > > Am 20.09.24 um 10:57 schrieb Philipp Stanner:
> > > > > > > > > > > On Wed, 2024-09-18 at 15:39 +0200, Christian
> > > > > > > > > > > K=C3=B6nig
> > > > > > > > > > > wrote:
> > > > > > > > > > > > Tearing down the scheduler with jobs still on
> > > > > > > > > > > > the
> > > > > > > > > > > > pending
> > > > > > > > > > > > list
> > > > > > > > > > > > can
> > > > > > > > > > > > lead to use after free issues. Add a warning if
> > > > > > > > > > > > drivers try
> > > > > > > > > > > > to
> > > > > > > > > > > > destroy a scheduler which still has work pushed
> > > > > > > > > > > > to
> > > > > > > > > > > > the HW.
> > > > > > > > > > > Did you have time yet to look into my proposed
> > > > > > > > > > > waitque-
> > > > > > > > > > > solution?
> > > > > > > > > > I don't remember seeing anything. What have I
> > > > > > > > > > missed?
> > > > > > > > > https://lore.kernel.org/all/20240903094446.29797-2-pstann=
er@redhat.com/
> > > > > > > > Mhm, I didn't got that in my inbox for some reason.
> > > > > > > >=20
> > > > > > > > Interesting approach, I'm just not sure if we can or
> > > > > > > > should
> > > > > > > > wait in
> > > > > > > > drm_sched_fini().
> > > > > > We do agree that jobs still pending when drm_sched_fini()
> > > > > > starts
> > > > > > is
> > > > > > always a bug, right?
> > > > >=20
> > > > > Correct, the question is how to avoid that.
> > > > >=20
> > > > > > If so, what are the disadvantages of waiting in
> > > > > > drm_sched_fini()?
> > > > > > We
> > > > > > could block buggy drivers as I see it. Which wouldn't be
> > > > > > good,
> > > > > > but
> > > > > > could then be fixed on drivers' site.
> > > > >=20
> > > > > Sima explained that pretty well: Don't block in fops->close,
> > > > > do
> > > > > that in
> > > > > fops->flush instead.
> > > >=20
> > > > I agree that we shouldn't block in close(), but this
> > > > effectively
> > > > means that we
> > > > need to reference count the scheduler, right?
> > > >=20
> > > > Otherwise, if we allow to just skip / interrupt the teardown,
> > > > we
> > > > can
> > > > still leak
> > > > memory.
> > >=20
> > > Having thought about it, I agree with Danilo. Having something
> > > that
> > > shall wait on green light, but can be interrupted, is no
> > > guarantee
> > > and
> > > therefore not a feasible solution.
> > >=20
> > > To break down the solution space, these seem to be our options:
> > > =C2=A0=C2=A0 1. We have something (either drm_sched_fini() or a helpe=
r,
> > > e.g.,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_flush()) that definitely blo=
cks until the pending
> > > list
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has become empty.
> > > =C2=A0=C2=A0 2. We have jobs reference-count the scheduler, so the la=
tter
> > > can
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 outlive the driver and will be freed s=
ome time later.
> > >=20
> > > Can anyone think of a third solution?
> > >=20
> > >=20
> > > Solution #1 has the problem of obviously blocking unconditionally
> > > if
> > > the driver didn't make sure that all fences will be signaled
> > > within
> > > reasonable time. In my opinion, this would actually be an
> > > advantage,
> > > because it will be *very* noticable and force users to repair
> > > their
> > > driver. The driver *has* to guarantee that all fences will be
> > > signaled.
> > > If the driver has to do fishy things, having the blocking
> > > outsourced
> > > to
> > > the helper drm_sched_flush() would allow them to circumvent that.
> > >=20
> > > Solution #2 has the problem of backend_ops.free_job() potentially
> > > using
> > > driver-data after the driver is gone, causing UAF. So with this
> > > solutions all drivers would have to be aware of the issue and
> > > handle
> > > it
> > > through one of DRMs primitives dedicated to such problems.
> > >=20
> > >=20
> > > Currently, all drivers either work around the problem internally
> > > or
> > > simply ignore it, it seems.
> > >=20
> > > So I'd argue that both solutions are an improvement over the
> > > existing
> > > situation. My preference would be #1.
> > >=20
> > >=20
> > > Opinions?
> > >=20
> > > P.
> > >=20
> > > >=20
> > > > >=20
> > > > > One issue this solves is that when you send a SIGTERM the
> > > > > tear
> > > > > down
> > > > > handling
> > > > > first flushes all the FDs and then closes them.
> > > > >=20
> > > > > So if flushing the FDs blocks because the process initiated
> > > > > sending
> > > > > a
> > > > > terabyte of data over a 300bps line (for example) you can
> > > > > still
> > > > > throw a
> > > > > SIGKILL and abort that as well.
> > > > >=20
> > > > > If you would block in fops-close() that SIGKILL won't have
> > > > > any
> > > > > effect any
> > > > > more because by the time close() is called the process is
> > > > > gone
> > > > > and
> > > > > signals
> > > > > are already blocked.
> > > > >=20
> > > > > And yes when I learned about that issue I was also buffed
> > > > > that
> > > > > handling like
> > > > > this in the UNIX design is nearly 50 years old and still
> > > > > applies
> > > > > to
> > > > > today.
> > > > > > > > Probably better to make that a separate function,
> > > > > > > > something
> > > > > > > > like
> > > > > > > > drm_sched_flush() or similar.
> > > > > > We could do that. Such a function could then be called by
> > > > > > drivers
> > > > > > which
> > > > > > are not sure whether all jobs are done before they start
> > > > > > tearing
> > > > > > down.
> > > > >=20
> > > > > Yes exactly that's the idea. And give that flush function a
> > > > > return
> > > > > code so
> > > > > that it can return -EINTR.
> > > > >=20
> > > > > > > Yeah I don't think we should smash this into
> > > > > > > drm_sched_fini
> > > > > > > unconditionally. I think conceptually there's about three
> > > > > > > cases:
> > > > > > >=20
> > > > > > > - Ringbuffer schedules. Probably want everything as-is,
> > > > > > > because
> > > > > > > =C2=A0=C2=A0 drm_sched_fini is called long after all the enti=
ties
> > > > > > > are
> > > > > > > gone in
> > > > > > > =C2=A0=C2=A0 drm_device cleanup.
> > > > > > >=20
> > > > > > > - fw scheduler hardware with preemption support. There we
> > > > > > > probably
> > > > > > > want to
> > > > > > > =C2=A0=C2=A0 nuke the context by setting the tdr timeout to z=
ero
> > > > > > > (or
> > > > > > > maybe just
> > > > > > > as
> > > > > > > =C2=A0=C2=A0 long as context preemption takes to be efficient=
), and
> > > > > > > relying on
> > > > > > > the
> > > > > > > =C2=A0=C2=A0 normal gpu reset flow to handle things.
> > > > > > > drm_sched_entity_flush
> > > > > > > kinda
> > > > > > > =C2=A0=C2=A0 does this, except not really and it's a lot more
> > > > > > > focused
> > > > > > > on
> > > > > > > the
> > > > > > > =C2=A0=C2=A0 ringbuffer context. So maybe we want a new
> > > > > > > drm_sched_entity_kill.
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0 For this case calling drm_sched_fini() after the=
 1:1
> > > > > > > entity
> > > > > > > is gone
> > > > > > > =C2=A0=C2=A0 should not find any linger jobs, it would actual=
ly be
> > > > > > > a
> > > > > > > bug
> > > > > > > somewhere if
> > > > > > > =C2=A0=C2=A0 there's a job lingering. Maybe a sanity check th=
at
> > > > > > > there's
> > > > > > > not just
> > > > > > > no
> > > > > > > =C2=A0=C2=A0 jobs lingering, but also no entity left would be=
 good
> > > > > > > here?
> > > > > > The check for lingering ones is in Christian's patch here
> > > > > > IISC.
> > > > > > At which position would you imagine the check for the
> > > > > > entity
> > > > > > being
> > > > > > performed?
> > > > > >=20
> > > > > > > - fw scheduler without preemption support. There we kinda
> > > > > > > need
> > > > > > > the
> > > > > > > =C2=A0=C2=A0 drm_sched_flush, except blocking in fops->close =
is not
> > > > > > > great. So
> > > > > > > instead
> > > > > > > =C2=A0=C2=A0 I think the following is better:
> > > > > > > =C2=A0=C2=A0 1. drm_sched_entity_stopped, which only stops ne=
w
> > > > > > > submissions (for
> > > > > > > =C2=A0=C2=A0 paranoia) but doesn't tear down the entity
> > > > > > Who would call that function?
> > > > > > Drivers using it voluntarily could just as well stop
> > > > > > accepting
> > > > > > new jobs
> > > > > > from userspace to their entities, couldn't they?
> > > > > >=20
> > > > > > > =C2=A0=C2=A0 2. drm_dev_get
> > > > > > > =C2=A0=C2=A0 3. launch a worker which does a) drm_sched_flush=
 (or
> > > > > > > =C2=A0=C2=A0 drm_sched_entity_flush or whatever we call it) b=
)
> > > > > > > drm_sched_entity_fini
> > > > > > > =C2=A0=C2=A0 + drm_sched_fini c) drm_dev_put
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0 Note that semantically this implements the refco=
unt in
> > > > > > > the
> > > > > > > other
> > > > > > > path
> > > > > > > =C2=A0=C2=A0 from Phillip:
> > > > > > >=20
> > > > > > > https://lore.kernel.org/all/20240903094531.29893-2-pstanner@r=
edhat.com/
> > > > > > > =C2=A0=C2=A0 Except it doesn't impose refcount on everyone el=
se who
> > > > > > > doesn't need
> > > > > > > it,
> > > > > > > =C2=A0=C2=A0 and it doesn't even impose refcounting on driver=
s that
> > > > > > > do
> > > > > > > need it
> > > > > > > =C2=A0=C2=A0 because we use drm_sched_flush and a worker to a=
chieve
> > > > > > > the
> > > > > > > same.
> > > > > > I indeed wasn't happy with the refcount approach for that
> > > > > > reason,
> > > > > > agreed.
> > > > > >=20
> > > > > > > Essentially helper functions for the common use-cases
> > > > > > > instead
> > > > > > > of
> > > > > > > trying to
> > > > > > > solve them all by putting drm_sched_flush as a
> > > > > > > potentially
> > > > > > > very
> > > > > > > blocking
> > > > > > > function into drm_sched_fini.
> > > > > > I'm still not able to see why it blocking would be
> > > > > > undesired =E2=80=93
> > > > > > as
> > > > > > far
> > > > > > as I can see, it is only invoked on driver teardown, so not
> > > > > > during
> > > > > > active operation. Teardown doesn't happen that often, and
> > > > > > it
> > > > > > can
> > > > > > (if
> > > > > > implemented correctly) only block until the driver's code
> > > > > > has
> > > > > > signaled
> > > > > > the last fences. If that doesn't happen, the block would
> > > > > > reveal
> > > > > > a
> > > > > > bug.
> > > > > >=20
> > > > > > But don't get me wrong: I don't want to *push* this
> > > > > > solution. I
> > > > > > just
> > > > > > want to understand when it could become a problem.
> > > > > >=20
> > > > > >=20
> > > > > > Wouldn't an explicitly blocking, separate function like
> > > > > > drm_sched_flush() or drm_sched_fini_flush() be a small,
> > > > > > doable
> > > > > > step
> > > > > > towards the right direction?
> > > > >=20
> > > > > I think that this is the right thing to do, yes.
> > > > >=20
> > > > > > > > > > > > When there are still entities with jobs the
> > > > > > > > > > > > situation
> > > > > > > > > > > > is
> > > > > > > > > > > > even
> > > > > > > > > > > > worse
> > > > > > > > > > > > since the dma_fences for those jobs can never
> > > > > > > > > > > > signal
> > > > > > > > > > > > we can
> > > > > > > > > > > > just
> > > > > > > > > > > > choose between potentially locking up core
> > > > > > > > > > > > memory
> > > > > > > > > > > > management and
> > > > > > > > > > > > random memory corruption. When drivers really
> > > > > > > > > > > > mess
> > > > > > > > > > > > it
> > > > > > > > > > > > up
> > > > > > > > > > > > that
> > > > > > > > > > > > well
> > > > > > > > > > > > let them run into a BUG_ON().
> > > > > > > > > > > >=20
> > > > > > > > > > > > Signed-off-by: Christian
> > > > > > > > > > > > K=C3=B6nig<christian.koenig@amd.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/s=
ched_main.c | 19
> > > > > > > > > > > > ++++++++++++++++++-
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A01 file changed, 18 insertio=
ns(+), 1
> > > > > > > > > > > > deletion(-)
> > > > > > > > > > > >=20
> > > > > > > > > > > > diff --git
> > > > > > > > > > > > a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > index f093616fe53c..8a46fab5cdc8 100644
> > > > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > @@ -1333,17 +1333,34 @@ void
> > > > > > > > > > > > drm_sched_fini(struct
> > > > > > > > > > > > drm_gpu_scheduler
> > > > > > > > > > > > *sched)
> > > > > > > > > > > I agree with Sima that it should first be
> > > > > > > > > > > documented
> > > > > > > > > > > in
> > > > > > > > > > > the
> > > > > > > > > > > function's
> > > > > > > > > > > docstring what the user is expected to have done
> > > > > > > > > > > before
> > > > > > > > > > > calling the
> > > > > > > > > > > function.
> > > > > > > > > > Good point, going to update the documentation as
> > > > > > > > > > well.
> > > > > > > > > Cool thing, thx.
> > > > > > > > > Would be great if everything (not totally trivial)
> > > > > > > > > necessary to
> > > > > > > > > be done
> > > > > > > > > before _fini() is mentioned.
> > > > > > > > >=20
> > > > > > > > > One could also think about providing a hint at how
> > > > > > > > > the
> > > > > > > > > driver can
> > > > > > > > > do
> > > > > > > > > that. AFAICS the only way for the driver to ensure
> > > > > > > > > that
> > > > > > > > > is
> > > > > > > > > to
> > > > > > > > > maintain
> > > > > > > > > its own, separate list of submitted jobs.
> > > > > > > > Even with a duplicated pending list it's actually
> > > > > > > > currently
> > > > > > > > impossible to do
> > > > > > > > this fully cleanly.
> > > > > > > >=20
> > > > > > > > The problem is that the dma_fence object gives no
> > > > > > > > guarantee
> > > > > > > > when
> > > > > > > > callbacks
> > > > > > > > are processed, e.g. they can be both processed from
> > > > > > > > interrupt
> > > > > > > > context as
> > > > > > > > well as from a CPU which called
> > > > > > > > dma_fence_is_signaled().
> > > > > > > >=20
> > > > > > > > So when a driver (or drm_sched_fini) waits for the last
> > > > > > > > submitted
> > > > > > > > fence it
> > > > > > > > actually can be that the drm_sched object still needs
> > > > > > > > to do
> > > > > > > > some
> > > > > > > > processing.
> > > > > > > > See the hack in amdgpu_vm_tlb_seq() for more background
> > > > > > > > on
> > > > > > > > the
> > > > > > > > problem.
> > > > > > Oh dear ^^'
> > > > > > We better work towards fixing that centrally
> > > > > >=20
> > > > > > Thanks,
> > > > > > P.
> > > > > >=20
> > > > > >=20
> > > > > > > So I thought this should be fairly easy because of the
> > > > > > > sched
> > > > > > > hw/public
> > > > > > > fence split: If we wait for both all jobs to finish and
> > > > > > > for
> > > > > > > all
> > > > > > > the
> > > > > > > sched
> > > > > > > work/tdr work to finish, and we make sure there's no
> > > > > > > entity
> > > > > > > existing
> > > > > > > that's not yet stopped we should catch them all?
> > > > >=20
> > > > > Unfortunately not.
> > > > >=20
> > > > > Even when you do a dma_fence_wait() on the last submission it
> > > > > can
> > > > > still be
> > > > > that another CPU is executing the callbacks to wake up the
> > > > > scheduler work
> > > > > item and cleanup the job.
> > > > >=20
> > > > > That's one of the reasons why I think the design of keeping
> > > > > the
> > > > > job
> > > > > alive is
> > > > > so extremely awkward. The dma_fence as representation of the
> > > > > hw
> > > > > submission
> > > > > has a much better defined state machine and lifetime.
> > > > >=20
> > > > > Regards,
> > > > > Christian.
> > > > >=20
> > > > > > > =C2=A0 Or at least I think
> > > > > > > it's
> > > > > > > a bug if any other code even tries to touch the hw fence.
> > > > > > >=20
> > > > > > > If you have any other driver code which relies on the rcu
> > > > > > > freeing
> > > > > > > then I
> > > > > > > think that's just a separate concern and we can ignore
> > > > > > > that
> > > > > > > here
> > > > > > > since the
> > > > > > > fences themselves will till get rcu-delay freed even if
> > > > > > > drm_sched_fini has
> > > > > > > finished.
> > > > > > > -Sima
> > > > > > >=20
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > >=20
> > > > > > > > > P.
> > > > > > > > >=20
> > > > > > > > > > Thanks,
> > > > > > > > > > Christian.
> > > > > > > > > >=20
> > > > > > > > > > > P.
> > > > > > > > > > >=20
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_wqueue_stop(sche=
d);
> > > > > > > > > > > > + /*
> > > > > > > > > > > > + * Tearing down the scheduler wile there are
> > > > > > > > > > > > still
> > > > > > > > > > > > unprocessed jobs can
> > > > > > > > > > > > + * lead to use after free issues in the
> > > > > > > > > > > > scheduler
> > > > > > > > > > > > fence.
> > > > > > > > > > > > + */
> > > > > > > > > > > > + WARN_ON(!list_empty(&sched->pending_list));
> > > > > > > > > > > > +
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D DRM_SCHED_PRIOR=
ITY_KERNEL; i <
> > > > > > > > > > > > sched-
> > > > > > > > > > > > > num_rqs;
> > > > > > > > > > > > i++)
> > > > > > > > > > > > {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq =
=3D sched-
> > > > > > > > > > > > > sched_rq[i];
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&rq->lock);
> > > > > > > > > > > > - list_for_each_entry(s_entity, &rq-
> > > > > > > > > > > > > entities,
> > > > > > > > > > > > list)
> > > > > > > > > > > > + list_for_each_entry(s_entity, &rq-
> > > > > > > > > > > > > entities,
> > > > > > > > > > > > list) {
> > > > > > > > > > > > + /*
> > > > > > > > > > > > + * The justification for this
> > > > > > > > > > > > BUG_ON()
> > > > > > > > > > > > is
> > > > > > > > > > > > that tearing
> > > > > > > > > > > > + * down the scheduler while jobs
> > > > > > > > > > > > are
> > > > > > > > > > > > pending
> > > > > > > > > > > > leaves
> > > > > > > > > > > > + * dma_fences unsignaled. Since we
> > > > > > > > > > > > have
> > > > > > > > > > > > dependencies
> > > > > > > > > > > > + * from the core memory management
> > > > > > > > > > > > to
> > > > > > > > > > > > eventually signal
> > > > > > > > > > > > + * dma_fences this can trivially
> > > > > > > > > > > > lead to
> > > > > > > > > > > > a
> > > > > > > > > > > > system wide
> > > > > > > > > > > > + * stop because of a locked up
> > > > > > > > > > > > memory
> > > > > > > > > > > > management.
> > > > > > > > > > > > + */
> > > > > > > > > > > > + BUG_ON(spsc_queue_count(&s_entity-
> > > > > > > > > > > > > job_queue));
> > > > > > > > > > > > +
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 * Prevents reinsertion and=
 marks
> > > > > > > > > > > > job_queue
> > > > > > > > > > > > as idle,
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 * it will removed from rq =
in
> > > > > > > > > > > > drm_sched_entity_fini
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 * eventually
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 s_entity->stopped =3D true=
;
> > > > > > > > > > > > + }
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&rq->lock);
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 kfree(sched->sched_rq[i]);
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > >=20
> >=20
>=20

