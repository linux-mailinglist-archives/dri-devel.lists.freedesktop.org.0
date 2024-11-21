Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE89D4982
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 10:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1530810E8AF;
	Thu, 21 Nov 2024 09:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="akIX9WGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BEF10E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732180021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdh+cymdYwP6r7tTjAV+/HuRb6eOdc2lGLNCtNDxNBc=;
 b=akIX9WGo0ZAviITnYvlYX6p+LisqoYZjRYVGKb8SXrEpA7eb3MPaclKOY59fRIVJcl3f4k
 1O4CIuo41GtlQUshps+/OZPK8LRGILCX2E85AhvjjeOKpBHyw5bRcqlf5UtSFsnkU4TG8s
 BWFAclFG8iNgnemdEvOC0TFuc6Deow4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-W8GM-y9JOJ2sHM8ahAULfA-1; Thu, 21 Nov 2024 04:06:57 -0500
X-MC-Unique: W8GM-y9JOJ2sHM8ahAULfA-1
X-Mimecast-MFC-AGG-ID: W8GM-y9JOJ2sHM8ahAULfA
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a9e0574854dso56734666b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 01:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732180016; x=1732784816;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hdh+cymdYwP6r7tTjAV+/HuRb6eOdc2lGLNCtNDxNBc=;
 b=NPO0dN4iuC+yy4MTw8l9gJFtcEBDWdXAeJ8pNfMQZcg+KGX7zZc2oTCDAYU8BKz70e
 LHBAmSf9xP4nqYqByqHH3tB0FtA0eJ2EkBh4ZNc8U3iSgDS1shAr4yUiXqcplXBkqjJB
 wfLKtoRvD0GJhiwll+82blaRKFGoMNAjTCv6BY3z5xaYYxKIh8Z6WIA5RlNyS9oG+VNU
 3+RLVn03VMHPk8wfwlBEs+oGNUb3PEM3SmVJq62Rxc6u0TwszVEj9Xai5OHy49zVBUPb
 vUpuDZSrymSYwrok+gEul6AfL5G8cKu2/kcQVCUQF1plsSl8qfBsL3N0aSnszwSz74B5
 OeqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLWfHjOdl8P6cJB68izi+jvOKal9RQOhImu3O//BZCcbBFRCdz4SQFkBCqArZG+YEihFgfGtKV2Qc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznV1yqdDihcl1UmdMC3wMfIhB7QAYqRD84URmtaRFvfjtSgRyM
 mgf2SimeRSBJvImx7Z+rF0GXFOrGdrSo86o/82CYJjQFbCFvJrb3stBqhxGaXEBKbQqwW4L3GBO
 1/bBVkWhptN17X8XbpeFGUbY7G7tTqvLR52wHsKD4cwlh8JPpt+wyVeaaOdmkkeKCpw==
X-Received: by 2002:a17:907:96a1:b0:a9a:3d5b:dc1a with SMTP id
 a640c23a62f3a-aa4dd55043cmr606014366b.15.1732180015935; 
 Thu, 21 Nov 2024 01:06:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZX0dniV5ZjQ9B8nib8zUI9bwBZcrSiCSjSG6bmj+oHwfwbxHm9DzQu+YuoMC7BNj/D3FJoQ==
X-Received: by 2002:a17:907:96a1:b0:a9a:3d5b:dc1a with SMTP id
 a640c23a62f3a-aa4dd55043cmr606011766b.15.1732180015568; 
 Thu, 21 Nov 2024 01:06:55 -0800 (PST)
