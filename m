Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22184C24EA1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD67E10EB2E;
	Fri, 31 Oct 2025 12:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDkckg07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B010E10EB1B;
 Fri, 31 Oct 2025 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761912348; x=1793448348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VkVOBBztHbf5OnMunexhusiVEZtxdXW/RGu9oNoL5xI=;
 b=XDkckg07J8JZwBIti23rEPHBDgFtFDST6CNhrlDitvDV4+vGFVPsognm
 g9jeRkmhBBvt/cJK5DJMlKX34JTOO6cgOPDOrsVx9R1lXeZVhcxsckhcC
 hFAwYR6bBxkLgYXZtZVKi8Ps4BNj6oB4B8/b0h3D9lsNdPjXU1jF0ov6N
 tBvBU3jKNMNuqG768CCUSiA9uJJWazXlTbII/ri42oLAvZOThSvMpaxxb
 MzYwDA2k9DMdjSCY4TPMEgTAASuhjCuAgMbT1hCJQ4EUMIF0qDXSwyEYZ
 x74grMSWIlImkotKq2EVieBVQEWrnaURgQz3AfBVQ+4iINEwJ2anFUuMX g==;
X-CSE-ConnectionGUID: So0VtYURQvKYKUdkDgJKtg==
X-CSE-MsgGUID: F+oHCHkoSKe4EWetDZRKfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67910437"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67910437"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:05:48 -0700
X-CSE-ConnectionGUID: C0gg40gQRlaq0xn+9CjnhQ==
X-CSE-MsgGUID: aZ8dwoVUT5eHJEPOW6wF5Q==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2025 05:05:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vEnt0-000N4s-00;
 Fri, 31 Oct 2025 12:05:42 +0000
Date: Fri, 31 Oct 2025 20:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
Message-ID: <202510311903.wAzY7iCb-lkp@intel.com>
References: <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
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

Hi Mohamed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohamed-Ahmed/drm-nouveau-uvmm-Prepare-for-larger-pages/20251031-070600
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251030230357.45070-3-mohamedahmedegypt2001%40gmail.com
patch subject: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
config: alpha-randconfig-r064-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311903.wAzY7iCb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311903.wAzY7iCb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311903.wAzY7iCb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_uvmm.c: In function 'op_map_aligned_to_page_shift':
>> drivers/gpu/drm/nouveau/nouveau_uvmm.c:462:37: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     462 |  return op->va.addr & non_page_bits == 0 &&
         |                       ~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:463:38: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     463 |         op->va.range & non_page_bits == 0 &&
         |                        ~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:464:40: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
     464 |         op->gem.offset & non_page_bits == 0;
         |                          ~~~~~~~~~~~~~~^~~~


vim +462 drivers/gpu/drm/nouveau/nouveau_uvmm.c

   456	
   457	static bool
   458	op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_shift)
   459	{
   460		u64 non_page_bits = (1ULL << page_shift) - 1;
   461	
 > 462		return op->va.addr & non_page_bits == 0 &&
   463		       op->va.range & non_page_bits == 0 &&
   464		       op->gem.offset & non_page_bits == 0;
   465	}
   466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
