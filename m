Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8470A1D3D7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 10:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D2F89FA7;
	Mon, 27 Jan 2025 09:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="lAF268G9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73289FA7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 09:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737971268; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iLKPG7TcUE8OIQSqrRp0I6NRZuRldXkFxV4h0JiF1em3vIYc7/Gr313SS7FYIUkHfRBsQyjkhTwBdO/555k0cadsZrpKV3tgO424PEvtcHEVaG4mLfV6sCPZRkumMJcEi2jR1QTr6G1y1fW72Q0/aqGeryrk1aa/EkiXOE9J7fM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737971268;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PH+j6SCZJV87lbRB1ZPnQqK7PPnzw+UQmEJ4r2cr+I8=; 
 b=CG42MO2XpDSvyRiCRaH5T2HHo4xoi6jbzqo1AhJbOn/gr0ylj1VHx/a2SOu4ierGNsT7FUP5P/BURnSALDoUU2vy1L1BAjCv2c1KY0hb6azZbTBCGD8rYm9toDjpZzUe83n5Ff6/G6bKrU9Gt/Q4hRUA7NwEUuH01FFmqiRIe1A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737971268; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=PH+j6SCZJV87lbRB1ZPnQqK7PPnzw+UQmEJ4r2cr+I8=;
 b=lAF268G9Fjdw/tv/j9CH92VR5nXMLxiu+TAeAWuIMz2YIG6ZEf6sWAh1qIscgbrl
 a8KhXryENxYpTsmskJ+FUftzLGaUKq7y823ruD0yDKaVTLmRPGH8kOO8UDltvfT2n72
 IbOtb+t8zL4mNm2K8T+Em7fQehB4EAwP8xkWGYXk=
Received: by mx.zohomail.com with SMTPS id 17379712635997.421798717645402;
 Mon, 27 Jan 2025 01:47:43 -0800 (PST)
Date: Mon, 27 Jan 2025 09:47:40 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
Subject: Re: [RFC v2 1/8] drm/panthor: Add performance counter uAPI
Message-ID: <zxvkqrvhoewt5oj34h6f4hhguxxkpl7ljbm6tkh7yac4uuipyh@vmfmvtdx375h>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-2-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211165024.490748-2-lukas.zapolskas@arm.com>
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

Hi Lukas,

