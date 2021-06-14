Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 226613A6B85
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 18:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E331896E5;
	Mon, 14 Jun 2021 16:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE89B896E5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 16:19:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso315022wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 09:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MViLeFEta9cD0Ku4skH34wvqzRc9vMxWbwSBf+en+V8=;
 b=U1hOWJbakG0JG85YLBz41CAX8wjgY6YbhHqaPXW0dsWvEGU5O2eZ2DBr9lejB4tmVh
 5KvJRL8zvPURRW8J/b7HOyRQn5ZQOzoAn+Vvc8auw5pucr7jGUrF5ckwKZlTNkm995Wy
 bcrOSNL/n/ZCNA8VzGHifTLE16tuKs8UptOP9/CiMsi8DIOlLCqe3iY5hbm/6H9Nqxtq
 AZLBh7yDdOjusuHlOkfLIZ2aN8isUsSG2nQm6g2PTw+TVKlstiX6HxzQGkhsOD1wFLoO
 vOXziKeO59ALY94ySmJSUgBFKZONVg8j3PX35j2xf3JjMeT54YfI3QvSTFa6djWLr4ZI
 WoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MViLeFEta9cD0Ku4skH34wvqzRc9vMxWbwSBf+en+V8=;
 b=TZWkjWq+aT8ByAnOfDm0KvaTDnBqbkuaPr5RvnHizUJeAMY/TbfOn6VnN/xsDY5TNe
 JN6Kudf1XJlx+qbWqauR3eNesdCTL2q4V3VyWGODxZQJ8m91nQLVkXZ55v5KxhSL5GUV
 XpDLhmwQ/jp/qv9m7Z8O3mflF0vdnQB1uZQvyO54pxsau/J/m3zRBTQIx/X8JpVkIw/1
 5Y1+WNm+XMb9UbxS6C2dcsILSSA7MS52KwPZ3CPkeps/ntBix273vyelLDH85WilzaPa
 +92GA2CxNFhIaEoKUmgpwBz7yO2ybZogjBvMknVZUZX6bdR7SGJ9u6Ji7bim/nOv8pvz
 /7qg==
X-Gm-Message-State: AOAM5315Qv0UPDeHFSHGSGdgW7wKpoGVsYZbglQbdJlaqbtJJPZZMWUT
 u09RTld0ZNzygtBgjNzGrME=
X-Google-Smtp-Source: ABdhPJzeUzkXhVMqftQ6r+MA3yl/zK9DJhUX9W3hc5AnneR02wDhiGTcFI7UsqZ1GgvfiTJaKQEc8A==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr17415762wmk.181.1623687580481; 
 Mon, 14 Jun 2021 09:19:40 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id b62sm13473603wmh.47.2021.06.14.09.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 09:19:39 -0700 (PDT)
Date: Mon, 14 Jun 2021 17:19:25 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: "Juan A. Suarez Romero" <jasuarez@igalia.com>
Subject: Re: [PATCH] drm/v3d: Expose performance counters to userspace
Message-ID: <20210614161925.bnl54qwwmu3ve6gb@smtp.gmail.com>
References: <20210608111541.461991-1-jasuarez@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210608111541.461991-1-jasuarez@igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/08, Juan A. Suarez Romero wrote:
> The V3D engine has several hardware performance counters that can of
> interest for userspace performance analysis tools.
>=20
> This exposes new ioctls to create and destroy performance monitor
> objects, as well as to query the counter values.
>=20
> Each created performance monitor object has an ID that can be attached
> to CL/CSD submissions, so the driver enables the requested counters when
> the job is submitted, and updates the performance monitor values when
> the job is done.
>=20
> It is up to the user to ensure all the jobs have been finished before
> getting the performance monitor values. It is also up to the user to
> properly synchronize BCL jobs when submitting jobs with different
> performance monitors attached.
>=20
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Emma Anholt <emma@anholt.net>
> To: dri-devel@lists.freedesktop.org
> Signed-off-by: Juan A. Suarez Romero <jasuarez@igalia.com>

Hi Juan,

I've checked it (+ mesa MR) on glxgears, and lgtm.

+ some basic tests from igt, by default.

Acked-by: Melissa Wen <mwen@igalia.com>

