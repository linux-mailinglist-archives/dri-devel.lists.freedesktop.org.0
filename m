Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC00A85879
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 11:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA0B10EB4E;
	Fri, 11 Apr 2025 09:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQYAsdUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F9F10EB4E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744365344; x=1775901344;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SurYcpwuYeOmvigqnlU8Yu+QyG1mkKG0f7uVw4W2JG4=;
 b=eQYAsdUKxpmyO/xs+6l9XEo3+73UqupcwKr7/IvfTVUxAYTCJxHvzwmp
 QUnatZCmkXwBx0Vrb8u+6puL7UrIVpvb2BtLAx5x3fydCTgpWiu+S7bla
 OEbr60HL/BVod6H/eudS9Q6djJWv5LZc2MqAtVaBWtahMZJKsi75TtYqX
 bfsZwD92tFTSzgbUY7/jCRi1SxsIeSFY4Rj376d0PwM2nXHk7B4Sh9+vg
 kiViiTJlhmtB1Wneeek91v4fUQT66qqST90xItavYBs0McEKe82+uvL4a
 hS3xN8i8DpSVSonv4pft6pBeMA9RxN3pH6mVD8xa00Z6xcwyVn2lqFnYl A==;
X-CSE-ConnectionGUID: fahUkC4aQESWBQnh/yCq3g==
X-CSE-MsgGUID: f+820wDQTjWUKz+pZ4CLNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63311655"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="63311655"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 02:55:44 -0700
X-CSE-ConnectionGUID: XUQ6rdFZRayMGvjUqDW1JQ==
X-CSE-MsgGUID: uSjMFJmISfekJPTeQVZZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129152254"
Received: from mariuszg-mobl2.ger.corp.intel.com (HELO [10.245.113.161])
 ([10.245.113.161])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 02:55:43 -0700
Message-ID: <b1e784fd-5718-4928-aec0-de5c46bf514b@linux.intel.com>
Date: Fri, 11 Apr 2025 11:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Update FW Boot API to version 3.28.3
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250401155817.4049220-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250401155817.4049220-1-maciej.falkowski@linux.intel.com>
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

Applied with updated commit message to drm-misc-fixes

