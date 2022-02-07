Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9674ACC3C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0740F10E3F3;
	Mon,  7 Feb 2022 22:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FBD10E3F3;
 Mon,  7 Feb 2022 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644273959; x=1675809959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=whqlna5oOEwhsCfDS07w6SnQtQCRLPyP3Fpum2Hvraw=;
 b=NArRBU8Q7b+05FxpODDr1kaUZRm1i4d81hez+b37bmntdyoq9hAhHKZa
 YVOdOkDIfkjbVqp6K2BTsJbZWlp7QEzfXc9qZGZHIL3MsnWzgfttI/45y
 RUT2d6wIq/i1jtSSXfppeRV30UXt9yLQ0tfEuqpCbDqnUVWgWud10OzKu
 wFiBGssFuxBxMRTA/YTNqy2/uNTcUnziGVKNFmiJEiAChjraDjz/LFxZm
 rUO6Ou2HgaGLulE9GhiosGpggJDbpA/B/VWEd4JQOSz1pEy3dbmL6rsO3
 5VnLJism4hdFIY1JGt1IMcj+l8EL2FSuPtVXdEzo939cP2yeq88Co+EMd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248772167"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="248772167"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 14:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="700630614"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 07 Feb 2022 14:45:57 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHClh-00013n-2h; Mon, 07 Feb 2022 22:45:57 +0000
Date: Tue, 8 Feb 2022 06:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Verify hwconfig blob
 matches supported format
Message-ID: <202202080601.vp3JG4Dh-lkp@intel.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next v5.17-rc3 next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jordan-Justen/GuC-HWCONFIG-with-documentation/20220208-032950
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-m021-20220207 (https://download.01.org/0day-ci/archive/20220208/202202080601.vp3JG4Dh-lkp@intel.com/config)
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

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c: In function 'verify_hwconfig_blob':
>> drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:79:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      79 |  struct drm_i915_query_hwconfig_blob_item *pos = hwconfig->ptr;
         |  ^~~~~~


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
