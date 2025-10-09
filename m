Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52EBBC942C
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 15:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6810E1AA;
	Thu,  9 Oct 2025 13:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YdfCF1OD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5949E10E1AA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 13:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760016108; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FcempHjy+DdfSn3UtY6jSTyC3S0rYMPKr3fi9NgedRaRS0n/L58KHl4jLoen0zrBvsVYVADc/QWsiTaLOZlO19nR4MYpRY4peZqI1Oc56gCetxbIDNuTraeYgcgTR9hwlrMXfprZKJSvt6x6NYDTF0kSLRogEc1hNxOUVyWcf/A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760016108;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=utjq3BLYziK+qv+6yeUlMcRAz3+MfLoZbOjnlp1/HhU=; 
 b=m/+5ynmDJ4ZUJalfjO97u0wMSs9y3yhwn3ReNWIngeouh8R9mqH0gFPzCRQibjBeodzrv3olrq2kM7FFWj/4kav72JWc/tA73+rBm7nzQOpat+Ro7zi/4nPWBfuug+kv6Y1zYsIruAT4hSmKLukmvIliEARCLx+eLUlSYDySmYc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760016108; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=utjq3BLYziK+qv+6yeUlMcRAz3+MfLoZbOjnlp1/HhU=;
 b=YdfCF1ODqZB6z1xOgktnYYu6oOMSlyfHuuQzlg22Qsu8oVRcBgej+s9chqdxJzcT
 RedEw9LR3GOdSbPzpKxtlHT+K7dWeEqNM0K1r48FRNe2ynBuUrBOf7xQlDPFP13fAkC
 LxgNQphI2oHBWDzlvqiW4+Zrh/zHvUeDz+xLW2WM=
Received: by mx.zohomail.com with SMTPS id 1760016104702252.90107138331723;
 Thu, 9 Oct 2025 06:21:44 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:21:37 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, healych@amazon.com, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panfrost: Name scheduler queues after their job
 slots
Message-ID: <4efwuhiu4ijbqd44vr3tn3v5pi6ps677553ib6udlvgtonkudj@hf4le34hvnk4>
References: <20251009114313.1374948-1-adrian.larumbe@collabora.com>
 <4400c6b4-d2ad-429a-b84c-60a2f593cff1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4400c6b4-d2ad-429a-b84c-60a2f593cff1@arm.com>
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

Just realised I forgot to add the R-b tags.

On 09.10.2025 13:45, Steven Price wrote:
> On 09/10/2025 12:43, Adrián Larumbe wrote:
> > Drawing from commit d2624d90a0b7 ("drm/panthor: assign unique names to
> > queues"), give scheduler queues proper names that reflect the function
> > of their JM slot, so that this will be shown when gathering DRM
> > scheduler tracepoints.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 16 ++++++----------
> >  drivers/gpu/drm/panfrost/panfrost_job.c |  8 +++++++-
> >  drivers/gpu/drm/panfrost/panfrost_job.h |  2 ++
> >  3 files changed, 15 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 22350ce8a08f..607a5b8448d0 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -668,23 +668,19 @@ static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> >  	 *   job spent on the GPU.
> >  	 */
> >
> > -	static const char * const engine_names[] = {
> > -		"fragment", "vertex-tiler", "compute-only"
> > -	};
> > -
> > -	BUILD_BUG_ON(ARRAY_SIZE(engine_names) != NUM_JOB_SLOTS);
> > -
> >  	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
> >  		if (pfdev->profile_mode) {
> >  			drm_printf(p, "drm-engine-%s:\t%llu ns\n",
> > -				   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
> > +				   panfrost_engine_names[i],
> > +				   panfrost_priv->engine_usage.elapsed_ns[i]);
> >  			drm_printf(p, "drm-cycles-%s:\t%llu\n",
> > -				   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
> > +				   panfrost_engine_names[i],
> > +				   panfrost_priv->engine_usage.cycles[i]);
> >  		}
> >  		drm_printf(p, "drm-maxfreq-%s:\t%lu Hz\n",
> > -			   engine_names[i], pfdev->pfdevfreq.fast_rate);
> > +			   panfrost_engine_names[i], pfdev->pfdevfreq.fast_rate);
> >  		drm_printf(p, "drm-curfreq-%s:\t%lu Hz\n",
> > -			   engine_names[i], pfdev->pfdevfreq.current_frequency);
> > +			   panfrost_engine_names[i], pfdev->pfdevfreq.current_frequency);
> >  	}
> >  }
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index c47d14eabbae..0cc80da12562 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -28,6 +28,10 @@
> >  #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
> >  #define job_read(dev, reg) readl(dev->iomem + (reg))
> >
> > +const char * const panfrost_engine_names[] = {
> > +	"fragment", "vertex-tiler", "compute-only"
> > +};
> > +
> >  struct panfrost_queue_state {
> >  	struct drm_gpu_scheduler sched;
> >  	u64 fence_context;
> > @@ -846,12 +850,13 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >  		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> >  		.credit_limit = 2,
> >  		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> > -		.name = "pan_js",
> >  		.dev = pfdev->dev,
> >  	};
> >  	struct panfrost_job_slot *js;
> >  	int ret, j;
> >
> > +	BUILD_BUG_ON(ARRAY_SIZE(panfrost_engine_names) != NUM_JOB_SLOTS);
> > +
> >  	/* All GPUs have two entries per queue, but without jobchain
> >  	 * disambiguation stopping the right job in the close path is tricky,
> >  	 * so let's just advertise one entry in that case.
> > @@ -887,6 +892,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >
> >  	for (j = 0; j < NUM_JOB_SLOTS; j++) {
> >  		js->queue[j].fence_context = dma_fence_context_alloc(1);
> > +		args.name = panfrost_engine_names[j];
> >
> >  		ret = drm_sched_init(&js->queue[j].sched, &args);
> >  		if (ret) {
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> > index 5a30ff1503c6..458666bf684b 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> > @@ -53,6 +53,8 @@ struct panfrost_jm_ctx {
> >  	struct drm_sched_entity slot_entity[NUM_JOB_SLOTS];
> >  };
> >
> > +extern const char * const panfrost_engine_names[];
> > +
> >  int panfrost_jm_ctx_create(struct drm_file *file,
> >  			   struct drm_panfrost_jm_ctx_create *args);
> >  int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle);
> >
> > base-commit: 30531e9ca7cd4f8c5740babd35cdb465edf73a2d


Adrian Larumbe
