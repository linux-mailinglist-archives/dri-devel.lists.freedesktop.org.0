Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E332E0ABF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443086E86B;
	Tue, 22 Dec 2020 13:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A946E870
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:32:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 3so2188173wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 05:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jHGi34ZB/N+Dn17ssoEvBfwYRGy4YQSTH23kh1sP/6s=;
 b=SHJqWlB2rC0vCP0DombACQxmxNgciBgS/xS/akJNaxpTerKVAUz6dAWxksXG2oCal9
 ZF8MwcRWAd+588kH4+EG741Vkw+qgAJ0nbEZ9itXy3+WOGnC0t9d93LBkXNZd/92/WfM
 v1ejJlrc3umpz88tUMl2JDz+k7eew25lo1UqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jHGi34ZB/N+Dn17ssoEvBfwYRGy4YQSTH23kh1sP/6s=;
 b=L/EDa98j5duQkYWTROBW5SAPNbI1k4zClAnUc/B7XQg4VDWoLs52vmunGAOZbw7/W4
 OQ4tZGwsRSdutkhMUwgOXnjdP3io1tXy2hkpzwdY596kFyGj6hNPTCuBm9eQruPiOoPV
 3bFD0APTac7qqYOI/YSj4WfTifTH54d7Kg9Pn48nZMxX6VtBxBz+3bBBNnjqhmPHeRgj
 tKxPw9ozWt6Cc55cBXUEMx0qmFEClzBZv1pKbc7Qx7D1Wnm3YwwbMyZm3NY4d/koztbO
 Q44JwqppWBlm721SdOFDIbaaTEmmtS940mAICezxm5ZiV3nETMvC9PEX+YJOvnz06/KM
 TGzg==
X-Gm-Message-State: AOAM530OpR+um9t5KVSyW9LE7LmYdy2l/IgQqV98uC6G1sMe2eM/jVeU
 WEEngOdAqwAghWoHxMHEifSO2Q==
X-Google-Smtp-Source: ABdhPJzEikNP8Zd2wcWMjFXBUqGRm/xf8Ue45LHkMwqPwE99VeOGdXxPTu8L+6a+pPTKJdqeigP0sw==
X-Received: by 2002:a1c:5f8a:: with SMTP id
 t132mr21852595wmb.121.1608643918761; 
 Tue, 22 Dec 2020 05:31:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h9sm30543682wre.24.2020.12.22.05.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 05:31:58 -0800 (PST)
Date: Tue, 22 Dec 2020 14:31:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm: add debugfs directory v2
Message-ID: <X+H1TB7AFi5iChOy@phenom.ffwll.local>
References: <20201218175538.1364-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218175538.1364-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 18, 2020 at 06:55:35PM +0100, Christian K=F6nig wrote:
> As far as I can tell the buffer_count was never used by an
> userspace application.
> =

> The number of BOs in the system is far better suited in
> debugfs than sysfs and we now should be able to add other
> information here as well.
> =

> v2: add that additionally to sysfs
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Not sure where I acked this, but looks reasonable.
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c     | 48 ++------------------------------
>  drivers/gpu/drm/ttm/ttm_module.c |  4 +++
>  drivers/gpu/drm/ttm/ttm_module.h |  6 ++--
>  3 files changed, 11 insertions(+), 47 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 31e8b3da5563..cd55e3104e50 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -44,8 +44,6 @@
>  =

>  #include "ttm_module.h"
>  =

> -static void ttm_bo_global_kobj_release(struct kobject *kobj);
> -
>  /*
>   * ttm_global_mutex - protecting the global BO state
>   */
> @@ -54,11 +52,6 @@ unsigned ttm_bo_glob_use_count;
>  struct ttm_bo_global ttm_bo_glob;
>  EXPORT_SYMBOL(ttm_bo_glob);
>  =

> -static struct attribute ttm_bo_count =3D {
> -	.name =3D "bo_count",
> -	.mode =3D S_IRUGO
> -};
> -
>  /* default destructor */
>  static void ttm_bo_default_destroy(struct ttm_buffer_object *bo)
>  {
> @@ -84,32 +77,6 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_o=
bject *bo,
>  	}
>  }
>  =

