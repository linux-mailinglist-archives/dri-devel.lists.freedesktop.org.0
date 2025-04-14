Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7DBA88D3F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 22:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F6410E2C0;
	Mon, 14 Apr 2025 20:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="UAIQzvJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D42D10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 20:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744663281; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=e6UB8mD5gBtSx5woyQ8voZo7onCXMwl7LnqS4japMtahy6FD7B9Bk3QgFms8EdOHYwsYuieEyad9Cd6sNTQNr52kWGuU1H4Pkg2PhZAdA1WzKNIJ7BCFXMpyI9VT5ogASoXa/XHpmbYzNihHKeip6jZHVk07XqUu3S8MRGyPk18=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744663281;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=OwXZu9pVPYrQgdsIt9IN1Gimn7BexONJbVJH5Oqt6kU=; 
 b=MvK+NOrt1jURE16fDPhQE7Ux+J7h0P9jxYmF9GTGiyhPCbfK3CSjYjPizBAovtCBfyeSZnRzbYBlSSP+YTnj4id6g24DZTBot1LVwRsfBckMJhDyZN+VyaBgkiX1gunZvBd+DlLlti4NHAP3p71qc0v4iLHlONoG5z7qM+4wVGY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744663281; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=OwXZu9pVPYrQgdsIt9IN1Gimn7BexONJbVJH5Oqt6kU=;
 b=UAIQzvJJPkFVGkybmi3ZORvY1IIHXlA5OiFC4npFDmxob5X5p3jcyy2mnb4DIq7c
 08azyExoLsGiwYCLtirtOALATpyY1n5FNuW8KxnkRwNH98Z/exaiGyYgY1UF1Ibwh1s
 7OKbs3qdJl6UlGeKmzOx5UJamY7q8MVjIdSqmuAE=
Received: by mx.zohomail.com with SMTPS id 174466327828126.87847580144978;
 Mon, 14 Apr 2025 13:41:18 -0700 (PDT)
Date: Mon, 14 Apr 2025 21:41:13 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v7 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Message-ID: <oc7nqx5gxrefaphpoyn7tsyhj2zcpbhwuxnhlgxtp6exet2ebz@wve2rz376pf4>
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
 <20250411150357.3308921-3-adrian.larumbe@collabora.com>
 <6d67aff0-7082-4966-acb2-d7985820b3ea@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d67aff0-7082-4966-acb2-d7985820b3ea@arm.com>
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

