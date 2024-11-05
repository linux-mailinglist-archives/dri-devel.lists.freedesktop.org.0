Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5256F9BC407
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 04:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F3D10E1B5;
	Tue,  5 Nov 2024 03:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dB2yrUAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1C110E1B5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 03:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730778425; x=1762314425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2JD/SF3RDU/EAWXGkUkiGo50LDNAryP1U70AYzXZvO0=;
 b=dB2yrUAIXsjqSI2UC7LFdcSwUp3uLFEAMXu25/e72SBN2Uw1FX0Y4KH9
 Rx2RydBBc5bWXyXSLBMLVfmXPefsGZSRQbCajBN6WNLSbbUxN9MrKzAvb
 j+h6nvGRBR1xWgODin3N5CuWV/tg4VJILtQ0szuzFn38YqvsrgrPQFjFX
 Lg4NsN5aEoeqRyB53Sgosb8uHnGu17SUByDSAxoM5mMBvWNBNR8r9bwBl
 g34AIpW+1HoI9j6bz8cRmh7FOSf/F4QC+Zs5eZqecGDdehx0VNZBLECur
 2rG8369RIfGw6aiKdBPnWUxiYPjWx3qfUKXmf9ESgrFxtKlYa4E7jU2Ud w==;
X-CSE-ConnectionGUID: v/EIs23FSeev22PxqPg88g==
X-CSE-MsgGUID: I2sLlfeEQ7uHxvrQtdVlKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29924995"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="29924995"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 19:47:04 -0800
X-CSE-ConnectionGUID: l5goev/0QASn+AOycwOZzg==
X-CSE-MsgGUID: dmiN3I2oQNi4+gFw6oTIJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="88366034"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2024 19:47:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8AWx-000lZl-1v;
 Tue, 05 Nov 2024 03:46:59 +0000
Date: Tue, 5 Nov 2024 11:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Boris Brezillon <bbrezillon@kernel.org>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 3/3] iommu: Add a kdoc to iommu_unmap()
Message-ID: <202411051125.mlgeWlEm-lkp@intel.com>
References: <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
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

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e929cb546ee42c9a61d24fae60605e9e3192354]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/iommu-io-pgtable-arm-Remove-split-on-unmap-behavior/20241105-014356
base:   8e929cb546ee42c9a61d24fae60605e9e3192354
patch link:    https://lore.kernel.org/r/3-v2-fd55d00a60b2%2Bc69-arm_no_split_jgg%40nvidia.com
patch subject: [PATCH v2 3/3] iommu: Add a kdoc to iommu_unmap()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241105/202411051125.mlgeWlEm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051125.mlgeWlEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051125.mlgeWlEm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:2605: warning: Function parameter or struct member 'size' not described in 'iommu_unmap'
>> drivers/iommu/iommu.c:2605: warning: Excess function parameter 'len' description in 'iommu_unmap'


vim +2605 drivers/iommu/iommu.c

add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23  2588  
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2589  /**
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2590   * iommu_unmap() - Remove mappings from a range of IOVA
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2591   * @domain: Domain to manipulate
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2592   * @iova: IO virtual address to start
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2593   * @len: Length of the range starting from @iova
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2594   *
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2595   * iommu_unmap() will remove a translation created by iommu_map(). It cannot
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2596   * subdivide a mapping created by iommu_map(), so it should be called with IOVA
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2597   * ranges that match what was passed to iommu_map(). The range can aggregate
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2598   * contiguous iommu_map() calls so long as no individual range is split.
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2599   *
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2600   * Returns: Number of bytes of IOVA unmapped. iova + res will be the point
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2601   * unmapping stopped.
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2602   */
add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23  2603  size_t iommu_unmap(struct iommu_domain *domain,
add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23  2604  		   unsigned long iova, size_t size)
add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23 @2605  {
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2606  	struct iommu_iotlb_gather iotlb_gather;
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2607  	size_t ret;
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2608  
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2609  	iommu_iotlb_gather_init(&iotlb_gather);
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2610  	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
aae4c8e27bd756 drivers/iommu/iommu.c Tom Murphy      2020-08-17  2611  	iommu_iotlb_sync(domain, &iotlb_gather);
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2612  
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2613  	return ret;
add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23  2614  }
cefc53c7f49424 drivers/base/iommu.c  Joerg Roedel    2010-01-08  2615  EXPORT_SYMBOL_GPL(iommu_unmap);
1460432cb513f0 drivers/iommu/iommu.c Alex Williamson 2011-10-21  2616  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
