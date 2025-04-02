Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC140A78606
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 03:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B4C10E01F;
	Wed,  2 Apr 2025 01:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtzPBZAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A5710E01F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 01:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743556252; x=1775092252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yobEfPdvLGT2LuLPEMUSZ7qNptH3/YvNa+vijI6VvWg=;
 b=JtzPBZAmih21f5aQY0obbU1v+jhst3Xuu5XVobs4R3LfAtLhmUeJAdtq
 p9/PgiGfGL9HnFfDCkebfic3XAwFHqZEHP3zIL7NZ6gFyyW96XJZrTZ4R
 OkAgbWKQEhoNR8y4p4jz+65OdLKf4QQan/u3wBK5/uKDdnbWdbZHjNeLC
 7wTqHj6EpseQdttuEiy12SDrUBnHZ7k4DhtG/vFTvfTls16F5tlxqP7mf
 jLDcBgdMxXRIbgo5gLql3F2V6cG3LvtBRXxmeKrdyO7obWie6fRwk6f2N
 xIlCTxfvAMAeApwbXIM2rlwaS+rklcNMxbzLYfj0j2QBmrmhjdwTDGrF7 g==;
X-CSE-ConnectionGUID: Gq3rTVweQvKTtRc+eC5zlA==
X-CSE-MsgGUID: Si05MRdtSz+Vj+FqjCNLSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56271536"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="56271536"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 18:10:51 -0700
X-CSE-ConnectionGUID: MBtw/jbzRxWBvg5RTDgsHg==
X-CSE-MsgGUID: xpPVMDo7TAKv4nHyVE1fgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="130657242"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 01 Apr 2025 18:10:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tzmcw-000AJe-20;
 Wed, 02 Apr 2025 01:10:46 +0000
Date: Wed, 2 Apr 2025 09:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH] drm/imagination: loop counters moved to loop scope
Message-ID: <202504020813.vjg3Thjg-lkp@intel.com>
References: <20250401-for-loop-counter-scope-v1-1-5ba75770be52@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-for-loop-counter-scope-v1-1-5ba75770be52@imgtec.com>
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

Hi Alexandru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2f9d51740cc30e0d2c8a23a55b1e20cf2513c250]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Dadu/drm-imagination-loop-counters-moved-to-loop-scope/20250401-204252
base:   2f9d51740cc30e0d2c8a23a55b1e20cf2513c250
patch link:    https://lore.kernel.org/r/20250401-for-loop-counter-scope-v1-1-5ba75770be52%40imgtec.com
patch subject: [PATCH] drm/imagination: loop counters moved to loop scope
config: arm64-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020813.vjg3Thjg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020813.vjg3Thjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020813.vjg3Thjg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imagination/pvr_fw.c: In function 'pvr_fw_validate':
>> drivers/gpu/drm/imagination/pvr_fw.c:98:6: warning: unused variable 'entry' [-Wunused-variable]
     u32 entry;
         ^~~~~


vim +/entry +98 drivers/gpu/drm/imagination/pvr_fw.c