On 4/1/2025 5:58 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> This commit bumps FW Boot API to 3.28.3.
> 
> Use new preemption buffer size fields from FW header added to
> firmware boot API for preemption buffers allocations,
> if those new fields are zeroed use old values instead.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_fw.c      | 14 ++++++--
>  drivers/accel/ivpu/vpu_boot_api.h | 13 ++++++--
>  drivers/accel/ivpu/vpu_jsm_api.h  | 53 +++++++++++++++++++++----------
>  3 files changed, 58 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 7a1bb92d8c81..3799231b39e7 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -233,10 +233,20 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>  	fw->dvfs_mode = 0;
>  
>  	fw->sched_mode = ivpu_fw_sched_mode_select(vdev, fw_hdr);
> -	fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
> -	fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
>  	ivpu_info(vdev, "Scheduler mode: %s\n", fw->sched_mode ? "HW" : "OS");
>  
> +	if (fw_hdr->preemption_buffer_1_max_size)
> +		fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_max_size;
> +	else
> +		fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
> +
> +	if (fw_hdr->preemption_buffer_2_max_size)
> +		fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_max_size;
> +	else
> +		fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
> +	ivpu_dbg(vdev, FW_BOOT, "Preemption buffer sizes: primary %u, secondary %u\n",
> +		 fw->primary_preempt_buf_size, fw->secondary_preempt_buf_size);
> +
>  	if (fw_hdr->ro_section_start_address && !is_within_range(fw_hdr->ro_section_start_address,
>  								 fw_hdr->ro_section_size,
>  								 fw_hdr->image_load_address,
> diff --git a/drivers/accel/ivpu/vpu_boot_api.h b/drivers/accel/ivpu/vpu_boot_api.h
> index 908e68ea1c39..218468bbbcad 100644
> --- a/drivers/accel/ivpu/vpu_boot_api.h
> +++ b/drivers/accel/ivpu/vpu_boot_api.h
> @@ -26,7 +26,7 @@
>   * Minor version changes when API backward compatibility is preserved.
>   * Resets to 0 if Major version is incremented.
>   */
> -#define VPU_BOOT_API_VER_MINOR 26
> +#define VPU_BOOT_API_VER_MINOR 28
>  
>  /*
>   * API header changed (field names, documentation, formatting) but API itself has not been changed
> @@ -76,8 +76,15 @@ struct vpu_firmware_header {
>  	 * submission queue size and device capabilities.
>  	 */
>  	u32 preemption_buffer_2_size;
> +	/*
> +	 * Maximum preemption buffer size that the FW can use: no need for the host
> +	 * driver to allocate more space than that specified by these fields.
> +	 * A value of 0 means no declared limit.
> +	 */
> +	u32 preemption_buffer_1_max_size;
> +	u32 preemption_buffer_2_max_size;
>  	/* Space reserved for future preemption-related fields. */
> -	u32 preemption_reserved[6];
> +	u32 preemption_reserved[4];
>  	/* FW image read only section start address, 4KB aligned */
>  	u64 ro_section_start_address;
>  	/* FW image read only section size, 4KB aligned */
> @@ -134,7 +141,7 @@ enum vpu_trace_destination {
>  /*
>   * Processor bit shifts (for loggable HW components).
>   */
> -#define VPU_TRACE_PROC_BIT_ARM	     0
> +#define VPU_TRACE_PROC_BIT_RESERVED  0
>  #define VPU_TRACE_PROC_BIT_LRT	     1
>  #define VPU_TRACE_PROC_BIT_LNN	     2
>  #define VPU_TRACE_PROC_BIT_SHV_0     3
> diff --git a/drivers/accel/ivpu/vpu_jsm_api.h b/drivers/accel/ivpu/vpu_jsm_api.h
> index 7215c144158c..4b6b2b3d2583 100644
> --- a/drivers/accel/ivpu/vpu_jsm_api.h
> +++ b/drivers/accel/ivpu/vpu_jsm_api.h
> @@ -22,7 +22,7 @@
>  /*
>   * Minor version changes when API backward compatibility is preserved.
>   */
> -#define VPU_JSM_API_VER_MINOR 25
> +#define VPU_JSM_API_VER_MINOR 29
>  
>  /*
>   * API header changed (field names, documentation, formatting) but API itself has not been changed
> @@ -53,8 +53,7 @@
>   * Engine indexes.
>   */
>  #define VPU_ENGINE_COMPUTE 0
> -#define VPU_ENGINE_COPY	   1
> -#define VPU_ENGINE_NB	   2
> +#define VPU_ENGINE_NB	   1
>  
>  /*
>   * VPU status values.
> @@ -126,11 +125,13 @@ enum {
>  	 * When set, indicates that job queue uses native fences (as inline commands
>  	 * in job queue). Such queues may also use legacy fences (as commands in batch buffers).
>  	 * When cleared, indicates the job queue only uses legacy fences.
> -	 * NOTE: For queues using native fences, VPU expects that all jobs in the queue
> -	 * are immediately followed by an inline command object. This object is expected
> -	 * to be a fence signal command in most cases, but can also be a NOP in case the host
> -	 * does not need per-job fence signalling. Other inline commands objects can be
> -	 * inserted between "job and inline command" pairs.
> +	 * NOTES:
> +	 *   1. For queues using native fences, VPU expects that all jobs in the queue
> +	 *      are immediately followed by an inline command object. This object is expected
> +	 *      to be a fence signal command in most cases, but can also be a NOP in case the host
> +	 *      does not need per-job fence signalling. Other inline commands objects can be
> +	 *      inserted between "job and inline command" pairs.
> +	 *  2. Native fence queues are only supported on VPU 40xx onwards.
>  	 */
>  	VPU_JOB_QUEUE_FLAGS_USE_NATIVE_FENCE_MASK = (1 << 1U),
>  
> @@ -275,6 +276,8 @@ struct vpu_inline_cmd {
>  			u64 value;
>  			/* User VA of the log buffer in which to add log entry on completion. */
>  			u64 log_buffer_va;
> +			/* NPU private data. */
> +			u64 npu_private_data;
>  		} fence;
>  		/* Other commands do not have a payload. */
>  		/* Payload definition for future inline commands can be inserted here. */
> @@ -791,12 +794,22 @@ struct vpu_jsm_metric_streamer_update {
>  	/** Metric group mask that identifies metric streamer instance. */
>  	u64 metric_group_mask;
>  	/**
> -	 * Address and size of the buffer where the VPU will write metric data. If
> -	 * the buffer address is 0 or same as the currently used buffer the VPU will
> -	 * continue writing metric data to the current buffer. In this case the
> -	 * buffer size is ignored and the size of the current buffer is unchanged.
> -	 * If the address is non-zero and differs from the current buffer address the
> -	 * VPU will immediately switch data collection to the new buffer.
> +	 * Address and size of the buffer where the VPU will write metric data.
> +	 * This member dictates how the update operation should perform:
> +	 * 1. client needs information about the number of collected samples and the
> +	 *   amount of data written to the current buffer
> +	 * 2. client wants to switch to a new buffer
> +	 *
> +	 * Case 1. is identified by the buffer address being 0 or the same as the
> +	 * currently used buffer address. In this case the buffer size is ignored and
> +	 * the size of the current buffer is unchanged. The VPU will return an update
> +	 * in the vpu_jsm_metric_streamer_done structure. The internal writing position
> +	 * into the buffer is not changed.
> +	 *
> +	 * Case 2. is identified by the address being non-zero and differs from the
> +	 * current buffer address. The VPU will immediately switch data collection to
> +	 * the new buffer. Then the VPU will return an update in the
> +	 * vpu_jsm_metric_streamer_done structure.
>  	 */
>  	u64 buffer_addr;
>  	u64 buffer_size;
> @@ -934,6 +947,7 @@ struct vpu_ipc_msg_payload_hws_priority_band_setup {
>  	/*
>  	 * Default quantum in 100ns units for scheduling across processes
>  	 * within a priority band
> +	 * Minimum value supported by NPU is 1ms (10000 in 100ns units).
>  	 */
>  	u32 process_quantum[VPU_HWS_NUM_PRIORITY_BANDS];
>  	/*
> @@ -946,8 +960,10 @@ struct vpu_ipc_msg_payload_hws_priority_band_setup {
>  	 * in situations when it's starved by the focus band.
>  	 */
>  	u32 normal_band_percentage;
> -	/* Reserved */
> -	u32 reserved_0;
> +	/*
> +	 * TDR timeout value in milliseconds. Default value of 0 meaning no timeout.
> +	 */
> +	u32 tdr_timeout;
>  };
>  
>  /*
> @@ -1024,7 +1040,10 @@ struct vpu_ipc_msg_payload_hws_set_context_sched_properties {
>  	s32 in_process_priority;
>  	/* Zero padding / Reserved */
>  	u32 reserved_1;
> -	/* Context quantum relative to other contexts of same priority in the same process */
> +	/*
> +	 * Context quantum relative to other contexts of same priority in the same process
> +	 * Minimum value supported by NPU is 1ms (10000 in 100ns units).
> +	 */
>  	u64 context_quantum;
>  	/* Grace period when preempting context of the same priority within the same process */
>  	u64 grace_period_same_priority;

