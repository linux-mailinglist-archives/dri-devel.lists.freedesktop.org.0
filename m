Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119997187FA
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B007D10E1D8;
	Wed, 31 May 2023 17:03:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604A510E1D7;
 Wed, 31 May 2023 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685552617; x=1717088617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kw75a4tnMO6moGL0Mcj9cZmWvUFea18mh3qLG3UPRZs=;
 b=dsb8WvnhNnyxc3BJtdkQe4RWN5mXt4qp6Lnx2W7trDWuLUaDiqZtB7Nv
 gg+LTVpn+7jpYptqMSokE03xJyzzyG9qgfDXG9MAeaPL3RYkunDPtYW+E
 TAyQTAEK0R3mJBaWq5Du5WEQHnnolUoxyUQTvD5GqCE8zfl4fT8SHydPo
 gd+Da1nr/6nTgR1n9u09uq2NGWO50d7EGQuqsBSIRERJh0+BbwEpnPg//
 UKuKdkkkA8e4aOIriM8jlaFgDTTUuxcgKsuxpztF44EaqwgqmDT6lSYrG
 nyFHnlebGOorPA6a/R6cf4T30fuvLAXEXLaoYQ+fICt+c8SDzvNqR0v3K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="334923705"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="334923705"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 09:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684453507"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="684453507"
Received: from itaraban-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 09:59:43 -0700
Date: Wed, 31 May 2023 18:59:40 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Remove some obsolete definitions
Message-ID: <ZHd8/KtuvoWJwvfv@ashyti-mobl2.lan>
References: <20230531155942.441862-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531155942.441862-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Wed, May 31, 2023 at 08:59:42AM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There were a bunch of defines and structures left over from an API
> update a very long time ago. Remove them.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 33 ---------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 4e57bd09d50d9..b4d56eccfb1f0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -35,13 +35,6 @@
>  #define GUC_MAX_CONTEXT_ID		65535
>  #define	GUC_INVALID_CONTEXT_ID		GUC_MAX_CONTEXT_ID
>  
> -#define GUC_RENDER_ENGINE		0
> -#define GUC_VIDEO_ENGINE		1
> -#define GUC_BLITTER_ENGINE		2
> -#define GUC_VIDEOENHANCE_ENGINE		3
> -#define GUC_VIDEO_ENGINE2		4
> -#define GUC_MAX_ENGINES_NUM		(GUC_VIDEO_ENGINE2 + 1)
> -
>  #define GUC_RENDER_CLASS		0
>  #define GUC_VIDEO_CLASS			1
>  #define GUC_VIDEOENHANCE_CLASS		2
> @@ -499,32 +492,6 @@ struct guc_log_buffer_state {
>  	u32 version;
>  } __packed;
>  
> -struct guc_ctx_report {
> -	u32 report_return_status;
> -	u32 reserved1[64];
> -	u32 affected_count;
> -	u32 reserved2[2];
> -} __packed;
> -
> -/* GuC Shared Context Data Struct */
> -struct guc_shared_ctx_data {
> -	u32 addr_of_last_preempted_data_low;
> -	u32 addr_of_last_preempted_data_high;
> -	u32 addr_of_last_preempted_data_high_tmp;
> -	u32 padding;
> -	u32 is_mapped_to_proxy;
> -	u32 proxy_ctx_id;
> -	u32 engine_reset_ctx_id;
> -	u32 media_reset_count;
> -	u32 reserved1[8];
> -	u32 uk_last_ctx_switch_reason;
> -	u32 was_reset;
> -	u32 lrca_gpu_addr;
> -	u64 execlist_ctx;
> -	u32 reserved2[66];
> -	struct guc_ctx_report preempt_ctx_report[GUC_MAX_ENGINES_NUM];
> -} __packed;

yeah... they're not used anywhere...

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
