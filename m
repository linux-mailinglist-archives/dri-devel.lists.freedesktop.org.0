Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FB4ACC3E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0702C10E445;
	Mon,  7 Feb 2022 22:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0408C10E445;
 Mon,  7 Feb 2022 22:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644273994; x=1675809994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uOvlJCvumOOe27Jj5J9j0R/afFWfgkAVjbKOZNsfGCc=;
 b=SKPbR2tj6a43XA3BEXkZX+hQSG6qr3cLIk+Yb3paGc6S+KGjDbEUVZRJ
 cJFx6NoyFv8dI9mDqXxyep7zrpPwnBQewveBhOYlOAMI0Bk6ca21WzfVm
 MxqLuHGX+RpyDLBa4mHil6iZmA1CyGEtU58RQS2UXKwRXIv7MkPpUQ0fU
 PwDFdD8ts2b5HA27nMxITjtyxmeeBQWIQ1b++O8WxIJnv0wBz0Uhz5HuB
 GyoEbElRTWXan6byEBkElkxXt/8Pwk0z2HoqnaM3B6XlVrfE8ZqdHF3hH
 ZMby26JuHSe/xswgUQk24F1FjQLdjCAY6O7Nd744Iwa4H4yT5er68H7Vd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="236228634"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="236228634"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 14:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="481736862"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 07 Feb 2022 14:45:57 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHClh-00013s-4V; Mon, 07 Feb 2022 22:45:57 +0000
Date: Tue, 8 Feb 2022 06:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Verify hwconfig blob
 matches supported format
Message-ID: <202202080648.8LUbxyNz-lkp@intel.com>
References: <20220207192854.862959-5-jordan.l.justen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207192854.862959-5-jordan.l.justen@intel.com>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jordan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next v5.17-rc3 next-20220207]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jordan-Justen/GuC-HWCONFIG-with-documentation/20220208-032950
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-buildonly-randconfig-r001-20220207 (https://download.01.org/0day-ci/archive/20220208/202202080648.8LUbxyNz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c122b0dea958e76766ce9b4b9f34d2eed16fb566
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jordan-Justen/GuC-HWCONFIG-with-documentation/20220208-032950
        git checkout c122b0dea958e76766ce9b4b9f34d2eed16fb566
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:79:44: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           struct drm_i915_query_hwconfig_blob_item *pos = hwconfig->ptr;
                                                     ^
   1 warning generated.


vim +79 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c

    73	
    74	static int verify_hwconfig_blob(const struct intel_guc_hwconfig *hwconfig)
    75	{
    76		if (hwconfig->size % 4 != 0 || hwconfig->ptr == NULL)
    77			return -EINVAL;
    78	
  > 79		struct drm_i915_query_hwconfig_blob_item *pos = hwconfig->ptr;
    80		u32 remaining = (hwconfig->size / 4);
    81		while (remaining > 0) {
    82			if (remaining < 2)
    83				return -EINVAL;
    84			if (pos->length > remaining - 2)
    85				return -EINVAL;
    86			remaining -= 2 + pos->length;
    87			pos = (void *)&pos->data[pos->length];
    88		}
    89	
    90		DRM_INFO("hwconfig blob format appears valid\n");
    91		return 0;
    92	}
    93	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
