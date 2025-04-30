Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B32AA47B7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8841210E717;
	Wed, 30 Apr 2025 09:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOp/LgJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DF710E717
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746006924; x=1777542924;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DVCEUmMczFodVvtnVtiQ7WunQSmOxzTyZSuChFDGiCw=;
 b=JOp/LgJNZbAMKaQNY+DoYu9Ca8obXA/iVkLKNtrd2aEN8ghpYzFLPbU7
 NGToQXBbh7uwwZxn2Ix23/7lbjoNKo/bkdjus+E+bfqGLY/Sf1AWHyEAE
 lZkn2sJm65kymEcUK8dRjZ0Sk+WqAG22bt6gVBsX9pPF2ZRKLnZv76C6N
 aJpeq1+i7AU2UhHwVLOoj9cGuZf3sQRQ0r5g2VCS1MCTfgk9QF7kVgGyd
 GnuvaFTtxvqd9+0987ZA4LsF9rHY9AJ1Wn0lXnIqDjacwp4LMoBsW7Trp
 wZW9k7KRH4MYsWi1mCr4G0pHS2vyR/mORQQ8jYR0h2IiB0Jcc+yFUVm4j Q==;
X-CSE-ConnectionGUID: 1dYH48RkQ1y+XZKwEaDdvw==
X-CSE-MsgGUID: e2Dp5doRQMCt3X1YVWk11Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46776471"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="46776471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:55:23 -0700
X-CSE-ConnectionGUID: 2+au1RpZTRiobfTuzr7QKw==
X-CSE-MsgGUID: tJLPbxzoScS0ExYWI5Pn1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134594429"
Received: from dmatouse-mobl1.ger.corp.intel.com (HELO [10.245.252.148])
 ([10.245.252.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:55:22 -0700
Message-ID: <caf3880a-3176-4ae5-a10b-157a5c4d6fab@linux.intel.com>
Date: Wed, 30 Apr 2025 11:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Correct mutex unlock order in job submission
To: dri-devel@lists.freedesktop.org
Cc: quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
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

Fixed commit message and applied to drm-misc-fixes

On 4/25/2025 11:36 AM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> The mutex unlock for vdev->submitted_jobs_lock was incorrectly placed
> after unlocking file_priv->lock. Change order of unlocks to avoid potential
> race conditions.
> 
> Fixes: 5bbccadaf33e ("accel/ivpu: Abort all jobs after command queue unregister")
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 863e3cd6ace51..540923ffcbf8d 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -681,8 +681,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>  err_erase_xa:
>  	xa_erase(&vdev->submitted_jobs_xa, job->job_id);
>  err_unlock:
> -	mutex_unlock(&vdev->submitted_jobs_lock);
>  	mutex_unlock(&file_priv->lock);
> +	mutex_unlock(&vdev->submitted_jobs_lock);
>  	ivpu_rpm_put(vdev);
>  	return ret;
>  }

