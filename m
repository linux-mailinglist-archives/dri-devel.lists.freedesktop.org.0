Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CEA5AF331
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B2210E71E;
	Tue,  6 Sep 2022 17:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5978E10E71E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:57:30 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1278624b7c4so11841279fac.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=DcuJjcKS4jJbXVMP5Wd0b50SSm9sdjry/1ptymv2bdU=;
 b=mtxBBWiGaGJBp8Ti1daeCE+qJm1BxX2aMbndG9r1JX4kRoCk1yPCWquN4cnFe+CkoJ
 AXyHZwZFu2PFmgYuOgXQ5lQRwbyX9E0LVJhfk0aDfHyF+inRT6rX6fPrv4xMU8ij1d7y
 Pav9Lnxx8SKdXT7iqiaPL4TsHmePP0lw2xkHu04rvgyCEkqmrvKNfbaDAbrmmoRPysm7
 7/2QY+I38SHoGWbpQ+SV31NECre/optPr//HbaOf8Yb6S/Zrf+bEq8ynxl5OgWSMhBK1
 4HepHBATEiXGtR74+RIIl3AzkbE/gLqcjh2P26rMy6Gzs/y4fdtMqPN1dcJoOqYUB3dp
 X/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DcuJjcKS4jJbXVMP5Wd0b50SSm9sdjry/1ptymv2bdU=;
 b=woHUioWc8/5VfHNtb1uFwX1woaJuhFByCZcbZOGTs3RsvaBZrcWKDHpUy4+Pn9O+bJ
 NJjlvuzVMhKb/g+aPJtd5UrtyNfjyKTttvMcBX+xRRMut+IEE/2vvJUFc02O4p2vP+tq
 rcLsSYIpnMsSzDD9dh0M26ugzncwDUk4HXGqRHoMIhOB7cWOPqRumdl3fgZi5fVumMSk
 v6aZ9WFF84dcm8LATbjqZX74ub6vz1My34fVDYqRehKfNEk0JkzFh2kdJK1E0o5z7BWQ
 IIW6aRIcghLChOIpsvcaQ9TAoPfWrP60rwShwSLGzngVHAiWXSkL2rpoD9jyAtOqX3tc
 CPrg==
X-Gm-Message-State: ACgBeo3ftlwOY/E73cYfynEtw1/jHQgn2w7ZvZ6VK92mduZYS+/UDxzN
 s746M3aS2yaSO7PcEfnvtHpKUIKv68nwoU4sOYg=
X-Google-Smtp-Source: AA6agR6AUNJUTifY94FATZjSANwKer+WpsUtUrhyJOiyHo9njJyR4t4VsApgP9RwWmHSjS8KV9G2Du7GW18pi6z2pgg=
X-Received: by 2002:a05:6870:3484:b0:11e:4465:3d9b with SMTP id
 n4-20020a056870348400b0011e44653d9bmr12911245oah.46.1662487049675; Tue, 06
 Sep 2022 10:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220404213040.12912-1-rdunlap@infradead.org>
 <68961bab-6448-9a98-8916-9c3cb0c5d020@amd.com>
 <e61a6903-550d-df70-6297-f49cc2750244@infradead.org>
 <ddde170c-7f2c-d9bc-7044-4c609bc915b5@amd.com>
In-Reply-To: <ddde170c-7f2c-d9bc-7044-4c609bc915b5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Sep 2022 13:57:18 -0400
Message-ID: <CADnq5_NEgVxjAOgvire32K1=PTGzHcs3GL9BqhmQCqq3EBzVDA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/scheduler: quieten kernel-doc warnings
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 6, 2022 at 1:38 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> I RBed, see bellow.

Can you push the patch to drm-misc?

Alex

