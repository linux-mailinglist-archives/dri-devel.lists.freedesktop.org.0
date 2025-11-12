Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E19C52473
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9467310E723;
	Wed, 12 Nov 2025 12:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GOxWSUtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED03310E71D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762951096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5OoA3WgUJjnAr+WxxV9CQW+nj1hOCfAUrMmAiv10Vo=;
 b=GOxWSUtQB94wlCwTILf/4bvWm4csBbYweEZB/rwZ0YpM+qTBhyxRYXzjPAIDZuD1CBZ9jW
 br0pflk2ZuRYfRlXn3klvsIncFppezvrqghYdkyEagkqqxLcyDcRRW7M4XcahnSdGKrER9
 QV6072WpCssRzsT9osaiDGhrxUF5Syk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-cQhAqJGbNtCuvdRW9YQ7mw-1; Wed, 12 Nov 2025 07:38:13 -0500
X-MC-Unique: cQhAqJGbNtCuvdRW9YQ7mw-1
X-Mimecast-MFC-AGG-ID: cQhAqJGbNtCuvdRW9YQ7mw_1762951092
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-bbcf3bd4c8fso671571a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 04:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762951092; x=1763555892;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YyTzM/Gc3weNacJPs5L8ECX61Y+ro7EydgqskqR3KlU=;
 b=WO07cYijdyA+hMYedTW0AMBBY5yDRzGopLaHIyg/WI+jzdGaE8J9TScdpTjBbe2ww4
 RJGp5OFcrv93xLL3hKbJj2cSvp6xsh+arHi+Hm9EwFedl3ZqMFzjpkfUJYYq8qyvY1B+
 kE2kh/2IvKfObE/UnL0GvF44OIRx93+A//rsf6WuQplsAyKYG1HDMrzheMEc5cxF0vVb
 VhEAO2aY9LaoNUoKKK2eGXh/VM8I+55fEAGUgHEmatQE0EtHDKI7dQ9n7zegm37PH0p9
 olS/oxpCW9cY7S4q1friBsWoE9ryA1RYqFOX85PbHs0A0K9Cbo2fvvhLTjMrUt6QSWLY
 MiMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2PC5aTBX2mxzHT7Hn5uMdHdRFceJEhgianbcImDe8hVTN3DXHk6PDbt0z8rD/tpk5Hks/CPYz614=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/l2tokR8lbHNJLSpOn2qoRf1RfIP9htP3T5ra5CqvsTKQirwT
 ewOFUSzWEG0sukNDDAO95cJ3pwbJ8M3e8enmPP2KIoRTB+XVpSsox+L9994UBi/T7iL2w4i+C+4
 CCOKwDlCBNvS6qOKdAUPF6xmndFf1FuB+BUK8iOCV9SQhrJ61vRTwyrlIVfmvbPMVBBOqFQ==
X-Gm-Gg: ASbGnctHZ8rlZ4a8EeDUJ9yDCZtj3r9mDQ8Ue76Gl6WEsVJ6s0ST6bqSXIDo7viZP7/
 G13LTOMHalaXqa1JufRHM3jdyOT23Y5VwaVG65YF6qaenafmX9Bx7K+7+16tWTJKufPYmoTGTNs
 Qtq2G8dRNo6WNy5WfqhutJY+Fupf6UbfrXbAB9IBJvsudZZCrUI5TVx+APgIl7AxWDvjKip4OFB
 E87J0McdvbdeeADLTXPYPgz2MwncvXomthzz0CVVaIfZQVGn3pfFBFnTfMJyl5pCR+ZKG+EuECq
 0MhQBQo8Lscn3uI4alRUflIFQjY0xvbLgdtXLl4l4yjnnmJ9h0JbqH+J/gqwqp+BF1uH5Q33L6k
 u82jKz7XZHN72w+wBnAPun/MBtA==
X-Received: by 2002:a17:90b:55c6:b0:340:dd63:3fd5 with SMTP id
 98e67ed59e1d1-343bf27e325mr8713186a91.17.1762951092212; 
 Wed, 12 Nov 2025 04:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsW4Vv8txWnD9Y5Bgm+Q3lJC2ddpn27nNgLU0HxJXH/GD3qmxPyBwxNAH04L1KOssPleEezw==
X-Received: by 2002:a17:90b:55c6:b0:340:dd63:3fd5 with SMTP id
 98e67ed59e1d1-343bf27e325mr8713160a91.17.1762951091780; 
 Wed, 12 Nov 2025 04:38:11 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343e0714b40sm2586223a91.7.2025.11.12.04.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 04:38:11 -0800 (PST)
Message-ID: <7cea7efb7ff0ab34ab7352158ecce731a3f714d8.camel@redhat.com>
Subject: Re: [PATCH v7 1/2] drm/panthor: Make the timeout per-queue instead
 of per-job
