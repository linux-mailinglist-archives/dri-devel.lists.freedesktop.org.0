Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9551A9CE0B7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 14:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E567B10E05B;
	Fri, 15 Nov 2024 13:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QN2sHPho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383F810E05B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731678938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEU/qz61S2zMoICHi+8cATKMNx90UwDN0vOc6AIbVmw=;
 b=QN2sHPhoHmiDX0F1+Xm/YDSbMJ0H/4ylyyQ+AzbvEausHWIfX1Gs4c8KGgkEfJe3O98GxF
 XyQ1foOP1u9XOqQ4Z7e1NtXdUnMLr7MXgXj1auGWw9eFRV5FFnQs+yj+hvSqhYS4igwlGi
 Cy6yOEkE4xJz9nrbnn6z9G3kDxhPxnA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-rj6Na0QfMM6SWgsjPcjjsg-1; Fri, 15 Nov 2024 08:55:37 -0500
X-MC-Unique: rj6Na0QfMM6SWgsjPcjjsg-1
X-Mimecast-MFC-AGG-ID: rj6Na0QfMM6SWgsjPcjjsg
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4314c6ca114so5102235e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 05:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731678936; x=1732283736;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZEU/qz61S2zMoICHi+8cATKMNx90UwDN0vOc6AIbVmw=;
 b=h5GQzhDwnDob+OqsJbO34cAvFlDYfCGwYuJp/Ti5YCd3pjMApdbOKXm73WMcjYZGDr
 NRBSMpFph8JmR1d0TApaUuR6klrS494vCufQfDwyfEDPDpnTAwtk80YL6OlVJk3zHNBn
 yDt+Kw/G/30raJaSYFp4FgtP/h5ptvFhsRTnPo1i7xbcoC37L7HoSbMOAF9iZnPJY3nT
 WqUJl6RY3zp+w1C8EQz+OWRZq6is83KdN1m3IQXglEh3woYu6BXwEtmI1vlWhH9TqwKW
 TfrCOBbn/x8UJ9xJbPfAArUnBcnplQ/znxcCV1poAuLXdUnh2afwpfIvPkQhJ1FULoW+
 zOyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC0K34/XcOjAQrh/99PnkUlI5HwAPfzQOmuFJEjiKnrNLJgxK2hOIsTRYjt1qTo6sFQyD5bmkqRTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzft5hHJEzbKDyCJz9ZmQxBFwteJylJrGRv1PCuv+PYBIkdDQRA
 P91TU6GTym3iSDNz+51yMEj9lBmB9ex16j99nNyPdePoxmrrL8P5I9NZ5pC6TsrNO4FBieoNKOi
 ip+QdKU+AiZiv0yfjUO6SQgYCfXTebEI8mZ1+n1lgsRT06gq/3z6+3GOMGhdQ6RlZTg==
X-Received: by 2002:a05:600c:a06:b0:430:582f:3a9d with SMTP id
 5b1f17b1804b1-432df78b07bmr19284905e9.26.1731678935464; 
 Fri, 15 Nov 2024 05:55:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEP+z6wk1VflMBpxAVEl2a4mlG7lT9Dn5Uj2M+qx6vqvylYLJrdhqFVkQP1hs/fRySOgx8mYw==
X-Received: by 2002:a05:600c:a06:b0:430:582f:3a9d with SMTP id
 5b1f17b1804b1-432df78b07bmr19284675e9.26.1731678934915; 
 Fri, 15 Nov 2024 05:55:34 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da265c45sm58016075e9.11.2024.11.15.05.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 05:55:34 -0800 (PST)
Message-ID: <4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 ltuikov89@gmail.com, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 15 Nov 2024 14:55:33 +0100
In-Reply-To: <32fdb74a-00c5-489c-b561-c530d23c4098@amd.com>
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
 <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
 <a2ef4cdfeb31ad95de9311274de73a51cdc54a97.camel@redhat.com>
 <64c478a7-0afb-4b9b-8a7a-6e204a79cc20@gmail.com> <Zw0xHB_UNOvRq0L7@pollux>
 <6b656a2e199d1fa1d33684572a93e327cba0ae83.camel@redhat.com>
 <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
 <32fdb74a-00c5-489c-b561-c530d23c4098@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m6oEZYF76CMW0sWzFMg7rLxvKzMpxHA2mfrOQjIcCGs_1731678936
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

On Fri, 2024-11-15 at 12:26 +0100, Christian K=C3=B6nig wrote:
> Interesting, those mails just showed up in my inbox as unread. More
> than=20
> 14 days after you send it.
>=20
> So sorry for the late reply.

