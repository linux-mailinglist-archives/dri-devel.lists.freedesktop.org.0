Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2F349E8A0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 18:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F81910E2EA;
	Thu, 27 Jan 2022 17:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C909C10E13E;
 Thu, 27 Jan 2022 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643303708; x=1674839708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BTXif3Y9BcQ+bT2YufKy99tXJ8gEEYoStW5cRVM5Nxc=;
 b=ImGpTlDkJYmY7YxG0yOnYXVdFehzn96d8lppr5waC5IktZzFgEm/JwM9
 DAZd9w8K6BjsLahLS8+9ZcvsYQTK3nbkCXuNl1kL3qKLkduk5jSHCHEt8
 vGXhuXLTR0JEgilwTe5AmgcC+qUiribUNGK5CmwZiZ4PSk0knyGAXjM8m
 5CRLmAEdW7mFmopGpgrYEvh+bjIVYdF5thVhv/sAQDS0RFz5hjJGRYJZ7
 L0jXq2qx1XjoMgrsMa2DI/vyOvgCpeL1zuuEkWlLNVj0I1f4Bcn2i9PZe
 uubFICsxS7u0XwEp0sx1/taQAQ4biJdh4tyLkrZnMwktgAVy/Ufou9aZs A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="234293495"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="234293495"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 09:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="480379643"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 27 Jan 2022 09:15:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nD8MS-000MqK-P7; Thu, 27 Jan 2022 17:15:04 +0000
Date: Fri, 28 Jan 2022 01:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, hch@lst.de, jgg@nvidia.com,
 jani.nikula@linux.intel.com
Subject: Re: [Intel-gfx] [PATCH 1/3] i915/gvt: Introduce the mmio_table.c to
 support VFIO new mdev API
Message-ID: <202201280125.VuLtasAS-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220128/202201280125.VuLtasAS-lkp@intel.com/config)
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

>> drivers/gpu/drm/i915/gvt/mmio_table.c:37: warning: expecting prototype for intel_gvt_get_init_device_info(). Prototype was for intel_gvt_init_device_info() instead


vim +37 drivers/gpu/drm/i915/gvt/mmio_table.c

    28	
    29	/**
    30	 * intel_gvt_get_init_device_info - Fill a GVT device info
    31	 * @i915: drm i915 private data
    32	 * @info: GVT device info
    33	 *
    34	 * This function will be called during the initialization of a GVT device.
    35	 */
    36	void intel_gvt_init_device_info(struct drm_i915_private *i915, struct intel_gvt_device_info *info)
  > 37	{
    38		struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
    39	
    40		info->max_support_vgpus = 8;
    41		info->cfg_space_size = PCI_CFG_SPACE_EXP_SIZE;
    42		info->mmio_size = 2 * 1024 * 1024;
    43		info->mmio_bar = 0;
    44		info->gtt_start_offset = 8 * 1024 * 1024;
    45		info->gtt_entry_size = 8;
    46		info->gtt_entry_size_shift = 3;
    47		info->gmadr_bytes_in_cmd = 8;
    48		info->max_surface_size = 36 * 1024 * 1024;
    49		info->msi_cap_offset = pdev->msi_cap;
    50	}
    51	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
