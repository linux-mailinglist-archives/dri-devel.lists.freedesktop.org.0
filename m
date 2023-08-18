Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC60780767
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 10:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9126010E49F;
	Fri, 18 Aug 2023 08:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A0B10E49F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KOWKivwQyFwcbGXYpXm7/EbhzQTyYAfq+eCdgNUiKAY=; b=PwgzBme4vFpwN5ZYpdbzYmYMsD
 vvyovSVYMjRutg3rgFwoADFIqepYL+Q6el0DfinigWTx9BTsss2MvkKBiNJvaesw/iabk88D24pa7
 5bKc8KbiIx8FWWNBfaDQXNrOT4DaC6NBMtzoVVoyktBl/3Ha47Gbvp26BqCXpH9ZSnKstSeREAYvY
 kn72l80VOjy642GI2FXqV5N8aWkRJW8f6j/v+b4dL6o9T8IKl4S+1wQsdp+y2l6dkTftrfzjb0ZZ9
 rHlEMKBilqF/rn9KjBvWWR85OvwPcr1P01kY9TMo6Tz0GkIVBoIk92xk8g01LOfmZTbGRXSb85yyi
 P8fQIKsA==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qWv6K-002Efv-ET; Fri, 18 Aug 2023 10:45:00 +0200
Date: Fri, 18 Aug 2023 07:44:55 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 2/2] drm/v3d: Expose the total GPU usage stats on sysfs
Message-ID: <20230818084455.xi5kn3ernncsmuyh@mail.igalia.com>
References: <20230807211849.49867-1-mcanal@igalia.com>
 <20230807211849.49867-3-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rcx4xurxme6xb2k4"
