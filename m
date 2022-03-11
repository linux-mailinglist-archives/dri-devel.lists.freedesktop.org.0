Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AB04D691E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 20:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF36610EA54;
	Fri, 11 Mar 2022 19:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749AA10EA4F;
 Fri, 11 Mar 2022 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647027244; x=1678563244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ci5S2HwsyZl7Wl7l2FUCXcZbQytDiEsdOK/FiiRQ37s=;
 b=djIq3OlZUZUWiWtA91kbQ53/Hfsg/YyeSP+Gfj3IWARYL/YYY1oqNecc
 rZDKl4O/Mc/vKk2OfmkCncHMfc4Q/fIYRNoYfOZau5L+vXY4QdqMKteh2
 hEuk8Jm7VdfbTuVgPyroDonf7VbFFcB3cdXLrCMRcL2RrYlrh3emICKO4
 sqwoafQNvlIo8LP7fzfc9p0HRFKgsOqYadYkCze9Vd6q5NmvWEARrVn3q
 V0lX2RjyOiXZFhlFrGqqRMeqqORIihQvaVZ7fWGsiJbNwzdsmvjuA5lzW
 /f1a+mFdurolhpUrEoouupKVHk9Vg7YxLl/Q8x1x1zfNv+y8ln6M4h+ra Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="255587736"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="255587736"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 11:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="496859689"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 11 Mar 2022 11:34:02 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSl1W-0006zj-2B; Fri, 11 Mar 2022 19:34:02 +0000
Date: Sat, 12 Mar 2022 03:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/xehp: Update topology dumps for
 Xe_HP
Message-ID: <202203120322.OkxCdfs7-lkp@intel.com>
References: <20220311061543.153611-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311061543.153611-2-matthew.d.roper@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on drm-exynos/exynos-drm-next drm/drm-next next-20220310]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matt-Roper/drm-i915-sseu-Don-t-overallocate-subslice-storage/20220311-141705
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20220312/202203120322.OkxCdfs7-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/38985b2e6acdbe67dedb5de8a8aeef917b746453
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matt-Roper/drm-i915-sseu-Don-t-overallocate-subslice-storage/20220311-141705
        git checkout 38985b2e6acdbe67dedb5de8a8aeef917b746453
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/intel_sseu.c:59:5: sparse: sparse: symbol 'intel_sseu_get_geometry_subslices' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