I smell google mail :p

>=20
> Am 29.10.24 um 08:22 schrieb Philipp Stanner:
> > Christian, Sima?
> >=20
> > Matthew? (+CC)
> >=20
> > Opinions on the below?
> >=20
> > tl;dr:
> > I still think it's a good thing to detectably block in
> > drm_sched_fini(), or at the very least drm_sched_flush(), because
> > then
> > you'll find out that the driver is broken and can repair it.
>=20
> As discussed in private mail as well, the third option not mentioned
> so=20
> far is to completely drop the free_job callback.

If it's really possible to do that I think this sounds like a great
solution at first glance because we could decrease complexity quite
substantially.

>=20
> A good bunch of the problems we have here are caused by abusing the
> job=20
> as state for executing the submission on the hardware.
>=20
> The original design idea of the scheduler instead was to only have
> the=20
> job as intermediate state between submission and picking what to
> execute=20
> next. E.g. the scheduler in that view is just a pipeline were you
> push=20
> jobs in on one end and jobs come out on the other end.

So let's get a bit more precise about this:
   1. Driver enqueues with drm_sched_job_arm()
   2. job ends up in pending_list
   3. Sooner or later scheduler calls run_job()
   4. Job is pushed to hardware
   5. Fence gets signaled
   6. ???

What would the "come out on the other end" part you describe look like?

How would jobs get removed from pending_list and, accordingly, how
would we avoid leaks?

>=20
> In that approach the object which represents the hardware execution
> is=20
> the dma_fence instead of the job. And the dma_fence has a well
> defined=20
> lifetime, error handling, etc...
>=20
> So when we go back to this original approach it would mean that we
> don't=20
> need to wait for any cleanup because the scheduler wouldn't be
> involved=20
> in the execution of the jobs on the hardware any more.

It would be involved (to speak precisely) in the sense of the scheduler
still being the one who pushes the job onto the hardware, agreed?

>=20
> The worst thing that could happen is that the driver messes things up
> and still has not executed job in an entity,

I can't fully follow.

So in your mind, the driver would personally set the dma_fence callback
and hereby be informed about the job being completed, right?

But you wouldn't want to aim for getting rid of struct drm_sched_job
completely, or would you?


Gr=C3=BC=C3=9Fe,
P.


