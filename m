Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3995452CF28
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B26311B173;
	Thu, 19 May 2022 09:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7A11B168;
 Thu, 19 May 2022 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652951804; x=1684487804;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VDPzy+NLDn7xNPBlLszl23YikyEz2vzx9AIZnJ08J14=;
 b=cFOTuV8G91oAF0OTLNTuqD9GbyH4Nd0Its1RzSzMQlv19A6fEZq54hxc
 Nx0TNoSViDd9oaphZSBeI7tJ+Pi+Wp2cFScQuXNux8yw6r/ylM8kaICuP
 UX3mVqATxzrdzb56MXz/QurD+dGfIEpFRegjHxYUtiXgEhXRhH0pz0Oqt
 PVdPFC52CX1XO8x45iVLznppXqOjiBx7PjxJCdpRPvj83XhVJv2DWw8pr
 K9kCpwK1d+XamQcHR6of57RpI8EEBRVHUzYMbMlKv9O1XtyB/n1FaeNC5
 vjN/nGkvXrF3JFEdhv8iJXEy5aRoIWDKLnnaH2YY1i4DjmgtZ4aekBlBH w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="259686321"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="259686321"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:16:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="545996613"
Received: from tszulist-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.146.157])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:16:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/7] Revert some refactoring patches
In-Reply-To: <20220519090802.1294691-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220519090802.1294691-1-tvrtko.ursulin@linux.intel.com>
Date: Thu, 19 May 2022 12:16:39 +0300
Message-ID: <87k0ahdgqw.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> As agreed on the mailing list and between the maintainers more consensus is
> needed on the topic.

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Tvrtko Ursulin (7):
>   Revert "drm/i915: Drop has_psr from device info"
>   Revert "drm/i915: Drop has_dp_mst from device info"
>   Revert "drm/i915: Drop has_ddi from device info"
>   Revert "drm/i915: Drop has_logical_ring_elsq from device info"
>   Revert "drm/i915: Drop has_reset_engine from device info"
>   Revert "drm/i915: Drop has_rc6 from device info"
>   Revert "drm/i915: Drop has_gt_uc from device info"
>
>  drivers/gpu/drm/i915/gt/intel_reset.c    |  2 +-
>  drivers/gpu/drm/i915/i915_drv.h          | 16 ++++++-------
>  drivers/gpu/drm/i915/i915_gpu_error.c    |  2 +-
>  drivers/gpu/drm/i915/i915_pci.c          | 29 +++++++++++++++++++++++-
>  drivers/gpu/drm/i915/intel_device_info.h |  7 ++++++
>  5 files changed, 44 insertions(+), 12 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
