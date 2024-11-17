Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3019D0292
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 10:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D53D10E1E5;
	Sun, 17 Nov 2024 09:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvlUOnGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B6C10E031;
 Sun, 17 Nov 2024 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731834978; x=1763370978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g4ehLSqsya6NJQtkjdgyvdNG0TLIzz8TwUMtsuSLxek=;
 b=nvlUOnGQFRniMBtCbZiWxcQZN7nc8DKM5MUbFqMcn2ij7fYOMHK+8qYT
 2SI4S9fFzbPQaBQ3yUF53hywP0F8RfVncc6lucBgLa31vkSPg1HQU1azA
 VRkZO1CWc8Wp3+MKayL/pcHhOfTlhbuatvOQUsGZceofIqdCEvYRyZVDR
 T7s+IIcs6nX1ZruGqwCJ5LmACx1IoJ1/QQSZcodKzRwig5aEmRubkYANu
 lSQoNuEeogj2EbMljpd9W3rVi9beOWppAJsuO3aGLwd3bVA4BsB4/AswS
 aZ9B5Bj4+L0v7R5QQx55bfD/UtF90Rk062tMw60U7HPXA7uhLmEn7UZuH w==;
X-CSE-ConnectionGUID: C56V5acmT3GpQUbPN6axvw==
X-CSE-MsgGUID: ynWz6apLQ2yETUlnWRjg3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31739669"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; d="scan'208";a="31739669"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 01:16:17 -0800
X-CSE-ConnectionGUID: jraRo+LeTxqqej/ImtU/gw==
X-CSE-MsgGUID: cqMAJ3wyScW0hGareT7SIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; d="scan'208";a="112241906"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2024 01:16:14 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tCbO8-0001fH-24;
 Sun, 17 Nov 2024 09:16:12 +0000
Date: Sun, 17 Nov 2024 17:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?unknown-8bit?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, 
 kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/7] drm/vmwgfx: use the new drm_exec object
Message-ID: <202411171611.9LEZwWSe-lkp@intel.com>
References: <20241114153020.6209-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114153020.6209-5-christian.koenig@amd.com>
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-qxl-switch-to-using-drm_exec-v2/20241115-014610
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241114153020.6209-5-christian.koenig%40amd.com
patch subject: [PATCH 4/7] drm/vmwgfx: use the new drm_exec object
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241117/202411171611.9LEZwWSe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171611.9LEZwWSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171611.9LEZwWSe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_validation.c:861: warning: Function parameter or struct member 'fence' not described in 'vmw_validation_bo_fence'


vim +861 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c

   850	
   851	/**
   852	 * vmw_validation_bo_fence - Unreserve and fence buffer objects registered
   853	 * with a validation context
   854	 * @ctx: The validation context
   855	 *
   856	 * This function unreserves the buffer objects previously reserved using
   857	 * vmw_validation_bo_reserve, and fences them with a fence object.
   858	 */
   859	void vmw_validation_bo_fence(struct vmw_validation_context *ctx,
   860				     struct vmw_fence_obj *fence)
 > 861	{
   862		struct vmw_validation_bo_node *entry;
   863	
   864		list_for_each_entry(entry, &ctx->bo_list, base.head) {
   865			dma_resv_add_fence(entry->base.bo->base.resv, &fence->base,
   866					   DMA_RESV_USAGE_READ);
   867		}
   868		drm_exec_fini(&ctx->exec);
   869	}
   870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