Content-Disposition: inline
In-Reply-To: <20230807211849.49867-3-mcanal@igalia.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, kernel-dev@igalia.com,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 Chema Casanova <jmcasanova@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rcx4xurxme6xb2k4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/07, Ma=EDra Canal wrote:
> The previous patch exposed the accumulated amount of active time per
> client for each V3D queue. But this doesn't provide a global notion of
> the GPU usage.
>=20
> Therefore, provide the accumulated amount of active time for each V3D
> queue (BIN, RENDER, CSD, TFU and CACHE_CLEAN), considering all the jobs
> submitted to the queue, independent of the client.
>=20
> This data is exposed through the sysfs interface, so that if the
> interface is queried at two different points of time the usage percentage
> of each of the queues can be calculated.
>=20
> Co-developed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/v3d/Makefile    |   3 +-
>  drivers/gpu/drm/v3d/v3d_drv.c   |   9 +++
>  drivers/gpu/drm/v3d/v3d_drv.h   |   7 +++
>  drivers/gpu/drm/v3d/v3d_gem.c   |   5 +-
>  drivers/gpu/drm/v3d/v3d_irq.c   |  24 ++++++--
>  drivers/gpu/drm/v3d/v3d_sched.c |  13 +++-
>  drivers/gpu/drm/v3d/v3d_sysfs.c | 101 ++++++++++++++++++++++++++++++++
>  7 files changed, 155 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c
>=20
> diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
> index e8b314137020..4b21b20e4998 100644
> --- a/drivers/gpu/drm/v3d/Makefile
> +++ b/drivers/gpu/drm/v3d/Makefile
> @@ -11,7 +11,8 @@ v3d-y :=3D \
>  	v3d_mmu.o \
>  	v3d_perfmon.o \
>  	v3d_trace_points.o \
> -	v3d_sched.o
> +	v3d_sched.o \
> +	v3d_sysfs.o
> =20
>  v3d-$(CONFIG_DEBUG_FS) +=3D v3d_debugfs.o
> =20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index ca65c707da03..7fc84a2525ca 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -309,8 +309,14 @@ static int v3d_platform_drm_probe(struct platform_de=
vice *pdev)
>  	if (ret)
>  		goto irq_disable;
> =20
> +	ret =3D v3d_sysfs_init(dev);
> +	if (ret)
> +		goto drm_unregister;
> +
>  	return 0;
> =20
> +drm_unregister:
> +	drm_dev_unregister(drm);
>  irq_disable:
>  	v3d_irq_disable(v3d);
>  gem_destroy:
> @@ -324,6 +330,9 @@ static void v3d_platform_drm_remove(struct platform_d=
evice *pdev)
>  {
>  	struct drm_device *drm =3D platform_get_drvdata(pdev);
>  	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +	struct device *dev =3D &pdev->dev;
> +
> +	v3d_sysfs_destroy(dev);
> =20
>  	drm_dev_unregister(drm);
> =20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 7f2897e5b2cb..c8f95a91af46 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -38,6 +38,9 @@ struct v3d_queue_state {
> =20
>  	u64 fence_context;
>  	u64 emit_seqno;
> +
> +	u64 start_ns;
> +	u64 enabled_ns;
>  };
> =20
>  /* Performance monitor object. The perform lifetime is controlled by use=
rspace
> @@ -441,3 +444,7 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev,=
 void *data,
>  			      struct drm_file *file_priv);
>  int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
>  				 struct drm_file *file_priv);
> +
> +/* v3d_sysfs.c */
> +int v3d_sysfs_init(struct device *dev);
> +void v3d_sysfs_destroy(struct device *dev);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 40ed0c7c3fad..630ea2db8f8f 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -1014,8 +1014,11 @@ v3d_gem_init(struct drm_device *dev)
>  	u32 pt_size =3D 4096 * 1024;
>  	int ret, i;
> =20
> -	for (i =3D 0; i < V3D_MAX_QUEUES; i++)
> +	for (i =3D 0; i < V3D_MAX_QUEUES; i++) {
>  		v3d->queue[i].fence_context =3D dma_fence_context_alloc(1);
> +		v3d->queue[i].start_ns =3D 0;
> +		v3d->queue[i].enabled_ns =3D 0;
> +	}
> =20
>  	spin_lock_init(&v3d->mm_lock);
>  	spin_lock_init(&v3d->job_lock);
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index c898800ae9c2..be4ff7559309 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -102,9 +102,13 @@ v3d_irq(int irq, void *arg)
>  		struct v3d_fence *fence =3D
>  			to_v3d_fence(v3d->bin_job->base.irq_fence);
>  		struct v3d_file_priv *file =3D v3d->bin_job->base.file->driver_priv;
> +		u64 runtime =3D local_clock() - file->start_ns[V3D_BIN];
> =20
> -		file->enabled_ns[V3D_BIN] +=3D local_clock() - file->start_ns[V3D_BIN];
>  		file->start_ns[V3D_BIN] =3D 0;
> +		v3d->queue[V3D_BIN].start_ns =3D 0;
> +
> +		file->enabled_ns[V3D_BIN] +=3D runtime;
> +		v3d->queue[V3D_BIN].enabled_ns +=3D runtime;
> =20
>  		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
>  		dma_fence_signal(&fence->base);
> @@ -115,9 +119,13 @@ v3d_irq(int irq, void *arg)
>  		struct v3d_fence *fence =3D
>  			to_v3d_fence(v3d->render_job->base.irq_fence);
>  		struct v3d_file_priv *file =3D v3d->render_job->base.file->driver_priv;
> +		u64 runtime =3D local_clock() - file->start_ns[V3D_RENDER];
> =20
> -		file->enabled_ns[V3D_RENDER] +=3D local_clock() - file->start_ns[V3D_R=
ENDER];
>  		file->start_ns[V3D_RENDER] =3D 0;
> +		v3d->queue[V3D_RENDER].start_ns =3D 0;
> +
> +		file->enabled_ns[V3D_RENDER] +=3D runtime;
> +		v3d->queue[V3D_RENDER].enabled_ns +=3D runtime;
> =20
>  		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
>  		dma_fence_signal(&fence->base);
> @@ -128,9 +136,13 @@ v3d_irq(int irq, void *arg)
>  		struct v3d_fence *fence =3D
>  			to_v3d_fence(v3d->csd_job->base.irq_fence);
>  		struct v3d_file_priv *file =3D v3d->csd_job->base.file->driver_priv;
> +		u64 runtime =3D local_clock() - file->start_ns[V3D_CSD];
> =20
> -		file->enabled_ns[V3D_CSD] +=3D local_clock() - file->start_ns[V3D_CSD];
>  		file->start_ns[V3D_CSD] =3D 0;
> +		v3d->queue[V3D_CSD].start_ns =3D 0;
> +
> +		file->enabled_ns[V3D_CSD] +=3D runtime;
> +		v3d->queue[V3D_CSD].enabled_ns +=3D runtime;
> =20
>  		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
>  		dma_fence_signal(&fence->base);
> @@ -168,9 +180,13 @@ v3d_hub_irq(int irq, void *arg)
>  		struct v3d_fence *fence =3D
>  			to_v3d_fence(v3d->tfu_job->base.irq_fence);
>  		struct v3d_file_priv *file =3D v3d->tfu_job->base.file->driver_priv;
> +		u64 runtime =3D local_clock() - file->start_ns[V3D_TFU];
> =20
> -		file->enabled_ns[V3D_TFU] +=3D local_clock() - file->start_ns[V3D_TFU];
>  		file->start_ns[V3D_TFU] =3D 0;
> +		v3d->queue[V3D_TFU].start_ns =3D 0;
> +
> +		file->enabled_ns[V3D_TFU] +=3D runtime;
> +		v3d->queue[V3D_TFU].enabled_ns +=3D runtime;
> =20
>  		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
>  		dma_fence_signal(&fence->base);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sc=
hed.c
> index b360709c0765..1a9c7f395862 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -110,6 +110,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_s=
ched_job *sched_job)
>  			    job->start, job->end);
> =20
>  	file->start_ns[V3D_BIN] =3D local_clock();
> +	v3d->queue[V3D_BIN].start_ns =3D file->start_ns[V3D_BIN];
>  	file->jobs_sent[V3D_BIN]++;
> =20
>  	v3d_switch_perfmon(v3d, &job->base);
> @@ -165,6 +166,7 @@ static struct dma_fence *v3d_render_job_run(struct dr=
m_sched_job *sched_job)
>  			    job->start, job->end);
> =20
>  	file->start_ns[V3D_RENDER] =3D local_clock();
> +	v3d->queue[V3D_RENDER].start_ns =3D file->start_ns[V3D_RENDER];
>  	file->jobs_sent[V3D_RENDER]++;
> =20
>  	v3d_switch_perfmon(v3d, &job->base);
> @@ -201,6 +203,7 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
>  	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);
> =20
>  	file->start_ns[V3D_TFU] =3D local_clock();
> +	v3d->queue[V3D_TFU].start_ns =3D file->start_ns[V3D_TFU];
>  	file->jobs_sent[V3D_TFU]++;
> =20
>  	V3D_WRITE(V3D_TFU_IIA, job->args.iia);
> @@ -246,6 +249,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
>  	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);
> =20
>  	file->start_ns[V3D_CSD] =3D local_clock();
> +	v3d->queue[V3D_CSD].start_ns =3D file->start_ns[V3D_CSD];
>  	file->jobs_sent[V3D_CSD]++;
> =20
>  	v3d_switch_perfmon(v3d, &job->base);
> @@ -264,14 +268,21 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched=
_job)
>  	struct v3d_job *job =3D to_v3d_job(sched_job);
>  	struct v3d_dev *v3d =3D job->v3d;
>  	struct v3d_file_priv *file =3D job->file->driver_priv;
> +	u64 runtime;
> =20
>  	file->start_ns[V3D_CACHE_CLEAN] =3D local_clock();
> +	v3d->queue[V3D_CACHE_CLEAN].start_ns =3D file->start_ns[V3D_CACHE_CLEAN=
];
>  	file->jobs_sent[V3D_CACHE_CLEAN]++;
> =20
>  	v3d_clean_caches(v3d);
> =20
> -	file->enabled_ns[V3D_CACHE_CLEAN] +=3D local_clock() - file->start_ns[V=
3D_CACHE_CLEAN];
> +	runtime =3D local_clock() - file->start_ns[V3D_CACHE_CLEAN];
> +
> +	file->enabled_ns[V3D_CACHE_CLEAN] +=3D runtime;
> +	v3d->queue[V3D_CACHE_CLEAN].enabled_ns +=3D runtime;
> +
>  	file->start_ns[V3D_CACHE_CLEAN] =3D 0;
> +	v3d->queue[V3D_CACHE_CLEAN].start_ns =3D 0;
> =20
>  	return NULL;
>  }
> diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sy=
sfs.c
> new file mode 100644
> index 000000000000..19cef3ddb7c6
> --- /dev/null
> +++ b/drivers/gpu/drm/v3d/v3d_sysfs.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2023 Igalia S.L.
> + */
> +
> +#include <linux/sched/clock.h>
> +#include <linux/sysfs.h>
> +
> +#include "v3d_drv.h"
> +
> +static u64
> +v3d_sysfs_emit_total_runtime(struct v3d_dev *v3d, enum v3d_queue queue, =
char *buf)
> +{
> +	u64 timestamp =3D local_clock();
> +	u64 active_runtime;
> +
> +	if (v3d->queue[queue].start_ns)
> +		active_runtime =3D timestamp - v3d->queue[queue].start_ns;
> +	else
> +		active_runtime =3D 0;
> +
> +	return sysfs_emit(buf, "timestamp: %llu %s: %llu ns\n",
> +			  timestamp,
> +			  v3d_queue_to_string(queue),
> +			  v3d->queue[queue].enabled_ns + active_runtime);
> +}

