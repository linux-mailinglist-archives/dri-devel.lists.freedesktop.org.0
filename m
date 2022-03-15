Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10E4D93AE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 06:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208A710E230;
	Tue, 15 Mar 2022 05:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFC110E0A9;
 Tue, 15 Mar 2022 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647321654; x=1678857654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d1EduR8kKDQ0j/1RYK/utaIVjFqqOdOwpZdN9tiQQEo=;
 b=PdnWQs7Wc3UiYyrTfAQNzndMKhDKts201Sy4gCcWV0c/hbprdwnyTgj0
 nooCuUJLG2KN2+yD+BNHhMlAq77blOQbZDOEAAHhsI2FmqksSdEPK86Bg
 v3bnuc3cTRrqQOh5bfSD5jX87p6lYFA5qz6sezXnxrmTLTVdN6rEnnikH
 l1tqQu5hPwmCcT8OEvM5wD79oyrSQX1DuNOpr7+zsopvTPEbieAunho9/
 otKHqyNPY3m/pmbcfQeFJ7BBs4hahBsH9y73xPnQoM8y3Gs3yaXoSYnoC
 qjrDGm/AMO8kMLPe3Sk8pR7OzV/Lrc5lrdqTXQv0/9geJ3E2164MR0HVP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236161858"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="236161858"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 22:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="497886001"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 22:20:51 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nTzc3-000Aah-8J; Tue, 15 Mar 2022 05:20:51 +0000
Date: Tue, 15 Mar 2022 13:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/i915: Report steering details in debugfs
Message-ID: <202203151352.zdgy8H4M-lkp@intel.com>
References: <20220314234203.799268-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314234203.799268-2-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on drm-exynos/exynos-drm-next drm/drm-next next-20220310]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matt-Roper/i915-General-multicast-steering-updates/20220315-074349
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220315/202203151352.zdgy8H4M-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/cd773701a65fdee649b70395d226ba9b5f7d5d30
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matt-Roper/i915-General-multicast-steering-updates/20220315-074349
        git checkout cd773701a65fdee649b70395d226ba9b5f7d5d30
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/intel_gt.c:99:12: sparse: sparse: symbol 'intel_steering_types' was not declared. Should it be static?

vim +/intel_steering_types +99 drivers/gpu/drm/i915/gt/intel_gt.c

    98	
  > 99	const char *intel_steering_types[] = {
   100		"L3BANK",
   101		"MSLICE",
   102		"LNCF",
   103	};
   104	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
