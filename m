Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA66EC4B2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 07:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F044510E10E;
	Mon, 24 Apr 2023 05:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14B910E05F;
 Mon, 24 Apr 2023 05:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682313103; x=1713849103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=spjPszczlRJ6WXEUahSzbZ8YRRmzgy2bt1wJgMDK6ng=;
 b=KpDrKQZdPXITCJ6Qvx7NAkvBgBVnETznq5jgHYTkWGg1Cy/Ws1B1ljbT
 BWQs2QRKWCFB0P8kjDvDX6Z5Ui82x2/ltJKptodx5yiAYRX3+ZORyblxq
 IbCa/pRCQUpcB33I4x/ZIrXoHW0MfGoEi7VVBBRj7Etov8y6CsarDDvLU
 thbR0/xf1NY7+BS2CqvEcN8vLqT1gB5KP8yVoKU7ld71cNe5JBrKePonx
 EESHbA5AmlUZFpzisfSUwGMVWklXviv2bEZBAU0+8ULsRFpxVefNunTzm
 VyZNCahLO3KzCifcCmHO4n1uxn/sJtKkTYsgVLZfNlzP1oo5QeCyjMwT3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="374305763"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; d="scan'208";a="374305763"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2023 22:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="939171660"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; d="scan'208";a="939171660"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2023 22:11:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pqoUF-000iHE-31;
 Mon, 24 Apr 2023 05:11:39 +0000
Date: Mon, 24 Apr 2023 13:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
Message-ID: <202304241259.Qq0Dmlud-lkp@intel.com>
References: <20230424014324.218531-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424014324.218531-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>, kernel-dev@igalia.com,
 oe-kbuild-all@lists.linux.dev, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/drm-amdgpu-Mark-contexts-guilty-for-any-reset-type/20230424-094534
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230424014324.218531-1-andrealmeid%40igalia.com
patch subject: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230424/202304241259.Qq0Dmlud-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ea7b1d78b677fdcf5f4776e63de611a2681cd5fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andr-Almeida/drm-amdgpu-Mark-contexts-guilty-for-any-reset-type/20230424-094534
        git checkout ea7b1d78b677fdcf5f4776e63de611a2681cd5fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304241259.Qq0Dmlud-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function 'amdgpu_device_pre_asic_reset':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4738:28: warning: variable 'job' set but not used [-Wunused-but-set-variable]
    4738 |         struct amdgpu_job *job = NULL;
         |                            ^~~


vim +/job +4738 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