> ---
>  drivers/gpu/drm/v3d/Makefile      |   1 +
>  drivers/gpu/drm/v3d/v3d_drv.c     |   8 ++
>  drivers/gpu/drm/v3d/v3d_drv.h     |  63 +++++++++
>  drivers/gpu/drm/v3d/v3d_gem.c     |  31 +++++
>  drivers/gpu/drm/v3d/v3d_perfmon.c | 213 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/v3d/v3d_regs.h    |   2 +
>  drivers/gpu/drm/v3d/v3d_sched.c   |  16 +++
>  include/uapi/drm/v3d_drm.h        | 136 +++++++++++++++++++
>  8 files changed, 470 insertions(+)
>  create mode 100644 drivers/gpu/drm/v3d/v3d_perfmon.c
>=20
> diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
> index db4cfc155821..e8b314137020 100644
> --- a/drivers/gpu/drm/v3d/Makefile
> +++ b/drivers/gpu/drm/v3d/Makefile
> @@ -9,6 +9,7 @@ v3d-y :=3D \
>  	v3d_gem.o \
>  	v3d_irq.o \
>  	v3d_mmu.o \
> +	v3d_perfmon.o \
>  	v3d_trace_points.o \
>  	v3d_sched.o
> =20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 99e22beea90b..9403c3b36aca 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -94,6 +94,9 @@ static int v3d_get_param_ioctl(struct drm_device *dev, =
void *data,
>  	case DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH:
>  		args->value =3D 1;
>  		return 0;
> +	case DRM_V3D_PARAM_SUPPORTS_PERFMON:
> +		args->value =3D (v3d->ver >=3D 40);
> +		return 0;
>  	default:
>  		DRM_DEBUG("Unknown parameter %d\n", args->param);
>  		return -EINVAL;
> @@ -121,6 +124,7 @@ v3d_open(struct drm_device *dev, struct drm_file *fil=
e)
>  				      1, NULL);
>  	}
> =20
> +	v3d_perfmon_open_file(v3d_priv);
>  	file->driver_priv =3D v3d_priv;
> =20
>  	return 0;
> @@ -136,6 +140,7 @@ v3d_postclose(struct drm_device *dev, struct drm_file=
 *file)
