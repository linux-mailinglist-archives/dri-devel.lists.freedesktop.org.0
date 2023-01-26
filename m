Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEF067C8D8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 11:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCDB10E0F7;
	Thu, 26 Jan 2023 10:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1210E0F7;
 Thu, 26 Jan 2023 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674729800; x=1706265800;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EazPdvNqw4WKeqOkz+e9GWoVFd0BMsMTWGZSUst843c=;
 b=Zbpp6XlQq5gCHVe3foMFT2GVOb2seRj2MK5xcD3L1fMSzfi9vULwKkoQ
 /9Ugq50jEUCbnjrXc3UM2tj5b+KsT8TQDpUvcbTsL8XfzXa801ONSIv8M
 76VF5xGHACgorW6H14Fugx1gQ6nh/aKBpe7jnqEoS+ujaPM+jhUFaNHJt
 lNY2Ax4fRmwpPZjzvRAM4Mds9vJRI8XrQEELz9WmRHJ7l7wD9omAXRVtj
 ZFuaoRrp0Wk54kGj8S4QA0gZ76ksafgOH9OKMhfuAeF85owS6qby08d6E
 86Unx9GKtT9hC+wuNfNQkh9DpomThRd8w6WYbWUC4iveGjLl6vodfOfKb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="307127872"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="307127872"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 02:43:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="908185581"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="908185581"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 02:43:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [CI v8 0/4] drm/i915: switch to drm_edid and enable HF-EEODB
 support
In-Reply-To: <cover.1674643465.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1674643465.git.jani.nikula@intel.com>
Date: Thu, 26 Jan 2023 12:43:15 +0200
Message-ID: <87edrh60fw.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Jan 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Here are the drm/i915 patches from [1], re-submitted to CI now that the
> drm/edid dependencies from that series have been merged to
> drm-misc-next, merged to drm-next, and backmerged to drm-misc-next.
>
> Fingers crossed. This has been a long journey.

And pushed to drm-intel-next.

Many thanks to Ville for all the reviews along the way!

BR,
Jani.


>
>
> [1] https://patchwork.freedesktop.org/series/112392/
>
> Jani Nikula (4):
>   drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
>   drm/i915/bios: convert intel_bios_init_panel() to drm_edid
>   drm/i915/opregion: convert intel_opregion_get_edid() to struct
>     drm_edid
>   drm/i915/panel: move panel fixed EDID to struct intel_panel
>
>  drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     | 23 ++---
>  drivers/gpu/drm/i915/display/intel_bios.h     |  4 +-
>  .../gpu/drm/i915/display/intel_connector.c    |  5 +-
>  .../drm/i915/display/intel_display_types.h    |  8 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 91 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_dvo.c      |  2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 28 +++---
>  drivers/gpu/drm/i915/display/intel_lvds.c     | 51 +++++++----
>  drivers/gpu/drm/i915/display/intel_opregion.c | 29 +++---
>  drivers/gpu/drm/i915/display/intel_opregion.h |  4 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    | 10 +-
>  drivers/gpu/drm/i915/display/intel_panel.h    |  4 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c        |  2 +-
>  15 files changed, 144 insertions(+), 121 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
