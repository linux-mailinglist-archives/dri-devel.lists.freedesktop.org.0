Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B889AAADFF8
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C4210E189;
	Wed,  7 May 2025 13:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Lrq8f5y+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7010E189
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746622872; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jmqa16Ur1k4TGVJwJ5Jr8bMd1zvpF+OpjhDa4DYiFav4Q7TYH/MP3VSQ53yCKCk9bMTGbZNpJgrT1x336sGtK7YEz6iiKlzmMO6bh0zvOaw/HUEddB9zk4pQlEsUsCnaMArJ6IkTS+//YsHrFQz4L4s1Y0ZHolA51eMLG20ro1Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746622872;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=etfGEeB3wptSXvn0rn+APnfJAEebY6f8wB2UE6uH6e0=; 
 b=D+ctraB+1aTmoS+w7Vj/g3ZFHSkNn1UXq3l8/m5FWtfSuz92hi85qiBL4HT96dPPrhlltjnZogr7LdIFcUYAuTi7hxIb85tqNAQ8SpL+KRNMDuFCiacDBhmFwDApyONSeMDp+H/dPp+ODvyKstUZ8fUfhCIyw/dfVBvevPB94yw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746622872; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=etfGEeB3wptSXvn0rn+APnfJAEebY6f8wB2UE6uH6e0=;
 b=Lrq8f5y+ge4GZJdiBf+KeQCF3kz5NnNKj/swliG1NeNLFxbG5rmF5lm6i8F/1//9
 c1uI0yP/v0jE3WqvNZXETJ38V3RjRUc7tlfamf+i4taQaVA4hlDRUhAusgHsKjIPmdd
 aP6+KvUIAbdig7Es0eIWIYtMo/9zbaO3UpZzM80M=
Received: by mx.zohomail.com with SMTPS id 1746622869837706.1113122905474;
 Wed, 7 May 2025 06:01:09 -0700 (PDT)
Date: Wed, 7 May 2025 14:01:04 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add BO labelling to Panfrost
Message-ID: <3mdoa5wslxmpp4jsjhtwgdkqqqjcovudy3ge45lye2i4eiruby@hpxkzhulpdvs>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
 <20250424022138.709303-2-adrian.larumbe@collabora.com>
 <20250506085453.0fbb5a02@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506085453.0fbb5a02@collabora.com>
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

On 06.05.2025 08:54, Boris Brezillon wrote:
> On Thu, 24 Apr 2025 03:21:30 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
> > Unlike in Panthor, from where this change is based on, there is no need
> > to support tagging of BO's other than UM-exposed ones, so all strings
> > can be freed with kfree().
> >
> > This commit is done in preparation of a following one that will allow
> > UM to set BO labels through a new ioctl().
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
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
>
> Can we do as we did in panthor, and put those fields in the debugfs
> field.

BO labelling fields must be present outside of DebugFS builds.

> +
>  	bool noexec		:1;
>  	bool is_heap		:1;
>  };
> @@ -89,4 +103,6 @@ void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
>  int panfrost_gem_shrinker_init(struct drm_device *dev);
>  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
>
> +void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
> +
>  #endif /* __PANFROST_GEM_H__ */


Adrian Larumbe
