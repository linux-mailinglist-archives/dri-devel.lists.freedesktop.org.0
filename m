Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1879CF10B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333E210E0A3;
	Fri, 15 Nov 2024 16:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q76J4QgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C1C10E2D8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731686843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV05fB9NSBIzBCsCdWKB/DZd6fRxV34ifCANflnm1wg=;
 b=Q76J4QgEv2/AsS5GztUWKCmUUSMXIjCf0UYykkK3VZdUfRF47qRiUu837/ETlHrwuXr21m
 F97BSbKFEYPgnGoq2Dtyzhd+e/1lLq+MPR/MXqAjvr+L9oG8vxeaiW2jjX9B8LzE2VGPVd
 VBJcUhdlxbF+0sHWy3IKuDIZ/nL81Ug=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-ikQ-tKdFOkerxlD7Fm6Cyw-1; Fri, 15 Nov 2024 11:07:20 -0500
X-MC-Unique: ikQ-tKdFOkerxlD7Fm6Cyw-1
X-Mimecast-MFC-AGG-ID: ikQ-tKdFOkerxlD7Fm6Cyw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4315b7b0c16so14938065e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 08:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686839; x=1732291639;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RV05fB9NSBIzBCsCdWKB/DZd6fRxV34ifCANflnm1wg=;
 b=N+jbT83kkDPu+Rig69laNEN7/Zs1sEQGmwFydHY+iV3hkX/XJI+0RzUCpDmhfatmBP
 +KfMhuU+Enens0b03O40MftHE+R/E2Pl3KJE8G5/Vi6z9mQsokbMys+DXdtqVlv3mPDK
 frQVJGB1ElXCa5kom8NTSKw2Wa0/+NdX4f2hIBWmRCA+rSHX7YTV6/xaVZptZYd+RWrc
 XS5/Med6J8EJycm8XlwE4ppKvC0bginTyBD4LJi7KiALTnZ/KxhjGXLMRDU1jwDmZ6DZ
 4BbkmPAFRczcQcRg3ZeP9gO3v2XxEbgA5Xj0y1JMoW8QSKYFSd4s7wVZSw30FeuYLsm/
 r5XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmsRd4HeVOkNAsVF6JyKKCHy77Q/eJw9uP9/LkGSEdmgs6YHvDxiL2zswFZVLYSjtSQBmJtI/eeJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/9Sj4LosTrhjWC4nWJMXyZalxP2IdPBymTMGAhZVJjYOfdLCJ
 jQ4UHmUpbPXplo6gDEzrPopmnAE4xO6T52i62IvKwtPC/SoxpkRiVO74Y9S70dx4pMidIDpvpvu
 XT1N2ezconMKiBj8rJyOyV1DEsAO5yDgqzFEf21GmqyrpKDGTHWqwpkS/Rw1W/ULvQg==
X-Received: by 2002:a05:600c:3ca3:b0:42c:de34:34be with SMTP id
 5b1f17b1804b1-432df72127fmr29455875e9.3.1731686839173; 
 Fri, 15 Nov 2024 08:07:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX0ZSMwC7xP2w+C/jScbgmpFtAzetQNig4uuV+TOEXeu5FHuyt2Tg8n3FgcZ31Cx620fIvIw==
X-Received: by 2002:a05:600c:3ca3:b0:42c:de34:34be with SMTP id
 5b1f17b1804b1-432df72127fmr29455455e9.3.1731686838760; 
 Fri, 15 Nov 2024 08:07:18 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adbbcbcsm4820255f8f.48.2024.11.15.08.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 08:07:08 -0800 (PST)
Message-ID: <85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 ltuikov89@gmail.com, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 15 Nov 2024 17:07:04 +0100
In-Reply-To: <d103054f-7331-4b00-8105-3e88fdab0486@amd.com>
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
 <4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com>
 <d103054f-7331-4b00-8105-3e88fdab0486@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JU-HtZ8wW4_8jiBhJ3p7HcvItQQvVaE2eYAdc_t37J8_1731686839
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

