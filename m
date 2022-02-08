Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 867BB4ADB5A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 15:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A3A10E607;
	Tue,  8 Feb 2022 14:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CC310E607;
 Tue,  8 Feb 2022 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644331122; x=1675867122;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gA6guodQWyiVPgot2dWXNqcVIT6qKmygJjcTgUAPzwc=;
 b=nqpS1Xl1+jUUFk9zVxrptkvIbhNP9PSFcGGYATW+cA5IYMKGoc9oWyNH
 y70bfOBJrfee7JAE6uLy2d3oqxQXsLcPIo7EIq4hyTW5NBa0hqS77oLJt
 l+x//mqYBaxUQi8hJ9K6Q7NCzZwp/ulvKoXHQwWzprwr3nRHxbl9TFevO
 rdpX6h/zQMSRS8GHeqqagk4gz4Tyf6NEexqOA01LOOAXyTan+jfW+OpSP
 s6kticXtwQ0KPTj6KUstP/9s4W2tq0Fv6i9YlEJM3SH5ttqUR9IQvceJa
 al0fN7cGChW3ScP8Zv5A16DUD2K8kSua9BYn05WqqD9Q3vjWge8kpMGuA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248906618"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="248906618"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 06:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700862339"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 08 Feb 2022 06:38:39 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHRde-0000JQ-VX; Tue, 08 Feb 2022 14:38:38 +0000
Date: Tue, 8 Feb 2022 22:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, hch@lst.de, jgg@nvidia.com,
 jani.nikula@linux.intel.com
Subject: Re: [Intel-gfx] [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to
 support VFIO new mdev API
Message-ID: <202202082210.BpzSju31-lkp@intel.com>
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
[also build test WARNING on next-20220208]
[cannot apply to drm-intel/for-linux-next v5.17-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhi-Wang/i915-gvt-Introduce-the-mmio_table-c-to-support-VFIO-new-mdev-API/20220127-200727
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20220208/202202082210.BpzSju31-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/533f92651a7a56481a053f1e04dc5a5ec024ffb9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zhi-Wang/i915-gvt-Introduce-the-mmio_table-c-to-support-VFIO-new-mdev-API/20220127-200727
        git checkout 533f92651a7a56481a053f1e04dc5a5ec024ffb9
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gvt/handlers.c:45:6: sparse: sparse: symbol 'intel_gvt_match_device' was not declared. Should it be static?

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
