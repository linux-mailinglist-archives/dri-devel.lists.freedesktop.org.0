Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE4C8C444
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD6510E711;
	Wed, 26 Nov 2025 22:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="krYUVeaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF5D10E711
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 22:57:44 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-7815092cd0bso2783957b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764197864; x=1764802664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8EhuVwgA5fb+Q4yezYI1M8Hp9jZQkKfwPkv88vSD1E=;
 b=krYUVeaGKj3sNjALbuf3EcdzNZfaSvJpiCQf6r/vxx6CwHKMEuafRbaqJB4lFsY/MC
 jWIA1q6V82kkhRXmUr7RXSY7br6BjNB1Pypt/OvvWcLAGfoR68c6kHCH17Cnn/d5IglR
 9jgbObaORAiPW1iJNXaZpw/+KSSAsMUTsMeWZpsYrvBgPiUuzR4pb+tzibnHSmGA1zNJ
 3VVcc0iPmU0nLFH9Et5hH4Z+FRfgVsbTOLfdqwS5Os1M6j9wp7FE9/UsszTdxhWk9+gP
 iy0ZotHFi/+0Der5yl1dhmAvsRfOLtC+41B/+EUJ7IGGJPf8kNogHyH0sLbiFO+mBQfl
 Qo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764197864; x=1764802664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k8EhuVwgA5fb+Q4yezYI1M8Hp9jZQkKfwPkv88vSD1E=;
 b=OaDGlun7T7qKo6zo4BRvQIRlVAileNoPW99v02TaMQmi5HltpFn5vpKCAiEEfycupv
 TMiAs/fubNpGAGqN2g+dEabvl91o9AybKexEYFOWo5zPOnwHH+q+0IpEJh5oQki8ZEA3
 zjB35mGbFBWOXj4L2a+jnDCTsBYGJKsb9HUVH7uciM/CWOVSmwX+hDaYFxhh+WTR+qzv
 dlhKeB0oupU1BT1OsSUZ22AzT2nLHikKRbodwKk9SxSwXVolDXvHu0tJ6mLlPnqbhH3u
 tNSMPJWsMf1wVQSNEApsZh/obOj/SkQWacvAJPNNQYhFn0x+LSU+qfcw+wkTpt9omn3t
 5HsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7LC8glO8LmYXOKHczzp81dBd7J2nVKQD/TKDyQUYfsbSOJPWKCvx+uBM3hxSpI76udfFtnv0eqy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw4691kEeNNdPNsYmtKJn5Hsa1AcpgqUFy7EtTg+7U40+0zuKr
 BKP0HG+kI01CzP/M7kbqGe6ayJZIgPVPAIGuSU6sepg8ZoWHo5j/ZLhxPmps+1GXLb9XOnNl/DI
 QXLXH8vAOF0BVT8lhywCloi/+kDj5VHk=
X-Gm-Gg: ASbGnctVOef40yqD6W/GTIX88KB1AYv2xJwkRfOhYZqfENxuGwpfp28aL6ow8MGFI4Q
 MDfMcG+qsCojrmCgiomrZlh1VPZJXPQ4Twz+lfo930vt3f3elcM/C55wnV7m0bpuEoMfYgbmE07
 qrgoorFCc1fuJMU2+1EFDR+ms1Ev2YK22aF8yzQTSxsw3poA2dW5OOmxb92LxWJNfq+oIbUqy4F
 JC9J+chDud3YvGI6Lz1aE3Ypd1nAmshfAE1233F4u1P3VZeOqU8QP8A/cEu+ga0dD90qzN/eq0M
 pi5Vdc/CGSUWIi/py5YQBT8NfQ1d
X-Google-Smtp-Source: AGHT+IHPUFaHCKtfYLbx2jOGqUwjTkIHzUseGWdNAsK4QMauL5uMkvdj13nQclicCy+xea+DGs7ktUizql7lEuLlxGA=
X-Received: by 2002:a05:690c:4b8f:b0:784:8dbc:5802 with SMTP id
 00721157ae682-78ab6efb33fmr135071287b3.32.1764197863704; Wed, 26 Nov 2025
 14:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
 <20251112115142.1270931-8-boris.brezillon@collabora.com>
