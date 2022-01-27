Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9149EAE2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 20:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6433010E266;
	Thu, 27 Jan 2022 19:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9D410E195;
 Thu, 27 Jan 2022 19:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643310553; x=1674846553;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=om3QU/Nx/QWSkShOFUdOrzDE6Wl2EDZ0YOIUwwJGKNY=;
 b=nJdAnemntuiD82opWaZCh3/KzOOwmccCJY4pfDSmRcBOzvWb5+1z2GbP
 RZe8bnK3R3MHHXTxd9F/vaXNUTRTC/3i3N9VbiLk5bhZMK7nGwSCfk6ZW
 7DE+g1WECm9aOD1iWVEvI5yhup07LAVOo/1fLpT5a8Dn4jafFV1Aiw00a
 G5GNOPtrimkInjJinleftegIleuNQEfHZg+jeI5WBlPmJGb6nd74jNNAn
 djN7//RDRG9v5ZmB8DelLsRkGAYL56Be8meCQfSmenZhHsHRUvf674J+V
 Efi5Sh9F6T9WbLEVkNEp0YwNZLlXZvEYPmD7uEGF4sA50cX6LXNj5MGMB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="247163525"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="247163525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 11:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="767616133"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2022 11:09:10 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDA8r-000MwU-B6; Thu, 27 Jan 2022 19:09:09 +0000
Date: Fri, 28 Jan 2022 03:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, hch@lst.de, jgg@nvidia.com,
 jani.nikula@linux.intel.com
Subject: Re: [Intel-gfx] [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to
 support VFIO new mdev API
Message-ID: <202201280218.aDxaMjx6-lkp@intel.com>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127120508.11330-1-zhi.a.wang@intel.com>
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
Cc: kbuild-all@lists.01.org, Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220127]
[cannot apply to drm-intel/for-linux-next v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhi-Wang/i915-gvt-Introduce-the-mmio_table-c-to-support-VFIO-new-mdev-API/20220127-200727
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20220128/202201280218.aDxaMjx6-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/533f92651a7a56481a053f1e04dc5a5ec024ffb9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zhi-Wang/i915-gvt-Introduce-the-mmio_table-c-to-support-VFIO-new-mdev-API/20220127-200727
        git checkout 533f92651a7a56481a053f1e04dc5a5ec024ffb9
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gvt/handlers.c:45:6: warning: no previous prototype for 'intel_gvt_match_device' [-Wmissing-prototypes]
      45 | bool intel_gvt_match_device(struct intel_gvt *gvt,
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/intel_gvt_match_device +45 drivers/gpu/drm/i915/gvt/handlers.c

12d14cc43b3470 Zhi Wang 2016-08-30  44  
12d14cc43b3470 Zhi Wang 2016-08-30 @45  bool intel_gvt_match_device(struct intel_gvt *gvt,
12d14cc43b3470 Zhi Wang 2016-08-30  46  		unsigned long device)
12d14cc43b3470 Zhi Wang 2016-08-30  47  {
533f92651a7a56 Zhi Wang 2022-01-27  48  	return intel_gvt_get_device_type(gvt->gt->i915) & device;
12d14cc43b3470 Zhi Wang 2016-08-30  49  }
12d14cc43b3470 Zhi Wang 2016-08-30  50  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
