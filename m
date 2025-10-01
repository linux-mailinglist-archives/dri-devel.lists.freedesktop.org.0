Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F670BB108B
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 17:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6899010E72B;
	Wed,  1 Oct 2025 15:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nR+MbZnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A5B10E315
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759331992;
 bh=zZETUdqrdinLtX9xv+ceX8tP9fngMdmnHtNs3GZIGzA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nR+MbZnLTi04wSJwEiGOsR9IM0FqcVWj/ytqm0LbgTsuYN/RpZWpWLjYKvzvQ0G5x
 ot4jHEWa0TZliMHFoykwQHUoAEGkJ4mmQqA0/6cYljXZ+EnHt3W0HjBdOlD7E9e3WR
 ORhqWn8Fu7a816iuo9KDr23BHlVCIciQg2qeXUOpvoI5CRJ5hLOqn4o2kJy2oxRnwU
 IV/DRjcPWFoQ7RmbZsLLWU8AclFNAJzca2ZoUIrIdQbb7PkqdxCJQWWiRUGH/d0JAn
 5MYpUJsfULWn6ZkznT0f/25UA+AaO+0egbjsnHEcFD9EDVpd0ffvUbBMlLsA/vSuz+
 vy5MtkNfH3rtQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 546D317E055D;
 Wed,  1 Oct 2025 17:19:52 +0200 (CEST)
Date: Wed, 1 Oct 2025 17:19:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com, Rob Herring
 <robh@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH v4 10/10] drm/panfrost: Rename panfrost_job functions to
 reflect real role
Message-ID: <20251001171948.003493d2@fedora>
In-Reply-To: <20251001022039.1215976-11-adrian.larumbe@collabora.com>
References: <20251001022039.1215976-1-adrian.larumbe@collabora.com>
 <20251001022039.1215976-11-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  1 Oct 2025 03:20:31 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> panfrost_job_* prefixed functions in panfrost_job.c deal with both
