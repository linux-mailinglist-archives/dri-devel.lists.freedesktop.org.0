Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6078FE4A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 15:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A361A10E7C3;
	Fri,  1 Sep 2023 13:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C6F10E7C9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693575043; x=1725111043;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=I8ClIdFrd8bCrFDXWH/4gWSrQB3EMQdFm6TZpxfkCQ8=;
 b=CuN7cSsVnmiiyJbXiQVYKT4DiSqnRBUNZP/RszJsKw58PMaGmFwGY8Qk
 GmXKTVM6c8WLwXimswFI7VgL0aO0TY3qOOsIeC70yAy6wK+P0aNMAO7BC
 KpjYBek6vjCxvz2gDjZlwqAK0vkPxchp4RcIZvL5Jfl9FZxQJSBqOjYVY
 t9nkpc0bHHDydgaQ0CC8DXMnu2BDIbSIEsClt+DFic5ZLUrX+bwB1Niw6
 VdbH12rhR5LuFfS+n1fWebkbbjUeuwejRcedywUZWOgL3c3z+5HdcUPdn
 yimPqRfiAsXuYs1CfWiHv1IG8RnQg3tAu4M5BA92+ItxFVfiOs5JOjYEg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442614823"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="442614823"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883188487"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="883188487"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 06:30:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qc4EP-0001KZ-2G;
 Fri, 01 Sep 2023 13:30:37 +0000
Date: Fri, 1 Sep 2023 21:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: [drm-misc:drm-misc-next 1/3] include/drm/drm_drv.h:587:13: error:
 unused function 'drm_debugfs_dev_init'
Message-ID: <202309012131.FeakBzEj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: llvm@lists.linux.dev, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   8e455145d8f163aefa6b9cc29478e0a9f82276e6
commit: 0b30d57acafcaa5374756d314ee54f80d0bcc860 [1/3] drm/debugfs: rework debugfs directory creation v5
config: arm-randconfig-r021-20230901 (https://download.01.org/0day-ci/archive/20230901/202309012131.FeakBzEj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012131.FeakBzEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012131.FeakBzEj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tilcdc/tilcdc_drv.c:18:
>> include/drm/drm_drv.h:587:13: error: unused function 'drm_debugfs_dev_init' [-Werror,-Wunused-function]
     587 | static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
         |             ^
   1 error generated.


vim +/drm_debugfs_dev_init +587 include/drm/drm_drv.h

   583	
   584	#if defined(CONFIG_DEBUG_FS)
   585	void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
   586	#else
 > 587	static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
   588	{
   589	}
   590	#endif
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
