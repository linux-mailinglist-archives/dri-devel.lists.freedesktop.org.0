Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19880593A9B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 22:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336DFD4486;
	Mon, 15 Aug 2022 20:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647F3D4439;
 Mon, 15 Aug 2022 20:22:10 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id o184so9718506oif.13;
 Mon, 15 Aug 2022 13:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=KUREXGO6jnd0bVGmD0b7wZHGhfBeIpSV7ISn3FBvF0g=;
 b=JVd7W9eNeC0LVvIMOinSk+P3PbZ0QvzqiK78lUWaC/aeWGVRVPfOuQQ2twhXTjfHIF
 u7BSqTsZjJkD9tVZIpymEVjuC4ijnZY8oTKHpf3/hmtRAZ+vLY+mOb1wcFGEZSP8Xla0
 67Mvs50TMjeV/4b48ccuKW4FRtzxqKJlYj/+8+D6zDhzo0v8ZVqHx5e2sQbkjAY6Cp7j
 uMkulLi3/iZr+pBL0o5Rc4uEVpQShr3ROTP8nfBYSrf/0yNJLlX6gxWkBOeI2O9IBcJo
 L57K2iFjZ2MYb2AVioKHP59giORw537DKt1r57cFQ8DS6hH5ar+OWJOKMCf385hAp/8J
 9Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=KUREXGO6jnd0bVGmD0b7wZHGhfBeIpSV7ISn3FBvF0g=;
 b=bp56VAWXXBLvBoV6sDyhu3zDZ6jo1KmC7QQyJOdhYU4QOEOt/Duvye8g7UboYoV63J
 nm5FgoBINvFjR5B45hajqxhNpDX3twcnNHT3qEP8t+PMEcia2/GRc6/Evl6RJ9j9oe9B
 A5n5ClG6DF6epkfOJZmK0CWM1qcQ7rM0Jo8Wm3wvqm3pqeY2T6XfgduvjI61CXpDfRyb
 xkDr4YbophTJW1mgig7Lq6wTdnmcsvDN7J3i2t9u+gWrhYkIzz1XaNk77op7yB6F49uv
 OV4ejTQllePqJ8aBuMaFks1dDGWd7Xu7EFkay8c9dpH91XW/w2wArW7t1EWyRdpOjF0I
 nydA==
X-Gm-Message-State: ACgBeo1pCmRQjmbN49+opWPLi1JOipiqEiIxlE5PzEoula7PccbZu0ei
 PzxPvaaemPkFXmzX9mcdB8+Tq2Oe7lBvdr2V9gI=
X-Google-Smtp-Source: AA6agR6/HoPU6iiFYk8vyjp+FTggm6uWYFAiy68hDHp9aGnJKMy5dFHVdevch5QQawGn+Cd4BEr765eFuhcI+C+eawI=
X-Received: by 2002:a05:6808:1491:b0:343:7543:1a37 with SMTP id
 e17-20020a056808149100b0034375431a37mr6706596oiw.106.1660594929626; Mon, 15
 Aug 2022 13:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220719103954.6737-1-strochuk@ispras.ru>
 <fac8ce6e-6f5f-598d-35cc-7bf01ac90f30@amd.com>
 <f750ab62-7deb-21a1-753e-1ee838386265@amd.com>
In-Reply-To: <f750ab62-7deb-21a1-753e-1ee838386265@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Aug 2022 16:21:58 -0400
Message-ID: <CADnq5_ORzjVFR9nxaJO6giVoGT8_BVtdq8PURjPrzOd7jpoH7g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove useless condition in
 amdgpu_job_stop_all_jobs_on_sched()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: ldv-project@linuxtesting.org, Jack Zhang <Jack.Zhang1@amd.com>,
 amd-gfx@lists.freedesktop.org, Andrey Strachuk <strochuk@ispras.ru>,
 Emma Anholt <emma@anholt.net>, Guchun Chen <guchun.chen@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Surbhi Kakarya <surbhi.kakarya@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Aug 12, 2022 at 7:13 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> @Alex was that one already picked up?
>
> Am 25.07.22 um 18:40 schrieb Andrey Grodzovsky:
> > Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >
> > Andrey
> >
> > On 2022-07-19 06:39, Andrey Strachuk wrote:
> >> Local variable 'rq' is initialized by an address
> >> of field of drm_sched_job, so it does not make
> >> sense to compare 'rq' with NULL.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >>
> >> Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
> >> Fixes: 7c6e68c777f1 ("drm/amdgpu: Avoid HW GPU reset for RAS.")
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 4 ----
> >>   1 file changed, 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> index 67f66f2f1809..600401f2a98f 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> @@ -285,10 +285,6 @@ void amdgpu_job_stop_all_jobs_on_sched(struct
> >> drm_gpu_scheduler *sched)
> >>       /* Signal all jobs not yet scheduled */
> >>       for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D
> >> DRM_SCHED_PRIORITY_MIN; i--) {
> >>           struct drm_sched_rq *rq =3D &sched->sched_rq[i];
> >> -
> >> -        if (!rq)
> >> -            continue;
> >> -
> >>           spin_lock(&rq->lock);
> >>           list_for_each_entry(s_entity, &rq->entities, list) {
> >>               while ((s_job =3D
> >> to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
>
