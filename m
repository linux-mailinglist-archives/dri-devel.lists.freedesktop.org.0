Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B7553E4E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 00:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04410EBB0;
	Tue, 21 Jun 2022 22:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DECC10EBB0;
 Tue, 21 Jun 2022 22:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655849240; x=1687385240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yx+xqCYZ1czt8iGf9eBDH2GDsxsY06enHRz2YagSzdg=;
 b=MEftCaaufqkk56Kk+97RBnOmu8UVm2OLxUXrHSe6CCN7j35MhCE+iDST
 3iqwbMzoOjHGAKzpoOUduMVhlqAEO61yCfTIlgi9meHQsT0Z8Uqwk8Xgs
 RpLCaGurvI1LwjtXMtilQjDaPMRRJqYZVEsM+japSVpoxQq3kq3pBJTzq
 qZmcnnfT/U88GhPp5tWrAx9RuhTdcFLf53672RsHHeB4UPmfDVEcvNhcg
 GMATRrmLNPw2J5v/Hxrcz+Td5it/5V8pxV5tbTW7FM8KNEPnCPDJ9Eqiy
 C7JZsWj+CBlnB33JrX3P5qdaNY1kYUjKeBDAvOHAfZkKzW7BmIh8C58Fe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260070297"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="260070297"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 15:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="643844755"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2022 15:07:16 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3m1k-0000Tx-0g;
 Tue, 21 Jun 2022 22:07:16 +0000
Date: Wed, 22 Jun 2022 06:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 08/12] drm/i915/uapi: tweak error capture on
 recoverable contexts
Message-ID: <202206220649.BZGTz35f-lkp@intel.com>
References: <20220621104434.190962-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220621104434.190962-9-matthew.auld@intel.com>
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on linus/master v5.19-rc3 next-20220621]
[cannot apply to drm-intel/for-linux-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/small-BAR-uapi-bits/20220621-184858
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220622/202206220649.BZGTz35f-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/74d1c5140770ba24cdde39293db3dc3cf05321c9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Auld/small-BAR-uapi-bits/20220621-184858
        git checkout 74d1c5140770ba24cdde39293db3dc3cf05321c9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2028:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +2028 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

ff20afc4cee7b6 Thomas Hellström 2021-11-29  2025  
74d1c5140770ba Matthew Auld     2022-06-21  2026  static int eb_capture_stage(struct i915_execbuffer *eb)
ff20afc4cee7b6 Thomas Hellström 2021-11-29  2027  {
ff20afc4cee7b6 Thomas Hellström 2021-11-29 @2028  }
ff20afc4cee7b6 Thomas Hellström 2021-11-29  2029  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
