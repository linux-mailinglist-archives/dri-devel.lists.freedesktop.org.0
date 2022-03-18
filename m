Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AAD4DE485
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 00:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879BA10E3AC;
	Fri, 18 Mar 2022 23:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE8B10E3A8;
 Fri, 18 Mar 2022 23:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647646331; x=1679182331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wv3pw9SVdqVQYdBk6USpL97iV7jbm23oLWeSYV7DOKo=;
 b=KArBBhn0aiy4Tt0X2witCLfKGqAuM4HMY9eHVJ+xoqP2ARqW81Iec1h2
 3z2SWkGeDAfENEeKUtr00YXLW2N9XhAvLTq+lstQ7qxMNNPW4dPSG/HI6
 uaED3yNtO9yWjE019sHfAGWcPXAnw3JpelHRBDiWkm7T7MiF3DiUnUgOD
 llDZHHTGa1ybUUAXqdK+i15bPF66ZMfQ23G/HQKp+MHd33gWG2ZhxavMd
 92DecHK6jbGB69N9XO5aAe52lhN2cDZVlSNlRiLQfb4h9sxfDSlsQohej
 jfj2cSOo5Okssd+1B8kMjk7y/0KODtbmkiC7yIa51wx4np6Typtl+dy1Q g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="256071046"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="256071046"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:32:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558713521"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.168])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:32:05 -0700
Date: Sat, 19 Mar 2022 01:32:02 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 0/7] Introduce multitile support
Message-ID: <YjUWWX8RXpUKNNe/@intel.intel>
References: <20220318224640.61594-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318224640.61594-1-andi.shyti@linux.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arghhh!!!! Sorry for spamming! I sent the wrong series!

Please ignore this.

Andi

On Sat, Mar 19, 2022 at 12:46:33AM +0200, Andi Shyti wrote:
> Hi,
> 
> This is the second series that prepares i915 to host multitile
> platforms. It introduces the for_each_gt() macro that loops over
> the tiles to perform per gt actions.
> 
> This patch is a combination of two patches developed originally
> by Abdiel, who introduced some refactoring during probe, and then
> Tvrtko has added the necessary tools to start using the various
> tiles.
> 
> The second patch re-organises the sysfs interface to expose the
> API for each of the GTs. I decided to prioritise this patch
> over others to unblock Sujaritha for further development.
> 
> A third series will still follow this.
> 
> Thanks Michal and Andrzej for the reviews and support!
> 
> Thanks,
> Andi
> 
> Patchwork: https://patchwork.freedesktop.org/series/98741/
> 
> Changelog
> =========
> v5 -> v6
>  - address all Michal and Andrzej's reviews that consist mainly
>    in code refactoring.
> 
> v4 -> v5
>  - fixed Michal's reviews.
>  - the sysfs patches have been split in 3 parts to make reviews
>    easier.
>  - Sujaritha's patch on pm throttle has been queued.
>  - INTEL_REGION_LMEM has been renamed to INTEL_REGION_LMEM_0
>  - added the gt_is_root() helper
>  - the sysfs files will be called intel_gt_sysfs_* instead of
>    sysfs_gt_*
> 
> v3 -> v4
>  - fixed Tvrtko's review:
>     - remove the SYSFS_DEPRECATED_V2 mention from the commit log
>     - reworded the error message when accessing deprecated files
>     - errors in sysfs are printed as warnings as they are not
>       fatal
>     - the inline functions are moved to be out of line.
>    and some other minor refactoring.
> 
> v2 -> v3
>  - Added Matt and Sujaritha's r-b for patch 1 and 2.
>  - Reworded the commit of patch 2 to underline the fact that the
>    interface is useful also when used manually.
> 
> v1 -> v2
>  - fixed a couple of coding style issues in patch 2.
> 
> Andi Shyti (5):
>   drm/i915: Rename INTEL_REGION_LMEM with INTEL_REGION_LMEM_0
>   drm/i915/gt: add gt_is_root() helper
>   drm/i915/gt: create per-tile sysfs interface
>   drm/i915/gt: Create per-tile RC6 sysfs interface
>   drm/i915/gt: Create per-tile RPS sysfs interfaces
> 
> Sujaritha Sundaresan (1):
>   drm/i915/gt: Adding new sysfs frequency attributes
> 
> Tvrtko Ursulin (1):
>   drm/i915: Prepare for multiple GTs
> 
>  drivers/gpu/drm/i915/Makefile                 |   2 +
>  drivers/gpu/drm/i915/display/intel_fb.c       |   2 +-
>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
>  .../drm/i915/display/intel_plane_initial.c    |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |   4 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
>  .../drm/i915/gem/selftests/i915_gem_migrate.c |   8 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c            | 135 +++-
>  drivers/gpu/drm/i915/gt/intel_gt.h            |  22 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      | 122 ++++
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.h      |  34 +
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 601 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h   |  15 +
>  drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  18 +
>  drivers/gpu/drm/i915/gt/intel_rps.h           |   4 +
>  drivers/gpu/drm/i915/i915_driver.c            |  28 +-
>  drivers/gpu/drm/i915/i915_drv.h               |   8 +
>  drivers/gpu/drm/i915/i915_reg.h               |  11 +
>  drivers/gpu/drm/i915/i915_sysfs.c             | 310 +--------
>  drivers/gpu/drm/i915/i915_sysfs.h             |   3 +
>  drivers/gpu/drm/i915/intel_memory_region.c    |   2 +-
>  drivers/gpu/drm/i915/intel_memory_region.h    |   7 +-
>  drivers/gpu/drm/i915/intel_uncore.c           |  11 +-
>  drivers/gpu/drm/i915/intel_uncore.h           |   3 +-
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |   7 +-
>  scripts/extract-cert                          | Bin 0 -> 17952 bytes
>  28 files changed, 1017 insertions(+), 366 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
>  create mode 100755 scripts/extract-cert
> 
> -- 
> 2.35.1