>
> Andrey
>
> On 2022-08-31 14:34, Randy Dunlap wrote:
> > ping?
> >
> > On 4/4/22 14:58, Andrey Grodzovsky wrote:
> >> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >> Andrey
> >>
> >> On 2022-04-04 17:30, Randy Dunlap wrote:
> >>> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
> >>>
> >>> Quashes these warnings:
> >>>
> >>> include/drm/gpu_scheduler.h:332: warning: missing initial short descr=
iption on line:
> >>>    * struct drm_sched_backend_ops
> >>> include/drm/gpu_scheduler.h:412: warning: missing initial short descr=
iption on line:
> >>>    * struct drm_gpu_scheduler
> >>> include/drm/gpu_scheduler.h:461: warning: Function parameter or membe=
r 'dev' not described in 'drm_gpu_scheduler'
> >>>
> >>> drivers/gpu/drm/scheduler/sched_main.c:201: warning: missing initial =
short description on line:
> >>>    * drm_sched_dependency_optimized
> >>> drivers/gpu/drm/scheduler/sched_main.c:995: warning: Function paramet=
er or member 'dev' not described in 'drm_sched_init'
> >>>
> >>> Fixes: 2d33948e4e00 ("drm/scheduler: add documentation")
> >>> Fixes: 8ab62eda177b ("drm/sched: Add device pointer to drm_gpu_schedu=
ler")
> >>> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a pro=
cesses")
> >>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >>> Cc: David Airlie <airlied@linux.ie>
> >>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>> Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Cc: Jiawei Gu <Jiawei.Gu@amd.com>
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> ---
> >>> Feel free to make changes or suggest changes...
> >>>
> >>> v2: drop @work description (already done by Andrey)
> >>>
> >>>    drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
> >>>    include/drm/gpu_scheduler.h            |    9 +++++----
> >>>    2 files changed, 7 insertions(+), 5 deletions(-)
> >>>
> >>> --- linux-next-20220404.orig/drivers/gpu/drm/scheduler/sched_main.c
> >>> +++ linux-next-20220404/drivers/gpu/drm/scheduler/sched_main.c
> >>> @@ -198,7 +198,7 @@ static void drm_sched_job_done_cb(struct
> >>>    }
> >>>      /**
> >>> - * drm_sched_dependency_optimized
> >>> + * drm_sched_dependency_optimized - test if the dependency can be op=
timized
> >>>     *
> >>>     * @fence: the dependency fence
> >>>     * @entity: the entity which depends on the above fence
> >>> @@ -984,6 +984,7 @@ static int drm_sched_main(void *param)
> >>>     *        used
> >>>     * @score: optional score atomic shared with other schedulers
> >>>     * @name: name used for debugging
> >>> + * @dev: target &struct device
> >>>     *
> >>>     * Return 0 on success, otherwise error code.
> >>>     */
> >>> --- linux-next-20220404.orig/include/drm/gpu_scheduler.h
> >>> +++ linux-next-20220404/include/drm/gpu_scheduler.h
> >>> @@ -328,10 +328,10 @@ enum drm_gpu_sched_stat {
> >>>    };
> >>>      /**
> >>> - * struct drm_sched_backend_ops
> >>> + * struct drm_sched_backend_ops - Define the backend operations
> >>> + *    called by the scheduler
> >>>     *
> >>> - * Define the backend operations called by the scheduler,
> >>> - * these functions should be implemented in driver side.
> >>> + * These functions should be implemented in the driver side.
> >>>     */
> >>>    struct drm_sched_backend_ops {
> >>>        /**
> >>> @@ -408,7 +408,7 @@ struct drm_sched_backend_ops {
> >>>    };
> >>>      /**
> >>> - * struct drm_gpu_scheduler
> >>> + * struct drm_gpu_scheduler - scheduler instance-specific data
> >>>     *
> >>>     * @ops: backend operations provided by the driver.
> >>>     * @hw_submission_limit: the max size of the hardware queue.
> >>> @@ -434,6 +434,7 @@ struct drm_sched_backend_ops {
> >>>     * @_score: score used when the driver doesn't provide one
> >>>     * @ready: marks if the underlying HW is ready to work
> >>>     * @free_guilty: A hit to time out handler to free the guilty job.
> >>> + * @dev: system &struct device
> >>>     *
> >>>     * One scheduler is implemented for each hardware ring.
> >>>     */
