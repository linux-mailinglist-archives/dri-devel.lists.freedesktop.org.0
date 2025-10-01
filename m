Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AEBBB0171
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 13:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A43610E359;
	Wed,  1 Oct 2025 11:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bRPlSWdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA3F10E359
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 11:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759316561;
 bh=fVw525lzQgL2mNP6SJlt2AtZOOQKzlk3CUyZkUSmbKo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bRPlSWdbskc3F3rUu0vMhBeA6oBQhDibFsDYM0aVecVvx+ybRJFySEl/0lIXtCKR1
 fL8o8eQPPFDw+8MSpN5hjcBBI46eTv3pWGJPX2FlTZ42GR/5Dt/bTwRR3YAIcrt67E
 sdxcQH3SJM37lrucuh3p3WsB4BovEzw85NBcWyA8UcGU7VMQH5aTEfllzBmJNGKzk7
 WqS6E2jVRixlAmXX+EeFEQTFiizmnzqsLv/IGLDRvKBCKyaS2DszwOvNdgYkpw9cWM
 hubDu8jgqC/8nXP+EjD7VgKXE5PV0U7Ae8sySRvDJGj6+TF0hkdgFj1q5MzTIH6gXY
 ykOj8ryPY5wwA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6980517E12DA;
 Wed,  1 Oct 2025 13:02:41 +0200 (CEST)
Date: Wed, 1 Oct 2025 13:02:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com, Rob Herring
 <robh@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH v4 07/10] drm/panfrost: Make re-enabling job interrupts
 at device reset optional
Message-ID: <20251001130237.3bc791a3@fedora>
In-Reply-To: <20251001022039.1215976-8-adrian.larumbe@collabora.com>
References: <20251001022039.1215976-1-adrian.larumbe@collabora.com>
 <20251001022039.1215976-8-adrian.larumbe@collabora.com>
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

On Wed,  1 Oct 2025 03:20:28 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Rather than remasking interrupts after a device reset in the main reset
> path, allow selecting whether to do this with an additional bool paramete=
r.
>=20
> To this end, split reenabling job interrupts into two functions, one that
> clears the interrupts and another one which unmasks them conditionally.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c |  9 ++++++---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 17 ++++++++---------
>  drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
>  4 files changed, 16 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 733b728ec75f..f1d811a6de6c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -400,13 +400,16 @@ bool panfrost_exception_needs_reset(const struct pa=
nfrost_device *pfdev,
>  	return false;
>  }
> =20
> -void panfrost_device_reset(struct panfrost_device *pfdev)
> +void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_jo=
b_int)
>  {
>  	panfrost_gpu_soft_reset(pfdev);
> =20
>  	panfrost_gpu_power_on(pfdev);
>  	panfrost_mmu_reset(pfdev);
> -	panfrost_job_enable_interrupts(pfdev);
> +
> +	panfrost_job_reset_interrupts(pfdev);
> +	if (enable_job_int)
> +		panfrost_job_enable_interrupts(pfdev);
>  }
> =20
>  static int panfrost_device_runtime_resume(struct device *dev)
> @@ -430,7 +433,7 @@ static int panfrost_device_runtime_resume(struct devi=
ce *dev)
>  		}
>  	}
> =20
> -	panfrost_device_reset(pfdev);
> +	panfrost_device_reset(pfdev, true);
>  	panfrost_devfreq_resume(pfdev);
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index ac7147ed806b..45d77cda8b89 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -250,7 +250,7 @@ int panfrost_unstable_ioctl_check(void);
> =20
>  int panfrost_device_init(struct panfrost_device *pfdev);
>  void panfrost_device_fini(struct panfrost_device *pfdev);
> -void panfrost_device_reset(struct panfrost_device *pfdev);
> +void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_jo=
b_int);
> =20
>  extern const struct dev_pm_ops panfrost_pm_ops;
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 54764ce91dea..3ae984f6290f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -426,11 +426,14 @@ static struct dma_fence *panfrost_job_run(struct dr=
m_sched_job *sched_job)
>  	return fence;
>  }
> =20
> +void panfrost_job_reset_interrupts(struct panfrost_device *pfdev)
> +{
> +	job_write(pfdev, JOB_INT_CLEAR, ALL_JS_INT_MASK);
> +}
> +
>  void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
>  {
>  	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
> -
> -	job_write(pfdev, JOB_INT_CLEAR, ALL_JS_INT_MASK);
>  	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
>  }
> =20
> @@ -723,12 +726,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  	spin_unlock(&pfdev->js->job_lock);
> =20
>  	/* Proceed with reset now. */
> -	panfrost_device_reset(pfdev);
> -
> -	/* panfrost_device_reset() unmasks job interrupts, but we want to
> -	 * keep them masked a bit longer.
> -	 */
> -	job_write(pfdev, JOB_INT_MASK, 0);
> +	panfrost_device_reset(pfdev, false);
> =20
>  	/* GPU has been reset, we can clear the reset pending bit. */
>  	atomic_set(&pfdev->reset.pending, 0);
> @@ -750,7 +748,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  		drm_sched_start(&pfdev->js->queue[i].sched, 0);
> =20
>  	/* Re-enable job interrupts now that everything has been restarted. */
> -	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
> +	panfrost_job_enable_interrupts(pfdev);
> =20
>  	dma_fence_end_signalling(cookie);
>  }
> @@ -901,6 +899,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		}
>  	}
> =20
> +	panfrost_job_reset_interrupts(pfdev);
>  	panfrost_job_enable_interrupts(pfdev);
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/pa=
nfrost/panfrost_job.h
> index 5a30ff1503c6..30eda74e3c34 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -67,6 +67,7 @@ void panfrost_job_close(struct drm_file *file);
>  int panfrost_job_get_slot(struct panfrost_job *job);
>  int panfrost_job_push(struct panfrost_job *job);
>  void panfrost_job_put(struct panfrost_job *job);
> +void panfrost_job_reset_interrupts(struct panfrost_device *pfdev);
>  void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
>  void panfrost_job_suspend_irq(struct panfrost_device *pfdev);
>  int panfrost_job_is_idle(struct panfrost_device *pfdev);

