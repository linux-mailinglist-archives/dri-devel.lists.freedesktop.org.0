Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA877F3DA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 11:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074DF10E05B;
	Thu, 17 Aug 2023 09:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BEB10E05B;
 Thu, 17 Aug 2023 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692265765; x=1723801765;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JBcHbgWZbRL2zfRL6/JAFi1jjbjVoKn9Zhv1rkwT4oE=;
 b=k2cUZGg4lYnzddpk2DFYOKzo7Ig464itYFieMyspSBx7Ysk9ba8kGgD6
 Gwuj9lt3AaHzs8Y7CwGTIgjJFSLLU6an4BUhQcLk8ZMr7iFznkLQrOnqS
 njFbiIrEhMEM7V9Okza7uOqdejZsTsf1wBJZWf5ADaRR38hz9CGIV5sjs
 rYU/pX8kGXAd9Z/qgETT0H0weqMwGjD2U6ZhJDOpDE/o/lmS9E5HtLZ1L
 oEC7UNw2IF82Py83MN3xkoEl9uhMUd3ibwWeQd3dHHbNKptFcnxZrMuFi
 +jtdvW35EG/kECpBV1v6d9zq43MQlYsbItEaue7U0bgdHkOQ4NUh/v8tK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376502113"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="376502113"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 02:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="684375451"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="684375451"
Received: from yuguen-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.43.197])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 02:49:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/20] DSC misc fixes
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
Date: Thu, 17 Aug 2023 12:49:20 +0300
Message-ID: <87wmxu80db.fsf@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> This series is an attempt to address multiple issues with DSC,
> scattered in separate existing series.

I think it's a good idea to have one person manage the series, and
combine it all together, because it touches the same areas.

However, once you have smaller batches of patches that are all reviewed,
send them out as smaller series, and get them merged. Re-sending and
rebasing ready patches as part of a 19-patch series where some patches
aren't ready has become counter-productive.

Getting patches upstream is like working on a machine that has a certain
peak throughput. Send patches one by one, and it's inefficient. Send too
many at once, and it bogs down. Personally, I think 5-10 non-trivial
patches at a time is about right, get them reviewed and merged, rebase
the rest locally, and again send the next 5-10.

Or you can initially send a longer series, but once the first 5-10 have
been reviewed, send them separately.


BR,
Jani.


>
> Patches 1-4 are DSC fixes from series to Handle BPC for HDMI2.1 PCON
> https://patchwork.freedesktop.org/series/107550/
>
> Patches 5-6 are from series DSC fixes for Bigjoiner:
> https://patchwork.freedesktop.org/series/115773/
>
> Patches 7-17 are based on series to add DSC fractional BPP support:
> https://patchwork.freedesktop.org/series/111391/
>
> Patch 20 is to fix compressed bpc for MST DSC, from Stan's series :
> https://patchwork.freedesktop.org/series/116179/
>
> Rev2: Addressed review comments from Stan, Ville.
>
> Rev3: Split larger patches. Separate out common helpers.
>
> Rev4: Rebased, fixed checkpatch warnings.
>
> Rev5: Addressed review comments from Stan.
> Added a patch to check if forced dsc format can be used before forcing.
>
> Rev6: Addressed review comments from Stan.
>
> Rev7: Reordered and rebased.
>
> Ankit Nautiyal (19):
>   drm/i915/dp: Consider output_format while computing dsc bpp
>   drm/i915/dp: Move compressed bpp check with 420 format inside the
>     helper
>   drm/i915/dp_mst: Use output_format to get the final link bpp
>   drm/i915/dp: Use consistent name for link bpp and compressed bpp
>   drm/i915/dp: Update Bigjoiner interface bits for computing compressed
>     bpp
>   drm/i915/intel_cdclk: Add vdsc with bigjoiner constraints on min_cdlck
>   drm/i915/dp: Remove extra logs for printing DSC info
>   drm/display/dp: Fix the DP DSC Receiver cap size
>   drm/i915/dp: Avoid forcing DSC BPC for MST case
>   drm/i915/dp: Add functions to get min/max src input bpc with DSC
>   drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc also
>   drm/i915/dp: Avoid left shift of DSC output bpp by 4
>   drm/i915/dp: Rename helper to get DSC max pipe_bpp
>   drm/i915/dp: Separate out functions for edp/DP for computing DSC bpp
>   drm/i915/dp: Add DSC BPC/BPP constraints while selecting pipe bpp with
>     DSC
>   drm/i915/dp: Separate out function to get compressed bpp with joiner
>   drm/i915/dp: Get optimal link config to have best compressed bpp
>   drm/i915/dp: Check src/sink compressed bpp limit for edp
>   drm/i915/dp: Check if force_dsc_output_format is possible
>
> Stanislav Lisovskiy (1):
>   drm/i915: Query compressed bpp properly using correct DPCD and DP Spec
>     info
>
>  drivers/gpu/drm/i915/display/intel_cdclk.c  |  59 +-
>  drivers/gpu/drm/i915/display/intel_dp.c     | 655 ++++++++++++++++----
>  drivers/gpu/drm/i915/display/intel_dp.h     |  20 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  80 +--
>  include/drm/display/drm_dp.h                |   2 +-
>  5 files changed, 625 insertions(+), 191 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
