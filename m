Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E6CDB304
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 03:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F48F89C0A;
	Wed, 24 Dec 2025 02:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCeOTS1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D9489C0A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766544209; x=1798080209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y2bq7x61XGgLUYHMHwuxvP/5xVVFLyG/rkK1IjvJy0g=;
 b=bCeOTS1JM2VMPagSxaN5KX9AEpndAJ+REPhSPhbvuI8/mGE1f06y6W2I
 gTfXyTLMsx2D2oA3YGoyD/Vwv8re7xidC7ROPHiUdOAsUBMP/KTtWA1/B
 Mvkkysb50RXqbzL4+B31fH4a4oeqER7ZICCKX8BLG/bAHk+UHy2wZ6yKb
 0PiDA1KgFms8/mtl+ArBqVmRJXAYYCWISGXmeNL5CL3UQaSXdcRGfXdu5
 tnK7yM4zRuH1yl2lTikjHWFDCr6R4nbB9GsP9zEi/EK0r5glbd303i3e3
 VY/Ml9eosrZR8BSt63Quq+ZPh9VJAyDxZeOS2yvr4QY5ZmJfOMAk5NR6N A==;
X-CSE-ConnectionGUID: VJdPRXUrQFesGNzhk+eGaQ==
X-CSE-MsgGUID: NNfIg7btTeGQSObDviB9iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="78697389"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208";a="78697389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 18:43:28 -0800
X-CSE-ConnectionGUID: ngE19O8TTK+r/PxHAm/uEA==
X-CSE-MsgGUID: y7wdea61TFuce8q615emTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208";a="223402616"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 18:43:24 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vYEpd-000000002b7-2TJe;
 Wed, 24 Dec 2025 02:42:48 +0000
Date: Wed, 24 Dec 2025 10:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Donald Robson <donald.robson@imgtec.com>,
 Sarah Walker <sarah.walker@imgtec.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
Message-ID: <202512241051.keF0EcdF-lkp@intel.com>
References: <20251222-fix_imagination-v1-1-0ac80a2ff317@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-fix_imagination-v1-1-0ac80a2ff317@samsung.com>
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

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/drm-imagination-Align-rogue_fwif_hwrtdata-to-64-bytes/20251223-065827
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251222-fix_imagination-v1-1-0ac80a2ff317%40samsung.com
patch subject: [PATCH] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
config: arm64-randconfig-r113-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241051.keF0EcdF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241051.keF0EcdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241051.keF0EcdF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *power_sync @@
   drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse:     got unsigned int [usertype] *power_sync

vim +62 drivers/gpu/drm/imagination/pvr_power.c

cc1aeedb98ad34 Sarah Walker 2023-11-22  46  
727538a4bbff07 Sarah Walker 2023-11-22  47  static int
727538a4bbff07 Sarah Walker 2023-11-22  48  pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
727538a4bbff07 Sarah Walker 2023-11-22  49  {
cc1aeedb98ad34 Sarah Walker 2023-11-22  50  	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
cc1aeedb98ad34 Sarah Walker 2023-11-22  51  	u32 slot_nr;
cc1aeedb98ad34 Sarah Walker 2023-11-22  52  	u32 value;
cc1aeedb98ad34 Sarah Walker 2023-11-22  53  	int err;
cc1aeedb98ad34 Sarah Walker 2023-11-22  54  
cc1aeedb98ad34 Sarah Walker 2023-11-22  55  	WRITE_ONCE(*fw_dev->power_sync, 0);
cc1aeedb98ad34 Sarah Walker 2023-11-22  56  
cc1aeedb98ad34 Sarah Walker 2023-11-22  57  	err = pvr_kccb_send_cmd_powered(pvr_dev, pow_cmd, &slot_nr);
cc1aeedb98ad34 Sarah Walker 2023-11-22  58  	if (err)
cc1aeedb98ad34 Sarah Walker 2023-11-22  59  		return err;
cc1aeedb98ad34 Sarah Walker 2023-11-22  60  
cc1aeedb98ad34 Sarah Walker 2023-11-22  61  	/* Wait for FW to acknowledge. */
cc1aeedb98ad34 Sarah Walker 2023-11-22 @62  	return readl_poll_timeout(pvr_dev->fw_dev.power_sync, value, value != 0, 100,
cc1aeedb98ad34 Sarah Walker 2023-11-22  63  				  POWER_SYNC_TIMEOUT_US);
727538a4bbff07 Sarah Walker 2023-11-22  64  }
727538a4bbff07 Sarah Walker 2023-11-22  65  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