In-Reply-To: <20251112115142.1270931-8-boris.brezillon@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Nov 2025 14:57:32 -0800
X-Gm-Features: AWmQ_blDHDiOAbqJ2Zi7L1SlRr9PljArJHByUHsbMytA3p6z38iv8weswQ-RQxk
Message-ID: <CAPaKu7SDz8MjHdpEUGBmNfh6Z2EC4CB6vXo74ZzVQUOC_=9nHg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/panthor: Make sure we resume the tick when new
 jobs are submitted
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>, 
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
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

On Thu, Nov 13, 2025 at 7:32=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> If the group is already assigned a slot but was idle before this job
> submission, we need to make sure the priority rotation happens in the
> future. Extract the existing logic living in group_schedule_locked()
> and call this new sched_resume_tick() helper from the "group is
> assigned a slot" path.
>
> v2:
> - Add R-b
>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 43 +++++++++++++++++++------
>  1 file changed, 34 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 0394f377c284..d1484f4a1c5b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2543,14 +2543,33 @@ static void sync_upd_work(struct work_struct *wor=
k)
>                 sched_queue_delayed_work(sched, tick, 0);
>  }
>
> +static void sched_resume_tick(struct panthor_device *ptdev)
> +{
> +       struct panthor_scheduler *sched =3D ptdev->scheduler;
> +       u64 delay_jiffies, now;
> +
> +       drm_WARN_ON(&ptdev->base, sched->resched_target !=3D U64_MAX);
> +
> +       /* Scheduler tick was off, recalculate the resched_target based o=
n the
> +        * last tick event, and queue the scheduler work.
> +        */
> +       now =3D get_jiffies_64();
> +       sched->resched_target =3D sched->last_tick + sched->tick_period;
> +       if (sched->used_csg_slot_count =3D=3D sched->csg_slot_count &&
> +           time_before64(now, sched->resched_target))
> +               delay_jiffies =3D min_t(unsigned long, sched->resched_tar=
get - now, ULONG_MAX);
> +       else
> +               delay_jiffies =3D 0;
> +
> +       sched_queue_delayed_work(sched, tick, delay_jiffies);
> +}
> +
>  static void group_schedule_locked(struct panthor_group *group, u32 queue=
_mask)
>  {
>         struct panthor_device *ptdev =3D group->ptdev;
>         struct panthor_scheduler *sched =3D ptdev->scheduler;
>         struct list_head *queue =3D &sched->groups.runnable[group->priori=
ty];
> -       u64 delay_jiffies =3D 0;
>         bool was_idle;
> -       u64 now;
>
>         if (!group_can_run(group))
>                 return;
> @@ -2595,13 +2614,7 @@ static void group_schedule_locked(struct panthor_g=
roup *group, u32 queue_mask)
>         /* Scheduler tick was off, recalculate the resched_target based o=
n the
>          * last tick event, and queue the scheduler work.
>          */
> -       now =3D get_jiffies_64();
> -       sched->resched_target =3D sched->last_tick + sched->tick_period;
> -       if (sched->used_csg_slot_count =3D=3D sched->csg_slot_count &&
> -           time_before64(now, sched->resched_target))
> -               delay_jiffies =3D min_t(unsigned long, sched->resched_tar=
get - now, ULONG_MAX);
> -
> -       sched_queue_delayed_work(sched, tick, delay_jiffies);
> +       sched_resume_tick(ptdev);
>  }
>
>  static void queue_stop(struct panthor_queue *queue,
> @@ -3202,6 +3215,18 @@ queue_run_job(struct drm_sched_job *sched_job)
>
>                 group_schedule_locked(group, BIT(job->queue_idx));
>         } else {
> +               u32 queue_mask =3D BIT(job->queue_idx);
> +               bool resume_tick =3D group_is_idle(group) &&
> +                                  (group->idle_queues & queue_mask) &&
> +                                  !(group->blocked_queues & queue_mask) =
&&
> +                                  sched->resched_target =3D=3D U64_MAX;
The logic here should be the same as the first part of
group_schedule_locked. I wonder if we can refactor that as well.

> +
> +               /* We just added something to the queue, so it's no longe=
r idle. */
> +               group->idle_queues &=3D ~BIT(job->queue_idx);
group->idle_queues &=3D queue_mask;

> +
> +               if (resume_tick)
> +                       sched_resume_tick(ptdev);
> +
>                 gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
>                 if (!sched->pm.has_ref &&
>                     !(group->blocked_queues & BIT(job->queue_idx))) {
> --
> 2.51.1
>
