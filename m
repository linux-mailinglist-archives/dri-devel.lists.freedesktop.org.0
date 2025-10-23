Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC9C02C6F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 19:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0666D10E938;
	Thu, 23 Oct 2025 17:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVeFlUr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F1710E938
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761241436; x=1792777436;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OPmFaWma6y4YW8vwhdFuBehBTVgNJVOFP3M1cphhH8g=;
 b=JVeFlUr/9/CLb2N+Rvd7YZsj9ITnBIcODVAVkTS4XmnJWi34NoByIKHY
 05TSfNWP9q8dJR8Nj9zdJA3suBg/QXaOxnkzvQgab7/IzJ8JE+wPQF8wn
 K286cv9qSrAgUK9z8N4dLsYV64kmNYlE2Dcy6xSrKh8hp84qEwaugL16M
 IQ7KEkhjtLZDD/giwEvbdMI/DulstQi8UFZ7Hb6kUkTGxpfC+L1Mgv/Pc
 GprcWlxycH1rVM/V8fz4YkpteAbEyC/gfwBI2fJ2ckrbQ6B03oXsYRj7B
 8zHUXydttcSSNupN+LDcC+5JwbbRasCD7E9PJQ3jeQ25GvISYUp9vI8fZ A==;
X-CSE-ConnectionGUID: /o94mRbQTXSQ081RVgakcQ==
X-CSE-MsgGUID: tlqxWFIyTPioM1YkZpQknw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62630301"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="62630301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:43:55 -0700
X-CSE-ConnectionGUID: gCMptSLHQvGzxmqyUN3+eA==
X-CSE-MsgGUID: jjGlo5O6SB6ztosuZedC5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184116064"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 23 Oct 2025 10:43:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vBzL6-000DkT-1T;
 Thu, 23 Oct 2025 17:43:50 +0000
Date: Fri, 24 Oct 2025 01:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, ogabbay@kernel.org, lizhi.hou@amd.com,
 karol.wachowski@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and
 uevents
Message-ID: <202510240118.dkdhMpfy-lkp@intel.com>
References: <20251022202527.3873558-2-youssef.abdulrahman@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022202527.3873558-2-youssef.abdulrahman@oss.qualcomm.com>
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

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc2 next-20251023]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youssef-Samir/accel-qaic-Add-DMA-Bridge-Channel-DBC-sysfs-and-uevents/20251023-042723
base:   linus/master
patch link:    https://lore.kernel.org/r/20251022202527.3873558-2-youssef.abdulrahman%40oss.qualcomm.com
patch subject: [PATCH 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20251024/202510240118.dkdhMpfy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240118.dkdhMpfy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240118.dkdhMpfy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/qaic/qaic_sysfs.c: In function 'qaic_sysfs_init':
>> drivers/accel/qaic/qaic_sysfs.c:74:58: warning: '_state' directive output may be truncated writing 6 bytes into a region of size between 3 and 10 [-Wformat-truncation=]
      74 |                 snprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
         |                                                          ^~~~~~
   drivers/accel/qaic/qaic_sysfs.c:74:17: note: 'snprintf' output between 11 and 18 bytes into a destination of size 14
      74 |                 snprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_state +74 drivers/accel/qaic/qaic_sysfs.c

    56	
    57	int qaic_sysfs_init(struct qaic_drm_device *qddev)
    58	{
    59		struct device *kdev = to_accel_kdev(qddev);
    60		struct drm_device *drm = to_drm(qddev);
    61		u32 num_dbc = qddev->qdev->num_dbc;
    62		struct dbc_attribute *dbc_attrs;
    63		int i, ret;
    64	
    65		dbc_attrs = drmm_kcalloc(drm, num_dbc, sizeof(*dbc_attrs), GFP_KERNEL);
    66		if (!dbc_attrs)
    67			return -ENOMEM;
    68	
    69		for (i = 0; i < num_dbc; ++i) {
    70			struct dbc_attribute *dbc_attr = &dbc_attrs[i];
    71	
    72			sysfs_attr_init(&dbc_attr->dev_attr.attr);
    73			dbc_attr->dbc_id = i;
  > 74			snprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
    75			dbc_attr->dev_attr.attr.name = dbc_attr->name;
    76			dbc_attr->dev_attr.attr.mode = 0444;
    77			dbc_attr->dev_attr.show = dbc_state_show;
    78			ret = sysfs_create_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
    79			if (ret) {
    80				int j;
    81	
    82				for (j = 0; j < i; ++j) {
    83					dbc_attr = &dbc_attrs[j];
    84					sysfs_remove_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
    85				}
    86				drmm_kfree(drm, dbc_attrs);
    87				return ret;
    88			}
    89		}
    90	
    91		qddev->sysfs_attrs = dbc_attrs;
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