From: Philipp Stanner <pstanner@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?ISO-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, Detlev Casanova
 <detlev.casanova@collabora.com>,  Ashley Smith
 <ashley.smith@collabora.com>, kernel@collabora.com
Date: Wed, 12 Nov 2025 13:38:00 +0100
In-Reply-To: <20251112121744.1356882-2-boris.brezillon@collabora.com>
References: <20251112121744.1356882-1-boris.brezillon@collabora.com>
 <20251112121744.1356882-2-boris.brezillon@collabora.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JZVGIhLJDItD2WCMeZDE_nNygSZeT35FYsuOyAmMlYY_1762951092
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

On Wed, 2025-11-12 at 13:17 +0100, Boris Brezillon wrote:
> From: Ashley Smith <ashley.smith@collabora.com>
>=20
> The timeout logic provided by drm_sched leads to races when we try
> to suspend it while the drm_sched workqueue queues more jobs. Let's
> overhaul the timeout handling in panthor to have our own delayed work
> that's resumed/suspended when a group is resumed/suspended. When an
> actual timeout occurs, we call drm_sched_fault() to report it
> through drm_sched, still. But otherwise, the drm_sched timeout is
> disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> how we protect modifications on the timer.
>=20
> One issue seems to be when we call drm_sched_suspend_timeout() from
> both queue_run_job() and tick_work() which could lead to races due to
> drm_sched_suspend_timeout() not having a lock. Another issue seems to
> be in queue_run_job() if the group is not scheduled, we suspend the
> timeout again which undoes what drm_sched_job_begin() did when calling
> drm_sched_start_timeout(). So the timeout does not reset when a job
> is finished.
>=20
>=20

[=E2=80=A6]

> +
> +static void
> +queue_reset_timeout_locked(struct panthor_queue *queue)
> +{
> +=09lockdep_assert_held(&queue->fence_ctx.lock);
> +
> +=09if (queue->timeout.remaining !=3D MAX_SCHEDULE_TIMEOUT) {
> +=09=09mod_delayed_work(queue->scheduler.timeout_wq,

Here you are interfering with the scheduler's internals again, don't
you. I think we agreed that we don't want to do such things anymore,
didn't we?

You could write a proper drm_sched API function which serves your
usecase.

Or could maybe DRM_GPU_SCHED_STAT_NO_HANG be returned from your driver
in case an interrupt actually fires?

> +=09=09=09=09 &queue->timeout.work,
> +=09=09=09=09 msecs_to_jiffies(JOB_TIMEOUT_MS));
> +=09}
> +}
> +
> +static bool
> +group_can_run(struct panthor_group *group)
> +{
> +=09return group->state !=3D PANTHOR_CS_GROUP_TERMINATED &&
> +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 group->state !=3D PANTHOR_CS_GRO=
UP_UNKNOWN_STATE &&
> +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !group->destroyed && group->fata=
l_queues =3D=3D 0 &&
> +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !group->timedout;
> +}
> +
>=20

[=E2=80=A6]

> +queue_suspend_timeout(struct panthor_queue *queue)
> +{
> +=09spin_lock(&queue->fence_ctx.lock);
> +=09queue_suspend_timeout_locked(queue);
> +=09spin_unlock(&queue->fence_ctx.lock);
> +}
> +
> +static void
> +queue_resume_timeout(struct panthor_queue *queue)
> +{
> +=09spin_lock(&queue->fence_ctx.lock);
> +
> +=09if (queue_timeout_is_suspended(queue)) {
> +=09=09mod_delayed_work(queue->scheduler.timeout_wq,

There is drm_sched_resume_timeout(). Why can it not be used?

> +=09=09=09=09 &queue->timeout.work,
> +=09=09=09=09 queue->timeout.remaining);
> +
> +=09=09queue->timeout.remaining =3D MAX_SCHEDULE_TIMEOUT;
> +=09}
> +
> +=09spin_unlock(&queue->fence_ctx.lock);
> +}
> +
>=20

[=E2=80=A6]

> =C2=A0
> @@ -3270,6 +3379,11 @@ queue_timedout_job(struct drm_sched_job *sched_job=
)
> =C2=A0
> =C2=A0=09queue_start(queue);
> =C2=A0
> +=09/* We already flagged the queue as faulty, make sure we don't get
> +=09 * called again.
> +=09 */
> +=09queue->scheduler.timeout =3D MAX_SCHEDULE_TIMEOUT;
> +
> =C2=A0=09return DRM_GPU_SCHED_STAT_RESET;

DRM_GPU_SCHED_STAT_NO_HANG instead of just modifying the scheduler's
internal data??


P.


