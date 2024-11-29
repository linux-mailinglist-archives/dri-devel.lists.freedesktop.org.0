Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842089DE82E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B090C10E0DB;
	Fri, 29 Nov 2024 13:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="jgLUhwEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77BD10E0DB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732888756; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PeeGSFjvU2TcmG2YK7FrhKzA60g8RH7VlGPgcAqtO5F10/T+AWZJl4WYAT8uULqn0qTy/lv8JglgKgj6c6ogLox1kMwouOLOObG8rEsHzI8eNvLE17xb/HGtx6IwxufBXlsdSt6sCOnepQ3/YkitFXcxVw0TO6/b0vCCN1LQI2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732888756;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Lm2qfjlThSijSL7hxuQzrO9A5tm1ePxNDQ/z9bqb7WI=; 
 b=Z5CsyHil3nlQ+frCuafF2YUK23YNbtYaR0HIRyBjrOaz+jV/2VIj1KDRloskGs2ZY7P/iSoVp04bRJCMiACmPNsEY5o21WVdcCSjNGFC0qBuPUKngRYgCtDkJZmQNWVknvYjDbVPRO5LD1x8JkktADux4mtmS+ZE/g9Tb4ZnD3c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732888756; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Lm2qfjlThSijSL7hxuQzrO9A5tm1ePxNDQ/z9bqb7WI=;
 b=jgLUhwEhydoeRnyMMQUh7XHFpMQTvgR+RGwDKK86Zbf4KOvJ0HZ3qIBau1mWcUpc
 QZD7nxHh4WYJpV9uZKWputyGBTR1kjVPm1Vfp/bl1vQ+TOcPvAcmcBi9R+LTPBtLuJu
 mSXIHZhZy133DFTA5p5O2w4iaUg8Tpvoiq00giuo=
Received: by mx.zohomail.com with SMTPS id 1732888755601730.3233779402859;
 Fri, 29 Nov 2024 05:59:15 -0800 (PST)
Date: Fri, 29 Nov 2024 13:59:13 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 4/5] drm/panthor: Be robust against resume failures
Message-ID: <yrcvsbykbiwcmar73zk2ffgfhqzgjppnsp2y4w3kascb3wvo76@dtaciivtaanx>
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
 <20241128110255.3182366-5-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128110255.3182366-5-boris.brezillon@collabora.com>
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

Reviewed-by: Adrian Larumbe <adrian.larumbe@collabora.com>

On 28.11.2024 12:02, Boris Brezillon wrote:
> When the runtime PM resume callback returns an error, it puts the device
> in a state where it can't be resumed anymore. Make sure we can recover
> from such transient failures by calling pm_runtime_set_suspended()
> explicitly after a pm_runtime_resume_and_get() failure.
> 
> v2:
> - Add a comment explaining potential races in
>   panthor_device_resume_and_get()
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  1 +
>  drivers/gpu/drm/panthor/panthor_device.h | 26 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c  |  4 ++--
>  4 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index e3b22107b268..0362101ea896 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -500,6 +500,7 @@ int panthor_device_resume(struct device *dev)
>  
>  err_set_suspended:
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> +	atomic_set(&ptdev->pm.recovery_needed, 1);

I think it might be the case that if PM resume fails, then ptdev->base.dev->power.runtime_error
would be set to '1' and then you might use this state variable in panthor_device_resume_and_get()
rather than encoding it explicity into the panthor driver struct?

>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 0e68f5a70d20..b6c4f25a5d6e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -9,6 +9,7 @@
>  #include <linux/atomic.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
>  
> @@ -180,6 +181,9 @@ struct panthor_device {
>  		 * is suspended.
>  		 */
>  		struct page *dummy_latest_flush;
> +
> +		/** @recovery_needed: True when a resume attempt failed. */
> +		atomic_t recovery_needed;
>  	} pm;
>  
>  	/** @profile_mask: User-set profiling flags for job accounting. */
> @@ -243,6 +247,28 @@ int panthor_device_mmap_io(struct panthor_device *ptdev,
>  int panthor_device_resume(struct device *dev);
>  int panthor_device_suspend(struct device *dev);
>  
> +static inline int panthor_device_resume_and_get(struct panthor_device *ptdev)
> +{
> +	int ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +
> +	/* If the resume failed, we need to clear the runtime_error, which
> +	 * can done by forcing the RPM state to suspended. If multiple
> +	 * threads called panthor_device_resume_and_get(), we only want
> +	 * one of them to update the state, hence the cmpxchg. Note that a
> +	 * thread might enter panthor_device_resume_and_get() and call
> +	 * pm_runtime_resume_and_get() after another thread had attempted
> +	 * to resume and failed. This means we will end up with an error
> +	 * without even attempting a resume ourselves. The only risk here
> +	 * is to report an error when the second resume attempt might have
> +	 * succeeded. Given resume errors are not expected, this is probably
> +	 * something we can live with.
> +	 */
> +	if (ret && atomic_cmpxchg(&ptdev->pm.recovery_needed, 1, 0) == 1)
> +		pm_runtime_set_suspended(ptdev->base.dev);
> +
> +	return ret;
> +}
> +
>  enum drm_panthor_exception_type {
>  	DRM_PANTHOR_EXCEPTION_OK = 0x00,
>  	DRM_PANTHOR_EXCEPTION_TERMINATED = 0x04,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 1498c97b4b85..b7a9adc918e3 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -763,7 +763,7 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
>  {
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +	ret = panthor_device_resume_and_get(ptdev);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 97ed5fe5a191..77b184c3fb0c 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2364,7 +2364,7 @@ static void tick_work(struct work_struct *work)
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>  		return;
>  
> -	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +	ret = panthor_device_resume_and_get(ptdev);
>  	if (drm_WARN_ON(&ptdev->base, ret))
>  		goto out_dev_exit;
>  
> @@ -3131,7 +3131,7 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		return dma_fence_get(job->done_fence);
>  	}
>  
> -	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +	ret = panthor_device_resume_and_get(ptdev);
>  	if (drm_WARN_ON(&ptdev->base, ret))
>  		return ERR_PTR(ret);
>  
> -- 
> 2.46.2
