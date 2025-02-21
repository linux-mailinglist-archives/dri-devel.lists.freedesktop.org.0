Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E8A3F4B6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 13:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2D710E14C;
	Fri, 21 Feb 2025 12:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIZHLqI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B360610E14C;
 Fri, 21 Feb 2025 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740142202; x=1771678202;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qpRyZUjFAyUXuaPJ3hgufE3DwtniP3067W8pigBOxm0=;
 b=AIZHLqI/KaaTc7JUmEqdvJLjCaSX77ba0jTOttyJsHN1lL6EUF42oyAe
 uUdW8LWACDggwCo0hhmtwpZMAegcrU6DmkYUj9Ja7pbOwP+g5koE3IxRg
 wXV1gTRkDdASyosx1jt4eBzLI9UpEzlZMpbeB8d96Bm6WHb9KLzVXhOCw
 c5WnHcGpkGLz07c8O1iJrbcnny0jhAj6BWAVtRSaPZBlTiPVYIIARB44+
 o+8JFyB0h1u46ZYpmvjmUhEDCjEe5oy/SSVpfB3Qvt9xVX8Uf9osLH9Gn
 zykQFChwUyirrCT18UYACahSpGejkQ5OQ7xVc7sqVCbEab3gDBgXsdcBP A==;
X-CSE-ConnectionGUID: dYUXG9Q8S+aW/Kp4fNsYfg==
X-CSE-MsgGUID: umSs63oBRoePvAE03Wg4JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41098481"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="41098481"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 04:50:01 -0800
X-CSE-ConnectionGUID: qMR84jh6RjOl2Qcpnji+Qg==
X-CSE-MsgGUID: Aea0YCiJTCGYOmVr1lNRfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119489904"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 04:49:58 -0800
Date: Fri, 21 Feb 2025 13:49:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, joonas.lahtinen@linux.intel.com,
 tvrtko.ursulin@igalia.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 simona.vetter@ffwll.ch
Subject: Re: [PATCH] tests/intel/xe_query: Add per drm client reset stats tests
Message-ID: <20250221124956.m34rb7jy2oyuymgf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, joonas.lahtinen@linux.intel.com,
 tvrtko.ursulin@igalia.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 simona.vetter@ffwll.ch
References: <20250220203747.130371-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220203747.130371-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2025-02-20 at 20:37:47 +0000, Jonathan Cavitt wrote:
> Add tests that exercise the xe reset stats query.  The current tests
> simply output the result of the tests and assert that the reset and ban
> counters properly increment.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  include/drm-uapi/xe_drm.h |  50 ++++++

Please split drm-uapi change into separate patch,
also give drm-next hash and/or lore.kernel.org link

See git log -- include/drm-uapi/xe_drm.h

Regards,
Kamil

>  tests/intel/xe_query.c    | 339 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 389 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 08e263b3b2..e4f2f0d2a6 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -700,6 +700,7 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> +#define DRM_XE_DEVICE_QUERY_RESET_STATS		10
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> @@ -1729,6 +1730,55 @@ struct drm_xe_oa_stream_info {
>  	__u64 reserved[3];
>  };
>  
> +#define MAX_BAN_COUNT	50
> +/**
> + * struct drm_xe_exec_queue_ban - Per drm client exec queue ban info returned
> + * from @DRM_XE_DEVICE_QUERY_RESET_STATS query.  Includes the exec queue ID and
> + * all associated pagefault information, if relevant.
> + */
> +struct drm_xe_exec_queue_ban {
> +	/** @exec_queue_id: ID of banned exec queue */
> +	__u32 exec_queue_id;
> +	/**
> +	 * @pf_found: whether or not the ban is associated with a pagefault.
> +	 * If not, all pagefault data will default to 0 and will not be relevant.
> +	 */
> +	__u8 pf_found;
> +	/** @access_type: access type of associated pagefault */
> +	__u8 access_type;
> +	/** @fault_type: fault type of associated pagefault */
> +	__u8 fault_type;
> +	/** @vfid: VFID of associated pagefault */
> +	__u8 vfid;
> +	/** @asid: ASID of associated pagefault */
> +	__u32 asid;
> +	/** @pdata: PDATA of associated pagefault */
> +	__u16 pdata;
> +	/** @engine_class: engine class of associated pagefault */
> +	__u8 engine_class;
> +	/** @engine_instance: engine instance of associated pagefault */
> +	__u8 engine_instance;
> +	/** @fault_addr: faulted address of associated pagefault */
> +	__u64 fault_addr;
> +};
> +
> +/**
> + * struct drm_xe_query_reset_stats - Per drm client reset stats query.
> + */
> +struct drm_xe_query_reset_stats {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +	/** @reset_count: Number of times the drm client has observed an engine reset */
> +	__u64 reset_count;
> +	/** @ban_count: number of exec queue bans saved by the drm client */
> +	__u64 ban_count;
> +	/**
> +	 * @ban_list: flexible array of struct drm_xe_exec_queue_ban, reporting all
> +	 * observed exec queue bans on the drm client.
> +	 */
> +	struct drm_xe_exec_queue_ban ban_list[];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

[...]