On 11.12.2024 16:50, Lukas Zapolskas wrote:
> This patch extends the DEV_QUERY ioctl to return information about the
> performance counter setup for userspace, and introduces the new
> ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
> performance counters.
> 
> The new design is inspired by the perf aux ringbuffer, with the insert
> and extract indices being mapped to userspace, allowing multiple samples
> to be exposed at any given time. To avoid pointer chasing, the sample
> metadata and block metadata are inline with the elements they
> describe.
> 
> Userspace is responsible for passing in resources for samples to be
> exposed, including the event file descriptor for notification of new
> sample availability, the ringbuffer BO to store samples, and the control
> BO along with the offset for mapping the insert and extract indices.
> Though these indices are only a total of 8 bytes, userspace can then
> reuse the same physical page for tracking the state of multiple buffers
> by giving different offsets from the BO start to map them.
> 
> Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  include/uapi/drm/panthor_drm.h | 487 +++++++++++++++++++++++++++++++++
>  1 file changed, 487 insertions(+)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 87c9cb555dd1..8a431431da6b 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
>  
>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> +
> +	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
> +	DRM_PANTHOR_PERF_CONTROL,
>  };
>  
>  /**
> @@ -170,6 +173,8 @@ enum drm_panthor_ioctl_id {
>  	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
>  #define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
>  	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
> +#define DRM_IOCTL_PANTHOR_PERF_CONTROL \
> +	DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
>  
>  /**
>   * DOC: IOCTL arguments
> @@ -268,6 +273,9 @@ enum drm_panthor_dev_query_type {
>  	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
>  	 */
>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interface information. */
> +	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
>  };
>  
>  /**
> @@ -421,6 +429,120 @@ struct drm_panthor_group_priorities_info {
>  	__u8 pad[3];
>  };
>  
> +/**
> + * enum drm_panthor_perf_feat_flags - Performance counter configuration feature flags.
> + */
> +enum drm_panthor_perf_feat_flags {
> +	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states are supported. */
> +	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
> +};
> +
> +/**
> + * enum drm_panthor_perf_block_type - Performance counter supported block types.
> + */
> +enum drm_panthor_perf_block_type {
> +	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_FW = 1,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_CSG: A CSG counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_CSG,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_CSHW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_TILER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_SHADER,
> +};
> +
> +/**
> + * enum drm_panthor_perf_clock - Identifier of the clock used to produce the cycle count values
> + * in a given block.
> + *
> + * Since the integrator has the choice of using one or more clocks, there may be some confusion
> + * as to which blocks are counted by which clock values unless this information is explicitly
> + * provided as part of every block sample. Not every single clock here can be used: in the simplest
> + * case, all cycle counts will be associated with the top-level clock.
> + */
> +enum drm_panthor_perf_clock {
> +	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
> +	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for the MMU, L2
> +	 * caches and the tiler.
> +	 */
> +	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
> +
> +	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
> +	DRM_PANTHOR_PERF_CLOCK_SHADER,
> +};
> +
> +/**
> + * struct drm_panthor_perf_info - Performance counter interface information
> + *
> + * Structure grouping all queryable information relating to the performance counter
> + * interfaces.
> + */
> +struct drm_panthor_perf_info {
> +	/**
> +	 * @counters_per_block: The number of 8-byte counters available in a block.
> +	 */
> +	__u32 counters_per_block;
> +
> +	/**
> +	 * @sample_header_size: The size of the header struct available at the beginning
> +	 * of every sample.
> +	 */
> +	__u32 sample_header_size;
> +
> +	/**
> +	 * @block_header_size: The size of the header struct inline with the counters for a
> +	 * single block.
> +	 */
> +	__u32 block_header_size;
> +
> +	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
> +	__u32 flags;
> +
> +	/**
> +	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
> +	 *
> +	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
> +	 *
> +	 * For the same GPU, different implementers may have different clocks for the same hardware
> +	 * block. At the moment, up to four clocks are supported, and any clocks that are present
> +	 * will be reported here.
> +	 */
> +	__u32 supported_clocks;
> +
> +	/** @fw_blocks: Number of FW blocks available. */
> +	__u32 fw_blocks;
> +
> +	/** @csg_blocks: Number of CSG blocks available. */
> +	__u32 csg_blocks;
> +
> +	/** @cshw_blocks: Number of CSHW blocks available. */
> +	__u32 cshw_blocks;
> +
> +	/** @tiler_blocks: Number of tiler blocks available. */
> +	__u32 tiler_blocks;
> +
> +	/** @memsys_blocks: Number of memsys blocks available. */
> +	__u32 memsys_blocks;
> +
> +	/** @shader_blocks: Number of shader core blocks available. */
> +	__u32 shader_blocks;
> +
> +	/** @pad: MBZ. */
> +	__u32 pad;
> +};
> +
>  /**
>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>   */
> @@ -1010,6 +1132,371 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
>  
> +/**
> + * DOC: Performance counter decoding in userspace.
> + *
> + * Each sample will be exposed to userspace in the following manner:
> + *
> + * +--------+--------+------------------------+--------+-------------------------+-----+
> + * | Sample | Block  |        Block           | Block  |         Block           | ... |
> + * | header | header |        counters        | header |         counters        |     |
> + * +--------+--------+------------------------+--------+-------------------------+-----+
> + *
> + * Each sample will start with a sample header of type @struct drm_panthor_perf_sample header,
> + * providing sample-wide information like the start and end timestamps, the counter set currently
> + * configured, and any errors that may have occurred during sampling.
> + *
> + * After the fixed size header, the sample will consist of blocks of
> + * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters, each prefaced with a
> + * header of its own, indicating source block type, as well as the cycle count needed to normalize
> + * cycle values within that block, and a clock source identifier.
> + */

