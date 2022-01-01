Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E348285A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jan 2022 20:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E193689361;
	Sat,  1 Jan 2022 19:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6B889361
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 19:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641066723; x=1672602723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ayIudOX3mr4n4CHkW2cwbJ7L3crDWN5Jnt5eSDs14iM=;
 b=iZRLVM+930X1IbWMNYHrwwWVOZBqMitoQmimhnzrO6MF9UpsG0ecxp1P
 qTG2exQVTc8IcJw+L1TuE6fjbm4ctgSDyJYS4v4zg69u8u1zmMIWzXi2n
 cTGdab5pyUWStnNwWxzutpLcrnLMLoX18XH13Ai+WuHy4cyWhGsF5ot5B
 zVJYgEXG0hUwbJVuprq/Kfdv3bj09XVE6x6CvYvDXyl8SWfirn4pXU1Bx
 94Q/mWPXygRx/DAOoSnim0Av4TLVAUSI2EO3NBmm1OLwgGtYs0ndi4EiL
 1kESNgOi91zvQi+K3RX/qzGmyy7GWkJYgaU7/zRTprPUuWPqWwrAT+zKp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10214"; a="242124030"
X-IronPort-AV: E=Sophos;i="5.88,254,1635231600"; d="scan'208";a="242124030"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2022 11:52:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,254,1635231600"; d="scan'208";a="619900598"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 01 Jan 2022 11:51:58 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n3kQ2-000CmO-5m; Sat, 01 Jan 2022 19:51:58 +0000
Date: Sun, 2 Jan 2022 03:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ast: Create the driver for ASPEED proprietory
 Display-Port
Message-ID: <202201020329.lEcno4eh-lkp@intel.com>
References: <20211122103617.3496-1-kuohsiang_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122103617.3496-1-kuohsiang_chou@aspeedtech.com>
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
Cc: kbuild-all@lists.01.org, airlied@linux.ie, tommy_huang@aspeedtech.com,
 jenmin_yuan@aspeedtech.com, airlied@redhat.com, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi KuoHsiang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on tegra-drm/drm/tegra/for-next v5.16-rc7]
[cannot apply to drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next airlied/drm-next next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/KuoHsiang-Chou/drm-ast-Create-the-driver-for-ASPEED-proprietory-Display-Port/20211122-183830
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-c021-20211123 (https://download.01.org/0day-ci/archive/20220102/202201020329.lEcno4eh-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ast/ast_dp.c:166:3-4: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
