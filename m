Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3E4BAA2B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5921E10E73F;
	Thu, 17 Feb 2022 19:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A89110E73B;
 Thu, 17 Feb 2022 19:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645127285; x=1676663285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2UhTY4IABD/LOp22QZON9ksMwoB4e7q5PGbrEcZ+Xq0=;
 b=auszxWN7OHnzCNRVUdmzrpVhCjgo+1+Zzn1Qn/gUMyNMRezt11tszyEa
 ot5RLr5fFQ/PZ1xqhPHnl1KVYwpDXjCKnmd5VCN1xXZOvd7IngUXOu/N+
 /y2Mvxo+Rnr1KjlMg0htZzLawqx/Tj/PHQBbwHUMpM2Gdj1o/4KjE3dcX
 r6MkdoL+CuS6lyhwetu1xzj3b23P9Hj9cvUe3aAbMEtKRNi2xs/EEeoLR
 tGAXT4ASncHTJp+x0cH4oWEKODUwpWjLRhzKLK8TCoodS4JwEbFR/4jXb
 7uvY9GHpTu/+g15Izidnqoi/ku/XsQa8/Bp0coSrz6a/GSVpje/NtDLtb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314225014"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="314225014"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="503662381"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 17 Feb 2022 11:48:02 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKmkz-0000Xl-GK; Thu, 17 Feb 2022 19:48:01 +0000
Date: Fri, 18 Feb 2022 03:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v5 6/7] drm/i915/gt: Create per-tile RPS
 sysfs interfaces
Message-ID: <202202180224.l042viYj-lkp@intel.com>
References: <20220217144158.21555-7-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217144158.21555-7-andi.shyti@linux.intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, kbuild-all@lists.01.org,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andi-Shyti/Introduce-multitile-support/20220217-224547
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220218/202202180224.l042viYj-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/f1802e7224006bf4801fe56193bf5eb223a3f4d0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andi-Shyti/Introduce-multitile-support/20220217-224547
        git checkout f1802e7224006bf4801fe56193bf5eb223a3f4d0
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c: In function 'act_freq_mhz_show':
>> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:250:20: error: implicit declaration of function 'sysfs_gt_attribute_r_func' [-Werror=implicit-function-declaration]
     250 |  s64 actual_freq = sysfs_gt_attribute_r_func(dev, attr,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c: In function 'boost_freq_mhz_store':
>> drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:318:9: error: implicit declaration of function 'sysfs_gt_attribute_w_func' [-Werror=implicit-function-declaration]
     318 |  return sysfs_gt_attribute_w_func(dev, attr,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sysfs_gt_attribute_r_func +250 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c

   246	
   247	static ssize_t act_freq_mhz_show(struct device *dev,
   248					 struct device_attribute *attr, char *buff)
   249	{
 > 250		s64 actual_freq = sysfs_gt_attribute_r_func(dev, attr,
   251							    __act_freq_mhz_show);
   252	
   253		return sysfs_emit(buff, "%u\n", (u32) actual_freq);
   254	}
   255	
   256	static s64 __cur_freq_mhz_show(struct intel_gt *gt)
   257	{
   258		return intel_rps_get_requested_frequency(&gt->rps);
   259	}
   260	
   261	static ssize_t cur_freq_mhz_show(struct device *dev,
   262					 struct device_attribute *attr, char *buff)
   263	{
   264		s64 cur_freq = sysfs_gt_attribute_r_func(dev, attr,
   265							 __cur_freq_mhz_show);
   266	
   267		return sysfs_emit(buff, "%u\n", (u32) cur_freq);
   268	}
   269	
   270	static s64 __boost_freq_mhz_show(struct intel_gt *gt)
   271	{
   272		return intel_rps_get_boost_frequency(&gt->rps);
   273	}
   274	
   275	static ssize_t boost_freq_mhz_show(struct device *dev,
   276					   struct device_attribute *attr,
   277					   char *buff)
   278	{
   279		s64 boost_freq = sysfs_gt_attribute_r_func(dev, attr,
   280							   __boost_freq_mhz_show);
   281	
   282		return sysfs_emit(buff, "%u\n", (u32) boost_freq);
   283	}
   284	
   285	static int __boost_freq_mhz_store(struct intel_gt *gt, u32 val)
   286	{
   287		struct intel_rps *rps = &gt->rps;
   288		bool boost = false;
   289	
   290		/* Validate against (static) hardware limits */
   291		val = intel_freq_opcode(rps, val);
   292		if (val < rps->min_freq || val > rps->max_freq)
   293			return -EINVAL;
   294	
   295		mutex_lock(&rps->lock);
   296		if (val != rps->boost_freq) {
   297			rps->boost_freq = val;
   298			boost = atomic_read(&rps->num_waiters);
   299		}
   300		mutex_unlock(&rps->lock);
   301		if (boost)
   302			schedule_work(&rps->work);
   303	
   304		return 0;
   305	}
   306	
   307	static ssize_t boost_freq_mhz_store(struct device *dev,
   308					    struct device_attribute *attr,
   309					    const char *buff, size_t count)
   310	{
   311		ssize_t ret;
   312		u32 val;
   313	
   314		ret = kstrtou32(buff, 0, &val);
   315		if (ret)
   316			return ret;
   317	
 > 318		return sysfs_gt_attribute_w_func(dev, attr,
   319						 __boost_freq_mhz_store, val) ?: count;
   320	}
   321	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
