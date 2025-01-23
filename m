Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922BA1A6D2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D5410E866;
	Thu, 23 Jan 2025 15:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qg/xUrvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0788E10E882;
 Thu, 23 Jan 2025 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737645276; x=1769181276;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GKcTbWhSImUoFOrdn+ul/dc3QS6L9tZcghr+ql2lxKU=;
 b=Qg/xUrvprKyOE2U1Gf1nIDhvj7AoOwv/tl/lO29U76vtPTnHdnJ26uj+
 c6tWePCqPdyKCCCz1P+5r+iidtxSj+yhilZ2wvW7yHh7UCZrfpipglCXG
 yohzAKZXbdFQL7iKFwyGgCSr/qyM78AfiZvBqXGfJTuuRDuKFTAmWrud2
 usCBHEE/L/WSB0HW6vpX7CEi4hccyeN5vU8JelVrBmHOnxp3/V4IkSzBs
 zIoHx2041mZqCSC/nYr5/l8fFLXGP5l1RUCgTsw35M8N2b1dPM4rAQ04Y
 ScmyMd09t8E2hNbcbwSVjwjiy/n/I91T4Ha3r4ImRL1erR+R6zAeB3+cK A==;
X-CSE-ConnectionGUID: otmbx6qYRcKXkwcfnAAo7w==
X-CSE-MsgGUID: TDhBA/cGQJeWbhgJh5HThQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48645446"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="48645446"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:14:36 -0800
X-CSE-ConnectionGUID: 7py+60iXQgC26m3dGT2Qew==
X-CSE-MsgGUID: m5oDSm1aQJu/yGtoGsUsKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107299863"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:14:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 4/5] drm/print: Include drm_device.h
In-Reply-To: <11497a3e490c001f3a884acb310b4812b643a9a0.1737644530.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
 <11497a3e490c001f3a884acb310b4812b643a9a0.1737644530.git.jani.nikula@intel.com>
Date: Thu, 23 Jan 2025 17:14:31 +0200
Message-ID: <8734h9mujs.fsf@intel.com>
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

On Thu, 23 Jan 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> From: Gustavo Sousa <gustavo.sousa@intel.com>
>
> The header drm_print.h uses members of struct drm_device pointers, as
> such, it should include drm_device.h to let the compiler know the full
> type definition.
>
> Without such include, users of drm_print.h that don't explicitly need
> drm_device.h would bump into build errors and be forced to include the
> latter.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

This posting should have had

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

but obviously not needed if the original [1] is merged instead.


[1] https://lore.kernel.org/r/20250121210935.84357-1-gustavo.sousa@intel.com

>
> ---
>
> Including here as a dependency. May be merged independently.
> ---
>  include/drm/drm_print.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index f77fe1531cf8..9732f514566d 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -32,6 +32,7 @@
>  #include <linux/dynamic_debug.h>
>  
>  #include <drm/drm.h>
> +#include <drm/drm_device.h>
>  
>  struct debugfs_regset32;
>  struct drm_device;

-- 
Jani Nikula, Intel
