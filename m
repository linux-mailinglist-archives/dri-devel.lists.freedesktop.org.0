Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C943D4D6404
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 15:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D613C10E3B9;
	Fri, 11 Mar 2022 14:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441F10E3B9;
 Fri, 11 Mar 2022 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647009913; x=1678545913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0TnQ0wVC+3ShDjxmbQjTE8dgBeJFmf2s40bJqPvF9E8=;
 b=H/lmkz8y7rHONeTB0lpYFIFYQAdCDKK2k9FpHLSDFi9vmV0tlp8ztruh
 MyoyNQgIg5Uzaq+sRYjCsQobmUse7u/Js4EL43PwYXXHwpAZcmuA8916o
 MuzxDhE+MQAL8LCoPXdOWEZ5iV0AfBQWFVXiwawsao0MA0Q4H1AOxkOk2
 LjAaiAFgMl/hwRgEfKwktQKjJS+Axm1FNwvH0o/5P/sgU7+2N0mUIANT8
 50nPeU60t6zQkASi3BcgPQvOFg4t2tJZc1/QVn8vjPeSfCdpPra8bIqkI
 ui3cOKhMXlvcxzCMEjwgSM8QzhNgCQWShyTLrWlHgUGjApx2lnZjYtGFL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="236186164"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="236186164"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 06:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514521899"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 06:45:11 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSgVy-0006ZX-MP; Fri, 11 Mar 2022 14:45:10 +0000
Date: Fri, 11 Mar 2022 22:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/xehp: Update topology dumps for
 Xe_HP
Message-ID: <202203112245.eDvNTHyE-lkp@intel.com>
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
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20220311/202203112245.eDvNTHyE-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/38985b2e6acdbe67dedb5de8a8aeef917b746453
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matt-Roper/drm-i915-sseu-Don-t-overallocate-subslice-storage/20220311-141705
        git checkout 38985b2e6acdbe67dedb5de8a8aeef917b746453
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_sseu.c:59:5: warning: no previous prototype for 'intel_sseu_get_geometry_subslices' [-Wmissing-prototypes]
      59 | u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_sseu_get_geometry_subslices +59 drivers/gpu/drm/i915/gt/intel_sseu.c

    58	
  > 59	u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
    60	{
    61		return _intel_sseu_get_subslices(sseu, sseu->geometry_subslice_mask, 0);
    62	}
    63	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
