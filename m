Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC819CECFB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176F910E88D;
	Fri, 15 Nov 2024 15:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IXeAv9bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7553E10E063
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731683769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3kpmsaTDLNGnzVhaTY281Ro6YjePrPjiShI0TriMAw=;
 b=IXeAv9bfpB3wJMjvSZgRsK+kew9qSAcwl99jo2UmjGS+rZ/MqBLTKOS628D+wZ8i9UiJ3u
 EvK/gj9JTIpj0o+l5LEcR0BZq8MR3lHMcTNDQhjNziSClcw+hTfPqzP6w2WSeYfNjGTN+u
 yDLgh4uJ/w8B59gGJ6mDuMVUuG5bmCg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-Uc7Sxj3kOyeSrZTU87WNzA-1; Fri, 15 Nov 2024 10:16:07 -0500
X-MC-Unique: Uc7Sxj3kOyeSrZTU87WNzA-1
X-Mimecast-MFC-AGG-ID: Uc7Sxj3kOyeSrZTU87WNzA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43152cd2843so12416165e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731683766; x=1732288566;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V99lvhB+G56WWX6JerraN+Y/VzcobaHMl3+1HYU3YPg=;
 b=oIzrrC9f0kUaTMbIK9yimQMEwRl/C7fda6qJ35nZQ4y4iIfTwwD2/gzLy/d0OHplKG
 NZV42DtAi3iFmkRjfSM3/0KlSwMPOpVOJ2KP4ed9UJJmJ1xJnYyCUx51iQ4ZWUikxYGF
 Dqd4uHiYUIiSCZuKcLJIWQMJhol3tYmHePm25egQuiG6QbkWquaZY0LxVkJh5j72HZX8
 zLMbzt+K17fRiD2W6DiBd8VNCyauqoED38gcpPYaJwE2LRwjOjRWDIn/SbpKZMD8RDnP
 Pf/7TC4Gg079xN7LUkPdBuNfM/2/EVm7UVEkzxRZLuJIrPHavxVNvNQJvfIarGKFgd7v
 pBfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjw2ibCURiROzHzk8OrSuVTa8ZO9n7L38LwoEvVj1Aoyp7RyN9OZ8a0fHlo9GGVYHFD7Br/bd6AyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjFrKkFGXv77aXObncxN+/MQNc/XeAhZGl3qoy9YxmyWT14eY1
 bFWPyZTvQbKgBYW/qc9xxwEk1pXyoTcAjxnpSDbuToTVVWiZ+W7uZ6qUWbTMY6IRrx8trYIzWOg
 XkaYL73Ejl3VhxbgmJqexSlkzDP4MPRJogtOcJnjTQF3mBA/crtLd1SeRz1BgL+/3cw==
X-Received: by 2002:a05:600c:1c09:b0:431:5f1c:8352 with SMTP id
 5b1f17b1804b1-432df71d609mr26181885e9.5.1731683766328; 
 Fri, 15 Nov 2024 07:16:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5HZ2GNfHcSjVZaPrD4/IWwT8V/mLtD8O2tV3rxJSmQP7s+uiB13WuAevSmtOFVKXjZeqq3Q==
X-Received: by 2002:a05:600c:1c09:b0:431:5f1c:8352 with SMTP id
 5b1f17b1804b1-432df71d609mr26181145e9.5.1731683765782; 
 Fri, 15 Nov 2024 07:16:05 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab80582sm56937925e9.19.2024.11.15.07.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 07:16:05 -0800 (PST)
Message-ID: <07e14fc50f3ead216555b1c134589186b9d838e9.camel@redhat.com>
Subject: Re: [PATCH v6 4/7] drm/sched: cleanup gpu_scheduler trace events
From: Philipp Stanner <pstanner@redhat.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,  rostedt@goodmis.org,
 l.stach@pengutronix.de, matt.coster@imgtec.com,  frank.binns@imgtec.com,
 yuq825@gmail.com, robdclark@gmail.com, kherbst@redhat.com, 
 lyude@redhat.com, boris.brezillon@collabora.com, steven.price@arm.com, 
 mwen@igalia.com, mcanal@igalia.com, thomas.hellstrom@linux.intel.com, 
 tvrtko.ursulin@igalia.com
Date: Fri, 15 Nov 2024 16:16:03 +0100
In-Reply-To: <20241114100113.150647-5-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-5-pierre-eric.pelloux-prayer@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fmCMAzsOLCGRqp3IbXbAFwHdLPN3BCS0vlMFEBN12IA_1731683767
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

On Thu, 2024-11-14 at 11:01 +0100, Pierre-Eric Pelloux-Prayer wrote:
> A fence uniquely identify a job, so this commits updates the places

s/identify/identifies

> where a kernel pointer was used as an identifier by:

But better sth like this:

"Currently, the scheduler's tracing infrastructure uses the job's
dma_fence and the drm_sched_entity the job belongs to. The dma_fence
alone, however, already uniquely identifies a job.

Use the dma_fence's context and sequence number exclusively identify a
job in debug prints like so:=20

>=20
> =C2=A0=C2=A0 "fence=3D(context:%llu, seqno:%lld)"
>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 39 ++++++=
+++++------
> --
> =C2=A01 file changed, 22 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index c4ec28540656..24358c4d5bbe 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_PROTO(struct drm_sched_job *sched_job, str=
uct
> drm_sched_entity *entity),
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_ARGS(sched_job, entity),
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct drm_sched_entity *,
> entity)
> -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct dma_fence *, fence)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __string(name, sched_job->sched->=
name)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, id)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, job_count)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(int, hw_job_count)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __string(dev, dev_name(sched_job-
> >sched->dev))
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, fence_context)
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, fence_seqno)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -=09=09=09=C2=A0=C2=A0 __entry->entity =3D entity;
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->id =3D sched_job->id;
> -=09=09=09=C2=A0=C2=A0 __entry->fence =3D &sched_job->s_fence-
> >finished;
> =C2=A0=09=09=09=C2=A0=C2=A0 __assign_str(name);
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->job_count =3D
> spsc_queue_count(&entity->job_queue);
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->hw_job_count =3D atomic_read(
> =C2=A0=09=09=09=09=C2=A0=C2=A0 &sched_job->sched->credit_count);
> =C2=A0=09=09=09=C2=A0=C2=A0 __assign_str(dev);
> +=09=09=09=C2=A0=C2=A0 __entry->fence_context =3D sched_job-
> >s_fence->finished.context;
> +=09=09=09=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job-
> >s_fence->finished.seqno;
> +
> =C2=A0=09=09=09=C2=A0=C2=A0 ),
> -=09=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, entity=3D%p, id=3D%llu, fence=
=3D%p,
> ring=3D%s, job count:%u, hw job count:%d",
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(dev), __entry->entity, __=
entry->id,
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __get_str(name),
> +=09=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, id=3D%llu, fence=3D(context:%=
llu,
> seqno:%lld), ring=3D%s, job count:%u, hw job count:%d",
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(dev), __entry->id,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->fe=
nce_seqno,
> __get_str(name),
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->job_count, __entry->h=
w_job_count)
> =C2=A0);
> =C2=A0
> @@ -75,37 +76,41 @@ TRACE_EVENT(drm_sched_process_job,
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_PROTO(struct drm_sched_fence *fence),
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_ARGS(fence),
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -=09=09=C2=A0=C2=A0=C2=A0 __field(struct dma_fence *, fence)
> +=09=09=C2=A0=C2=A0=C2=A0 __field(uint64_t, fence_context)
> +=09=09=C2=A0=C2=A0=C2=A0 __field(uint64_t, fence_seqno)
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -=09=09=C2=A0=C2=A0=C2=A0 __entry->fence =3D &fence->finished;
> +=09=09=C2=A0=C2=A0=C2=A0 __entry->fence_context =3D fence-
> >finished.context;
> +=09=09=C2=A0=C2=A0=C2=A0 __entry->fence_seqno =3D fence->finished.seqno;
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0 ),
> -=09=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%p signaled", __entry->fence)
> +=09=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D(context:%llu, seqno:%lld) sign=
aled",
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->fe=
nce_seqno)
> =C2=A0);
> =C2=A0
> =C2=A0TRACE_EVENT(drm_sched_job_wait_dep,
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_PROTO(struct drm_sched_job *sched_job, str=
uct
> dma_fence *fence),
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_ARGS(sched_job, fence),
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __string(name, sched_job->sched->name)
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, fence_context)
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, fence_seqno)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, id)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct dma_fence *, fence=
)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, ctx)
> -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(unsigned, seqno)
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, seqno)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -=09=09=09=C2=A0=C2=A0 __assign_str(name);
> +=09=09=09=C2=A0=C2=A0 __entry->fence_context =3D sched_job-
> >s_fence->finished.context;
> +=09=09=09=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job-
> >s_fence->finished.seqno;
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->id =3D sched_job->id;
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->fence =3D fence;
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->ctx =3D fence->context;
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->seqno =3D fence->seqno;
> =C2=A0=09=09=09=C2=A0=C2=A0 ),
> -=09=C2=A0=C2=A0=C2=A0 TP_printk("job ring=3D%s, id=3D%llu, depends fence=
=3D%p,
> context=3D%llu, seq=3D%u",
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(name), __entry->id,
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __entry->ctx,
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->seqno)
> +=09=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D(context:%llu, seqno:%lld), id=
=3D%llu,
> dependencies:{(context:%llu, seqno:%lld)}",
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->fe=
nce_seqno,
> __entry->id,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->ctx, __entry->seqno)
> =C2=A0);
> =C2=A0
> =C2=A0#endif

