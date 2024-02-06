Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1784ABEF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 03:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A1C10FE15;
	Tue,  6 Feb 2024 02:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eX/rbqB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DD310FE18;
 Tue,  6 Feb 2024 02:06:09 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso627640466b.1; 
 Mon, 05 Feb 2024 18:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707185167; x=1707789967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1EJ6S2wVGEdnMNc6bKxhmQNElZwLjmlhpytY2Fu/uE=;
 b=eX/rbqB0aspO+BY5rphp9HJ2EHBJQ5HajvoMunCM0tKg3BBU+utYHG9yYBK0Opq2ru
 8kw2fl2IvKHnStaSVXxUwIsZYU3k7daH6KWqZ1+Roj/i780qXI/M8+p0ILSWV8F7KbSO
 i0kfAQ68IRQI2C4BcFTE6uRQWYclm76GQ8BzAvME3TLmdpYJkBn2TX1O4lt3WhgClqJp
 lwO0cTYnpFFpcMnXDTGc4QZq4RD+eitz2PnCGwR/OLeEbN2brwozS9+fhZ3EohnADnuX
 mtHWDJH8EDoxiVpLW02BVuEzomsdCn187VR6GUAxywkHukb30cRofCqvcVgQa/G3rMYA
 +1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707185167; x=1707789967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1EJ6S2wVGEdnMNc6bKxhmQNElZwLjmlhpytY2Fu/uE=;
 b=qJQWabtfC4yQP0TukNZnQgmAWMwKhmCQ0+xiTnPYhM/JQc9iL77aw9AQSntxMLKe/S
 tL+parjMDjZ2UqmnT18vHztj626R3NOeZsAkYdnovS0obuKiyw1lHgUh8/3UbpV6xzo2
 aClrw9WtrrlxMDboqS9m+rabOSbqvUHz0mD97ANdY9QHGHK6+X8FVOSecsjTw8my9lZE
 nfIJvWPnHMAIDCDXUxKWk+CyggVGfvBgmat3XpZ7zykLBoqEPY+ocs+JyNxLs/DsmFJR
 Bo5siPK6K53s8f5Vj+8/ZG0sk0Lx6qfsP7eBHsLopnN9nMsNuLX99+b8pCe/kVyZ5Z1r
 Un0A==
X-Gm-Message-State: AOJu0Yyox0MsFe9c+HxeOnGfjtJZkjBz9/HPcFyfDXJEsfAtUN3LF9Je
 EGQFWAZLK0uCPr+hF0ZES0dbwFfQPpmXYIEIgnAoRlpoNn380ZKrX5iwAOZUvRO5FG9GKZ6NGLf
 zw2JnyqrHAkcZ/hR+yY+sKVF31EY=
X-Google-Smtp-Source: AGHT+IHG19NldDsKoEZtc3qq+914gFcESUmx3w2nKHHgN+mrdCsoh/bT0fNBX1f4v57W3dTO5biPMp6IWBXL++dNeC0=
X-Received: by 2002:a17:906:3e09:b0:a37:bd9c:ad74 with SMTP id
 k9-20020a1709063e0900b00a37bd9cad74mr444161eji.75.1707185167471; Mon, 05 Feb
 2024 18:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20240130030413.2031009-1-matthew.brost@intel.com>
 <e7707834-9298-4392-a7ec-f4e5f382fa02@amd.com> <Zb1ll0rXlbaAaxKP@intel.com>
 <c5a7ae52-98e2-4edf-a539-71e4166fe3a4@amd.com> <ZcDjoek_l_cqE4Rr@intel.com>
 <ed315f43-eb84-430f-bc41-f93f6e3efcd4@gmail.com>
