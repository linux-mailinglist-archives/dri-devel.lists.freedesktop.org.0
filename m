Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C874ACCA0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 00:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467EA10E323;
	Mon,  7 Feb 2022 23:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0210E11A;
 Mon,  7 Feb 2022 23:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644277024; x=1675813024;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k/0gQIxOM/A5eqSnHd8iXZqSwly2pP5OyyjTtf3ubmM=;
 b=e52fwOESFjbyrURF7MCnEj5YUIYkWyHzz/ubmr0B1REkeOewbZ6OAMMg
 C6ELHnjv6fh3uFB0cN4mmPcx5PwI/3ojOfD1DOQytNkoPYhsM3yKc2Yza
 M0x8izwmNa8LNeTi2ri7rxo1uHSt9gRaBlhsH1ig+/2bc47WHBEl+sQMS
 +p4o3wZgdcCx15Npb+HEvl/+CDB+e3E72AeRkBfBAyVKtcniz4uFTeF14
 Ko8tpFKt2zDWqt3hGIDdMSkcBM7H+l5QAdIfVSWdjzblMW2+RkJgqbuGG
 y186HD6Id5cjrbLI53OPfLoQGIp5JTFJoV9HQfRIwDpm2+lWcQjwzXGVn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="236236006"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="236236006"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 15:37:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="525321049"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 15:37:02 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHDZ7-00016N-Fv; Mon, 07 Feb 2022 23:37:01 +0000
Date: Tue, 8 Feb 2022 07:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Verify hwconfig blob
 matches supported format
Message-ID: <202202080749.RRjxhCB2-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jordan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next v5.17-rc3 next-20220207]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jordan-Justen/GuC-HWCONFIG-with-documentation/20220208-032950
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-a016-20220207 (https://download.01.org/0day-ci/archive/20220208/202202080749.RRjxhCB2-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/c122b0dea958e76766ce9b4b9f34d2eed16fb566
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jordan-Justen/GuC-HWCONFIG-with-documentation/20220208-032950
        git checkout c122b0dea958e76766ce9b4b9f34d2eed16fb566
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c: In function 'verify_hwconfig_blob':
>> drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:79:2: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
      79 |  struct drm_i915_query_hwconfig_blob_item *pos = hwconfig->ptr;
         |  ^~~~~~
   cc1: all warnings being treated as errors


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
