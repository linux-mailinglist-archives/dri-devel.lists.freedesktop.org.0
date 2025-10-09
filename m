Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CCBC8BAB
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FFD10E9B4;
	Thu,  9 Oct 2025 11:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="h9+5kUwJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCA410E9B4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:18:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760008672; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aXXXc+MP5g5u3E3lvYWr8hZSDGFZxad+YYP596bM6JcHLaO3KR38ZMuKihDpI/5PLyU6TfiagIvwIkfE5ySVbeluERy6Zww2bgq358cM6OcZlP9ajsDCqLH5aYAV5GMKyERz9pq+VYaw5TZo8+bE4V+7pj+/TG9y1UFKdbE1l5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760008672;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Zv8FOCsnzKpGuE8xNKu6EI9WjoVXNITDjzFPQjht36c=; 
 b=M1lu5ao9FyMBvuzWyuj0CXL5dhxN9G2WvKSoyt7B1mOuEsXRu3Jo7fTnc+QnbPvcbFcbuv/74uXTC+Dqbistio1cXfFDiDaBsFusP+YGWfckx7vLF/DLzn9EDhbSE4icGR/RcPZIfC3MsRLwNpRYNoZSF+Wk9tHq8ubmAkN23aU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760008672; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=Zv8FOCsnzKpGuE8xNKu6EI9WjoVXNITDjzFPQjht36c=;
 b=h9+5kUwJ0kZ0aU9AerpWdTfjndIfJG/B9KS/mDoVnvr5P6fl9Gz8gfiCldJXLAc6
 iDu75NY3L62zvqXAuZJPDY+OpZxDBz4XrgO3t8lR63L25GDG8HUjq9njQpUtByKTyfy
 47ClJ5wcqQqntaxDBlk2eK+ooO6GSk9y7Q/jKRxw=
Received: by mx.zohomail.com with SMTPS id 1760008669186699.0718515873037;
 Thu, 9 Oct 2025 04:17:49 -0700 (PDT)
Date: Thu, 9 Oct 2025 12:17:44 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/panfrost: Name scheduler queues after their job slots
Message-ID: <ffzu4ekyatmcjekfngtjmdbrwuxc25s5mpzq7sqfgsjgjifiq6@gb3ilo3aecil>
References: <20251002171139.2067139-1-adrian.larumbe@collabora.com>
 <5f095b02-2561-49d7-88a9-0fd82a1c9e00@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f095b02-2561-49d7-88a9-0fd82a1c9e00@arm.com>
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

On 08.10.2025 15:48, Steven Price wrote:
> On 02/10/2025 18:11, Adrián Larumbe wrote:
> > Drawing from commit d2624d90a0b7 ("drm/panthor: assign unique names to
> > queues"), give scheduler queues proper names that reflect the function
> > of their JM slot, so that this will be shown when gathering DRM
> > scheduler tracepoints.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>
> Two minor things below, but with those fixed:
>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 6 ------
> >  drivers/gpu/drm/panfrost/panfrost_job.c | 6 +++++-
> >  drivers/gpu/drm/panfrost/panfrost_job.h | 2 ++
> >  3 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 22350ce8a08f..d08c87bc63a2 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -668,12 +668,6 @@ static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> >  	 *   job spent on the GPU.
> >  	 */
> >
> > -	static const char * const engine_names[] = {
> > -		"fragment", "vertex-tiler", "compute-only"
> > -	};
> > -
> > -	BUILD_BUG_ON(ARRAY_SIZE(engine_names) != NUM_JOB_SLOTS);
>
> NIT: We could move this to panfrost_job.c and keep the BUILD_BUG_ON.
>
> > -
> >  	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
> >  		if (pfdev->profile_mode) {
> >  			drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index c47d14eabbae..0f0340ffee19 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -28,6 +28,10 @@
> >  #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
> >  #define job_read(dev, reg) readl(dev->iomem + (reg))
> >
> > +const char * const engine_names[] = {
> > +	"fragment", "vertex-tiler-compute", "compute-only"
> > +};
> > +
> >  struct panfrost_queue_state {
> >  	struct drm_gpu_scheduler sched;
> >  	u64 fence_context;
> > @@ -846,7 +850,6 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >  		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> >  		.credit_limit = 2,
> >  		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> > -		.name = "pan_js",
> >  		.dev = pfdev->dev,
> >  	};
> >  	struct panfrost_job_slot *js;
> > @@ -887,6 +890,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >
> >  	for (j = 0; j < NUM_JOB_SLOTS; j++) {
> >  		js->queue[j].fence_context = dma_fence_context_alloc(1);
> > +		args.name = engine_names[j];
> >
> >  		ret = drm_sched_init(&js->queue[j].sched, &args);
> >  		if (ret) {
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> > index 5a30ff1503c6..52ff10b8d3d0 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> > @@ -53,6 +53,8 @@ struct panfrost_jm_ctx {
> >  	struct drm_sched_entity slot_entity[NUM_JOB_SLOTS];
> >  };
> >
> > +extern const char * const engine_names[];
>
> NIT: Now this is no longer a local variable I think we should prefix it,
> e.g. panfrost_engine_names.

On top of this, I'm also keeping the original engine names to avoid
breaking UM uitlities which depend on fdinfo.

> > +
> >  int panfrost_jm_ctx_create(struct drm_file *file,
> >  			   struct drm_panfrost_jm_ctx_create *args);
> >  int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle);
> >
> > base-commit: 30531e9ca7cd4f8c5740babd35cdb465edf73a2d


Adrian Larumbe