> -static ssize_t ttm_bo_global_show(struct kobject *kobj,
> -				  struct attribute *attr,
> -				  char *buffer)
> -{
> -	struct ttm_bo_global *glob =3D
> -		container_of(kobj, struct ttm_bo_global, kobj);
> -
> -	return snprintf(buffer, PAGE_SIZE, "%d\n",
> -				atomic_read(&glob->bo_count));
> -}
> -
> -static struct attribute *ttm_bo_global_attrs[] =3D {
> -	&ttm_bo_count,
> -	NULL
> -};
> -
> -static const struct sysfs_ops ttm_bo_global_ops =3D {
> -	.show =3D &ttm_bo_global_show
> -};
> -
> -static struct kobj_type ttm_bo_glob_kobj_type  =3D {
> -	.release =3D &ttm_bo_global_kobj_release,
> -	.sysfs_ops =3D &ttm_bo_global_ops,
> -	.default_attrs =3D ttm_bo_global_attrs
> -};
> -
>  static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> @@ -1226,14 +1193,6 @@ size_t ttm_bo_dma_acc_size(struct ttm_bo_device *b=
dev,
>  }
>  EXPORT_SYMBOL(ttm_bo_dma_acc_size);
>  =

> -static void ttm_bo_global_kobj_release(struct kobject *kobj)
> -{
> -	struct ttm_bo_global *glob =3D
> -		container_of(kobj, struct ttm_bo_global, kobj);
> -
> -	__free_page(glob->dummy_read_page);
> -}
> -
>  static void ttm_bo_global_release(void)
>  {
>  	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> @@ -1245,6 +1204,7 @@ static void ttm_bo_global_release(void)
>  	kobject_del(&glob->kobj);
>  	kobject_put(&glob->kobj);
>  	ttm_mem_global_release(&ttm_mem_glob);
> +	__free_page(glob->dummy_read_page);
>  	memset(glob, 0, sizeof(*glob));
>  out:
>  	mutex_unlock(&ttm_global_mutex);
> @@ -1277,10 +1237,8 @@ static int ttm_bo_global_init(void)
>  	INIT_LIST_HEAD(&glob->device_list);
>  	atomic_set(&glob->bo_count, 0);
>  =

> -	ret =3D kobject_init_and_add(
> -		&glob->kobj, &ttm_bo_glob_kobj_type, ttm_get_kobj(), "buffer_objects");
> -	if (unlikely(ret !=3D 0))
> -		kobject_put(&glob->kobj);
> +	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
> +				&glob->bo_count);
>  out:
>  	mutex_unlock(&ttm_global_mutex);
>  	return ret;
> diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_m=
odule.c
> index c0906437cb1c..f6566603a60f 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.c
> +++ b/drivers/gpu/drm/ttm/ttm_module.c
> @@ -32,12 +32,14 @@
>  #include <linux/module.h>
>  #include <linux/device.h>
>  #include <linux/sched.h>
> +#include <linux/debugfs.h>
>  #include <drm/drm_sysfs.h>
>  =

>  #include "ttm_module.h"
>  =

>  static DECLARE_WAIT_QUEUE_HEAD(exit_q);
>  static atomic_t device_released;
> +struct dentry *ttm_debugfs_root;
>  =

>  static struct device_type ttm_drm_class_type =3D {
>  	.name =3D "ttm",
> @@ -77,6 +79,7 @@ static int __init ttm_init(void)
>  	if (unlikely(ret !=3D 0))
>  		goto out_no_dev_reg;
>  =

> +	ttm_debugfs_root =3D debugfs_create_dir("ttm", NULL);
>  	return 0;
>  out_no_dev_reg:
>  	atomic_set(&device_released, 1);
> @@ -94,6 +97,7 @@ static void __exit ttm_exit(void)
>  	 */
>  =

>  	wait_event(exit_q, atomic_read(&device_released) =3D=3D 1);
> +	debugfs_remove(ttm_debugfs_root);
>  }
>  =

>  module_init(ttm_init);
> diff --git a/drivers/gpu/drm/ttm/ttm_module.h b/drivers/gpu/drm/ttm/ttm_m=
odule.h
> index 45fa318c1585..2f03c2fcf570 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.h
> +++ b/drivers/gpu/drm/ttm/ttm_module.h
> @@ -31,10 +31,12 @@
>  #ifndef _TTM_MODULE_H_
>  #define _TTM_MODULE_H_
>  =

> -#include <linux/kernel.h>
> +#define TTM_PFX "[TTM] "
> +
>  struct kobject;
> +struct dentry;
>  =

> -#define TTM_PFX "[TTM] "
>  extern struct kobject *ttm_get_kobj(void);
> +extern struct dentry *ttm_debugfs_root;
>  =

>  #endif /* _TTM_MODULE_H_ */
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