cc1aeedb98ad34 Sarah Walker   2023-11-22   79  
f99f5f3ea7efd5 Sarah Walker   2023-11-22   80  /**
f99f5f3ea7efd5 Sarah Walker   2023-11-22   81   * pvr_fw_validate() - Parse firmware header and check compatibility
f99f5f3ea7efd5 Sarah Walker   2023-11-22   82   * @pvr_dev: Device pointer.
f99f5f3ea7efd5 Sarah Walker   2023-11-22   83   *
f99f5f3ea7efd5 Sarah Walker   2023-11-22   84   * Returns:
f99f5f3ea7efd5 Sarah Walker   2023-11-22   85   *  * 0 on success, or
f99f5f3ea7efd5 Sarah Walker   2023-11-22   86   *  * -EINVAL if firmware is incompatible.
f99f5f3ea7efd5 Sarah Walker   2023-11-22   87   */
f99f5f3ea7efd5 Sarah Walker   2023-11-22   88  static int
f99f5f3ea7efd5 Sarah Walker   2023-11-22   89  pvr_fw_validate(struct pvr_device *pvr_dev)
f99f5f3ea7efd5 Sarah Walker   2023-11-22   90  {
f99f5f3ea7efd5 Sarah Walker   2023-11-22   91  	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
f99f5f3ea7efd5 Sarah Walker   2023-11-22   92  	const struct firmware *firmware = pvr_dev->fw_dev.firmware;
f99f5f3ea7efd5 Sarah Walker   2023-11-22   93  	const struct pvr_fw_layout_entry *layout_entries;
f99f5f3ea7efd5 Sarah Walker   2023-11-22   94  	const struct pvr_fw_info_header *header;
f99f5f3ea7efd5 Sarah Walker   2023-11-22   95  	const u8 *fw = firmware->data;
f99f5f3ea7efd5 Sarah Walker   2023-11-22   96  	u32 fw_offset = firmware->size - SZ_4K;
f99f5f3ea7efd5 Sarah Walker   2023-11-22   97  	u32 layout_table_size;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  @98  	u32 entry;
f99f5f3ea7efd5 Sarah Walker   2023-11-22   99  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  100  	if (firmware->size < SZ_4K || (firmware->size % FW_BLOCK_SIZE))
f99f5f3ea7efd5 Sarah Walker   2023-11-22  101  		return -EINVAL;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  102  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  103  	header = (const struct pvr_fw_info_header *)&fw[fw_offset];
f99f5f3ea7efd5 Sarah Walker   2023-11-22  104  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  105  	if (header->info_version != PVR_FW_INFO_VERSION) {
f99f5f3ea7efd5 Sarah Walker   2023-11-22  106  		drm_err(drm_dev, "Unsupported fw info version %u\n",
f99f5f3ea7efd5 Sarah Walker   2023-11-22  107  			header->info_version);
f99f5f3ea7efd5 Sarah Walker   2023-11-22  108  		return -EINVAL;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  109  	}
f99f5f3ea7efd5 Sarah Walker   2023-11-22  110  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  111  	if (header->header_len != sizeof(struct pvr_fw_info_header) ||
f99f5f3ea7efd5 Sarah Walker   2023-11-22  112  	    header->layout_entry_size != sizeof(struct pvr_fw_layout_entry) ||
f99f5f3ea7efd5 Sarah Walker   2023-11-22  113  	    header->layout_entry_num > PVR_FW_INFO_MAX_NUM_ENTRIES) {
f99f5f3ea7efd5 Sarah Walker   2023-11-22  114  		drm_err(drm_dev, "FW info format mismatch\n");
f99f5f3ea7efd5 Sarah Walker   2023-11-22  115  		return -EINVAL;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  116  	}
f99f5f3ea7efd5 Sarah Walker   2023-11-22  117  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  118  	if (!(header->flags & PVR_FW_FLAGS_OPEN_SOURCE) ||
f99f5f3ea7efd5 Sarah Walker   2023-11-22  119  	    header->fw_version_major > FW_MAX_SUPPORTED_MAJOR_VERSION ||
f99f5f3ea7efd5 Sarah Walker   2023-11-22  120  	    header->fw_version_major == 0) {
f99f5f3ea7efd5 Sarah Walker   2023-11-22  121  		drm_err(drm_dev, "Unsupported FW version %u.%u (build: %u%s)\n",
f99f5f3ea7efd5 Sarah Walker   2023-11-22  122  			header->fw_version_major, header->fw_version_minor,
f99f5f3ea7efd5 Sarah Walker   2023-11-22  123  			header->fw_version_build,
f99f5f3ea7efd5 Sarah Walker   2023-11-22  124  			(header->flags & PVR_FW_FLAGS_OPEN_SOURCE) ? " OS" : "");
f99f5f3ea7efd5 Sarah Walker   2023-11-22  125  		return -EINVAL;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  126  	}
f99f5f3ea7efd5 Sarah Walker   2023-11-22  127  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  128  	if (pvr_gpu_id_to_packed_bvnc(&pvr_dev->gpu_id) != header->bvnc) {
f99f5f3ea7efd5 Sarah Walker   2023-11-22  129  		struct pvr_gpu_id fw_gpu_id;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  130  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  131  		packed_bvnc_to_pvr_gpu_id(header->bvnc, &fw_gpu_id);
f99f5f3ea7efd5 Sarah Walker   2023-11-22  132  		drm_err(drm_dev, "FW built for incorrect GPU ID %i.%i.%i.%i (expected %i.%i.%i.%i)\n",
f99f5f3ea7efd5 Sarah Walker   2023-11-22  133  			fw_gpu_id.b, fw_gpu_id.v, fw_gpu_id.n, fw_gpu_id.c,
f99f5f3ea7efd5 Sarah Walker   2023-11-22  134  			pvr_dev->gpu_id.b, pvr_dev->gpu_id.v, pvr_dev->gpu_id.n, pvr_dev->gpu_id.c);
f99f5f3ea7efd5 Sarah Walker   2023-11-22  135  		return -EINVAL;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  136  	}
f99f5f3ea7efd5 Sarah Walker   2023-11-22  137  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  138  	fw_offset += header->header_len;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  139  	layout_table_size =
f99f5f3ea7efd5 Sarah Walker   2023-11-22  140  		header->layout_entry_size * header->layout_entry_num;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  141  	if ((fw_offset + layout_table_size) > firmware->size)
f99f5f3ea7efd5 Sarah Walker   2023-11-22  142  		return -EINVAL;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  143  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  144  	layout_entries = (const struct pvr_fw_layout_entry *)&fw[fw_offset];
318bb30bc58c60 Alexandru Dadu 2025-04-01  145  	for (u32 entry = 0; entry < header->layout_entry_num; entry++) {
f99f5f3ea7efd5 Sarah Walker   2023-11-22  146  		u32 start_addr = layout_entries[entry].base_addr;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  147  		u32 end_addr = start_addr + layout_entries[entry].alloc_size;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  148  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  149  		if (start_addr >= end_addr)
f99f5f3ea7efd5 Sarah Walker   2023-11-22  150  			return -EINVAL;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  151  	}
f99f5f3ea7efd5 Sarah Walker   2023-11-22  152  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  153  	fw_offset = (firmware->size - SZ_4K) - header->device_info_size;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  154  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  155  	drm_info(drm_dev, "FW version v%u.%u (build %u OS)\n", header->fw_version_major,
f99f5f3ea7efd5 Sarah Walker   2023-11-22  156  		 header->fw_version_minor, header->fw_version_build);
f99f5f3ea7efd5 Sarah Walker   2023-11-22  157  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  158  	pvr_dev->fw_version.major = header->fw_version_major;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  159  	pvr_dev->fw_version.minor = header->fw_version_minor;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  160  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  161  	pvr_dev->fw_dev.header = header;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  162  	pvr_dev->fw_dev.layout_entries = layout_entries;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  163  
f99f5f3ea7efd5 Sarah Walker   2023-11-22  164  	return 0;
f99f5f3ea7efd5 Sarah Walker   2023-11-22  165  }
f99f5f3ea7efd5 Sarah Walker   2023-11-22  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