At first I was a bit confused about this header, because I could not find it anywhere in the spec.
Then I realised it's been devised specifically for user samples. Is it really impossible for
user space to be able to pick up these values from the FW sample itself, other than the
timestamp and cycles values? I think as of lately some of these can also be queried from UM.

> +/**
> + * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
> + * hardware block went through in a sampling period.
> + *
> + * Because the sampling period is controlled from userspace, the block may undergo multiple
> + * state transitions, so this must be interpreted as one or more such transitions occurring.
> + */
> +enum drm_panthor_perf_block_state {
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
> +	 * the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
> +	 * the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
> +	 * sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
> +	 * some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
> +	 * some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
> +	 * for some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
> +	 * for some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
> +};
> +
> +/**
> + * struct drm_panthor_perf_block_header - Header present before every block in the
> + * sample ringbuffer.
> + */
> +struct drm_panthor_perf_block_header {
> +	/** @block_type: Type of the block. */
> +	__u8 block_type;
> +
> +	/** @block_idx: Block index. */
> +	__u8 block_idx;
> +
> +	/**
> +	 * @block_states: Coarse-grained block transitions, bitmask of enum
> +	 * drm_panthor_perf_block_states.
> +	 */
> +	__u8 block_states;
> +
> +	/**
> +	 * @clock: Clock used to produce the cycle count for this block, taken from
> +	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
> +	 */
> +	__u8 clock;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[4];
> +
> +	/** @enable_mask: Bitmask of counters requested during the session setup. */
> +	__u64 enable_mask[2];
> +};
> +
> +/**
> + * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
> + * period.
> + */
> +enum drm_panthor_perf_sample_flags {
> +	/**
> +	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
> +	 * of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
> +	 * the sample duration.
> +	 */
> +	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
> +};
> +
> +/**
> + * struct drm_panthor_perf_sample_header - Header present before every sample.
> + */
> +struct drm_panthor_perf_sample_header {
> +	/**
> +	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
> +	 */
> +	__u64 timestamp_start_ns;
> +
> +	/**
> +	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
> +	 */
> +	__u64 timestamp_end_ns;
> +
> +	/** @block_set: Set of performance counter blocks. */
> +	__u8 block_set;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[3];
> +
> +	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
> +	__u32 flags;
> +
> +	/**
> +	 * @user_data: User data provided as part of the command that triggered this sample.
> +	 *
> +	 * - Automatic samples (periodic ones or those around non-counting periods or power state
> +	 * transitions) will be tagged with the user_data provided as part of the
> +	 * DRM_PANTHOR_PERF_COMMAND_START call.
> +	 * - Manual samples will be tagged with the user_data provided with the
> +	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
> +	 * - A session's final automatic sample will be tagged with the user_data provided with the
> +	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
> +	 */
> +	__u64 user_data;
> +
> +	/**
> +	 * @toplevel_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 toplevel_clock_cycles;
> +
> +	/**
> +	 * @coregroup_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 coregroup_clock_cycles;
> +
> +	/**
> +	 * @shader_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 shader_clock_cycles;
> +};
> +
> +/**
> + * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
> + * IOCTL.
> + */
> +enum drm_panthor_perf_command {
> +	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
> +	DRM_PANTHOR_PERF_COMMAND_SETUP,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
> +	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
> +	DRM_PANTHOR_PERF_COMMAND_START,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
> +	DRM_PANTHOR_PERF_COMMAND_STOP,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
> +	 *
> +	 * When the sampling session is configured with a non-zero sampling frequency, any
> +	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
> +	 * -EINVAL.
> +	 */
> +	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
> +};
> +
> +/**
> + * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
> + */
> +struct drm_panthor_perf_control {
> +	/** @cmd: Command from enum drm_panthor_perf_command. */
> +	__u32 cmd;
> +
> +	/**
> +	 * @handle: session handle.
> +	 *
> +	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
> +	 * It must be used in subsequent commands for the same context.
> +	 */
> +	__u32 handle;
> +
> +	/**
> +	 * @size: size of the command structure.
> +	 *
> +	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
> +	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
> +	 * struct_size) to the pointer and update the size accordingly.
> +	 */
> +	__u64 size;
> +
> +	/** @pointer: user pointer to a command type struct. */
> +	__u64 pointer;
> +};
> +
> +
> +/**
> + * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
> + */
> +struct drm_panthor_perf_cmd_setup {
> +	/**
> +	 * @block_set: Set of performance counter blocks.
> +	 *
> +	 * This is a global configuration and only one set can be active at a time. If
> +	 * another client has already requested a counter set, any further requests
> +	 * for a different counter set will fail and return an -EBUSY.
> +	 *
> +	 * If the requested set does not exist, the request will fail and return an -EINVAL.
> +	 */
> +	__u8 block_set;

How do we know for a given hardware model, what block sets it supports? When I wrote the
implementation of perfcnt for Panthor we're using at Collabora right now, that was a question
I could never find an answer for in the spec.

> +	/** @pad: MBZ. */
> +	__u8 pad[7];
> +
> +	/** @fd: eventfd for signalling the availability of a new sample. */
> +	__u32 fd;
> +
> +	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
> +	__u32 ringbuf_handle;

If UM is in charge of creating this BO, how would it know how big it should be? I suppose this
would be conveyed by perf info returned by panthor_ioctl_dev_query().     

> +	/**
> +	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
> +	 * insert and extract indices for the ringbuffer.
> +	 */
> +	__u32 control_handle;
> +
> +	/**
> +	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
> +	 * a power of 2.
> +	 *
> +	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
> +	 */
> +	__u32 sample_slots;

Does that mean that the number of user bo slots can be different than the kernel ringbuffer one?

> +
> +	/**
> +	 * @control_offset: Offset into the control BO where the insert and extract indices are
> +	 * located.
> +	 */
> +	__u64 control_offset;
> +
> +	/**
> +	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
> +	 * disables automatic collection and all collection must be done through explicit calls
> +	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
> +	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
> +	 *
> +	 * This disables software-triggered periodic sampling, but hardware will still trigger
> +	 * automatic samples on certain events, including shader core power transitions, and
> +	 * entries to and exits from non-counting periods. The final stop command will also
> +	 * trigger a sample to ensure no data is lost.
> +	 */
> +	__u64 sample_freq_ns;
> +
> +	/**
> +	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 fw_enable_mask[2];
> +
> +	/**
> +	 * @csg_enable_mask: Bitmask of counters to request from the CSG counter blocks. Any bits
> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 csg_enable_mask[2];
> +
> +	/**
> +	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 cshw_enable_mask[2];
> +
> +	/**
> +	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 tiler_enable_mask[2];
> +
> +	/**
> +	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 memsys_enable_mask[2];
> +
> +	/**
> +	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
> +	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 shader_enable_mask[2];
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
> + */
> +struct drm_panthor_perf_cmd_start {
> +	/**
> +	 * @user_data: User provided data that will be attached to automatic samples collected
> +	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
> +	 */
> +	__u64 user_data;

What is this user data pointer being used for in the samples? What kind of information would
it normally add by having it written into the user samples?

> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
> + */
> +struct drm_panthor_perf_cmd_stop {
> +	/**
> +	 * @user_data: User provided data that will be attached to the automatic sample collected
> +	 * at the end of this sampling session.
> +	 */
> +	__u64 user_data;
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
> + */
> +struct drm_panthor_perf_cmd_sample {
> +	/** @user_data: User provided data that will be attached to the sample.*/
> +	__u64 user_data;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.25.1

Adrian Larumbe
