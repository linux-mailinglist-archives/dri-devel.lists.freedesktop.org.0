Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB56991560
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 10:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72AB10E10C;
	Sat,  5 Oct 2024 08:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tii5gFNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3040410E099;
 Sat,  5 Oct 2024 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728118205; x=1759654205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4Zc+oGm1rYm5R0fRDJO5MYaw7udfVcyqE7skd1baFbI=;
 b=Tii5gFNcuGXTd14oPHJdRKqOM5DGvld3puqxLUcSpuVJ6OYFRqw/b2V1
 E7FRQgBUPuZjjpaarSofE1p5IMBGtSH7PvBTMeiMbnrCyMw7/zD0uW1ay
 84uTbSV4D+NnXWx3W4KK1M7IxuqYRwPGh01pquQmhgJ/BRbp+yopPxAxB
 S6CB8ZjFR0iqiKeLpjyAmvfUtZIRIwq24kUOi9m+66DFBbDcPXlM5EITL
 Vkr1rHca9SGS2rHPIYDpLHj8wSJ/oYySPRDo8xL+3BdORjXthXGMAMvHX
 e7FKwQTAtewHcnEA19yD21AAWv3by6r7lHAoeKbp6sC281wCxGSOWtjoT Q==;
X-CSE-ConnectionGUID: v1nA2pu6S5iwfVm7BwjRmw==
X-CSE-MsgGUID: BooiV52OS56pkiU4TNE7dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37990484"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="37990484"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2024 01:50:04 -0700
X-CSE-ConnectionGUID: qVCshNAJR/uJWpE0kHSlQA==
X-CSE-MsgGUID: 90hXrQfaScezsXBVxhPi6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="98252179"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 05 Oct 2024 01:50:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sx0UD-0002ma-0l;
 Sat, 05 Oct 2024 08:50:01 +0000
Date: Sat, 5 Oct 2024 16:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH v6 03/44] drm/vkms: Add kunit tests for VKMS LUT handling
Message-ID: <202410051655.9wEF2CHW-lkp@intel.com>
References: <20241003200129.1732122-4-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-4-harry.wentland@amd.com>
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

Hi Harry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20241004-040629
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241003200129.1732122-4-harry.wentland%40amd.com
patch subject: [PATCH v6 03/44] drm/vkms: Add kunit tests for VKMS LUT handling
config: csky-randconfig-r112-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051655.9wEF2CHW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051655.9wEF2CHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051655.9wEF2CHW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vkms/tests/vkms_color_test.c:33:29: sparse: sparse: symbol 'test_linear_lut' was not declared. Should it be static?

vim +/test_linear_lut +33 drivers/gpu/drm/vkms/tests/vkms_color_test.c

    32	
  > 33	const struct vkms_color_lut test_linear_lut = {
    34		.base = test_linear_array,
    35		.lut_length = TEST_LUT_SIZE,
    36		.channel_value2index_ratio = 0xf000fll
    37	};
    38	
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
