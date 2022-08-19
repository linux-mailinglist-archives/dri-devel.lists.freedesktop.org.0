Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C153599DA9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 16:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC2710EA65;
	Fri, 19 Aug 2022 14:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66A10EA65;
 Fri, 19 Aug 2022 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660920062; x=1692456062;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=QJCohzmA6wte7TO2zXC2D3QguFaAb5AK+F2YZ8NHYiE=;
 b=iInmbSECIcjw/YCr/OZDvJFslHP1yWv74JBrqu5bLAGupAdxlaWb2Wpi
 SNNxN5hHTBLfV15oW+lBs11fiWIWVg+1j9wstfMp5GzBjcFwzCwqt1yZn
 hfYs7GEvWUoO8MirSYAc0IjKx/kF4DUjdQxsIetOc7OZCTft843hk602J
 JronefxPNJMTjqmexnLD+s34NZ0LDjEM8nvF3y6JucSaK776M9YVWFXAS
 7e8gQFjovGzyfpTEe6fXg+iGanUnGq9CEkwhwbG3eTl1fpbjn5oYXyhZ1
 S9C31k086GfIVV6YzGpiC5OvkjBmYwdk46DK2bBx6Iy4PHl4OGziiJq5C w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="294300950"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="294300950"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 07:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="936241117"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 19 Aug 2022 07:40:59 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oP3BD-0001WV-09;
 Fri, 19 Aug 2022 14:40:59 +0000
Date: Fri, 19 Aug 2022 22:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: [drm-intel:drm-intel-gt-next 2/2]
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:352:20: error: unused
 function 'context_has_committed_requests'
Message-ID: <202208192254.jhkStQcS-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: kbuild-all@lists.01.org, Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/gem/i915_gem_context.c
drivers/gpu/drm/i915/gt/intel_context.h
drivers/gpu/drm/i915/gt/intel_context_types.h
drivers/gpu/drm/i915/gt/uc/intel_guc.h
drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
drivers/gpu/drm/i915/i915_selftest.h
tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   6a079903847cce1dd06345127d2a32f26d2cd9c6
commit: 6a079903847cce1dd06345127d2a32f26d2cd9c6 [2/2] drm/i915/guc: Add delay to disable scheduling after pin count goes to zero
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220819/202208192254.jhkStQcS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 0ac597f3cacf60479ffd36b03766fa7462dabd78)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel drm-intel-gt-next
        git checkout 6a079903847cce1dd06345127d2a32f26d2cd9c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:352:20: error: unused function 'context_has_committed_requests' [-Werror,-Wunused-function]
   static inline bool context_has_committed_requests(struct intel_context *ce)
                      ^
   1 error generated.


vim +/context_has_committed_requests +352 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

62eaf0ae217d45 Matthew Brost 2021-07-26  351  
5b116c17e6babc Matthew Brost 2021-09-09 @352  static inline bool context_has_committed_requests(struct intel_context *ce)
5b116c17e6babc Matthew Brost 2021-09-09  353  {
5b116c17e6babc Matthew Brost 2021-09-09  354  	return !!ce->guc_state.number_committed_requests;
5b116c17e6babc Matthew Brost 2021-09-09  355  }
5b116c17e6babc Matthew Brost 2021-09-09  356  

:::::: The code at line 352 was first introduced by commit
:::::: 5b116c17e6babc6de2e26714bc66228c74038b71 drm/i915/guc: Drop pin count check trick between sched_disable and re-pin

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: John Harrison <John.C.Harrison@Intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
