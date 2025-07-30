Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6403B1604D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 14:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9C310E67D;
	Wed, 30 Jul 2025 12:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMd1KkW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11BE10E203;
 Wed, 30 Jul 2025 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878381; x=1785414381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Yqt9k3FEoN2rn755DspRcdnjCj8ruGaUo76ndianeec=;
 b=TMd1KkW3QNLEoDmxJ7j5DCmm3nBkTCCDRV1KQeyd7bEQvsDDqRjUlKdB
 bVpvtYcb/B+ue3P653MxGKsFX/fXJuYwiFvUJ7GeoC7v8E7FZqrOkOFAu
 tidCcL9qCbJrFCtCBN0fDS9DE+KnFuC30p/k9RrLT32++l3C4jSS56Osm
 XHFD2XWwt50xKz80tGNQxLZJBwWyAUMVIhbD/13+YNGvf7hxxjDUzA7IN
 62Yi2J79E+83woUkCqP8s9mKAWQLBWUBLdrseIB5EhEVHy742QGfK0hJ0
 mCJMFiY9f0fBc26rECR/Ih7U0iv5a8tjIrB3UzUnS58qATGvxwBevQN2V A==;
X-CSE-ConnectionGUID: 3q3+tWdaTgu09sItFE/mzA==
X-CSE-MsgGUID: CJ0WpoxsTM2R2ft8m4Gliw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56142552"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56142552"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:26:21 -0700
X-CSE-ConnectionGUID: QsyMguNhTASkZtzr+udzvw==
X-CSE-MsgGUID: vuxavx1ZQKGyIClQO/DVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163427193"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2025 05:26:16 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uh5sr-0002ie-31;
 Wed, 30 Jul 2025 12:26:13 +0000
Date: Wed, 30 Jul 2025 20:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marie Zhussupova <marievic@google.com>, rmoar@google.com,
 davidgow@google.com, shuah@kernel.org, brendan.higgins@linux.dev
Cc: oe-kbuild-all@lists.linux.dev, elver@google.com, dvyukov@google.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marie Zhussupova <marievic@google.com>
Subject: Re: [PATCH 7/9] kunit: Add example parameterized test with shared
 resources and direct static parameter array setup
Message-ID: <202507302042.9Aw3rrmW-lkp@intel.com>
References: <20250729193647.3410634-8-marievic@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729193647.3410634-8-marievic@google.com>
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

Hi Marie,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/kunit]
[also build test ERROR on shuah-kselftest/kunit-fixes drm-xe/drm-xe-next linus/master v6.16 next-20250730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marie-Zhussupova/kunit-Add-parent-kunit-for-parameterized-test-context/20250730-033818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
patch link:    https://lore.kernel.org/r/20250729193647.3410634-8-marievic%40google.com
patch subject: [PATCH 7/9] kunit: Add example parameterized test with shared resources and direct static parameter array setup
config: arc-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507302042.9Aw3rrmW-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507302042.9Aw3rrmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507302042.9Aw3rrmW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kunit_get_next_param_and_desc" [lib/kunit/kunit-example-test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