On 14.04.2025 11:01, Steven Price wrote:
> On 11/04/2025 16:03, Adrián Larumbe wrote:
> > Allow UM to label a BO for which it possesses a DRM handle.
> >
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
> Although very minor NITs below which you can consider.
>
> > ---
> >  drivers/gpu/drm/panthor/panthor_drv.c | 42 ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/panthor/panthor_gem.h |  2 ++
> >  include/uapi/drm/panthor_drm.h        | 23 +++++++++++++++
> >  3 files changed, 66 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index 06fe46e32073..983b24f1236c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -1331,6 +1331,44 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
> >  	return 0;
> >  }
> >
> > +static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *data,
> > +				  struct drm_file *file)
> > +{
> > +	struct drm_panthor_bo_set_label *args = data;
> > +	struct drm_gem_object *obj;
> > +	const char *label;
> > +	int ret = 0;
> > +
> > +	obj = drm_gem_object_lookup(file, args->handle);
> > +	if (!obj)
> > +		return -ENOENT;
> > +
> > +	if (args->size && args->label) {
> > +		if (args->size > PANTHOR_BO_LABEL_MAXLEN) {
> > +			ret = -E2BIG;
> > +			goto err_label;
> > +		}
> > +
> > +		label = strndup_user(u64_to_user_ptr(args->label), args->size);
> > +		if (IS_ERR(label)) {
> > +			ret = PTR_ERR(label);
> > +			goto err_label;
> > +		}
> > +	} else if (args->size && !args->label) {
> > +		ret = -EINVAL;
> > +		goto err_label;
> > +	} else {
> > +		label = NULL;
> > +	}
> > +
> > +	panthor_gem_bo_set_label(obj, label);
> > +
> > +err_label:
> > +	drm_gem_object_put(obj);
> > +
> > +	return ret;
> > +}
> > +
> >  static int
> >  panthor_open(struct drm_device *ddev, struct drm_file *file)
> >  {
> > @@ -1400,6 +1438,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
> >  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
> >  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
> >  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> > +	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
> >  };
> >
> >  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> > @@ -1509,6 +1548,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
> >   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
> >   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
> >   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> > + * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
> >   */
> >  static const struct drm_driver panthor_drm_driver = {
> >  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> > @@ -1522,7 +1562,7 @@ static const struct drm_driver panthor_drm_driver = {
> >  	.name = "panthor",
> >  	.desc = "Panthor DRM driver",
> >  	.major = 1,
> > -	.minor = 3,
> > +	.minor = 4,
> >
> >  	.gem_create_object = panthor_gem_create_object,
> >  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> > index af0d77338860..beba066b4974 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.h
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> > @@ -13,6 +13,8 @@
> >
> >  struct panthor_vm;
> >
> > +#define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
> > +
> >  /**
> >   * struct panthor_gem_object - Driver specific GEM object.
> >   */
> > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> > index 97e2c4510e69..12b1994499a9 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
> >
> >  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
> >  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> > +
> > +	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
> > +	DRM_PANTHOR_BO_SET_LABEL,
> >  };
> >
> >  /**
> > @@ -977,6 +980,24 @@ struct drm_panthor_tiler_heap_destroy {
> >  	__u32 pad;
> >  };
> >
> > +/**
> > + * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTHOR_BO_SET_LABEL
> > + */
> > +struct drm_panthor_bo_set_label {
> > +	/** @handle: Handle of the buffer object to label. */
> > +	__u32 handle;
> > +
> > +	/**
> > +	 * @size: Length of the label, including the NULL terminator.
> > +	 *
> > +	 * Cannot be greater than the OS page size.
> > +	 */
> > +	__u32 size;
> > +
> > +	/** @label: User pointer to a NULL-terminated string */
> > +	__u64 label;
> > +};
>
> First very minor NIT:
>  * NULL is a pointer, i.e. (void*)0
>  * NUL is the ASCII code point '\0'.
> So it's a NUL-terminated string.

Fixed

> Second NIT: We don't actually need 'size' - since the string is
> NUL-terminated we can just strndup_user(__user_pointer__, PAGE_SIZE).
> As things stand we validate that strlen(label) < size <= PAGE_SIZE -
> which is a little odd (user space might as well just pass PAGE_SIZE
> rather than calculate the actual length).

The snag I see in this approach is that the only way to make sure
strlen(label) + 1 <= PAGE_SIZE would be doing something like

label = strndup_user(u64_to_user_ptr(args->label), args->size);
if (strlen(label) + 1 <= PAGE_SIZE) {
   kfree(label)
   return -E2BIG;
}

In the meantime, we've duplicated the string and traversed a whole page
of bytes, all to be discarded at once.

In this case, I think it's alright to expect some cooperation from UM
in supplying the actual size, although I'm really not an expert in
designing elegant uAPIs, so if you think this looks very odd I'd be
glad to replace it with.

Actually, as I was writing this, I realised that strndup_user() calls
strnlen_user(), which is publicly available for other drivers, so
I might check the length first, and if it falls within bounds, do
the actual user stringdup.

I shall also mention the size bound on the uAPI for the 'label' pointer.

> Thanks,
> Steve
>
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1019,6 +1040,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +	DRM_IOCTL_PANTHOR_BO_SET_LABEL =
> +		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  };
>
>  #if defined(__cplusplus)


Adrian Larumbe
