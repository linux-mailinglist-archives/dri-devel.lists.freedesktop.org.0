Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA952A895DA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 09:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF1F10E66F;
	Tue, 15 Apr 2025 07:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XviJNzWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB01D10E66E;
 Tue, 15 Apr 2025 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744703982; x=1776239982;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4Ur2iLFXVNDMSA4UyjCsAo3d//HF4XrSG3il1Wfcctc=;
 b=XviJNzWujSeMsj/V0BTJ6V7aJjNG/HCYxc5cIPeJ63X+Wnqm/rVsOsJV
 9buPjZqD0hPvb2awz+2jAe/Ct6ohWuZU163fvquYAMnHs/4AR5kgQ7wAM
 CQ7a4dw7rHhQilXk3ImiZv5h08yu14ug4AORT4V7La4ZrWRd5j9WuRg2b
 xkHwoa3yIBjyECrW72opAfzfbSd3rqS6G7lf/FOIhTxND1mAYvmpiwWN2
 JGmfeqP0Hbhi+0EotbYansY/fd27EjR3GHWLolVwdJVmbxjxGzhKGyIRy
 XAOLNBiuyJfUxZkweKklSbxPDTzu2hbtBwxw9cvN3xGIf1qmu6wVgK+ZA g==;
X-CSE-ConnectionGUID: ItJvcgiIQT2i/zh+272T3A==
X-CSE-MsgGUID: BFDTnLS+Q2GRQFWdxDsTZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="48899221"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="48899221"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:59:37 -0700
X-CSE-ConnectionGUID: uilGWqnDRbKxbfHhE4Q5fA==
X-CSE-MsgGUID: R80a86u/SQKUjfMQ31ACHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131029783"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:59:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen Linxuan <chenlinxuan@uniontech.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen Linxuan <chenlinxuan@uniontech.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
Subject: Re: [RFC PATCH 4/7] drm/i915/pxp: fix undefined reference to
 `intel_pxp_gsccs_is_ready_for_sessions'
In-Reply-To: <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
 <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
Date: Tue, 15 Apr 2025 10:59:28 +0300
Message-ID: <87sem9svmn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 11 Apr 2025, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
> On x86_64 with gcc version 13.3.0, I compile kernel with:
>
>   make defconfig
>   ./scripts/kconfig/merge_config.sh .config <(
>     echo CONFIG_COMPILE_TEST=y
>   )
>   make KCFLAGS="-fno-inline-functions -fno-inline-small-functions -fno-inline-functions-called-once"

The change looks good, but I'm guessing the real explanation is that you
have CONFIG_DRM_I915_PXP=n and that appears to be broken.

Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

But how do you want this merged?


BR,
Jani.

>
> Then I get a linker error:
>
>   ld: vmlinux.o: in function `pxp_fw_dependencies_completed':
>   kintel_pxp.c:(.text+0x95728f): undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'
>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> index 9aae779c4da3..4969d3de2bac 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -23,6 +23,7 @@ int intel_pxp_gsccs_init(struct intel_pxp *pxp);
>  
>  int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
>  void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
> +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
>  
>  #else
>  static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> @@ -34,8 +35,11 @@ static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
>  	return 0;
>  }
>  
> -#endif
> +static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
> +{
> +	return false;
> +}
>  
> -bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> +#endif
>  
>  #endif /*__INTEL_PXP_GSCCS_H__ */

-- 
Jani Nikula, Intel
