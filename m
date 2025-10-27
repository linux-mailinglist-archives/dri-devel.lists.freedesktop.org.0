Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA64C0E317
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0106610E4A6;
	Mon, 27 Oct 2025 13:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8j6okbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED86010E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761573419; x=1793109419;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tBNjjcXIqeWhZwm8M/vmAluvqQV0C+SSnn7dB+HyxNI=;
 b=O8j6okbFEpjFyCzQnDjAgOfWx4rASFwYsu1qO3Am6nqrzgzbnaunELwY
 kHrc9lQbQE+fUr0LjBZytAJhXQjPkoIXKzzWkSDc5wWi/ps7unz34ap1q
 8t6ys+A2o7uWRwcUK8ehI3a+uRP5f/pSHbVS4eb2gFCsviuxBd7+v240c
 aoUpByz8vpyfDcWWsG6hKFt3k6BpZWq1s3QuTJ4rtv5gYPchB/cL1YEAe
 6GAxkEKqsyk/u1fn9m2sT1NlemvO6xV7VLxvliHtHBifAZfnlLIf7q/gH
 wD78VUaPluvNQFxfF+n0Q/Pb0unllVzPqsoYC36rCXEHwZdDLpAPIgjqk Q==;
X-CSE-ConnectionGUID: cP8uH+UkR7yU5tE/n9PiLw==
X-CSE-MsgGUID: B25mcry3RSKHtFpxmF3tWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63557796"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63557796"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:56:59 -0700
X-CSE-ConnectionGUID: xedTDBYLTdKW1e9Pyh/HGw==
X-CSE-MsgGUID: 8thg1T0CSQG3Crr0kfsmww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184943868"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.94.253.247])
 ([10.94.253.247])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:56:57 -0700
Message-ID: <6fb03b15-a008-4e6b-81c5-d94b2c0c601c@linux.intel.com>
Date: Mon, 27 Oct 2025 14:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] accel/ivpu: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20251027133956.393375-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251027133956.393375-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

You didn't mentioned it is resend so I was a bit surprised the patch has
rev-by already from Jacek but I confirm it was given in the old thread.

Thanks,
Maciej

On 10/27/2025 2:39 PM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_job.c | 1 -
>   drivers/accel/ivpu/ivpu_pm.c  | 2 --
>   2 files changed, 3 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index ba4535a75aa7..4eb7287cd083 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -1114,6 +1114,5 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>   	mutex_unlock(&vdev->submitted_jobs_lock);
>   
>   runtime_put:
> -	pm_runtime_mark_last_busy(vdev->drm.dev);
>   	pm_runtime_put_autosuspend(vdev->drm.dev);
>   }
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 63c95307faa1..fe6f93af6ab0 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -359,7 +359,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
>   
>   void ivpu_rpm_put(struct ivpu_device *vdev)
>   {
> -	pm_runtime_mark_last_busy(vdev->drm.dev);
>   	pm_runtime_put_autosuspend(vdev->drm.dev);
>   }
>   
> @@ -428,7 +427,6 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
>   	struct device *dev = vdev->drm.dev;
>   
>   	pm_runtime_allow(dev);
> -	pm_runtime_mark_last_busy(dev);
>   	pm_runtime_put_autosuspend(dev);
>   }
>   