Received: from ?IPv6:2001:16b8:3db7:3400:37d7:1f36:6e6a:3d66?
 ([2001:16b8:3db7:3400:37d7:1f36:6e6a:3d66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4152ea2sm56897666b.34.2024.11.21.01.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 01:06:55 -0800 (PST)
Message-ID: <a0ed99471ff6d122433e0281036329f6b62d308c.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 ltuikov89@gmail.com, Matthew Brost <matthew.brost@intel.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 21 Nov 2024 10:06:54 +0100
In-Reply-To: <bf44095a-8f31-46c4-8bf5-cf98b4848a76@amd.com>
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
 <85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com>
 <bf44095a-8f31-46c4-8bf5-cf98b4848a76@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kg7y-DgfEWgRW1BRMJVW_Az2vK6pTzB4nGAErIsSpMM_1732180016
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

+CC Thomas Hellstr=C3=B6m


On Mon, 2024-11-18 at 12:48 +0100, Christian K=C3=B6nig wrote:
> =C2=A0Am 15.11.24 um 17:07 schrieb Philipp Stanner:
> =C2=A0
> > =C2=A0
> > On Fri, 2024-11-15 at 15:39 +0100, Christian K=C3=B6nig wrote:
> > =C2=A0
> > > =C2=A0
> > > =C2=A0Am 15.11.24 um 14:55 schrieb Philipp Stanner:
> > > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > > [SNIP]=20
> > > > =C2=A0
> > > =C2=A0
> > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > > But you wouldn't want to aim for getting rid of struct
> > > > drm_sched_job
> > > > completely, or would you?
> > > > =C2=A0
> > > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0No, the drm_sched_job structure was added to aid the single
> > > producer
> > > single consumer queue and so made it easier to put the jobs into
> > > a
> > > container.
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0In my mind the full solution for running jobs looks like this:
> > > =C2=A0
> > > =C2=A01. Driver enqueues with drm_sched_job_arm()
> > > =C2=A02. job ends up in pending_list
> > > =C2=A03. Sooner or later scheduler calls run_job()
> > > =C2=A04. In return scheduler gets a dma_fence representing the
> > > resulting
> > > hardware operation.
> > > =C2=A05, This fence is put into a container to keep around what the h=
w
> > > is
> > > actually executing.
> > > =C2=A06. At some point the fence gets signaled informing the schedule=
r
> > > that the next job can be pushed if enough credits are now
> > > available.
> > > =C2=A0
> > > =C2=A0There is no free_job callback any more because after run_job is
> > > called the scheduler is done with the job and only the dma_fence
> > > which represents the actually HW operation is the object the
> > > scheduler now works with.
> > > =C2=A0
> > > =C2=A0We would still need something like a kill_job callback which is
> > > used
> > > when an entity is released without flushing all jobs (see
> > > drm_sched_entity_kill()), but that is then only used for a
> > > specific
> > > corner case.
> > > =C2=A0
> > =C2=A0
> > Can't we just limit the scheduler's responsibility to telling the
> > driver that it has to flush, and if it doesn't it's a bug?
> > =C2=A0
> =C2=A0
> =C2=A0We still need to remove the pending jobs from the scheduler if
> flushing times out.
> =C2=A0
> =C2=A0Without timing out flushing and/or aborting when the process was
> killed we run into the same problem again that we don't want ti block
> on _fini().
> =C2=A0=C2=A0=20
> > =C2=A0
> > > =C2=A0
> > > =C2=A0Blocking for the cleanup in drm_sched_fini() then becomes a
> > > trivial
> > > dma_fence_wait() on the remaining unsignaled HW fences and
> > > eventually
> > > on the latest killed fence.
> > > =C2=A0
> > =C2=A0
> > But that results in exactly the same situation as my waitque
> > solution,
> > doesn't it?
> > =C2=A0
> =C2=A0
> =C2=A0The key part is that dma_fence's have a documented requirement to
> never block infinitely.
> =C2=A0
> =C2=A0
> > =C2=A0
> > Blocking infinitely in drm_sched_fini():
> >=20
> > If the driver doesn't guarantee that all fences will get signaled,
> > then
> > wait_event() in the waitque solution will block forever. The same
> > with
> > dma_fence_wait().
> >=20
> > Or are you aiming at an interruptible dma_fence_wait(), thereby not
> > blocking SIGKILL?
> > =C2=A0
> =C2=A0
> =C2=A0That is basically what drm_sched_entity_flush() is already doing.
> =C2=A0
> =C2=A0
> > =C2=A0
> > That then would still result in leaks. So basically the same
> > situation
> > as with an interruptible drm_sched_flush() function.
> >=20
> > (Although I agree that would probably be more elegant)
> > =C2=A0
> =C2=A0
> =C2=A0If the wait_event really would just waiting for dma_fences then yes=
.
> =C2=A0
> =C2=A0The problem with the waitqueue approach is that we need to wait for
> the free_job callback and that callback is normally called from a
> work item without holding any additional locks.
> =C2=A0
> =C2=A0When drm_sched_fini starts to block for that we create a rat-tail o=
f
> new dependencies since that one is most likely called from a file
> descriptor destruction.
> =C2=A0=C2=A0
> =C2=A0
> > =C2=A0
> >=20
> > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0The problem with this approach is that the idea of re-submittin=
g
> > > jobs in a GPU reset by the scheduler is then basically dead. But
> > > to
> > > be honest that never worked correctly.
> > > =C2=A0
> > > =C2=A0See the deprecated warning I already put on
> > > drm_sched_resubmit_jobs(). The job lifetime is not really well
> > > defined because of this, see the free_guilty hack as well.
> > > =C2=A0
> > =C2=A0
> > drm_sched_resubmit_jobs() is being used by 5 drivers currently. So
> > if
> > we go for this approach we have to port them, first. That doesn't
> > sound
> > trivial to me
> > =C2=A0
> =C2=A0
> =C2=A0Yeah, completely agree. I think the scheduler should provide
> something like drm_sched_for_each_pending_fence() which helps to
> iterate over all the pending HW fences.
> =C2=A0
> =C2=A0The individual drivers could then device by themself what to do,
> e.g. upcast the HW fence into the job and push it again or similar.

I have talked with Dave and we would be interested in exploring the
direction of getting rid of backend_ops.free_job() and doing the
modifications this implies.

Matthew, Thomas, any hard NACKs on principle, or can we look into this
in a future patch series?


P.





> =C2=A0
> =C2=A0But what we really need to get away from are those fence pre-
> requisite violations Sima pointed out. For example we can't allocate
> memory for run_job.
> =C2=A0
> =C2=A0Regards,
> =C2=A0Christian.
> =C2=A0
> =C2=A0
> > =C2=A0
> >=20
> >=20
> > P.
> >=20
> > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0Regards,
> > > =C2=A0Christian.
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > > =C2=A0
> > > > =C2=A0
> > > >=20
> > > >=20
> > > > Gr=C3=BC=C3=9Fe,
> > > > P.
> > > >=20
> > > > =C2=A0
> > > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > =C2=A0=C2=A0
> =C2=A0
> =C2=A0