A brief description (code comment) of these outputs would be goo too.

Melissa

> +
> +static ssize_t
> +bin_queue_show(struct device *dev, struct device_attribute *attr, char *=
buf)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +
> +	return v3d_sysfs_emit_total_runtime(v3d, V3D_BIN, buf);
> +}
> +static DEVICE_ATTR_RO(bin_queue);
> +
> +static ssize_t
> +render_queue_show(struct device *dev, struct device_attribute *attr, cha=
r *buf)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +
> +	return v3d_sysfs_emit_total_runtime(v3d, V3D_RENDER, buf);
> +}
> +static DEVICE_ATTR_RO(render_queue);
> +
> +static ssize_t
> +tfu_queue_show(struct device *dev, struct device_attribute *attr, char *=
buf)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +
> +	return v3d_sysfs_emit_total_runtime(v3d, V3D_TFU, buf);
> +}
> +static DEVICE_ATTR_RO(tfu_queue);
> +
> +static ssize_t
> +csd_queue_show(struct device *dev, struct device_attribute *attr, char *=
buf)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +
> +	return v3d_sysfs_emit_total_runtime(v3d, V3D_CSD, buf);
> +}
> +static DEVICE_ATTR_RO(csd_queue);
> +
> +static ssize_t
> +cache_clean_queue_show(struct device *dev, struct device_attribute *attr=
, char *buf)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +
> +	return v3d_sysfs_emit_total_runtime(v3d, V3D_CACHE_CLEAN, buf);
> +}
> +static DEVICE_ATTR_RO(cache_clean_queue);
> +
> +static struct attribute *v3d_sysfs_entries[] =3D {
> +	&dev_attr_bin_queue.attr,
> +	&dev_attr_render_queue.attr,
> +	&dev_attr_tfu_queue.attr,
> +	&dev_attr_csd_queue.attr,
> +	&dev_attr_cache_clean_queue.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group v3d_sysfs_attr_group =3D {
> +	.attrs =3D v3d_sysfs_entries,
> +};
> +
> +int
> +v3d_sysfs_init(struct device *dev)
> +{
> +	return sysfs_create_group(&dev->kobj, &v3d_sysfs_attr_group);
> +}
> +
> +void
> +v3d_sysfs_destroy(struct device *dev)
> +{
> +	return sysfs_remove_group(&dev->kobj, &v3d_sysfs_attr_group);
> +}
> --=20
> 2.41.0
>=20

--rcx4xurxme6xb2k4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTfL4cACgkQwqF3j0dL
ehxv5A/+OqPW5w3/0IqqfdM3Hoh8U34sI4bn0m56+hRH3qq031uTD0uwWjvHyKnU
l6GFNCOmcnzYzW6vavGjVWWDScCOnjt6WdDmkvktyDevfhy/8MRSMu/ObIBhkYql
ofb3dSw7szAcJuc8gZ1E/uctPcIhtOIUPwlMcToQp1cmqlcGpUxxiwZcifX86fhF
++V6dlaq2KerLJERmK1SlfGYn1yAXIoQHRPk4DEMFfDlKG2j82RTb9Bf4KZd7Cko
HsvhVoH1HMTJdiguGyaGxL3HwXcb9/9z9Drvgy1sMKK7aG39b73iOFUDHuxN6ibC
uUmCZqbasaQd+9Sb0sdIxmRYQ6XQiHcV7Ac1SQjfYjk6fU/QYX49zL2FQmmNUD58
w7P1MWRw2bi53NCEYK0sPANUU6n0Ni3cTEsXc2sapdm7oo9QPmv+0YrSRFFVFbbO
wifBWo6a89PRoO6CqDTKd5RyMLnbUAgy0F0VNp3WGMt2miYK9N9RQqLzOUeRjhHo
myiFZnvNZYVcfW7GO1Baij6MvdT5qQg+1+xerpSsqMB3YYrDRCVUdiN+g+hrgyIV
swyjRkJz4IQ/82lKNPE8tlX61xD5mDTnEcaoDvQS7wcicjkV9nr8yf5ppEB62QOP
HYBb4lN+4kViaUSCcJLz0TU7MQrJx9Ul39mXB+Wmr0UcBiTxyso=
=bgc3
-----END PGP SIGNATURE-----

--rcx4xurxme6xb2k4--