In-Reply-To: <ed315f43-eb84-430f-bc41-f93f6e3efcd4@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 6 Feb 2024 12:05:55 +1000
Message-ID: <CAPM=9ty7quJGhTRP5fJeTWLYBPzG4Q-PkXfO8OtuALvdn0C=Qg@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
To: Luben Tuikov <ltuikov89@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Tue, 6 Feb 2024 at 10:56, Luben Tuikov <ltuikov89@gmail.com> wrote:
>
> On 2024-02-05 08:33, Rodrigo Vivi wrote:
> > On Mon, Feb 05, 2024 at 09:44:56AM +0100, Christian K=C3=B6nig wrote:
> >> Am 02.02.24 um 22:58 schrieb Rodrigo Vivi:
> >>> On Tue, Jan 30, 2024 at 08:05:29AM +0100, Christian K=C3=B6nig wrote:
> >>>> Am 30.01.24 um 04:04 schrieb Matthew Brost:
> >>>>> Rather then loop over entities until one with a ready job is found,
> >>>>> re-queue the run job worker when drm_sched_entity_pop_job() returns=
 NULL.
> >>>>>
> >>>>> Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run=
 job worker")
> >>> First of all there's a small typo in this Fixes tag that needs to be =
fixed.
> >>> The correct one is:
> >>>
> >>> Fixes: 66dbd9004a55 ("drm/sched: Drain all entities in DRM sched run =
job worker")
> >
> > Cc: Dave Airlie <airlied@redhat.com>
> >
> >>>
> >>> But I couldn't apply this right now in any of our drm-tip trees becau=
se it
> >>> is not clear where this is coming from originally.
> >>>
> >>> likely amd tree?!
> >>
> >> No, this comes from Matthews work on the DRM scheduler.
> >>
> >> Matthews patches were most likely merged through drm-misc.
> >
> > the original is not there in drm-misc-next.
> > it looks like Dave had taken that one directly to drm-next.
> > So we either need the drm-misc maintainers to have a backmerge or
> > Dave to take this through the drm-fixes directly.
>
> This is indeed the case.
>
> I was going to push this patch through drm-misc-next, but the original/ba=
se patch
> (<20240124210811.1639040-1-matthew.brost@intel.com>) isn't there.
>
> If drm-misc maintainers back merge drm-fixes into drm-misc-next,
> I'll push this patch into drm-misc-next right away, so that it is complet=
e,
> and people can run and test it fully.
>
> Else, Dave will have to pull this patch directly into drm-fixes with our =
tags,
> as was done for the base patch.
>

I'll pull this into drm-fixes now, as that is where the base patch went.

Dave.

> Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
>
> Regards,
> Luben
>
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Christian, if this came from the amd, could you please apply it there=
 and
> >>> propagate through your fixes flow?
> >>>
> >>> Thanks,
> >>> Rodrigo.
> >>>
> >>>>> ---
> >>>>>    drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++------
> >>>>>    1 file changed, 9 insertions(+), 6 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
> >>>>> index 8acbef7ae53d..7e90c9f95611 100644
> >>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> @@ -1178,21 +1178,24 @@ static void drm_sched_run_job_work(struct w=
ork_struct *w)
> >>>>>           struct drm_sched_entity *entity;
> >>>>>           struct dma_fence *fence;
> >>>>>           struct drm_sched_fence *s_fence;
> >>>>> - struct drm_sched_job *sched_job =3D NULL;
> >>>>> + struct drm_sched_job *sched_job;
> >>>>>           int r;
> >>>>>           if (READ_ONCE(sched->pause_submit))
> >>>>>                   return;
> >>>>>           /* Find entity with a ready job */
> >>>>> - while (!sched_job && (entity =3D drm_sched_select_entity(sched)))=
 {
> >>>>> -         sched_job =3D drm_sched_entity_pop_job(entity);
> >>>>> -         if (!sched_job)
> >>>>> -                 complete_all(&entity->entity_idle);
> >>>>> - }
> >>>>> + entity =3D drm_sched_select_entity(sched);
> >>>>>           if (!entity)
> >>>>>                   return; /* No more work */
> >>>>> + sched_job =3D drm_sched_entity_pop_job(entity);
> >>>>> + if (!sched_job) {
> >>>>> +         complete_all(&entity->entity_idle);
> >>>>> +         drm_sched_run_job_queue(sched);
> >>>>> +         return;
> >>>>> + }
> >>>>> +
> >>>>>           s_fence =3D sched_job->s_fence;
> >>>>>           atomic_add(sched_job->credits, &sched->credit_count);
> >>
>
> --
> Regards,
> Luben
