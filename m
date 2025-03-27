Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD4A73332
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E88510E8BF;
	Thu, 27 Mar 2025 13:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="S7lfuUQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2610910E0AD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743081538; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S0vaHKU9pV+9DySge9HtfsV0uD86kc1y+p++8K7mgQP1B+m4+tHvGD5E+rtu1IhcDF77BZjdjRJASIr50SucvEV5P0Qv43QlE+EQ092UrsKjN8QuF1J3GhqK6h/SQTrDt+x1R+Bg7QkFud9oYa0cFPL1TL3CZ7GF6vVHbT5UBcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743081538;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+M95KQ/yfrDRtZtaV+Z5tdE4WKoaJemMcUYLwWJ9az4=; 
 b=EF/CYmKjJCVGFU/Kqb8Ob0fCeLOiO80KpPsgIlchmcyXD0RhnjapQg/rL3jk4wTxWc+jMmvOLDh7ZBvkBQKJ0rGgSU6k9qHjPSmNPlNo8WWATDuPK4Ek0yi1J6ueriSDsZTcLpxP/Zd6jw0AWar6YWP9oDahQ+GGyjH4aj0iGxw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743081538; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=+M95KQ/yfrDRtZtaV+Z5tdE4WKoaJemMcUYLwWJ9az4=;
 b=S7lfuUQQvyd6joUHMWrvhccBwp1HV3REJf+x4v/8C6wKaxhnp4p5sscj8RmBxMCh
 YB1gehu0xX17TFyFEmWGhD0/H54kcHO2s5Hu/BXkZ1Ipf5OV8PmyI1IEeyukYzszZKf
 /UlUkef3gvpsEeGEtzPX4fE1smK9AZfH04smHjFE=
Received: by mx.zohomail.com with SMTPS id 1743081537219427.4028946753042;
 Thu, 27 Mar 2025 06:18:57 -0700 (PDT)
Date: Thu, 27 Mar 2025 13:18:47 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panthor: Display heap chunk entries in
 DebugFS GEMS file
Message-ID: <6jrrlbfis3nmd73grbzrtachh3uumgsnxsjpuqcekhcrmm7raj@wavtspjexwzu>
References: <20250319150953.1634322-1-adrian.larumbe@collabora.com>
 <20250319150953.1634322-5-adrian.larumbe@collabora.com>
 <20250319180013.4d0165c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250319180013.4d0165c1@collabora.com>
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

On 19.03.2025 18:00, Boris Brezillon wrote:
> On Wed, 19 Mar 2025 15:03:19 +0000
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
> > Expand the driver's DebugFS GEMS file to display entries for the heap
> > chunks' GEM objects, both those allocated at heap creation time through an
> > ioctl(), or in response to a tiler OOM event.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c  | 22 +++++++++++-----------
> >  drivers/gpu/drm/panthor/panthor_gem.h  |  2 ++
> >  drivers/gpu/drm/panthor/panthor_heap.c |  3 +++
> >  3 files changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index f7eb413d88e7..252979473fdf 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -22,16 +22,6 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
> >  	get_task_comm(bo->gems.creator.process_name, current->group_leader);
> >  }
> >
> > -static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> > -{
> > -	struct panthor_device *ptdev =  container_of(bo->base.base.dev,
> > -						     struct panthor_device, base);
> > -
> > -	mutex_lock(&ptdev->gems.lock);
> > -	list_add_tail(&bo->gems.node, &ptdev->gems.node);
> > -	mutex_unlock(&ptdev->gems.lock);
> > -}
> > -
> >  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> >  {
> >  	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> > @@ -44,10 +34,20 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> >  	list_del_init(&bo->gems.node);
> >  	mutex_unlock(&ptdev->gems.lock);
> >  }
> > +
> > +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> > +{
> > +	struct panthor_device *ptdev =  container_of(bo->base.base.dev,
> > +						     struct panthor_device, base);
> > +
> > +	mutex_lock(&ptdev->gems.lock);
> > +	list_add_tail(&bo->gems.node, &ptdev->gems.node);
> > +	mutex_unlock(&ptdev->gems.lock);
> > +}
> >  #else
> >  static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
> > -static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
> >  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> > +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
>
> Let's just define all these helpers as inline functions in
> panthor_gem.h in patch 3.

The only function that can so far be used from a different compilation unit is 'add'.
The other two are internal to panthor_gem.c, so I'm incluned to keep them there as static
functions, but move 'add' into the header file as a static inline function instead.

> >  #endif
> >
> >  static void panthor_gem_free_object(struct drm_gem_object *obj)
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> > index 7c896ec35801..e132f14bbef8 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.h
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> > @@ -132,6 +132,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >  void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
> >  void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
> >
> > +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo);
> > +
> >  static inline u64
> >  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
> >  {
> > diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> > index db0285ce5812..73cf43eb4a7b 100644
> > --- a/drivers/gpu/drm/panthor/panthor_heap.c
> > +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> > @@ -180,6 +180,9 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
> >  	heap->chunk_count++;
> >  	mutex_unlock(&heap->lock);
> >
> > +	panthor_gem_kernel_bo_set_label(chunk->bo, "\"Tiler heap chunk\"");
> > +	panthor_gem_debugfs_bo_add(to_panthor_bo(chunk->bo->obj));
>
> I'd be tempted to label all the kernel BOs, not just the heap chunks,
> and if we do that, we're probably better off changing the
> kernel_bo_create() prototype to pass a label.

I think is a good idea going forward, but in keeping things tight I'd say doing it now
might be an overkill, since the only user of tagged BO's at the moment is the gem debugfs
knob.

I think if in the future we find new ways of accounting or displaying labelled kernel BO's
other than heap chunks, then we can expand the kernel_bo_create() argument list and then
tag every single one of them at creation time.

> > +
> >  	return 0;
> >
> >  err_destroy_bo:


Adrian Larumbe