5740682e66cef5 Monk Liu          2017-10-25  4733  
e3c1b0712fdb03 shaoyunl          2021-02-16  4734  int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
04442bf70debb1 Lijo Lazar        2021-03-16  4735  				 struct amdgpu_reset_context *reset_context)
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4736  {
5c1e6fa49e8d8d Huang Rui         2021-12-16  4737  	int i, r = 0;
04442bf70debb1 Lijo Lazar        2021-03-16 @4738  	struct amdgpu_job *job = NULL;
04442bf70debb1 Lijo Lazar        2021-03-16  4739  	bool need_full_reset =
04442bf70debb1 Lijo Lazar        2021-03-16  4740  		test_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
04442bf70debb1 Lijo Lazar        2021-03-16  4741  
04442bf70debb1 Lijo Lazar        2021-03-16  4742  	if (reset_context->reset_req_dev == adev)
04442bf70debb1 Lijo Lazar        2021-03-16  4743  		job = reset_context->job;
711826656bebb0 Monk Liu          2017-12-25  4744  
b602ca5f31fe69 Tiecheng Zhou     2020-08-19  4745  	if (amdgpu_sriov_vf(adev)) {
b602ca5f31fe69 Tiecheng Zhou     2020-08-19  4746  		/* stop the data exchange thread */
b602ca5f31fe69 Tiecheng Zhou     2020-08-19  4747  		amdgpu_virt_fini_data_exchange(adev);
b602ca5f31fe69 Tiecheng Zhou     2020-08-19  4748  	}
b602ca5f31fe69 Tiecheng Zhou     2020-08-19  4749  
9e225fb9e636b3 Andrey Grodzovsky 2022-06-18  4750  	amdgpu_fence_driver_isr_toggle(adev, true);
9e225fb9e636b3 Andrey Grodzovsky 2022-06-18  4751  
711826656bebb0 Monk Liu          2017-12-25  4752  	/* block all schedulers and reset given job's ring */
0875dc9e80eb3b Chunming Zhou     2016-06-12  4753  	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
0875dc9e80eb3b Chunming Zhou     2016-06-12  4754  		struct amdgpu_ring *ring = adev->rings[i];
0875dc9e80eb3b Chunming Zhou     2016-06-12  4755  
51687759be93fb Chunming Zhou     2017-04-24  4756  		if (!ring || !ring->sched.thread)
0875dc9e80eb3b Chunming Zhou     2016-06-12  4757  			continue;
5740682e66cef5 Monk Liu          2017-10-25  4758  
c530b02f39850a Jack Zhang        2021-05-12  4759  		/*clear job fence from fence drv to avoid force_completion
c530b02f39850a Jack Zhang        2021-05-12  4760  		 *leave NULL and vm flush fence in fence drv */
5c1e6fa49e8d8d Huang Rui         2021-12-16  4761  		amdgpu_fence_driver_clear_job_fences(ring);
c530b02f39850a Jack Zhang        2021-05-12  4762  
2200edac745a65 Chunming Zhou     2016-06-30  4763  		/* after all hw jobs are reset, hw fence is meaningless, so force_completion */
2f9d4084cac96a Monk Liu          2017-10-16  4764  		amdgpu_fence_driver_force_completion(ring);
2f9d4084cac96a Monk Liu          2017-10-16  4765  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  4766  
9e225fb9e636b3 Andrey Grodzovsky 2022-06-18  4767  	amdgpu_fence_driver_isr_toggle(adev, false);
9e225fb9e636b3 Andrey Grodzovsky 2022-06-18  4768  
04442bf70debb1 Lijo Lazar        2021-03-16  4769  	r = amdgpu_reset_prepare_hwcontext(adev, reset_context);
404b277bbe4945 Lijo Lazar        2021-03-26  4770  	/* If reset handler not implemented, continue; otherwise return */
404b277bbe4945 Lijo Lazar        2021-03-26  4771  	if (r == -ENOSYS)
404b277bbe4945 Lijo Lazar        2021-03-26  4772  		r = 0;
404b277bbe4945 Lijo Lazar        2021-03-26  4773  	else
04442bf70debb1 Lijo Lazar        2021-03-16  4774  		return r;
04442bf70debb1 Lijo Lazar        2021-03-16  4775  
1d721ed679db18 Andrey Grodzovsky 2019-04-18  4776  	/* Don't suspend on bare metal if we are not going to HW reset the ASIC */
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4777  	if (!amdgpu_sriov_vf(adev)) {
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4778  
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4779  		if (!need_full_reset)
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4780  			need_full_reset = amdgpu_device_ip_need_full_reset(adev);
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4781  
360cd08196cabc Likun Gao         2022-12-21  4782  		if (!need_full_reset && amdgpu_gpu_recovery &&
360cd08196cabc Likun Gao         2022-12-21  4783  		    amdgpu_device_ip_check_soft_reset(adev)) {
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4784  			amdgpu_device_ip_pre_soft_reset(adev);
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4785  			r = amdgpu_device_ip_soft_reset(adev);
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4786  			amdgpu_device_ip_post_soft_reset(adev);
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4787  			if (r || amdgpu_device_ip_check_soft_reset(adev)) {
aac891685da661 Dennis Li         2020-08-20  4788  				dev_info(adev->dev, "soft reset failed, will fallback to full reset!\n");
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4789  				need_full_reset = true;
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4790  			}
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4791  		}
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4792  
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4793  		if (need_full_reset)
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4794  			r = amdgpu_device_ip_suspend(adev);
04442bf70debb1 Lijo Lazar        2021-03-16  4795  		if (need_full_reset)
04442bf70debb1 Lijo Lazar        2021-03-16  4796  			set_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
04442bf70debb1 Lijo Lazar        2021-03-16  4797  		else
04442bf70debb1 Lijo Lazar        2021-03-16  4798  			clear_bit(AMDGPU_NEED_FULL_RESET,
04442bf70debb1 Lijo Lazar        2021-03-16  4799  				  &reset_context->flags);
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4800  	}
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4801  
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4802  	return r;
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4803  }
26bc534094ed45 Andrey Grodzovsky 2018-11-22  4804  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