> but in that case we could
> just warn, block for the hardware fence and then kill all pending=20
> submissions with an error.- And this blocking on the hardware fence=20
> can't deadlock because we know that it is a hardware fence with
> certain=20
> properties and not some random free_job callback where we don't have
> any=20
> idea what locks the driver need.
>=20
> Regards,
> Christian.
>=20
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
> > > > > Correct, the question is how to avoid that.
> > > > >=20
> > > > > > If so, what are the disadvantages of waiting in
> > > > > > drm_sched_fini()?
> > > > > > We
> > > > > > could block buggy drivers as I see it. Which wouldn't be
> > > > > > good,
> > > > > > but
> > > > > > could then be fixed on drivers' site.
> > > > > Sima explained that pretty well: Don't block in fops->close,
> > > > > do
> > > > > that in
> > > > > fops->flush instead.
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
> > > Having thought about it, I agree with Danilo. Having something
> > > that
> > > shall wait on green light, but can be interrupted, is no
> > > guarantee
> > > and
> > > therefore not a feasible solution.
> > >=20
> > > To break down the solution space, these seem to be our options:
> > > =C2=A0=C2=A0=C2=A0 1. We have something (either drm_sched_fini() or a=
 helper,
> > > e.g.,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_flush()) that definite=
ly blocks until the
> > > pending
> > > list
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has become empty.
> > > =C2=A0=C2=A0=C2=A0 2. We have jobs reference-count the scheduler, so =
the latter
> > > can
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 outlive the driver and will be f=
reed some time later.
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
> > > > > > > =C2=A0=C2=A0=C2=A0 drm_sched_fini is called long after all th=
e entities
> > > > > > > are
> > > > > > > gone in
> > > > > > > =C2=A0=C2=A0=C2=A0 drm_device cleanup.
> > > > > > >=20
> > > > > > > - fw scheduler hardware with preemption support. There we
> > > > > > > probably
> > > > > > > want to
> > > > > > > =C2=A0=C2=A0=C2=A0 nuke the context by setting the tdr timeou=
t to zero
> > > > > > > (or
> > > > > > > maybe just
> > > > > > > as
> > > > > > > =C2=A0=C2=A0=C2=A0 long as context preemption takes to be eff=
icient),
> > > > > > > and
> > > > > > > relying on
> > > > > > > the
> > > > > > > =C2=A0=C2=A0=C2=A0 normal gpu reset flow to handle things.
> > > > > > > drm_sched_entity_flush
> > > > > > > kinda
> > > > > > > =C2=A0=C2=A0=C2=A0 does this, except not really and it's a lo=
t more
> > > > > > > focused
> > > > > > > on
> > > > > > > the
> > > > > > > =C2=A0=C2=A0=C2=A0 ringbuffer context. So maybe we want a new
> > > > > > > drm_sched_entity_kill.
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0 For this case calling drm_sched_fini() aft=
er the 1:1
> > > > > > > entity
> > > > > > > is gone
> > > > > > > =C2=A0=C2=A0=C2=A0 should not find any linger jobs, it would =
actually be
> > > > > > > a
> > > > > > > bug
> > > > > > > somewhere if
> > > > > > > =C2=A0=C2=A0=C2=A0 there's a job lingering. Maybe a sanity ch=
eck that
> > > > > > > there's
> > > > > > > not just
> > > > > > > no
> > > > > > > =C2=A0=C2=A0=C2=A0 jobs lingering, but also no entity left wo=
uld be good
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
> > > > > > > =C2=A0=C2=A0=C2=A0 drm_sched_flush, except blocking in fops->=
close is
> > > > > > > not
> > > > > > > great. So
> > > > > > > instead
> > > > > > > =C2=A0=C2=A0=C2=A0 I think the following is better:
> > > > > > > =C2=A0=C2=A0=C2=A0 1. drm_sched_entity_stopped, which only st=
ops new
> > > > > > > submissions (for
> > > > > > > =C2=A0=C2=A0=C2=A0 paranoia) but doesn't tear down the entity
> > > > > > Who would call that function?
> > > > > > Drivers using it voluntarily could just as well stop
> > > > > > accepting
> > > > > > new jobs
> > > > > > from userspace to their entities, couldn't they?
> > > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0 2. drm_dev_get
> > > > > > > =C2=A0=C2=A0=C2=A0 3. launch a worker which does a) drm_sched=
_flush (or
> > > > > > > =C2=A0=C2=A0=C2=A0 drm_sched_entity_flush or whatever we call=
 it) b)
> > > > > > > drm_sched_entity_fini
> > > > > > > =C2=A0=C2=A0=C2=A0 + drm_sched_fini c) drm_dev_put
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0 Note that semantically this implements the=
 refcount
> > > > > > > in the
> > > > > > > other
> > > > > > > path
> > > > > > > =C2=A0=C2=A0=C2=A0 from Phillip:
> > > > > > >=20
> > > > > > > https://lore.kernel.org/all/20240903094531.29893-2-pstanner@r=
edhat.com/
> > > > > > > =C2=A0=C2=A0=C2=A0 Except it doesn't impose refcount on every=
one else
> > > > > > > who
> > > > > > > doesn't need
> > > > > > > it,
> > > > > > > =C2=A0=C2=A0=C2=A0 and it doesn't even impose refcounting on =
drivers
> > > > > > > that do
> > > > > > > need it
> > > > > > > =C2=A0=C2=A0=C2=A0 because we use drm_sched_flush and a worke=
r to
> > > > > > > achieve the
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
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/sched=
uler/sched_main.c |
> > > > > > > > > > > > 19
> > > > > > > > > > > > ++++++++++++++++++-
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 file changed, 18 in=
sertions(+), 1
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
> > > > > > > =C2=A0=C2=A0 Or at least I think
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
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_wqueue_sto=
p(sched);
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
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D DRM_SCHED=
_PRIORITY_KERNEL; i <
> > > > > > > > > > > > sched-
> > > > > > > > > > > > > num_rqs;
> > > > > > > > > > > > i++)
> > > > > > > > > > > > {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq =
*rq =3D sched-
> > > > > > > > > > > > > sched_rq[i];
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&rq->lock)=
;
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
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Prevents reinserti=
on and marks
> > > > > > > > > > > > job_queue
> > > > > > > > > > > > as idle,
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it will removed fr=
om rq in
> > > > > > > > > > > > drm_sched_entity_fini
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * eventually
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s_entity->stopped =
=3D true;
> > > > > > > > > > > > + }
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&rq->loc=
k);
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(sched->sched_r=
q[i]);
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20

