Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B2C8C366
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3872A10E700;
	Wed, 26 Nov 2025 22:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NzQDftxk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893C110E719
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 22:28:18 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-641e4744e59so313887d50.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764196097; x=1764800897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiqXHiFmnFG3WVcjsj32Y7lQIIx7vkX7g7lrCiWRS/8=;
 b=NzQDftxkCEizVGvu0ICPPv0sjwtrli2RPF1N6DKURJ9t4JN4GomjLB3/+3NqvhFYsw
 SAD1g7WXTH0n7eDg27da3NGuOCsU+05DdTIP3Q9Md9+mt6BMahq1SjJbCNuex6dzwpaJ
 TXVlucD//cylneql/vaSwR9pYjrHZCgLeYgcOGKEw5lYdYjVDxj4aXouaW3VhCoRv39u
 ZS9e+NsN/hD3HsixAxbZ6x7ooP1fwgAwz8oGq3tj1LWxgTlE/uri7718xQClyLhGICV7
 CvhmJlLe8Qki/6pGPkan/sEBY09wV8Ik1qXI63rn4XBfj4a0Wt/8JSw/ULKrmOZy7lq+
 mhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764196097; x=1764800897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PiqXHiFmnFG3WVcjsj32Y7lQIIx7vkX7g7lrCiWRS/8=;
 b=Ur3C8qbZPWzpiY98OnMYyX7rAOoKZjJHYB8NgctaaV0+j727RVO19eg3lwVbz9tCqH
 tk5iLGOIpgmc19TN+i2Ngy0p2QXwXcF6EV5NlQvYgi2uOqn4emlAg18mMpaTKLpi4M4b
 uv2u7VsECAbpeU06M2wPahEMC+A8g4iu6LU88MpiWrV1y/T/osFIEtcPHkoumK9nbjQC
 mW4P2+DoBk2aTm+sqyETOSNTmyckbuiPqdBn9oNDTcFg7fe4+HyZZzdBm0KKeurXNFwh
 TjQWB1qmVyubNlAkq3ihV527pIsclN6Kby5N9AiFmFuPAA199rtPGsLk3weBhQH1TKHI
 iEGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj3YpzVdfasRcRtizTC13oP7m5+vVZQjiSuwJTryIBmh+WFbK+rzBiCaFKi7rkCCV5NE4yAwuYB6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywefAtLWoreAQPz6JWcYjx9NAK/k7FnuRFtWRWZF8tJRwowYgG
 GlYmMGler9JefV2kahkRqZEKvY7Vkx+SBb02SzC13gEU4Aso0OPEGUx5J6R7VA9iHziJhXaR6Q0
 h54j/geKeFneZqPvSauILU1YcW9btljQ=
X-Gm-Gg: ASbGncsvGqCLFuTl1qyMBcAh/QVn0b81iavRjr+q/G5AnwLlVLYIw8dJLa/3VxAVD1W
 32uKWj7ZCUqEa+APdwkbLlrMJ+yFa2hmRYfy2phHqAkT8UNq4gBFRvVtSVgXo/MBwTlMQwRhpQE
 uQPtKQ62JgiitTYCtKhj1r3sKM+V8WVkEl4P3D/ub+wUSzuA8SoPKtp0csbkJXO31OeYquVr+Q5
 Rq5X+AXeQPawIK1zAGZIDRTOehFFCxFCUDHZawOXpMPlS9IYCtnfBRUuHTYiQhE7+UHsGBsnalj
 9sn53Nf1FnNXwIaWbkrWur39ULhN
X-Google-Smtp-Source: AGHT+IHBgYUw4t8Q/n1P20l9A8CX0JzRuC8HKjle2tq/EOL0sCD6/R2JJh9oM2F3bn5xJpwttP1nBGMyQUjMBOADASc=
X-Received: by 2002:a53:d048:0:20b0:63f:beb2:950f with SMTP id
 956f58d0204a3-64302a5d4c6mr12596547d50.34.1764196097474; Wed, 26 Nov 2025
 14:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
 <20251112115142.1270931-7-boris.brezillon@collabora.com>
In-Reply-To: <20251112115142.1270931-7-boris.brezillon@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Nov 2025 14:28:06 -0800
X-Gm-Features: AWmQ_blTFvPWNbJ1c6ixbDJL6lJhKLlapTwIj6iDJhf4OL1clBWG8-HtIHeLVko
Message-ID: <CAPaKu7RAyPjmZTs8sWRPnGVmBDOPcsDtys92n5J3qwm++DNswA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/panthor: Fix the logic that decides when to
 stop ticking
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

