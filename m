Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9D9DE7FE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11BA10E4C0;
	Fri, 29 Nov 2024 13:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Z2FaFcfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31C910E4C0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732888004; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z1/fxVpt2FBzKl/+KHKSrrq/JpB3eQOn6ECJ79O0AWiC5aUDkuqZAtHuU6RiX8w7NpsemampEKdYaw0Rk0r/5nj9vV8DrYx/uqw6i8cjBFTju2bCs+TK8AOZu6aYkQ+7Gzha/jm+m2pwOX7uh36XDGnx06Wm1i8W4MnkufNFj44=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732888004;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=72J66gZXIF/dzc28O+2YziYb0aWmNzPaI1KSEpjbm0A=; 
 b=Vabx7XED3u3kWwnxVgJC5MY4Oks0yxTzt4iyr6vGktg+BLFJwueIZnYhC9Ml7otaNs1P86zNpA3AikhGesibkYAJOYeBOjqk2nZd6jR2HtD6ZdkIMusripMdJpkired1yrJkKSjcIBYE1M6AKgvbwXEwvr4MbJxPSB3xewNsLpU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732888004; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=72J66gZXIF/dzc28O+2YziYb0aWmNzPaI1KSEpjbm0A=;
 b=Z2FaFcfsgvTvij/rOS8ABmGTjnWOvQR7yDZ6afrYFrvbJmmOUWpph1KNNXs7wiyM
 9jySWpVJSQ8M2ROL+n4mXeoIW1XOn+/wZfqK+N/og13iu5gM03D9i0ZYxhAUHrSzhD/
 42CP8aQsTbjWwghvpowa0lBSMEAbdeKtzT0bdKDk=
Received: by mx.zohomail.com with SMTPS id 1732888003217729.5646658688657;
 Fri, 29 Nov 2024 05:46:43 -0800 (PST)
Date: Fri, 29 Nov 2024 13:46:41 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/5] drm/panthor: Ignore
 devfreq_{suspend,resume}_device() failures
Message-ID: <ufwgsrxqxzbdfqqwoxejhn4bxtsakif6wil44rg24bdiimgx6x@odfex4htsy2d>
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
 <20241128110255.3182366-4-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128110255.3182366-4-boris.brezillon@collabora.com>
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
> devfreq_{resume,suspend}_device() don't bother undoing the suspend_count
> modifications if something fails, so either it assumes failures are
> harmless, or it's super fragile/buggy. In either case it's not something
> we can address at the driver level, so let's just assume failures are
> harmless for now, like is done in panfrost.

In my experience, when devfreq_suspend_device fails in the PM suspend path, then
FW resumption will always fail, even after a slow reset, although I guess
with the latest patch in this series that is already addressed.   

> v2:
> - Add R-b
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 12 ++++----
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  4 +--
>  drivers/gpu/drm/panthor/panthor_device.c  | 35 ++---------------------
>  3 files changed, 11 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index ecc7a52bd688..3686515d368d 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -243,26 +243,26 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	return 0;
>  }
>  
> -int panthor_devfreq_resume(struct panthor_device *ptdev)
> +void panthor_devfreq_resume(struct panthor_device *ptdev)
>  {
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  
>  	if (!pdevfreq->devfreq)
> -		return 0;
> +		return;
>  
>  	panthor_devfreq_reset(pdevfreq);
>  
> -	return devfreq_resume_device(pdevfreq->devfreq);
> +	drm_WARN_ON(&ptdev->base, devfreq_resume_device(pdevfreq->devfreq));
>  }
>  
> -int panthor_devfreq_suspend(struct panthor_device *ptdev)
> +void panthor_devfreq_suspend(struct panthor_device *ptdev)
>  {
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  
>  	if (!pdevfreq->devfreq)
> -		return 0;
> +		return;
>  
> -	return devfreq_suspend_device(pdevfreq->devfreq);
> +	drm_WARN_ON(&ptdev->base, devfreq_suspend_device(pdevfreq->devfreq));
>  }
>  
>  void panthor_devfreq_record_busy(struct panthor_device *ptdev)
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
> index 83a5c9522493..b7631de695f7 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -12,8 +12,8 @@ struct panthor_devfreq;
>  
>  int panthor_devfreq_init(struct panthor_device *ptdev);
>  
> -int panthor_devfreq_resume(struct panthor_device *ptdev);
> -int panthor_devfreq_suspend(struct panthor_device *ptdev);
> +void panthor_devfreq_resume(struct panthor_device *ptdev);
> +void panthor_devfreq_suspend(struct panthor_device *ptdev);
>  
>  void panthor_devfreq_record_busy(struct panthor_device *ptdev);
>  void panthor_devfreq_record_idle(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index e701e605d013..e3b22107b268 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -453,9 +453,7 @@ int panthor_device_resume(struct device *dev)
>  	if (ret)
>  		goto err_disable_stacks_clk;
>  
> -	ret = panthor_devfreq_resume(ptdev);
> -	if (ret)
> -		goto err_disable_coregroup_clk;
> +	panthor_devfreq_resume(ptdev);
>  
>  	if (panthor_device_is_initialized(ptdev) &&
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
> @@ -492,8 +490,6 @@ int panthor_device_resume(struct device *dev)
>  
>  err_suspend_devfreq:
>  	panthor_devfreq_suspend(ptdev);
> -
> -err_disable_coregroup_clk:
>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  
>  err_disable_stacks_clk:
> @@ -510,7 +506,7 @@ int panthor_device_resume(struct device *dev)
>  int panthor_device_suspend(struct device *dev)
>  {
>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
> -	int ret, cookie;
> +	int cookie;
>  
>  	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE)
>  		return -EINVAL;
> @@ -542,36 +538,11 @@ int panthor_device_suspend(struct device *dev)
>  		drm_dev_exit(cookie);
>  	}
>  
> -	ret = panthor_devfreq_suspend(ptdev);
> -	if (ret) {
> -		if (panthor_device_is_initialized(ptdev) &&
> -		    drm_dev_enter(&ptdev->base, &cookie)) {
> -			panthor_gpu_resume(ptdev);
> -			panthor_mmu_resume(ptdev);
> -			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> -			panthor_sched_resume(ptdev);
> -			drm_dev_exit(cookie);
> -		}
> -
> -		goto err_set_active;
> -	}
> +	panthor_devfreq_suspend(ptdev);
>  
>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  	clk_disable_unprepare(ptdev->clks.stacks);
>  	clk_disable_unprepare(ptdev->clks.core);
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
>  	return 0;
> -
> -err_set_active:
> -	/* If something failed and we have to revert back to an
> -	 * active state, we also need to clear the MMIO userspace
> -	 * mappings, so any dumb pages that were mapped while we
> -	 * were trying to suspend gets invalidated.
> -	 */
> -	mutex_lock(&ptdev->pm.mmio_lock);
> -	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
> -	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
> -			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
> -	mutex_unlock(&ptdev->pm.mmio_lock);
> -	return ret;
>  }
> -- 
> 2.46.2