>  		drm_sched_entity_destroy(&v3d_priv->sched_entity[q]);
>  	}
> =20
> +	v3d_perfmon_close_file(v3d_priv);
>  	kfree(v3d_priv);
>  }
> =20
> @@ -156,6 +161,9 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] =
=3D {
>  	DRM_IOCTL_DEF_DRV(V3D_GET_BO_OFFSET, v3d_get_bo_offset_ioctl, DRM_RENDE=
R_ALLOW),
>  	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_TFU, v3d_submit_tfu_ioctl, DRM_RENDER_ALLO=
W | DRM_AUTH),
>  	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CSD, v3d_submit_csd_ioctl, DRM_RENDER_ALLO=
W | DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(V3D_PERFMON_CREATE, v3d_perfmon_create_ioctl, DRM_REN=
DER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(V3D_PERFMON_DESTROY, v3d_perfmon_destroy_ioctl, DRM_R=
ENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_VALUES, v3d_perfmon_get_values_ioctl,=
 DRM_RENDER_ALLOW),
>  };
> =20
>  static const struct drm_driver v3d_drm_driver =3D {
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 8a390738d65b..270134779073 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -37,6 +37,40 @@ struct v3d_queue_state {
>  	u64 emit_seqno;
>  };
> =20
> +/* Performance monitor object. The perform lifetime is controlled by use=
rspace
> + * using perfmon related ioctls. A perfmon can be attached to a submit_cl
> + * request, and when this is the case, HW perf counters will be activate=
d just
> + * before the submit_cl is submitted to the GPU and disabled when the jo=
b is
> + * done. This way, only events related to a specific job will be counted.
> + */
> +struct v3d_perfmon {
> +	/* Tracks the number of users of the perfmon, when this counter reaches
> +	 * zero the perfmon is destroyed.
> +	 */
> +	refcount_t refcnt;
> +
> +	/* Protects perfmon stop, as it can be invoked from multiple places. */
> +	struct mutex lock;
> +
> +	/* Number of counters activated in this perfmon instance
> +	 * (should be less than DRM_V3D_MAX_PERF_COUNTERS).
> +	 */
> +	u8 ncounters;
> +
> +	/* Events counted by the HW perf counters. */
> +	u8 counters[DRM_V3D_MAX_PERF_COUNTERS];
> +
> +	/* Storage for counter values. Counters are incremented by the
> +	 * HW perf counter values every time the perfmon is attached
> +	 * to a GPU job.  This way, perfmon users don't have to
> +	 * retrieve the results after each job if they want to track
> +	 * events covering several submissions.  Note that counter
> +	 * values can't be reset, but you can fake a reset by
> +	 * destroying the perfmon and creating a new one.
> +	 */
> +	u64 values[];
> +};
> +
>  struct v3d_dev {
>  	struct drm_device drm;
> =20
> @@ -89,6 +123,9 @@ struct v3d_dev {
>  	 */
>  	spinlock_t job_lock;
> =20
> +	/* Used to track the active perfmon if any. */
> +	struct v3d_perfmon *active_perfmon;
> +
>  	/* Protects bo_stats */
>  	struct mutex bo_lock;
> =20
> @@ -133,6 +170,11 @@ v3d_has_csd(struct v3d_dev *v3d)
>  struct v3d_file_priv {
>  	struct v3d_dev *v3d;
> =20
> +	struct {
> +		struct idr idr;
> +		struct mutex lock;
> +	} perfmon;
> +
>  	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
>  };
> =20
> @@ -205,6 +247,11 @@ struct v3d_job {
>  	 */
>  	struct dma_fence *done_fence;
> =20
> +	/* Pointer to a performance monitor object if the user requested it,
> +	 * NULL otherwise.
> +	 */
> +	struct v3d_perfmon *perfmon;
> +
>  	/* Callback for the freeing of the job on refcount going to 0. */
>  	void (*free)(struct kref *ref);
>  };
> @@ -353,3 +400,19 @@ void v3d_mmu_remove_ptes(struct v3d_bo *bo);
>  /* v3d_sched.c */
>  int v3d_sched_init(struct v3d_dev *v3d);
>  void v3d_sched_fini(struct v3d_dev *v3d);
> +
> +/* v3d_perfmon.c */
> +void v3d_perfmon_get(struct v3d_perfmon *perfmon);
> +void v3d_perfmon_put(struct v3d_perfmon *perfmon);
> +void v3d_perfmon_start(struct v3d_dev *v3d, struct v3d_perfmon *perfmon);
> +void v3d_perfmon_stop(struct v3d_dev *v3d, struct v3d_perfmon *perfmon,
> +		      bool capture);
> +struct v3d_perfmon *v3d_perfmon_find(struct v3d_file_priv *v3d_priv, int=
 id);
> +void v3d_perfmon_open_file(struct v3d_file_priv *v3d_priv);
> +void v3d_perfmon_close_file(struct v3d_file_priv *v3d_priv);
> +int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file_priv);
> +int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
> +			      struct drm_file *file_priv);
> +int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
> +				 struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 4eb354226972..5689da118197 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -126,6 +126,8 @@ v3d_reset(struct v3d_dev *v3d)
>  	v3d_mmu_set_page_table(v3d);
>  	v3d_irq_reset(v3d);
> =20
> +	v3d_perfmon_stop(v3d, v3d->active_perfmon, false);
> +
>  	trace_v3d_reset_end(dev);
>  }
> =20
> @@ -375,6 +377,9 @@ v3d_job_free(struct kref *ref)
>  	pm_runtime_mark_last_busy(job->v3d->drm.dev);
>  	pm_runtime_put_autosuspend(job->v3d->drm.dev);
> =20
> +	if (job->perfmon)
> +		v3d_perfmon_put(job->perfmon);
> +
>  	kfree(job);
>  }
> =20
> @@ -539,6 +544,9 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
> =20
>  	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
> =20
> +	if (args->pad !=3D 0)
> +		return -EINVAL;
> +
>  	if (args->flags !=3D 0 &&
>  	    args->flags !=3D DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
>  		DRM_INFO("invalid flags: %d\n", args->flags);
> @@ -611,8 +619,20 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *da=
ta,
>  	if (ret)
>  		goto fail;
> =20
> +	if (args->perfmon_id) {
> +		render->base.perfmon =3D v3d_perfmon_find(v3d_priv,
> +							args->perfmon_id);
> +
> +		if (!render->base.perfmon) {
> +			ret =3D -ENOENT;
> +			goto fail;
> +		}
> +	}
> +
>  	mutex_lock(&v3d->sched_lock);
>  	if (bin) {
> +		bin->base.perfmon =3D render->base.perfmon;
> +		v3d_perfmon_get(bin->base.perfmon);
>  		ret =3D v3d_push_job(v3d_priv, &bin->base, V3D_BIN);
>  		if (ret)
>  			goto fail_unreserve;
> @@ -633,6 +653,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  		ret =3D drm_gem_fence_array_add(&clean_job->deps, render_fence);
>  		if (ret)
>  			goto fail_unreserve;
> +		clean_job->perfmon =3D render->base.perfmon;
> +		v3d_perfmon_get(clean_job->perfmon);
>  		ret =3D v3d_push_job(v3d_priv, clean_job, V3D_CACHE_CLEAN);
>  		if (ret)
>  			goto fail_unreserve;
> @@ -827,6 +849,15 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *d=
ata,
>  	if (ret)
>  		goto fail;
> =20
> +	if (args->perfmon_id) {
> +		job->base.perfmon =3D v3d_perfmon_find(v3d_priv,
> +						     args->perfmon_id);
> +		if (!job->base.perfmon) {
> +			ret =3D -ENOENT;
> +			goto fail;
> +		}
> +	}
> +
>  	mutex_lock(&v3d->sched_lock);
>  	ret =3D v3d_push_job(v3d_priv, &job->base, V3D_CSD);
>  	if (ret)
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_=
perfmon.c
> new file mode 100644
> index 000000000000..0288ef063513
> --- /dev/null
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Raspberry Pi
> + */
> +
> +#include "v3d_drv.h"
> +#include "v3d_regs.h"
> +
> +#define V3D_PERFMONID_MIN	1
> +#define V3D_PERFMONID_MAX	U32_MAX
> +
> +void v3d_perfmon_get(struct v3d_perfmon *perfmon)
> +{
> +	if (perfmon)
> +		refcount_inc(&perfmon->refcnt);
> +}
> +
> +void v3d_perfmon_put(struct v3d_perfmon *perfmon)
> +{
> +	if (perfmon && refcount_dec_and_test(&perfmon->refcnt))
> +		kfree(perfmon);
> +}
> +
> +void v3d_perfmon_start(struct v3d_dev *v3d, struct v3d_perfmon *perfmon)
> +{
> +	unsigned int i;
> +	u32 mask;
> +	u8 ncounters =3D perfmon->ncounters;
> +
> +	if (WARN_ON_ONCE(!perfmon || v3d->active_perfmon))
> +		return;
> +
> +	mask =3D GENMASK(ncounters - 1, 0);
> +
> +	for (i =3D 0; i < ncounters; i++) {
> +		u32 source =3D i / 4;
> +		u32 channel =3D V3D_SET_FIELD(perfmon->counters[i], V3D_PCTR_S0);
> +
> +		i++;
> +		channel |=3D V3D_SET_FIELD(i < ncounters ? perfmon->counters[i] : 0,
> +					 V3D_PCTR_S1);
> +		i++;
> +		channel |=3D V3D_SET_FIELD(i < ncounters ? perfmon->counters[i] : 0,
> +					 V3D_PCTR_S2);
> +		i++;
> +		channel |=3D V3D_SET_FIELD(i < ncounters ? perfmon->counters[i] : 0,
> +					 V3D_PCTR_S3);
> +		V3D_CORE_WRITE(0, V3D_V4_PCTR_0_SRC_X(source), channel);
> +	}
> +
> +	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_CLR, mask);
> +	V3D_CORE_WRITE(0, V3D_PCTR_0_OVERFLOW, mask);
> +	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_EN, mask);
> +
> +	v3d->active_perfmon =3D perfmon;
> +}
> +
> +void v3d_perfmon_stop(struct v3d_dev *v3d, struct v3d_perfmon *perfmon,
> +		      bool capture)
> +{
> +	unsigned int i;
> +
> +	if (!perfmon || !v3d->active_perfmon)
> +		return;
> +
> +	mutex_lock(&perfmon->lock);
> +	if (perfmon !=3D v3d->active_perfmon) {
> +		mutex_unlock(&perfmon->lock);
> +		return;
> +	}
> +
> +	if (capture)
> +		for (i =3D 0; i < perfmon->ncounters; i++)
> +			perfmon->values[i] +=3D V3D_CORE_READ(0, V3D_PCTR_0_PCTRX(i));
> +
> +	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_EN, 0);
> +
> +	v3d->active_perfmon =3D NULL;
> +	mutex_unlock(&perfmon->lock);
> +}
> +
> +struct v3d_perfmon *v3d_perfmon_find(struct v3d_file_priv *v3d_priv, int=
 id)
