Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A280750D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 17:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B33B10E75B;
	Wed,  6 Dec 2023 16:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB8210E75B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701880410; x=1733416410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=htX4iDGNzlMTy6lmTdVTpUZwaIRb7KEUVU3EoBWvnLk=;
 b=HdVo6bRmcEolbAExFIIc4O5lkT/Tx6n5w9Cm50LVaIozX2vDiU4LXylN
 PGSxSIwvFZWnC/BkRhEqBqxuC2seMbf2bfx3FreIVvUcObzSveNK/Gt7P
 uWk0P09q6Yr1sq0Tv3S3TTnRTof1E28WPaOJVeidhpv5KcxMmJtyB4pqS
 g/PEVKXZdiIfvPTDlxgHMrCWFbu6b36NfIe2Hi5EJmhM9tb3Ei9bzpoxb
 fqTAlv6qZUw3Fded5cmZHJ4mycs5iZgaciKg4k1v4OsQeDK5gd5jVm7B6
 yj673StskDf7l23Rvgnqqdc/71uAZ/Sjml275NxW117zt/6v5PX7AdhTQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="957918"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="957918"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 08:33:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="889404516"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="889404516"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2023 08:33:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rAupw-000B8t-2n;
 Wed, 06 Dec 2023 16:33:24 +0000
Date: Thu, 7 Dec 2023 00:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>, davidgow@google.com,
 Rae Moar <rmoar@google.com>, Brendan Higgins <brendan.higgins@linux.dev>
Subject: Re: [PATCH] drm/tests: Switch to kunit devices
Message-ID: <202312070011.fDjYhKoz-lkp@intel.com>
References: <20231205090405.153140-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205090405.153140-1-mripard@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, llvm@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231205]
[cannot apply to drm-misc/drm-misc-next v6.7-rc4 v6.7-rc3 v6.7-rc2 linus/master v6.7-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-tests-Switch-to-kunit-devices/20231205-170508
base:   next-20231205
patch link:    https://lore.kernel.org/r/20231205090405.153140-1-mripard%40kernel.org
patch subject: [PATCH] drm/tests: Switch to kunit devices
config: i386-buildonly-randconfig-004-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070011.fDjYhKoz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070011.fDjYhKoz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070011.fDjYhKoz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_kunit_helpers.c:8:10: fatal error: 'kunit/device.h' file not found
   #include <kunit/device.h>
            ^~~~~~~~~~~~~~~~
   1 error generated.


vim +8 drivers/gpu/drm/tests/drm_kunit_helpers.c

     7	
   > 8	#include <kunit/device.h>
     9	#include <kunit/resource.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