On Wed, Nov 12, 2025 at 4:21=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> When we have multiple active groups with the same priority, we need to
> keep ticking for the priority rotation to take place. If we don't do
> that, we might starve slots with lower priorities.
>
> It's annoying to deal with that in tick_ctx_update_resched_target(),
> so let's add a ::stop_tick field to the tick context which is
> initialized to true, and downgraded to false as soon as we detect
> something that requires to tick to happen. This way we can complement
> the current logic with extra conditions if needed.
>
> v2:
> - Add R-b
>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 36 ++++++++++++-------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 4c137581fe40..0394f377c284 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1882,6 +1882,7 @@ struct panthor_sched_tick_ctx {
>         struct panthor_vm *vms[MAX_CS_PER_CSG];
>         u32 as_count;
>         bool immediate_tick;
> +       bool stop_tick;
>         u32 csg_upd_failed_mask;
>  };
>
> @@ -1941,10 +1942,17 @@ tick_ctx_pick_groups_from_list(const struct panth=
or_scheduler *sched,
>                 if (!owned_by_tick_ctx)
>                         group_get(group);
>
> -               list_move_tail(&group->run_node, &ctx->groups[group->prio=
rity]);
>                 ctx->group_count++;
> +
> +               /* If we have more than one active group with the same pr=
iority,
> +                * we need to keep ticking to rotate the CSG priority.
> +                */
>                 if (group_is_idle(group))
>                         ctx->idle_group_count++;
> +               else if (!list_empty(&ctx->groups[group->priority]))
> +                       ctx->stop_tick =3D false;
> +
> +               list_move_tail(&group->run_node, &ctx->groups[group->prio=
rity]);
>
>                 if (i =3D=3D ctx->as_count)
>                         ctx->vms[ctx->as_count++] =3D group->vm;
> @@ -1996,6 +2004,7 @@ tick_ctx_init(struct panthor_scheduler *sched,
>         memset(ctx, 0, sizeof(*ctx));
>         csgs_upd_ctx_init(&upd_ctx);
>
> +       ctx->stop_tick =3D true;
>         ctx->min_priority =3D PANTHOR_CSG_PRIORITY_COUNT;
>         for (i =3D 0; i < ARRAY_SIZE(ctx->groups); i++) {
>                 INIT_LIST_HEAD(&ctx->groups[i]);
> @@ -2308,32 +2317,21 @@ static u64
>  tick_ctx_update_resched_target(struct panthor_scheduler *sched,
>                                const struct panthor_sched_tick_ctx *ctx)
>  {
> -       /* We had space left, no need to reschedule until some external e=
vent happens. */
> -       if (!tick_ctx_is_full(sched, ctx))
> -               goto no_tick;
> +       u64 resched_target;
>
> -       /* If idle groups were scheduled, no need to wake up until some e=
xternal
> -        * event happens (group unblocked, new job submitted, ...).
> -        */
> -       if (ctx->idle_group_count)
> +       if (ctx->stop_tick)
>                 goto no_tick;
>
>         if (drm_WARN_ON(&sched->ptdev->base, ctx->min_priority >=3D PANTH=
OR_CSG_PRIORITY_COUNT))
>                 goto no_tick;
>
> -       /* If there are groups of the same priority waiting, we need to
> -        * keep the scheduler ticking, otherwise, we'll just wait for
> -        * new groups with higher priority to be queued.
> -        */
> -       if (!list_empty(&sched->groups.runnable[ctx->min_priority])) {
It looks like we can drop ctx->min_priority completely. It was mainly
a safeguard to avoid OOB access here.

> -               u64 resched_target =3D sched->last_tick + sched->tick_per=
iod;
> +       resched_target =3D sched->last_tick + sched->tick_period;
>
> -               if (time_before64(sched->resched_target, sched->last_tick=
) ||
> -                   time_before64(resched_target, sched->resched_target))
> -                       sched->resched_target =3D resched_target;
> +       if (time_before64(sched->resched_target, sched->last_tick) ||
> +           time_before64(resched_target, sched->resched_target))
> +               sched->resched_target =3D resched_target;
>
> -               return sched->resched_target - sched->last_tick;
> -       }
> +       return sched->resched_target - sched->last_tick;
>
>  no_tick:
>         sched->resched_target =3D U64_MAX;
> --
> 2.51.1
>