> +{
> +	struct v3d_perfmon *perfmon;
> +
> +	mutex_lock(&v3d_priv->perfmon.lock);
> +	perfmon =3D idr_find(&v3d_priv->perfmon.idr, id);
> +	v3d_perfmon_get(perfmon);
> +	mutex_unlock(&v3d_priv->perfmon.lock);
> +
> +	return perfmon;
> +}
> +
> +void v3d_perfmon_open_file(struct v3d_file_priv *v3d_priv)
> +{
> +	mutex_init(&v3d_priv->perfmon.lock);
> +	idr_init(&v3d_priv->perfmon.idr);
> +}
> +
> +static int v3d_perfmon_idr_del(int id, void *elem, void *data)
> +{
> +	struct v3d_perfmon *perfmon =3D elem;
> +
> +	v3d_perfmon_put(perfmon);
> +
> +	return 0;
> +}
> +
> +void v3d_perfmon_close_file(struct v3d_file_priv *v3d_priv)
> +{
> +	mutex_lock(&v3d_priv->perfmon.lock);
> +	idr_for_each(&v3d_priv->perfmon.idr, v3d_perfmon_idr_del, NULL);
> +	idr_destroy(&v3d_priv->perfmon.idr);
> +	mutex_unlock(&v3d_priv->perfmon.lock);
> +}
> +
> +int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file_priv)
> +{
> +	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> +	struct drm_v3d_perfmon_create *req =3D data;
> +	struct v3d_perfmon *perfmon;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Number of monitored counters cannot exceed HW limits. */
> +	if (req->ncounters > DRM_V3D_MAX_PERF_COUNTERS ||
> +	    !req->ncounters)
> +		return -EINVAL;
> +
> +	/* Make sure all counters are valid. */
> +	for (i =3D 0; i < req->ncounters; i++) {
> +		if (req->counters[i] >=3D V3D_PERFCNT_NUM)
> +			return -EINVAL;
> +	}
> +
> +	perfmon =3D kzalloc(struct_size(perfmon, values, req->ncounters),
> +			  GFP_KERNEL);
> +	if (!perfmon)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < req->ncounters; i++)
> +		perfmon->counters[i] =3D req->counters[i];
> +
> +	perfmon->ncounters =3D req->ncounters;
> +
> +	refcount_set(&perfmon->refcnt, 1);
> +	mutex_init(&perfmon->lock);
> +
> +	mutex_lock(&v3d_priv->perfmon.lock);
> +	ret =3D idr_alloc(&v3d_priv->perfmon.idr, perfmon, V3D_PERFMONID_MIN,
> +			V3D_PERFMONID_MAX, GFP_KERNEL);
> +	mutex_unlock(&v3d_priv->perfmon.lock);
> +
> +	if (ret < 0) {
> +		kfree(perfmon);
> +		return ret;
> +	}
> +
> +	req->id =3D ret;
> +
> +	return 0;
> +}
> +
> +int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
> +			      struct drm_file *file_priv)
> +{
> +	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> +	struct drm_v3d_perfmon_destroy *req =3D data;
> +	struct v3d_perfmon *perfmon;
> +
> +	mutex_lock(&v3d_priv->perfmon.lock);
> +	perfmon =3D idr_remove(&v3d_priv->perfmon.idr, req->id);
> +	mutex_unlock(&v3d_priv->perfmon.lock);
> +
> +	if (!perfmon)
> +		return -EINVAL;
> +
> +	v3d_perfmon_put(perfmon);
> +
> +	return 0;
> +}
> +
> +int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
> +				 struct drm_file *file_priv)
> +{
> +	struct v3d_dev *v3d =3D to_v3d_dev(dev);
> +	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> +	struct drm_v3d_perfmon_get_values *req =3D data;
> +	struct v3d_perfmon *perfmon;
> +	int ret =3D 0;
> +
> +	if (req->pad !=3D 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&v3d_priv->perfmon.lock);
> +	perfmon =3D idr_find(&v3d_priv->perfmon.idr, req->id);
> +	v3d_perfmon_get(perfmon);
> +	mutex_unlock(&v3d_priv->perfmon.lock);
> +
> +	if (!perfmon)
> +		return -EINVAL;
> +
> +	v3d_perfmon_stop(v3d, perfmon, true);
> +
> +	if (copy_to_user(u64_to_user_ptr(req->values_ptr), perfmon->values,
> +			 perfmon->ncounters * sizeof(u64)))
> +		ret =3D -EFAULT;
> +
> +	v3d_perfmon_put(perfmon);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/v3d/v3d_regs.h b/drivers/gpu/drm/v3d/v3d_reg=
s.h
> index 9bcb57781d31..3663e0d6bf76 100644
> --- a/drivers/gpu/drm/v3d/v3d_regs.h
> +++ b/drivers/gpu/drm/v3d/v3d_regs.h
> @@ -347,6 +347,8 @@
>  /* Each src reg muxes four counters each. */
>  #define V3D_V4_PCTR_0_SRC_0_3                          0x00660
>  #define V3D_V4_PCTR_0_SRC_28_31                        0x0067c
> +#define V3D_V4_PCTR_0_SRC_X(x)                         (V3D_V4_PCTR_0_SR=
C_0_3 + \
> +							4 * (x))
>  # define V3D_PCTR_S0_MASK                              V3D_MASK(6, 0)
>  # define V3D_PCTR_S0_SHIFT                             0
>  # define V3D_PCTR_S1_MASK                              V3D_MASK(14, 8)
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sc=
hed.c
> index 8992480c88fa..c9a5c916d6eb 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -63,6 +63,16 @@ v3d_job_free(struct drm_sched_job *sched_job)
>  	v3d_job_put(job);
>  }
> =20
> +static void
> +v3d_switch_perfmon(struct v3d_dev *v3d, struct v3d_job *job)
> +{
> +	if (job->perfmon !=3D v3d->active_perfmon)
> +		v3d_perfmon_stop(v3d, v3d->active_perfmon, true);
> +
> +	if (job->perfmon && v3d->active_perfmon !=3D job->perfmon)
> +		v3d_perfmon_start(v3d, job->perfmon);
> +}
> +
>  /*
>   * Returns the fences that the job depends on, one by one.
>   *
> @@ -120,6 +130,8 @@ static struct dma_fence *v3d_bin_job_run(struct drm_s=
ched_job *sched_job)
>  	trace_v3d_submit_cl(dev, false, to_v3d_fence(fence)->seqno,
>  			    job->start, job->end);
> =20
> +	v3d_switch_perfmon(v3d, &job->base);
> +
>  	/* Set the current and end address of the control list.
>  	 * Writing the end register is what starts the job.
>  	 */
> @@ -169,6 +181,8 @@ static struct dma_fence *v3d_render_job_run(struct dr=
m_sched_job *sched_job)
>  	trace_v3d_submit_cl(dev, true, to_v3d_fence(fence)->seqno,
>  			    job->start, job->end);
> =20
> +	v3d_switch_perfmon(v3d, &job->base);
> +
>  	/* XXX: Set the QCFG */
> =20
>  	/* Set the current and end address of the control list.
> @@ -240,6 +254,8 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
> =20
>  	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);
> =20
> +	v3d_switch_perfmon(v3d, &job->base);
> +
>  	for (i =3D 1; i <=3D 6; i++)
>  		V3D_CORE_WRITE(0, V3D_CSD_QUEUED_CFG0 + 4 * i, job->args.cfg[i]);
>  	/* CFG0 write kicks off the job. */
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 1ce746e228d9..4104f22fb3d3 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -38,6 +38,9 @@ extern "C" {
>  #define DRM_V3D_GET_BO_OFFSET                     0x05
>  #define DRM_V3D_SUBMIT_TFU                        0x06
>  #define DRM_V3D_SUBMIT_CSD                        0x07
> +#define DRM_V3D_PERFMON_CREATE                    0x08
> +#define DRM_V3D_PERFMON_DESTROY                   0x09
> +#define DRM_V3D_PERFMON_GET_VALUES                0x0a
> =20
>  #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DR=
M_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
>  #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DR=
M_V3D_WAIT_BO, struct drm_v3d_wait_bo)
> @@ -47,6 +50,12 @@ extern "C" {
>  #define DRM_IOCTL_V3D_GET_BO_OFFSET       DRM_IOWR(DRM_COMMAND_BASE + DR=
M_V3D_GET_BO_OFFSET, struct drm_v3d_get_bo_offset)
>  #define DRM_IOCTL_V3D_SUBMIT_TFU          DRM_IOW(DRM_COMMAND_BASE + DRM=
_V3D_SUBMIT_TFU, struct drm_v3d_submit_tfu)
>  #define DRM_IOCTL_V3D_SUBMIT_CSD          DRM_IOW(DRM_COMMAND_BASE + DRM=
_V3D_SUBMIT_CSD, struct drm_v3d_submit_csd)
> +#define DRM_IOCTL_V3D_PERFMON_CREATE      DRM_IOWR(DRM_COMMAND_BASE + DR=
M_V3D_PERFMON_CREATE, \
> +						   struct drm_v3d_perfmon_create)
> +#define DRM_IOCTL_V3D_PERFMON_DESTROY     DRM_IOWR(DRM_COMMAND_BASE + DR=
M_V3D_PERFMON_DESTROY, \
> +						   struct drm_v3d_perfmon_destroy)
> +#define DRM_IOCTL_V3D_PERFMON_GET_VALUES  DRM_IOWR(DRM_COMMAND_BASE + DR=
M_V3D_PERFMON_GET_VALUES, \
> +						   struct drm_v3d_perfmon_get_values)
> =20
>  #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
> =20
> @@ -127,6 +136,11 @@ struct drm_v3d_submit_cl {
>  	__u32 bo_handle_count;
> =20
>  	__u32 flags;
> +
> +	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
> +	__u32 perfmon_id;
> +
> +	__u32 pad;
>  };
> =20
>  /**
> @@ -195,6 +209,7 @@ enum drm_v3d_param {
>  	DRM_V3D_PARAM_SUPPORTS_TFU,
>  	DRM_V3D_PARAM_SUPPORTS_CSD,
>  	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
> +	DRM_V3D_PARAM_SUPPORTS_PERFMON,
>  };
> =20
>  struct drm_v3d_get_param {
> @@ -258,6 +273,127 @@ struct drm_v3d_submit_csd {
>  	__u32 in_sync;
>  	/* Sync object to signal when the CSD job is done. */
>  	__u32 out_sync;
> +
> +	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
> +	__u32 perfmon_id;
> +};
> +
> +enum {
> +	V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS,
> +	V3D_PERFCNT_FEP_VALID_PRIMS,
> +	V3D_PERFCNT_FEP_EZ_NFCLIP_QUADS,
> +	V3D_PERFCNT_FEP_VALID_QUADS,
> +	V3D_PERFCNT_TLB_QUADS_STENCIL_FAIL,
> +	V3D_PERFCNT_TLB_QUADS_STENCILZ_FAIL,
> +	V3D_PERFCNT_TLB_QUADS_STENCILZ_PASS,
> +	V3D_PERFCNT_TLB_QUADS_ZERO_COV,
> +	V3D_PERFCNT_TLB_QUADS_NONZERO_COV,
> +	V3D_PERFCNT_TLB_QUADS_WRITTEN,
> +	V3D_PERFCNT_PTB_PRIM_VIEWPOINT_DISCARD,
> +	V3D_PERFCNT_PTB_PRIM_CLIP,
> +	V3D_PERFCNT_PTB_PRIM_REV,
> +	V3D_PERFCNT_QPU_IDLE_CYCLES,
> +	V3D_PERFCNT_QPU_ACTIVE_CYCLES_VERTEX_COORD_USER,
> +	V3D_PERFCNT_QPU_ACTIVE_CYCLES_FRAG,
> +	V3D_PERFCNT_QPU_CYCLES_VALID_INSTR,
> +	V3D_PERFCNT_QPU_CYCLES_TMU_STALL,
> +	V3D_PERFCNT_QPU_CYCLES_SCOREBOARD_STALL,
> +	V3D_PERFCNT_QPU_CYCLES_VARYINGS_STALL,
> +	V3D_PERFCNT_QPU_IC_HIT,
> +	V3D_PERFCNT_QPU_IC_MISS,
> +	V3D_PERFCNT_QPU_UC_HIT,
> +	V3D_PERFCNT_QPU_UC_MISS,
> +	V3D_PERFCNT_TMU_TCACHE_ACCESS,
> +	V3D_PERFCNT_TMU_TCACHE_MISS,
> +	V3D_PERFCNT_VPM_VDW_STALL,
> +	V3D_PERFCNT_VPM_VCD_STALL,
> +	V3D_PERFCNT_BIN_ACTIVE,
> +	V3D_PERFCNT_RDR_ACTIVE,
> +	V3D_PERFCNT_L2T_HITS,
> +	V3D_PERFCNT_L2T_MISSES,
> +	V3D_PERFCNT_CYCLE_COUNT,
> +	V3D_PERFCNT_QPU_CYCLES_STALLED_VERTEX_COORD_USER,
> +	V3D_PERFCNT_QPU_CYCLES_STALLED_FRAGMENT,
> +	V3D_PERFCNT_PTB_PRIMS_BINNED,
> +	V3D_PERFCNT_AXI_WRITES_WATCH_0,
> +	V3D_PERFCNT_AXI_READS_WATCH_0,
> +	V3D_PERFCNT_AXI_WRITE_STALLS_WATCH_0,
> +	V3D_PERFCNT_AXI_READ_STALLS_WATCH_0,
> +	V3D_PERFCNT_AXI_WRITE_BYTES_WATCH_0,
> +	V3D_PERFCNT_AXI_READ_BYTES_WATCH_0,
> +	V3D_PERFCNT_AXI_WRITES_WATCH_1,
> +	V3D_PERFCNT_AXI_READS_WATCH_1,
> +	V3D_PERFCNT_AXI_WRITE_STALLS_WATCH_1,
> +	V3D_PERFCNT_AXI_READ_STALLS_WATCH_1,
> +	V3D_PERFCNT_AXI_WRITE_BYTES_WATCH_1,
> +	V3D_PERFCNT_AXI_READ_BYTES_WATCH_1,
> +	V3D_PERFCNT_TLB_PARTIAL_QUADS,
> +	V3D_PERFCNT_TMU_CONFIG_ACCESSES,
> +	V3D_PERFCNT_L2T_NO_ID_STALL,
> +	V3D_PERFCNT_L2T_COM_QUE_STALL,
> +	V3D_PERFCNT_L2T_TMU_WRITES,
> +	V3D_PERFCNT_TMU_ACTIVE_CYCLES,
> +	V3D_PERFCNT_TMU_STALLED_CYCLES,
> +	V3D_PERFCNT_CLE_ACTIVE,
> +	V3D_PERFCNT_L2T_TMU_READS,
> +	V3D_PERFCNT_L2T_CLE_READS,
> +	V3D_PERFCNT_L2T_VCD_READS,
> +	V3D_PERFCNT_L2T_TMUCFG_READS,
> +	V3D_PERFCNT_L2T_SLC0_READS,
> +	V3D_PERFCNT_L2T_SLC1_READS,
> +	V3D_PERFCNT_L2T_SLC2_READS,
> +	V3D_PERFCNT_L2T_TMU_W_MISSES,
> +	V3D_PERFCNT_L2T_TMU_R_MISSES,
> +	V3D_PERFCNT_L2T_CLE_MISSES,
> +	V3D_PERFCNT_L2T_VCD_MISSES,
> +	V3D_PERFCNT_L2T_TMUCFG_MISSES,
> +	V3D_PERFCNT_L2T_SLC0_MISSES,
> +	V3D_PERFCNT_L2T_SLC1_MISSES,
> +	V3D_PERFCNT_L2T_SLC2_MISSES,
> +	V3D_PERFCNT_CORE_MEM_WRITES,
> +	V3D_PERFCNT_L2T_MEM_WRITES,
> +	V3D_PERFCNT_PTB_MEM_WRITES,
> +	V3D_PERFCNT_TLB_MEM_WRITES,
> +	V3D_PERFCNT_CORE_MEM_READS,
> +	V3D_PERFCNT_L2T_MEM_READS,
> +	V3D_PERFCNT_PTB_MEM_READS,
> +	V3D_PERFCNT_PSE_MEM_READS,
> +	V3D_PERFCNT_TLB_MEM_READS,
> +	V3D_PERFCNT_GMP_MEM_READS,
> +	V3D_PERFCNT_PTB_W_MEM_WORDS,
> +	V3D_PERFCNT_TLB_W_MEM_WORDS,
> +	V3D_PERFCNT_PSE_R_MEM_WORDS,
> +	V3D_PERFCNT_TLB_R_MEM_WORDS,
> +	V3D_PERFCNT_TMU_MRU_HITS,
> +	V3D_PERFCNT_COMPUTE_ACTIVE,
> +	V3D_PERFCNT_NUM,
> +};
> +
> +#define DRM_V3D_MAX_PERF_COUNTERS                 32
> +
> +struct drm_v3d_perfmon_create {
> +	__u32 id;
> +	__u32 ncounters;
> +	__u8 counters[DRM_V3D_MAX_PERF_COUNTERS];
> +};
> +
> +struct drm_v3d_perfmon_destroy {
> +	__u32 id;
> +};
> +
> +/*
> + * Returns the values of the performance counters tracked by this
> + * perfmon (as an array of ncounters u64 values).
> + *
> + * No implicit synchronization is performed, so the user has to
> + * guarantee that any jobs using this perfmon have already been
> + * completed  (probably by blocking on the seqno returned by the
> + * last exec that used the perfmon).
> + */
> +struct drm_v3d_perfmon_get_values {
> +	__u32 id;
> +	__u32 pad;
> +	__u64 values_ptr;
>  };
> =20
>  #if defined(__cplusplus)
> --=20
> 2.25.1
>=20
