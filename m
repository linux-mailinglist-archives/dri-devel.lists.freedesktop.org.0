Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A25AAE22A
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA1E10E800;
	Wed,  7 May 2025 14:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="a1sR1KJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ED510E800
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 14:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746627182; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XElPdefXZStfdA2CP0VU1iKFKkv0xgkfYEGJpyWUIptkdDyETBk+z1fMkkh8pHxbZyit/F5jOwtrnnz+FePoNQd/ZdRj5+GF4tYamThYMmh0OQUB4zg7vtlfo74k0rIPOcGvO9IG6x8Rng/XcGXlmQ1ku0gXs/r+HVxuTA70UFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746627182;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4h3FRgbN+rh2EGfT2pe3V0DmqbUvniFRafpLf9zbra8=; 
 b=aLc0wOBoDIkN+PZe2rNv3fsus2G1KiuqIMVR6EGVy0wQcI4R8IMN7liP0BE6wERwt7vekar5GnBW0Iyf3XnD25pC4uHVqyUeV/WQZzFY2ncDGLEubkyoI1bbl4uTu07hueJ+Kcf0ir8QrvpCDCjH1TbOCMTDYwWXS+ygp4HOwlk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746627182; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=4h3FRgbN+rh2EGfT2pe3V0DmqbUvniFRafpLf9zbra8=;
 b=a1sR1KJSmYbjCoZWHtYbDjnu8qB/vkKrDfL/k4bk/6sd4ya1pWcyfjmVK51Ho7n/
 mDL1qEoOUtXvQxlYnM1HNtoiWuZKHHaXwlvnpRo3SJ+lVhpd+Fh7lGO7HF35GHzZ2Gv
 ieT4dohbhwV8xzIzVcH5Os1O4b0pD6tX4T629rrQ=
Received: by mx.zohomail.com with SMTPS id 1746627181409600.8667874538993;
 Wed, 7 May 2025 07:13:01 -0700 (PDT)
Date: Wed, 7 May 2025 15:12:57 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add BO labelling to Panfrost
Message-ID: <sscuzi4asw627u5mnj5bsc4cgxfcpfsbgfpod4v3ft3bfs7wbf@fsubfgttprnb>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
 <20250424022138.709303-2-adrian.larumbe@collabora.com>
 <24ee069c-b66a-4810-b8aa-4aa88d8fdab4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24ee069c-b66a-4810-b8aa-4aa88d8fdab4@arm.com>
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

On 07.05.2025 14:18, Steven Price wrote:
> On 24/04/2025 03:21, Adrián Larumbe wrote:
> > Unlike in Panthor, from where this change is based on, there is no need
> > to support tagging of BO's other than UM-exposed ones, so all strings
> > can be freed with kfree().
> >
> > This commit is done in preparation of a following one that will allow
> > UM to set BO labels through a new ioctl().
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
> But one comment below
>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_gem.c | 19 +++++++++++++++++++
> >  drivers/gpu/drm/panfrost/panfrost_gem.h | 16 ++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> > index 963f04ba2de6..a7a29974d8b1 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/err.h>
> >  #include <linux/slab.h>
> >  #include <linux/dma-buf.h>
> > @@ -35,6 +36,9 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
> >  	 */
> >  	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
> >
> > +	kfree(bo->label.str);
> > +	mutex_destroy(&bo->label.lock);
> > +
> >  	if (bo->sgts) {
> >  		int i;
> >  		int n_sgt = bo->base.base.size / SZ_2M;
> > @@ -260,6 +264,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
> >  	mutex_init(&obj->mappings.lock);
> >  	obj->base.base.funcs = &panfrost_gem_funcs;
> >  	obj->base.map_wc = !pfdev->coherent;
> > +	mutex_init(&obj->label.lock);
> >
> >  	return &obj->base.base;
> >  }
> > @@ -302,3 +307,17 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
> >
> >  	return obj;
> >  }
> > +
> > +void
> > +panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
> > +{
> > +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> > +	const char *old_label;
> > +
> > +	scoped_guard(mutex, &bo->label.lock) {
> > +		old_label = bo->label.str;
> > +		bo->label.str = label;
> > +	}
> > +
> > +	kfree(old_label);
> > +}
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> > index 7516b7ecf7fe..c0be2934f229 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> > @@ -41,6 +41,20 @@ struct panfrost_gem_object {
> >  	 */
> >  	size_t heap_rss_size;
> >
> > +	/**
> > +	 * @label: BO tagging fields. The label can be assigned within the
> > +	 * driver itself or through a specific IOCTL.
>
> From the commit message (about the use of kfree()) I assume we are not
> expecting this to be assigned "within the driver itself"?
>
That's right, that was only the case in Panthor when labelling kernel BOs.
Since all GEM BO's in Panfrost are user-facing, there's no need to label
any within the driver itself.
>
> Thanks,
> Steve
>
> > +	 */
> > +	struct {
> > +		/**
> > +		 * @label.str: Pointer to NULL-terminated string,
> > +		 */
> > +		const char *str;
> > +
> > +		/** @lock.str: Protects access to the @label.str field. */
> > +		struct mutex lock;
> > +	} label;
> > +
> >  	bool noexec		:1;
> >  	bool is_heap		:1;
> >  };
> > @@ -89,4 +103,6 @@ void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
> >  int panfrost_gem_shrinker_init(struct drm_device *dev);
> >  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
> >
> > +void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
> > +
> >  #endif /* __PANFROST_GEM_H__ */

Adrian Larumbe
