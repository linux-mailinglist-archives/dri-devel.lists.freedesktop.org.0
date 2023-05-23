Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2770D7A8
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A213410E413;
	Tue, 23 May 2023 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509310E410;
 Tue, 23 May 2023 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684831056; x=1716367056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GexNu8ul19rNykCayNqdGi/g9jcsfXGGg+/dYN9Ji4c=;
 b=E+N0eQa8pislWzQLsjTBy6aFc+a6v0+Zo95tm3Je2fvuPT7SL/4q51dA
 bBIaXStYfpDwfYZ5ilkH5IRdrGAaYOfaMantrocpKgXd/NchNWmE6mTWC
 /Wi9a4sqSHi8yO5dmnqeYfONdvWKoFlQ/KRPDsm7PgxxNfpx63+anZBz3
 pdlYNghRhezfoIXx+d2lne4lqhvzIpvP/2C3CM24jdch7W2wJMPQM3lTw
 rXMgck1gvMq4aG3DSxfMrmGHgfDZzVmTEpY2y6lwN1qNKEmBmJrWPBs7N
 SMGcLJSkFtHp28ZWUcE35i4L+QU7VADPSwcpzAOFXZJUA2NoKr4apZfYo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="418884403"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="418884403"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 01:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="706916200"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="706916200"
Received: from vkutovoi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.197])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 01:37:25 -0700
Date: Tue, 23 May 2023 10:37:22 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH v10 0/2] drm/i915: Allow user to set cache at
 BO creation
Message-ID: <ZGx7Quf+ArHnXOR0@ashyti-mobl2.lan>
References: <20230519051103.3404990-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519051103.3404990-1-fei.yang@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

finally... pushed in drm-intel-gt-next! :)

Andi

On Thu, May 18, 2023 at 10:11:01PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> This series introduce a new extension for GEM_CREATE,
> 1. end support for set caching ioctl [PATCH 1/2]
> 2. add set_pat extension for gem_create [PATCH 2/2]
> 
> v2: drop one patch that was merged separately
>     commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
> v3: rebased on https://patchwork.freedesktop.org/series/117082/
> v4: fix missing unlock introduced in v3, and
>     solve a rebase conflict
> v5: replace obj->cache_level with pat_set_by_user,
>     fix i915_cache_level_str() for legacy platforms.
> v6: rebased on https://patchwork.freedesktop.org/series/117480/
> v7: rebased on https://patchwork.freedesktop.org/series/117528/
> v8: dropped the two dependent patches that has been merged
>     separately. Add IGT link and Tested-by (MESA).
> v9: addressing comments (Andi)
> v10: acked-by and tested-by MESA
> 
> Fei Yang (2):
>   drm/i915/mtl: end support for set caching ioctl
>   drm/i915: Allow user to set cache at BO creation
> 
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c |  3 ++
>  drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  9 ++++-
>  include/uapi/drm/i915_drm.h                | 42 ++++++++++++++++++++++
>  tools/include/uapi/drm/i915_drm.h          | 42 ++++++++++++++++++++++
>  6 files changed, 137 insertions(+), 1 deletion(-)
> 
> -- 
> 2.25.1