> panfrost_job objects and also the more general JM (Job Manager) side of
> the device itself. This is confusing.
>=20
> Reprefix functions that program the JM to panfrosot_jm_* instead.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 14 +++----
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  4 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 48 +++++++++++-----------
>  drivers/gpu/drm/panfrost/panfrost_job.h    | 16 ++++----
>  4 files changed, 41 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index f1d811a6de6c..c61b97af120c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -259,7 +259,7 @@ int panfrost_device_init(struct panfrost_device *pfde=
v)
>  	if (err)
>  		goto out_gpu;
> =20
> -	err =3D panfrost_job_init(pfdev);
> +	err =3D panfrost_jm_init(pfdev);
>  	if (err)
>  		goto out_mmu;
> =20
> @@ -269,7 +269,7 @@ int panfrost_device_init(struct panfrost_device *pfde=
v)
> =20
>  	return 0;
>  out_job:
> -	panfrost_job_fini(pfdev);
> +	panfrost_jm_fini(pfdev);
>  out_mmu:
>  	panfrost_mmu_fini(pfdev);
>  out_gpu:
> @@ -290,7 +290,7 @@ int panfrost_device_init(struct panfrost_device *pfde=
v)
>  void panfrost_device_fini(struct panfrost_device *pfdev)
>  {
>  	panfrost_perfcnt_fini(pfdev);
> -	panfrost_job_fini(pfdev);
> +	panfrost_jm_fini(pfdev);
>  	panfrost_mmu_fini(pfdev);
>  	panfrost_gpu_fini(pfdev);
>  	panfrost_devfreq_fini(pfdev);
> @@ -407,9 +407,9 @@ void panfrost_device_reset(struct panfrost_device *pf=
dev, bool enable_job_int)
>  	panfrost_gpu_power_on(pfdev);
>  	panfrost_mmu_reset(pfdev);
> =20
> -	panfrost_job_reset_interrupts(pfdev);
> +	panfrost_jm_reset_interrupts(pfdev);
>  	if (enable_job_int)
> -		panfrost_job_enable_interrupts(pfdev);
> +		panfrost_jm_enable_interrupts(pfdev);
>  }
> =20
>  static int panfrost_device_runtime_resume(struct device *dev)
> @@ -451,11 +451,11 @@ static int panfrost_device_runtime_suspend(struct d=
evice *dev)
>  {
>  	struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> =20
> -	if (!panfrost_job_is_idle(pfdev))
> +	if (!panfrost_jm_is_idle(pfdev))
>  		return -EBUSY;
> =20
>  	panfrost_devfreq_suspend(pfdev);
> -	panfrost_job_suspend_irq(pfdev);
> +	panfrost_jm_suspend_irq(pfdev);
>  	panfrost_mmu_suspend_irq(pfdev);
>  	panfrost_gpu_suspend_irq(pfdev);
>  	panfrost_gpu_power_off(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 2b57f6813714..3b79ebbccdf5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -606,7 +606,7 @@ panfrost_open(struct drm_device *dev, struct drm_file=
 *file)
>  		goto err_free;
>  	}
> =20
> -	ret =3D panfrost_job_open(file);
> +	ret =3D panfrost_jm_open(file);
>  	if (ret)
>  		goto err_job;
> =20
> @@ -625,7 +625,7 @@ panfrost_postclose(struct drm_device *dev, struct drm=
_file *file)
>  	struct panfrost_file_priv *panfrost_priv =3D file->driver_priv;
> =20
>  	panfrost_perfcnt_close(file);
> -	panfrost_job_close(file);
> +	panfrost_jm_close(file);
> =20
>  	panfrost_mmu_ctx_put(panfrost_priv->mmu);
>  	kfree(panfrost_priv);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 3ae984f6290f..4a213db9962d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -426,18 +426,18 @@ static struct dma_fence *panfrost_job_run(struct dr=
m_sched_job *sched_job)
>  	return fence;
>  }
> =20
> -void panfrost_job_reset_interrupts(struct panfrost_device *pfdev)
> +void panfrost_jm_reset_interrupts(struct panfrost_device *pfdev)
>  {
>  	job_write(pfdev, JOB_INT_CLEAR, ALL_JS_INT_MASK);
>  }
> =20
> -void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
> +void panfrost_jm_enable_interrupts(struct panfrost_device *pfdev)
>  {
>  	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
>  	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
>  }
> =20
> -void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
> +void panfrost_jm_suspend_irq(struct panfrost_device *pfdev)
>  {
>  	set_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
> =20
> @@ -499,8 +499,8 @@ static void panfrost_job_handle_err(struct panfrost_d=
evice *pfdev,
>  	}
>  }
> =20
> -static void panfrost_job_handle_done(struct panfrost_device *pfdev,
> -				     struct panfrost_job *job)
> +static void panfrost_jm_handle_done(struct panfrost_device *pfdev,
> +				    struct panfrost_job *job)
>  {
>  	/* Set ->jc to 0 to avoid re-submitting an already finished job (can
>  	 * happen when we receive the DONE interrupt while doing a GPU reset).
> @@ -513,7 +513,7 @@ static void panfrost_job_handle_done(struct panfrost_=
device *pfdev,
>  	pm_runtime_put_autosuspend(pfdev->base.dev);
>  }
> =20
> -static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 s=
tatus)
> +static void panfrost_jm_handle_irq(struct panfrost_device *pfdev, u32 st=
atus)
>  {
>  	struct panfrost_job *done[NUM_JOB_SLOTS][2] =3D {};
>  	struct panfrost_job *failed[NUM_JOB_SLOTS] =3D {};
> @@ -588,7 +588,7 @@ static void panfrost_job_handle_irq(struct panfrost_d=
evice *pfdev, u32 status)
>  		}
> =20
>  		for (i =3D 0; i < ARRAY_SIZE(done[0]) && done[j][i]; i++)
> -			panfrost_job_handle_done(pfdev, done[j][i]);
> +			panfrost_jm_handle_done(pfdev, done[j][i]);
>  	}
> =20
>  	/* And finally we requeue jobs that were waiting in the second slot
> @@ -606,7 +606,7 @@ static void panfrost_job_handle_irq(struct panfrost_d=
evice *pfdev, u32 status)
>  			struct panfrost_job *canceled =3D panfrost_dequeue_job(pfdev, j);
> =20
>  			dma_fence_set_error(canceled->done_fence, -ECANCELED);
> -			panfrost_job_handle_done(pfdev, canceled);
> +			panfrost_jm_handle_done(pfdev, canceled);
>  		} else if (!atomic_read(&pfdev->reset.pending)) {
>  			/* Requeue the job we removed if no reset is pending */
>  			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_START);
> @@ -614,7 +614,7 @@ static void panfrost_job_handle_irq(struct panfrost_d=
evice *pfdev, u32 status)
>  	}
>  }
> =20
> -static void panfrost_job_handle_irqs(struct panfrost_device *pfdev)
> +static void panfrost_jm_handle_irqs(struct panfrost_device *pfdev)
>  {
>  	u32 status =3D job_read(pfdev, JOB_INT_RAWSTAT);
> =20
> @@ -622,7 +622,7 @@ static void panfrost_job_handle_irqs(struct panfrost_=
device *pfdev)
>  		pm_runtime_mark_last_busy(pfdev->base.dev);
> =20
>  		spin_lock(&pfdev->js->job_lock);
> -		panfrost_job_handle_irq(pfdev, status);
> +		panfrost_jm_handle_irq(pfdev, status);
>  		spin_unlock(&pfdev->js->job_lock);
>  		status =3D job_read(pfdev, JOB_INT_RAWSTAT);
>  	}
> @@ -703,7 +703,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  		dev_err(pfdev->base.dev, "Soft-stop failed\n");
> =20
>  	/* Handle the remaining interrupts before we reset. */
> -	panfrost_job_handle_irqs(pfdev);
> +	panfrost_jm_handle_irqs(pfdev);
> =20
>  	/* Remaining interrupts have been handled, but we might still have
>  	 * stuck jobs. Let's make sure the PM counters stay balanced by
> @@ -748,7 +748,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  		drm_sched_start(&pfdev->js->queue[i].sched, 0);
> =20
>  	/* Re-enable job interrupts now that everything has been restarted. */
> -	panfrost_job_enable_interrupts(pfdev);
> +	panfrost_jm_enable_interrupts(pfdev);
> =20
>  	dma_fence_end_signalling(cookie);
>  }
> @@ -813,11 +813,11 @@ static const struct drm_sched_backend_ops panfrost_=
sched_ops =3D {
>  	.free_job =3D panfrost_job_free
>  };
> =20
> -static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
> +static irqreturn_t panfrost_jm_irq_handler_thread(int irq, void *data)
>  {
>  	struct panfrost_device *pfdev =3D data;
> =20
> -	panfrost_job_handle_irqs(pfdev);
> +	panfrost_jm_handle_irqs(pfdev);
> =20
>  	/* Enable interrupts only if we're not about to get suspended */
>  	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
> @@ -826,7 +826,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(in=
t irq, void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> -static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
> +static irqreturn_t panfrost_jm_irq_handler(int irq, void *data)
>  {
>  	struct panfrost_device *pfdev =3D data;
>  	u32 status;
> @@ -842,7 +842,7 @@ static irqreturn_t panfrost_job_irq_handler(int irq, =
void *data)
>  	return IRQ_WAKE_THREAD;
>  }
> =20
> -int panfrost_job_init(struct panfrost_device *pfdev)
> +int panfrost_jm_init(struct panfrost_device *pfdev)
>  {
>  	struct drm_sched_init_args args =3D {
>  		.ops =3D &panfrost_sched_ops,
> @@ -875,8 +875,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		return js->irq;
> =20
>  	ret =3D devm_request_threaded_irq(pfdev->base.dev, js->irq,
> -					panfrost_job_irq_handler,
> -					panfrost_job_irq_handler_thread,
> +					panfrost_jm_irq_handler,
> +					panfrost_jm_irq_handler_thread,
>  					IRQF_SHARED, KBUILD_MODNAME "-job",
>  					pfdev);
>  	if (ret) {
> @@ -899,8 +899,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		}
>  	}
> =20
> -	panfrost_job_reset_interrupts(pfdev);
> -	panfrost_job_enable_interrupts(pfdev);
> +	panfrost_jm_reset_interrupts(pfdev);
> +	panfrost_jm_enable_interrupts(pfdev);
> =20
>  	return 0;
> =20
> @@ -912,7 +912,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  	return ret;
>  }
> =20
> -void panfrost_job_fini(struct panfrost_device *pfdev)
> +void panfrost_jm_fini(struct panfrost_device *pfdev)
>  {
>  	struct panfrost_job_slot *js =3D pfdev->js;
>  	int j;
> @@ -927,7 +927,7 @@ void panfrost_job_fini(struct panfrost_device *pfdev)
>  	destroy_workqueue(pfdev->reset.wq);
>  }
> =20
> -int panfrost_job_open(struct drm_file *file)
> +int panfrost_jm_open(struct drm_file *file)
>  {
>  	struct panfrost_file_priv *panfrost_priv =3D file->driver_priv;
>  	int ret;
> @@ -949,7 +949,7 @@ int panfrost_job_open(struct drm_file *file)
>  	return 0;
>  }
> =20
> -void panfrost_job_close(struct drm_file *file)
> +void panfrost_jm_close(struct drm_file *file)
>  {
>  	struct panfrost_file_priv *panfrost_priv =3D file->driver_priv;
>  	struct panfrost_jm_ctx *jm_ctx;
> @@ -961,7 +961,7 @@ void panfrost_job_close(struct drm_file *file)
>  	xa_destroy(&panfrost_priv->jm_ctxs);
>  }
> =20
> -int panfrost_job_is_idle(struct panfrost_device *pfdev)
> +int panfrost_jm_is_idle(struct panfrost_device *pfdev)
>  {
>  	struct panfrost_job_slot *js =3D pfdev->js;
>  	int i;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/pa=
nfrost/panfrost_job.h
> index 30eda74e3c34..da96c674d62b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -60,16 +60,16 @@ void panfrost_jm_ctx_put(struct panfrost_jm_ctx *jm_c=
tx);
>  struct panfrost_jm_ctx *panfrost_jm_ctx_get(struct panfrost_jm_ctx *jm_c=
tx);
>  struct panfrost_jm_ctx *panfrost_jm_ctx_from_handle(struct drm_file *fil=
e, u32 handle);
> =20
> -int panfrost_job_init(struct panfrost_device *pfdev);
> -void panfrost_job_fini(struct panfrost_device *pfdev);
> -int panfrost_job_open(struct drm_file *file);
> -void panfrost_job_close(struct drm_file *file);
> +int panfrost_jm_init(struct panfrost_device *pfdev);
> +void panfrost_jm_fini(struct panfrost_device *pfdev);
> +int panfrost_jm_open(struct drm_file *file);
> +void panfrost_jm_close(struct drm_file *file);
> +void panfrost_jm_reset_interrupts(struct panfrost_device *pfdev);
> +void panfrost_jm_enable_interrupts(struct panfrost_device *pfdev);
> +void panfrost_jm_suspend_irq(struct panfrost_device *pfdev);
> +int panfrost_jm_is_idle(struct panfrost_device *pfdev);
>  int panfrost_job_get_slot(struct panfrost_job *job);
>  int panfrost_job_push(struct panfrost_job *job);
>  void panfrost_job_put(struct panfrost_job *job);
> -void panfrost_job_reset_interrupts(struct panfrost_device *pfdev);
> -void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
> -void panfrost_job_suspend_irq(struct panfrost_device *pfdev);
> -int panfrost_job_is_idle(struct panfrost_device *pfdev);
> =20
>  #endif

