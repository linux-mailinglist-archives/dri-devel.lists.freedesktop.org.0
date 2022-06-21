Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD96553ABC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 21:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513E310E80C;
	Tue, 21 Jun 2022 19:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B80110EA0D;
 Tue, 21 Jun 2022 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655840716; x=1687376716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XOZjryIEof/z4mYJMT7LBjOVAVj3i95FWekNXL5NpC8=;
 b=neult6f9bo7v8xV85btZSCDqV0gNg2WDI+y04B2R5jlnwhbcB6i447JL
 uTol+uVCaaKI2fUOjPc/a4kKdS/YB/RuT279MXs62Rz2xY6GLkdNnyoqc
 kO9YbkdgVxNazUVFB1sCqSUS/lCy8hpBmFrW9BJJT6IiU/kaIZbGX/w2x
 SdpohtrJcAdA44wXgR+mKBBuQw87gOcpHw2Hk0SPJXQVhH5rDX+B9yclo
 Cc9WnSOD0sZ7832smx0qDfc2uVIvvOCJItK4kNmAkI5Yu1GsUEkd2Da96
 GiI+9gG6KNxueG8+jPFGQc4yJZavQXlIhqPiYxM5Y434WQgeT06rC5Y/U Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="277769433"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="277769433"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 12:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="833733378"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jun 2022 12:45:11 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3joF-0000LI-8G;
 Tue, 21 Jun 2022 19:45:11 +0000
Date: Wed, 22 Jun 2022 03:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 03/12] drm/i915/uapi: expose the avail tracking
Message-ID: <202206220325.JAXbxJ16-lkp@intel.com>
References: <20220621104434.190962-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621104434.190962-4-matthew.auld@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, llvm@lists.linux.dev,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v5.19-rc3 next-20220621]
[cannot apply to drm-intel/for-linux-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/small-BAR-uapi-bits/20220621-184858
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220622/202206220325.JAXbxJ16-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c421b7689a4552aa8e3acc2fe558d097c464870e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Auld/small-BAR-uapi-bits/20220621-184858
        git checkout c421b7689a4552aa8e3acc2fe558d097c464870e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:374: warning: expecting prototype for i915_ttm_buddy_man_visible_size(). Prototype was for i915_ttm_buddy_man_avail() instead


vim +374 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c

   362	
   363	/**
   364	 * i915_ttm_buddy_man_visible_size - Query the avail tracking for the manager.
   365	 *
   366	 * @man: The buddy allocator ttm manager
   367	 * @avail: The total available memory in pages for the entire manager.
   368	 * @visible_avail: The total available memory in pages for the CPU visible
   369	 * portion. Note that this will always give the same value as @avail on
   370	 * configurations that don't have a small BAR.
   371	 */
   372	void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
   373				     u64 *avail, u64 *visible_avail)
 > 374	{
   375		struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
   376	
   377		mutex_lock(&bman->lock);
   378		*avail = bman->mm.avail >> PAGE_SHIFT;
   379		*visible_avail = bman->visible_avail;
   380		mutex_unlock(&bman->lock);
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
