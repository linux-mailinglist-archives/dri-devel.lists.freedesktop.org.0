Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB3A8879A7
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 18:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843A10E974;
	Sat, 23 Mar 2024 17:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSnKoVR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5E610E8B2;
 Sat, 23 Mar 2024 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711214110; x=1742750110;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=UeNyzUP0dCLHnFbihRMpGXxV2WmK3tBFKmfNOljwhms=;
 b=FSnKoVR4UpthGwnoZDbNeGQDfeywYbbwBshGmin2A6+7C5Ps9IrNrsBe
 m2Bz6+oI99fuxK3X5MFD3OyjXlIj6XOzY231fqaR+80nsrgoAweY/ZN4T
 QxqyKOW4jWZrilo+1BUE2Ps5UuJkJY8uFXWad5QtvqiB605mFvL0nIjlI
 02gV8i2Bc/LjIKLvBROMfH7+7G7a0hsRMyv5YhAAcua5sUWNHVvpTANrJ
 qG7S+zcVO44/grbUr237InnfATVQxaZTzNHCnhywkjJPfMhcwlNjI0KKc
 IBs6ifejENbrZZJRAiRyHB8+nyjh1DYCdTgJhDlK6TBcrJNR/J4RV36rk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="10042901"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; d="scan'208";a="10042901"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2024 10:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; d="scan'208";a="15209332"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 23 Mar 2024 10:15:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ro4xV-000LLf-0P;
 Sat, 23 Mar 2024 17:15:05 +0000
Date: Sun, 24 Mar 2024 01:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-tip:drm-tip 4/11]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73: error: '.bin' directive
 output may be truncated writing 4 bytes into a region of size between 2 and
 31
Message-ID: <202403240115.1lAo588s-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   657dd8fcd2f1d1205c6f98fdb8b60915228991d1
commit: 0885186926a13c697d78f5af03f32445414b6ad5 [4/11] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240324/202403240115.1lAo588s-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240115.1lAo588s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240115.1lAo588s-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function 'amdgpu_vcn_early_init':
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:66: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
     102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:17: note: 'snprintf' output between 12 and 41 bytes into a destination of size 40
     102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73: error: '.bin' directive output may be truncated writing 4 bytes into a region of size between 2 and 31 [-Werror=format-truncation=]
     105 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
         |                                                                         ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:25: note: 'snprintf' output between 14 and 43 bytes into a destination of size 40
     105 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +105 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c

95d0906f850655 Leo Liu            2016-12-21   93  
69939009bde70c Mario Limonciello  2022-12-28   94  int amdgpu_vcn_early_init(struct amdgpu_device *adev)
69939009bde70c Mario Limonciello  2022-12-28   95  {
69939009bde70c Mario Limonciello  2022-12-28   96  	char ucode_prefix[30];
69939009bde70c Mario Limonciello  2022-12-28   97  	char fw_name[40];
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06   98  	int r, i;
69939009bde70c Mario Limonciello  2022-12-28   99  
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  100  	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
69939009bde70c Mario Limonciello  2022-12-28  101  		amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
69939009bde70c Mario Limonciello  2022-12-28 @102  		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  103  		if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==  IP_VERSION(4, 0, 6) &&
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  104  			i == 1) {
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06 @105  			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  106  		}
69939009bde70c Mario Limonciello  2022-12-28  107  
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  108  		r = amdgpu_ucode_request(adev, &adev->vcn.fw[i], fw_name);
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  109  		if (r) {
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  110  			amdgpu_ucode_release(&adev->vcn.fw[i]);
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  111  			return r;
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  112  		}
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  113  	}
69939009bde70c Mario Limonciello  2022-12-28  114  	return r;
69939009bde70c Mario Limonciello  2022-12-28  115  }
69939009bde70c Mario Limonciello  2022-12-28  116  

:::::: The code at line 105 was first introduced by commit
:::::: 6a7cbbc267c0cafa2b027983a40276deb673c066 drm/amdgpu/vcn: enable vcn1 fw load for VCN 4_0_6

:::::: TO: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