On Fri, 2024-11-15 at 15:39 +0100, Christian K=C3=B6nig wrote:
> =C2=A0Am 15.11.24 um 14:55 schrieb Philipp Stanner:
> =C2=A0
> > [SNIP]=20
> > > =C2=A0
> > > A good bunch of the problems we have here are caused by abusing
> > > the
> > > job=20
> > > as state for executing the submission on the hardware.
> > >=20
> > > The original design idea of the scheduler instead was to only
> > > have
> > > the=20
> > > job as intermediate state between submission and picking what to
> > > execute=20
> > > next. E.g. the scheduler in that view is just a pipeline were you
> > > push=20
> > > jobs in on one end and jobs come out on the other end.
> > > =C2=A0
> > =C2=A0
> > So let's get a bit more precise about this:
> > =C2=A0=C2=A0=C2=A01. Driver enqueues with drm_sched_job_arm()
> > =C2=A0=C2=A0=C2=A02. job ends up in pending_list
> > =C2=A0=C2=A0=C2=A03. Sooner or later scheduler calls run_job()
> > =C2=A0=C2=A0=C2=A04. Job is pushed to hardware
> > =C2=A0=C2=A0=C2=A05. Fence gets signaled
> > =C2=A0=C2=A0=C2=A06. ???
> >=20
> > What would the "come out on the other end" part you describe look
> > like?
> >=20
> > How would jobs get removed from pending_list and, accordingly, how
> > would we avoid leaks?
> > =C2=A0
> =C2=A0
> =C2=A0Let me describe the full solution a bit further down.
> =C2=A0
> =C2=A0
> =C2=A0
> > =C2=A0
> > > =C2=A0
> > > In that approach the object which represents the hardware
> > > execution
> > > is=20
> > > the dma_fence instead of the job. And the dma_fence has a well
> > > defined=20
> > > lifetime, error handling, etc...
> > >=20
> > > So when we go back to this original approach it would mean that
> > > we
> > > don't=20
> > > need to wait for any cleanup because the scheduler wouldn't be
> > > involved=20
> > > in the execution of the jobs on the hardware any more.
> > > =C2=A0
> > =C2=A0
> > It would be involved (to speak precisely) in the sense of the
> > scheduler
> > still being the one who pushes the job onto the hardware, agreed?
> > =C2=A0
> =C2=A0
> =C2=A0Yes, exactly.
> =C2=A0
> =C2=A0See in the original design the "job" wasn't even a defined
> structure, but rather just a void*.
> =C2=A0
> =C2=A0So basically what the driver did was telling the scheduler here I
> have a bunch of different void* please tell me which one to run
> first.
> =C2=A0
> =C2=A0And apart from being this identifier this void* had absolutely no
> meaning for the scheduler.

Interesting..

> =C2=A0
> > > =C2=A0
> > > The worst thing that could happen is that the driver messes
> > > things up
> > > and still has not executed job in an entity,
> > > =C2=A0
> > =C2=A0
> > I can't fully follow.
> >=20
> > So in your mind, the driver would personally set the dma_fence
> > callback
> > and hereby be informed about the job being completed, right?
> > =C2=A0
> =C2=A0
> =C2=A0No. The run_job callback would still return the hw fence so that th=
e
> scheduler can install the callback and so gets informed when the next
> job could be run.
> =C2=A0
> =C2=A0
> > =C2=A0
> > But you wouldn't want to aim for getting rid of struct
> > drm_sched_job
> > completely, or would you?
> > =C2=A0
> =C2=A0
> =C2=A0No, the drm_sched_job structure was added to aid the single produce=
r
> single consumer queue and so made it easier to put the jobs into a
> container.
> =C2=A0
> =C2=A0
> =C2=A0In my mind the full solution for running jobs looks like this:
> =C2=A0
> =C2=A01. Driver enqueues with drm_sched_job_arm()
> =C2=A02. job ends up in pending_list
> =C2=A03. Sooner or later scheduler calls run_job()
> =C2=A04. In return scheduler gets a dma_fence representing the resulting
> hardware operation.
> =C2=A05, This fence is put into a container to keep around what the hw is
> actually executing.
> =C2=A06. At some point the fence gets signaled informing the scheduler
> that the next job can be pushed if enough credits are now available.
> =C2=A0
> =C2=A0There is no free_job callback any more because after run_job is
> called the scheduler is done with the job and only the dma_fence
> which represents the actually HW operation is the object the
> scheduler now works with.
> =C2=A0
> =C2=A0We would still need something like a kill_job callback which is use=
d
> when an entity is released without flushing all jobs (see
> drm_sched_entity_kill()), but that is then only used for a specific
> corner case.

Can't we just limit the scheduler's responsibility to telling the
driver that it has to flush, and if it doesn't it's a bug?
=C2=A0
> =C2=A0Blocking for the cleanup in drm_sched_fini() then becomes a trivial
> dma_fence_wait() on the remaining unsignaled HW fences and eventually
> on the latest killed fence.

But that results in exactly the same situation as my waitque solution,
doesn't it?

Blocking infinitely in drm_sched_fini():

If the driver doesn't guarantee that all fences will get signaled, then
wait_event() in the waitque solution will block forever. The same with
dma_fence_wait().

Or are you aiming at an interruptible dma_fence_wait(), thereby not
blocking SIGKILL?

That then would still result in leaks. So basically the same situation
as with an interruptible drm_sched_flush() function.

(Although I agree that would probably be more elegant)

> =C2=A0
> =C2=A0The problem with this approach is that the idea of re-submitting
> jobs in a GPU reset by the scheduler is then basically dead. But to
> be honest that never worked correctly.
> =C2=A0
> =C2=A0See the deprecated warning I already put on
> drm_sched_resubmit_jobs(). The job lifetime is not really well
> defined because of this, see the free_guilty hack as well.

drm_sched_resubmit_jobs() is being used by 5 drivers currently. So if
we go for this approach we have to port them, first. That doesn't sound
trivial to me


P.

> =C2=A0
> =C2=A0Regards,
> =C2=A0Christian.
> =C2=A0
> =C2=A0
> > =C2=A0
> >=20
> >=20
> > Gr=C3=BC=C3=9Fe,
> > P.
> >=20
> > =C2=A0
> =C2=A0

