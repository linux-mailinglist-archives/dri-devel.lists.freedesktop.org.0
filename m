Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D275AEF26
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC9E10E6E5;
	Tue,  6 Sep 2022 15:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EC110E6E5;
 Tue,  6 Sep 2022 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662478972; x=1694014972;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=q/t2xXJOCKIwwsKytBeRNJazqwWcqDJbNilXTWorb9M=;
 b=cRdvV8K2yVmt8IjXJ4W6983MFC8Ih70MStbAks/MBv42MCFk33YqlR3J
 FLgH/RVKgC4UPrEjNV3g9zLXYCUpLqdKcfWjcIqonr0iWsBNDusoS4BX3
 gr/2ff0r44aAjBD5Ls+2p9eVlYtANS5lr7DZ3RjqJCb3K5G1KtFXDpk6S
 TvX6u6V1hD4JtHewFxmCiBl3wxB6Xf9Bd7j+HqDBkBJaV7d+/0OBTayqW
 lrZF3uuwIXaN/X39BnMmf8UyRlL8LrSie/XfQr0568gntU7Z+T1ZdZOIg
 5pC+D9IJ95duZfmzIuKi3ZAaWixMhRIju1zSKjkO0B6RV+DbaDM+RlAvf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="360573240"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="360573240"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 08:42:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="675743427"
Received: from amomin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.228])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 08:42:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/4] Add DP MST DSC support to i915
In-Reply-To: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
Date: Tue, 06 Sep 2022 18:42:31 +0300
Message-ID: <87v8q08q6w.fsf@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 dri-devel@lists.freedesktop.org, Stanislav.Lisovskiy@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 05 Sep 2022, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com> wrote:
> Currently we have only DSC support for DP SST.

As discussed elsewhere, the patches were modified while applying to
resolve conflicts, leading to further conflicts in drm-tip rebuild, and
eventually drm-tip build breakage. They would've created further
conflicts in linux-next as well as drm-intel-next feature pull (or
drm-next backmerge to drm-intel-next).

I've gone ahead and reverted the commits from drm-intel-next directly,
with Rodrigo's ack. The conflict resolution would have been messy and
generated a bunch of extra work, and we needed to get drm-tip build back
on track ASAP.

We'll need to have a clean baseline to apply the patches on, i.e.
drm-misc-next pull request to drm-next, and drm-next backmerge to
drm-intel-next.


BR,
Jani.


>
> Stanislav Lisovskiy (4):
>   drm: Add missing DP DSC extended capability definitions.
>   drm/i915: Fix intel_dp_mst_compute_link_config
>   drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to separate
>     function
>   drm/i915: Add DSC support to MST path
>
>  drivers/gpu/drm/i915/display/intel_dp.c     |  73 ++++----
>  drivers/gpu/drm/i915/display/intel_dp.h     |  17 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 195 ++++++++++++++++++--
>  include/drm/display/drm_dp.h                |  10 +-
>  4 files changed, 237 insertions(+), 58 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
