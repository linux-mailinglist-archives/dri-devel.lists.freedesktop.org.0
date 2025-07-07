Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA573AFAE9F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 10:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4639C10E2FA;
	Mon,  7 Jul 2025 08:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcfpN0/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BE010E2FA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751876967; x=1783412967;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m3tTiQMcfBAfQyX11t85i93eQCMelvm/YOEBukz2Nis=;
 b=AcfpN0/6lkU9DvOv23z1EFNMyY/Ygbdn5Rw/tQoU+bxNICPeDhe4Y0Kw
 6JiuFBKj2uEDJz2Wu79HYhv0XH0bHgkEj7qV6R/Boa25jQhi7OwGOtTKW
 iE+pJR+mxelEN894pq3qKkvO/eyTdthtN0U9CHL/1bmiRvwa8f+t0QtGO
 SgCYDLlNzPn56hiOEOczLl5Orphq0x6sG7xH2t2rIkolPTLt0n1QVaf7p
 5lNCOZyNmmc6mSdPsur6lJ0gIF1ii4NTvOqE1tYFANhW8vRp/mNd65+D1
 AuFhZlnpmE8Qf9spHlwYghXsjOVGZjqdzVB2lPyICm60oLxhnpLDa/2Gl w==;
X-CSE-ConnectionGUID: DMEUAbnyQJuVck/+5Pjikg==
X-CSE-MsgGUID: DhN+/dBvREm2F+IuqXc5rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54210135"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="54210135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 01:29:27 -0700
X-CSE-ConnectionGUID: aOBhQV9bS82IavxWJk+idQ==
X-CSE-MsgGUID: Jg+4ERqdRgSApF2KuIeUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="154895044"
Received: from unknown (HELO [10.245.253.148]) ([10.245.253.148])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 01:29:24 -0700
Message-ID: <0219dd95-8847-49d3-9e7b-8e793fe1eeaf@linux.intel.com>
Date: Mon, 7 Jul 2025 10:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/80] accel/ivpu: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075356.3216699-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250704075356.3216699-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 7/4/2025 9:53 AM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/accel/ivpu/ivpu_job.c | 1 -
>  drivers/accel/ivpu/ivpu_pm.c  | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 060f1fc031d3..05a1a768e1c9 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -1049,6 +1049,5 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>  	mutex_unlock(&vdev->submitted_jobs_lock);
>  
>  runtime_put:
> -	pm_runtime_mark_last_busy(vdev->drm.dev);
>  	pm_runtime_put_autosuspend(vdev->drm.dev);
>  }
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index eacda1dbe840..761b4d7e1a5a 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -359,7 +359,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
>  
>  void ivpu_rpm_put(struct ivpu_device *vdev)
>  {
> -	pm_runtime_mark_last_busy(vdev->drm.dev);
>  	pm_runtime_put_autosuspend(vdev->drm.dev);
>  }
>  
> @@ -428,7 +427,6 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
>  	struct device *dev = vdev->drm.dev;
>  
>  	pm_runtime_allow(dev);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  }
>  

