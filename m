Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6819CE820
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EE510E884;
	Fri, 15 Nov 2024 15:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F7Jxu7p2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46A510E884
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731683025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YY3HXxgZdqee3bXOQbSTG+SL8qFKBgmvhvof1yW96LA=;
 b=F7Jxu7p2n0NPt6KOGf6/kEWrEnTW1WIMtgw9BgTRnQVL0A/Z8+lntti0igO5z5S3tHMSxB
 1dAQAT+je4LJ5eFTuVbUgDmBg9nR+ivAoEHVUj7K1D5KSSGkFc9lo1SL8EN1JdMaYtvhi5
 wGIaTXB+5Fl6LFt6o4tPjzrhdpUeHNc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-kFpEaSy0PXq5u5VkUeig1w-1; Fri, 15 Nov 2024 10:03:43 -0500
X-MC-Unique: kFpEaSy0PXq5u5VkUeig1w-1
X-Mimecast-MFC-AGG-ID: kFpEaSy0PXq5u5VkUeig1w
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4315ad4938fso13508435e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731683022; x=1732287822;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+1lIXts8+R8JrQyK+g208H/mRBtoTO9aZteC38sSeGI=;
 b=OKVQ4q7nMtU6zFwZluAcDQStyh9WJM5L9CS1WT/hOqU2N3wSwJx6jQuMD5cg+buWNz
 ggt+pyiZLyK+ymx5uA3tropIc7Qx6c+5Os9zntUOOUbdn9mxXtHV9F1aNqubxLtKilx7
 StYsDDyX1wmO0VfOTX9xiUYCHAz1hdaqqa1hA2P2fAT0/QWhL+pVY6RAoSAuF6Bv1/+V
 PxF4w7xP3zTj7JIgdMWkn/XRGh4yrgaYNRXY24Y7WxzgHleI2RapSAuUzsj6dX6yoZmL
 G8E1Ao6Q2gz6VED7Gq0neIOyzI+lteer6hhlk8NUMMs61cuwFhqxqjAboNebyr0Yi+IW
 GeHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjQw3VkdW898NOEdnz4IQDXonxaIAzXREoDwoVUb7SbtUTpwN8Z5pqF8858RQWXL82nF9ytxDTgsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrVoWu74Xp+NBZ6ZIxBh+T1iEsIxBATlm1JNO5cR1UwjlooluO
 Egvw8WIXOf5BFkJYTuTwgnLJoUz6h+q3SjimUeZY83Xqvhl2ilb4mKfCHUkTLRzHXc+MnhNJtMC
 GgdoKbGe9d2wwczD42fgllGFjCg+bX5DOGyWANqZ4sI33f9X3B84Frb+BYyetKYVAow==
X-Received: by 2002:a05:600c:4588:b0:431:3bf9:3ebb with SMTP id
 5b1f17b1804b1-432df77c66cmr23674625e9.24.1731683021640; 
 Fri, 15 Nov 2024 07:03:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE43i51i+kH9S/hOQkyW4270Vfm3A6Er5fe22KsN5rDaWxi0gVwwo7H5CZ+0UhJcJl9QfgQUQ==
X-Received: by 2002:a05:600c:4588:b0:431:3bf9:3ebb with SMTP id
 5b1f17b1804b1-432df77c66cmr23673815e9.24.1731683021019; 
 Fri, 15 Nov 2024 07:03:41 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da29989asm58756615e9.42.2024.11.15.07.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 07:03:40 -0800 (PST)
Message-ID: <b7d5b17497a7e54f0d966f3e72408f2a8dcd0811.camel@redhat.com>
Subject: Re: [PATCH v6 3/7] drm/sched: add device name to the
 drm_sched_process_job event
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
Date: Fri, 15 Nov 2024 16:03:38 +0100
In-Reply-To: <20241114100113.150647-4-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-4-pierre-eric.pelloux-prayer@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -OoD8ONuCLEb8hhYzIuB4qSl9trTELGtEKagjPKlieg_1731683022
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
> Until the switch from kthread to workqueue,

Could you include the commit ID here where that happened?=20

"Since switching the scheduler from using kthreads to workqueues in
commit 1234 ("foo: bar") userspace applications cannot determine the
[...] anymore"


>  a userspace application could
> determine the source device

source device of *what*? Should be mentioned.

>  from the pid of the thread sending the event.

nit: s/pid/PID ?

>=20
> With workqueues this is not possible anymore, so the event needs to
> contain
> the dev_name() to identify the device.
>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index c75302ca3427..c4ec28540656 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, id)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, job_count)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __field(int, hw_job_count)
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 __string(dev, dev_name(sched_job-
> >sched->dev))
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0=09=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> @@ -52,9 +53,10 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->job_count =3D
> spsc_queue_count(&entity->job_queue);
> =C2=A0=09=09=09=C2=A0=C2=A0 __entry->hw_job_count =3D atomic_read(
> =C2=A0=09=09=09=09=C2=A0=C2=A0 &sched_job->sched->credit_count);
> +=09=09=09=C2=A0=C2=A0 __assign_str(dev);
> =C2=A0=09=09=09=C2=A0=C2=A0 ),
> -=09=C2=A0=C2=A0=C2=A0 TP_printk("entity=3D%p, id=3D%llu, fence=3D%p, rin=
g=3D%s, job
> count:%u, hw job count:%d",
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->entity, __entry->id,
> +=09=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, entity=3D%p, id=3D%llu, fence=
=3D%p,
> ring=3D%s, job count:%u, hw job count:%d",
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(dev), __entry->entity, __=
entry->id,
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __get_str(name=
),
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->job_count, __entry->h=
w_job_count)
> =C2=A0);

