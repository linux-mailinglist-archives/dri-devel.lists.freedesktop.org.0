Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2BCACEF6A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0177C10E866;
	Thu,  5 Jun 2025 12:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJ5fYnoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDBF10E278
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749127506; x=1780663506;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pVHFkoawT1Af1NsYcUffRHXIvME2XGNPgTFI2W9wNkM=;
 b=SJ5fYnoDPLM+nq4YIkhukXUU9lCal/uO5TYevpOM8DdCSPit9s2Qu9l1
 RisRGDv2PpDyxBs7ikvcSNhuXvSxWxr102lgHr5jqRLSTxGZkI2JY0Eeg
 BRO7K2xetN78velWDVEyVDvrbnNhtwKb4sJMTNI/DjWoE2uWRQIpZHUv7
 tA424khn7MApQ0KzztfPZY0DB8wcz2RiFAb1DIXMa2gxvesYfevp6YqAP
 h3djDcm0QUd6FwCiedMNayfo1Wz3KKoJ/0aXBsZEdKpcgenPzT4O1T3ND
 0QPYNevU237XnE8OeyBAsjTtYvuylAi0PQQ4SRifwcE1/oQ4CmOT1Vtu4 A==;
X-CSE-ConnectionGUID: jbqg9ROTR36rRDQyDWyN4w==
X-CSE-MsgGUID: /7ODDtL5QFWcIuWLE7JHFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51315130"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51315130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:45:06 -0700
X-CSE-ConnectionGUID: +QOlHEvXQuuvd6Y2wYn8GQ==
X-CSE-MsgGUID: 2Y7xR0T6QDWptOkid7X+TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145460462"
Received: from unknown (HELO [10.217.160.151]) ([10.217.160.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:45:04 -0700
Message-ID: <1176fe41-df3f-4675-9be7-923e5159cccb@linux.intel.com>
Date: Thu, 5 Jun 2025 14:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Trigger device recovery on engine
 reset/resume failure
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>, stable@vger.kernel.org
References: <20250528154253.500556-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250528154253.500556-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes

On 5/28/2025 5:42 PM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Trigger full device recovery when the driver fails to restore device state
> via engine reset and resume operations. This is necessary because, even if
> submissions from a faulty context are blocked, the NPU may still process
> previously submitted faulty jobs if the engine reset fails to abort them.
> Such jobs can continue to generate faults and occupy device resources.
> When engine reset is ineffective, the only way to recover is to perform
> a full device recovery.
> 
> Fixes: dad945c27a42 ("accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW")
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_job.c     | 6 ++++--
>  drivers/accel/ivpu/ivpu_jsm_msg.c | 9 +++++++--
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 1c8e283ad9854..fae8351aa3309 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -986,7 +986,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>  		return;
>  
>  	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
> -		ivpu_jsm_reset_engine(vdev, 0);
> +		if (ivpu_jsm_reset_engine(vdev, 0))
> +			return;
>  
>  	mutex_lock(&vdev->context_list_lock);
>  	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
> @@ -1009,7 +1010,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>  	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
>  		goto runtime_put;
>  
> -	ivpu_jsm_hws_resume_engine(vdev, 0);
> +	if (ivpu_jsm_hws_resume_engine(vdev, 0))
> +		return;
>  	/*
>  	 * In hardware scheduling mode NPU already has stopped processing jobs
>  	 * and won't send us any further notifications, thus we have to free job related resources
> diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
> index 219ab8afefabd..0256b2dfefc10 100644
> --- a/drivers/accel/ivpu/ivpu_jsm_msg.c
> +++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
> @@ -7,6 +7,7 @@
>  #include "ivpu_hw.h"
>  #include "ivpu_ipc.h"
>  #include "ivpu_jsm_msg.h"
> +#include "ivpu_pm.h"
>  #include "vpu_jsm_api.h"
>  
>  const char *ivpu_jsm_msg_type_to_str(enum vpu_ipc_msg_type type)
> @@ -163,8 +164,10 @@ int ivpu_jsm_reset_engine(struct ivpu_device *vdev, u32 engine)
>  
>  	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_ENGINE_RESET_DONE, &resp,
>  				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
> -	if (ret)
> +	if (ret) {
>  		ivpu_err_ratelimited(vdev, "Failed to reset engine %d: %d\n", engine, ret);
> +		ivpu_pm_trigger_recovery(vdev, "Engine reset failed");
> +	}
>  
>  	return ret;
>  }
> @@ -354,8 +357,10 @@ int ivpu_jsm_hws_resume_engine(struct ivpu_device *vdev, u32 engine)
>  
>  	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_HWS_RESUME_ENGINE_DONE, &resp,
>  				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
> -	if (ret)
> +	if (ret) {
>  		ivpu_err_ratelimited(vdev, "Failed to resume engine %d: %d\n", engine, ret);
> +		ivpu_pm_trigger_recovery(vdev, "Engine resume failed");
> +	}
>  
>  	return ret;
>  }

