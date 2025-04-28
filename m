Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E513FA9FEE9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 03:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A601810E0B0;
	Tue, 29 Apr 2025 01:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOVYHho4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B5D10E0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 01:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745889583; x=1777425583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pu2wLgfGRRq8hrC3IwkTdD3V5uw2TWb1PcFwwrUwlGw=;
 b=DOVYHho4ijkJ68a/9t+o+nP24K4CVxM3+scGRHs64LIvUk3EzUYYSfOT
 bXhWdGxyN7Y3H8UtOuR/YgqhvbigxjewFVC0dr7J5HseHybnA6aaHD5JN
 7ijXYd4wCPbEzX+41ieJNZkwHGy8GNW742NorBPGjt7xkt82ohrzlpml3
 gz0zFNy7btDlAYP2IcpUqH9Z54IDHF7dUKv7IwylZQQm0YrK/1ErfZpO5
 YQJ5YLTaqJ8y5HZxENk/E0Ibg51wQZUV8p10zypc062dk+XoHyqg4mVIC
 DM0YuLW3mkr6WVosbYAn/S9U6dRkgEpapa27Us1NltZUtIbtDxeQ0O0vK Q==;
X-CSE-ConnectionGUID: CZW8SDTvRkGBGqlxXgZgSA==
X-CSE-MsgGUID: RDNmRBb1T06g/RoVWQkPpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165272"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="51165272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: lkC3NN5QQKu5gK1cmNNkwA==
X-CSE-MsgGUID: Xt1DrXtvTW+qYMXWaPwTCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="164775792"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u9Zd7-00001Y-1n;
 Tue, 29 Apr 2025 01:19:25 +0000
Date: Tue, 29 Apr 2025 01:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH] drm: writeback: Fix drm_writeback_connector_cleanup
 signature
Message-ID: <202504290021.ZR6XX2Sc-lkp@intel.com>
References: <20250428-drm-fix-writeback-cleanup-v1-1-e4c723868b73@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-drm-fix-writeback-cleanup-v1-1-e4c723868b73@bootlin.com>
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

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b848cd418aebdb313364b4843f41fae82281a823]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-writeback-Fix-drm_writeback_connector_cleanup-signature/20250428-163254
base:   b848cd418aebdb313364b4843f41fae82281a823
patch link:    https://lore.kernel.org/r/20250428-drm-fix-writeback-cleanup-v1-1-e4c723868b73%40bootlin.com
patch subject: [PATCH] drm: writeback: Fix drm_writeback_connector_cleanup signature
config: arm-randconfig-002-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290021.ZR6XX2Sc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290021.ZR6XX2Sc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290021.ZR6XX2Sc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_writeback.c:354: warning: Function parameter or struct member 'data' not described in 'drm_writeback_connector_cleanup'
>> drivers/gpu/drm/drm_writeback.c:354: warning: Excess function parameter 'wb_connector' description in 'drm_writeback_connector_cleanup'


vim +354 drivers/gpu/drm/drm_writeback.c

935774cd71fe60 Brian Starkey 2017-03-29  342  
1914ba2b91ea8e Louis Chauvet 2025-01-16  343  /**
1914ba2b91ea8e Louis Chauvet 2025-01-16  344   * drm_writeback_connector_cleanup - Cleanup the writeback connector
1914ba2b91ea8e Louis Chauvet 2025-01-16  345   * @dev: DRM device
1914ba2b91ea8e Louis Chauvet 2025-01-16  346   * @wb_connector: Pointer to the writeback connector to clean up
1914ba2b91ea8e Louis Chauvet 2025-01-16  347   *
1914ba2b91ea8e Louis Chauvet 2025-01-16  348   * This will decrement the reference counter of blobs and destroy properties. It
1914ba2b91ea8e Louis Chauvet 2025-01-16  349   * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
1914ba2b91ea8e Louis Chauvet 2025-01-16  350   * clean up the attached encoder and the drm_connector.
1914ba2b91ea8e Louis Chauvet 2025-01-16  351   */
1914ba2b91ea8e Louis Chauvet 2025-01-16  352  static void drm_writeback_connector_cleanup(struct drm_device *dev,
928d313d023526 Louis Chauvet 2025-04-28  353  					    void *data)
1914ba2b91ea8e Louis Chauvet 2025-01-16 @354  {
1914ba2b91ea8e Louis Chauvet 2025-01-16  355  	unsigned long flags;
1914ba2b91ea8e Louis Chauvet 2025-01-16  356  	struct drm_writeback_job *pos, *n;
928d313d023526 Louis Chauvet 2025-04-28  357  	struct drm_writeback_connector *wb_connector = data;
1914ba2b91ea8e Louis Chauvet 2025-01-16  358  
1914ba2b91ea8e Louis Chauvet 2025-01-16  359  	delete_writeback_properties(dev);
1914ba2b91ea8e Louis Chauvet 2025-01-16  360  	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
1914ba2b91ea8e Louis Chauvet 2025-01-16  361  
1914ba2b91ea8e Louis Chauvet 2025-01-16  362  	spin_lock_irqsave(&wb_connector->job_lock, flags);
1914ba2b91ea8e Louis Chauvet 2025-01-16  363  	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
1914ba2b91ea8e Louis Chauvet 2025-01-16  364  		list_del(&pos->list_entry);
ff3881cc6a588f Dan Carpenter 2025-02-12  365  		drm_writeback_cleanup_job(pos);
1914ba2b91ea8e Louis Chauvet 2025-01-16  366  	}
1914ba2b91ea8e Louis Chauvet 2025-01-16  367  	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
1914ba2b91ea8e Louis Chauvet 2025-01-16  368  }
1914ba2b91ea8e Louis Chauvet 2025-01-16  369  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
