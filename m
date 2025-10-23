Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821F7C006FF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 12:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2027310E3AC;
	Thu, 23 Oct 2025 10:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bv5MAQ9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DD410E3AC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761214850; x=1792750850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=scCpTlzLx7rJ8mnOnrRPfnAEvOTBIkLhLrus4KijGvY=;
 b=Bv5MAQ9P5Lzj/mX+lnW1mWZZUL/rYdq8znJhoqPb8UDXLsVgZoKYIbLK
 Vj0dtKmoF4+5oyUMjM1yMDkVqKs/ZS4deitWt3oeWUliCdSt9G8bpsUOg
 80HTP21CU9Zbe7RCXL0GBHDVP/DCZy35SrBbpyTNQzCHaw0SQrNVk6IxU
 0jy3ALkCQO/II4y5ce7sSDI7Q84fX+aFgy6/Yn7s1bj9FvLJ5zVOviT9M
 xhhOARAzYnSYF93m7ZVzO/tAslDj4FDvofvyTnWbHoK5mAhjDSSd/vjZI
 5oWYlZHAQumw4F5L+PPOagIPbV7Akmkf0xxymPUEBPYI3z8BR9Accw8Rq w==;
X-CSE-ConnectionGUID: byoO8pgPRNux27zPD0nyyw==
X-CSE-MsgGUID: 1CxohIiXRNitfoRyY/0pHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67217606"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67217606"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:20:50 -0700
X-CSE-ConnectionGUID: AW8BzHGdT/SxkTvNGqye/Q==
X-CSE-MsgGUID: kLN0X7pFRYqb7BCzQ9YXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="188175344"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 23 Oct 2025 03:20:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vBsR0-000DLV-2m;
 Thu, 23 Oct 2025 10:20:43 +0000
Date: Thu, 23 Oct 2025 18:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, ogabbay@kernel.org, lizhi.hou@amd.com,
 karol.wachowski@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Add support for PM callbacks
Message-ID: <202510231820.AMln6kY3-lkp@intel.com>
References: <20251022204005.3888195-1-youssef.abdulrahman@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022204005.3888195-1-youssef.abdulrahman@oss.qualcomm.com>
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

Hi Youssef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youssef-Samir/accel-qaic-Add-support-for-PM-callbacks/20251023-044052
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251022204005.3888195-1-youssef.abdulrahman%40oss.qualcomm.com
patch subject: [PATCH] accel/qaic: Add support for PM callbacks
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20251023/202510231820.AMln6kY3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231820.AMln6kY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231820.AMln6kY3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/qaic/qaic_drv.c:724:12: warning: 'qaic_pm_resume' defined but not used [-Wunused-function]
     724 | static int qaic_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/accel/qaic/qaic_drv.c:703:12: warning: 'qaic_pm_suspend' defined but not used [-Wunused-function]
     703 | static int qaic_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/qaic_pm_resume +724 drivers/accel/qaic/qaic_drv.c

   702	
 > 703	static int qaic_pm_suspend(struct device *dev)
   704	{
   705		struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
   706	
   707		dev_dbg(dev, "Suspending..\n");
   708		if (qaic_data_path_busy(qdev)) {
   709			dev_dbg(dev, "Device's datapath is busy. Aborting suspend..\n");
   710			return -EBUSY;
   711		}
   712		if (qaic_is_under_reset(qdev)) {
   713			dev_dbg(dev, "Device is under reset. Aborting suspend..\n");
   714			return -EBUSY;
   715		}
   716		qaic_mqts_ch_stop_timer(qdev->mqts_ch);
   717		qaic_pci_reset_prepare(qdev->pdev);
   718		pci_save_state(qdev->pdev);
   719		pci_disable_device(qdev->pdev);
   720		pci_set_power_state(qdev->pdev, PCI_D3hot);
   721		return 0;
   722	}
   723	
 > 724	static int qaic_pm_resume(struct device *dev)
   725	{
   726		struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
   727		int ret;
   728	
   729		dev_dbg(dev, "Resuming..\n");
   730		pci_set_power_state(qdev->pdev, PCI_D0);
   731		pci_restore_state(qdev->pdev);
   732		ret = pci_enable_device(qdev->pdev);
   733		if (ret) {
   734			dev_err(dev, "pci_enable_device failed on resume %d\n", ret);
   735			return ret;
   736		}
   737		pci_set_master(qdev->pdev);
   738		qaic_pci_reset_done(qdev->pdev);
   739		return 0;
   740	}
   741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
