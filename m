Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BFB493E9E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82FF10E1ED;
	Wed, 19 Jan 2022 16:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FC010E1B6;
 Wed, 19 Jan 2022 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642611237; x=1674147237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8pZSvEi9rquxwXrszIRf2gCK/ow/gOe+bkO+nvMwHiQ=;
 b=Ed9xYb2/luyBV/U4ptc4l4+1FUjiGgUOG1kuB1gQIsxnm9HSxaEacOwa
 bsmvxCxIHyjY2VWw8wlkKkTktq28vBJ5ODgImrpS0IHWqtt5sMd558Wws
 B7KdS8hiTuRot8M4xC3Wnss43LSzrPUdQW/DXkzV1HQdn15c3OJOoUzLJ
 3er2bvgfAm1tpZVDsGmKMbCO3Jb4FljJ9Ii8aQjIK9LohQLY1Ml4WE5aC
 faigV9v0qosB5Vzrfn5eykeOy1MLepKFtthv6oSXysLIhOa1UmZWVOVmK
 EYYDtjF4+2IA8pdeeohktC5Rz0rUd5yidRSnv3iBcd3E1cYhp89Gx1FTh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="308450492"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="308450492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 08:53:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="693843934"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 08:53:56 -0800
Date: Wed, 19 Jan 2022 08:53:56 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 0/7] DRM kmap() fixes and kmap_local_page() conversions
Message-ID: <20220119165356.GD209936@iweiny-DESK2.sc.intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210232404.4098157-1-ira.weiny@intel.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 03:23:57PM -0800, 'Ira Weiny' wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> This series starts by converting the last easy kmap() uses to
> kmap_local_page().
> 
> There is one more call to kmap() wrapped in ttm_bo_kmap_ttm().  Unfortunately,
> ttm_bo_kmap_ttm() is called in a number of different ways including some which
> are not thread local.  I have a patch to convert that call.  However, it is not
> straight forward so it is not included in this series.
> 
> The final 2 patches fix bugs found while working on the ttm_bo_kmap_ttm()
> conversion.

Gentile ping on this series?  Will it make this merge window?

Thanks,
Ira

> 
> 
> Ira Weiny (7):
> drm/i915: Replace kmap() with kmap_local_page()
> drm/amd: Replace kmap() with kmap_local_page()
> drm/gma: Remove calls to kmap()
> drm/radeon: Replace kmap() with kmap_local_page()
> drm/msm: Alter comment to use kmap_local_page()
> drm/amdgpu: Ensure kunmap is called on error
> drm/radeon: Ensure kunmap is called on error
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
> drivers/gpu/drm/gma500/gma_display.c | 6 ++----
> drivers/gpu/drm/gma500/mmu.c | 8 ++++----
> drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 4 ++--
> drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
> drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
> drivers/gpu/drm/i915/gt/shmem_utils.c | 4 ++--
> drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
> drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
> drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
> drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
> drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
> 13 files changed, 32 insertions(+), 32 deletions(-)
> 
> --
> 2.31.1
> 
